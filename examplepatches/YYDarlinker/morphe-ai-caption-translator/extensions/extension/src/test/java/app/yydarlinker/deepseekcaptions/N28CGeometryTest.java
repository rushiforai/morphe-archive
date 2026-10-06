package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.graphics.*;
import android.content.res.Configuration;
import android.view.View;
import android.widget.TextView;
import android.text.Layout;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N28CGeometryTest {
  RebuildLayoutTest h;
  @Before public void setup(){ h=new RebuildLayoutTest();h.setup(); h.a.getApplicationInfo().flags|=android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL; }
  @After public void cleanup(){h.done();}
  CaptionRenderSpec spec(String target){return CaptionLanguageContext.explicit("fr",target).renderSpec;}
  Object field(String name)throws Exception {return RebuildIntegrationTest.field(null,CaptionOverlay.class,name);}
  TextView view()throws Exception {return (TextView)((WeakReference<?>)field("textRef")).get();}
  @SuppressWarnings("unchecked") List<RebuildPageLayout.Page> pages()throws Exception {
    return (List<RebuildPageLayout.Page>)field("pendingPages");
  }
  void show(String text,String target,long duration)throws Exception {
    CaptionOverlay.showEvent(text,()->true,()->"","n28c-"+target,100,100+duration,100,spec(target));
  }
  void validate(String original,String target,long start,long end,List<RebuildPageLayout.Page> pages)throws Exception {
    CaptionRenderSpec spec=spec(target);
    if(pages.isEmpty()) {
      assertFalse("only hard geometry/time capacity may blank",spec.fits(original,
          CaptionOverlay.budget().preferredPx,CaptionOverlay.budget().width,2));
      assertEquals("",view().getText().toString());
      assertTrue(CaptionDiagnostics.fullText(h.a).contains("page_time_capacity_unresolved")
          || CaptionDiagnostics.fullText(h.a).contains("hard_geometry_unresolved"));
      return;
    }
    if(!spec.legacy && end-start<1200) assertEquals(1,pages.size());
    int[] cuts=CaptionUnicode.characterBoundaries(original,spec.locale);StringBuilder complete=new StringBuilder();
    long at=start;int offset=0;
    for(RebuildPageLayout.Page page:pages) {
      assertEquals(at,page.start);assertTrue(page.end>page.start);assertTrue(page.end<=end);
      if(!spec.legacy && pages.size()>1) assertTrue("multi-page minimum",page.end-page.start>=1200);
      assertTrue(Arrays.binarySearch(cuts,offset)>=0);offset+=page.text.length();assertTrue(Arrays.binarySearch(cuts,offset)>=0);
      complete.append(page.text);at=page.end;
      CaptionOverlay.position(page.start);
      assertEquals(page.text,view().getText().toString());
      assertTrue(spec.fits(page.text,view().getLayout(),view().getMeasuredWidth()-view().getPaddingLeft()-view().getPaddingRight(),2));
    }
    assertEquals(end,at);assertEquals(original,complete.toString());
  }
  @Test public void legacyDoesNotOverrideExistingFontLocaleDefaults() {
    TextView label=new TextView(h.a);label.setTextLocale(Locale.JAPAN);
    CaptionRenderSpec.LEGACY.apply(label);assertEquals(Locale.JAPAN,label.getTextLocale());
  }
  @Test public void legacyChinesePreservesCompleteShortWindowInsteadOfHardCpsReject()throws Exception {
    assertEquals(1,RebuildPageLayout.plan("这是一条完整的测试字幕。",0,500,x->true).size());
    show("这是一条完整的测试字幕。","zh-Hans",500);assertEquals(1,pages().size());assertEquals("这是一条完整的测试字幕。",view().getText().toString());
  }
  @Test public void overSoftReadingSpeedDisplaysEveryLetterAndRecordsWatch()throws Exception {
    String text="This complete caption remains visible despite a fast reading interval.";
    show(text,"en",600);validate(text,"en",100,700,pages());
    String log=CaptionDiagnostics.fullText(h.a);
    // Same original 600ms/70-unit input occupies three hard lines at the frozen size.
    // It must now blank for capacity, not pass through several faster one-line fragments.
    assertTrue(pages().isEmpty());assertTrue(log,log.contains("page_time_capacity_unresolved"));
    assertFalse(log.contains("REBUILD_LAYOUT_TIME_EXCEPTION"));
  }
  @Test public void oneLineIsPreferredWithoutChineseMinimumCells()throws Exception {
    show("OK.","en",80);assertEquals(1,pages().size());assertEquals("OK.",view().getText().toString());assertEquals(1,view().getLineCount());
  }
  @Test public void cplAndSevenSecondsAreOnlyWatches()throws Exception {
    RebuildLayoutTest.bounds=new Rect(0,0,2600,800);
    String text=String.join("",Collections.nCopies(50,"i"));
    show(text,"en",9000);assertFalse(pages().isEmpty());validate(text,"en",100,9100,pages());
    String log=CaptionDiagnostics.fullText(h.a);assertTrue(log.contains("line_units"));assertTrue(log.contains("page_duration"));
  }
  @Test public void longGermanWordUsesOnlyCompleteEmergencyGraphemes()throws Exception {
    RebuildLayoutTest.bounds=new Rect(0,0,300,400);
    String text="Donaudampfschifffahrtsgesellschaftskapitän";
    show(text,"de",700);assertTrue(pages().isEmpty());validate(text,"de",100,800,pages());
  }
  @Test public void nbspAndCrLfAreNeverCutInHalf()throws Exception {
    String text="one\u00a0two\r\nthree\r\nfour\r\nfive";
    show(text,"en",700);validate(text,"en",100,800,pages());
    for(RebuildPageLayout.Page page:pages()) {assertFalse(page.text.startsWith("\n"));assertFalse(page.text.endsWith("\r"));assertFalse(page.text.startsWith("\u00a0"));assertFalse(page.text.endsWith("\u00a0"));}
  }
  @Test public void arabicUsesPlatformBidiAndDoesNotReverseLogicalText()throws Exception {
    String text="سَلَام، طراز J-20 (١٢) مع 12 ووحدات إضافية.";
    show(text,"ar",1000);validate(text,"ar",100,1100,pages());
    assertEquals(View.TEXT_DIRECTION_RTL,view().getTextDirection());assertEquals("ar",view().getTextLocale().getLanguage());
    boolean negative=false;for(RebuildPageLayout.Page page:pages()) {Layout l=spec("ar").layout(page.text,view().getTextSize(),540);if(l.getParagraphDirection(0)==-1)negative=true;}
    assertTrue(negative);
  }
  @Test public void rtlSwitchToLatinChineseAndWaitingHasNoResidualDirection()throws Exception {
    show("سَلَام J-20 (١٢)","ar",2000);assertEquals(View.TEXT_DIRECTION_RTL,view().getTextDirection());
    show("Model J-20 (12)","en",2000);assertEquals(View.TEXT_DIRECTION_LTR,view().getTextDirection());
    show("这是一条完整的测试字幕。","zh-Hant",2400);assertEquals(View.TEXT_DIRECTION_FIRST_STRONG,view().getTextDirection());
    show("سَلَام","ar",2000);CaptionOverlay.showWaitingEvent("翻译中…",null,"wait",0,2400,0);
    assertEquals(View.TEXT_DIRECTION_FIRST_STRONG,view().getTextDirection());
  }
  @Test public void genericFirstStrongStillIgnoresTheUiDirection()throws Exception {
    show("שלום J-20 (12)","he",2400);assertEquals(View.TEXT_DIRECTION_FIRST_STRONG_LTR,view().getTextDirection());
    assertEquals(-1,view().getLayout().getParagraphDirection(0));assertEquals("generic",spec("he").profile.id);
  }
  @Test public void allFixedUnicodeClustersSurviveActualOverlayCuts()throws Exception {
    JSONObject contract=new JSONObject(new String(getClass().getResourceAsStream("/n28a/unicode-contract.json").readAllBytes(),java.nio.charset.StandardCharsets.UTF_8));
    JSONArray cases=contract.getJSONArray("cases"),evidence=new JSONArray();
    RebuildLayoutTest.bounds=new Rect(0,0,320,400);
    for(int i=0;i<cases.length();i++) {
      JSONObject c=cases.getJSONObject(i);String cluster=c.getString("text");
      if(c.getInt("reading")==0) continue;
      String text=String.join(" ",Collections.nCopies(6,cluster));
      show(text,"hi-IN",1200);validate(text,"hi-IN",100,1300,pages());
      evidence.put(new JSONObject().put("id",c.getString("id")).put("logical_text",text).put("pages",pageRows(pages())));
    }
    export("unicode-page-cuts.json",new JSONObject().put("backend",CaptionUnicode.backend()).put("cases",evidence));
  }
  @Test public void isolatedMarksAndMalformedSurrogatesSafelyBlank()throws Exception {
    for(String text:new String[]{"\u0301orphan","\ud83d","\udc00"}) {show(text,"en",2000);assertTrue(pages().isEmpty());assertEquals("",view().getText().toString());}
    assertTrue(CaptionDiagnostics.fullText(h.a).contains("hard_geometry_unresolved"));
  }
  @Test public void minimumWidthIsAHardConstraintNotASoftReadingRejection()throws Exception {
    CaptionRenderSpec spec=spec("ar");CaptionOverlay.LayoutBudget budget=new CaptionOverlay.LayoutBudget(1,44,44,spec);
    assertTrue(RebuildPageLayout.plan("طراز",0,1000,budget,spec).isEmpty());
  }
  @Test public void koreanHalfWeightNeverEntersCps() {
    CaptionRenderSpec ko=spec("ko");assertEquals(6,ko.readingUnits("ABCDEF"));assertEquals(3.0,ko.lineUnits("ABCDEF"),0);
    assertEquals(12,ko.profile.referenceCps);assertEquals(16,ko.profile.referenceCpl);
  }
  @Test public void fullTargetLocaleAndRegionsAreExplicit() {
    for(String tag:new String[]{"ar-EG","pt-PT","pt-BR","hi-IN","zh-Hant-TW"}) {
      CaptionRenderSpec spec=spec(tag);assertEquals(tag,spec.locale.toLanguageTag());assertEquals(tag,spec.targetCode);
    }
    assertEquals(CaptionLanguageProfile.Direction.RTL,spec("ar-EG").direction);
    assertEquals("legacy_n26",spec("zh-Hant-TW").presentationPolicy);
    assertEquals(CaptionRenderSpec.POLICY_VERSION,spec("pt-BR").presentationPolicy);
  }
  @Test public void fiveTiersDensityFontScalePortraitAndLandscapeUseRealTextView()throws Exception {
    JSONArray rows=new JSONArray();String text="Model J-20 (12) remains visible with every complete word.";
    for(boolean full:new boolean[]{false,true})for(int tier=0;tier<5;tier++)for(float density:new float[]{1f,3f})for(float scale:new float[]{.85f,1.4f}) {
      Configuration cfg=new Configuration(h.a.getResources().getConfiguration());cfg.fontScale=scale;h.a.getResources().updateConfiguration(cfg,h.a.getResources().getDisplayMetrics());
      h.a.getResources().getDisplayMetrics().widthPixels=full?2736:1264;h.a.getResources().getDisplayMetrics().heightPixels=full?1264:2736;
      h.a.getResources().getDisplayMetrics().density=density;h.a.getResources().getDisplayMetrics().scaledDensity=density*scale;
      assertEquals(full,h.a.getResources().getDisplayMetrics().widthPixels>h.a.getResources().getDisplayMetrics().heightPixels);
      RebuildLayoutTest.bounds=new Rect(0,0,full?1500:600,full?700:400);DeepSeekConfig.saveCaptionSizeTier(h.a,tier);
      show(text,"en",1000);validate(text,"en",100,1100,pages());
      rows.put(new JSONObject().put("full_screen",full).put("tier",tier).put("density",density).put("font_scale",scale).put("text_size_px",view().getTextSize()).put("event_text",text).put("event_start",100).put("event_end",1100).put("pages",pageRows(pages())));
    }
    assertEquals(40,rows.length());export("geometry-matrix.json",new JSONObject().put("rows",rows));
  }
  @Test public void compactAndPreviewMeasureTheSameBoundSpec()throws Exception {
    String ar="سَلَام J-20 (١٢)";CaptionRenderSpec spec=spec("ar-EG");
    TextView preview=SubtitleStylePreview.sampleLabel(h.a,ar,4,50,2736,2736,spec);
    assertEquals(View.TEXT_DIRECTION_RTL,preview.getTextDirection());assertEquals("ar-EG",preview.getTextLocale().toLanguageTag());
    assertTrue(spec.fits(ar,preview.getLayout(),preview.getMeasuredWidth()-preview.getPaddingLeft()-preview.getPaddingRight(),2));
  }
  @Test public void nativeFixtureImagesForFourScripts()throws Exception {
    String[][] examples={{"ar","سَلَام، طراز J-20 (١٢) مع 12."},{"ja","機体 J-20（12）の幅を確認します。"},{"de","Donaudampfschifffahrtsgesellschaftskapitän J-20 (12)"},{"hi","क्ष क़ि J-20 (१२) के साथ"}};
    for(String[] example:examples) {
      show(example[1],example[0],2400);validate(example[1],example[0],100,2500,pages());CaptionOverlay.position(100);
      String dir=System.getenv("N28C_EVIDENCE_DIR");if(dir!=null) {
        TextView view=view();Bitmap image=Bitmap.createBitmap(view.getMeasuredWidth(),view.getMeasuredHeight(),Bitmap.Config.ARGB_8888);
        Canvas canvas=new Canvas(image);canvas.drawColor(Color.rgb(55,65,75));view.layout(0,0,image.getWidth(),image.getHeight());view.draw(canvas);
        try(FileOutputStream out=new FileOutputStream(new File(dir,"native-"+example[0]+".png"))) {image.compress(Bitmap.CompressFormat.PNG,100,out);}
      }
    }
  }
  static JSONArray pageRows(List<RebuildPageLayout.Page> pages)throws Exception {JSONArray rows=new JSONArray();for(RebuildPageLayout.Page p:pages)rows.put(new JSONObject().put("text",p.text).put("start",p.start).put("end",p.end));return rows;}
  static void export(String file,JSONObject value)throws Exception {
    String dir=System.getenv("N28C_EVIDENCE_DIR");if(dir!=null)try(FileOutputStream out=new FileOutputStream(new File(dir,file))) {out.write(value.toString(2).getBytes("UTF-8"));}
  }
}
