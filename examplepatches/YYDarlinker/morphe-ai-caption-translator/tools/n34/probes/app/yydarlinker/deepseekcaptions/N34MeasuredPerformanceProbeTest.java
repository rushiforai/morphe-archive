package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.graphics.Rect;
import android.text.StaticLayout;
import java.nio.file.*;
import java.util.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.util.ReflectionHelpers.ClassParameter;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildLayoutTest.Geometry.class,N34MeasuredPerformanceProbeTest.Paging.class,N34MeasuredPerformanceProbeTest.Measuring.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N34MeasuredPerformanceProbeTest {
 static int plans,layouts;
 @Implements(RebuildPageLayout.class) public static class Paging {
  @Implementation protected static List<RebuildPageLayout.Page> plan(String text,long start,long end,CaptionOverlay.LayoutBudget budget,CaptionRenderSpec spec) {
   plans++;return Shadow.directlyOn(RebuildPageLayout.class,"plan",ClassParameter.from(String.class,text),ClassParameter.from(long.class,start),ClassParameter.from(long.class,end),ClassParameter.from(CaptionOverlay.LayoutBudget.class,budget),ClassParameter.from(CaptionRenderSpec.class,spec));
  }
 }
 @Implements(CaptionRenderSpec.class) public static class Measuring {
  @RealObject CaptionRenderSpec real;
  @Implementation protected StaticLayout layout(String text,float size,int width) {
   layouts++;return Shadow.directlyOn(real,CaptionRenderSpec.class,"layout",ClassParameter.from(String.class,text),ClassParameter.from(float.class,size),ClassParameter.from(int.class,width));
  }
 }
 @Test public void sameGeometryClockAndCallbackCosts()throws Exception {
  RebuildLayoutTest h=new RebuildLayoutTest();h.setup();try {
   RebuildLayoutTest.bounds=new Rect(0,0,600,500);String text="第一句保留全文。第二句保持完整。第三句不删任何字。";
   CaptionRenderSpec spec=CaptionLanguageContext.explicit("en","zh-Hans").renderSpec;
   plans=0;layouts=0;long begin=System.nanoTime();CaptionOverlay.showEvent(text,()->true,()->"","performance",100,9100,100,spec);
   long planningNanos=System.nanoTime()-begin;int initialLayouts=layouts;
   @SuppressWarnings("unchecked") List<RebuildPageLayout.Page> pages=(List<RebuildPageLayout.Page>)RebuildLayoutTest.field("pendingPages");
   assertFalse(pages.isEmpty());List<Long> timings=new ArrayList<>();
   for(int n=0;n<80;n++){long at=System.nanoTime();CaptionOverlay.position(100+n*100);timings.add(System.nanoTime()-at);}
   assertEquals(text,pages.stream().map(p->p.text).collect(java.util.stream.Collectors.joining()));
   List<Long> sorted=new ArrayList<>(timings);Collections.sort(sorted);
   JSONObject data=new JSONObject().put("pages",N28CGeometryTest.pageRows(pages)).put("plans",plans).put("layouts",layouts).put("initial_layouts",initialLayouts)
       .put("initial_planning_us",planningNanos/1000).put("position_update_us",new JSONArray(timings.stream().map(n->n/1000).collect(java.util.stream.Collectors.toList())))
       .put("median_position_us",sorted.get(40)/1000).put("p95_position_us",sorted.get(75)/1000).put("same_font_and_geometry",true).put("sdk",28).put("shadow_counts_delegate_to_real_production",true);
   Files.write(Path.of(System.getProperty("scheduler.output"),"measured-performance.json"),data.toString(2).getBytes(java.nio.charset.StandardCharsets.UTF_8));
  }finally{h.done();}
 }
}
