package org.ungoogled.waze;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE)
public class BridgeTest {
    private Application app;
    private nl.johninnl.navigation.alerts.WarningEndpoint endpoint;

    private static void field(Class<?> cls, String name, Object value) throws Exception {
        Field f = cls.getDeclaredField(name);
        f.setAccessible(true);
        f.set(null, value);
    }

    @Before public void setup() throws Exception {
        app = RuntimeEnvironment.getApplication();
        field(Customization.class, "app", app);
        app.getSharedPreferences("ungoogled_waze", Context.MODE_PRIVATE).edit().clear().commit();
        Field main = Bridge.class.getDeclaredField("MAIN");
        main.setAccessible(true);
        ((Handler) main.get(null)).removeCallbacksAndMessages(null);
        field(Bridge.class, "last", null);
        field(Bridge.class, "lastKey", "");
        field(Bridge.class, "lastSentAt", 0L);
        field(Bridge.class, "beating", false);
        field(Bridge.class, "eventSuspended", false);
        field(NativeWarnings.class,"endpoint",null);
        Bridge.init(app);
    }
    @After public void cleanup()throws Exception{if(endpoint!=null)endpoint.close();field(NativeWarnings.class,"endpoint",null);}

    private void exclusive(boolean value)throws Exception{
        if(endpoint==null){
            endpoint=new nl.johninnl.navigation.alerts.WarningEndpoint(app,uid->null,new nl.johninnl.navigation.alerts.WarningCapabilities(nl.johninnl.navigation.alerts.WazeWarningTypes.MANIFEST_DIGEST,nl.johninnl.navigation.alerts.WazeWarningTypes.required(),false));
            endpoint.close();Field actor=endpoint.getClass().getDeclaredField("actor");actor.setAccessible(true);
            assertTrue(((java.util.concurrent.ThreadPoolExecutor)actor.get(endpoint)).awaitTermination(2,java.util.concurrent.TimeUnit.SECONDS));
            field(NativeWarnings.class,"endpoint",endpoint);
        }
        Field state=endpoint.getClass().getDeclaredField("exclusive");state.setAccessible(true);state.setBoolean(endpoint,value);
    }

    private void send() throws Exception {
        Method m = Bridge.class.getDeclaredMethod("send", Intent.class, String.class, int.class);
        m.setAccessible(true);
        m.invoke(null, new Intent(Bridge.ACTION).putExtra("type", new int[]{1}), "police", 1);
    }

    private List<Intent> broadcasts() {
        return shadowOf(app).getBroadcastIntents().stream()
                .filter(i -> Bridge.ACTION.equals(i.getAction())).collect(Collectors.toList());
    }

    @Test public void heartbeatRepeatsWhileEnabled() throws Exception {
        send();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(1));
        assertEquals(2, broadcasts().size());
    }

    @Test public void switchingOffStopsHeartbeatAndClearsCachedAlerts() throws Exception {
        send();
        Customization.setForTest("shareAlerts", false);
        int afterDisable = broadcasts().size();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(2));
        assertEquals(afterDisable, broadcasts().size());
        Intent cleared = broadcasts().get(afterDisable - 1);
        assertEquals(0, cleared.getIntArrayExtra("type").length);
    }

    @Test public void staleInFlightUpdateCannotRestartSharingAfterDisable() throws Exception {
        Customization.setForTest("shareAlerts", false);
        int afterDisable = broadcasts().size();
        send();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(2));
        assertEquals(afterDisable, broadcasts().size());
    }

    @Test public void eventOwnershipClearsAndSuspendsTheLegacyChannelWithoutChangingItsSavedSwitch()throws Exception{
        send();assertEquals(1,broadcasts().size());exclusive(true);Bridge.refreshWarningOwnership();
        assertEquals(0,broadcasts().get(broadcasts().size()-1).getIntArrayExtra("type").length);
        assertTrue(Customization.on("shareAlerts"));int cleared=broadcasts().size();
        send();app.sendBroadcast(new Intent(Bridge.ACTION_REQUEST));shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(2));
        assertEquals(cleared,broadcasts().size());
        exclusive(false);Bridge.refreshWarningOwnership();assertEquals(cleared,broadcasts().size());
        send();assertEquals(cleared+1,broadcasts().size());assertEquals(1,broadcasts().get(cleared).getIntArrayExtra("type").length);
    }

    @Test public void theLastBroadcastGateRejectsAnUpdateDecodedBeforeOwnershipChanged()throws Exception{
        send();exclusive(true);
        Method broadcast=Bridge.class.getDeclaredMethod("broadcast",Intent.class,int.class);broadcast.setAccessible(true);
        broadcast.invoke(null,new Intent(Bridge.ACTION).putExtra("type",new int[]{10}),1);
        assertEquals(2,broadcasts().size());assertEquals(0,broadcasts().get(1).getIntArrayExtra("type").length);
        Customization.setForTest("shareAlerts",false);exclusive(false);Bridge.refreshWarningOwnership();int count=broadcasts().size();
        send();shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(2));assertEquals(count,broadcasts().size());
        assertFalse(Customization.on("shareAlerts"));
    }
    public static final class FixtureValidation {
        boolean valid; Integer distance, seconds;
        public FixtureValidation setIsValid(boolean value){valid=value;return this;}
        public FixtureValidation setDistanceMeters(int value){distance=value;return this;}
        public FixtureValidation setTimeToAlertSec(int value){seconds=value;return this;}
        public FixtureValidation build(){return this;}
    }
    public static final class FixtureInfo {
        FixtureValidation validation; boolean approaching, requireDistance;
        public FixtureInfo setValidationResult(FixtureValidation value){validation=value;return this;}
        public FixtureInfo setIsApproachingWithValidation(boolean value){approaching=value;return this;}
        public FixtureInfo setRequireDistanceInRange(boolean value){requireDistance=value;return this;}
    }
    private FixtureInfo fixtureValidation(Intent input)throws Exception{
        Method method=Class.forName(Bridge.class.getName()+"$SelfTest").getDeclaredMethod("validation",Object.class,Object.class,Class.class,Intent.class);
        method.setAccessible(true);FixtureInfo info=new FixtureInfo();
        method.invoke(null,info,new FixtureValidation(),FixtureValidation.class,input);return info;
    }
    @Test public void nativeFixturePreservesExplicitValidationAndObservedDistances()throws Exception{
        FixtureInfo info=fixtureValidation(new Intent().putExtra("valid",true).putExtra("distance_m",125).putExtra("time_sec",8));
        assertTrue(info.validation.valid);assertEquals(Integer.valueOf(125),info.validation.distance);assertEquals(Integer.valueOf(8),info.validation.seconds);
        assertTrue(info.approaching);assertTrue(info.requireDistance);
    }
    @Test public void invalidFixtureDoesNotBecomeEligibleAndMissingMeasurementsStayAbsent()throws Exception{
        FixtureInfo info=fixtureValidation(new Intent().putExtra("valid",false).putExtra("approaching",false));
        assertFalse(info.validation.valid);assertFalse(info.approaching);assertNull(info.validation.distance);assertNull(info.validation.seconds);
    }
    @Test public void oldFixtureWithoutNativeValidationRemainsUnvalidated()throws Exception{
        assertNull(fixtureValidation(new Intent()).validation);
    }

    public static final class FixtureIdentity { }
    public static final class FixtureIdentityHolder {
        FixtureIdentity id;
        public FixtureIdentityHolder setAlertId(FixtureIdentity value){id=value;return this;}
    }
    @Test public void nativeFixtureGivesOrdinaryAndZoneModelsTheSameIdentity()throws Exception{
        Method method=Class.forName(Bridge.class.getName()+"$SelfTest").getDeclaredMethod("identity",Object.class,Object.class,Class.class,Object.class);
        method.setAccessible(true);FixtureIdentity id=new FixtureIdentity();FixtureIdentityHolder info=new FixtureIdentityHolder(),descriptor=new FixtureIdentityHolder();
        method.invoke(null,info,descriptor,FixtureIdentity.class,id);assertSame(id,info.id);assertSame(id,descriptor.id);
    }

    @Test public void additionalNativeFixtureFamiliesRequireExplicitRealCallbacks()throws Exception{
        Method method=Class.forName(Bridge.class.getName()+"$SelfTest").getDeclaredMethod("nativeFamily",Intent.class);method.setAccessible(true);
        assertEquals(Boolean.FALSE,method.invoke(null,new Intent()));
        var disabled=assertThrows(java.lang.reflect.InvocationTargetException.class,()->method.invoke(null,new Intent().putExtra("family","segments")));
        assertEquals("NATIVE_FIXTURE_REQUIRES_REAL",disabled.getCause().getMessage());
        var unknown=assertThrows(java.lang.reflect.InvocationTargetException.class,()->method.invoke(null,new Intent().putExtra("family","unknown").putExtra("real",true)));
        assertEquals("UNKNOWN_NATIVE_FIXTURE_FAMILY",unknown.getCause().getMessage());
    }

}
