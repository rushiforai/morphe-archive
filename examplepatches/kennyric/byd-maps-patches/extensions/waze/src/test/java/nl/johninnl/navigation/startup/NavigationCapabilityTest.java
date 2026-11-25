package nl.johninnl.navigation.startup;

import static org.junit.Assert.*;
import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.os.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import org.robolectric.shadows.ShadowPendingIntent;

/** Exercise the real client authentication/bind/send path; Android still owns eligibility checks. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=34,application=NavigationCapabilityTest.RecordingApplication.class,shadows=NavigationCapabilityTest.CaptureSend.class)
public class NavigationCapabilityTest {
    public static class RecordingApplication extends Application {
        int flags;
        @Override public boolean bindService(Intent intent,ServiceConnection connection,int flags){this.flags=flags;return super.bindService(intent,connection,flags);}
    }
    @Implements(PendingIntent.class)
    public static class CaptureSend extends ShadowPendingIntent {
        static Bundle options;static int sends;
        @Implementation protected void send(Context context,int code,Intent intent,PendingIntent.OnFinished callback,Handler handler,String permission,Bundle options)throws PendingIntent.CanceledException{
            CaptureSend.options=options==null?null:new Bundle(options);sends++;super.send(context,code,intent,callback,handler,permission,options);
        }
    }
    private NavigationClient client;
    private int senderMode()throws Exception{
        java.lang.reflect.Method parse=ActivityOptions.class.getDeclaredMethod("fromBundle",Bundle.class);parse.setAccessible(true);
        return ((ActivityOptions)parse.invoke(null,CaptureSend.options)).getPendingIntentBackgroundActivityStartMode();
    }
    @Before public void reset(){CaptureSend.options=null;CaptureSend.sends=0;}
    @After public void close(){if(client!=null)client.close();}
    private void start(boolean visible,boolean authenticated)throws Exception{
        RecordingApplication app=(RecordingApplication)RuntimeEnvironment.getApplication();
        PackageInfo info=new PackageInfo();info.packageName="nl.flitsmeister";info.applicationInfo=new ApplicationInfo();info.applicationInfo.packageName=info.packageName;info.applicationInfo.uid=12345;Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        PendingIntent pending=PendingIntent.getForegroundService(app,95,new Intent().setClassName("nl.flitsmeister","nl.johninnl.flitsmeister.NavigationEngineService"),PendingIntent.FLAG_IMMUTABLE);
        Shadows.shadowOf(pending).setCreatorPackage(authenticated?"nl.flitsmeister":"untrusted.other");Shadows.shadowOf(pending).setCreatorUid(12345);
        CountDownLatch status=new CountDownLatch(1);
        Binder api=new Binder(){protected boolean onTransact(int code,Parcel input,Parcel output,int flags){input.enforceInterface(StartupProtocol.DESCRIPTOR);Bundle value=new Bundle();value.putInt("version",1);value.putString("state","stopped");value.putParcelable("start",pending);output.writeNoException();output.writeBundle(value);status.countDown();return true;}};
        Shadows.shadowOf(app).setComponentNameAndServiceForBindService(new ComponentName("nl.flitsmeister",StartupProtocol.controlClass("nl.flitsmeister")),api);
        client=new NavigationClient(app);if(visible)client.onActivityResumed(new Activity());client.select("nl.flitsmeister",true);Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(status.await(2,TimeUnit.SECONDS));
        for(int i=0;i<40&&CaptureSend.sends==0&&!"incompatible".equals(client.state());i++){Shadows.shadowOf(Looper.getMainLooper()).idle();Thread.sleep(5);}
    }
    @Test public void visibleCallerExplicitlySharesItsExistingWhileInUseCapabilities()throws Exception{
        start(true,true);RecordingApplication app=(RecordingApplication)RuntimeEnvironment.getApplication();
        assertEquals(Context.BIND_AUTO_CREATE|Context.BIND_INCLUDE_CAPABILITIES,app.flags);
        assertEquals(1,CaptureSend.sends);assertNotNull("Visible modern sender must explicitly opt in",CaptureSend.options);
        assertEquals(ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED,senderMode());
        assertNull(Shadows.shadowOf(app).getNextStartedActivity());
    }
    @Test public void navigationWithoutAVisibleActivityDoesNotInventVisibleSenderPrivileges()throws Exception{
        start(false,true);assertEquals(1,CaptureSend.sends);assertNull(CaptureSend.options);
    }
    @Test public void wrongCreatorCannotReceiveAStartOrPrivilegeOptIn()throws Exception{
        start(true,false);assertEquals(0,CaptureSend.sends);assertEquals("incompatible",client.state());assertNull(CaptureSend.options);
    }
    @Test @Config(sdk=36) public void android36UsesThePlatformVisibleOnlySenderMode()throws Exception{
        start(true,true);assertEquals(1,CaptureSend.sends);assertNotNull(CaptureSend.options);
        assertEquals(ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOW_IF_VISIBLE,senderMode());
    }
}
