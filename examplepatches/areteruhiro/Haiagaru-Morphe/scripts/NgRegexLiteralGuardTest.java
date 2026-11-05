package app.morphe.extension.chmate;

import java.util.*;
import java.util.regex.Pattern;

public final class NgRegexLiteralGuardTest {
    static int checks;
    static void check(boolean condition){checks++;if(!condition)throw new AssertionError("case "+checks);}
    public static void main(String[] args){
        for(String expression:List.of("(?i)hello","a|longer","[abc]hello","(hello)?world","hello{0,2}",
                "hello?","hello\\dworld","hello\\p{L}","hello.*?world","(?=hello)?world","hello\\1","hello\\u0041",
                "(?s:(?=.*hello)|world)","(?s:(?=.*hello)?)","(?=(hello|world))","(?i:hello)","(?s:(?i)hello)"))
            check(NgRegexLiteralGuard.required(expression).isEmpty());
        check(NgRegexLiteralGuard.required("^開始.*終わり$").equals("終わり"));
        check(NgRegexLiteralGuard.required(".*\\Q[文字]+(列)\\E.*").equals("[文字]+(列)"));
        check(NgRegexLiteralGuard.required("a").isEmpty());
        check(NgRegexLiteralGuard.required("^開始.終了$").equals("開始"));
        check(NgRegexLiteralGuard.required("(?s:(?=.*hello)(?=.*world).*)").equals("hello"));
        check(NgRegexLiteralGuard.required("(?s:(?=.*\\Qhello)world\\E).*)").equals("hello)world"));
        Random random=new Random(1104);
        List<String> literals=List.of("hello","日本語","a.b","[文字]","a|b","$money","a\\b","😀xyz","line\ntext","\\u0041");
        List<String> texts=new ArrayList<>(List.of("","通常の本文","hello WORLD","日本語\nhello","a.b[文字]a|b$money","😀xyz"));
        for(int i=0;i<200;i++){
            StringBuilder text=new StringBuilder();
            for(int j=0;j<5;j++)text.append(literals.get(random.nextInt(literals.size()))).append(random.nextBoolean()?"\n":"x");
            texts.add(text.toString());
        }
        for(int i=0;i<300;i++){
            String a=literals.get(random.nextInt(literals.size())),b=literals.get(random.nextInt(literals.size()));
            String expression=(random.nextBoolean()?"^":"")+Pattern.quote(a)+(random.nextBoolean()?".*":".+")+Pattern.quote(b)+(random.nextBoolean()?"$":"");
            Pattern pattern=Pattern.compile(expression);
            String guard=NgRegexLiteralGuard.required(expression);
            check(!guard.isEmpty());
            for(String text:texts){
                boolean expected=pattern.matcher(text).find();
                check(!expected||text.contains(guard));
                check(expected==((guard.isEmpty()||text.contains(guard))&&pattern.matcher(text).find()));
            }
            expression="(?s:^(?=.*"+Pattern.quote(a)+"."+Pattern.quote(b)+")(?=.*"+Pattern.quote(b)+"))";
            pattern=Pattern.compile(expression);guard=NgRegexLiteralGuard.required(expression);
            check(!guard.isEmpty());
            for(String text:texts){
                boolean expected=pattern.matcher(text).find();
                check(!expected||text.contains(guard));
                check(expected==((guard.isEmpty()||text.contains(guard))&&pattern.matcher(text).find()));
            }
            expression="(?s:^(?=.*"+Pattern.quote(a)+")(?=.*"+Pattern.quote(b)+").*$)";
            pattern=Pattern.compile(expression);guard=NgRegexLiteralGuard.required(expression);
            check(!guard.isEmpty());
            for(String text:texts){
                boolean expected=pattern.matcher(text).find();
                check(!expected||text.contains(guard));
                check(expected==((guard.isEmpty()||text.contains(guard))&&pattern.matcher(text).find()));
            }
        }
        System.out.println("PASS "+checks+" necessary-literal and differential regex checks");
    }
}
