package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.widget.TextView;
import java.io.*;
import java.lang.reflect.Field;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.*;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Runs on the actual N28A product and N28B product with identical inputs and assertions. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildIntegrationTest.Keys.class,RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class N28BLegacyGoldenTest {
  @Test public void actualEnglishRegionsAndChineseTargetSpellingsRetainFullGoldenEvidence() throws Exception {
    JSONArray evidence=new JSONArray();
    for(String source:new String[]{"en","en-US","en-GB"})
      for(String target:new String[]{"zh-Hans","zh-Hant","zh-CN","zh-TW","zh_Hans","zh-Hant-TW"}) {
        RebuildIntegrationTest h=new RebuildIntegrationTest();h.setup();
        try {
          RebuildLayoutTest.bounds=new android.graphics.Rect(0,0,600,340);RebuildLayoutTest.shorts=false;
          h.a.getResources().getDisplayMetrics().widthPixels=1264;
          h.a.getResources().getDisplayMetrics().heightPixels=2736;
          DeepSeekConfig.saveCaptionSizeTier(h.a,2);
          h.server.shutdown();h.server=new MockWebServer();h.server.start(18729);
          DeepSeekConfig.saveBaseUrl(h.a,"http://localhost:18729/v1");
          List<String> bodies=Collections.synchronizedList(new ArrayList<>());
          h.server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r){
            try {
              h.calls.incrementAndGet();String body=r.getBody().readUtf8();bodies.add(body);
              JSONObject input=new JSONObject(new JSONObject(body).getJSONArray("messages").getJSONObject(1).getString("content"));
              JSONArray words=input.getJSONArray("owned_tokens");
              JSONObject event=new JSONObject().put("from",words.getJSONArray(0).getInt(0))
                  .put("to",words.getJSONArray(words.length()-1).getInt(0))
                  .put("source",input.getString("source_text")).put("text","这是一条完整的测试字幕。");
              JSONObject plan=new JSONObject().put("block",input.getString("block")).put("events",new JSONArray().put(event));
              return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
                  .put("finish_reason","stop").put("message",new JSONObject().put("content",plan.toString())))).toString());
            }catch(Exception e){return new MockResponse().setResponseCode(500);}
          }});
          String url="https://www.youtube.com/api/timedtext?v=rebuild0001&lang="+source+"&kind=asr&tlang="+target;
          RebuildController.activate(h.a,url,false,true);RebuildController.Session s=h.session();
          h.await(()->s.states!=null && s.states[0]==RebuildController.READY);
          h.await(()->CaptionDiagnostics.fullText(h.a).contains("REBUILD_EVENTS_ACCEPTED | block=0;events=1;session="+s.id+";"));
          h.advance(300);RebuildController.time(0);h.advance(300);
          assertEquals(1,h.calls.get());
          RebuildController.activate(h.a,url+"&signature=rotated&expire=22",false,true);
          assertSame(s,h.session());h.advance(300);assertEquals(1,h.calls.get());
          JSONArray tokens=new JSONArray(),blocks=new JSONArray(),events=new JSONArray(),pages=new JSONArray();
          for(RebuildSource.Word w:s.source.words)tokens.put(new JSONArray().put(w.text).put(w.key).put(w.start).put(w.end).put(w.cue).put(w.precision));
          for(RebuildPlanner.Block b:s.blocks)blocks.put(new JSONArray().put(b.id()).put(b.start).put(b.end).put(b.continuedBefore).put(b.continuedAfter));
          for(RebuildProtocol.Plan p:s.plans)for(RebuildProtocol.Event e:p.events)events.put(new JSONArray().put(e.from).put(e.to).put(e.start).put(e.end).put(e.text));
          Field f=CaptionOverlay.class.getDeclaredField("textRef");f.setAccessible(true);
          TextView view=((WeakReference<TextView>)f.get(null)).get();assertNotNull(view);
          assertEquals("这是一条完整的测试字幕。",view.getText().toString());
          f=CaptionOverlay.class.getDeclaredField("pendingPages");f.setAccessible(true);
          for(RebuildPageLayout.Page p:(List<RebuildPageLayout.Page>)f.get(null))pages.put(new JSONArray().put(p.text).put(p.start).put(p.end));
          JSONObject row=new JSONObject().put("source",source).put("target_input",target).put("target",s.target)
              .put("request_json",new JSONArray(bodies)).put("identity",s.identity).put("cache_key",s.cacheKey)
              .put("source_key",SourceCaptionCache.key(CaptionEngine.sourceCaptionUrl(url)))
              .put("tokens",tokens).put("blocks",blocks).put("events",events).put("pages",pages)
              .put("text",view.getText()).put("font_px",view.getTextSize()).put("network_calls",h.calls.get());
          RebuildController.stop();RebuildController.activate(h.a,url,false,true);RebuildController.Session warm=h.session();
          h.await(()->warm.plans!=null && warm.plans[0]!=null);assertEquals(0,warm.attempts[0]);assertEquals(1,h.calls.get());
          row.put("warm_cache_key",warm.cacheKey).put("warm_attempts",warm.attempts[0]);evidence.put(row);
        }finally{h.cleanup();}
      }
    String dir=System.getenv("N28B_EVIDENCE_DIR");
    if(dir!=null){File folder=new File(dir);folder.mkdirs();try(FileOutputStream out=new FileOutputStream(new File(folder,"legacy-region-golden.json"))){out.write(evidence.toString(2).getBytes(StandardCharsets.UTF_8));}}
  }
}
