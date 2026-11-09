import org.ungoogled.ui.*;
import static org.junit.Assert.*;
import android.location.Location;import android.os.SystemClock;import java.lang.reflect.*;import java.util.*;import nl.johninnl.navigation.alerts.*;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.RobolectricTestRunner;import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk=33,manifest=Config.NONE)
public class MapsRoutePassageTest {
 bmia owner;
 private void route(double[] lat,double[] lon)throws Exception{owner=new anys();owner.c=new RouteController();owner.e=new blot();if(lat!=null){owner.e.b=new yap();owner.e.b.k=new bjix(lat,lon);}MapsGuidanceCoordinator.captureRoute(owner);}
 private Location fix(double lat,float bearing){Location f=new Location("unit-native-fix");f.setLatitude(lat);f.setLongitude(0);f.setSpeed(20);f.setBearing(bearing);f.setAccuracy(3);f.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());return f;}
 private WarningEvent event(double lat)throws Exception{long now=SystemClock.elapsedRealtime();Map<String,Object> m=new HashMap<>();m.put("protocol_version",1);m.put("provider_session",UUID.randomUUID().toString());m.put("sequence",1L);m.put("operation","ANNOUNCE");m.put("warning_id","point");m.put("revision",1L);m.put("announcement_index",1L);m.put("phase","enter");m.put("native_type","SPEED_CAM");m.put("category","speed_control");m.put("priority",1);m.put("message","Camera");m.put("language_tag","en");m.put("message_origin","native_text");m.put("relevance","point_ahead");m.put("relationship","unknown");m.put("observed_elapsed_ms",now);m.put("issued_elapsed_ms",now);m.put("announce_until_elapsed_ms",now+10000);m.put("state_until_elapsed_ms",now+30000);m.put("latitude",lat);m.put("longitude",0d);m.put("position_observed_elapsed_ms",now);m.put("position_estimated",false);m.put("position_clock_origin","native_decision");android.os.Bundle b=new android.os.Bundle();for(Map.Entry<String,Object> entry:m.entrySet()){Object v=entry.getValue();if(v instanceof Boolean)b.putBoolean(entry.getKey(),(Boolean)v);else if(v instanceof String)b.putString(entry.getKey(),(String)v);else if(v instanceof Integer)b.putInt(entry.getKey(),(Integer)v);else if(v instanceof Long)b.putLong(entry.getKey(),(Long)v);else if(v instanceof Double)b.putDouble(entry.getKey(),(Double)v);}return WarningCodec.decode(b,now);}
 private boolean passed(WarningEvent e,Location f)throws Exception{Class<?> telemetry=org.ungoogled.ui.ExternalTelemetry.class;Method select=telemetry.getDeclaredMethod("select",android.content.Context.class,String.class);select.setAccessible(true);select.invoke(null,org.robolectric.RuntimeEnvironment.getApplication(),"nl.flitsmeister");Field position=telemetry.getDeclaredField("fix");position.setAccessible(true);position.set(null,f);Field sf=telemetry.getDeclaredField("scheduler");sf.setAccessible(true);Object scheduler=sf.get(null);Field pf=scheduler.getClass().getDeclaredField("policy");pf.setAccessible(true);Object policy=pf.get(scheduler);Method check=policy.getClass().getMethod("passed",WarningEvent.class,long.class);check.setAccessible(true);boolean answer=(Boolean)check.invoke(policy,e,SystemClock.elapsedRealtime());select.invoke(null,org.robolectric.RuntimeEnvironment.getApplication(),"");return answer;}
 @After public void clear(){if(owner!=null)MapsGuidanceCoordinator.routeEnded(owner);}
 private WarningPassage.Relevance relevance(WarningEvent e,Location f)throws Exception{
  Class<?> telemetry=ExternalTelemetry.class;Method select=telemetry.getDeclaredMethod("select",android.content.Context.class,String.class);select.setAccessible(true);select.invoke(null,org.robolectric.RuntimeEnvironment.getApplication(),"com.waze");
  try{Field position=telemetry.getDeclaredField("fix");position.setAccessible(true);position.set(null,f);Field sf=telemetry.getDeclaredField("scheduler");sf.setAccessible(true);Object scheduler=sf.get(null);Field pf=scheduler.getClass().getDeclaredField("policy");pf.setAccessible(true);return ((WarningScheduler.Policy)pf.get(scheduler)).relevance(e,SystemClock.elapsedRealtime());}
  finally{select.invoke(null,org.robolectric.RuntimeEnvironment.getApplication(),"");}
 }
 @Test public void installedWazePolicyChecksFreshPointsAndRejectsDifferentRoads()throws Exception{
  route(new double[]{0,.01},new double[]{0,0});Location f=fix(.005,0);
  assertEquals(WarningPassage.Relevance.RELEVANT,relevance(event(.006),f));assertEquals(WarningPassage.Relevance.PASSED,relevance(event(.004),f));
  android.os.Bundle b=WarningCodec.encode(event(.006));b.putDouble("longitude",.001);assertEquals(WarningPassage.Relevance.OFF_ROUTE,relevance(WarningCodec.decode(b,SystemClock.elapsedRealtime()),f));
 }
 @Test public void activeUnknownRouteAndStaleFixHoldPointsWithoutBlockingNonspatialEmergency()throws Exception{
  route(null,null);Location f=fix(.005,0);WarningEvent e=event(.006);assertEquals(WarningPassage.Relevance.CONTEXT_UNVERIFIED,relevance(e,f));
  android.os.Bundle b=WarningCodec.encode(e);b.putString("relevance","moving_emergency");b.putLong("announce_until_elapsed_ms",e.issuedAt+5000);assertEquals(WarningPassage.Relevance.RELEVANT,relevance(WarningCodec.decode(b,SystemClock.elapsedRealtime()),null));
  route(new double[]{0,.01},new double[]{0,0});org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(6));
  assertEquals(WarningPassage.Relevance.CONTEXT_UNVERIFIED,relevance(e,f));
 }
 @Test public void routeAheadAroundBendIsNeverRejectedByStraightHeading()throws Exception{route(new double[]{.001,.002,.002,.0004,.0004},new double[]{0,0,.0005,.0005,0});Location f=fix(.001,0);WarningEvent e=event(.0004);assertTrue(WarningPassage.passed(e,f,SystemClock.elapsedRealtime()));assertFalse(passed(e,f));}
 @Test public void activeRouteWithoutUsableGeometryLeavesPassageUnknown()throws Exception{route(null,null);assertFalse(passed(event(.0004),fix(.001,0)));}
 @Test public void directedRouteRecognizesAFormerPointDespiteOppositeCurrentBearing()throws Exception{route(new double[]{0,.01},new double[]{0,0});assertTrue(passed(event(.0044),fix(.005,180)));}
 @Test public void noActiveRouteRetainsConservativeHeadingFallback()throws Exception{assertTrue(passed(event(.0004),fix(.001,0)));}
}
