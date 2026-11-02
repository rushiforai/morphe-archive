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
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE)
public class NavigationBroadcastsTest {
 Application app;
 @Before public void setup() { app=RuntimeEnvironment.getApplication(); NavigationBroadcasts.resetForTest(); NavigationBroadcasts.init(app); }
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
 @Test public void zoneProgressAndAverageUseSameObservedDistanceContractAsWaze() {
  Task task=new Task(); Location first=fix(20); first.setLongitude(5.005);
  NavigationBroadcasts.zone(task,first);
  assertEquals("active",last().getStringExtra("zone_status"));
  assertEquals("zone-a:2",last().getStringExtra("zone_segment_id"));
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
  assertEquals("zone-b:2",last().getStringExtra("zone_segment_id"));
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
