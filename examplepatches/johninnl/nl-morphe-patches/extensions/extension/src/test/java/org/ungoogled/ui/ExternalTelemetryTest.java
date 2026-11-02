package org.ungoogled.ui;

import static org.junit.Assert.*;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.location.Location;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.time.Duration;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowSystemClock;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=33,manifest=Config.NONE)
public class ExternalTelemetryTest {
    Context app;
    @Before public void setup() throws Exception {
        app=RuntimeEnvironment.getApplication();app.getSharedPreferences(Shapes.PREFS,0).edit().clear().commit();
        set("store",new TelemetryStore());set("source","");set("registered",false);set("nativeSpeedAt",-1L);set("nativeLimitAt",-1L);set("nativeSpeed",null);set("nativeLimit",null);set("fix",null);
    }
    @After public void cleanup(){ExternalTelemetry.select(app,"");}
    private static void set(String name,Object value) throws Exception {Field f=ExternalTelemetry.class.getDeclaredField(name);f.setAccessible(true);f.set(null,value);}
    private void deliver(Map<String,Object> values) throws Exception {
        Intent i=new Intent(ExternalTelemetry.ACTION);
        for(Map.Entry<String,Object> e:values.entrySet()) {
            String k=e.getKey();Object v=e.getValue();
            if(v instanceof String)i.putExtra(k,(String)v);else if(v instanceof Integer)i.putExtra(k,(Integer)v);else if(v instanceof Long)i.putExtra(k,(Long)v);else if(v instanceof Double)i.putExtra(k,(Double)v);else if(v instanceof Boolean)i.putExtra(k,(Boolean)v);
        }
        Field field=ExternalTelemetry.class.getDeclaredField("RECEIVER");field.setAccessible(true);((BroadcastReceiver)field.get(null)).onReceive(app,i);
    }
    @Test public void defaultIsOffAndLegacySelectionRemainsSeparateFromModernData(){
        assertEquals(0,ExternalTelemetry.sourceIndex(app));
        ExternalTelemetry.select(app,ExternalTelemetry.LEGACY);assertTrue(ExternalTelemetry.legacy());assertFalse(ExternalTelemetry.modern());
        ExternalTelemetry.select(app,TelemetryStore.FLITSMEISTER);assertFalse(ExternalTelemetry.legacy());assertTrue(ExternalTelemetry.modern());
    }
    @Test public void selectedSourceFallsBackPerFieldAndExpiresWithoutAnotherBroadcast() throws Exception {
        ExternalTelemetry.select(app,TelemetryStore.FLITSMEISTER);ExternalTelemetry.nativeSpeedometer(30,50,false);
        long now=SystemClock.elapsedRealtime();Map<String,Object> p=TelemetryStoreTest.packet(TelemetryStore.FLITSMEISTER,"fm",1,now);p.put("current_speed_status","unknown");p.put("road_speed_limit_kmh",80d);deliver(p);
        assertEquals(30*1.609344/3.6,ExternalTelemetry.speedMps(),.001);assertEquals(80,ExternalTelemetry.limitKmh(),0);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(6));assertNull(ExternalTelemetry.speedMps());assertEquals(80,ExternalTelemetry.limitKmh(),0);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(5));assertEquals(50*1.609344,ExternalTelemetry.limitKmh(),.001);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(20));assertNull(ExternalTelemetry.limitKmh());
    }
    @Test public void gpsRefreshCannotKeepAnOldNativeRoadLimitAlive() {
        ExternalTelemetry.select(app,TelemetryStore.WAZE);ExternalTelemetry.nativeSpeedometer(72,100,true);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(31));
        Location l=new Location("gps");l.setLatitude(52);l.setLongitude(5);l.setSpeed(20);l.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());ExternalTelemetry.fix(l);
        assertEquals(20,ExternalTelemetry.speedMps(),0);assertNull(ExternalTelemetry.limitKmh());
    }
    @Test public void measuredZeroSurvivesAndAnotherProviderCannotSupplyMissingFields() throws Exception {
        ExternalTelemetry.select(app,TelemetryStore.WAZE);long now=SystemClock.elapsedRealtime();Map<String,Object> waz=TelemetryStoreTest.packet(TelemetryStore.WAZE,"w",1,now);waz.put("current_speed_kmh",0d);waz.put("road_speed_limit_status","unknown");deliver(waz);
        deliver(TelemetryStoreTest.packet(TelemetryStore.FLITSMEISTER,"fm",1,now));
        assertEquals(0,ExternalTelemetry.speedMps(),0);assertNull(ExternalTelemetry.limitKmh());
    }
    @Test @Config(sdk=34) public void modernFrameworkSenderIsRequiredEvenForAnOtherwiseValidPacket() throws Exception {
        ExternalTelemetry.select(app,TelemetryStore.WAZE);deliver(TelemetryStoreTest.packet(TelemetryStore.WAZE,"w",1,SystemClock.elapsedRealtime()));
        assertFalse(ExternalTelemetry.view().external);assertNull(ExternalTelemetry.speedMps());
    }
    @Test public void nativeFlockPausesAndResumesWithoutRewritingSavedSwitches() throws Exception {
        app.getSharedPreferences(Shapes.PREFS,0).edit().putBoolean(SpeedCameras.KEY_FLOCK,true).putBoolean(SpeedCameras.KEY_FLOCK_MAP,true).putBoolean(SpeedCameras.KEY_FLOCK_ALERT,true).commit();
        ExternalTelemetry.select(app,TelemetryStore.WAZE);SpeedCameras.FLOCK=true;SpeedCameras.FLOCK_AVOID=false;
        Field f=SpeedCameras.class.getDeclaredField("FLOCKS");f.setAccessible(true);Object layer=f.get(null);java.lang.reflect.Method on=layer.getClass().getDeclaredMethod("on");on.setAccessible(true);
        assertTrue((Boolean)on.invoke(layer));assertFalse(ExternalTelemetry.suppressNativeFlock());
        deliver(TelemetryStoreTest.packet(TelemetryStore.WAZE,"w",1,SystemClock.elapsedRealtime()));
        assertTrue(ExternalTelemetry.suppressNativeFlock());assertFalse((Boolean)on.invoke(layer));
        Field signature=ExternalTelemetry.class.getDeclaredField("pinSignature");signature.setAccessible(true);String paused=(String)signature.get(null);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(11));java.lang.reflect.Method update=ExternalTelemetry.class.getDeclaredMethod("update");update.setAccessible(true);update.invoke(null);
        assertFalse(ExternalTelemetry.suppressNativeFlock());assertTrue((Boolean)on.invoke(layer));assertNotEquals(paused,signature.get(null));
        assertTrue(app.getSharedPreferences(Shapes.PREFS,0).getBoolean(SpeedCameras.KEY_FLOCK,false));assertTrue(app.getSharedPreferences(Shapes.PREFS,0).getBoolean(SpeedCameras.KEY_FLOCK_MAP,false));assertTrue(app.getSharedPreferences(Shapes.PREFS,0).getBoolean(SpeedCameras.KEY_FLOCK_ALERT,false));
        SpeedCameras.FLOCK=false;
    }
    @Test public void categoryFilterCannotEnableOtherProviderOrInventAnApproach(){
        TelemetryStore store=new TelemetryStore();store.select(TelemetryStore.WAZE);Map<String,Object> p=TelemetryStoreTest.packet(TelemetryStore.WAZE,"w",1,1000);
        p.put("zone_approach_status","ahead");p.put("zone_approach_id","z");p.put("zone_approach_distance_m",100);p.put("zone_approach_updated_elapsed_ms",1000L);store.accept(p,TelemetryStore.WAZE,1000);
        assertNull(store.view(1000).withAlerts(a->false,false).approachDistanceMeters);assertEquals(100,store.view(1000).withAlerts(a->false,true).approachDistanceMeters.intValue());
    }
    @Test public void repeatedUnchangedNativeObservationsStayFreshAndUnitsCanChange() {
        ExternalTelemetry.select(app,TelemetryStore.FLITSMEISTER);
        for(int second=0;second<40;second++) {
            SpeedAlerts.onNativeSpeedMps(20f);ExternalTelemetry.nativeLimit(50,true);
            ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        }
        assertEquals(20,ExternalTelemetry.speedMps(),.001);assertEquals(50,ExternalTelemetry.limitKmh(),0);
        ExternalTelemetry.nativeLimit(50,false);assertEquals(50*1.609344,ExternalTelemetry.limitKmh(),.001);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(6));assertNull(ExternalTelemetry.speedMps());
        assertEquals(50*1.609344,ExternalTelemetry.limitKmh(),.001);
    }
    @Test public void rawNativeSpeedRejectsMissingAndMalformedSamplesButKeepsMeasuredZero() {
        ExternalTelemetry.select(app,TelemetryStore.WAZE);
        SpeedAlerts.onNativeSpeedMps(0);assertEquals(0,ExternalTelemetry.speedMps(),0);
        SpeedAlerts.onNativeSpeedMps(-1);assertNull(ExternalTelemetry.speedMps());
        SpeedAlerts.onNativeSpeedMps(Float.NaN);assertNull(ExternalTelemetry.speedMps());
        SpeedAlerts.onNativeSpeedMps(Float.POSITIVE_INFINITY);assertNull(ExternalTelemetry.speedMps());
    }
}
