package nl.johninnl.navigation.startup;
import android.app.*;
import android.content.*;
import android.os.*;
import android.Manifest;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34)
public class ProviderServiceTest {
    public static class Engine extends ProviderEngineService {
        static int starts, stops; static boolean ready, enabled=true, blocked, nativeFailure, deferShutdown, stoppedBeforeNative;
        static Runnable pendingStop;
        protected boolean enabled(){return enabled;}
        protected boolean engineRunning(){return ready;}
        protected void startEngine(){starts++;if(blocked)throw new SecurityException("foreground promotion denied");if(nativeFailure)throw new IllegalStateException("native initializer failed");}
        protected void stopEngine(long ownership){pendingStop=()->finishOwnedShutdown(ownership,()->{stoppedBeforeNative=Shadows.shadowOf(this).isStoppedBySelf()&&!Shadows.shadowOf(this).isLastForegroundNotificationAttached();stops++;ready=false;});if(!deferShutdown)pendingStop.run();}
        protected String nativeServiceName(){return "test.NativeEngine";}
    }
    public static class Control extends ProviderControlService {
        protected boolean enabled(){return Engine.enabled;}
        protected boolean engineRunning(){return Engine.ready;}
        protected String receiverPackage(){return "";}
        protected Class<? extends ProviderEngineService> engineService(){return Engine.class;}
    }
    @Before public void setup(){Engine.starts=0;Engine.stops=0;Engine.ready=false;Engine.enabled=true;Engine.blocked=false;Engine.nativeFailure=false;Engine.deferShutdown=false;Engine.stoppedBeforeNative=false;Engine.pendingStop=null;Application app=RuntimeEnvironment.getApplication();ProviderLifecycle.install(app);app.getSharedPreferences("navigation_startup_lease",0).edit().clear().commit();}
    @Test public void foregroundNotificationPrecedesNativeStartupWithoutOpeningActivity(){
        Application app=RuntimeEnvironment.getApplication();Shadows.shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION);
        ProviderEngineService.renewLease(app);
        Engine e=Robolectric.buildService(Engine.class).create().get();assertEquals(Service.START_NOT_STICKY,e.onStartCommand(new Intent(),0,1));
        assertEquals(1,Engine.starts);assertTrue(Shadows.shadowOf(e).isLastForegroundNotificationAttached());
        assertNull(Shadows.shadowOf(app).getNextStartedActivity());e.onDestroy();
    }
    @Test public void deniedLocationDoesNotInitializeEngine(){
        Application app=RuntimeEnvironment.getApplication();Shadows.shadowOf(app).denyPermissions(Manifest.permission.ACCESS_FINE_LOCATION,Manifest.permission.ACCESS_COARSE_LOCATION);
        ProviderEngineService.renewLease(app);Engine e=Robolectric.buildService(Engine.class).create().get();e.onStartCommand(new Intent(),0,1);
        assertEquals(0,Engine.starts);assertEquals("permission_required",ProviderEngineService.lastState());e.onDestroy();
    }
    @Test public void healthApiReturnsProviderOwnedImmutableServiceCapability() throws Exception {
        Application app=RuntimeEnvironment.getApplication();Shadows.shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION);
        Control c=Robolectric.buildService(Control.class).create().get();Parcel in=Parcel.obtain(),out=Parcel.obtain();
        try{in.writeInterfaceToken(StartupProtocol.DESCRIPTOR);c.onBind(new Intent()).transact(StartupProtocol.STATUS,in,out,0);out.readException();
            Bundle b=out.readBundle(getClass().getClassLoader());assertEquals(1,b.getInt("version"));assertEquals("stopped",b.getString("state"));
            assertEquals(10000,b.getLong("health_interval_ms"));assertEquals(15000,b.getLong("health_timeout_ms"));assertFalse(b.getBoolean("api_started"));
            PendingIntent token=b.getParcelable("start");assertNotNull(token);assertTrue(token.isImmutable());assertTrue(token.isForegroundService());
        }finally{in.recycle();out.recycle();c.onDestroy();}
    }
    @Test public void anUntrustedUidCannotAcquireTheStartupPendingIntent() throws Exception {
        Control c=Robolectric.buildService(Control.class).create().get();Parcel in=Parcel.obtain(),out=Parcel.obtain();
        org.robolectric.shadows.ShadowBinder.setCallingUid(91234);
        try {in.writeInterfaceToken(StartupProtocol.DESCRIPTOR);c.onBind(new Intent()).transact(StartupProtocol.STATUS,in,out,0);
            try{out.readException();fail("untrusted caller acquired provider capability");}catch(SecurityException expected){}
        } finally {org.robolectric.shadows.ShadowBinder.reset();in.recycle();out.recycle();c.onDestroy();}
    }
    @Test public void expiredConsumerLeasePreservesAnAlreadyRunningManualEngine(){
        Application app=RuntimeEnvironment.getApplication();Shadows.shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION);Engine.ready=true;
        ProviderEngineService.renewLease(app);Engine e=Robolectric.buildService(Engine.class).create().get();e.onStartCommand(new Intent(),0,1);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(16));
        assertTrue(Shadows.shadowOf(e).isStoppedBySelf());assertTrue(Engine.ready);assertEquals(0,Engine.stops);e.onDestroy();
    }
    private Engine startOwned() {
        Application app=RuntimeEnvironment.getApplication();Shadows.shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION);
        ProviderEngineService.renewLease(app);Engine e=Robolectric.buildService(Engine.class).create().get();e.onStartCommand(new Intent(),0,1);Engine.ready=true;return e;
    }
    @Test public void apiStartedNativeEngineStopsAtFifteenSecondsWithoutAHeartbeat(){
        Engine e=startOwned();Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(14999));
        assertEquals(0,Engine.stops);assertTrue(Engine.ready);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(1));
        assertEquals(1,Engine.stops);assertFalse(Engine.ready);assertTrue(Engine.stoppedBeforeNative);e.onDestroy();
    }
    @Test public void aTenSecondHeartbeatExtendsTheSameOwnedEngineWithoutRestarting(){
        Engine e=startOwned();Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(10));
        ProviderEngineService.renewLease(RuntimeEnvironment.getApplication());
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(14999));
        assertEquals(0,Engine.stops);assertEquals(1,Engine.starts);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(1));
        assertEquals(1,Engine.stops);e.onDestroy();
    }
    @Test public void openingTheProviderTransfersOwnershipEvenAfterItsActivityCloses(){
        Engine e=startOwned();var screen=Robolectric.buildActivity(Activity.class).setup();screen.pause().stop().destroy();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(16));
        assertEquals(0,Engine.stops);assertTrue(Engine.ready);e.onDestroy();
    }
    @Test public void aManualNativeServiceStillStartingCannotBeAdoptedByTheApi(){
        Application app=RuntimeEnvironment.getApplication();ActivityManager.RunningServiceInfo service=new ActivityManager.RunningServiceInfo();
        service.service=new ComponentName(app.getPackageName(),"test.NativeEngine");
        Shadows.shadowOf(app.getSystemService(ActivityManager.class)).setServices(java.util.Collections.singletonList(service));
        Engine e=startOwned();Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(16));
        assertEquals(0,Engine.stops);assertTrue(Engine.ready);e.onDestroy();
    }
    @Test public void destroyingTheWrapperDoesNotDiscardTheOwnedNativeShutdownDeadline(){
        Engine e=startOwned();e.onDestroy();Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(15));
        assertEquals(1,Engine.stops);assertFalse(Engine.ready);
    }
    @Test public void aLateNativeReadyCallbackRechecksTheLatestHeartbeat(){
        Engine.deferShutdown=true;Engine e=startOwned();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(15));
        assertNotNull(Engine.pendingStop);assertTrue(ProviderAudio.muted());
        assertFalse(Shadows.shadowOf(e).isStoppedBySelf());assertTrue(Shadows.shadowOf(e).isLastForegroundNotificationAttached());
        ProviderEngineService.renewLease(RuntimeEnvironment.getApplication());
        Engine.pendingStop.run();
        assertEquals(0,Engine.stops);assertTrue(Engine.ready);e.onDestroy();
    }
    @Test public void aLateNativeReadyCallbackCannotQuitAUserAdoptedEngine(){
        Engine.deferShutdown=true;Engine e=startOwned();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(15));
        assertNotNull(Engine.pendingStop);var screen=Robolectric.buildActivity(Activity.class).setup();
        Engine.pendingStop.run();assertEquals(0,Engine.stops);assertTrue(Engine.ready);
        screen.pause().stop().destroy();e.onDestroy();
    }
    public static class CarSession extends androidx.car.app.Session {
        @Override public androidx.car.app.Screen onCreateScreen(Intent intent){return null;}
    }
    @Test public void carMetadataCreationDoesNotAdoptAnApiEngine(){
        Engine e=startOwned();CarSession session=new CarSession();ProviderLifecycle.observeCarSession(session);
        ((androidx.lifecycle.LifecycleRegistry)session.getLifecycle()).handleLifecycleEvent(androidx.lifecycle.Lifecycle.Event.ON_CREATE);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(15));
        assertEquals(1,Engine.stops);assertFalse(Engine.ready);e.onDestroy();
    }
    @Test public void aVisibleCarSessionTransfersTheApiEngineToTheUser(){
        Engine e=startOwned();CarSession session=new CarSession();ProviderLifecycle.observeCarSession(session);
        androidx.lifecycle.LifecycleRegistry lifecycle=(androidx.lifecycle.LifecycleRegistry)session.getLifecycle();
        lifecycle.handleLifecycleEvent(androidx.lifecycle.Lifecycle.Event.ON_CREATE);lifecycle.handleLifecycleEvent(androidx.lifecycle.Lifecycle.Event.ON_START);
        lifecycle.handleLifecycleEvent(androidx.lifecycle.Lifecycle.Event.ON_STOP);lifecycle.handleLifecycleEvent(androidx.lifecycle.Lifecycle.Event.ON_DESTROY);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(16));
        assertEquals(0,Engine.stops);assertTrue(Engine.ready);e.onDestroy();
    }
    private String apiState(Control c) throws Exception {
        Parcel in=Parcel.obtain(),out=Parcel.obtain();try{in.writeInterfaceToken(StartupProtocol.DESCRIPTOR);c.onBind(new Intent()).transact(StartupProtocol.STATUS,in,out,0);out.readException();return out.readBundle(getClass().getClassLoader()).getString("state");}finally{in.recycle();out.recycle();}
    }
    @Test public void providerFailureAfterSuccessfulIntentDeliverySurvivesServiceDestruction() throws Exception {
        Application app=RuntimeEnvironment.getApplication();Shadows.shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION);ProviderEngineService.renewLease(app);
        Engine.blocked=true;Engine e=Robolectric.buildService(Engine.class).create().get();e.onStartCommand(new Intent(),0,1);e.onDestroy();
        Control c=Robolectric.buildService(Control.class).create().get();assertEquals("start_blocked",apiState(c));
        Engine.blocked=false;Engine.ready=true;Engine retry=Robolectric.buildService(Engine.class).create().get();retry.onStartCommand(new Intent(),0,2);
        assertEquals("running",apiState(c));retry.onDestroy();c.onDestroy();
    }
    @Test public void nativeInitializationFailureIsReportedToTheMap() throws Exception {
        Application app=RuntimeEnvironment.getApplication();Shadows.shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION);ProviderEngineService.renewLease(app);
        Engine.nativeFailure=true;Engine e=Robolectric.buildService(Engine.class).create().get();e.onStartCommand(new Intent(),0,1);e.onDestroy();
        Control c=Robolectric.buildService(Control.class).create().get();assertEquals("error",apiState(c));c.onDestroy();
    }
}
