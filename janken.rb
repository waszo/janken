require "csv"

class Janken
    def initialize
        puts "最初はグー、じゃんけん・・・" #出力
        puts "グーなら0、チョキなら1、パーなら2、を入力してください。"#定義
        @input = gets.chomp.to_i
        while @input > 2
            puts "入力が間違っています。"
            puts "グーなら0、チョキなら1、パーなら2、を入力してください。"
            @input = gets.chomp.to_i
        end
        judgement
    end
 
    def judgement
        hand_type = ["グー","チョキ","パー"]
        my_hand = @input
        pc_hand = rand(0..2)
 
        puts "あなたは#{hand_type[my_hand]}です。"
        puts "コンピューターは#{hand_type[pc_hand]}です。"
 
        if my_hand == pc_hand
            puts "あいこで"
        elsif (my_hand == 0 && pc_hand == 1) || (my_hand == 1 && pc_hand == 2) || (my_hand == 2 && pc_hand == 0)
            puts "あっち向いて向いて"
            $case_pattern = "win"
            attimuite_hoi
        elsif (my_hand == 0 && pc_hand == 2) || (my_hand == 1 && pc_hand == 0) || (my_hand == 2 && pc_hand == 1)
            puts "あっち向いて"
            $case_pattern = "lose"
            attimuite_hoi
        end
    end

    def attimuite_hoi
        puts "0(上)1(下)2(左)3(右)"
         player = gets.to_i
         program =rand(3)
         directions = ["上","下","左","右"]
       
        puts "ほいっ"
        puts "あなたは#{directions[player]}を出しました"
        puts "相手は#{directions[program]}を出しました"
       
        if $case_pattern == "win"
            case 
            when player == program
                puts"あなたの勝ちです"
                exit
            else
                puts"引き分けです"
                return true
            end
        end
        
        if $case_pattern == "lose"
            case 
            when player == program
                puts"あなたの負けです"
                return false
            else
                puts"引き分けです"
                return true
            end
        end
    end
end

## main block
if __FILE__ == $0
    puts "あっち向いてホイゲームを始めます"
    $case_pattern = nil

    while Janken.new; end
end