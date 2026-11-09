package org.ungoogled.ui;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.lang.ref.WeakReference;
import java.time.Duration;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;
import nl.johninnl.navigation.alerts.WarningEvent.Priority;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE,shadows=MapsGuidanceGapTest.BoundHooks.class,instrumentedPackages={"org.ungoogled.ui"})
@LooperMode(LooperMode.Mode.PAUSED)
public class MapsGuidanceGapTest {
    @Implements(value=MapsGuidanceCoordinator.class,isInAndroidSdk=false)
    public static class BoundHooks {
        @Implementation protected static boolean hooksInstalled(){return true;}
    }
    public static final class NativeQueue {
        public Executor j=Runnable::run;
        public Object p,q;
    }
    public static final class ComponentManager{final Object component=new Object();public Object rJ(){return component;}}
    public static final class MapsApplication{final ComponentManager manager=new ComponentManager();public ComponentManager rI(){return manager;}}
    @Test public void resolvesTheComponentThroughTheRealApplicationManagerContract()throws Exception{
        MapsApplication application=new MapsApplication();
        assertSame(application.manager.component,MapsGuidanceCoordinator.applicationComponent(application));
        try{MapsApplication.class.getDeclaredMethod("rJ");fail("Fixture must not supply the obsolete direct accessor");}catch(NoSuchMethodException expected){}
    }
    private MapsGuidanceCoordinator coordinator;
    private NativeQueue manager;
    private static Field field(String name)throws Exception{Field f=MapsGuidanceCoordinator.class.getDeclaredField(name);f.setAccessible(true);return f;}
    private boolean flag(String name)throws Exception{return field(name).getBoolean(coordinator);}
    @Before public void setup()throws Exception{
        ((Map<?,?>)field("PLAYERS").get(null)).clear();field("route").set(null,new WeakReference<Object>(null));field("nativeFocusInFlight").setInt(null,0);
        coordinator=new MapsGuidanceCoordinator(RuntimeEnvironment.getApplication());shadowOf(Looper.getMainLooper()).idle();
        manager=new NativeQueue();field("manager").set(coordinator,manager);field("bound").setBoolean(coordinator,true);field("fault").setBoolean(coordinator,false);
        assertTrue("Only the test shadow supplies the native binding dependency",coordinator.isReady());
    }
    @After public void cleanup(){coordinator.close();shadowOf(Looper.getMainLooper()).idle();}
    private AtomicReference<String> acquire(String token,Priority priority,long duration){
        AtomicReference<String> result=new AtomicReference<>();coordinator.acquire(token,priority,SystemClock.elapsedRealtime()+duration,(quiet,reason)->result.set((quiet?"quiet:":"blocked:")+reason));shadowOf(Looper.getMainLooper()).idle();return result;
    }
    @Test public void ordinaryWarningWaitsWithoutHoldingOrCancellingNativeGuidance()throws Exception{
        Object original=new Object();manager.p=original;AtomicReference<String> result=acquire("ordinary",Priority.P1,1000);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(200));assertNull(result.get());assertSame(original,manager.p);assertFalse(flag("holding"));assertTrue(flag("waiting"));
        manager.p=null;shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(60));assertEquals("quiet:QUIESCENT",result.get());assertTrue(flag("holding"));assertFalse(flag("waiting"));
    }
    @Test public void lowerPriorityWarningAlsoWaitsForPendingNativeWork()throws Exception{
        Object original=new Object();manager.q=original;AtomicReference<String> result=acquire("advice",Priority.P2,1000);
        assertNull(result.get());assertFalse(flag("holding"));manager.q=null;shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(60));assertEquals("quiet:QUIESCENT",result.get());
    }
    @Test public void nativeBusyWaitNeverExtendsTheOriginalDeadline()throws Exception{
        manager.p=new Object();AtomicReference<String> result=acquire("expiry",Priority.P1,100);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(150));assertEquals("blocked:GUIDANCE_DEADLINE",result.get());assertFalse(flag("holding"));assertFalse(flag("waiting"));
    }
    @Test public void releasedWaitCannotCompleteIntoANewerAttempt()throws Exception{
        manager.p=new Object();AtomicReference<String> old=acquire("old",Priority.P1,1000);coordinator.release("old");shadowOf(Looper.getMainLooper()).idle();manager.p=null;
        AtomicReference<String> next=acquire("new",Priority.P1,1000);shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(100));assertNull(old.get());assertEquals("quiet:QUIESCENT",next.get());
    }
    @Test public void urgentPreemptionStillRequiresARegenerableCurrentRoute()throws Exception{
        manager.p=new Object();AtomicReference<String> result=acquire("urgent",Priority.P0,1000);assertEquals("blocked:GUIDANCE_BUSY",result.get());assertFalse(flag("holding"));assertFalse(flag("waiting"));
    }    @Test public void emptyQueueHoldIsReservedBeforePostingToMain()throws Exception{
        java.util.List<Runnable> serial=new java.util.ArrayList<>();manager.j=serial::add;
        AtomicReference<String> result=acquire("serial-gap",Priority.P1,1000);assertFalse(flag("holding"));assertTrue(flag("waiting"));
        serial.remove(0).run();assertTrue(flag("holding"));assertFalse(flag("waiting"));assertNull(result.get());
        shadowOf(Looper.getMainLooper()).idle();assertEquals("quiet:QUIESCENT",result.get());
    }
    @Test public void cancelledSerialReadCannotReserveANewAttemptsHold()throws Exception{
        java.util.List<Runnable> serial=new java.util.ArrayList<>();manager.j=serial::add;manager.p=new Object();
        AtomicReference<String> old=acquire("old-serial",Priority.P1,1000);coordinator.release("old-serial");shadowOf(Looper.getMainLooper()).idle();
        AtomicReference<String> next=acquire("new-serial",Priority.P1,1000);manager.p=null;
        serial.remove(0).run();assertFalse(flag("holding"));assertTrue(flag("waiting"));
        serial.remove(0).run();shadowOf(Looper.getMainLooper()).idle();assertNull(old.get());assertEquals("quiet:QUIESCENT",next.get());
    }
    @Test public void expiredQueuedSerialReadNeverReservesGuidance()throws Exception{
        java.util.List<Runnable> serial=new java.util.ArrayList<>();manager.j=serial::add;
        AtomicReference<String> result=acquire("delayed-expiry",Priority.P1,100);shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(150));
        serial.remove(0).run();assertFalse(flag("holding"));assertNull(result.get());shadowOf(Looper.getMainLooper()).idle();
        assertEquals("blocked:GUIDANCE_DEADLINE",result.get());assertFalse(flag("waiting"));
    }

}
