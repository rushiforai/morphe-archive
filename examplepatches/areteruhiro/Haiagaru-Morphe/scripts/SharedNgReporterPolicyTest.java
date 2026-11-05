package app.morphe.extension.chmate;
import java.util.*;
public final class SharedNgReporterPolicyTest {
    static int checks;static void check(boolean ok){checks++;if(!ok)throw new AssertionError("case "+checks);}
    static final String A="a".repeat(64),B="b".repeat(64);
    static SharedNgRules.Rule rule(String value,List<String> reporters){return new SharedNgRules.Rule("c".repeat(64),"5ch/all","keyword",value,"",reporters.size(),false,1,1,false,reporters);}
    public static void main(String[] args)throws Exception{
        var rule=rule("現在の条件",List.of(A,B));var source=List.of(rule);var ignored=new HashSet<String>();
        check(SharedNgReporterPolicy.apply(source,ignored)==source);
        ignored.add(A);var filtered=SharedNgReporterPolicy.apply(source,ignored);
        check(filtered.size()==1&&filtered.get(0).votes==1&&filtered.get(0).contributors.equals(List.of(B)));
        check(new SharedNgIndex(filtered,1,Set.of(),Set.of(),255).matches("5ch/all","","","現在の条件"));
        check(!new SharedNgIndex(filtered,2,Set.of(),Set.of(),255).matches("5ch/all","","","現在の条件"));
        check(SharedNgReporterPolicy.apply(List.of(rule("今後の別条件",List.of(A))),ignored).isEmpty());
        ignored.add(B);check(SharedNgReporterPolicy.apply(source,ignored).isEmpty());
        ignored.clear();check(SharedNgReporterPolicy.apply(source,ignored).get(0)==rule);
        var legacy=new SharedNgRules.Rule(A,"5ch/all","id","Legacy","",3,false);
        check(SharedNgReporterPolicy.apply(List.of(legacy),Set.of(A)).get(0)==legacy);
        for(List<String> invalid:List.of(List.of(A,A),List.of("invalid"))){try{rule("不正な報告者",invalid);throw new AssertionError("invalid accepted");}catch(IllegalArgumentException expected){checks++;}}
        try{new SharedNgRules.Rule(A,"5ch/all","id","Legacy","",3,false,1,0,false,List.of(A));throw new AssertionError("votes mismatch");}catch(IllegalArgumentException expected){checks++;}
        check(rule.contributors.size()==2&&rule.votes==2);
        String key=SharedNgDeviceKey.create("1234567890abcdef");check(key.matches("[a-f0-9]{64}")&&!key.contains("1234567890abcdef"));
        check(key.equals(SharedNgDeviceKey.create("1234567890ABCDEF")));
        check(!key.equals(SharedNgDeviceKey.create("1234567890abcdee")));
        for(String missing:Arrays.asList(null,"","0000000000000000","9774d56d682e549c","not-an-id"))check(SharedNgDeviceKey.create(missing).isEmpty());
        System.out.println("PASS "+checks+" reporter vote subtraction/future exclusions/restore/metadata/device-key checks");
    }
}
