package app.morphe.extension.chmate;
import java.util.*;

public final class NgLiteralMatcherTest {
    static long checks;static volatile boolean sink;
    static boolean reference(List<String> words,String text){for(String word:words)if(text.contains(word))return true;return false;}
    static void check(List<String> words,List<String> texts){
        NgLiteralMatcher matcher=new NgLiteralMatcher(words);
        for(String text:texts){if(reference(words,text)!=matcher.matches(text))throw new AssertionError("Mismatch "+words+" / "+text);checks++;}
    }
    public static void main(String[] args){
        check(List.of(),List.of("","abc"));
        List<String> overlap=List.of("he","she","his","hers","aba","bab","bc","bca","caa","日本","\ud83d\ude00");
        check(overlap,List.of("","ushers","ababa","bcb","日本語","a\ud83d\ude00b","no match"));
        check(List.of("","abc","b","c","d","e","f","g"),List.of("","xyz"));
        Random random=new Random(20261104);
        for(int set=0;set<300;set++){
            List<String> words=new ArrayList<>();
            for(int w=0;w<8+random.nextInt(80);w++)words.add(text(random,1+random.nextInt(15)));
            List<String> texts=new ArrayList<>();
            for(int t=0;t<100;t++){
                String value=text(random,random.nextInt(200));
                if(t%3==0)value+=words.get(random.nextInt(words.size()));texts.add(value);
            }
            check(words,texts);
        }
        for(int c=0;c<65536;c++)check(List.of("a","b","c","d","e","f","g",String.valueOf((char)c)),List.of("日"+(char)c+"本"));
        List<String> large=new ArrayList<>();for(int i=0;i<110;i++)large.add("x".repeat(2000)+i);
        check(large,List.of("nothing",large.get(109),""));
        List<String> words=new ArrayList<>();for(int i=0;i<2000;i++)words.add("blocked-literal-"+i+"-end");
        String body="普通の本文が続きます。".repeat(500);
        check(words,List.of(body,body+words.get(1999)));
        NgLiteralMatcher matcher=new NgLiteralMatcher(words);
        for(int i=0;i<100;i++){sink=reference(words,body);sink=matcher.matches(body);}
        long start=System.nanoTime();for(int i=0;i<1000;i++)sink=reference(words,body);long old=System.nanoTime()-start;
        start=System.nanoTime();for(int i=0;i<1000;i++)sink=matcher.matches(body);long next=System.nanoTime()-start;
        System.out.println("PASS "+checks+" literal equivalence cases; host-only no-match 2000 rules/5500 UTF16/1000 calls: linear="+old/1e6+" ms indexed="+next/1e6+" ms (not Android navigation timing)");
    }
    static String text(Random random,int length){char[] out=new char[length];for(int i=0;i<length;i++)out[i]=(char)random.nextInt(65536);return new String(out);}
}
