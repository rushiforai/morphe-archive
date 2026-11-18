package nl.johninnl.vela;

import static org.junit.Assert.*;
import android.location.Location;
import android.os.Bundle;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.util.*;
import nl.johninnl.navigation.alerts.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** Exercise the installed scheduler policy, not only the route math helper. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class VelaRoutePassageTest {
    public static class Session {public Flow f=new Flow();}
    public static class Flow {public State value=new State();public Object getValue(){return value;}}
    public static class State {public boolean a=true,b=false,c=false;public Object d;}
    public static class ShortRoute {public List<Object> getPolyline(){return Collections.emptyList();}}
    public static class Point {private final double latitude,longitude;Point(double latitude,double longitude){this.latitude=latitude;this.longitude=longitude;}public double getLat(){return latitude;}public double getLng(){return longitude;}}
    public static class DirectedRoute {public List<Point> getPolyline(){return Arrays.asList(new Point(0,0),new Point(.01,0));}}
    private WarningScheduler.Policy policy;
    @Before public void setup()throws Exception{
        TelemetryRuntime.resetForTest();TelemetryRuntime.init(RuntimeEnvironment.getApplication(),()->{});
        Field scheduler=TelemetryRuntime.class.getDeclaredField("scheduler");scheduler.setAccessible(true);
        Field field=WarningScheduler.class.getDeclaredField("policy");field.setAccessible(true);policy=(WarningScheduler.Policy)field.get(scheduler.get(null));
        Location fix=new Location("gps");fix.setLatitude(.001);fix.setLongitude(0);fix.setBearing(0);fix.setSpeed(20);fix.setAccuracy(3);fix.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());TelemetryRuntime.nativeSample(fix);
    }
    @After public void cleanup(){TelemetryRuntime.resetForTest();}
    private WarningEvent event(){
        long now=SystemClock.elapsedRealtime();Bundle b=new Bundle();b.putInt("protocol_version",1);b.putString("provider_session",UUID.randomUUID().toString());b.putLong("sequence",1);b.putString("warning_id","behind-heading");b.putLong("revision",1);b.putLong("announcement_index",1);b.putString("operation","ANNOUNCE");b.putString("phase","enter");b.putString("native_type","SPEED_CAM");b.putString("category","speed_control");b.putInt("priority",1);b.putString("message","Camera");b.putString("language_tag","en-US");b.putString("message_origin","native_text");b.putString("relevance","point_ahead");b.putString("relationship","unknown");b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);b.putLong("announce_until_elapsed_ms",now+10000);b.putLong("state_until_elapsed_ms",now+30000);b.putDouble("latitude",.0004);b.putDouble("longitude",0);b.putLong("position_observed_elapsed_ms",now);b.putBoolean("position_estimated",false);b.putString("position_clock_origin","native_decision");return WarningCodec.decode(b,now);
    }
    @Test public void noActiveRouteRetainsConservativeHeadingFallback(){assertTrue(policy.passed(event(),SystemClock.elapsedRealtime()));}
    @Test public void activeRouteWithoutGeometryLeavesPassageUnknown(){TelemetryRuntime.bindNavSession(new Session());assertFalse(policy.passed(event(),SystemClock.elapsedRealtime()));}
    @Test public void activeRouteWithShortGeometryLeavesPassageUnknown(){Session session=new Session();session.f.value.d=new ShortRoute();TelemetryRuntime.bindNavSession(session);assertFalse(policy.passed(event(),SystemClock.elapsedRealtime()));}
    @Test public void activeRouteWithUnreadableGeometryLeavesPassageUnknown(){Session session=new Session();session.f.value.d=new Object();TelemetryRuntime.bindNavSession(session);assertFalse(policy.passed(event(),SystemClock.elapsedRealtime()));}
    @Test public void unreadableSessionCannotProveNoActiveRoute(){TelemetryRuntime.bindNavSession(new Object());assertFalse(policy.passed(event(),SystemClock.elapsedRealtime()));}
    @Test public void schedulerPolicyHoldsUnknownRouteContextButExemptsNonspatialWarnings(){
        TelemetryRuntime.bindNavSession(new Session());assertEquals(WarningPassage.Relevance.CONTEXT_UNVERIFIED,policy.relevance(event(),SystemClock.elapsedRealtime()));
        Bundle b=WarningCodec.encode(event());b.putString("relevance","moving_emergency");b.putLong("announce_until_elapsed_ms",b.getLong("issued_elapsed_ms")+5000);assertEquals(WarningPassage.Relevance.RELEVANT,policy.relevance(WarningCodec.decode(b,SystemClock.elapsedRealtime()),SystemClock.elapsedRealtime()));
    }
    @Test public void installedPolicyClassifiesFreshRoutePointsAndCannotRefreshAStaleFix(){
        Session session=new Session();session.f.value.d=new DirectedRoute();TelemetryRuntime.bindNavSession(session);
        assertEquals(WarningPassage.Relevance.PASSED,policy.relevance(event(),SystemClock.elapsedRealtime()));
        Bundle b=WarningCodec.encode(event());b.putDouble("latitude",.002);WarningEvent ahead=WarningCodec.decode(b,SystemClock.elapsedRealtime());
        assertEquals(WarningPassage.Relevance.RELEVANT,policy.relevance(ahead,SystemClock.elapsedRealtime()));
        b.putDouble("longitude",.001);assertEquals(WarningPassage.Relevance.OFF_ROUTE,policy.relevance(WarningCodec.decode(b,SystemClock.elapsedRealtime()),SystemClock.elapsedRealtime()));
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(6));
        assertEquals(WarningPassage.Relevance.CONTEXT_UNVERIFIED,policy.relevance(ahead,SystemClock.elapsedRealtime()));
    }
}
