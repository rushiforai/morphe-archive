package app.yydarlinker.deepseekcaptions;
import org.junit.*;import static org.junit.Assert.*;import java.util.*;import org.json.*;
/** Synthetic failure classes from the user's screenshots; never claimed to be raw API replay. */
public class SemanticQuality134Test {
    static List<SourceAtomTimeline.Atom> atoms(String text,long step){
        List<SourceAtomTimeline.Atom> a=new ArrayList<>();String[] w=text.split(" ");
        for(int i=0;i<w.length;i++)a.add(new SourceAtomTimeline.Atom(i*step,(i+1)*step,w[i],i/5,false));return a;
    }
    static TranslationUnitTimeline.Result tasks(List<SourceAtomTimeline.Atom>a){return SemanticTaskPlanner.build(new SourceAtomTimeline.Result(a,a.size(),0,a.size(),true,false));}
    static JSONObject pair(String source,String translation)throws Exception{return new JSONObject().put("source",source).put("translation",translation);}
    static String reply(TranslationUnitTimeline.Unit u,JSONArray segments)throws Exception{
        return new JSONObject().put("translations",new JSONArray().put(new JSONObject().put("id",u.id).put("segments",segments))).toString();
    }
    @Test public void completeUnpunctuatedNegationSpansFormerWindowBoundary(){
        String prefix=String.join(" ",Collections.nCopies(43,"context"));
        List<SourceAtomTimeline.Atom>a=atoms(prefix+" i am not going to be asking what the results of a hypothetical military clash might be",250);
        TranslationUnitTimeline.Result old=AnchoredWindowPlanner.build(new SourceAtomTimeline.Result(a,a.size(),0,a.size(),true,false));
        assertTrue(old.units.size()>1);TranslationUnitTimeline.Result next=tasks(a);
        assertTrue(next.units.stream().anyMatch(u->u.sourceText.contains("i am not going to be asking what the results")));
    }
    @Test public void sourceTailNotForcedIntoTwelveSecondWindows(){
        List<SourceAtomTimeline.Atom>a=atoms("this pace of modernisation probably cannot go on forever",1500);
        assertEquals(1,tasks(a).units.size());assertTrue(tasks(a).units.get(0).endMs>12000);
    }
    @Test public void deterministicCompleteCoverageAndBoundedTasks(){
        for(int count=1;count<240;count++){
            List<SourceAtomTimeline.Atom>a=atoms(String.join(" ",Collections.nCopies(count,"ordinary")),300);
            TranslationUnitTimeline.Result r=tasks(a);int next=0;
            for(TranslationUnitTimeline.Unit u:r.units){assertEquals(next,u.fromAtom);assertTrue(u.toAtom-u.fromAtom+1<=96);assertTrue(u.endMs-u.startMs<=24000);next=u.toAtom+1;}
            assertEquals(count,next);assertEquals(r.units.size(),tasks(a).units.size());
        }
    }
    @Test public void silenceAndSpeakerAreNotMerged(){
        List<SourceAtomTimeline.Atom>a=Arrays.asList(new SourceAtomTimeline.Atom(0,1000,"Hello",0,true),new SourceAtomTimeline.Atom(2000,3000,"world",1,true),new SourceAtomTimeline.Atom(3000,4000,">> Next",2,true));
        assertEquals(3,tasks(a).units.size());
    }
    @Test public void objectsMapToRealSourceTimesAndCacheRoundTrip()throws Exception{
        List<SourceAtomTimeline.Atom>a=atoms("We keep numbers. They keep meaning.",700);TranslationUnitTimeline.Unit u=tasks(a).units.get(0);
        ContextualBatchApiClient.Result r=ContextualBatchApiClient.parseAnchored(reply(u,new JSONArray().put(pair(u.sourceText,"我们保留数字。"))),Arrays.asList(u),a);
        assertEquals(1,r.validCount());AnchoredCaptionPlan p=r.plansById.get(u.id);
        assertEquals(u.startMs,p.segments.get(0).startMs);assertEquals(u.endMs,p.segments.get(0).endMs);
        assertEquals(p.toJson().toString(),AnchoredCaptionPlan.parse(p.toJson(),a,u).toJson().toString());
    }
    @Test public void networkCannotUseNumericCacheProtocol()throws Exception{
        List<SourceAtomTimeline.Atom>a=atoms("Hello world.",1000);TranslationUnitTimeline.Unit u=tasks(a).units.get(0);
        assertEquals(0,ContextualBatchApiClient.parseAnchored(reply(u,new JSONArray().put(new JSONArray().put(1).put("你好世界"))),Arrays.asList(u),a).validCount());
        assertEquals(0,ContextualBatchApiClient.parseAnchored(reply(u,new JSONArray().put(new JSONObject().put("text","你好").put("end",1))),Arrays.asList(u),a).validCount());
    }
    @Test public void paragraphRequiresBoundedQualityRepairInsteadOfTinyFont()throws Exception{
        List<SourceAtomTimeline.Atom>a=atoms("modernisation probably cannot last forever caveats upfront we will not discuss platforms and capabilities in detail this is not a weapons video and we will not speculate about war",350);
        TranslationUnitTimeline.Unit u=new TranslationUnitTimeline.Unit(0,"test",0,a.size()-1,0,9,0,a.get(a.size()-1).endMs,SourceAtomTimeline.join(a,0,a.size()-1),TranslationUnitTimeline.Confidence.MEDIUM,"test");
        String text="现代化进程恐怕无法永远持续下去。首先我要说明的是，我不会详细探讨平台和能力问题，这也不是一个关于武器威力的视频。我也无意讨论假想冲突。";
        ContextualBatchApiClient.Result r=ContextualBatchApiClient.parseAnchored(reply(u,new JSONArray().put(pair(u.sourceText,text))),Arrays.asList(u),a);
        assertEquals(0,r.validCount());assertTrue(r.rejectionReasons.get(u.id).startsWith(CaptionQualityPolicy.PREFIX));
    }
    @Test public void dependentNumberAndNounJoinInProductionParser()throws Exception{
        List<SourceAtomTimeline.Atom>a=atoms("200 megapixels",500);TranslationUnitTimeline.Unit u=tasks(a).units.get(0);
        AnchoredCaptionPlan p=AnchoredCaptionPlan.parseSourcePhrases(new JSONArray().put(pair("200","两百")).put(pair("megapixels","百万像素")),a,u,null);
        assertEquals(1,p.segments.size());assertEquals(0,p.segments.get(0).startMs);assertEquals(1000,p.segments.get(0).endMs);
    }
    @Test public void shortCompleteReplyRemainsIndependent()throws Exception{
        List<SourceAtomTimeline.Atom>a=atoms("Yes. Next thought.",400);
        List<AnchoredCaptionPlan.Segment> s=Arrays.asList(new AnchoredCaptionPlan.Segment(0,0,0,400,"是。"),new AnchoredCaptionPlan.Segment(1,2,400,1200,"下一点。"));
        TranslationUnitTimeline.Unit u=new TranslationUnitTimeline.Unit(0,"test",0,2,0,1,0,1200,"Yes. Next thought.",TranslationUnitTimeline.Confidence.HIGH,"test");
        assertEquals(2,CaptionQualityPolicy.pack(s,a,u).size());
    }
    @Test public void phraseMatchingPreservesNumbersSignsAndWordBoundaries(){
        assertNotEquals(SourcePhraseAlignment.canonical("1.5"),SourcePhraseAlignment.canonical("15"));
        assertNotEquals(SourcePhraseAlignment.canonical("-10"),SourcePhraseAlignment.canonical("10"));
        assertNotEquals(SourcePhraseAlignment.canonical("a part"),SourcePhraseAlignment.canonical("apart"));
        assertNotEquals(SourcePhraseAlignment.canonical("we're"),SourcePhraseAlignment.canonical("were"));
        assertEquals(SourcePhraseAlignment.canonical("GPT-5.6"),SourcePhraseAlignment.canonical("GPT 5.6"));
        assertNotEquals(SourcePhraseAlignment.canonical("5-10"),SourcePhraseAlignment.canonical("5 10"));
        assertNotEquals(SourcePhraseAlignment.canonical("1/2"),SourcePhraseAlignment.canonical("1 2"));
        assertEquals(SourcePhraseAlignment.canonical("1,000"),SourcePhraseAlignment.canonical("1000"));
        assertEquals(SourcePhraseAlignment.canonical("They're ready!"),SourcePhraseAlignment.canonical("they’re ready."));
    }
    @Test public void limitedNumericGuardDoesNotPretendToVerifyAllMeaning(){
        assertEquals("numeric_substitution",CaptionFidelity.issue("20 missiles","200枚导弹"));
        assertEquals("",CaptionFidelity.issue("10000 units","1万件"));
        assertEquals("",CaptionFidelity.issue("20 missiles","二十枚导弹"));
        assertEquals("",CaptionFidelity.issue("1 million people","100万人"));
    }
    @Test public void bailianWorkspaceGetsStrictSchemaWithoutSpeculativeTemperature()throws Exception{
        DeepSeekConfig.Snapshot c=new DeepSeekConfig.Snapshot(true,"https://llm-fixture.cn-beijing.maas.aliyuncs.com/compatible-mode/v1","qwen3.8-flash","Faithful",18,70,"fixture");
        JSONObject r=ProviderRequestPolicy.request(c,AnchoredCaptionPlan.PROMPT,new JSONObject(),1500);
        assertEquals("json_schema",r.getJSONObject("response_format").getString("type"));assertEquals(0,r.getInt("presence_penalty"));assertFalse(r.has("temperature"));assertFalse(r.getBoolean("enable_thinking"));
        assertTrue(ProviderRequestPolicy.removeOptional(r,"response_format_unsupported"));assertEquals("json_object",r.getJSONObject("response_format").getString("type"));assertEquals(1500,r.getInt("max_tokens"));
    }

    @Test public void qualityRepairSharesCapAndStopsAfterOnePerTask(){
        assertTrue(CaptionRepairBudget.allow(0,0,1));assertFalse(CaptionRepairBudget.allow(1,1,2));
        assertFalse(CaptionRepairBudget.allow(0,4,1));assertFalse(CaptionRepairBudget.allow(0,1,3));
        assertEquals(3,AnchoredRetryPolicy.MAX_FAILURES);
    }
    @Test public void contextExtendsOnlyToFinishSentenceWithinHardBound(){
        String sentence=String.join(" ",Collections.nCopies(30,"context"))+".";
        String r=ContextualBatchApiClient.boundedContext(Arrays.asList(sentence),false);
        assertEquals(sentence,r);assertTrue(r.length()<=320);
        assertTrue(ContextualBatchApiClient.boundedContext(Arrays.asList(String.join(" ",Collections.nCopies(100,"context"))),false).length()<=160);
    }

    @Test public void shortSentencesShareTaskSoApiOverheadDoesNotExplode(){
        List<SourceAtomTimeline.Atom>a=atoms("One complete sentence. A second sentence. A third sentence. A fourth sentence.",400);
        assertTrue(tasks(a).units.size()<4);
    }
    @Test public void syntheticBoundaryCorpusKeepsCoverageWithoutInventingWords(){
        String[] clauses={
            "I am not going to ask what the outcome would be",
            "this pace of modernisation probably cannot last forever",
            "twenty conventional ballistic missiles were available",
            "the fifth generation aircraft entered service",
            "this does not mean that the result is certain",
            "if the budget grows we may buy more equipment",
            "the cost is three times the original price",
            "the number is 1.5 percent rather than 15 percent",
            "we will examine research development spending and industry",
            "they said that the system was not ready"};
        for(String clause:clauses)for(int prefix=0;prefix<10;prefix++){
            String source=String.join(" ",Collections.nCopies(30+prefix,"context"))+" "+clause;
            List<SourceAtomTimeline.Atom>a=atoms(source,230);TranslationUnitTimeline.Result r=tasks(a);
            String joined=String.join(" ",r.units.stream().map(u->u.sourceText).toArray(String[]::new));
            assertEquals(source,joined);assertTrue(r.units.stream().anyMatch(u->u.sourceText.contains(clause)));
        }
    }

    @Test public void stricterMatchingCannotChangeTimingReferenceFingerprint(){
        String[] inputs={"we're", "were", "GPT-5.6", "1.5", "15", "a part", "1,000", "−3.5", "Hello WORLD!"};
        for(String word:inputs){StringBuilder old=new StringBuilder();word.toLowerCase(Locale.ROOT).codePoints().filter(Character::isLetterOrDigit).forEach(old::appendCodePoint);
            assertEquals(old.toString(),SourcePhraseAlignment.timingLexical(word));}
        assertNotEquals(SourcePhraseAlignment.canonical("1.5"),SourcePhraseAlignment.timingLexical("1.5"));
    }
}
