package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.graphics.Rect;
import android.view.*;
import android.widget.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,qualifiers="w1280dp-h1000dp-mdpi",shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N37R2PlacementContractTest {
 RebuildLayoutTest h;FrameLayout host;
 @Before public void setup(){CaptionPlayerAuthority.resetForTests();h=new RebuildLayoutTest();h.setup();h.a.getApplicationInfo().flags|=android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;host=(FrameLayout)h.a.findViewById(android.R.id.content);host.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);}
 @After public void done(){h.done();CaptionPlayerAuthority.resetForTests();}
 void layout(){host.measure(1073743104,1073742824);host.layout(0,0,1280,1000);host.getViewTreeObserver().dispatchOnPreDraw();host.measure(1073743104,1073742824);host.layout(0,0,1280,1000);}
 void show(String value,String lang,String id){CaptionOverlay.showEvent(value,()->true,()->"",id,1000,61000,2000,CaptionLanguageContext.explicit("en",lang).renderSpec);layout();}
 void center()throws Exception{FrameLayout a=h.anchor();assertTrue(Math.abs(a.getLeft()+a.getTranslationX()+a.getWidth()/2f-host.getScrollX()-RebuildLayoutTest.bounds.exactCenterX())<=1);assertEquals(0f,a.getTranslationX(),0f);}
 @Test public void exactHalfPixelRoundingAndOffCenterRectangle(){assertEquals(74,CaptionHorizontalPlacement.physicalLeft(new Rect(71,0,672,300),596));assertEquals(71,CaptionHorizontalPlacement.physicalLeft(new Rect(71,0,672,300),601));}
 @Test public void paddingScrollLogicalMarginsAndStaleTranslationAreReplaced()throws Exception{
  show("Short caption","en","old");FrameLayout a=h.anchor();FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)a.getLayoutParams();p.setMarginStart(201);p.setMarginEnd(143);p.gravity=Gravity.RIGHT|Gravity.TOP;p.rightMargin=101;a.setLayoutParams(p);a.setTranslationX(137);a.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);host.setPadding(17,0,31,0);host.scrollTo(9,0);
  show("Short caption","en","new");center();assertFalse(((FrameLayout.LayoutParams)a.getLayoutParams()).isMarginRelative());assertEquals(Gravity.TOP|Gravity.LEFT,((FrameLayout.LayoutParams)a.getLayoutParams()).gravity);
 }
 @Test public void identicalPlacementDoesNotRequestAnotherLayout()throws Exception{
  show("Short caption","en","once");FrameLayout a=h.anchor();FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)a.getLayoutParams();assertFalse(a.isLayoutRequested());CaptionHorizontalPlacement.place(host,a,RebuildLayoutTest.bounds,p.width,p.height,p.topMargin);assertFalse(a.isLayoutRequested());assertSame(p,a.getLayoutParams());
 }
 @Test public void appDirectionSwitchPreservesTextPlanFontAndVerticalPosition()throws Exception{
  show("Caption 42 — مرحبا!","en","one");String before=h.text().getText().toString();float size=h.text().getTextSize();int top=((FrameLayout.LayoutParams)h.anchor().getLayoutParams()).topMargin;String pages=RebuildLayoutTest.field("pendingPages").toString();
  host.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);CaptionOverlay.refreshStyle(h.a);layout();center();assertEquals(before,h.text().getText().toString());assertEquals(size,h.text().getTextSize(),0f);assertEquals(top,((FrameLayout.LayoutParams)h.anchor().getLayoutParams()).topMargin);assertEquals(pages,RebuildLayoutTest.field("pendingPages").toString());
 }
 @Test public void allScenesAndConsecutiveShortsUseFreshRectangleWithoutTextWidthJump()throws Exception{
  Rect[] scenes={new Rect(71,35,672,375),new Rect(113,20,1074,610),new Rect(149,50,650,920),new Rect(81,130,682,990),new Rect(117,10,1078,600),new Rect(93,35,694,375)};int i=0;
  for(Rect rect:scenes){RebuildLayoutTest.bounds=rect;RebuildLayoutTest.shorts=i==2||i==3;h.a.getResources().getDisplayMetrics().widthPixels=i==1||i==4?1280:800;h.a.getResources().getDisplayMetrics().heightPixels=i==1||i==4?720:1000;
   for(String language:new String[]{"en","es","ar","ja"}){show(language.equals("ar")?"النص 42":"Caption 42",language,"scene:"+i+language);center();}i++;}
 }
 @Test public void layoutEvidenceReportsActualRectWithEveryRequiredField()throws Exception{
  CaptionDiagnostics.clear(h.a);show("Short caption","en","evidence");String log=CaptionDiagnostics.fullText(h.a);assertTrue(log.contains("CAPTION_HORIZONTAL_PLACEMENT"));for(String k:new String[]{"player_type","app_layout_direction","caption_text_direction","caption_outer_layout_direction","video_rect","caption_outer_rect","expected_center_x","actual_center_x","center_error_px","session","owner_epoch","render_epoch"})assertTrue(k,log.contains(k+"="));assertTrue(log.contains("center_error_px=0.0"));
 }
 @Test public void staleAfterLayoutEvidenceCannotPublishForNewOwner()throws Exception{
  show("Short caption","en","visible");CaptionDiagnostics.clear(h.a);AtomicBoolean valid=new AtomicBoolean(true);CaptionHorizontalPlacement placement=new CaptionHorizontalPlacement(host,h.anchor(),h.text());h.anchor().requestLayout();placement.observe(h.a,RebuildLayoutTest.bounds,"old","old-session",1,1,valid::get);valid.set(false);layout();assertFalse(CaptionDiagnostics.fullText(h.a).contains("old-session"));
 }
 @Test public void fallbackUnicodeDirectionIsNotInferredFromAppLocale()throws Exception{
  show("שלום J-20 (12)","he","hebrew");center();assertEquals(View.TEXT_DIRECTION_FIRST_STRONG_LTR,h.text().getTextDirection());assertEquals(-1,h.text().getLayout().getParagraphDirection(0));
 }
}
