package nl.johninnl.vela;
import static org.junit.Assert.*;
import android.app.Application;import android.location.Location;import android.os.Looper;import android.os.SystemClock;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.Config;
import java.time.Duration;
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class TelemetryRuntimeTest {
 Application app;
 @Before public void setup(){app=RuntimeEnvironment.getApplication();app.getSharedPreferences("vela_settings",0).edit().clear().putBoolean("flock_cameras_on",true).commit();TelemetryRuntime.resetForTest();TelemetryRuntime.init(app,()->{});TelemetryRuntime.select("com.waze");org.robolectric.Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(40));}
 @After public void reset(){TelemetryRuntime.resetForTest();}
 public static class Renderer { public Object p=new Object();public long H;public double q=0,w=0; }
 public static class Provider { public Object e;public boolean f; }
 Location location(String provider,Float speed,long age){Location l=new Location(provider);l.setLatitude(38.5449);l.setLongitude(-121.754);l.setAccuracy(4);l.setBearing(90);if(speed!=null)l.setSpeed(speed);l.setElapsedRealtimeNanos((SystemClock.elapsedRealtime()-age)*1000000);l.setTime(System.currentTimeMillis()-age);return l;}
 @Test public void missingNativeSpeedIsUnknownButMeasuredStationaryZeroIsValid(){
  Renderer r=new Renderer();r.H=SystemClock.elapsedRealtime();
  TelemetryRuntime.nativeSample(location("gps",null,0));TelemetryRuntime.carFrame(r);
  assertEquals("—",TelemetryRuntime.carCurrentLabel(r,"0"));assertNull(TelemetryRuntime.speedMps((Float)0f));
  TelemetryRuntime.nativeSample(location("gps",0f,0));
  assertEquals("0",TelemetryRuntime.carCurrentLabel(r,"0"));assertEquals(0,TelemetryRuntime.speedMps((Float)0f),0);
 }
 @Test public void staleNativeSampleCannotBeRevivedByFreshRendererArrival(){
  Renderer r=new Renderer();r.H=SystemClock.elapsedRealtime();
  TelemetryRuntime.nativeSample(location("gps",20f,30000));TelemetryRuntime.carFrame(r);
  assertNull(TelemetryRuntime.lastFix());assertEquals(-1,TelemetryRuntime.fixAt());assertEquals("—",TelemetryRuntime.carCurrentLabel(r,"0"));
 }
 @Test public void replayArrivalClockRequiresNativeReplayAuthorization(){
  Provider provider=new Provider();TelemetryRuntime.bindLocationProvider(provider);
  Location replay=location("replay",20f,0);replay.setElapsedRealtimeNanos(0);replay.setTime(1);
  TelemetryRuntime.nativeSample(replay);assertNull(TelemetryRuntime.lastFix());
  provider.f=true;TelemetryRuntime.nativeSample(replay);assertNotNull(TelemetryRuntime.lastFix());assertEquals(SystemClock.elapsedRealtime(),TelemetryRuntime.fixAt());
 }
 @Test public void providerChoiceDoesNotWriteSavedFlockChoice(){
  assertTrue(app.getSharedPreferences("vela_settings",0).getBoolean("flock_cameras_on",false));
  TelemetryRuntime.select("");assertTrue(app.getSharedPreferences("vela_settings",0).getBoolean("flock_cameras_on",false));
 }
 @Test public void nativeFallbackExpiryPublishesUnknownWithoutAnotherBroadcast(){
  TelemetryRuntime.resetForTest();final int[] updates={0};
  TelemetryRuntime.init(app,()->updates[0]++);TelemetryRuntime.select("com.waze");
  org.robolectric.Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  TelemetryRuntime.nativeSample(location("gps",20f,0));
  org.robolectric.Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  assertNotNull(TelemetryRuntime.phoneSpeedValue());int beforeExpiry=updates[0];
  org.robolectric.Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(5));
  assertNull(TelemetryRuntime.phoneSpeedValue());assertTrue("phone must receive expiry invalidation",updates[0]>beforeExpiry);
 }
 @Test public void olderOrPoorSampleCannotDiscardANewerAcceptedSpeed(){
  TelemetryRuntime.nativeSample(location("gps",20f,0));long accepted=TelemetryRuntime.fixAt();
  TelemetryRuntime.nativeSample(location("gps",null,1000));
  Location poor=location("gps",null,0);poor.setAccuracy(100);TelemetryRuntime.nativeSample(poor);
  assertEquals(accepted,TelemetryRuntime.fixAt());assertEquals(20,TelemetryRuntime.phoneSpeedValue(),0);
 }
 public static class Voice { public boolean n=false,o=false;public String last="";public void j(String text,boolean interrupt,boolean ignoreMute){last=text;assertFalse(ignoreMute);} }
 public static class Session { public Flow f=new Flow(); }
 public static class Flow { public NavState value=new NavState();public Object getValue(){return value;} }
 public static class NavState { public boolean a=true,b=false,c=false;public Route d=new Route(); }
 public static class Point { final double lat,lon;Point(double lat,double lon){this.lat=lat;this.lon=lon;}public double getLat(){return lat;}public double getLng(){return lon;} }
 public static class Route { public java.util.List<Point> getPolyline(){return java.util.Arrays.asList(new Point(38.5449,-121.754),new Point(38.5449,-121.752),new Point(38.5469,-121.752));} }
 @Test public void coldCarSessionUsesItsRouteWithoutPhoneNavigationServiceOrBearing(){
  TelemetryRuntime.bindNavSession(new Session());TelemetryRuntime.setNavigationActive(false);
  Voice voice=new Voice();TelemetryRuntime.bindVoice(voice);TelemetryRuntime.setSpokenEnabled(true);
  Location own=location("gps",20f,0);own.removeBearing();TelemetryRuntime.nativeSample(own);
  long at=SystemClock.elapsedRealtime();java.util.Map<String,Object> fields=TelemetryStoreTest.packet("com.waze","car-route",1,at);
  fields.put("alerts_status","valid");fields.put("alerts_updated_elapsed_ms",at);fields.put("alerts_max_age_ms",30000L);
  fields.put("alert_ids",new String[]{"bend"});fields.put("alert_kinds",new String[]{"camera"});fields.put("alert_titles",new String[]{""});fields.put("alert_distance_m",new int[]{-1});fields.put("alert_trigger_m",new int[]{600});fields.put("alert_latitude",new double[]{38.546});fields.put("alert_longitude",new double[]{-121.752});fields.put("alert_updated_elapsed_ms",new long[]{at});
  android.content.Intent intent=new android.content.Intent(TelemetryRuntime.ACTION);android.os.Bundle extras=new android.os.Bundle();
  for(java.util.Map.Entry<String,Object> e:fields.entrySet())extras.putSerializable(e.getKey(),(java.io.Serializable)e.getValue());
  intent.putExtras(extras);app.sendBroadcast(intent);org.robolectric.Shadows.shadowOf(Looper.getMainLooper()).idle();
  assertTrue("car-only route finds a report around a bend without heading",TelemetryRuntime.warningText().startsWith("Speed camera"));
  assertTrue("active car navigation speaks while phone UI and service are absent",voice.last.startsWith("Speed camera"));
 }
}
