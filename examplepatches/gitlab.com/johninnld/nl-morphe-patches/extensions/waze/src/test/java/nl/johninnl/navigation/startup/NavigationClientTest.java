package nl.johninnl.navigation.startup;
import android.app.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34)
public class NavigationClientTest {
 @Test public void selectionOnlyWakesProviderDuringVisibleOrNavigationSession(){
  Application app=RuntimeEnvironment.getApplication();NavigationClient c=new NavigationClient(app);c.select("com.waze",false);
  assertEquals("paused",c.state());c.onActivityResumed(new Activity());assertNotEquals("paused",c.state());
  c.select("",false);assertEquals("off",c.state());c.close();
 }
 @Test public void activityPauseKeepsNavigationSessionAndDropsPlainBrowsingSession(){
  Application app=RuntimeEnvironment.getApplication();NavigationClient c=new NavigationClient(app);Activity a=new Activity();
  c.onActivityResumed(a);c.select("nl.flitsmeister",true);c.onActivityPaused(a);assertNotEquals("paused",c.state());
  c.select("nl.flitsmeister",false);assertEquals("paused",c.state());c.close();
 }
 @Test public void aLateHealthReplyCannotReviveTheOldProviderAfterSourceSwitch() throws Exception {
  Application app=RuntimeEnvironment.getApplication();
  java.util.concurrent.CountDownLatch entered=new java.util.concurrent.CountDownLatch(1),release=new java.util.concurrent.CountDownLatch(1),finished=new java.util.concurrent.CountDownLatch(1);
  android.os.Binder api=new android.os.Binder(){protected boolean onTransact(int code,android.os.Parcel in,android.os.Parcel out,int flags){
   entered.countDown();try{release.await(3,java.util.concurrent.TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}
   android.os.Bundle reply=new android.os.Bundle();reply.putInt("version",1);reply.putString("state","running");out.writeNoException();out.writeBundle(reply);finished.countDown();return true;
  }};
  Shadows.shadowOf(app).setComponentNameAndServiceForBindService(new android.content.ComponentName("com.waze",StartupProtocol.controlClass("com.waze")),api);
  NavigationClient c=new NavigationClient(app);c.select("com.waze",true);Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
  assertTrue(entered.await(3,java.util.concurrent.TimeUnit.SECONDS));c.select("",false);release.countDown();assertTrue(finished.await(3,java.util.concurrent.TimeUnit.SECONDS));
  for(int i=0;i<10;i++){Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();Thread.sleep(5);}
  assertEquals("off",c.state());assertNull(Shadows.shadowOf(app).getNextStartedActivity());c.close();
 }
 @Test public void malformedServiceConnectionCannotCrashTheMap(){
  Application app=RuntimeEnvironment.getApplication();Shadows.shadowOf(app).setComponentNameAndServiceForBindService(null,new android.os.Binder());
  NavigationClient c=new NavigationClient(app);c.select("com.waze",true);Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
  assertEquals("incompatible",c.state());c.close();
 }
 @Test public void aHungOldProviderCannotBlockTheOtherSelectedProvider() throws Exception {
  Application app=RuntimeEnvironment.getApplication();java.util.concurrent.CountDownLatch oldEntered=new java.util.concurrent.CountDownLatch(1),release=new java.util.concurrent.CountDownLatch(1),newEntered=new java.util.concurrent.CountDownLatch(1);
  android.os.Binder hung=new android.os.Binder(){protected boolean onTransact(int code,android.os.Parcel in,android.os.Parcel out,int flags){oldEntered.countDown();try{release.await(10,java.util.concurrent.TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}out.writeNoException();out.writeBundle(new android.os.Bundle());return true;}};
  android.os.Binder healthy=new android.os.Binder(){protected boolean onTransact(int code,android.os.Parcel in,android.os.Parcel out,int flags){android.os.Bundle b=new android.os.Bundle();b.putInt("version",1);b.putString("state","running");out.writeNoException();out.writeBundle(b);newEntered.countDown();return true;}};
  Shadows.shadowOf(app).setComponentNameAndServiceForBindService(new android.content.ComponentName("com.waze",StartupProtocol.controlClass("com.waze")),hung);
  NavigationClient c=new NavigationClient(app);
  try {
   c.select("com.waze",true);Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertTrue(oldEntered.await(2,java.util.concurrent.TimeUnit.SECONDS));
   Shadows.shadowOf(app).setComponentNameAndServiceForBindService(new android.content.ComponentName("nl.flitsmeister",StartupProtocol.controlClass("nl.flitsmeister")),healthy);
   c.select("nl.flitsmeister",true);Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
   assertTrue("healthy alternative was queued behind hung provider",newEntered.await(2,java.util.concurrent.TimeUnit.SECONDS));
   for(int n=0;n<10;n++){Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();Thread.sleep(5);}assertEquals("running",c.state());
  } finally {release.countDown();c.close();}
 }
}
