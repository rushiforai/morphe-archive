package org.ungoogled.ui;
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
 @Test public void averagePanelHasNoCurrentSpeedOrLimitPair(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());v.bind(zone(),90d,false,true,"");measure(v);
  assertTrue(v.hasContent());assertTrue(v.getWidth()<=210);assertTrue(v.getHeight()<90);
  String text=v.getContentDescription().toString();assertTrue(text.contains("Observed partial average"));assertFalse(text.contains("Current speed"));assertFalse(text.contains("speed limit"));
  Bitmap image=Bitmap.createBitmap(v.getWidth(),v.getHeight(),Bitmap.Config.ARGB_8888);v.draw(new Canvas(image));assertEquals(0,Color.alpha(image.getPixel(0,0)));
 }
 @Test public void metricsWithoutWarningsOrZoneDoNotCreateAnotherSpeedDisplay(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());v.bind(TelemetryStore.View.empty("com.waze"),50d,false,false,"");measure(v);
  assertFalse(v.hasContent());assertEquals(0,v.getMeasuredWidth());assertEquals(0,v.getMeasuredHeight());assertEquals("",v.getContentDescription());
 }
 @Test public void warningPanelContainsOnlyTheWarningAndCollapsesWhenItClears(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());v.bind(TelemetryStore.View.empty("nl.flitsmeister"),100d,false,false,"Emergency vehicle behind");measure(v);
  assertTrue(v.hasContent());assertEquals("Emergency vehicle behind",v.getContentDescription());assertTrue(v.getHeight()<70);
  v.bind(TelemetryStore.View.empty("nl.flitsmeister"),100d,false,true,"");measure(v);assertEquals(0,v.getMeasuredWidth());assertEquals(0,v.getMeasuredHeight());
 }
 @Test public void fullAverageControlWarningWrapsInsteadOfClippingItsSingleMessageLine(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());
  String message="Flitsmeister\nAverage speed check 130 kilometres per hour. Keep your average speed below the limit.";
  v.bind(zone(),130d,false,false,message);measure(v);
  assertTrue(v.getHeight()>100);assertTrue(v.getHeight()<160);assertTrue(v.getContentDescription().toString().contains(message));
  assertTrue(v.getContentDescription().toString().contains("1200 m remaining")||v.getContentDescription().toString().contains("1.2 km remaining"));
 }
 @Test public void legacyCarWarningsKeepFullAccessibilityTextWithoutDrawingAProsePanel(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());String message="Flitsmeister: a long warning which must be spoken rather than cover the map";
  v.bindCar(TelemetryStore.View.empty("nl.flitsmeister"),100d,false,false,message,java.util.Collections.emptyList());measure(v);
  assertEquals(Math.round(nl.johninnl.navigation.alerts.CarWarningPills.WIDTH),v.getWidth());
  assertEquals(Math.round(nl.johninnl.navigation.alerts.CarWarningPills.HEIGHT),v.getHeight());
  assertEquals(message,v.getContentDescription());
  Canvas c=new Canvas(Bitmap.createBitmap(v.getWidth(),v.getHeight(),Bitmap.Config.ARGB_8888));v.draw(c);
  org.robolectric.shadows.ShadowCanvas rendered=Shadows.shadowOf(c);assertEquals(1,rendered.getTextHistoryCount());assertEquals("—",rendered.getDrawnTextEvent(0).text);
 }
 @Test public void speedPillReplacesMapsCardBelowTheWarnings(){
  CompactSpeedView v=new CompactSpeedView(RuntimeEnvironment.getApplication());
  v.bindCar(TelemetryStore.View.empty("nl.flitsmeister"),50d,false,true,"",java.util.Collections.emptyList(),true,43.2);measure(v);
  assertTrue(v.hasContent());assertTrue(v.showsSpeed());
  assertEquals(Math.round(nl.johninnl.navigation.alerts.CarWarningPills.WIDTH),v.getWidth());
  assertEquals(Math.round(nl.johninnl.navigation.alerts.CarWarningPills.HEIGHT),v.getHeight());
  assertEquals("Current speed 43 km/h, speed limit 50",v.getContentDescription().toString());
  Canvas c=new Canvas(Bitmap.createBitmap(v.getWidth(),v.getHeight(),Bitmap.Config.ARGB_8888));v.draw(c);
  java.util.List<String> drawn=new java.util.ArrayList<>();org.robolectric.shadows.ShadowCanvas r=Shadows.shadowOf(c);for(int i=0;i<r.getTextHistoryCount();i++)drawn.add(r.getDrawnTextEvent(i).text);
  assertEquals(java.util.Arrays.asList("50","43","km/h"),drawn);
  v.bindCar(TelemetryStore.View.empty("nl.flitsmeister"),null,false,true,"warning",java.util.Collections.emptyList(),true,null);measure(v);
  assertEquals("A warning pill stacks above the speed pill",Math.round(nl.johninnl.navigation.alerts.CarWarningPills.height(false,1,true)),v.getHeight());
  assertTrue(v.getContentDescription().toString().startsWith("Current speed unknown, speed limit unknown"));
  v.bindCar(TelemetryStore.View.empty("nl.flitsmeister"),50d,false,true,"",java.util.Collections.emptyList());measure(v);
  assertFalse("Without Maps' card there is no speed pill",v.showsSpeed());assertEquals(0,v.getMeasuredHeight());
 }
 private static void measure(View v){v.measure(View.MeasureSpec.makeMeasureSpec(500,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(500,View.MeasureSpec.AT_MOST));v.layout(0,0,v.getMeasuredWidth(),v.getMeasuredHeight());}
}
