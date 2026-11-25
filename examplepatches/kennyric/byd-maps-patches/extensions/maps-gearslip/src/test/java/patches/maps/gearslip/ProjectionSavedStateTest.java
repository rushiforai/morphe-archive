package patches.maps.gearslip;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowBinder;
import org.robolectric.RuntimeEnvironment;
import android.view.Surface;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32)
public class ProjectionSavedStateTest {
    private ProjectionRenderer renderer(int uid) {
        return new ProjectionRenderer(Robolectric.buildService(NativeCarService.class).create().get(),uid,error->{throw new AssertionError(error);});
    }
    private Object field(Object target,String name)throws Exception {
        var f=target.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(target);
    }
    private void set(Object target,String name,Object value)throws Exception {
        var f=target.getClass().getDeclaredField(name);f.setAccessible(true);f.set(target,value);
    }
    private void save(ProjectionRenderer renderer,Bundle state,boolean oneWay)throws Exception {
        Parcel in=Parcel.obtain(),out=oneWay?null:Parcel.obtain();
        try {
            in.writeInterfaceToken("com.google.android.gms.car.ICarProjectionCallback");in.writeInt(1);state.writeToParcel(in,0);in.setDataPosition(0);
            assertTrue(((IBinder)field(renderer,"callback")).transact(12,in,out,oneWay?IBinder.FLAG_ONEWAY:0));
            if(out!=null)out.readException();
        }finally{in.recycle();if(out!=null)out.recycle();}
    }
    @Test public void nativeSavedStateCallbackSurvivesARecreatedPresentationIncludingOneWayTransport()throws Exception {
        ProjectionRenderer first=renderer(30001);Bundle state=new Bundle();state.putString("screen","guidance");save(first,state,true);
        ProjectionRenderer next=renderer(30001);assertEquals("guidance",((Bundle)field(next,"initialUiState")).getString("screen"));
        state.putString("screen","late");save(first,state,false);
        assertEquals("guidance",((Bundle)field(renderer(30001),"initialUiState")).getString("screen"));
    }
    @Test public void anotherUidCannotSubmitNativeUiState()throws Exception {
        ProjectionRenderer first=renderer(30002);ShadowBinder.setCallingUid(Process.myUid()+1);
        try{assertThrows(SecurityException.class,()->save(first,new Bundle(),false));}
        finally{ShadowBinder.reset();}
        assertNull(field(renderer(30002),"initialUiState"));
    }
    @Test public void freshSessionRoutesItsInitialIntentWhileRestorationPreservesNativeState()throws Exception {
        ProjectionRenderer fresh=renderer(30004);
        assertNull("A fresh native activity must receive null, not an empty restoration Bundle",fresh.restoredUiState());
        Bundle saved=new Bundle();saved.putString("ACTIVITY_STATE_UNIQUE_ID","native-activity");
        save(fresh,saved,false);
        ProjectionRenderer replacement=renderer(30004);
        Bundle restored=replacement.restoredUiState();
        assertNotNull(restored);assertEquals("native-activity",restored.getString("ACTIVITY_STATE_UNIQUE_ID"));
        restored.putString("ACTIVITY_STATE_UNIQUE_ID","mutated");
        assertEquals("native-activity",replacement.restoredUiState().getString("ACTIVITY_STATE_UNIQUE_ID"));
        assertNotNull(restored.getClassLoader());
    }
    public static class Controller {
        public Bundle n;
        public Object J,k;
        final java.util.List<Integer> events=new java.util.ArrayList<>();
        public void m(int state,boolean changing) {
            events.add(state);
            if(state==2){n=new Bundle();n.putString("screen","guidance");}
            if(state==0)n=null;
        }
        public void k(){events.add(-1);}
    }
    public static class NativeActivity {
        Intent received;
        public void B(int unrelated){throw new AssertionError("B is not the new-intent entry point");}
        public void C(Intent intent){received=intent;}
    }
    @Test public void newDestinationUsesTheCurrentNativeIntentEntryPoint()throws Exception {
        ProjectionRenderer renderer=renderer(30005);Controller controller=new Controller();NativeActivity activity=new NativeActivity();controller.J=activity;
        set(renderer,"controller",controller);set(renderer,"created",true);
        Intent incoming=new Intent("androidx.car.app.action.NAVIGATE",Uri.parse("google.navigation:q=52.0,4.3"));incoming.putExtra("request","original");
        renderer.newIntent(incoming);
        assertNotNull(activity.received);assertEquals(Intent.ACTION_VIEW,activity.received.getAction());assertEquals(incoming.getData(),activity.received.getData());assertEquals("original",activity.received.getStringExtra("request"));
        assertSame(field(renderer,"intent"),activity.received);renderer.close();
    }
    public static class DisplayHolder {
        int detaches;
        public void f(Surface surface){assertNull(surface);detaches++;}
    }
    public static class NativePresentation {
        public Context h=RuntimeEnvironment.getApplication();
        public DisplayHolder j=new DisplayHolder();
    }
    @Test public void surfaceDetachUsesTheDisplayHolderAndPreservesTheNativeActivity()throws Exception {
        ProjectionRenderer renderer=renderer(30006);Controller controller=new Controller();NativePresentation presentation=new NativePresentation();controller.k=presentation;
        set(renderer,"controller",controller);set(renderer,"created",true);renderer.surfaceDestroyed();
        assertEquals(1,presentation.j.detaches);assertSame(controller,field(renderer,"controller"));assertTrue((Boolean)field(renderer,"created"));renderer.close();
    }
    @Test public void closeCapturesNativeStopStateBeforeDestroyClearsIt()throws Exception {
        ProjectionRenderer first=renderer(30003);Controller nativeController=new Controller();set(first,"controller",nativeController);set(first,"created",true);
        first.close();assertEquals(java.util.Arrays.asList(2,0,-1),nativeController.events);
        assertEquals("guidance",((Bundle)field(renderer(30003),"initialUiState")).getString("screen"));
    }
}
