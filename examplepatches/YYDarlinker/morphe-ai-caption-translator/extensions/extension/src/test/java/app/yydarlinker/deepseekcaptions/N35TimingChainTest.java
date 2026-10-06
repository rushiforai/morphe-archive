package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.nio.charset.StandardCharsets;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

/** Pure evidence/clock contracts for the N35 timing seam. */
public class N35TimingChainTest {
  private static RebuildSource source(String json) throws Exception {
    byte[] body=json.getBytes(StandardCharsets.UTF_8);
    CaptionDocument.Parsed parsed=CaptionDocument.parse(body,"application/json");
    return RebuildSource.read(body,parsed);
  }
  private static String json3(JSONArray events) throws Exception {return new JSONObject().put("events",events).toString();}

  @Test public void partialSegmentOffsetsRemainObservableAndRetimingIsLocal() throws Exception {
    JSONArray primaryEvents=new JSONArray().put(new JSONObject().put("tStartMs",0).put("dDurationMs",3000)
        .put("segs",new JSONArray().put(new JSONObject().put("utf8","one two three four five six"))));
    JSONArray refSegs=new JSONArray()
        .put(new JSONObject().put("tOffsetMs",0).put("utf8","one two"))
        .put(new JSONObject().put("tOffsetMs",800).put("utf8"," three four"))
        .put(new JSONObject().put("tOffsetMs",1600).put("utf8"," five six"));
    JSONArray refEvents=new JSONArray().put(new JSONObject().put("tStartMs",100).put("dDurationMs",3000).put("segs",refSegs));
    RebuildSource primary=source(json3(primaryEvents)),reference=source(json3(refEvents));
    assertEquals(0,primary.nativeWordCount());
    assertTrue(reference.segmentAnchorCount()>=3);
    RebuildSource adopted=primary.align(reference);
    assertEquals(RebuildSource.Precision.ESTIMATED,adopted.words.get(0).precision);
    assertTrue("first segment onset should follow the observed boundary",adopted.words.get(0).start>0);
    assertTrue(adopted.words.get(2).start>=adopted.words.get(1).end);
    assertTrue(adopted.precisionEvidence().contains("segment_anchors="));
  }

  @Test public void registryKeepsSameLanguageVariantsBoundedly() {
    NativeAsrTrackReference.clear();
    NativeAsrTrackReference.remember("en","a.rich","https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&kind=asr&variant=rich");
    NativeAsrTrackReference.remember("en","a.coarse","https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&kind=asr&variant=coarse");
    List<String> candidates=NativeAsrTrackReference.candidates("abcdefghijk","en-US");
    assertEquals(2,candidates.size());
    assertTrue(candidates.get(0).contains("rich"));
    assertTrue(candidates.get(1).contains("coarse"));
  }

  @Test public void freshMediaProjectionUsesSamplingOriginAndNoArtificialCap() {
    RebuildClock clock=new RebuildClock();clock.reset(1_000);
    clock.updateHook(22_000,11_000);
    clock.acceptMedia(20_000,10_000,11_000,2f,3);
    assertEquals(22_080,clock.current(11_040));
    assertEquals(RebuildClock.FRESH_MEDIA_ESTIMATE,clock.source());
  }

  @Test public void nativeAndHookJumpAreNotTwoSeekEvents() {
    RebuildClock clock=new RebuildClock();clock.reset(1_000);
    clock.updateHook(1_000,1_000);
    assertTrue(clock.acceptNative("video",1_000,1_010,3,1f).seek==false);
    assertTrue(clock.acceptNative("video",21_000,1_200,3,1f).seek);
    assertFalse("older hook acknowledgement must not create a second seek",clock.updateHook(21_000,1_220).seek);
  }
}