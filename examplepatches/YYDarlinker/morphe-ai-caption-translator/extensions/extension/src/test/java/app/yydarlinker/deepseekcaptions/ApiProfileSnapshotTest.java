package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,shadows=ApiProfileSnapshotTest.Keys.class)
public class ApiProfileSnapshotTest {
 @Implements(SecureApiKey.class) public static class Keys {
  @Implementation public static String load(Context c){return "fake-key-"+ApiProfiles.active(c);}
 }
 @Test public void snapshotsNeverMixProfileEndpointAndSecret()throws Exception{
  Context c=RuntimeEnvironment.getApplication();String b=ApiProfiles.create(c,"B","https://b.example/v1");DeepSeekConfig.saveBaseUrl(c,"https://a.example/v1");
  java.util.concurrent.atomic.AtomicReference<Throwable> failure=new java.util.concurrent.atomic.AtomicReference<>();
  Thread reader=new Thread(()->{try{for(int i=0;i<2000;i++){DeepSeekConfig.Snapshot s=DeepSeekConfig.load(c);assertEquals(s.baseUrl.contains("b.example")?"fake-key-"+b:"fake-key-default",s.apiKey);}}catch(Throwable e){failure.set(e);}});
  reader.start();for(int i=0;i<100;i++){ApiProfiles.select(c,b);ApiProfiles.select(c,"default");}reader.join();if(failure.get()!=null)throw new AssertionError(failure.get());
 }
}
