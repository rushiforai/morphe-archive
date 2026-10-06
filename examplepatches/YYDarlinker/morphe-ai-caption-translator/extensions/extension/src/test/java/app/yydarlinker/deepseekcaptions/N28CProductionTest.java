package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.media.session.*;
import android.view.View;
import android.widget.TextView;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.*;
import java.util.concurrent.*;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Local fixture HTTP -> actual activate/job/parse/review/cache/overlay/TextView; not remote translation. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildIntegrationTest.Keys.class,RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N28CProductionTest {
  RebuildIntegrationTest h;
  volatile String translated="A complete sentence stays visible.";
  volatile CountDownLatch gate;
  volatile boolean oldArrived;
  final List<String> requests=Collections.synchronizedList(new ArrayList<>());
  final JSONArray trace=new JSONArray();
  @Before public void setup()throws Exception {
    h=new RebuildIntegrationTest();h.setup();h.a.getApplicationInfo().flags|=android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;
    RebuildLayoutTest.bounds=new Rect(0,0,600,340);RebuildLayoutTest.shorts=false;
    h.a.getResources().getDisplayMetrics().widthPixels=1264;h.a.getResources().getDisplayMetrics().heightPixels=2736;
    DeepSeekConfig.saveCaptionSizeTier(h.a,2);
    h.server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r){
      try {
        h.calls.incrementAndGet();String body=r.getBody().readUtf8();requests.add(body);
        JSONObject payload=new JSONObject(new JSONObject(body).getJSONArray("messages").getJSONObject(1).getString("content"));
        String text=translated;
        if(gate!=null && payload.getString("language").equals("ar")) {oldArrived=true;gate.await(10,TimeUnit.SECONDS);text="OLD_SCOPE_ONLY";}
        JSONArray tokens=payload.getJSONArray("owned_tokens");JSONObject event=new JSONObject().put("from",tokens.getJSONArray(0).getInt(0))
            .put("to",tokens.getJSONArray(tokens.length()-1).getInt(0)).put("source",payload.getString("source_text")).put("text",text);
        String plan=new JSONObject().put("block",payload.getString("block")).put("events",new JSONArray().put(event)).toString();
        return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("finish_reason","stop").put("message",new JSONObject().put("content",plan)))).toString());
      }catch(Exception e){return new MockResponse().setResponseCode(500);}
    }});
  }
  @After public void cleanup()throws Exception {if(gate!=null)gate.countDown();h.cleanup();}
  String url(String source,String target){return "https://www.youtube.com/api/timedtext?v=rebuild0001&kind=asr"+(source==null?"":"&lang="+source)+"&tlang="+target;}
  void source(String text,long end)throws Exception {h.engine.fixtureBody=new JSONObject().put("events",new JSONArray().put(RebuildR2SourceTest.cue(0,end,text,false))).toString();}
  RebuildController.Session start(String source,String target)throws Exception {
    RebuildController.activate(h.a,url(source,target),false,true);RebuildController.Session s=h.session();assertNotNull(s);return s;
  }
  void ready(RebuildController.Session s)throws Exception {
    h.await(()->s.plans!=null && s.plans[0]!=null && s.states[0]==RebuildController.READY);
    h.advance(100);RebuildController.time(0);h.advance(1);
  }
  Object field(String name)throws Exception {return RebuildIntegrationTest.field(null,CaptionOverlay.class,name);}
  TextView view()throws Exception {return (TextView)((WeakReference<?>)field("textRef")).get();}
  @SuppressWarnings("unchecked") List<RebuildPageLayout.Page> pages()throws Exception {return (List<RebuildPageLayout.Page>)field("pendingPages");}
  void ui(String locale) {
    android.util.DisplayMetrics saved=new android.util.DisplayMetrics();saved.setTo(h.a.getResources().getDisplayMetrics());
    Configuration cfg=new Configuration(h.a.getResources().getConfiguration());cfg.setLocale(Locale.forLanguageTag(locale));h.a.getResources().updateConfiguration(cfg,saved);
    h.a.getResources().getDisplayMetrics().setTo(saved);
  }
  void presented(RebuildController.Session s)throws Exception {
    assertSame(s.languageContext.renderSpec,field("pendingRenderSpec"));
    RebuildProtocol.Event e=s.plans[0].events.get(0);
    if(pages().isEmpty()) {
      assertFalse(s.languageContext.renderSpec.legacy);
      assertFalse(s.languageContext.renderSpec.fits(e.text,CaptionOverlay.budget().preferredPx,CaptionOverlay.budget().width,2));
      assertEquals("",view().getText().toString());
      assertTrue(CaptionDiagnostics.fullText(h.a).contains("page_time_capacity_unresolved"));
      assertEquals(0,s.repairCount);return;
    }StringBuilder text=new StringBuilder();long at=e.start;
    for(RebuildPageLayout.Page p:pages()) {assertEquals(at,p.start);assertTrue(p.end<=e.end);assertTrue(p.end>p.start);if(!s.languageContext.renderSpec.legacy && pages().size()>1)assertTrue(p.end-p.start>=1200);at=p.end;text.append(p.text);}
    if(!s.languageContext.renderSpec.legacy && e.end-e.start<1200)assertEquals(1,pages().size());assertEquals(e.end,at);assertEquals(e.text,text.toString());assertFalse(view().getText().toString().isEmpty());assertTrue(view().getLineCount()<=2);
  }
  void row(RebuildController.Session s,String ui,int calls,boolean cache)throws Exception {
    CaptionRenderSpec spec=s.languageContext.renderSpec;RebuildProtocol.Event e=s.plans[0].events.get(0);
    trace.put(new JSONObject().put("source_code",s.languageContext.sourceCode).put("target_code",s.languageContext.targetCode)
        .put("ui_locale",ui).put("profile_id",spec.profile.id).put("direction",spec.direction).put("presentation_policy",spec.presentationPolicy)
        .put("reading_units",spec.readingUnits(e.text)).put("line_units",(pages().isEmpty()?0:spec.lineUnits(view().getText().toString(),view().getLayout())))
        .put("max_lines",2).put("actual_width_px",(pages().isEmpty()?0:spec.actualWidth(view().getLayout()))).put("line_count",pages().isEmpty()?0:view().getLineCount())
        .put("soft_reading_target",spec.profile.referenceCps).put("soft_cpl_target",spec.profile.referenceCpl)
        .put("event_text",e.text).put("safe_blank",pages().isEmpty()).put("event_start",e.start).put("event_end",e.end).put("pages",N28CGeometryTest.pageRows(pages()))
        .put("cache",cache).put("provider_calls",calls).put("cache_key",s.cacheKey).put("scope",s.languageContext.scope())
        .put("prompt_hash",RebuildCache.hash(RebuildApi.prompt(s.config,s.target,s.languageContext))).put("remote_translation_calls",0));
  }
  void export(String name)throws Exception {N28CGeometryTest.export(name+"-production-trace.json",new JSONObject().put("rows",trace));}
  @Test public void fixedFourteenTargetsPassActualColdAndHotPresentation()throws Exception {
    String[][] matrix={
      {"en","zh-Hans","这是一条完整的测试字幕。"},{"en","zh-Hant","這是一條完整的測試字幕。"},
      {"en","ja","これは完全な字幕の表示テストです。"},{"en","ko","완전한 자막 표시를 확인합니다."},
      {"en","en","This complete caption is readable and keeps all of its original words."},
      {"en","es","Esta frase completa permanece visible."},{"ja","fr","Une phrase complète reste lisible et conserve tous ses mots."},
      {"en","de","Die Donaudampfschifffahrtsgesellschaft bleibt sichtbar."},
      {"en","pt-BR","Esta legenda completa permanece visível."},{"en","ru","Полная строка субтитров остаётся видимой."},
      {"en","vi","Dòng phụ đề đầy đủ vẫn hiển thị rõ ràng."},{"en","id","Kalimat lengkap ini tetap terlihat."},
      {"fr","ar","سَلَام، هذه جملة كاملة تظهر بوضوح."},{"en","hi","क्ष क़ि यह पूरा वाक्य स्पष्ट दिखाई देता है।"}};
    for(String[] c:matrix) {
      RebuildController.stop();SourceCaptionCache.clear(h.a);RebuildCache.clear(h.a);ui("zh-CN");source("This is one complete sentence.",2400);translated=c[2];
      int before=h.calls.get();RebuildController.Session cold=start(c[0],c[1]);ready(cold);presented(cold);
      assertEquals(1,h.calls.get()-before);assertEquals(0,RebuildReview.score(cold.plans[0].issues));String key=cold.cacheKey;String pages=N28CGeometryTest.pageRows(pages()).toString();
      row(cold,"zh-CN",1,false);RebuildController.stop();String locale=cold.languageContext.renderSpec.legacy?"zh-CN":"ar";ui(locale);
      RebuildController.Session warm=start(c[0],c[1]);ready(warm);presented(warm);assertEquals(key,warm.cacheKey);assertEquals(0,warm.attempts[0]);assertEquals(1,h.calls.get()-before);
      assertEquals(pages,N28CGeometryTest.pageRows(pages()).toString());row(warm,locale,0,true);
    }
    assertEquals(28,trace.length());export("fourteen-targets");
  }
  @Test public void requiredSourceTargetPairsAndPortugueseRegionsTraverseProduction()throws Exception {
    for(String[] c:new String[][]{{"zh","en"},{"de","ar"},{"hi","en"},{"vi","fr"},{"ko","en"},{"en","pt-PT"},{"en","pt-BR"}}) {
      RebuildController.stop();source("A complete source sentence.",1800);translated=c[1].equals("ar")?"طراز J-20 (١٢) مع 12.":"Model J-20 (12) remains visible.";
      RebuildController.Session s=start(c[0],c[1]);ready(s);presented(s);assertEquals(c[0],s.languageContext.sourceCode);assertEquals(c[1],s.languageContext.targetCode);row(s,"default",1,false);
    }
    export("required-pairs");
  }
  @Test public void uiLocaleSwitchCannotChangeTargetProfilePagesOrCacheKey()throws Exception {
    source("One complete source sentence.",2400);translated="طراز J-20 (١٢) مع 12 ووحدات إضافية.";
    RebuildController.Session s=start("fr","ar-EG");ready(s);presented(s);String key=s.cacheKey,baseline=N28CGeometryTest.pageRows(pages()).toString();
    for(String locale:new String[]{"en-US","zh-CN","ar","fr"}) {ui(locale);RebuildController.activate(h.a,url("fr","ar-EG"),false,true);assertSame(s,h.session());CaptionOverlay.refreshStyle(h.a);presented(s);assertEquals(key,s.cacheKey);assertEquals(baseline,N28CGeometryTest.pageRows(pages()).toString());assertEquals(View.TEXT_DIRECTION_RTL,view().getTextDirection());row(s,locale,0,true);}
    assertEquals(1,h.calls.get());export("ui-locale");
  }
  @Test public void signatureRotationReusesButSourceTargetAndUnknownSwitchScopes()throws Exception {
    source("One complete source sentence.",2400);translated="Model J-20 (12) stays visible.";
    RebuildController.Session first=start("fr","en");ready(first);presented(first);
    RebuildController.activate(h.a,url("fr","en")+"&signature=secret-sig&expire=44",false,true);assertSame(first,h.session());assertEquals(1,h.calls.get());
    RebuildController.Session second=start("hi","en");ready(second);presented(second);assertNotSame(first,second);assertNotEquals(first.cacheKey,second.cacheKey);
    RebuildController.activate(h.a,url("hi","en")+"&lang=fr",false,true);RebuildController.Session unknown=h.session();ready(unknown);presented(unknown);assertEquals("UNKNOWN",unknown.languageContext.sourceCode);
    translated="سَلَام J-20 (١٢)";RebuildController.Session ar=start(null,"ar");ready(ar);presented(ar);assertEquals(View.TEXT_DIRECTION_RTL,view().getTextDirection());
    assertFalse(CaptionDiagnostics.fullText(h.a).contains("secret-sig"));row(ar,"default",1,false);export("scope-switch");
  }
  @Test public void retiredOldJobCannotOverwriteTheNewLtrViewOrCache()throws Exception {
    source("One complete source sentence.",2400);gate=new CountDownLatch(1);RebuildController.Session old=start("fr","ar");h.await(()->oldArrived);RebuildController.Job job=old.jobs[0];
    translated="NEW_SCOPE_ONLY";RebuildController.Session next=start("fr","en");ready(next);presented(next);gate.countDown();h.await(()->job.connection==null);h.advance(200);presented(next);
    assertNull(old.plans[0]);assertEquals("NEW_SCOPE_ONLY",view().getText().toString());assertEquals(View.TEXT_DIRECTION_LTR,view().getTextDirection());
    assertNull(RebuildCache.read(h.a,old.cacheKey,old.source,old.blocks.get(0),old.languageContext));assertEquals(2,h.calls.get());row(next,"default",1,false);export("late-job");
  }
  @Test public void bNonChineseCacheIsIsolatedWithoutDeletingItsBytes()throws Exception {
    source("One complete source sentence.",2400);RebuildSource source=RebuildContractTest.json(h.engine.fixtureBody);DeepSeekConfig.Snapshot config=DeepSeekConfig.load(h.a);
    CaptionLanguageContext context=CaptionLanguageContext.explicit("fr","en");String current=RebuildCache.identity(source,config,"en",context);
    StringBuilder raw=new StringBuilder(RebuildProtocol.VERSION).append('|').append(context.fingerprint(config)).append('|').append("en").append('|').append(RebuildCache.hash(RebuildApi.prompt(config,"en",context))).append('|').append(context.scope());
    for(RebuildSource.Word w:source.words)raw.append('\n').append(w.start).append(':').append(w.end).append(':').append(w.precision).append(':').append(w.text);
    String bKey=RebuildCache.hash(raw.toString());assertNotEquals(bKey,current);RebuildPlanner.Block block=RebuildPlanner.plan(source,context).get(0);
    File file=new File(RebuildCache.directory(h.a),bKey+"-"+block.id()+".json");byte[] bytes="old-preserved-fixture".getBytes("UTF-8");java.nio.file.Files.write(file.toPath(),bytes);
    RebuildController.Session s=start("fr","en");ready(s);presented(s);assertArrayEquals(bytes,java.nio.file.Files.readAllBytes(file.toPath()));assertEquals(1,h.calls.get());
  }
  @Test public void warmCacheIsRemeasuredForNewRealGeometryWithoutPaidRepair()throws Exception {
    source("One complete source sentence.",2400);translated="Model J-20 (12) stays visible with all complete words.";
    RebuildController.Session s=start("fr","en");ready(s);presented(s);int count=pages().size();String key=s.cacheKey;RebuildController.stop();
    RebuildLayoutTest.bounds=new Rect(0,0,280,400);CaptionOverlay.refreshStyle(h.a);RebuildController.Session warm=start("fr","en");ready(warm);presented(warm);
    assertEquals(key,warm.cacheKey);assertEquals(0,warm.attempts[0]);assertEquals(1,h.calls.get());assertTrue("original 2400ms narrow geometry cannot fit legal >=1200ms pages",pages().isEmpty());assertTrue(count>0);row(warm,"default",0,true);export("remeasured-cache");
  }
  @Test public void softOverrunAndLateArrivalDoNotBlankTheAcceptedNonChineseEvent()throws Exception {
    source("One complete source sentence.",2400);translated="This complete sentence remains visible even when its reading interval is unusually short.";
    RebuildController.Session s=start("fr","en");ready(s);s.displayedEvent="";s.lastShown="";RebuildController.time(1900);h.advance(1);
    assertFalse(s.lastShown,s.lastShown.contains("late_unreadable"));assertFalse(view().getText().toString().isEmpty());assertEquals(1,h.calls.get());
    assertTrue(CaptionDiagnostics.fullText(h.a).contains("REBUILD_PRESENTATION_WATCH"));assertEquals(0,s.repairCount);
  }
  @Test public void nonChineseShortEventsStayInsideTheirSeparateAcceptedWindows()throws Exception {
    source("one two three four",4000);RebuildController.Session s=start("fr","en");ready(s);
    RebuildProtocol.Event old=s.plans[0].events.get(0);int middle=(old.from+old.to)/2;
    JSONArray events=new JSONArray().put(new JSONObject().put("from",old.from).put("to",middle).put("source",s.source.text(old.from,middle)).put("text","Model J-20"))
        .put(new JSONObject().put("from",middle+1).put("to",old.to).put("source",s.source.text(middle+1,old.to)).put("text","(12) stays visible."));
    RebuildProtocol.Plan plan=RebuildProtocol.parseBound(RebuildContractTest.reply(s.blocks.get(0),events),s.source,s.blocks.get(0),s.languageContext);
    s.plans[0]=plan;s.lastShown="";RebuildController.time(plan.events.get(0).start);h.advance(1);
    assertEquals(plan.events.get(0).text,field("pendingText"));assertEquals(plan.events.get(0).end,((Long)field("pendingEnd")).longValue());
    RebuildController.time(plan.events.get(1).start);h.advance(1);assertEquals(plan.events.get(1).text,field("pendingText"));assertEquals(plan.events.get(1).start,((Long)field("pendingStart")).longValue());
  }
  @Test public void pauseSeekRotateAndVideoSwitchRetainExistingOwnershipAndNoRtlResidue()throws Exception {
    source("One complete source sentence.",6000);translated="طراز J-20 (١٢) مع 12 ووحدات إضافية.";RebuildController.Session s=start("fr","ar");ready(s);presented(s);
    h.mediaSession=new MediaSession(h.a,"n28c");MediaController controller=new MediaController(h.a,h.mediaSession.getSessionToken());
    Shadows.shadowOf(controller).setPlaybackState(new PlaybackState.Builder().setState(PlaybackState.STATE_PAUSED,1200,0).build());
    Shadows.shadowOf(controller).setPackageName(h.a.getPackageName());h.a.setMediaController(controller);h.advance(200);long frozen=s.pausedDisplayPosition;assertTrue(frozen>=0);h.advance(600);assertEquals(frozen,s.pausedDisplayPosition);
    RebuildController.time(200);h.advance(1);assertEquals(200,((Long)field("pendingPosition")).longValue());assertEquals(200,s.pausedDisplayPosition);
    h.a.getResources().getDisplayMetrics().widthPixels=2736;h.a.getResources().getDisplayMetrics().heightPixels=1264;RebuildLayoutTest.bounds=new Rect(0,0,1500,700);CaptionOverlay.refreshStyle(h.a);presented(s);
    assertEquals(0,s.source.words.get(0).start);assertEquals(6000,s.plans[0].events.get(0).end);assertEquals(1,h.calls.get());
    RebuildController.video("new-video-0002");assertTrue(s.cancelled);translated="Model J-20 (12)";RebuildController.activate(h.a,url("fr","en").replace("rebuild0001","new-video-0002"),false,true);RebuildController.Session next=h.session();assertNotNull(next);ready(next);presented(next);assertEquals(View.TEXT_DIRECTION_LTR,view().getTextDirection());assertEquals(2,h.calls.get());
    row(next,"default",1,false);export("playback-switch");
  }
  String presentationLines(String text) {
    StringBuilder lines=new StringBuilder();for(String line:text.split("\\n"))if(line.matches("\\d+ \\| REBUILD_PRESENTATION.*"))lines.append(line).append('\n');return lines.toString();
  }
  @Test public void repeatedGeometryAndPositionDoNotSpamWatches()throws Exception {
    source("One complete source sentence.",800);translated="A complete sentence stays visible with all its letters despite fast timing.";RebuildController.Session s=start("fr","en");ready(s);presented(s);
    CaptionOverlay.position(0);String before=presentationLines(CaptionDiagnostics.fullText(h.a));
    for(int i=0;i<10;i++) {CaptionOverlay.refreshStyle(h.a);CaptionOverlay.position(0);}
    assertEquals(before,presentationLines(CaptionDiagnostics.fullText(h.a)));assertEquals(1,h.calls.get());
  }
}
