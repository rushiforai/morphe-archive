package app.yydarlinker.deepseekcaptions;
import org.junit.Test;
import org.json.*;
import java.util.*;
import java.nio.charset.StandardCharsets;
import static org.junit.Assert.*;
public class ContinuityR3Test {
    List<SourceAtomTimeline.Atom> atoms(){return Arrays.asList(new SourceAtomTimeline.Atom(0,1000,"Hello",0,true),new SourceAtomTimeline.Atom(1000,2000,"world",0,true));}
    TranslationUnitTimeline.Unit unit(){return new TranslationUnitTimeline.Unit(0,"w0",0,1,0,0,0,2000,"Hello world",TranslationUnitTimeline.Confidence.HIGH,"test");}
    @Test public void exactIdsArePrintedNotImplicitCounts() throws Exception {
        JSONArray a=AnchoredCaptionPlan.tokens(atoms(),unit());
        assertEquals(0,a.getJSONArray(0).getInt(0));assertEquals("world",a.getJSONArray(1).getString(1));
    }
    @Test public void losslessRepresentationVariantsDoNotSpendAnotherRequest() throws Exception {
        for(String rows:Arrays.asList("[[1,\"你好世界\"]]","[[\"1\",\"你好世界\"]]","[[1.0,\"你好世界\"]]",
                "[{\"end_id\":1,\"text\":\"你好世界\"}]","[[0,1,\"你好世界\"]]")) {
            AnchoredCaptionPlan p=AnchoredCaptionPlan.parse(new JSONArray(rows),atoms(),unit());
            assertEquals(2000,p.segments.get(0).endMs);assertEquals("你好世界",p.canonical);
        }
    }
    @Test public void coverageQualityAndTimingGuardsRemainStrict() throws Exception {
        for(String rows:Arrays.asList("[[2,\"你好世界\"]]","[[0,\"你好\"]]","[[1.5,\"你好世界\"]]","[[1,1,\"你好世界\"]]","[[1,\"\"]]")) {
            try{AnchoredCaptionPlan.parse(new JSONArray(rows),atoms(),unit());fail(rows);}catch(IllegalArgumentException expected){}
        }
    }
    @Test public void rejectionHasReasonWithoutLeakingText() throws Exception {
        ContextualBatchApiClient.Result r=ContextualBatchApiClient.parseAnchored("{\"translations\":[{\"id\":\"w0\",\"segments\":[[5,\"private response\"]]}]}",Collections.singletonList(unit()),atoms());
        assertEquals(0,r.validCount());assertTrue(r.rejectionReasons.get("w0").contains("source_phrase_object_required"));
        assertFalse(r.rejectionReasons.toString().contains("private"));
    }
    @Test public void incidentalFenceIsTransportNotTranslationFailure() throws Exception {
        String raw="```json\n{\"translations\":[{\"id\":\"w0\",\"segments\":[[\"Hello world\",\"你好世界\"]]}]}\n```";
        assertEquals(1,ContextualBatchApiClient.parseAnchored(raw,Collections.singletonList(unit()),atoms()).validCount());
    }
    @Test public void contextIsBoundedOnBothSides(){
        String longText=String.join(" ",Collections.nCopies(100,"context"));
        assertTrue(ContextualBatchApiClient.boundedContext(Arrays.asList(longText),true).length()<=160);
        assertTrue(ContextualBatchApiClient.boundedContext(Arrays.asList(longText),false).length()<=160);
    }
    @Test public void coTimedAtomsDoNotCreateOverlappingArtificialMilliseconds() throws Exception {
        String text="{\"events\":[{\"tStartMs\":1000,\"dDurationMs\":2000,\"segs\":[{\"utf8\":\"Hello \",\"tOffsetMs\":0},{\"utf8\":\"world\",\"tOffsetMs\":0},{\"utf8\":\" again\",\"tOffsetMs\":1000}]}]}";
        byte[] b=text.getBytes(StandardCharsets.UTF_8);
        SourceAtomTimeline.Result r=SourceAtomTimeline.build(b,CaptionDocument.parse(b,"application/json"));
        assertEquals(2,r.atoms.size());assertEquals("Hello world",r.atoms.get(0).text);
        assertTrue(r.atoms.get(0).endMs<=r.atoms.get(1).startMs);
    }
    @Test public void callbackJitterCannotReplayPreviousSubtitleSlice(){
        PlaybackClockEstimator c=new PlaybackClockEstimator();c.reset(10000,1000,1);
        long predicted=c.estimate(1900);c.update(10850,2000,2900);
        assertTrue(c.estimate(2000)>=predicted);
        c.update(5000,3000,2900);assertEquals(5000,c.estimate(3000));
    }
    @Test public void duplicateCallbacksDoNotPauseClock(){
        PlaybackClockEstimator c=new PlaybackClockEstimator();c.reset(10000,1000,1);
        c.update(10000,1030,2900);assertTrue(c.playbackRate()>0);
        assertTrue(c.estimate(1080)>10000);
    }
    @Test public void apiBreadcrumbExceptionIsScoped(){
        assertTrue(ApiInputPolicy.owns("deepseek_caption_api_key"));assertTrue(ApiInputPolicy.owns("deepseek_caption_base_url"));
        assertTrue(ApiInputPolicy.owns("deepseek_caption_model"));assertFalse(ApiInputPolicy.owns("morphe_debug"));
    }
    @Test public void previewAndPlayerUseSameRelativeFontAndAlpha(){
        assertEquals(0,SubtitleStyleMetrics.alpha(0));assertEquals(255,SubtitleStyleMetrics.alpha(100));
        assertEquals(179,SubtitleStyleMetrics.alpha(70));
        float expected=SubtitleStyleMetrics.scaledSp(18,360)*3/1080*180;
        assertEquals(expected,SubtitleStyleMetrics.previewTextPx(18,1080,3,3,180),.001f);
        assertEquals(2*expected,SubtitleStyleMetrics.previewTextPx(36,1080,3,3,180),.001f);
    }
    private CaptionDocument.Parsed track(final long offset,final long jitter) {
        final List<CaptionDocument.Cue> cues=new ArrayList<>();
        for(int i=0;i<24;i++) {
            long start=10000+i*2000+offset+(i%2==0 ? jitter : -jitter);
            cues.add(new CaptionDocument.Cue(start,start+1500,"alpha"+i+" beta"+i+" gamma"+i+" delta"+i));
        }
        return new CaptionDocument.Parsed() {
            public List<CaptionDocument.Cue> cues(){return cues;}
            public List<String> texts(){List<String> t=new ArrayList<>();for(CaptionDocument.Cue c:cues)t.add(c.text);return t;}
            public String contentType(){return "text/plain";}
            public byte[] render(List<String> t){return new byte[0];}
        };
    }
    @Test public void noisySubsecondOffsetIsNotAppliedAsCertainTiming(){
        assertFalse(CaptionTimingCalibrator.compare(track(-800,500),track(0,0)).apply);
        assertTrue(CaptionTimingCalibrator.compare(track(2000,50),track(0,0)).apply);
    }
    @Test public void independentSwitchesDoNotPretendToBeOfficialSettings(){
        assertFalse(android.preference.SwitchPreference.class.isAssignableFrom(DeepSeekEnabledPreference.class));
        assertFalse(android.preference.SwitchPreference.class.isAssignableFrom(DeepSeekDisplayTextDebugPreference.class));
    }

}
