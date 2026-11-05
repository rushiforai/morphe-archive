package app.morphe.extension.chmate;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

public final class NgResponseDecisionCacheTest {
    static int checks;static void check(boolean ok){if(!ok)throw new AssertionError("case "+checks);checks++;}
    static SharedNgIndex index(String value,boolean regex){return new SharedNgIndex(List.of(new SharedNgRules.Rule("a".repeat(64),"5ch/all","keyword",value,"",2,false,1,0,regex)),1,Set.of(),Set.of(),255);}
    public static void main(String[] args){
        SharedNgIndex index=index("対象文字列",false);AtomicInteger decoded=new AtomicInteger();
        NgResponseDecisionCache.Decoder decoder=s->{decoded.incrementAndGet();return s==null?"":s;};
        for(int round=0;round<3;round++)for(int i=0;i<1000;i++){
            String body=i%2==0?"対象文字列"+i:"通常本文"+i;
            check(index.matchesHtml("5ch/all","id"+i,"名前",body,decoder)==(i%2==0));
        }
        check(decoded.get()==2000); // existing 1000 responses decoded once, not on redisplay
        for(int i=1000;i<1010;i++)index.matchesHtml("5ch/all","id"+i,"名前","通常本文"+i,decoder);
        check(decoded.get()==2020); // only ten appended responses
        check(index.matchesHtml("5ch/all","id1","名前","編集後の対象文字列",decoder));check(decoded.get()==2022);
        check(!index.matchesHtml("edge/all","id1","名前","編集後の対象文字列",decoder));check(decoded.get()==2022);
        SharedNgIndex changed=index("別の条件",false);
        check(!changed.matchesHtml("5ch/all","id1","名前","編集後の対象文字列",decoder));check(decoded.get()==2024);
        SharedNgIndex regex=index("^対象.*$",true);int before=decoded.get();
        for(int i=0;i<2;i++)check(!regex.matchesHtml("5ch/all","id","","非一致",decoder));
        check(decoded.get()==before+2); // completed regex negatives can be reused
        before=decoded.get();for(int i=0;i<2;i++)check(regex.matchesHtml("5ch/all","id","","対象です",decoder));
        check(decoded.get()==before+2);
        SharedNgIndex timeout=index("(a+)+$",true);before=decoded.get();
        for(int i=0;i<2;i++)check(!timeout.matchesHtml("5ch/all","id","","a".repeat(10000)+"!",decoder));
        check(decoded.get()==before+4); // actual timeout is retried
        SharedNgRules.Rule identityRule=new SharedNgRules.Rule("b".repeat(64),"5ch/all","id","blocked","",2,false);
        SharedNgIndex identity=new SharedNgIndex(List.of(identityRule),1,Set.of(),Set.of(),255);
        before=decoded.get();check(identity.matchesHtml("5ch/all","blocked","名前","大きな本文",decoder));
        check(decoded.get()==before); // first-open identity match needs no HTML decoding
        identity=new SharedNgIndex(List.of(new SharedNgRules.Rule("c".repeat(64),"5ch/all","name","名前","",2,false)),1,Set.of(),Set.of(),255);
        check(identity.matchesHtml("5ch/all","other","名前","大きな本文",decoder));check(decoded.get()==before+1);
        NgResponseDecisionCache cache=new NgResponseDecisionCache();AtomicInteger evaluations=new AtomicInteger();
        for(int i=0;i<4100;i++){final int n=i;cache.match("b","id"+i,"n","body",true,()->{evaluations.incrementAndGet();return n%2==0;});}
        before=evaluations.get();check(cache.match("b","id0","n","body",true,()->{evaluations.incrementAndGet();return true;}));check(evaluations.get()==before+1);
        String huge="x".repeat(4_000_001);before=evaluations.get();
        for(int i=0;i<2;i++)cache.match("b","id","n",huge,true,()->{evaluations.incrementAndGet();return true;});check(evaluations.get()==before+2);
        System.out.println("PASS "+checks+" incremental response checks; 1000 rows x3 decoded once, append10 decoded10; edit/board/rule changes, regex-negative retry, bounded eviction");
    }
}
