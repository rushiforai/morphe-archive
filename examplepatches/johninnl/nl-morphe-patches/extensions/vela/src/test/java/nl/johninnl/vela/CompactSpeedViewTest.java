package nl.johninnl.vela;
import static org.junit.Assert.*;
import android.graphics.*;import android.view.View;
import org.junit.Test;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.Config;
import java.util.Map;
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE,qualifiers="mdpi")
public class CompactSpeedViewTest {
 private TelemetryStore.View zone(){
  TelemetryStore s=new TelemetryStore();s.select("com.waze");Map<String,Object> p=TelemetryStoreTest.packet("com.waze","w1",1,5000);
  p.put("zone_status","active");p.put("zone_session",1L);p.put("zone_segment_id","z");p.put("zone_remaining_m",1200);p.put("zone_progress_percent",35d);p.put("zone_progress_estimated",true);p.put("zone_observation_start_elapsed_ms",1000L);p.put("zone_observed_distance_m",100);p.put("zone_average_partial",true);p.put("zone_average_speed_kmh",90d);s.accept(p,"com.waze",5000);return s.view(5000);
 }
 @Test public void nativeWidgetIsCompactAndHasNoEnclosingFill(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());v.bind(zone(),82/3.6f,90d,false,true,"");
  v.measure(View.MeasureSpec.makeMeasureSpec(300,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(300,View.MeasureSpec.AT_MOST));v.layout(0,0,v.getMeasuredWidth(),v.getMeasuredHeight());
  assertTrue(v.getWidth()<=140);assertTrue(v.getHeight()<=120);
  Bitmap b=Bitmap.createBitmap(v.getWidth(),v.getHeight(),Bitmap.Config.ARGB_8888);v.draw(new Canvas(b));
  assertEquals(0,Color.alpha(b.getPixel(0,0)));assertEquals(0,Color.alpha(b.getPixel(53,24)));assertEquals(0,Color.alpha(b.getPixel(v.getWidth()-1,v.getHeight()-1)));
  assertTrue(v.getContentDescription().toString().contains("observed partial average"));
 }
 @Test public void zeroAndUnknownRemainDifferentWithoutExtraVisibleHeadings(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());v.bind(TelemetryStore.View.empty("com.waze"),null,null,false,false,"");assertTrue(v.getContentDescription().toString().contains("Current speed unknown"));
  v.bind(TelemetryStore.View.empty("com.waze"),0f,50d,false,false,"");assertTrue(v.getContentDescription().toString().startsWith("Current speed 0"));assertFalse(v.getContentDescription().toString().contains("Flitsmeister"));
 }
}
