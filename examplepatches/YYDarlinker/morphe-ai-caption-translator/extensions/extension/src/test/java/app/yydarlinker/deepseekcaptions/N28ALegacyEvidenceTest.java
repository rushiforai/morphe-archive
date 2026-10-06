package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.ref.WeakReference;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Runs unchanged on N26 and N28A. Expected evidence is captured before product edits. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, shadows={RebuildIntegrationTest.Keys.class,RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class N28ALegacyEvidenceTest {
  @Test public void configuredOriginalSessionsAndAiDisabledNeverCallProvider() throws Exception {
    RebuildIntegrationTest h=new RebuildIntegrationTest();h.setup();
    try {
      assertTrue(DeepSeekConfig.load(h.a).ready());
      for(String target:new String[]{"en","zh-Hans"}) {
        RebuildController.stop();CaptionChoice.select(target,true,true);
        h.start(true);RebuildController.Session s=h.session();
        h.await(()->s.raw!=null);assertTrue(s.sourceOnly);assertEquals(target,s.target);
        h.advance(500);assertEquals(0,h.calls.get());
      }
      RebuildController.stop();DeepSeekConfig.saveEnabled(h.a,false);
      h.start(false);assertNull(h.session());h.advance(500);assertEquals(0,h.calls.get());
    } finally {h.cleanup();}
  }
  @Test public void actualActivateRequestCacheTokensAndPresentationEvidence() throws Exception {
    RebuildIntegrationTest h = new RebuildIntegrationTest();
    h.setup();
    try {
      RebuildLayoutTest.bounds=new android.graphics.Rect(0,0,600,340);RebuildLayoutTest.shorts=false;
      h.a.getResources().getDisplayMetrics().widthPixels=1264;
      h.a.getResources().getDisplayMetrics().heightPixels=2736;
      DeepSeekConfig.saveCaptionSizeTier(h.a,2);
      // A fixed loopback endpoint keeps the real config/cache fingerprint reproducible across runs.
      h.server.shutdown();
      h.server = new MockWebServer();
      h.server.start(18728);
      DeepSeekConfig.saveBaseUrl(h.a, "http://localhost:18728/v1");
      List<String> requests = Collections.synchronizedList(new ArrayList<>());
      h.server.setDispatcher(new Dispatcher() {
        public MockResponse dispatch(RecordedRequest r) {
          try {
            h.calls.incrementAndGet();
            String body = r.getBody().readUtf8(); requests.add(body);
            JSONObject input = new JSONObject(new JSONObject(body).getJSONArray("messages").getJSONObject(1).getString("content"));
            JSONArray words = input.getJSONArray("owned_tokens");
            JSONObject event = new JSONObject().put("from", words.getJSONArray(0).getInt(0))
                .put("to", words.getJSONArray(words.length()-1).getInt(0))
                .put("source", input.getString("source_text")).put("text", "这是一条完整的测试字幕。");
            String content = new JSONObject().put("block", input.getString("block"))
                .put("events", new JSONArray().put(event)).toString();
            return new MockResponse().setBody(new JSONObject().put("choices", new JSONArray().put(
                new JSONObject().put("finish_reason", "stop").put("message", new JSONObject().put("content", content)))).toString());
          } catch(Exception e) { return new MockResponse().setResponseCode(500); }
        }
      });
      h.start(false);
      RebuildController.Session s = h.session();
      h.await(() -> s.states != null && s.states[0] == RebuildController.READY);
      h.advance(300); RebuildController.time(0); h.advance(300);
      assertEquals(1, h.calls.get());
      String identity = s.identity, cache = s.cacheKey;
      RebuildController.activate(h.a,"https://www.youtube.com/api/timedtext?v=rebuild0001&lang=en&kind=asr&tlang=zh-Hans&signature=new",false,true);
      assertSame(s, h.session()); assertEquals(identity, s.identity); assertEquals(cache, s.cacheKey);
      h.advance(500); assertEquals(1,h.calls.get());
      JSONObject evidence = new JSONObject().put("request_json", new JSONArray(requests))
          .put("prompt",RebuildProtocol.PROMPT).put("fidelity_prompt",RebuildProtocol.FIDELITY_PROMPT)
          .put("prompt_hash",RebuildCache.hash(RebuildProtocol.PROMPT))
          .put("fidelity_hash",RebuildCache.hash(RebuildProtocol.FIDELITY_PROMPT))
          .put("identity",s.identity).put("cache_key",s.cacheKey).put("target",s.target)
          .put("source_key",SourceCaptionCache.key(CaptionEngine.sourceCaptionUrl(s.url)))
          .put("translation_calls",h.calls.get()).put("source_gets",h.engine.gets);
      JSONArray tokens=new JSONArray(),blocks=new JSONArray(),events=new JSONArray();
      for(RebuildSource.Word w:s.source.words) tokens.put(new JSONArray().put(w.text).put(w.key).put(w.start).put(w.end).put(w.cue).put(w.precision.name()));
      for(RebuildPlanner.Block b:s.blocks) blocks.put(new JSONArray().put(b.id()).put(b.from).put(b.to).put(b.start).put(b.end).put(b.continuedBefore).put(b.continuedAfter));
      for(RebuildProtocol.Plan p:s.plans) if(p!=null) for(RebuildProtocol.Event e:p.events) events.put(new JSONArray().put(e.from).put(e.to).put(e.text).put(e.start).put(e.end));
      evidence.put("tokens",tokens).put("blocks",blocks).put("events",events);
      Field f=CaptionOverlay.class.getDeclaredField("textRef");f.setAccessible(true);
      TextView view=((WeakReference<TextView>)f.get(null)).get();
      assertNotNull(view);assertEquals("这是一条完整的测试字幕。",view.getText().toString());
      Field pagesField=CaptionOverlay.class.getDeclaredField("pendingPages");pagesField.setAccessible(true);
      JSONArray pages=new JSONArray();
      for(RebuildPageLayout.Page page:(List<RebuildPageLayout.Page>)pagesField.get(null)) pages.put(new JSONArray().put(page.text).put(page.start).put(page.end));
      assertEquals(1,pages.length());evidence.put("pages",pages);
      evidence.put("display_text",view.getText().toString()).put("text_size_px",view.getTextSize());
      String dir=System.getenv("N28A_EVIDENCE_DIR");
      if(dir!=null) { File folder=new File(dir);folder.mkdirs();try(FileOutputStream out=new FileOutputStream(new File(folder,"legacy-activate.json"))) {out.write(evidence.toString(2).getBytes(java.nio.charset.StandardCharsets.UTF_8));} }
    } finally { h.cleanup(); }
  }
}
