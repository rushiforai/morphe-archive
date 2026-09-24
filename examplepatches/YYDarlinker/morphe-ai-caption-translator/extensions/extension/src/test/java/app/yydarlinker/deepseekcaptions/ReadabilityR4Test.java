package app.yydarlinker.deepseekcaptions;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.*;
import java.nio.charset.StandardCharsets;
public class ReadabilityR4Test {
    AnchoredCaptionPlan.Segment s(int from,int to,long start,long end,String text){return new AnchoredCaptionPlan.Segment(from,to,start,end,text);}
    @Test public void flashMergesBeforeDisplayWithoutTrimmingSpeech(){
        List<AnchoredCaptionPlan.Segment> out=ReadableCaptionPlan.merge(Arrays.asList(s(0,3,0,3000,"完整的一句话。"),s(4,4,3000,3300,"是的"),s(5,8,3300,6500,"然后是下一句话。")));
        assertEquals(2,out.size());assertEquals(0,out.get(0).startMs);assertEquals(3300,out.get(0).endMs);
        assertTrue(out.get(0).text.contains("是的"));assertEquals(4,out.get(0).to);
    }
    @Test public void initialFlashAttachesForward(){
        List<AnchoredCaptionPlan.Segment> out=ReadableCaptionPlan.merge(Arrays.asList(s(0,0,1000,1250,"但是"),s(1,4,1250,4500,"情况并非如此。")));
        assertEquals(1,out.size());assertEquals(1000,out.get(0).startMs);assertEquals(4500,out.get(0).endMs);
    }
    @Test public void silenceAndOversizedCaptionsAreNotMerged(){
        assertEquals(2,ReadableCaptionPlan.merge(Arrays.asList(s(0,0,0,200,"好"),s(1,4,1000,4000,"这是另一句话。"))).size());
        assertEquals(2,ReadableCaptionPlan.merge(Arrays.asList(s(0,0,0,200,"好"),s(1,4,200,14000,"这是另一句话。"))).size());
        assertEquals("Hello. Yes",ReadableCaptionPlan.join("Hello.","Yes"));
    }
    SourceAtomTimeline.Result atoms(String... words){
        List<SourceAtomTimeline.Atom> atoms=new ArrayList<>();
        for(int i=0;i<words.length;i++)atoms.add(new SourceAtomTimeline.Atom(i*500,(i+1)*500,words[i],i,false));
        return new SourceAtomTimeline.Result(atoms,words.length,0,words.length,false,false);
    }
    @Test public void userReportedModelIsProtectedBeforeWindows(){
        SourceAtomTimeline.Result result=ModelNameProtection.protect(atoms("GPT","5.","6","Soul.","And","we","continue."));
        assertEquals("GPT 5.6 Sol.",result.atoms.get(0).text);assertEquals(0,result.atoms.get(0).startMs);assertEquals(2000,result.atoms.get(0).endMs);
        for(TranslationUnitTimeline.Unit u:AnchoredWindowPlanner.build(result).units) assertFalse(u.sourceText.startsWith("6 Soul"));
        assertEquals("GPT 5.6 Sol",ModelNameProtection.restore("GPT 5.6 Sol","gpt5。6 灵魂"));
    }
    @Test public void ordinarySoulIsNotRewritten(){
        assertEquals("灵魂",ModelNameProtection.restore("the human soul","灵魂"));
        assertEquals("the human soul",ModelNameProtection.normalize("the human soul"));
    }
    @Test public void splitDeepseekVersionRetainsItsVariant(){
        SourceAtomTimeline.Result result=ModelNameProtection.protect(atoms("Deepseek","V4.","1","Flash","is","here."));
        assertEquals("Deepseek V4.1 Flash",result.atoms.get(0).text);
    }
    @Test public void json3RequestPreservesSignedBytesAndNeverRewritesSignedFormat(){
        assertEquals("https://www.youtube.com/api/timedtext?v=x&sig=A%2FB&fmt=json3#keep",SourceFormatPolicy.json3("https://www.youtube.com/api/timedtext?v=x&fmt=srv3&sig=A%2FB#keep"));
        String signed="https://www.youtube.com/api/timedtext?v=x&fmt=srv3&sparams=v%2Cfmt";
        assertEquals(signed,SourceFormatPolicy.json3(signed));
    }
    @Test public void firstJson3WordHasNativeZeroOffsetWhenFollowingOffsetsExist() throws Exception {
        byte[] b="{\"events\":[{\"tStartMs\":1000,\"dDurationMs\":2000,\"segs\":[{\"utf8\":\"Hello \"},{\"utf8\":\"world\",\"tOffsetMs\":750}]}]}".getBytes(StandardCharsets.UTF_8);
        SourceAtomTimeline.Result result=SourceAtomTimeline.build(b,CaptionDocument.parse(b,"application/json"));
        assertEquals(2,result.nativeTimedAtoms);assertEquals(1750,result.atoms.get(0).endMs);assertEquals(1750,result.atoms.get(1).startMs);
    }
    @Test public void keyInputDoesNotAdvertisePasswordToIme(){
        assertEquals(0,CaptionInputPolicy.keyInputType() & android.text.InputType.TYPE_MASK_VARIATION);
        assertEquals(android.text.InputType.TYPE_CLASS_TEXT,CaptionInputPolicy.keyInputType() & android.text.InputType.TYPE_MASK_CLASS);
    }
    @Test public void briefBoundaryCanJoinOnlyBeforeItStarts(){
        AnchoredCaptionPlan a=AnchoredCaptionPlan.source(1000,1300,"但是");
        AnchoredCaptionPlan b=AnchoredCaptionPlan.source(1300,4000,"情况并非如此。");
        List<AnchoredCaptionPlan.Segment> joined=CrossWindowReadability.merge(a,b,0,1,500);
        assertEquals(1,joined.size());assertEquals(4000,joined.get(0).endMs);
        assertTrue(CrossWindowReadability.merge(a,b,0,1,1400).isEmpty());
    }

}
