package org.ungoogled.ui;
import static org.junit.Assert.*;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import java.lang.reflect.Field;
import java.time.Duration;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=33,manifest=Config.NONE)
public class WazeBridgeTest {
    Context app;
    @Before public void setup(){app=RuntimeEnvironment.getApplication();app.getSharedPreferences(Shapes.PREFS,0).edit().clear().commit();ExternalTelemetry.select(app,ExternalTelemetry.LEGACY);WazeAlerts.ON=true;WazeAlerts.MAP=true;WazeAlerts.CHIME=false;WazeAlerts.resetSource();}
    @After public void cleanup(){ExternalTelemetry.select(app,"");WazeAlerts.ON=false;WazeAlerts.MAP=false;WazeAlerts.CHIME=false;}
    private void deliver(Intent intent) throws Exception {Field f=WazeAlerts.class.getDeclaredField("RECEIVER");f.setAccessible(true);((BroadcastReceiver)f.get(null)).onReceive(app,intent);}
    private List<?> alerts() throws Exception {Field f=WazeAlerts.class.getDeclaredField("alerts");f.setAccessible(true);return (List<?>)f.get(null);}
    private Intent packet(){return new Intent(WazeAlerts.ACTION).putExtra("type",new int[]{1,10}).putExtra("lat",new int[]{52000000,52001000}).putExtra("lng",new int[]{5000000,5001000}).putExtra("id",new String[]{"p","c"}).putExtra("title",new String[]{"Police ahead","Camera ahead"}).putExtra("trigger",new int[]{500,600}).putExtra("from","com.waze");}
    @Test public void upstreamBridgeParsesPoliceAndCameraAndExplicitEmptyClearsList() throws Exception {
        deliver(packet());assertEquals(2,alerts().size());WazeAlerts.Alert first=(WazeAlerts.Alert)alerts().get(0);assertEquals(WazeAlerts.POLICE,first.kind);assertEquals(52,first.lat,0);assertEquals("Police ahead",WazeAlerts.label(first));
        deliver(new Intent(WazeAlerts.ACTION).putExtra("type",new int[0]).putExtra("lat",new int[0]).putExtra("lng",new int[0]));assertTrue(alerts().isEmpty());
    }
    @Test public void switchingSourceClearsLegacyAndModernModeCannotAcceptBridgePackets() throws Exception {
        deliver(packet());assertEquals(2,alerts().size());ExternalTelemetry.select(app,TelemetryStore.FLITSMEISTER);WazeAlerts.ON=true;assertTrue(alerts().isEmpty());deliver(packet());assertTrue(alerts().isEmpty());
        ExternalTelemetry.select(app,ExternalTelemetry.LEGACY);WazeAlerts.ON=true;deliver(packet());assertEquals(2,alerts().size());ExternalTelemetry.select(app,"");assertTrue(alerts().isEmpty());
    }
    @Test public void bridgeListExpiresWithoutAnotherPacketAndBadCoordinatesAreNotPins() throws Exception {
        deliver(packet());Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(3).plusSeconds(2));assertTrue(alerts().isEmpty());
        deliver(new Intent(WazeAlerts.ACTION).putExtra("type",new int[]{1}).putExtra("lat",new int[]{91000000}).putExtra("lng",new int[]{5000000}));assertTrue(alerts().isEmpty());
    }
    @Test public void malformedAndOversizedArraysCannotReplaceAnAcceptedList() throws Exception {
        deliver(packet());deliver(new Intent(WazeAlerts.ACTION).putExtra("type",new int[]{1,2}).putExtra("lat",new int[]{52000000}).putExtra("lng",new int[]{5000000}));assertEquals(2,alerts().size());
        deliver(new Intent(WazeAlerts.ACTION).putExtra("type",new int[513]).putExtra("lat",new int[513]).putExtra("lng",new int[513]));assertEquals(2,alerts().size());
    }
}
