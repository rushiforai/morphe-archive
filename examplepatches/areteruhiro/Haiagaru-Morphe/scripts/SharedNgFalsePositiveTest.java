package app.morphe.extension.chmate;
import java.util.*;import java.util.regex.*;

public final class SharedNgFalsePositiveTest {
    static int checks;static void ok(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    public static void main(String[] args){
        String expression="左のネ|([チョンパヨ].*){5}";
        String report="以前の変更でこうありましたが、ChMate標準バックアップのreferenceファイルはパッケージ名を変更しててもオリジナルと同名にして参照も同様にしてほしいです 検証で他のパッケージ名のchmate部分のみを復活する際、元の名前で共通してたほうが都合がいいです パッケージ名変更時、ChMate標準バックアップが実際の標準設定ストアを参照するよう修正しました。XML名は「変更後のパッケージ名_preferences.xml」です。元のパッケージ名の場合は従来のXML名です。";
        ok(Pattern.compile(expression).matcher(report).find(),"reported prose really matches the supplied regex");
        ok(NgRegexSafety.overbroadKeyword(expression),"alternation does not make a broad branch specific");
        var rule=new SharedNgRules.Rule("a".repeat(64),"*","keyword",expression,"",1,false,1,1,true);
        ok(!rule.expressionMatches(report),"online rule no longer hides backup discussion");
        var index=new SharedNgIndex(List.of(rule),1,Set.of(),Set.of(),255);
        ok(!index.matches("5ch/all","ID","name",report),"indexed shared matching follows same policy");
        ok(SharedNgIndex.matchingRules(List.of(rule),1,Set.of(),Set.of(),255,"5ch/all","ID","name",report).isEmpty(),"NG explanation does not claim a skipped rule matched");
        for(String broad:List.of("([チョンパヨ].*){5}","(?s)([あいうえお].*){10}","^(?:[あいう].*){5,}$","普通の条件|([あいう].*){5}"))ok(NgRegexSafety.overbroadKeyword(broad),"narrow scatter family detected");
        for(String specific:List.of("パッケージ名","(?:スパム宣伝.*){5}","差別用語([あいう].*){5}","[あいう]{5}","(.)\\1{20}","(?:宣伝|広告){5}","\\Q([あいう].*){5}\\E","左のネ\\|([あいう].*){5}"))ok(!NgRegexSafety.overbroadKeyword(specific),"other regexes are preserved: "+specific);
        var specific=new SharedNgRules.Rule("b".repeat(64),"*","keyword","(?:スパム宣伝.*){5}","",1,false,1,1,true);
        ok(specific.expressionMatches("スパム宣伝".repeat(5)),"specific repeated phrase remains effective");
        ok(rule.value.equals(expression)&&rule.votes==1&&!rule.revoked,"original rule and votes are not rewritten");
        String body="ﾜｯﾁｮｲやIPのNGも「()」「-」や「ﾜｯﾁｮｲ」を対象外にしないと同じ事をされると思う";
        String live="(^|\\n)\\p{Extended_Pictographic}{6}|ゴミ|死期|ワッチョイ|ﾜｯﾁｮｲ|老害|信者|無能|ガイジ|コロコロ";
        ok(NgRegexSafety.overbroadKeyword(live),"actual published rule contains independent short alternatives");
        var shortRule=new SharedNgRules.Rule("c".repeat(64),"*","keyword","ゴミ|死期|ワッチョイ|ﾜｯﾁｮｲ|老害|信者|無能|ガイジ|コロコロ","",1,false,1,1,true);
        ok(Pattern.compile(shortRule.value).matcher(body).find(),"actual literal alternative matches the fixed Wacchoi label");
        ok(!new SharedNgIndex(List.of(shortRule),1,Set.of(),Set.of(),255).matches("5ch/all","","",body),"reported post is no longer hidden");
        for(String value:List.of("\\(","\\)","-","ﾜｯﾁｮｲ","ワッチョイ","IP","[().:-]","(?=Ab12)")){
            for(String kind:List.of("name","wacchoi","id")){
                var identity=new SharedNgRules.Rule("d".repeat(64),"*",kind,value,"",1,false,1,1,true);
                ok(!identity.expressionMatches("(ﾜｯﾁｮｲ Ab12-Cd34 [192.0.2.1])"),"fixed markers cannot identify posters: "+kind+" "+value);
            }
        }
        for(String value:List.of("Ab12-Cd34","Ab12","192\\.0\\.2\\.1","(?:\\(|Ab12)")){
            var identity=new SharedNgRules.Rule("e".repeat(64),"*","name",value,"",1,false,1,1,true);
            ok(identity.expressionMatches("(ﾜｯﾁｮｲ Ab12-Cd34 [192.0.2.1])"),"real identity remains matchable; continue after a delimiter-only hit");
        }
        var label=new SharedNgRules.Rule("f".repeat(64),"*","name","ﾜｯﾁｮｲ","",1,false);
        ok(!new SharedNgIndex(List.of(label),1,Set.of(),Set.of(),255).matches("5ch/all","","(ﾜｯﾁｮｲ Ab12-Cd34)",""),"literal shared NG name also excludes the fixed label");
        var groupedLabel=new SharedNgRules.Rule("f".repeat(64),"*","keyword","(?:ﾜｯﾁｮｲ)|(?:[()-])","",1,false,1,1,true);
        ok(!groupedLabel.expressionMatches(body),"grouping cannot make a fixed label or delimiter meaningful");
        var emoji=new SharedNgRules.Rule("f".repeat(64),"*","keyword","(?:😀){6}","",1,false,1,1,true);
        ok(emoji.expressionMatches("😀".repeat(6)),"emoji spam detection remains valid");
        for(String quoted:List.of("\\Qtext|([あいう].*){5}","\\Qtext|([あいう].*){5}\\E","\\Q日本語の長い条件\\E","日本語の長い条件|別の長い日本語"))
            ok(!NgRegexSafety.overbroadKeyword(quoted),"quoted alternation and eligible literals remain active");
        System.out.println("PASS "+checks+" shared-regex false-positive/compatibility checks");
    }
}
