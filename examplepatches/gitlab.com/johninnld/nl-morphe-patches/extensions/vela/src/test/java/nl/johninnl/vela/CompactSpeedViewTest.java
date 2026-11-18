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
 @Test public void phoneUsesTheCarSpeedPillWithTheZonePillAboveIt(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());v.bind(zone(),82/3.6f,90d,false,true,"");measure(v);
  float stack=nl.johninnl.navigation.alerts.CarWarningPills.height(true,0,true);
  assertEquals((int)Math.ceil(nl.johninnl.navigation.alerts.CarWarningPills.WIDTH+2*CompactSpeedView.SHADOW),v.getWidth());
  assertEquals((int)Math.ceil(stack+2*CompactSpeedView.SHADOW),v.getHeight());
  Bitmap b=Bitmap.createBitmap(v.getWidth(),v.getHeight(),Bitmap.Config.ARGB_8888);Canvas c=new Canvas(b);v.draw(c);
  java.util.List<String> drawn=texts(c);
  assertTrue(drawn.toString(),drawn.contains("82"));assertTrue(drawn.contains("90"));assertTrue(drawn.contains("km/h"));
  assertFalse("No Average/percent prose in the pill",drawn.toString().contains("Average")||drawn.toString().contains("%"));
  assertTrue(v.getContentDescription().toString().contains("observed partial average"));
 }
 @Test public void speedOnlyIsOneSpeedPillAndLegacyProseStaysOutOfTheDrawing(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());v.bind(TelemetryStore.View.empty("com.waze"),50/3.6f,50d,false,false,"");measure(v);
  assertEquals((int)Math.ceil(nl.johninnl.navigation.alerts.CarWarningPills.WIDTH+2*CompactSpeedView.SHADOW),v.getWidth());
  assertEquals((int)Math.ceil(nl.johninnl.navigation.alerts.CarWarningPills.HEIGHT+2*CompactSpeedView.SHADOW),v.getHeight());
  String prose="Flitsmeister\nSpeed camera ahead on the A4";
  v.bind(TelemetryStore.View.empty("nl.flitsmeister"),50/3.6f,50d,false,false,prose);measure(v);
  assertTrue(v.getHeight()>=2*nl.johninnl.navigation.alerts.CarWarningPills.HEIGHT+nl.johninnl.navigation.alerts.CarWarningPills.GAP);
  Canvas c=new Canvas(Bitmap.createBitmap(v.getWidth(),v.getHeight(),Bitmap.Config.ARGB_8888));v.draw(c);
  assertFalse(texts(c).toString().contains("Speed camera"));assertTrue(texts(c).contains("—"));
  assertTrue(v.getContentDescription().toString().contains(prose));
 }
 private static void measure(View v){v.measure(View.MeasureSpec.makeMeasureSpec(500,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(500,View.MeasureSpec.AT_MOST));v.layout(0,0,v.getMeasuredWidth(),v.getMeasuredHeight());}
 private static java.util.List<String> texts(Canvas c){org.robolectric.shadows.ShadowCanvas s=Shadows.shadowOf(c);java.util.List<String> out=new java.util.ArrayList<>();for(int i=0;i<s.getTextHistoryCount();i++)out.add(s.getDrawnTextEvent(i).text);return out;}
 @Test public void zeroAndUnknownRemainDifferentWithoutExtraVisibleHeadings(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());v.bind(TelemetryStore.View.empty("com.waze"),null,null,false,false,"");assertTrue(v.getContentDescription().toString().contains("Current speed unknown"));
  v.bind(TelemetryStore.View.empty("com.waze"),0f,50d,false,false,"");assertTrue(v.getContentDescription().toString().startsWith("Current speed 0"));assertFalse(v.getContentDescription().toString().contains("Flitsmeister"));
 }
}
