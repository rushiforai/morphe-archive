package nl.johninnl.flitsmeister;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.app.Application;
import android.content.Intent;
import android.location.Location;
import android.os.Looper;
import java.time.Duration;
import java.util.List;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE)
public class NavigationBroadcastsTest {
 Application app;
 @Before public void setup()throws Exception { app=RuntimeEnvironment.getApplication(); NavigationBroadcasts.resetForTest(); nl.flitsmeister.fmcore.models.eventbuses.AppNotificationBus.version15=false;
  nl.johninnl.navigation.alerts.WarningEndpoint endpoint=nl.johninnl.navigation.alerts.WarningEndpointFixtures.empty();
  long deadline=System.nanoTime()+java.util.concurrent.TimeUnit.SECONDS.toNanos(2);
  while("INITIALIZING".equals(endpoint.audioStatus())&&System.nanoTime()<deadline)Thread.sleep(1);
  assertNotEquals("Storage initialization must finish before testing ordinary legacy delivery","INITIALIZING",endpoint.audioStatus());
  NativeWarnings.setEndpointForTest(endpoint); NavigationBroadcasts.init(app); }
 @After public void cleanup(){NativeWarnings.setEndpointForTest(null);}
 Intent last() { List<Intent> e=shadowOf(app).getBroadcastIntents(); return e.get(e.size()-1); }
 Location fix(float speed) { Location l=new Location("gps"); l.setLatitude(52); l.setLongitude(5); l.setAccuracy(4); l.setSpeed(speed); l.setElapsedRealtimeNanos(android.os.SystemClock.elapsedRealtimeNanos()); return l; }
 @Test public void sharedContractWorksWithoutOverlay() {
  NavigationBroadcasts.location(fix(20)); NavigationBroadcasts.limit(100,"metric");
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  assertEquals("nl.johninnl.navigation.NAVIGATION_STATE",last().getAction());
  assertEquals(app.getPackageName(),last().getStringExtra("source_package"));
  assertEquals(72,last().getDoubleExtra("current_speed_kmh",-1),0.0001);
  assertEquals(100,last().getDoubleExtra("road_speed_limit_kmh",-1),0);
 }
 @Test public void zeroIsValidButMissingSpeedCannotReuseIt() {
  NavigationBroadcasts.location(fix(0)); assertEquals(0,last().getDoubleExtra("current_speed_kmh",-1),0);
  Location l=fix(20); l.removeSpeed(); NavigationBroadcasts.location(l);
  assertEquals("unknown",last().getStringExtra("current_speed_status")); assertFalse(last().hasExtra("current_speed_kmh"));
 }
 @Test public void stopClearsAllMetrics() {
  NavigationBroadcasts.location(fix(20)); NavigationBroadcasts.limit(65,"imperial"); NavigationBroadcasts.stopped();
  assertEquals("unknown",last().getStringExtra("current_speed_status")); assertFalse(last().hasExtra("current_speed_kmh")); assertFalse(last().hasExtra("road_speed_limit_kmh"));
 }
 @Test public void uncertainOutputKeepsSpeedFeedButMasksLegacyAnnouncementFields() throws Exception {
  android.content.pm.PackageInfo info=new android.content.pm.PackageInfo();info.packageName="app.vela";
  info.applicationInfo=new android.content.pm.ApplicationInfo();info.applicationInfo.packageName=info.packageName;info.applicationInfo.uid=10001;
  shadowOf(app.getPackageManager()).installPackage(info);
  nl.johninnl.navigation.alerts.WarningEndpoint failed=nl.johninnl.navigation.alerts.WarningEndpointFixtures.failing();
  long until=System.nanoTime()+java.util.concurrent.TimeUnit.SECONDS.toNanos(2);
  while(!failed.exclusiveAudio()&&System.nanoTime()<until)Thread.sleep(1);
  assertTrue("Unknown durable output must remain fenced",failed.exclusiveAudio());
  NativeWarnings.setEndpointForTest(failed);NavigationBroadcasts.resetForTest();NavigationBroadcasts.init(app);
  NavigationBroadcasts.location(fix(20));NavigationBroadcasts.limit(100,"metric");
  Intent masked=last();assertEquals("app.vela",masked.getPackage());
  assertEquals("disabled",masked.getStringExtra("alerts_status"));assertEquals("disabled",masked.getStringExtra("zone_approach_status"));
  assertEquals(72,masked.getDoubleExtra("current_speed_kmh",-1),0.0001);assertEquals(100,masked.getDoubleExtra("road_speed_limit_kmh",-1),0);
  assertFalse(masked.hasExtra("alert_ids"));assertFalse(masked.hasExtra("zone_approach_id"));
 }
 @Test public void deliveredOldGpsFixDoesNotBecomeFresh() {
  Location l=fix(20); l.setElapsedRealtimeNanos(1); NavigationBroadcasts.location(l);
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(6));
  assertEquals("stale",last().getStringExtra("current_speed_status")); assertFalse(last().hasExtra("current_speed_kmh"));
 }
 public static class Point { public double a,b; Point(double latitude,double longitude){a=latitude;b=longitude;} }
 public static class Segment {
  public int getIndex(){return 2;}
  public java.util.List<Point> getGpsPath(){return java.util.Arrays.asList(new Point(52,5),new Point(52,5.02));}
 }
 public static class Report {
  public String getId(){return "zone-a";}
  public java.util.List<Segment> getSegments(){return java.util.Arrays.asList(new Segment());}
 }
 public static class ReportB extends Report { @Override public String getId(){return "zone-b";} }
 public static class Task { public Report d=new Report(); }
 @Test public void trackedAverageSpeedReportAlsoReachesTheWarningChannel() {
  java.util.List<android.os.Bundle> warnings=new java.util.ArrayList<>();NativeWarnings.resetForTest(app,warnings::add);
  Task task=new Task(); Location first=fix(20); first.setLongitude(5.005);
  NavigationBroadcasts.zone(task,first); shadowOf(Looper.getMainLooper()).idle();
  android.os.Bundle zone=null;for(android.os.Bundle b:warnings)if("AvgSpeedCheck:zone-a".equals(b.getString("warning_id")))zone=b;
  assertNotNull(zone);assertEquals("AVG_SPEED_CHECK",zone.getString("native_type"));assertEquals("enter",zone.getString("phase"));
  assertEquals("UPSERT",zone.getString("operation"));assertEquals("remaining_in_segment",zone.getString("native_distance_kind"));
  assertTrue(zone.getInt("distance_m",-1)>0);
 }
 /** One control in two segments, listed out of order: segment 1 starts it, segment 2 ends it. */
 public static class IndexedSegment extends Segment {
  final int index; final java.util.List<Point> path;
  IndexedSegment(int index,Point... path){this.index=index;this.path=java.util.Arrays.asList(path);}
  @Override public int getIndex(){return index;}
  @Override public java.util.List<Point> getGpsPath(){return path;}
 }
 public static class TwoSegmentReport extends Report {
  @Override public String getId(){return "a2-north";}
  @Override public java.util.List<Segment> getSegments(){return java.util.Arrays.asList(
   new IndexedSegment(2,new Point(52,5.01),new Point(52,5.02)),new IndexedSegment(1,new Point(52,5),new Point(52,5.01)));}
 }
 static android.os.Bundle lastFor(java.util.List<android.os.Bundle> warnings,String id){
  android.os.Bundle found=null;for(android.os.Bundle b:warnings)if(id.equals(b.getString("warning_id")))found=b;return found;
 }
 @Test public void averageSpeedControlMarksItsOwnStartBeforeEntryAndItsOwnEndInside() {
  java.util.List<android.os.Bundle> warnings=new java.util.ArrayList<>();NativeWarnings.resetForTest(app,warnings::add);
  Task task=new Task(); task.d=new TwoSegmentReport();
  Location approaching=fix(20); approaching.setLongitude(4.995);
  NavigationBroadcasts.zone(task,approaching); shadowOf(Looper.getMainLooper()).idle();
  android.os.Bundle start=lastFor(warnings,"AvgSpeedCheck:a2-north");
  assertNotNull(start);assertEquals("approach",start.getString("phase"));assertEquals("zone",start.getString("relevance"));
  assertEquals("start",start.getString("zone_point"));assertEquals("to_segment",start.getString("native_distance_kind"));
  assertEquals(52,start.getDouble("latitude"),0);assertEquals(5,start.getDouble("longitude"),0);
  assertTrue(start.getBoolean("native_point_target"));assertFalse(start.getBoolean("position_estimated",true));
  assertEquals("native_report_geometry",start.getString("position_clock_origin"));
  assertEquals(start.getLong("distance_observed_elapsed_ms"),start.getLong("position_observed_elapsed_ms"));

  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  Location inside=fix(20); inside.setLongitude(5.015);
  NavigationBroadcasts.zone(task,inside); shadowOf(Looper.getMainLooper()).idle();
  android.os.Bundle end=lastFor(warnings,"AvgSpeedCheck:a2-north");
  assertEquals("enter",end.getString("phase"));assertEquals("end",end.getString("zone_point"));
  assertEquals("remaining_in_segment",end.getString("native_distance_kind"));
  assertEquals("The joined control keeps one point pair: the last point of its last segment",5.02,end.getDouble("longitude"),0);
  assertEquals(52,end.getDouble("latitude"),0);assertTrue(end.getBoolean("native_point_target"));
  for(android.os.Bundle b:warnings)if("AvgSpeedCheck:a2-north".equals(b.getString("warning_id"))&&b.containsKey("longitude")){
   double lon=b.getDouble("longitude");assertTrue("Only the control's own start or end, never a point along it",lon==5||lon==5.02);}
  assertFalse("No polyline is shipped",end.containsKey("gps_path"));

  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  Location past=fix(20); past.setLongitude(5.03);
  NavigationBroadcasts.zone(task,past); shadowOf(Looper.getMainLooper()).idle();
  assertEquals("Leaving the control clears it, and its marker with it","CLEAR",lastFor(warnings,"AvgSpeedCheck:a2-north").getString("operation"));
 }
 @Test public void zoneProgressAndAverageUseSameObservedDistanceContractAsWaze() {
  Task task=new Task(); Location first=fix(20); first.setLongitude(5.005);
  NavigationBroadcasts.zone(task,first);
  assertEquals("active",last().getStringExtra("zone_status"));
  assertEquals("zone-a",last().getStringExtra("zone_segment_id"));
  assertTrue(last().getBooleanExtra("zone_progress_estimated",false));
  assertTrue(last().getBooleanExtra("zone_average_partial",false));
  assertFalse(last().hasExtra("zone_average_speed_kmh"));
  long start=last().getLongExtra("zone_observation_start_elapsed_ms",-1);
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(4));
  Location next=fix(20); next.setLongitude(5.0065); NavigationBroadcasts.location(next);
  Intent event=last();
  double expected=event.getIntExtra("zone_observed_distance_m",-1)*3600.0/
      (event.getLongExtra("zone_updated_elapsed_ms",-1)-start);
  assertEquals(expected,event.getDoubleExtra("zone_average_speed_kmh",-1),0.00001);
  Location outside=fix(20); outside.setLatitude(52.01); NavigationBroadcasts.location(outside);
  assertEquals("inactive",last().getStringExtra("zone_status"));
  assertFalse(last().hasExtra("zone_average_speed_kmh"));
 }
 @Test public void commonRequestDoesNotRefreshUnderlyingObservationTimes() {
  NavigationBroadcasts.location(fix(20)); NavigationBroadcasts.limit(65,"imperial");
  long at=last().getLongExtra("road_updated_elapsed_ms",-1);
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
  app.sendBroadcast(new Intent("nl.johninnl.navigation.NAVIGATION_STATE_REQUEST")); shadowOf(Looper.getMainLooper()).idle();
  assertEquals(at,last().getLongExtra("road_updated_elapsed_ms",-2));
  assertEquals(104.60736,last().getDoubleExtra("road_speed_limit_kmh",-1),0.00001);
 }

 @Test public void unrestrictedRoadFlagMustNotEraseAnEffectiveVehicleLimit() throws Exception {
  Class.forName("hmf").getField("f").setInt(null,80);
  Class.forName("hmf").getField("d").setBoolean(null,true);
  Class.forName("r65").getField("b").setInt(null,1);
  NavigationBroadcasts.road();
  assertEquals(80,last().getDoubleExtra("road_speed_limit_kmh",-1),0);
 }

 @Test public void reorderedZoneDetectionCannotReplaceNewerCandidateGeometry() {
  Task oldTask=new Task(); Location oldFix=fix(20); oldFix.setLongitude(5.005);
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  Task newerTask=new Task(); newerTask.d=new ReportB();
  Location newerFix=fix(20); newerFix.setLongitude(5.006);
  NavigationBroadcasts.zone(newerTask,newerFix);
  NavigationBroadcasts.zone(oldTask,oldFix);
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  Location next=fix(20); next.setLongitude(5.007); NavigationBroadcasts.location(next);
  assertEquals("zone-b",last().getStringExtra("zone_segment_id"));
 }

 @Test public void nativeCandidateApproachPrecedesPartialAverageAndExpires() {
  Task task=new Task();Location approaching=fix(20);approaching.setLongitude(4.995);
  NavigationBroadcasts.zone(task,approaching);
  assertEquals("ahead",last().getStringExtra("zone_approach_status"));
  assertTrue(last().getIntExtra("zone_approach_distance_m",-1)>300);
  assertTrue(last().getBooleanExtra("zone_approach_distance_estimated",false));
  assertEquals("inactive",last().getStringExtra("zone_status"));
  assertFalse(last().hasExtra("zone_average_speed_kmh"));
  long at=last().getLongExtra("zone_approach_updated_elapsed_ms",-1);
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(31));
  app.sendBroadcast(new Intent("nl.johninnl.navigation.NAVIGATION_STATE_REQUEST"));shadowOf(Looper.getMainLooper()).idle();
  assertEquals("stale",last().getStringExtra("zone_approach_status"));
  assertEquals(at,last().getLongExtra("zone_approach_updated_elapsed_ms",-2));
  NavigationBroadcasts.zoneStopped();assertEquals("inactive",last().getStringExtra("zone_approach_status"));
 }
 public static class RoadReport {
  public String getId(){return "public-report";}
  public String getReportType(){return "SPEED_TRAP";}
  public Location getLocation(){Location l=new Location("report");l.setLatitude(38.54);l.setLongitude(-121.74);return l;}
  public String reportTitleText(android.content.Context c){return "Mobile camera";}
 }
 public static class Alerted {
  final boolean active;Alerted(boolean on){active=on;}
  public boolean isActive(){return active;}
  public RoadReport getReport(){return new RoadReport();}
 }
 @Test public void backgroundReportListUsesNormalizedKindsAndStopClears() {
  NavigationBroadcasts.reports(java.util.Arrays.asList(new Alerted(true),new Alerted(false)));
  assertArrayEquals(new String[]{"mobile_camera"},last().getStringArrayExtra("alert_kinds"));
  assertArrayEquals(new int[]{-1},last().getIntArrayExtra("alert_distance_m"));
  assertEquals(38.54,last().getDoubleArrayExtra("alert_latitude")[0],0);
  NavigationBroadcasts.stopped();assertFalse(last().hasExtra("alert_ids"));
 }

 @Test public void backgroundBusSubscriptionActuallyDeliversPrimitiveReports() throws Exception {
  Object callback=Class.forName("fs7").getField("subscriber").get(null);
  assertNotNull(callback);
  Object result=Class.forName("b49").getMethod("invoke",Object.class).invoke(callback,java.util.Arrays.asList(new Alerted(true)));
  assertSame(Class.forName("tvj").getField("a").get(null),result);
  assertArrayEquals(new String[]{"mobile_camera"},last().getStringArrayExtra("alert_kinds"));
  NavigationBroadcasts.stopped();
  Class.forName("b49").getMethod("invoke",Object.class).invoke(callback,java.util.Arrays.asList(new Alerted(true)));
  assertFalse(last().hasExtra("alert_ids"));
 }

}
