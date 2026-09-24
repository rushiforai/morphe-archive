package app.yydarlinker.deepseekcaptions;

import org.junit.Test;
import static org.junit.Assert.*;
import java.util.*;
import org.json.*;

/** Reproductions of the report's failure classes, not a replay of unavailable provider responses. */
public class Refinement112Test {
    private List<SourceAtomTimeline.Atom> atoms(String... words) {
        List<SourceAtomTimeline.Atom> out=new ArrayList<>();
        for(int i=0;i<words.length;i++) out.add(new SourceAtomTimeline.Atom(i*1000,i*1000+900,words[i],i,true));
        return out;
    }
    private TranslationUnitTimeline.Unit unit(List<SourceAtomTimeline.Atom> atoms) {
        return new TranslationUnitTimeline.Unit(0,"w0",0,atoms.size()-1,0,atoms.size()-1,0,
                atoms.get(atoms.size()-1).endMs,SourceAtomTimeline.join(atoms,0,atoms.size()-1),TranslationUnitTimeline.Confidence.HIGH,"test");
    }
    private String response(JSONArray rows)throws Exception{return new JSONObject().put("translations",rows).toString();}
    private JSONObject valid()throws Exception{return new JSONObject().put("id","w0").put("segments",new JSONArray().put(new JSONArray().put("Hello world").put("你好，世界。")));}
    @Test public void numericSourcePhraseIsNotMistakenForAnIndex()throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms("200","megapixels");
        AnchoredCaptionPlan p=AnchoredCaptionPlan.parseSourcePhrases(new JSONArray().put(new JSONArray().put("200").put("两百"))
                .put(new JSONArray().put("megapixels").put("百万像素")),a,unit(a),null);
        assertEquals(1,p.segments.size());assertEquals(0,p.segments.get(0).from);assertEquals(1900,p.segments.get(0).endMs);
        assertEquals(p.toJson().toString(),AnchoredCaptionPlan.parse(p.toJson(),a,unit(a)).toJson().toString());
    }
    @Test public void wrongNumericPhraseCannotBecomeAnIndex()throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms("Hello","world");
        try{AnchoredCaptionPlan.parseSourcePhrases(new JSONArray().put(new JSONArray().put("1").put("你好世界")),a,unit(a),null);fail();}
        catch(IllegalArgumentException expected){assertTrue(expected.getMessage().contains("source_phrase_mismatch"));}
    }
    @Test public void unassignableSiblingDoesNotPoisonGoodTranslation()throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms("Hello","world");
        for(Object invalid:Arrays.asList(JSONObject.NULL,42,"broken",new JSONObject().put("id",17),new JSONObject())) {
            ContextualBatchApiClient.Result r=ContextualBatchApiClient.parseAnchored(response(new JSONArray().put(invalid).put(valid())),Arrays.asList(unit(a)),a);
            assertEquals(1,r.validCount());assertTrue(r.missingIds.isEmpty());
        }
    }
    @Test public void malformedOnlyResponseStillRequiresBudgetedRetry()throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms("Hello","world");
        ContextualBatchApiClient.Result r=ContextualBatchApiClient.parseAnchored(response(new JSONArray().put(JSONObject.NULL)),Arrays.asList(unit(a)),a);
        assertEquals(0,r.validCount());assertEquals(Arrays.asList("w0"),r.missingIds);
    }
    @Test public void windowsFencesAndBomAreTransportOnly()throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms("Hello","world");String body=response(new JSONArray().put(valid()));
        for(String s:Arrays.asList(body,"```json\r\n"+body+"\r\n```","\uFEFF```JSON\r\n"+body+"\r\n```","```\n"+body+"\n```"))
            assertEquals(1,ContextualBatchApiClient.parseAnchored(s,Arrays.asList(unit(a)),a).validCount());
    }
    @Test public void invalidEnvelopesHaveSafeActionableCategories()throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms("Hello","world");
        for(String s:Arrays.asList("{\"translations\": [", "```json\n{}", "explanation {}", "{} trailing prose")) {
            try{ContextualBatchApiClient.parseAnchored(s,Arrays.asList(unit(a)),a);fail();}
            catch(ContextualBatchApiClient.BatchFormatException e){assertEquals("protocol_json",e.category());}
        }
        try{ContextualBatchApiClient.parseAnchored("{}",Arrays.asList(unit(a)),a);fail();}
        catch(ContextualBatchApiClient.BatchFormatException e){assertEquals("protocol_translations",e.category());}
    }
    @Test public void formatRecoveryDoesNotIncreaseRetriesOrBypassQuality() {
        for(String reason:Arrays.asList("protocol_json","protocol_translations","protocol_format","finish_length","duplicate_response_id"))assertTrue(ProtocolRecovery.wholeText(reason));
        assertFalse(ProtocolRecovery.wholeText("translation_quality"));assertEquals(3,AnchoredRetryPolicy.MAX_FAILURES);
    }
    @Test public void noWidthIndependentBreakOrDanglingQuote() {
        String text="保卫国家及其独立便退居为第二目标。 ”";
        assertEquals("保卫国家及其独立便退居为第二目标。”",CaptionPresentationPolicy.wrap(text));
        assertEquals("当然，大概除了那位半神般的领袖及其家人之外。",CaptionPresentationPolicy.wrap("当然， 大概除了那位半神般的领袖及其家人之外。"));
        assertFalse(CaptionPresentationPolicy.wrap("它基本上消除了任何可见的折痕，这是一个完整的分句。").contains("\n"));
        assertEquals("Oppo Find N6",CaptionPresentationPolicy.wrap("Oppo Find N6"));
        assertEquals("这是 Oppo Find N6 的屏幕。",CaptionPresentationPolicy.wrap("这是 Oppo Find N6 的屏幕。"));
        assertEquals("Hello, world!",CaptionPresentationPolicy.wrap("Hello, world!"));
    }
    private SourceAtomTimeline.Result track(int n,int shift,boolean nativeTime,boolean mismatchTail) {
        List<SourceAtomTimeline.Atom> a=new ArrayList<>();
        for(int i=0;i<n;i++)a.add(new SourceAtomTimeline.Atom(i*500L+shift,i*500L+400+shift,
                mismatchTail&&i>=8?"different"+i:"word"+i,i,nativeTime));
        return new SourceAtomTimeline.Result(a,n,nativeTime?n:0,nativeTime?0:n,true,false);
    }
    @Test public void lastOneToThreeMatchingWordsUseExactNativeTiming() {
        for(int size=9;size<=11;size++) {
            SourceAtomTimeline.Result r=AsrLocalTiming.align(track(size,0,false,false),track(size,300,true,false));
            assertEquals(size,r.nativeTimedAtoms);
            for(int i=0;i<size;i++){assertEquals(i*500L+300,r.atoms.get(i).startMs);assertEquals(i*500L+700,r.atoms.get(i).endMs);}
        }
    }
    @Test public void changedTailCannotBorrowAnExactNativeLabel() {
        SourceAtomTimeline.Result r=AsrLocalTiming.align(track(11,0,false,false),track(11,300,true,true));
        assertEquals(8,r.nativeTimedAtoms);for(int i=8;i<11;i++)assertFalse(r.atoms.get(i).precise);
    }
    @Test public void distantAndEstimatedReferencesCannotExtendAnchors() {
        SourceAtomTimeline.Result a=track(11,0,false,false);
        assertSame(a,AsrLocalTiming.align(a,track(11,13000,true,false)));
        assertSame(a,AsrLocalTiming.align(a,track(11,300,false,false)));
    }
    @Test public void startupAndSubsequentBatchingUseSamePolicy() {
        assertEquals(4,StartupCaptionPolicy.targetLimit(false,4));assertEquals(4,StartupCaptionPolicy.targetLimit(true,4));
        assertEquals(1,StartupCaptionPolicy.targetLimit(true,0));
    }
}
