package app.afterglow.extension.menus;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.View;
import android.view.Window;
import app.afterglow.extension.diagnostics.DebugLog;
import java.lang.ref.WeakReference;
import java.util.function.BooleanSupplier;

/** Copies only the complete, currently visible native item from its own activity window. */
final class LongPressWindowCapture {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final long MAX_PIXELS=8L*1024*1024;
    interface Callback {void finished(Request request,Bitmap image);}
    private LongPressWindowCapture(){}

    static Request create(Activity activity,View root,BooleanSupplier current,Callback callback){
        if(Build.VERSION.SDK_INT<26||activity==null||root==null||current==null||callback==null)return null;
        Window window=activity.getWindow();Rect bounds=bounds(activity,root,window);
        if(bounds==null||!current.getAsBoolean())return null;
        return new Request(activity,root,window,bounds,current,callback);
    }
    /** Complete local visibility prevents PixelCopy's automatic clipping/scaling of an incomplete item. */
    private static Rect bounds(Activity activity,View root,Window window){
        if(activity==null||root==null||window==null||activity.isFinishing()||activity.isDestroyed()
                ||activity.getWindow()!=window||!root.isAttachedToWindow()||!root.isShown()||!root.hasWindowFocus())return null;
        View decor=window.peekDecorView();
        if(decor==null||root.getRootView()!=decor||root.getWindowToken()==null
                ||root.getWindowToken()!=decor.getWindowToken())return null;
        int width=root.getWidth(),height=root.getHeight();
        if(width<=0||height<=0||width>8192||height>8192||(long)width*height>MAX_PIXELS)return null;
        Rect visible=new Rect();
        if(!root.getLocalVisibleRect(visible)||visible.left!=0||visible.top!=0
                ||visible.right!=width||visible.bottom!=height)return null;
        // A window crop cannot reproduce a transformed item without copying surrounding content.
        View view=root;
        for(int depth=0;view!=decor;depth++){
            if(depth>=64||view==null||view.getScaleX()!=1f||view.getScaleY()!=1f||view.getRotation()!=0f)return null;
            Object parent=view.getParent();view=parent instanceof View?(View)parent:null;
        }
        int[] position=new int[2];root.getLocationInWindow(position);
        long right=(long)position[0]+width,bottom=(long)position[1]+height;
        if(position[0]<0||position[1]<0||right>decor.getWidth()||bottom>decor.getHeight())return null;
        return new Rect(position[0],position[1],(int)right,(int)bottom);
    }
    static final class Request {
        private final WeakReference<Activity> activity;
        private final WeakReference<View> root;
        private final WeakReference<Window> window;
        private final Rect region;
        private BooleanSupplier current;
        private Callback callback;
        private Bitmap image;
        private boolean active=true,started,finished;
        private Request(Activity activity,View root,Window window,Rect region,BooleanSupplier current,Callback callback){
            this.activity=new WeakReference<>(activity);this.root=new WeakReference<>(root);this.window=new WeakReference<>(window);
            this.region=region;this.current=current;this.callback=callback;
        }
        void start(){
            if(started||!active)return;started=true;
            try{
                if(!valid()){finish(PixelCopy.ERROR_SOURCE_INVALID);return;}
                image=Bitmap.createBitmap(region.width(),region.height(),Bitmap.Config.ARGB_8888);
                // PixelCopy may offset the supplied Rect for surface insets, so retain our own immutable coordinates.
                PixelCopy.request(window.get(),new Rect(region),image,this::finish,MAIN);
            }catch(Exception|OutOfMemoryError error){
                DebugLog.write("long-press","Window capture unavailable: "+LongPressCaptureTools.failureSummary(error));
                finish(PixelCopy.ERROR_SOURCE_INVALID);
            }
        }
        private boolean valid(){
            if(!active||current==null||!current.getAsBoolean())return false;
            Rect now=bounds(activity.get(),root.get(),window.get());return region.equals(now);
        }
        void cancel(){active=false;current=null;callback=null;}
        private void finish(int status){
            if(finished)return;finished=true;
            Callback listener=callback;callback=null;Bitmap result=image;image=null;
            boolean accepted=false;
            try{accepted=status==PixelCopy.SUCCESS&&result!=null&&valid();}
            catch(Exception error){DebugLog.write("long-press","Window capture validation unavailable: "+error.getClass().getSimpleName());}
            active=false;current=null;
            if(!accepted&&result!=null){result.recycle();result=null;}
            if(listener!=null){
                DebugLog.write("long-press","Window capture result="+status+" accepted="+accepted);
                listener.finished(this,result);
            }
        }
    }
}
