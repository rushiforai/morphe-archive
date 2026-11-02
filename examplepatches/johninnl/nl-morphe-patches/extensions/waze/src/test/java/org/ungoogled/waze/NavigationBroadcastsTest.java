package org.ungoogled.waze;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.app.Application;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.Field;
import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE)
public class NavigationBroadcastsTest {
    private Application app;
    private void field(Class<?> c, String name, Object value) throws Exception {
        Field f = c.getDeclaredField(name); f.setAccessible(true); f.set(null, value);
    }
    @Before public void setup() throws Exception {
        app = RuntimeEnvironment.getApplication();
        app.getSharedPreferences("ungoogled_waze", 0).edit().clear().putBoolean("zoneBar", false)
                .putBoolean("stayAwake", false).commit();
        field(Customization.class, "app", app);
        Field f = NavigationBroadcasts.class.getDeclaredField("MAIN"); f.setAccessible(true);
        ((Handler) f.get(null)).removeCallbacksAndMessages(null);
        field(NavigationBroadcasts.class, "installed", false);
        field(NavigationBroadcasts.class, "lastRequest", -1000L);
        field(NavigationBroadcasts.class, "lastSent", -5000L);
        NavigationBroadcasts.init(app);
    }
    private List<Intent> events() {
        return shadowOf(app).getBroadcastIntents().stream().filter(i -> NavigationBroadcasts.ACTION.equals(i.getAction()))
                .collect(Collectors.toList());
    }
    private Intent last() { List<Intent> list = events(); return list.get(list.size() - 1); }

    @Test public void roadDataDoesNotNeedAnActivityOrZoneOverlay() {
        NavigationBroadcasts.speed("mph", 65);
        assertEquals(104.60736, last().getDoubleExtra("road_speed_limit_kmh", -1), 0.00001);
        assertEquals(1, last().getIntExtra("schema_version", 0));
        assertFalse(last().hasExtra("zone_average_speed_kmh"));
        assertTrue(Customization.on("stayAwake"));
    }
    @Test public void requestsAndHeartbeatCannotMakeOldObservationsFresh() {
        NavigationBroadcasts.speed("km/h", 100);
        long observed = last().getLongExtra("road_updated_elapsed_ms", -1);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(31));
        app.sendBroadcast(new Intent(NavigationBroadcasts.REQUEST));
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals("stale", last().getStringExtra("road_speed_limit_status"));
        assertEquals(observed, last().getLongExtra("road_updated_elapsed_ms", -1));
        assertFalse(last().hasExtra("road_speed_limit_kmh"));
    }
    @Test public void disablingClearsAndStopsEvenWhenNativeCallbacksContinue() {
        NavigationBroadcasts.speed("km/h", 100);
        Customization.setForTest("navigationBroadcasts", false);
        assertEquals("disabled", last().getStringExtra("road_speed_limit_status"));
        assertFalse(last().hasExtra("road_speed_limit_kmh"));
        int count = events().size();
        NavigationBroadcasts.speed("km/h", 120);
        app.sendBroadcast(new Intent(NavigationBroadcasts.REQUEST));
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(6));
        assertEquals(count, events().size());
        assertFalse(Customization.on("stayAwake"));
    }
    @Test public void unknownValuesAreOmittedRatherThanSentAsZero() {
        NavigationBroadcasts.speed("unknown-units", 50);
        assertEquals("unknown", last().getStringExtra("road_speed_limit_status"));
        assertFalse(last().hasExtra("road_speed_limit_kmh"));
    }
    @Test public void commonContractIncludesCurrentSpeedAndStationaryZero() {
        NavigationBroadcasts.speed("mph", 65, 0);
        Intent common = shadowOf(app).getBroadcastIntents().stream()
            .filter(i -> "nl.johninnl.navigation.NAVIGATION_STATE".equals(i.getAction()))
            .reduce((a,b) -> b).get();
        assertEquals(last().getLongExtra("sequence",-1),common.getLongExtra("sequence",-2));
        assertEquals(app.getPackageName(),common.getStringExtra("source_package"));
        assertEquals("valid",common.getStringExtra("current_speed_status"));
        assertEquals(0,common.getDoubleExtra("current_speed_kmh",-1),0);
        assertEquals(104.60736,common.getDoubleExtra("road_speed_limit_kmh",-1),0.00001);
        long at=last().getLongExtra("current_speed_updated_elapsed_ms",-1);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(6));
        app.sendBroadcast(new Intent("nl.johninnl.navigation.NAVIGATION_STATE_REQUEST"));
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals("stale",last().getStringExtra("current_speed_status"));
        assertEquals(at,last().getLongExtra("current_speed_updated_elapsed_ms",-2));
        assertFalse(last().hasExtra("current_speed_kmh"));
    }

    public static class Identity { public int getSegmentTypeValue(){return 7;} public String getSegmentId(){return "public-zone";} }
    public static class Insight {
        final int position; Insight(int p){position=p;}
        public Identity getId(){return new Identity();}
        public int getPositionRelativeToSegmentValue(){return position;}
        public int getRemainingDistanceMeters(){return 450;}
    }
    public static class Update {
        final int position; Update(int p){position=p;}
        public List<Insight> getInfoList(){return java.util.Collections.singletonList(new Insight(position));}
    }
    @Test public void nativeApproachDoesNotStartAnAverageAndExpiresWithoutObservation() {
        NavigationBroadcasts.insights(new Update(0));
        assertEquals("ahead",last().getStringExtra("zone_approach_status"));
        assertEquals(450,last().getIntExtra("zone_approach_distance_m",-1));
        assertFalse(last().getBooleanExtra("zone_approach_distance_estimated",true));
        assertEquals("inactive",last().getStringExtra("zone_status"));
        long at=last().getLongExtra("zone_approach_updated_elapsed_ms",-1);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(31));
        app.sendBroadcast(new Intent(NavigationBroadcasts.REQUEST));shadowOf(Looper.getMainLooper()).idle();
        assertEquals("stale",last().getStringExtra("zone_approach_status"));
        assertEquals(at,last().getLongExtra("zone_approach_updated_elapsed_ms",-2));
        assertFalse(last().hasExtra("zone_approach_distance_m"));
    }
    @Test public void nativeWithinClearsApproachAndBeginsPartialZone() {
        NavigationBroadcasts.insights(new Update(0));NavigationBroadcasts.insights(new Update(1));
        app.sendBroadcast(new Intent(NavigationBroadcasts.REQUEST));shadowOf(Looper.getMainLooper()).idle();
        assertEquals("inactive",last().getStringExtra("zone_approach_status"));
        assertEquals("active",last().getStringExtra("zone_status"));
        assertTrue(last().getBooleanExtra("zone_average_partial",false));
    }
    @Test public void reportSourcesKeepIndependentAgeAndBoundedPrimitiveArrays() {
        nl.johninnl.navigation.NavigationAlerts.Alert a=new nl.johninnl.navigation.NavigationAlerts.Alert("public-camera","camera","Camera",-1,500,38.54,-121.74);
        NavigationBroadcasts.reports("native",java.util.Collections.singletonList(a),android.os.SystemClock.elapsedRealtime());
        long observed=last().getLongArrayExtra("alert_updated_elapsed_ms")[0];
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(20));
        NavigationBroadcasts.reports("flock",java.util.Collections.singletonList(new nl.johninnl.navigation.NavigationAlerts.Alert("public-flock","flock","Plate reader",200,500,38.54,-121.74)),android.os.SystemClock.elapsedRealtime());
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(11));
        app.sendBroadcast(new Intent(NavigationBroadcasts.REQUEST));shadowOf(Looper.getMainLooper()).idle();
        assertArrayEquals(new String[]{"public-flock"},last().getStringArrayExtra("alert_ids"));
        assertTrue(last().getLongArrayExtra("alert_updated_elapsed_ms")[0]>observed);
        assertEquals(1,last().getDoubleArrayExtra("alert_latitude").length);
    }

    @Test public void alertsBoundPayloadAndDisabledDoesNotRetainFields() {
        nl.johninnl.navigation.NavigationAlerts state=new nl.johninnl.navigation.NavigationAlerts();
        java.util.List<nl.johninnl.navigation.NavigationAlerts.Alert> rows=new java.util.ArrayList<>();
        String longTitle=String.join("",java.util.Collections.nCopies(300,"x"));
        for(int n=0;n<600;n++)rows.add(new nl.johninnl.navigation.NavigationAlerts.Alert("public-"+n,"hazard",longTitle,-3,-1,Double.NaN,Double.NaN));
        state.reports(rows,100);state.approach("zone",100,true,100);
        Intent out=state.append(new Intent(),101);
        assertEquals(512,out.getStringArrayExtra("alert_ids").length);
        assertEquals(240,out.getStringArrayExtra("alert_titles")[0].length());
        assertEquals(-1,out.getIntArrayExtra("alert_distance_m")[0]);
        state.reset(false);out=state.append(new Intent(),102);
        assertEquals("disabled",out.getStringExtra("alerts_status"));
        assertEquals("disabled",out.getStringExtra("zone_approach_status"));
        assertFalse(out.hasExtra("alert_ids"));assertFalse(out.hasExtra("zone_approach_id"));
    }

}
