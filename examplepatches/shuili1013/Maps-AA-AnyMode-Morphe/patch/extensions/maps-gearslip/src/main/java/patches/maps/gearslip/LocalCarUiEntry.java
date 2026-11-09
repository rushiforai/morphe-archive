package patches.maps.gearslip;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.ContextThemeWrapper;
import android.graphics.Color;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.RemoteException;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.FrameLayout;
import android.text.TextUtils;
import java.util.Collections;

/** App-owned decor for Maps' native car activity. No code/resources are loaded from the host. */
public final class LocalCarUiEntry {
    private static final String SDK="com.google.android.apps.auto.sdk.I";
    private final FrameLayout root,content;
    private final Object owner;
    private final Context decorContext;
    private IBinder imeCallback;
    private boolean started;
    private boolean background=true,opaque=true,assistantOverride,facetVisible=true;
    private int insetBehavior;
    private final IBinder status=new Controller("StatusBarController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){
            // These deprecated operations are also intentionally inert in the
            // optimized AA decor: the public CAL host owns the status/action bars.
            if(code==2){out.writeNoException();out.writeInt(0);return true;}
            if(code==20){insetBehavior=in.readInt();if(insetBehavior<0||insetBehavior>2)throw new IllegalArgumentException("Invalid app bar inset behavior");root.requestApplyInsets();}
            else if(code==1){if(in.readInt()!=0)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(in);}
            else if(code==21)assistantOverride=in.readInt()!=0;
            else if(code==13||code==16||code==18)in.readInt();
            else if(code==17)in.readFloat();
            else if(code==19){background=in.readInt()!=0;opaque=in.readInt()!=0;}
            else if(code<3||code>21)return false;
            out.writeNoException();return true;
        }
    };
    private final IBinder ime=new Controller("ImeController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){
            if(code!=1)return false;
            imeCallback=in.readStrongBinder();out.writeNoException();return true;
        }
    };
    private final IBinder capability=new Controller("CapabilityController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){
            if(code!=1)return false;
            out.writeNoException();out.writeStringList(Collections.singletonList("APP_BAR_INSET_BEHAVIOR"));return true;
        }
    };
    private final IBinder region=new Controller("CarRegionController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){
            if(code==1){out.writeNoException();return true;}
            if(code==2){out.writeNoException();out.writeInt(0);return true;}
            return false;
        }
    };
    private final IBinder toast=new Controller("ToastController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){
            if(code!=1&&code!=2)return false;
            CharSequence text=in.readInt()==0?null:TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(in);
            int duration=in.readInt();
            if(code==2&&in.readInt()!=0)android.content.ComponentName.CREATOR.createFromParcel(in);
            if(started&&text!=null)LocalCarUiSession.toast(owner,text,duration);
            out.writeNoException();return true;
        }
    };

    public LocalCarUiEntry(Context app,Context sdk,LayoutInflater.Factory factory){this(app,sdk,factory,0,0);}
    public LocalCarUiEntry(Context app,Context sdk,LayoutInflater.Factory factory,int display){this(app,sdk,factory,display,0);}
    public LocalCarUiEntry(Context app,Context sdk,LayoutInflater.Factory factory,int display,int region){
        owner=LocalCarUiSession.owner();
        Configuration input=app.getResources().getConfiguration(),override=new Configuration();
        override.touchscreen=input.touchscreen;override.navigation=input.navigation;override.uiMode=input.uiMode;override.fontScale=1;
        ContextThemeWrapper themed=new ContextThemeWrapper(app.createConfigurationContext(override),0);
        themed.getTheme().setTo(app.getTheme());decorContext=themed;
        root=new FrameLayout(decorContext);root.setBackgroundColor(Color.BLACK);
        content=new FrameLayout(decorContext);content.setId(View.generateViewId());
        content.setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);
        content.setOnApplyWindowInsetsListener((view,insets)->insets.replaceSystemWindowInsets(
                insets.getSystemWindowInsetLeft(),insets.getSystemWindowInsetTop()+(insetBehavior==1?Math.round(90*view.getResources().getDisplayMetrics().density):0),
                insets.getSystemWindowInsetRight(),insets.getSystemWindowInsetBottom()));
        root.addView(content,new FrameLayout.LayoutParams(-1,-1));
    }
    public View getAppLayout(){return root;}
    public int getContentContainerId(){return content.getId();}
    public IBinder getStatusBarController(){return status;}
    public IBinder getImeController(){return ime;}
    public IBinder getCapabilityController(){return capability;}
    public IBinder getCarRegionController(){return region;}
    public IBinder getToastController(){return toast;}
    // Maps' optimized car activity supplies its own menu/search/drawer views.
    // An unexpected legacy operation fails explicitly instead of claiming success.
    public IBinder getDrawerController(){return new Controller("DrawerController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){
            if(code==1||code==2){out.writeNoException();out.writeInt(0);return true;}
            if(code==5)in.readStrongBinder();else if(code==6)in.readInt();else if(code!=3&&code!=4)return false;
            out.writeNoException();return true;
        }
    };}
    public IBinder getMenuController(){return new Controller("MenuController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){
            if(code==1)in.readStrongBinder();else if(code==3)in.readInt();else if(code<2||code>9)return false;
            out.writeNoException();return true;
        }
    };}
    public IBinder getSearchController(){return new Controller("SearchController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){
            if(code==5)in.readStrongBinder();else if(code==4){if(in.readInt()!=0)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(in);}
            else if(code==7)in.readString();else if(code!=1&&code!=2&&code!=6)return false;
            out.writeNoException();return true;
        }
    };}
    public IBinder getFacetBarController(){return new Controller("FacetBarController"){
        @Override boolean dispatch(int code,Parcel in,Parcel out){if(code!=1)return false;facetVisible=in.readInt()!=0;out.writeNoException();return true;}
    };}
    public IBinder getVoiceSearchController(){return unsupported("VoiceSearchController");}
    public void onStart(){started=true;}
    public void onStop(){started=false;}
    public void onConfigurationChanged(Configuration configuration){
        Resources resources=decorContext.getResources();DisplayMetrics metrics=new DisplayMetrics();metrics.setTo(resources.getDisplayMetrics());
        try{android.view.Display display=decorContext.getDisplay();if(display!=null)display.getRealMetrics(metrics);}catch(UnsupportedOperationException noDisplay){/* JVM/application contexts have no display. */}
        if(configuration.densityDpi>0){metrics.densityDpi=configuration.densityDpi;metrics.density=configuration.densityDpi/160f;metrics.scaledDensity=metrics.density*(configuration.fontScale>0?configuration.fontScale:1);}
        resources.updateConfiguration(configuration,metrics);
        root.dispatchConfigurationChanged(configuration);root.requestLayout();
    }
    public void onSaveInstanceState(Bundle state){
        state.putBoolean("appContentFocusable",content.getDescendantFocusability()!=ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        state.putInt("morpheInsetBehavior",insetBehavior);
        state.putBoolean("morpheFacetVisible",facetVisible);
        android.util.SparseArray<android.os.Parcelable> children=new android.util.SparseArray<>();content.saveHierarchyState(children);
        state.putSparseParcelableArray("morpheCarContent",children);
    }
    public void onRestoreInstanceState(Bundle state){
        state.setClassLoader(root.getContext().getClassLoader());
        content.setDescendantFocusability(state.getBoolean("appContentFocusable",true)?ViewGroup.FOCUS_AFTER_DESCENDANTS:ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        insetBehavior=state.getInt("morpheInsetBehavior",0);
        facetVisible=state.getBoolean("morpheFacetVisible",true);
        android.util.SparseArray<android.os.Parcelable> children=state.getSparseParcelableArray("morpheCarContent");if(children!=null)content.restoreHierarchyState(children);
    }
    public InputConnection createInputConnection(EditorInfo editor){
        View focus=content.findFocus();
        InputConnection actual=focus==null?null:focus.onCreateInputConnection(editor);
        return actual!=null?actual:new BaseInputConnection(root,false);
    }
    public void startCarActivity(Intent intent){if(started)LocalCarUiSession.launch(owner,intent);}
    public void requestXRayScan(IBinder callback){/* Optional legacy debug visualization, never a client capability. */}

    private IBinder unsupported(String name){return new Controller(name){
        @Override boolean dispatch(int code,Parcel in,Parcel out)throws RemoteException{throw new RemoteException("Legacy "+name+" is unavailable in the app-owned navigation UI");}
    };}
    private abstract static class Controller extends Binder{
        final String descriptor;
        Controller(String name){descriptor=SDK+name;}
        @Override protected boolean onTransact(int code,Parcel in,Parcel out,int flags)throws RemoteException{
            if(code==INTERFACE_TRANSACTION){out.writeString(descriptor);return true;}
            if(Binder.getCallingUid()!=Process.myUid())throw new SecurityException("Internal Maps decor only");
            in.enforceInterface(descriptor);return dispatch(code,in,out);
        }
        abstract boolean dispatch(int code,Parcel in,Parcel out)throws RemoteException;
    }
}
