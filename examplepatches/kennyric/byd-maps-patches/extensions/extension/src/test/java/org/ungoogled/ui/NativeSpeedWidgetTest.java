package org.ungoogled.ui;

import static org.junit.Assert.*;
import android.content.Context;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.time.Duration;
import java.util.Map;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowSystemClock;

@RunWith(RobolectricTestRunner.class) @Config(sdk=33,manifest=Config.NONE)
public class NativeSpeedWidgetTest {
    Context app;
    @Before public void setup(){app=RuntimeEnvironment.getApplication();app.getSharedPreferences(Shapes.PREFS,0).edit().clear().commit();ExternalTelemetry.select(app,TelemetryStore.WAZE);}
    @After public void cleanup(){ExternalTelemetry.select(app,"");}
    private static Object field(String name)throws Exception{Field f=ExternalTelemetry.class.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
    private void data(String provider,double speed,double limit)throws Exception{
        long now=SystemClock.elapsedRealtime();Map<String,Object> p=TelemetryStoreTest.packet(provider,"widget",1,now);p.put("current_speed_kmh",speed);p.put("road_speed_limit_kmh",limit);
        assertTrue(((TelemetryStore)field("store")).accept(p,provider,now));
    }
    @Test public void selectedProviderReplacesNativeValuesInTheirOwnUnits()throws Exception{
        assertEquals(35,SpeedAlerts.overrideSpeed(35,true));assertEquals(50,SpeedAlerts.overrideLimit(50,1));
        data(TelemetryStore.WAZE,72,100);
        assertEquals(72,SpeedAlerts.overrideSpeed(35,true));assertEquals(44,SpeedAlerts.overrideSpeed(35,false));
        assertEquals(100,SpeedAlerts.overrideLimit(50,1));assertEquals(62,SpeedAlerts.overrideLimit(50,0));assertEquals(50,SpeedAlerts.overrideLimit(50,-1));
    }
    @Test public void staleSpeedFallsBackIndependentlyAndDeadProviderRestoresNativeLimit()throws Exception{
        data(TelemetryStore.WAZE,72,100);ShadowSystemClock.advanceBy(Duration.ofSeconds(6));
        assertEquals(35,SpeedAlerts.overrideSpeed(35,true));assertEquals(100,SpeedAlerts.overrideLimit(50,1));
        ShadowSystemClock.advanceBy(Duration.ofSeconds(5));assertEquals(50,SpeedAlerts.overrideLimit(50,1));
    }
    @Test public void measuredZeroAndDisabledOrDeselectedSourceRetainTheirMeaning()throws Exception{
        data(TelemetryStore.WAZE,0,100);assertEquals(0,SpeedAlerts.overrideSpeed(35,true));
        ExternalTelemetry.setWidget(app,false);assertEquals(35,SpeedAlerts.overrideSpeed(35,true));assertEquals(50,SpeedAlerts.overrideLimit(50,1));
        ExternalTelemetry.setWidget(app,true);assertEquals(0,SpeedAlerts.overrideSpeed(35,true));
        ExternalTelemetry.select(app,"");assertEquals(35,SpeedAlerts.overrideSpeed(35,true));assertEquals(50,SpeedAlerts.overrideLimit(50,1));
    }
    @Test public void selectingFmDoesNotReuseThePreviousWazeValues()throws Exception{
        data(TelemetryStore.WAZE,72,100);ExternalTelemetry.select(app,TelemetryStore.FLITSMEISTER);assertEquals(35,SpeedAlerts.overrideSpeed(35,true));
        data(TelemetryStore.FLITSMEISTER,90,80);assertEquals(90,SpeedAlerts.overrideSpeed(35,true));assertEquals(80,SpeedAlerts.overrideLimit(50,1));
    }
    @Test public void repaintDoesNotRenewRawMapsObservationsOrReplaceTheirValues()throws Exception{
        SpeedAlerts.onNativeSpeedMps(20);long observed=(Long)field("nativeSpeedAt");
        Field f=SpeedAlerts.class.getDeclaredField("refreshing");f.setAccessible(true);@SuppressWarnings("unchecked")ThreadLocal<Boolean> repaint=(ThreadLocal<Boolean>)f.get(null);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));repaint.set(true);
        try{SpeedAlerts.onNativeSpeedInput(new Object(),99);SpeedAlerts.onNativeSpeedMps(99);}finally{repaint.remove();}
        assertEquals(observed,field("nativeSpeedAt"));assertEquals(72d,(Double)field("nativeSpeed"),.001);
    }
}
