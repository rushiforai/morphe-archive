package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.graphics.Rect;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.atomic.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={28,35},shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N34OwnedDisplayTest {
  RebuildLayoutTest h;
  static final String[] TARGETS={"en","zh-Hans","zh-Hant","es","fr","de","pt","ru","ja","ko","ar","hi","id","vi"};
  static final String[] TEXT={"Ready, 144Hz.","情况一直在改善。","情況一直在改善。","Sí, 144Hz.","Prêt, éé.","Bereit, 144Hz.","Pronto, 144Hz.","Готово, 144Hz.","字幕のテストです。","자막 테스트입니다.","نعم، 144Hz (جيد).","क्ष क़ि ठीक है।","Siap, 144Hz.","Sa\u0306\u0301n sa\u0300ng."};
  @Before public void setup()throws Exception {h=new RebuildLayoutTest();h.setup();DeepSeekConfig.saveDisplayTextDebugEnabled(h.a,true);CaptionOverlay.showCaption("Ready.");}
  @After public void done(){h.done();}
  CaptionRenderSpec spec(String code){return CaptionLanguageContext.explicit("en",code).renderSpec;}
  static JSONObject fixtures()throws Exception {
    try(java.io.InputStream in=N34OwnedDisplayTest.class.getResourceAsStream("/n34/diagnostic-replay.json")) {
      return new JSONObject(new String(in.readAllBytes(),StandardCharsets.UTF_8));
    }
  }
  static void save(String name,Object data)throws Exception {
    Path out=Path.of(System.getProperty("scheduler.output"));
    Files.write(out.resolve(name+"-sdk"+Build.VERSION.SDK_INT+".json"),data.toString().getBytes(StandardCharsets.UTF_8));
  }
  void complete(String expected)throws Exception {
    TextView view=h.text();assertEquals(expected,view.getText().toString());assertEquals(View.VISIBLE,h.anchor().getVisibility());
    assertNotNull(view.getLayout());assertTrue(view.getLineCount()<=2);
    assertEquals(expected.length(),view.getLayout().getLineEnd(view.getLineCount()-1));
    CaptionRenderSpec actual=spec("en").withPaint(view);
    assertTrue(actual.fits(expected,view.getLayout(),view.getMeasuredWidth()-view.getPaddingLeft()-view.getPaddingRight(),2));
  }
  @Test public void capturedSevenAndHistoricRateLeadSamplesUseRealViews()throws Exception {
    RebuildLayoutTest.bounds=new Rect(0,0,1264,700);h.a.getResources().getDisplayMetrics().density=3.5f;
    h.a.getResources().getDisplayMetrics().scaledDensity=3.5f;
    JSONObject fixture=fixtures();JSONArray rows=new JSONArray();
    for(String target:new String[]{"zh-Hans","zh-Hant"})for(String group:new String[]{"seven","oldFallbacks","oldLeads"}) {
      JSONArray values=fixture.getJSONArray(group);
      for(int n=0;n<values.length();n++) {
        JSONObject sample=values.getJSONObject(n);long start=group.equals("seven")?sample.getJSONArray("range").getLong(0):sample.getLong("startMs");
        long end=group.equals("seven")?sample.getJSONArray("range").getLong(1):sample.getLong("endMs");
        String text=group.equals("oldFallbacks")?sample.getString("renderInput"):sample.getString("text");
        CaptionOverlay.showEvent(text,()->true,()->"",group+":"+target+":"+n,start,end,start,spec(target));
        boolean fits=CaptionOverlay.budget().withSpec(spec(target).withPaint(h.text())).fitsPreferred(text);
        if(fits){complete(text);assertEquals(1,((List<?>)RebuildLayoutTest.field("pendingPages")).size());}
        else if(!h.text().getText().toString().isEmpty())assertTrue(h.text().getLineCount()<=2);
        else assertTrue(h.presentationHistory().contains("unresolved") || h.presentationHistory().contains("hard_textview_geometry"));
        JSONObject row=new JSONObject().put("group",group).put("target",target).put("sample",n).put("text",text)
            .put("start",start).put("end",end).put("full_two_line_fit",fits).put("applied_text",h.text().getText())
            .put("visible",h.anchor().getVisibility()==View.VISIBLE).put("width",CaptionOverlay.budget().width)
            .put("lines",h.text().getLineCount());
        CaptionOverlay.position(end);assertEquals(View.GONE,h.anchor().getVisibility());assertEquals("",h.text().getText().toString());rows.put(row);
      }
    }
    save("captured-native-after",rows);
  }
  @Test public void fourteenTargetsTwelveWindowsTwoWidthsAndTwoFontTiers()throws Exception {
    JSONArray rows=new JSONArray();long[] windows={80,283,600,830,1000,1199,1200,2399,2400,3601,7000,9000};
    for(int tier:new int[]{2,4})for(int width:new int[]{1264,400})for(int target=0;target<TARGETS.length;target++)for(long span:windows) {
      DeepSeekConfig.saveCaptionSizeTier(h.a,tier);RebuildLayoutTest.bounds=new Rect(0,0,width,700);
      String id="matrix:"+tier+":"+width+":"+target+":"+span;long start=1000,end=start+span;
      CaptionOverlay.showEvent(TEXT[target],()->true,()->"",id,start,end,start-1,spec(TARGETS[target]));
      assertEquals(View.GONE,h.anchor().getVisibility());CaptionOverlay.position(start);
      CaptionOverlay.LayoutBudget budget=CaptionOverlay.budget();boolean fits=budget.fitsPreferred(TEXT[target]);
      if(fits)complete(TEXT[target]);
      @SuppressWarnings("unchecked") List<RebuildPageLayout.Page> pages=(List<RebuildPageLayout.Page>)RebuildLayoutTest.field("pendingPages");
      if(!pages.isEmpty()) {
        StringBuilder all=new StringBuilder();long at=start;int offset=0;
        int[] clusters=CaptionUnicode.characterBoundaries(TEXT[target],spec(TARGETS[target]).locale);
        for(RebuildPageLayout.Page page:pages){assertEquals(at,page.start);at=page.end;all.append(page.text);offset+=page.text.length();
          assertTrue(Arrays.binarySearch(clusters,offset)>=0);if(pages.size()>1)assertTrue(page.end-page.start>=1200);}
        assertEquals(end,at);assertEquals(TEXT[target],all.toString());
      }
      rows.put(new JSONObject().put("target",TARGETS[target]).put("duration_ms",span).put("width",width).put("tier",tier)
          .put("full_fit",fits).put("visible",h.anchor().getVisibility()==View.VISIBLE).put("pages",N28CGeometryTest.pageRows(pages)));
      CaptionOverlay.position(end-1);if(fits)assertEquals(View.VISIBLE,h.anchor().getVisibility());
      CaptionOverlay.position(end);assertEquals(View.GONE,h.anchor().getVisibility());
    }
    save("fourteen-target-window-matrix",rows);
  }
  @Test public void latestOwnerTimeWinsQueuedShowAndStalePositionCannotAffectNewTrack()throws Exception {
    AtomicLong position=new AtomicLong(100);AtomicBoolean valid=new AtomicBoolean(true);
    CaptionOverlay.RenderGuard owner=new CaptionOverlay.RenderGuard(){public boolean isValid(){return valid.get();}public long displayPosition(long supplied){return position.get();}};
    Thread worker=new Thread(()->CaptionOverlay.showEvent("已过期。",owner,()->"","queued",100,1300,100,spec("zh-Hans")));
    worker.start();worker.join();position.set(1300);Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertEquals(View.GONE,h.anchor().getVisibility());assertEquals("",h.text().getText().toString());
    position.set(499);CaptionOverlay.showEvent("按当前时间。",owner,()->"","early",500,2000,100,spec("zh-Hans"));
    assertEquals(View.GONE,h.anchor().getVisibility());position.set(500);CaptionOverlay.position(499,owner);complete("按当前时间。");
    Thread stale=new Thread(()->CaptionOverlay.position(800,owner));stale.start();stale.join();valid.set(false);
    CaptionOverlay.showEvent("New owner.",()->true,()->"","new",100,2100,100,spec("en"));
    Shadows.shadowOf(Looper.getMainLooper()).idle();complete("New owner.");
    save("latest-owner-time",new JSONObject().put("queued_expiry",true).put("early_recovers",true).put("stale_owner_ignored",true));
  }
  @Test public void strictPageLookupHandlesGapsAndUnboundedStatusIsUntouched()throws Exception {
    List<RebuildPageLayout.Page> pages=Arrays.asList(new RebuildPageLayout.Page("one",100,1300),new RebuildPageLayout.Page("two",1400,2600));
    for(long pos:new long[]{99,1300,1399,2600,9999})assertEquals(-1,RebuildPageLayout.indexAt(pages,pos));
    assertEquals(0,RebuildPageLayout.indexAt(pages,100));assertEquals(1,RebuildPageLayout.indexAt(pages,1400));
    CaptionOverlay.showWaitingEvent("Waiting.",()->true,"waiting",500,1300,499);assertEquals(View.GONE,h.anchor().getVisibility());
    CaptionOverlay.position(500);complete("Waiting.");CaptionOverlay.position(1300);assertEquals(View.GONE,h.anchor().getVisibility());
    CaptionOverlay.showStatus("Status.");CaptionOverlay.position(9999);complete("Status.");
  }
  @Test public void optionalMergeCannotDisplacePrimaryWhenLateOrTooWide()throws Exception {
    RebuildSource source=RebuildContractTest.source("a b c d e f",1000);
    RebuildProtocol.Event left=new RebuildProtocol.Event(0,2,100,1500,"前导说明");
    RebuildProtocol.Event right=new RebuildProtocol.Event(3,5,1500,3500,"正文。");
    RebuildDisplayMerge.Merged candidate=RebuildDisplayMerge.merge(source,left,right);assertNotNull(candidate);
    CaptionOverlay.showEvent(right.text,()->true,()->"","candidate",right.start,right.end,2501,spec("zh-Hans"),candidate);complete(right.text);
    assertTrue(h.presentationHistory().contains("merge_rejected_keep_primary"));
    CaptionOverlay.showEvent(right.text,()->true,()->"","candidate-ok",right.start,right.end,1500,spec("zh-Hans"),candidate);complete(candidate.text);
    assertEquals(right.end,((List<RebuildPageLayout.Page>)RebuildLayoutTest.field("pendingPages")).get(0).end);
    CaptionOverlay.position(3500);assertEquals(View.GONE,h.anchor().getVisibility());
  }
  @Test public void actualCompactFailureGetsExactlyOneApprovedMaximumWidthRetry()throws Exception {
    TextView view=h.text();view.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,40);
    CaptionRenderSpec actual=spec("zh-Hans").withPaint(view);int inner=500;
    long before=CaptionOverlay.textMeasureCalls;
    int width=CaptionOverlay.measureCompleteAtWidth(view,"这是完整的一句字幕。",inner,actual,true,40);
    assertEquals(inner+view.getPaddingLeft()+view.getPaddingRight(),width);
    assertEquals(2,CaptionOverlay.textMeasureCalls-before);assertTrue(actual.fits(view.getText().toString(),view.getLayout(),inner,2));
    before=CaptionOverlay.textMeasureCalls;assertEquals(-1,CaptionOverlay.measureCompleteAtWidth(view,String.join("",Collections.nCopies(100,"字")),inner,actual,true,40));
    assertEquals(2,CaptionOverlay.textMeasureCalls-before);
  }
  @Test public void pageClockAndFrameRefreshReuseOnlyTheCurrentEventPlan()throws Exception {
    RebuildLayoutTest.bounds=new Rect(0,0,600,500);String text="第一句保留全文。第二句保持完整。第三句不删任何字。";
    long before=CaptionOverlay.planningCalls,layouts=CaptionRenderSpec.layoutCalls;long begin=System.nanoTime();
    CaptionOverlay.showEvent(text,()->true,()->"","memo",100,9100,100,spec("zh-Hans"));long planned=CaptionOverlay.planningCalls;
    for(int n=0;n<80;n++)CaptionOverlay.position(100+n*100);
    assertEquals(1,planned-before);assertEquals(planned,CaptionOverlay.planningCalls);
    assertEquals(text,((List<RebuildPageLayout.Page>)RebuildLayoutTest.field("pendingPages")).stream().map(p->p.text).collect(java.util.stream.Collectors.joining()));
    save("plan-reuse-performance",new JSONObject().put("planning_calls",CaptionOverlay.planningCalls-before)
        .put("layout_calls",CaptionRenderSpec.layoutCalls-layouts).put("elapsed_us",(System.nanoTime()-begin)/1000).put("position_updates",80));
  }
  @Test public void illegalUnicodeAndPhysicalCapacityNeverBecomeVisible()throws Exception {
    CaptionOverlay.showEvent("\ud800",()->true,()->"","unicode-invalid",100,2000,100,spec("zh-Hans"));
    // N36: a never-presented overlay has no anchor at all or a hidden one; the authority-level fact is
    // that nothing is visible.
    // N36: the blank decision and its reason are asserted on the production display memory; the
    // archive-channel form is covered by the diagnostics lane.
    assertFalse(CaptionOverlay.anchorVisible());
    assertTrue(String.valueOf(RebuildLayoutTest.field("lastDisplayResult")).contains("hard_geometry_unresolved"));
    String dense=String.join(" ",Collections.nCopies(60,"unchanged"));long before=System.nanoTime();
    List<RebuildPageLayout.Page> pages=RebuildPageLayout.plan(dense,0,283,new CaptionOverlay.LayoutBudget(200,40),spec("en"));assertTrue(pages.isEmpty());
    save("bounded-long-input",new JSONObject().put("characters",dense.length()).put("duration_ms",283).put("planning_us",(System.nanoTime()-before)/1000).put("blank",true));
  }
  @Test public void frozenMediaPositionAcrossPauseBufferingAndFourSpeedsNeverUsesWallClockToAdvancePages()throws Exception {
    JSONArray rows=new JSONArray();
    for(double speed:new double[]{.5,1,1.5,2}) {
      AtomicLong media=new AtomicLong(100);CaptionOverlay.RenderGuard owner=new CaptionOverlay.RenderGuard(){public boolean isValid(){return true;}public long displayPosition(long supplied){return media.get();}};
      long wall=SystemClock.uptimeMillis();CaptionOverlay.showEvent("当前媒体时间。",owner,()->"","clock:"+speed,100,1300,100,spec("zh-Hans"));complete("当前媒体时间。");
      for(String frozen:new String[]{"pause","buffering","background_foreground"}) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(300));CaptionOverlay.refreshStyle(h.a);
        complete("当前媒体时间。");assertEquals(100L,RebuildLayoutTest.field("pendingPosition"));
        rows.put(new JSONObject().put("speed",speed).put("state",frozen).put("media_position",100).put("fixture_uptime",SystemClock.uptimeMillis()).put("visible",true));
      }
      long wallStep=Math.round(1200/speed);Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(wallStep));media.set(1300);CaptionOverlay.position(100,owner);assertEquals(View.GONE,h.anchor().getVisibility());
      rows.put(new JSONObject().put("speed",speed).put("state","exclusive_end").put("media_position",1300).put("observed_fixture_wall_ms",SystemClock.uptimeMillis()-wall).put("visible",false).put("not_physical_phone_wall_time",true));
    }
    save("media-vs-fixture-wall-observations",rows);
  }

  @Test public void expiryDuringMeasurementIsCheckedAgainBeforeVisibility()throws Exception {
    AtomicInteger reads=new AtomicInteger();CaptionOverlay.RenderGuard owner=new CaptionOverlay.RenderGuard(){public boolean isValid(){return true;}public long displayPosition(long supplied){return reads.getAndIncrement()<2?100:1300;}};
    CaptionOverlay.showEvent("本窗已经结束。",owner,()->"","measure-expiry",100,1300,100,spec("zh-Hans"));
    assertTrue(reads.get()>=3);assertEquals(View.GONE,h.anchor().getVisibility());assertEquals("",h.text().getText().toString());
    assertTrue(h.presentationHistory().contains("reason=outside_owned_window"));
  }

}
