package nl.johninnl.vela;
import static org.junit.Assert.*;
import android.app.Application;import android.location.Location;import android.os.Looper;import android.os.SystemClock;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.Config;
import java.time.Duration;
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE,qualifiers="en-rUS")
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
 @Test public void locationSettingsFollowTheSelectedProviderRatherThanTheReceiver(){
  for(String provider:new String[]{TelemetryStore.WAZE,TelemetryStore.FLITSMEISTER}){
   TelemetryRuntime.select(provider);TelemetryRuntime.openProviderLocationSettings();
   android.content.Intent intent=org.robolectric.Shadows.shadowOf(app).getNextStartedActivity();
   assertNotNull(intent);assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS,intent.getAction());
   assertEquals("package:"+provider,intent.getDataString());assertEquals(provider,TelemetryRuntime.selected());
  }
  assertNull(nl.johninnl.navigation.startup.ProviderSettings.locationIntent("app.vela"));
  assertNull(nl.johninnl.navigation.startup.ProviderSettings.locationIntent("unknown.package"));
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
 @Test public void selectedProviderStartupFollowsNavigationAndNativeSourceStopsIt(){
  assertTrue(TelemetryRuntime.providerServiceStatus().contains("paused"));TelemetryRuntime.setNavigationActive(true);
  assertFalse(TelemetryRuntime.providerServiceStatus().contains("paused"));TelemetryRuntime.setNavigationActive(false);
  assertTrue(TelemetryRuntime.providerServiceStatus().contains("paused"));TelemetryRuntime.select("");assertEquals("Vela",TelemetryRuntime.statusText());
 }
 @Test public void visibleCarSessionStartsProviderWithoutPhoneActivityOrMapFrame() throws Exception {
  Object session=new Object();java.lang.reflect.Method visible=TelemetryRuntime.class.getMethod("setCarSessionVisible",Object.class,boolean.class);
  assertTrue(TelemetryRuntime.providerServiceStatus().contains("paused"));visible.invoke(null,session,true);
  assertFalse(TelemetryRuntime.providerServiceStatus().contains("paused"));visible.invoke(null,session,false);
  assertTrue(TelemetryRuntime.providerServiceStatus().contains("paused"));
 }
 @Test public void bothProvidersDistinguishIncomingDataFromAnUnconnectedWarningBridge() throws Exception {
  for(String provider:new String[]{TelemetryStore.WAZE,TelemetryStore.FLITSMEISTER}){
   TelemetryRuntime.select(provider);
   assertTrue(TelemetryRuntime.warningBridgeStatus().contains("not connected"));
   TelemetryStore store=org.robolectric.util.ReflectionHelpers.getStaticField(TelemetryRuntime.class,"store");
   assertTrue(store.accept(TelemetryStoreTest.packet(provider,"status-data",1,SystemClock.elapsedRealtime()),provider,SystemClock.elapsedRealtime()));
   assertTrue(TelemetryRuntime.dataStatus().contains("Receiving data from"));
   assertTrue("Telemetry alone must not prove the warning API works",TelemetryRuntime.warningBridgeStatus().contains("not connected"));
   assertTrue(TelemetryRuntime.statusText().startsWith(TelemetryRuntime.providerName()+" · ○ Warnings:"));
  }
 }
 @Test public void realWarningHandshakeIsReportedForEachProviderAndSourceSwitchClearsIt() throws Exception {
  org.robolectric.shadows.ShadowProcess.setUid(20000);
  android.provider.Settings.Global.putInt(app.getContentResolver(),android.provider.Settings.Global.BOOT_COUNT,7);
  for(String provider:new String[]{TelemetryStore.WAZE,TelemetryStore.FLITSMEISTER}){
   TelemetryRuntime.select(provider);
   android.content.pm.PackageInfo info=new android.content.pm.PackageInfo();info.packageName=provider;
   info.applicationInfo=new android.content.pm.ApplicationInfo();info.applicationInfo.packageName=provider;info.applicationInfo.uid=20000;
   org.robolectric.Shadows.shadowOf(app.getPackageManager()).installPackage(info);
   nl.johninnl.navigation.alerts.WarningSession session=org.robolectric.util.ReflectionHelpers.getStaticField(TelemetryRuntime.class,"semantic");
   nl.johninnl.navigation.startup.NavigationClient startup=org.robolectric.util.ReflectionHelpers.getStaticField(TelemetryRuntime.class,"startup");
   long generation=org.robolectric.util.ReflectionHelpers.getField(startup,"generation");
   nl.johninnl.navigation.alerts.WarningCapabilities caps=new nl.johninnl.navigation.alerts.WarningCapabilities(
     nl.johninnl.navigation.alerts.WazeWarningTypes.MANIFEST_DIGEST,nl.johninnl.navigation.alerts.WarningProviders.required(provider),true);
   try(nl.johninnl.navigation.alerts.WarningEndpoint endpoint=new nl.johninnl.navigation.alerts.WarningEndpoint(app,uid->uid==20000?app.getPackageName():null,caps)){
    android.os.Bundle status=new android.os.Bundle();status.putBinder("warning_api",endpoint.binder());status.putIntArray("warning_protocols",new int[]{1});
    assertTrue(session.prepare(provider,status,generation));
    assertEquals("✓ Warnings: connected to "+TelemetryRuntime.providerName(),TelemetryRuntime.warningBridgeStatus());
    assertTrue("A working warning bridge does not require a speed fix",TelemetryRuntime.dataStatus().contains("No recent data"));
    org.robolectric.util.ReflectionHelpers.setField(session,"captureComplete",false);
    assertEquals("! Warnings: connected to "+TelemetryRuntime.providerName()+" · some warning types unavailable",TelemetryRuntime.warningBridgeStatus());
    TelemetryRuntime.select("");assertEquals("Vela",TelemetryRuntime.statusText());
    TelemetryRuntime.select(provider);assertTrue("The previous session cannot mark a new selection connected",TelemetryRuntime.warningBridgeStatus().contains("not connected"));
   }
  }
 }
 @Test public void bridgeFailureAndConnectingStatesRemainVisibleWithoutTelemetry() throws Exception {
  for(String provider:new String[]{TelemetryStore.WAZE,TelemetryStore.FLITSMEISTER}){
   TelemetryRuntime.select(provider);
   nl.johninnl.navigation.alerts.WarningSession session=org.robolectric.util.ReflectionHelpers.getStaticField(TelemetryRuntime.class,"semantic");
   nl.johninnl.navigation.startup.NavigationClient startup=org.robolectric.util.ReflectionHelpers.getStaticField(TelemetryRuntime.class,"startup");
   long generation=org.robolectric.util.ReflectionHelpers.getField(startup,"generation");
   assertTrue(session.prepare(provider,new android.os.Bundle(),generation));
   assertEquals("! Warnings: update the patches for "+TelemetryRuntime.providerName(),TelemetryRuntime.warningBridgeStatus());
   android.os.Bundle incompatible=new android.os.Bundle();incompatible.putIntArray("warning_protocols",new int[]{2});
   assertFalse(session.prepare(provider,incompatible,generation));
   assertEquals("! Warnings: update the patches for "+TelemetryRuntime.providerName(),TelemetryRuntime.warningBridgeStatus());
   org.robolectric.util.ReflectionHelpers.setField(session,"state","connecting");assertEquals("… Warnings: connecting to "+TelemetryRuntime.providerName(),TelemetryRuntime.warningBridgeStatus());
   org.robolectric.util.ReflectionHelpers.setField(session,"state","disconnected");assertEquals("! Warnings: connection lost · reconnecting",TelemetryRuntime.warningBridgeStatus());
  }
 }
 @Test public void settingsRepublishBridgeHealthWithoutAChangeInSpeedOrEngineState(){
  TelemetryRuntime.resetForTest();final int[] changes={0};TelemetryRuntime.init(app,()->changes[0]++);TelemetryRuntime.select(TelemetryStore.FLITSMEISTER);
  org.robolectric.Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));int before=changes[0];
  nl.johninnl.navigation.alerts.WarningSession session=org.robolectric.util.ReflectionHelpers.getStaticField(TelemetryRuntime.class,"semantic");
  org.robolectric.util.ReflectionHelpers.setField(session,"state","incompatible");
  org.robolectric.Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  assertTrue("The settings must observe bridge-state changes even without a snapshot callback",changes[0]>before);
 }
 @Test public void telemetryExpiryDoesNotLeaveSettingsClaimingFreshData(){
  TelemetryStore store=org.robolectric.util.ReflectionHelpers.getStaticField(TelemetryRuntime.class,"store");
  long now=SystemClock.elapsedRealtime();assertTrue(store.accept(TelemetryStoreTest.packet(TelemetryStore.WAZE,"status-expiry",1,now),TelemetryStore.WAZE,now));
  assertTrue(TelemetryRuntime.dataStatus().contains("Receiving data from"));
  org.robolectric.Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(11));
  assertEquals("! No recent data from De-Waze · Vela is using its own data",TelemetryRuntime.dataStatus());
 }
 @Test @Config(qualifiers="nl-rNL") public void dutchSettingsExplainBridgeAndFallbackForBothProviders(){
  for(String provider:new String[]{TelemetryStore.WAZE,TelemetryStore.FLITSMEISTER}){
   TelemetryRuntime.select(provider);
   assertEquals("○ Waarschuwingen: niet verbonden met "+TelemetryRuntime.providerName(),TelemetryRuntime.warningBridgeStatus());
   assertEquals("! Geen recente gegevens van "+TelemetryRuntime.providerName()+" · Vela gebruikt eigen gegevens",TelemetryRuntime.dataStatus());
   assertTrue(TelemetryRuntime.providerServiceStatus().startsWith("○ "+TelemetryRuntime.providerName()));
  }
 }

}
