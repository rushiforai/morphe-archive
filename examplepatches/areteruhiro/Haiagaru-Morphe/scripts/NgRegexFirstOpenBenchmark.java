package app.morphe.extension.chmate;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Synthetic first-evaluation comparison; --aggregate accepts private base64 patterns without echoing them. */
public final class NgRegexFirstOpenBenchmark {
    static SharedNgRules.Rule rule(String expression){return new SharedNgRules.Rule("a".repeat(64),"*","keyword",expression,"",1,false,1,0,true);}
    static long run(List<SharedNgRules.Rule> rules,List<String> bodies){
        long begin=System.nanoTime();int matches=0;
        for(String body:bodies)for(SharedNgRules.Rule rule:rules)if(rule.expressionMatches(body))matches++;
        if(matches!=10)throw new AssertionError("changed matches: "+matches);
        return System.nanoTime()-begin;
    }
    public static void main(String[] args)throws Exception{
        if(args.length>0&&args[0].equals("--aggregate")){
            int total=0,guarded=0;
            try(var reader=new BufferedReader(new InputStreamReader(System.in,StandardCharsets.UTF_8))){
                String line;while((line=reader.readLine())!=null){total++;if(!NgRegexLiteralGuard.required(new String(Base64.getDecoder().decode(line),StandardCharsets.UTF_8)).isEmpty())guarded++;}
            }
            System.out.println("regex="+total+", necessary_literal="+guarded);return;
        }
        List<SharedNgRules.Rule> guarded=new ArrayList<>(),fallback=new ArrayList<>();
        for(int i=0;i<251;i++){
            String pattern="(?s:^(?=.*条件"+String.format("%03d",i)+".*禁止文)(?=.*必要文))";
            guarded.add(rule(pattern));fallback.add(rule("(?:"+pattern+")"));
        }
        List<String> bodies=new ArrayList<>();
        for(int i=0;i<200;i++)bodies.add("通常の本文を新規に評価します。".repeat(20)+i+(i%20==0?"条件000 対象の禁止文 必要文":""));
        run(guarded,bodies);run(fallback,bodies);
        long old=run(fallback,bodies),optimized=run(guarded,bodies);
        System.out.printf(Locale.ROOT,"synthetic uncached: rows=200 regex=251 matching=10 fallback=%.3fms guarded=%.3fms%n",old/1e6,optimized/1e6);
    }
}
