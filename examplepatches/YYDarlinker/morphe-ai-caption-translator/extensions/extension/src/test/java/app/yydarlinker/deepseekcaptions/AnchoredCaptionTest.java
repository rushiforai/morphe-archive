package app.yydarlinker.deepseekcaptions;
import org.junit.Test;
import org.json.JSONArray;
import org.json.JSONObject;
import java.nio.charset.StandardCharsets;
import java.util.*;
import static org.junit.Assert.*;

public class AnchoredCaptionTest {
    private List<SourceAtomTimeline.Atom> atoms(int count) {
        List<SourceAtomTimeline.Atom> a=new ArrayList<>();
        for(int i=0;i<count;i++) a.add(new SourceAtomTimeline.Atom(1000+i*800,1700+i*800,"word"+i,i,true));
        return a;
    }
    private TranslationUnitTimeline.Unit unit(List<SourceAtomTimeline.Atom> a) {
        return new TranslationUnitTimeline.Unit(0,"w0",0,a.size()-1,0,a.size()-1,
                a.get(0).startMs,a.get(a.size()-1).endMs,SourceAtomTimeline.join(a,0,a.size()-1),
                TranslationUnitTimeline.Confidence.HIGH,"test");
    }
    private void rejected(String json) throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms(4);
        try { AnchoredCaptionPlan.parse(new JSONArray(json),a,unit(a));fail(json); }
        catch(IllegalArgumentException expected) {}
    }
    @Test public void exactSourceRangesAndSilenceArePreserved() throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms(4);
        AnchoredCaptionPlan p=AnchoredCaptionPlan.parse(new JSONArray("[[1,\"第一分句\"],[3,\"第二分句\"]]"),a,unit(a));
        assertEquals(1000,p.segments.get(0).startMs); assertEquals(2500,p.segments.get(0).endMs);
        assertEquals(2600,p.segments.get(1).startMs); assertEquals(4100,p.segments.get(1).endMs);
        assertEquals(p.toJson().toString(),AnchoredCaptionPlan.parse(p.toJson(),a,unit(a)).toJson().toString());
    }
    @Test public void rejectsOverlapOmissionAndInventedIndices() throws Exception {
        for(String j:Arrays.asList("[[1,\"句子\"]]","[[1,\"句子\"],[1,\"重复\"],[3,\"结束\"]]",
          "[[-1,\"句子\"],[3,\"结束\"]]","[[4,\"越界\"]]","[[3.5,\"浮点\"]]",
          "[[\"3x\",\"字符串\"]]","[[3,\"\"]]","[[3,null]]","[[999999999999,\"溢出\"]]")) rejected(j);
    }
    @Test public void malformedSiblingDoesNotDiscardValidPlan() throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms(4);TranslationUnitTimeline.Unit u=unit(a);
        ContextualBatchApiClient.Result result=ContextualBatchApiClient.parseAnchored(
          "{\"translations\":[{\"id\":\"unknown\",\"segments\":[[3,\"无关\"]]},"
          +"{\"id\":\"w0\",\"segments\":[[\"word0 word1 word2 word3\",\"完整的字幕翻译\"]]}]}",Collections.singletonList(u),a);
        assertEquals(1,result.validCount());assertEquals(1,result.unknownIds.size());assertEquals(1,result.plansById.size());
    }
    @Test public void duplicateIdsInvalidateEvenWhenThirdDuplicateIsValid() throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms(4);
        String row="{\"id\":\"w0\",\"segments\":[[\"word0 word1 word2 word3\",\"完整的字幕翻译\"]]}";
        ContextualBatchApiClient.Result r=ContextualBatchApiClient.parseAnchored(
          "{\"translations\":["+row+","+row+","+row+"]}",Collections.singletonList(unit(a)),a);
        assertEquals(0,r.validCount());assertTrue(r.plansById.isEmpty());
    }
    @Test public void windowCoverageIsTotalBoundedAndDeterministic() {
        for(int n=1;n<400;n++) {
            List<SourceAtomTimeline.Atom> a=atoms(n);
            SourceAtomTimeline.Result source=new SourceAtomTimeline.Result(a,n,n,0,true,false);
            TranslationUnitTimeline.Result r=AnchoredWindowPlanner.build(source);
            int next=0;
            for(TranslationUnitTimeline.Unit u:r.units) {
                assertEquals(next,u.fromAtom);assertTrue(u.toAtom-u.fromAtom+1<=48);
                assertTrue(u.endMs-u.startMs<=12000);next=u.toAtom+1;
            }
            assertEquals(n,next);
            assertEquals(r.units.size(),AnchoredWindowPlanner.build(source).units.size());
        }
    }
    @Test public void appendTextIsNotDroppedAndOffsetsSurvive() throws Exception {
        String json="{\"events\":[{\"tStartMs\":1000,\"dDurationMs\":1500,\"segs\":["
          +"{\"utf8\":\"hello \",\"tOffsetMs\":0},{\"utf8\":\"world\",\"tOffsetMs\":400}]},"
          +"{\"aAppend\":1,\"tStartMs\":2500,\"dDurationMs\":1000,\"segs\":[{\"utf8\":\"again\",\"tOffsetMs\":0}]},"
          +"{\"aAppend\":1,\"tStartMs\":3500,\"segs\":[{\"utf8\":\"\\n\"}]}]}";
        byte[] bytes=json.getBytes(StandardCharsets.UTF_8);
        CaptionDocument.Parsed d=CaptionDocument.parse(bytes,"application/json");
        assertEquals(2,d.cues().size());
        SourceAtomTimeline.Result r=SourceAtomTimeline.build(bytes,d);
        assertEquals(3,r.atoms.size());assertEquals(1400,r.atoms.get(1).startMs);
        assertEquals("again",r.atoms.get(2).text);assertEquals(3,r.nativeTimedAtoms);
    }
    @Test public void noTimingGeneratedFromTranslationLength() throws Exception {
        List<SourceAtomTimeline.Atom> a=atoms(4);
        AnchoredCaptionPlan shortP=AnchoredCaptionPlan.parse(new JSONArray("[[3,\"这是完整的翻译\"]]"),a,unit(a));
        AnchoredCaptionPlan longP=AnchoredCaptionPlan.parse(new JSONArray("[[3,\"这是一段明显更长但是使用相同时间锚点的翻译文本\"]]"),a,unit(a));
        assertEquals(shortP.segments.get(0).startMs,longP.segments.get(0).startMs);
        assertEquals(shortP.segments.get(0).endMs,longP.segments.get(0).endMs);
    }
    @Test public void punctuationDoesNotFuseEnglishWords() {
        List<SourceAtomTimeline.Atom> a=Arrays.asList(new SourceAtomTimeline.Atom(0,100,"Hello,",0,true),
            new SourceAtomTimeline.Atom(100,200,"world!",0,true));
        assertEquals("Hello, world!",SourceAtomTimeline.join(a,0,1));
    }
    @Test public void signedCalibrationShiftsBothDirections() throws Exception {
        byte[] b="{\"events\":[{\"tStartMs\":1000,\"dDurationMs\":500,\"segs\":[{\"utf8\":\"test\"}]}]}".getBytes(StandardCharsets.UTF_8);
        assertEquals(2000,new JSONObject(new String(CaptionTimingCalibrator.shiftJson3(b,-1000),StandardCharsets.UTF_8))
            .getJSONArray("events").getJSONObject(0).getLong("tStartMs"));
        assertEquals(0,new JSONObject(new String(CaptionTimingCalibrator.shiftJson3(b,2000),StandardCharsets.UTF_8))
            .getJSONArray("events").getJSONObject(0).getLong("tStartMs"));
    }
}
