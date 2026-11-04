package app.morphe.extension.chmate;
import java.util.*;

public final class SharedNgResponseExclusionTest {
    static int checks;
    static void check(boolean ok) { if (!ok) throw new AssertionError("case " + checks); checks++; }
    static SharedNgRules.Rule rule(int n,String board,String kind,String value,int votes,boolean revoked,boolean regex) {
        return new SharedNgRules.Rule(String.format("%064x",n),board,kind,value,"",votes,revoked,1,0,regex);
    }
    public static void main(String[] args) {
        List<SharedNgRules.Rule> source=List.of(
            rule(1,"5ch/all","keyword","誤判定テスト",5,false,false),
            rule(2,"*","keyword","誤判定.*",5,false,true),
            rule(3,"edge/all","keyword","誤判定テスト",5,false,false),
            rule(4,"5ch/all","keyword","誤判定テスト",1,false,false),
            rule(5,"5ch/all","keyword","誤判定テスト",5,true,false),
            rule(6,"5ch/all","id","TestID",5,false,false),
            rule(7,"5ch/all","name","名前",5,false,false));
        List<SharedNgRules.Rule> matched=SharedNgIndex.matchingRules(source,5,Set.of(),Set.of(),255,"5ch/all","TestID","名前","誤判定テストの本文");
        check(matched.equals(List.of(source.get(0),source.get(1),source.get(5),source.get(6))));
        Set<String> excluded=new HashSet<>();for(var r:matched)excluded.add(r.id);
        check(!new SharedNgIndex(source,5,excluded,Set.of(),255).matches("5ch/all","TestID","名前","誤判定テストの本文"));
        check(SharedNgIndex.matchingRules(source,5,excluded,Set.of(),255,"5ch/all","TestID","名前","誤判定テストの本文").isEmpty());
        check(SharedNgIndex.matchingRules(source,5,Set.of(),Set.of("5ch/all","*"),255,"5ch/all","TestID","名前","誤判定テストの本文").isEmpty());
        check(SharedNgIndex.matchingRules(source,5,Set.of(),Set.of(),0,"5ch/all","TestID","名前","誤判定テストの本文").isEmpty());
        check(SharedNgIndex.matchingRules(source,5,Set.of(),Set.of(),255,"pink/all","other","","普通の本文").isEmpty());
        check(source.size()==7&&source.get(0).value.equals("誤判定テスト"));
        for(int mask=0;mask<256;mask++) {
            var found=SharedNgIndex.matchingRules(source,5,Set.of(source.get(0).id),Set.of(),mask,"5ch/all","TestID","名前","誤判定テストの本文");
            check(!found.isEmpty()==new SharedNgIndex(source,5,Set.of(source.get(0).id),Set.of(),mask).matches("5ch/all","TestID","名前","誤判定テストの本文"));
        }
        System.out.println("PASS response shared NG exclusions " + checks);
    }
}
