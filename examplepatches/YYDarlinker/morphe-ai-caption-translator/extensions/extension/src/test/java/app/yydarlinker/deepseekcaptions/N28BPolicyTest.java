package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class N28BPolicyTest {
  final CaptionLanguageContext neutral=CaptionLanguageContext.explicit("fr","ar");
  final CaptionLanguageContext legacy=CaptionLanguageContext.explicit("en","zh-Hans");
  DeepSeekConfig.Snapshot cfg(){return new DeepSeekConfig.Snapshot(true,"http://localhost/v1","fixture","custom tone",2,70,"fixture-key");}
  JSONObject event(RebuildSource s,int from,int to,String text)throws Exception {
    return new JSONObject().put("from",from).put("to",to).put("source",s.text(from,to)).put("text",text);
  }
  RebuildProtocol.Plan parse(RebuildSource s,JSONArray events,CaptionLanguageContext c)throws Exception {
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    return RebuildProtocol.parseBound(RebuildContractTest.reply(b,events),s,b,c);
  }
  void reject(String reason,RebuildSource s,JSONArray events)throws Exception {
    try{parse(s,events,neutral);fail("accepted "+reason);}catch(RebuildProtocol.Invalid e){assertEquals(reason,e.code);}
  }
  RebuildNumbers.Result number(String a,String b){return RebuildNumbers.compare(a,b,neutral);}
  @Test public void unicodeIntegerValueEquality(){
    for(String a:new String[]{"12","١٢","१२","１２","𝟙𝟚","00012"})
      for(String b:new String[]{"12","١٢","१२"})assertEquals(RebuildNumbers.Result.EQUIVALENT,number(a,b));
  }
  @Test public void unicodeIntegerContradiction(){
    for(String b:new String[]{"13","١٣","१३"})assertEquals(RebuildNumbers.Result.CONTRADICTED,number("12",b));
  }
  @Test public void commaDecimalUnknown(){assertEquals(RebuildNumbers.Result.UNKNOWN,number("1,2","1.2"));}
  @Test public void localizedDateUnknown(){assertEquals(RebuildNumbers.Result.UNKNOWN,number("12 octobre 2026","١٢ أكتوبر ٢٠٢٦"));}
  @Test public void magnitudeAndUnitUnknown(){for(String a:new String[]{"12 millions","12万","12 €","12 kg","twelve","douze"})assertEquals(RebuildNumbers.Result.UNKNOWN,number(a,"12"));}
  @Test public void groupedRangeMultipleNumbersUnknown(){for(String a:new String[]{"1 200","1.200","12–13","12 13","-12","12/10"})assertEquals(RebuildNumbers.Result.UNKNOWN,number(a,"13"));}
  @Test public void embeddedQuantityNotMisrepresentedAsVerified(){assertEquals(RebuildNumbers.Result.UNKNOWN,number("12 soldats","١٢ جنود"));}
  @Test public void chineseLegacyDateContradictionUnchanged(){assertFalse(RebuildNumbers.safe("October 12","10月13日"));assertEquals(RebuildNumbers.Result.CONTRADICTED,RebuildNumbers.compare("October 12","10月13日",legacy));}
  @Test public void oldSnapshotIsConservativelyCustom(){DeepSeekConfig.Snapshot c=cfg();assertEquals("unverified_custom",c.preferenceProvenance);assertEquals(c.prompt,c.effectivePreference);}
  @Test public void legacyPromptAndPayloadGoldenOverloadEquality()throws Exception {
    RebuildSource s=RebuildContractTest.source("This is a complete source sentence.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
    for(String code:new String[]{"en","en-GB","en-US","en-Latn-GB"})for(String target:new String[]{"zh-Hans","zh-Hant","zh-Hant-TW"}) {
      CaptionLanguageContext c=CaptionLanguageContext.explicit(code,target);assertTrue(c.canApplyEnglishToChinese);
      assertEquals(RebuildApi.prompt(cfg(),target),RebuildApi.prompt(cfg(),target,c));
      assertEquals(RebuildProtocol.payload(s,b,target,"repair").toString(),RebuildProtocol.payload(s,b,target,"repair",c).toString());
      assertEquals(RebuildCache.identity(s,cfg(),target),RebuildCache.identity(s,cfg(),target,c));
    }
  }
  @Test public void neutralPromptKeepsFullCodesAndExcludesDomainAndLengthExamples(){
    CaptionLanguageContext c=CaptionLanguageContext.explicit("fr-CA","pt-PT");String p=RebuildApi.prompt(cfg(),"pt-PT",c);
    assertTrue(p.contains("fr-CA"));assertTrue(p.contains("pt-PT"));assertTrue(p.contains("custom tone"));
    for(String old:new String[]{"SAM","tank fleet","12-30","30-76","The source is explicitly English"})assertFalse(old,p.contains(old));
    assertTrue(p.contains("presentation_policy=legacy_n26"));
  }
  @Test public void englishDependencyOnlyExplicitSource(){
    assertTrue(RebuildApi.prompt(cfg(),"fr",CaptionLanguageContext.explicit("en-GB","fr")).contains(RebuildApi.ENGLISH_DEPENDENCY_PROMPT));
    for(String c:new String[]{"fr","UNKNOWN","ja"})assertFalse(RebuildApi.prompt(cfg(),"fr",CaptionLanguageContext.explicit(c,"fr")).contains(RebuildApi.ENGLISH_DEPENDENCY_PROMPT));
  }
  @Test public void scopesDistinguishRegionsAndUnknown(){
    Set<String> keys=new HashSet<>();RebuildSource s=RebuildContractTest.source("source",500);
    for(String source:new String[]{"en","fr","UNKNOWN"})for(String target:new String[]{"ar","en","pt-PT","pt-BR"})
      assertTrue(keys.add(RebuildCache.identity(s,cfg(),target,CaptionLanguageContext.explicit(source,target))));
  }
  @Test public void frenchHomographsNeverEnableEnglishCuts()throws Exception {
    RebuildSource s=RebuildContractTest.source("il se trouve in the modernization picture",500);
    assertTrue(RebuildPlanner.protectedCut(s,5));assertFalse(RebuildPlanner.protectedCut(s,5,neutral));
    assertTrue(RebuildPlanner.dependentEnding(s,4));assertFalse(RebuildPlanner.dependentEnding(s,4,neutral));
    assertEquals(0,RebuildProtocol.payload(s,RebuildContractTest.block(s),"ar","",neutral).getJSONArray("avoid_event_end_after").length());
  }
  @Test public void genericChineseIsNeutralDespiteHanText()throws Exception {
    CaptionLanguageContext c=CaptionLanguageContext.explicit("en","zh");assertFalse(c.canApplyEnglishToChinese);
    RebuildSource s=RebuildContractTest.source("a tank fleet",500);assertEquals(0,RebuildReview.score(parse(s,new JSONArray().put(event(s,0,2,"坦克舰队")),c).issues));
  }
  @Test public void japanesePureHanDoesNotEnableChineseLexicon()throws Exception {
    CaptionLanguageContext c=CaptionLanguageContext.explicit("en","ja");RebuildSource s=RebuildContractTest.source("a tank fleet",500);
    assertEquals(0,RebuildReview.score(parse(s,new JSONArray().put(event(s,0,2,"坦克舰队")),c).issues));
  }
  @Test public void unknownLatinDoesNotEnableEnglishNegationReview()throws Exception {
    RebuildSource s=RebuildContractTest.source("not always",500);CaptionLanguageContext c=CaptionLanguageContext.explicit(null,"zh-Hans");
    assertEquals(0,RebuildReview.score(parse(s,new JSONArray().put(event(s,0,1,"通常不")),c).issues));
  }
  @Test public void neutralEnglishSourceDependencyIsAdvisory()throws Exception {
    RebuildSource s=RebuildContractTest.source("the missile",500);CaptionLanguageContext c=CaptionLanguageContext.explicit("en","fr");
    assertEquals(2,parse(s,new JSONArray().put(event(s,0,0,"le")).put(event(s,1,1,"missile")),c).events.size());
  }
  @Test public void longNeutralTextDoesNotSpendPaidRepair()throws Exception {
    RebuildSource s=RebuildContractTest.source("phrase",500);StringBuilder t=new StringBuilder();for(int i=0;i<700;i++)t.append('字');
    RebuildProtocol.Plan p=parse(s,new JSONArray().put(event(s,0,0,t.toString())),neutral);
    assertFalse(p.issues.isEmpty());assertEquals(0,RebuildReview.score(p.issues));assertFalse(RebuildReview.shouldRepair(p,1,0,0,500));
  }
  @Test public void missingAndDuplicateIdsRemainRejected()throws Exception {
    RebuildSource s=RebuildContractTest.source("un deux trois",500);
    reject("source_coverage",s,new JSONArray().put(event(s,0,0,"un")).put(event(s,2,2,"trois")));
    reject("source_coverage",s,new JSONArray().put(event(s,0,1,"un deux")).put(event(s,1,2,"deux trois")));
  }
  @Test public void reverseIdsNotRecoveredInNeutralScope()throws Exception {
    RebuildSource s=RebuildContractTest.source("un deux",500);
    reject("source_coverage",s,new JSONArray().put(event(s,1,1,"deux")).put(event(s,0,0,"un")));
  }
  @Test public void quoteMismatchAndRequiredRemainHard()throws Exception {
    RebuildSource s=RebuildContractTest.source("un deux",500);
    reject("source_quote_mismatch",s,new JSONArray().put(event(s,0,1,"translated").put("source","different")));
    JSONObject e=event(s,0,1,"translated");e.remove("source");reject("source_quote_required",s,new JSONArray().put(e));
  }
  @Test public void silenceBreakRemainsHard()throws Exception {
    List<RebuildSource.Word> words=Arrays.asList(new RebuildSource.Word("un",0,500,0,RebuildSource.Precision.NATIVE),new RebuildSource.Word("deux",1200,1700,1,RebuildSource.Precision.NATIVE));
    RebuildSource s=new RebuildSource(words);reject("crosses_source_break",s,new JSONArray().put(event(s,0,1,"traduit")));
  }
  @Test public void explicitSpeakerBreakRemainsHard()throws Exception {
    RebuildSource s=new RebuildSource(Arrays.asList(new RebuildSource.Word("un",0,500,0,RebuildSource.Precision.NATIVE),new RebuildSource.Word(">>deux",500,1000,1,RebuildSource.Precision.NATIVE)));
    reject("crosses_source_break",s,new JSONArray().put(event(s,0,1,"traduit")));
  }
  @Test public void singleIntegerParseMismatchHard()throws Exception {
    RebuildSource s=RebuildContractTest.source("12",500);reject("numeric_substitution",s,new JSONArray().put(event(s,0,0,"١٣")));
    assertEquals("१२",parse(s,new JSONArray().put(event(s,0,0,"१२")),neutral).events.get(0).text);
  }
  @Test public void numericUnknownIsObservedWithoutRepair()throws Exception {
    RebuildSource s=RebuildContractTest.source("1,2",500);RebuildProtocol.Plan p=parse(s,new JSONArray().put(event(s,0,s.words.size()-1,"1.2")),neutral);
    assertTrue(p.issues.stream().anyMatch(i->i.code.equals("numeric_unknown")));assertEquals(0,RebuildReview.score(p.issues));
  }
  @Test public void literalAsciiModelTransferRemainsHard()throws Exception {
    RebuildSource s=RebuildContractTest.source("F-16 arrive. T-62 part.",500);
    reject("semantic_anchor_leak",s,new JSONArray().put(event(s,0,1,"T-62")).put(event(s,2,3,"T-62")));
  }
  @Test public void unverifiedEquipmentAliasIsUnknown()throws Exception {
    assertEquals(RebuildSemantics.Evidence.UNKNOWN,RebuildSemantics.evidence(0,"tanks","tanks and aircraft carriers",neutral));
    RebuildSource s=RebuildContractTest.source("tanks arrive. aircraft carriers leave.",500);
    assertEquals(2,parse(s,new JSONArray().put(event(s,0,1,"航空母舰到来。")).put(event(s,2,4,"舰船离开。")),CaptionLanguageContext.explicit("fr","ja")).events.size());
  }
  @Test public void translatedRangeInForeignLanguageIsUnknown()throws Exception {
    RebuildSource s=RebuildContractTest.source("12 13",500);RebuildProtocol.Plan p=parse(s,new JSONArray().put(event(s,0,1,"12 à 13")),CaptionLanguageContext.explicit("fr","fr"));
    assertEquals(0,RebuildReview.score(p.issues));assertTrue(p.issues.stream().anyMatch(i->i.code.equals("source_number_ambiguity")));
  }
  @Test public void malformedSchemaAndEmptySpeechRemainHard()throws Exception {
    RebuildSource s=RebuildContractTest.source("un",500);
    reject("index_type",s,new JSONArray().put(event(s,0,0,"text").put("from","0")));
    reject("empty_translation",s,new JSONArray().put(event(s,0,0,"")));
  }
  @Test public void neutralRequestSeamDifferenceRetainsOriginalTokensAndTimes()throws Exception {
    StringBuilder text=new StringBuilder();for(int i=0;i<80;i++)text.append("modernization picture the ");
    RebuildSource s=RebuildContractTest.source(text.toString(),250);String source=s.text(0,s.words.size()-1);
    List<RebuildPlanner.Block> old=RebuildPlanner.plan(s),scoped=RebuildPlanner.plan(s,neutral);
    assertEquals(118,old.get(0).to);assertEquals(119,scoped.get(0).to);
    assertEquals(source,s.text(0,s.words.size()-1));assertEquals(240,s.words.size());
    for(int i=0;i<s.words.size();i++){assertEquals(i*250,s.words.get(i).start);assertEquals((i+1)*250,s.words.get(i).end);}
    String dir=System.getenv("N28B_EVIDENCE_DIR");if(dir!=null){
      JSONArray a=new JSONArray(),b=new JSONArray();for(RebuildPlanner.Block block:old)a.put(block.id());for(RebuildPlanner.Block block:scoped)b.put(block.id());
      JSONObject evidence=new JSONObject().put("legacy_blocks",a).put("neutral_blocks",b).put("tokens",240)
          .put("source_hash",RebuildCache.hash(source)).put("tokens_and_times_unchanged",true).put("reason","non_english_source_ignores_english_dependency_hints");
      java.nio.file.Files.write(new java.io.File(dir,"planner-scope-difference.json").toPath(),evidence.toString(2).getBytes("UTF-8"));
    }
  }
}
