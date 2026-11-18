package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.app.Application;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.FrameLayout;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowBinder;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public final class LocalCarUiEntryTest{
    LocalCarUiEntry entry;
    @Before public void setup(){Application app=RuntimeEnvironment.getApplication();entry=new LocalCarUiEntry(app,app,null);ShadowBinder.setCallingUid(Process.myUid());}
    @After public void cleanup(){LocalCarUiSession.detach(LocalCarUiSession.owner());ShadowBinder.reset();}
    @Test public void ownsRealContentWithoutLoadingOrBindingAnExternalPackage(){
        FrameLayout root=(FrameLayout)entry.getAppLayout();assertNotNull(root.findViewById(entry.getContentContainerId()));
        assertEquals(1,root.getChildCount());entry.onStart();entry.onStop();
        assertTrue(org.robolectric.Shadows.shadowOf(RuntimeEnvironment.getApplication()).getBoundServiceConnections().isEmpty());
    }
    @Test public void optimizedCapabilitiesAndDrawerVisibilityAreTruthful()throws Exception{
        Parcel in=Parcel.obtain(),out=Parcel.obtain();
        try{in.writeInterfaceToken("com.google.android.apps.auto.sdk.ICapabilityController");in.setDataPosition(0);assertTrue(entry.getCapabilityController().transact(1,in,out,0));out.readException();assertEquals(java.util.Collections.singletonList("APP_BAR_INSET_BEHAVIOR"),out.createStringArrayList());}
        finally{in.recycle();out.recycle();}
        in=Parcel.obtain();out=Parcel.obtain();
        try{in.writeInterfaceToken("com.google.android.apps.auto.sdk.IDrawerController");in.setDataPosition(0);entry.getDrawerController().transact(1,in,out,0);out.readException();assertEquals(0,out.readInt());}
        finally{in.recycle();out.recycle();}
    }
    @Test public void preservesNativeEditorAndChildState(){
        FrameLayout content=((FrameLayout)entry.getAppLayout()).findViewById(entry.getContentContainerId());
        EditText editor=new EditText(content.getContext());editor.setId(1234);editor.setText("Amsterdam");content.addView(editor);editor.requestFocus();
        assertNotNull(entry.createInputConnection(new EditorInfo()));
        Bundle state=new Bundle();entry.onSaveInstanceState(state);editor.setText("Changed");entry.onRestoreInstanceState(state);
        assertEquals("Amsterdam",editor.getText().toString());
        assertEquals(ViewGroup.FOCUS_AFTER_DESCENDANTS,content.getDescendantFocusability());
    }
    @Test public void privateControllersRejectForeignUids()throws Exception{
        ShadowBinder.setCallingUid(Process.myUid()+1);Parcel in=Parcel.obtain(),out=Parcel.obtain();
        try{in.writeInterfaceToken("com.google.android.apps.auto.sdk.ICapabilityController");in.setDataPosition(0);
            try{entry.getCapabilityController().transact(1,in,out,0);out.readException();fail("Foreign UID accepted");}catch(SecurityException expected){}
        }finally{in.recycle();out.recycle();}
    }
    @Test public void passesHostInsetsToNativeContentWithoutShrinkingTheCanvas()throws Exception{
        FrameLayout root=(FrameLayout)entry.getAppLayout();FrameLayout content=root.findViewById(entry.getContentContainerId());
        android.graphics.Rect[] received={null};android.view.View nativeView=new android.view.View(root.getContext());
        nativeView.setOnApplyWindowInsetsListener((view,insets)->{received[0]=new android.graphics.Rect(insets.getSystemWindowInsetLeft(),insets.getSystemWindowInsetTop(),insets.getSystemWindowInsetRight(),insets.getSystemWindowInsetBottom());return insets;});
        content.addView(nativeView);root.dispatchApplyWindowInsets(new android.view.WindowInsets.Builder().setSystemWindowInsets(android.graphics.Insets.of(40,20,60,80)).build());
        assertEquals(new android.graphics.Rect(40,20,60,80),received[0]);assertEquals(0,root.getPaddingLeft());assertEquals(0,root.getPaddingTop());
        Parcel in=Parcel.obtain(),out=Parcel.obtain();
        try{in.writeInterfaceToken("com.google.android.apps.auto.sdk.IStatusBarController");in.writeInt(1);in.setDataPosition(0);entry.getStatusBarController().transact(20,in,out,0);out.readException();}finally{in.recycle();out.recycle();}
        root.dispatchApplyWindowInsets(new android.view.WindowInsets.Builder().setSystemWindowInsets(android.graphics.Insets.of(40,20,60,80)).build());
        assertEquals(20+Math.round(90*root.getResources().getDisplayMetrics().density),received[0].top);
        assertEquals(0,root.getPaddingTop());
    }
    @Test public void retiredDecorCannotSendARequestIntoTheReplacementSession(){
        Object first=new Object(),second=new Object();int[] launches={0,0};Application app=RuntimeEnvironment.getApplication();
        LocalCarUiSession.attach(first,intent->launches[0]++,(text,duration)->{});LocalCarUiEntry old=new LocalCarUiEntry(app,app,null);old.onStart();
        LocalCarUiSession.attach(second,intent->launches[1]++,(text,duration)->{});LocalCarUiEntry current=new LocalCarUiEntry(app,app,null);current.onStart();
        old.startCarActivity(new android.content.Intent("old"));assertArrayEquals(new int[]{0,0},launches);
        LocalCarUiSession.detach(first);current.startCarActivity(new android.content.Intent("current"));assertArrayEquals(new int[]{0,1},launches);
        current.onStop();current.startCarActivity(new android.content.Intent("stopped"));assertArrayEquals(new int[]{0,1},launches);
    }
    @Test public void scopedSdkPoliciesUseExactDimensionsAndRejectUnknownKeys(){
        Application app=RuntimeEnvironment.getApplication();float density=app.getResources().getDisplayMetrics().density;
        assertTrue(LocalCarUiResources.flag("gearhead_sdk_supports_window_insets"));
        assertTrue(LocalCarUiResources.flag("multi_display_car_ui_entry"));assertTrue(LocalCarUiResources.flag("multi_region_car_ui_entry"));
        assertEquals((int)(96*density),LocalCarUiResources.dimension(app,"gearhead_sdk_drawer_header_height"));
        assertEquals((int)(8*density),LocalCarUiResources.dimension(app,"gearhead_sdk_toast_padding"));assertEquals((int)(60*density),LocalCarUiResources.dimension(app,"toast_y_offset"));
        try{LocalCarUiResources.flag("unknown");fail("Unknown SDK capability accepted");}catch(android.content.res.Resources.NotFoundException expected){}
        try{LocalCarUiResources.dimension(app,"unknown");fail("Unknown SDK dimension accepted");}catch(android.content.res.Resources.NotFoundException expected){}
    }
    @Test public void scopedConfigurationUpdatesDpiWithoutRecreatingNativeContent(){
        FrameLayout root=(FrameLayout)entry.getAppLayout();FrameLayout content=root.findViewById(entry.getContentContainerId());
        EditText editor=new EditText(content.getContext());editor.setText("Amsterdam");content.addView(editor);editor.requestFocus();
        android.content.res.Configuration config=ProjectionRenderer.canvasConfiguration(new android.content.res.Configuration(root.getResources().getConfiguration()),800,480,240);
        entry.onConfigurationChanged(config);
        assertSame(content,root.findViewById(entry.getContentContainerId()));assertSame(editor,content.getChildAt(0));assertEquals("Amsterdam",editor.getText().toString());
        assertEquals(240,root.getResources().getDisplayMetrics().densityDpi);assertEquals(533,root.getResources().getConfiguration().screenWidthDp);
    }
}
