package nl.johninnl.flitsmeister;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.location.Location;
import android.os.Looper;
import java.time.Duration;
import java.util.Arrays;
import org.junit.Before;
import org.junit.Test;
import org.robolectric.RuntimeEnvironment;

/** Run the shared observation/expiry/ordering suite against15 bindings too. */
public class NavigationBroadcasts15Test extends NavigationBroadcastsTest {
 @Override @Before public void setup() {
  app=RuntimeEnvironment.getApplication(); NavigationBroadcasts.resetForTest();
  nl.flitsmeister.fmcore.models.eventbuses.AppNotificationBus.version15=true;
  NavigationBroadcasts.init15(app);
 }
 @Override @Test public void unrestrictedRoadFlagMustNotEraseAnEffectiveVehicleLimit() throws Exception {
  Class.forName("hmf").getField("f").setInt(null,150);
  Class.forName("r65").getField("b").setInt(null,14);
  Class.forName("brf").getField("f").setInt(null,80);
  Class.forName("m65").getField("b").setInt(null,1);
  NavigationBroadcasts.road();
  assertEquals(80,last().getDoubleExtra("road_speed_limit_kmh",-1),0);
 }
 @Override @Test public void backgroundBusSubscriptionActuallyDeliversPrimitiveReports() throws Exception {
  Object callback=Class.forName("as7").getField("subscriber").get(null);
  assertNotNull(callback);
  Object result=Class.forName("u39").getMethod("invoke",Object.class).invoke(callback,Arrays.asList(new Alerted(true)));
  assertSame(Class.forName("l1k").getField("a").get(null),result);
  assertArrayEquals(new String[]{"mobile_camera"},last().getStringArrayExtra("alert_kinds"));
  NavigationBroadcasts.stopped();
  Class.forName("u39").getMethod("invoke",Object.class).invoke(callback,Arrays.asList(new Alerted(true)));
  assertFalse(last().hasExtra("alert_ids"));
 }
 public static class LookaheadTask { public Location v1; }
 private LookaheadTask selected(Report report, Location fix) throws Exception {
  Class.forName("hff").getField("b").set(null,report);
  LookaheadTask task=new LookaheadTask(); task.v1=fix; return task;
 }
 @Test public void nativeLookaheadCandidateSupportsApproachEntryAndClear() throws Exception {
  Location before=fix(20); before.setLongitude(4.995);
  LookaheadTask task=selected(new Report(),before);
  NavigationBroadcasts.zone15(task);
  assertEquals("ahead",last().getStringExtra("zone_approach_status"));
  assertEquals("inactive",last().getStringExtra("zone_status"));
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  task.v1=fix(20); task.v1.setLongitude(5.005);
  NavigationBroadcasts.zone15(task);
  assertEquals("active",last().getStringExtra("zone_status"));
  assertEquals("zone-a",last().getStringExtra("zone_segment_id"));
  assertTrue(last().getBooleanExtra("zone_average_partial",false));
  Class.forName("hff").getField("b").set(null,null);
  NavigationBroadcasts.zone15(task);
  assertEquals("inactive",last().getStringExtra("zone_status"));
  assertEquals("inactive",last().getStringExtra("zone_approach_status"));
 }
 @Test public void nativeLookaheadDoesNotRefreshStaleOrReorderedFixes() throws Exception {
  Location old=fix(20); old.setLongitude(5.005);
  LookaheadTask task=selected(new Report(),old);
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
  Location current=fix(20); current.setLongitude(5.006);
  NavigationBroadcasts.zone15(selected(new ReportB(),current));
  selected(new Report(),old); NavigationBroadcasts.zone15(task);
  assertEquals("zone-b",last().getStringExtra("zone_segment_id"));
  long observed=last().getLongExtra("zone_updated_elapsed_ms",-1);
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(6));
  NavigationBroadcasts.zone15(task);
  assertEquals(observed,last().getLongExtra("zone_updated_elapsed_ms",-2));
  shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(90));
  NavigationBroadcasts.zone15(task);
  assertEquals("stale",last().getStringExtra("zone_status"));
 }
 @Test public void nativeLookaheadRejectsMissingAndInaccurateFix() throws Exception {
  LookaheadTask task=selected(new Report(),null); NavigationBroadcasts.zone15(task);
  assertEquals("unknown",last().getStringExtra("zone_status"));
  task.v1=fix(20); task.v1.setLongitude(5.005); task.v1.setAccuracy(100);
  NavigationBroadcasts.zone15(task);
  assertEquals("unknown",last().getStringExtra("zone_status"));
 }
}
