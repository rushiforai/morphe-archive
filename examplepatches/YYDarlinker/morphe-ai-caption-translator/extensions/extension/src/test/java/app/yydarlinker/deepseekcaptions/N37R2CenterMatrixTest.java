package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.graphics.Rect;
import android.os.Looper;
import android.view.*;
import android.widget.*;
import java.nio.file.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Product overlay + Android FrameLayout layout; no mocked gravity or measured rectangle. */
@RunWith(ParameterizedRobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class N37R2CenterMatrixTest {
  @ParameterizedRobolectricTestRunner.Parameters(name="{0}-{1}-{2}") public static Collection<Object[]> cases(){
    List<Object[]> rows=new ArrayList<>();
    for(String target:new String[]{"en","es","ar","ja"})
      for(String scene:new String[]{"detail","fullscreen","shorts"})
        if(!target.equals("ja")||!scene.equals("detail"))rows.add(new Object[]{"ar",target,scene});
    for(String scene:new String[]{"detail","fullscreen","shorts"})rows.add(new Object[]{"en","en",scene});
    return rows;
  }
  final String app,target,scene;
  RebuildLayoutTest h;FrameLayout host;final List<String> ledger=new ArrayList<>();
  public N37R2CenterMatrixTest(String app,String target,String scene){this.app=app;this.target=target;this.scene=scene;}
  @Before public void setup(){
    CaptionPlayerAuthority.resetForTests();CaptionPlayerTransitionGuard.resetForTests();
    h=new RebuildLayoutTest();h.setup();h.a.getApplicationInfo().flags|=android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;
    host=(FrameLayout)h.a.findViewById(android.R.id.content);
    h.a.getWindow().getDecorView().setLayoutDirection(app.equals("ar")?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR);
    host.setLayoutDirection(app.equals("ar")?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR);
    RebuildLayoutTest.shorts=scene.equals("shorts");
    RebuildLayoutTest.bounds=scene.equals("detail")?new Rect(71,35,672,375):scene.equals("fullscreen")?new Rect(113,20,1074,610):new Rect(149,50,650,920);
    h.a.getResources().getDisplayMetrics().widthPixels=scene.equals("fullscreen")?1280:800;
    h.a.getResources().getDisplayMetrics().heightPixels=scene.equals("fullscreen")?720:1000;
  }
  void layout(){host.measure(View.MeasureSpec.makeMeasureSpec(1280,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1000,View.MeasureSpec.EXACTLY));host.layout(0,0,1280,1000);}
  String[] samples(){
    if(target.equals("ar"))return new String[]{"字幕 النص", "السطر الأول\nالسطر الثاني",String.join(" ",Collections.nCopies(20,"تظل الترجمة في وسط الفيديو")),"في 2026 العدد 42 و API 3.5!"};
    if(target.equals("ja"))return new String[]{"字幕です", "最初の行\n二番目の行",String.join("",Collections.nCopies(20,"字幕は動画の中央です。")),"2026年、API 3.5は42件です。"};
    if(target.equals("es"))return new String[]{"Texto breve", "Primera línea\nSegunda línea",String.join(" ",Collections.nCopies(20,"Los subtítulos permanecen centrados.")),"En 2026: API 3.5, 42 vídeos — مرحبا!"};
    return new String[]{"Short caption", "First line\nSecond line",String.join(" ",Collections.nCopies(20,"Captions remain centered on the video.")),"In 2026: API 3.5, 42 videos — مرحبا!"};
  }
  @Test public void physicalCenterForEveryTextShape()throws Exception{
    int kind=0;
    for(String value:samples()){
      CaptionOverlay.showEvent(value,()->true,()->"","matrix:"+kind,1000,61000,2000,CaptionLanguageContext.explicit("en",target).renderSpec);
      layout();FrameLayout outer=h.anchor();TextView text=h.text();Rect video=RebuildLayoutTest.bounds;
      float center=outer.getLeft()+outer.getTranslationX()+outer.getWidth()/2f-host.getScrollX();
      float error=center-video.exactCenterX();
      ledger.add("app="+app+";target="+target+";scene="+scene+";shape="+kind+";root_direction="+host.getLayoutDirection()+";outer_direction="+outer.getLayoutDirection()+";text_direction="+text.getTextDirection()+";gravity="+((FrameLayout.LayoutParams)outer.getLayoutParams()).gravity+";video="+video+";actual_center="+center+";error="+error);
      assertEquals(View.VISIBLE,outer.getVisibility());
      assertTrue("physical center error "+error,Math.abs(error)<=1f);
      assertEquals(target.equals("ar")?View.TEXT_DIRECTION_RTL:View.TEXT_DIRECTION_LTR,text.getTextDirection());
      assertEquals(2,text.getMaxLines());kind++;
    }
  }
  @After public void done()throws Exception{
    String out=System.getenv("N30_EVIDENCE_DIR");
    if(out!=null)Files.write(Paths.get(out,"center-matrix-"+app+"-"+target+"-"+scene+".txt"),ledger);
    h.done();CaptionPlayerAuthority.resetForTests();CaptionPlayerTransitionGuard.resetForTests();
  }
}