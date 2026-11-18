package app.afterglow.extension.menus;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.Toast;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.litho.LithoContext;
import app.afterglow.extension.navigation.MorpheFallbackAlbumCovers;
import app.afterglow.extension.settings.AfterglowPrefs;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/** Exact native avatar image bindings; ordinary clicks and existing listeners remain native. */
public final class AvatarPhotoActions {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Afterglow profile photo");t.setDaemon(true);return t;});
    private static final Map<View,Binding> bindings=new WeakHashMap<>();
    private static final AtomicBoolean fetching=new AtomicBoolean();
    private static final AtomicInteger diagnosticLines=new AtomicInteger();
    private static int bindCalls,viewBindings,avatarBindings,sourceBindings,rootBindings,acceptedBindings,readyCalls,readyMatches;
    private static long diagnosticDown=Long.MIN_VALUE;
    private static Gesture gesture;
    private static boolean cancellingNative;
    private static final View.OnAttachStateChangeListener ATTACH=new View.OnAttachStateChangeListener(){
        @Override public void onViewAttachedToWindow(View view){}
        @Override public void onViewDetachedFromWindow(View view){unbind(view);}
    };
    private static final class Binding {
        final WeakReference<Object> callback;final WeakReference<?> root;final String url;boolean loaded;
        Binding(Object callback,WeakReference<?> root,String url){this.callback=new WeakReference<>(callback);this.root=root;this.url=url;}
    }
    private static final class Hit {final View view;final Binding binding;Hit(View view,Binding binding){this.view=view;this.binding=binding;}}
    private static final class Gesture {
        final WeakReference<View> host,view;final Binding binding;final long down;final float x,y;final int slop;boolean shown;
        Gesture(View host,Hit hit,MotionEvent event){this.host=new WeakReference<>(host);view=new WeakReference<>(hit.view);binding=hit.binding;down=event.getDownTime();x=event.getRawX();y=event.getRawY();slop=ViewConfiguration.get(host.getContext()).getScaledTouchSlop();}
    }
    private AvatarPhotoActions() {}
    private static boolean enabled(){return InstalledTweaks.has("long-press-tools")&&AfterglowPrefs.getBool("saveProfilePhoto");}

    /** Called after the native target constructor has captured the image and conversion context. */
    public static void bind(View view,Object callback,LithoContext context,String url,Object rootToken) {
        try {
            synchronized(bindings){
                bindCalls++;bindings.remove(view);
                if(view!=null)view.removeOnAttachStateChangeListener(ATTACH);
                if(!(view instanceof ImageView)||callback==null||context==null)return;
                viewBindings++;
                StringBuilder path=context.afterglow_getPathBuilder();
                if(!AvatarPhotoPolicy.avatarPath(path==null?null:path.toString()))return;
                avatarBindings++;
                if(AvatarPhotoPolicy.largeUrl(url)==null)return;
                sourceBindings++;
                // Lwuw.b is optional on the current renderer. The exact native image
                // target/source, matching ready callback and unmount still identify this view.
                // Keep a provided token as an additional guard; never revive a cleared token.
                if(rootToken!=null&&!(rootToken instanceof WeakReference))return;
                if(rootToken!=null)rootBindings++;
                if(bindings.size()>=512)bindings.clear();bindings.put(view,new Binding(callback,(WeakReference<?>)rootToken,url));
                view.addOnAttachStateChangeListener(ATTACH);acceptedBindings++;
            }
        }catch(Throwable error){Afterglow.error("AvatarPhoto.bind",error);}
        finally {traceBinding("bind");}
    }
    /** A placeholder/failed request never enables actions, and stale native callbacks cannot rebind. */
    public static void loaded(View view,Object callback) {
        synchronized(bindings){readyCalls++;Binding binding=bindings.get(view);if(binding!=null&&binding.callback.get()==callback){binding.loaded=true;readyMatches++;}}
        traceBinding("ready");
    }
    public static void unbind(Object view) {
        synchronized(bindings){bindings.remove(view);}
        if(view instanceof View)((View)view).removeOnAttachStateChangeListener(ATTACH);
        if(gesture!=null&&gesture.view.get()==view)gesture=null;
    }
    /** Used by comment/post capture before arming; order of patch insertions does not matter. */
    public static boolean claimsTouch(View host,MotionEvent event) {
        try{return event!=null&&event.getActionMasked()==MotionEvent.ACTION_DOWN&&enabled()&&hit(host,event)!=null;}
        catch(Throwable ignored){return false;}
    }
    public static boolean onTouch(View host,MotionEvent event) {
        try {
            if(cancellingNative||event==null)return false;
            if(event.getActionMasked()==MotionEvent.ACTION_DOWN) {
                boolean enabled=enabled();traceTouch(host,event,enabled);
                if(!enabled)return false;
                Hit hit=hit(host,event);if(hit==null)return false;
                if(gesture!=null&&gesture.down==event.getDownTime()&&gesture.binding==hit.binding)return false;
                Gesture next=new Gesture(host,hit,event);gesture=next;MAIN.postDelayed(()->hold(next),300);diagnostic("hold armed");return false;
            }
            Gesture current=gesture;if(current==null||current.host.get()!=host||current.down!=event.getDownTime())return false;
            boolean consume=current.shown;
            if(event.getPointerCount()!=1||event.getActionMasked()==MotionEvent.ACTION_CANCEL
                    ||Math.abs(event.getRawX()-current.x)>current.slop||Math.abs(event.getRawY()-current.y)>current.slop){gesture=null;diagnostic("hold cancelled action="+event.getActionMasked());}
            if(event.getActionMasked()==MotionEvent.ACTION_UP){gesture=null;diagnostic("up shown="+current.shown);}
            return consume;
        }catch(Throwable error){gesture=null;Afterglow.error("AvatarPhoto.touch",error);return false;}
    }
    private static Hit hit(View host,MotionEvent event) {
        if(host==null||event.getPointerCount()!=1)return null;
        Hit found=null;Rect bounds=new Rect();int[] location=new int[2];
        synchronized(bindings){for(Map.Entry<View,Binding> entry:bindings.entrySet()) {
            View view=entry.getKey();Binding binding=entry.getValue();
            if(!valid(view,binding)||!descendant(view,host)||!view.getLocalVisibleRect(bounds))continue;
            view.getLocationOnScreen(location);bounds.offset(location[0],location[1]);
            if(!bounds.contains((int)event.getRawX(),(int)event.getRawY()))continue;
            if(found!=null)return null;found=new Hit(view,binding);
        }}
        return found;
    }
    private static boolean descendant(View view,View parent) {
        for(int depth=0;view!=null&&depth<64;depth++){if(view==parent)return true;ViewParent next=view.getParent();view=next instanceof View?(View)next:null;}return false;
    }
    private static boolean valid(View view,Binding binding) {
        if(view==null||!binding.loaded||binding.callback.get()==null||!(view instanceof ImageView)||((ImageView)view).getDrawable()==null
                ||!view.isAttachedToWindow()||!view.isShown()||!view.isEnabled())return false;
        if(binding.root!=null){Object root=binding.root.get();if(!(root instanceof View)||!descendant(view,(View)root))return false;}
        Activity activity=Afterglow.mainActivity();
        return activity!=null&&!activity.isFinishing()&&!activity.isDestroyed()
            &&activity.getWindow()!=null&&view.getRootView()==activity.getWindow().getDecorView().getRootView();
    }
    /** Bounded opt-in counters identify the first native boundary without logging image data. */
    private static void diagnostic(String message) {
        try {if(DebugLog.shouldWrite("long-press")&&diagnosticLines.getAndIncrement()<64)DebugLog.write("long-press","Avatar "+message);}
        catch(Throwable ignored){}
    }
    private static void traceBinding(String stage) {
        try {
            if(!DebugLog.shouldWrite("long-press"))return;
            synchronized(bindings){
                int count=stage.equals("bind")?bindCalls:readyCalls;
                if(count<=0||count>256||(count&(count-1))!=0)return;
                diagnostic(stage+" calls="+bindCalls+" views="+viewBindings+" avatar="+avatarBindings+" source="+sourceBindings
                    +" roots="+rootBindings+" accepted="+acceptedBindings+" ready="+readyCalls+" matched="+readyMatches+" bound="+bindings.size());
            }
        }catch(Throwable ignored){}
    }
    private static void traceTouch(View host,MotionEvent event,boolean enabled) {
        try {
            if(!DebugLog.shouldWrite("long-press")||diagnosticDown==event.getDownTime())return;
            diagnosticDown=event.getDownTime();
            int loaded=0,callback=0,drawable=0,rooted=0,attached=0,currentTree=0,underHost=0,point=0,valid=0;
            Rect bounds=new Rect();int[] location=new int[2];Activity activity=Afterglow.mainActivity();
            synchronized(bindings){for(Map.Entry<View,Binding> entry:bindings.entrySet()) {
                View view=entry.getKey();Binding binding=entry.getValue();if(view==null)continue;
                if(binding.loaded)loaded++;if(binding.callback.get()!=null)callback++;
                if(view instanceof ImageView&&((ImageView)view).getDrawable()!=null)drawable++;
                Object root=binding.root==null?null:binding.root.get();if(root instanceof View&&descendant(view,(View)root))rooted++;
                if(view.isAttachedToWindow()&&view.isShown()&&view.isEnabled())attached++;
                if(activity!=null&&activity.getWindow()!=null&&view.getRootView()==activity.getWindow().getDecorView().getRootView())currentTree++;
                if(!descendant(view,host))continue;underHost++;
                if(!view.getLocalVisibleRect(bounds))continue;view.getLocationOnScreen(location);bounds.offset(location[0],location[1]);
                if(!bounds.contains((int)event.getRawX(),(int)event.getRawY()))continue;point++;
                if(valid(view,binding))valid++;
            }
                diagnostic("down enabled="+enabled+" bind="+bindCalls+" avatar="+avatarBindings+" accepted="+acceptedBindings+" bound="+bindings.size()
                    +" ready="+readyCalls+" matched="+readyMatches+" loaded="+loaded+" callback="+callback+" drawable="+drawable
                    +" rooted="+rooted+" attached="+attached+" tree="+currentTree+" host="+underHost+" point="+point+" hit="+valid);
            }
        }catch(Throwable ignored){}
    }
    private static void hold(Gesture current) {
        if(gesture!=current)return;View host=current.host.get(),view=current.view.get();
        try {
            synchronized(bindings){if(!enabled()||bindings.get(view)!=current.binding||!valid(view,current.binding)||host==null||!host.hasWindowFocus()){gesture=null;diagnostic("hold revalidation failed");return;}}
            Activity activity=Afterglow.mainActivity();
            String[] choices=Build.VERSION.SDK_INT>=29?new String[]{"Save profile photo","Copy profile photo"}:new String[]{"Copy profile photo"};
            AlertDialog dialog=new AlertDialog.Builder(activity).setTitle("Profile photo").setItems(choices,(d,index)->{
                synchronized(bindings){if(!enabled()||bindings.get(view)!=current.binding||!valid(view,current.binding))return;}
                fetch(activity,current.binding.url,Build.VERSION.SDK_INT>=29&&index==0);
            }).setNegativeButton("Cancel",null).create();
            dialog.show();current.shown=true;
            MotionEvent cancel=MotionEvent.obtain(current.down,SystemClock.uptimeMillis(),MotionEvent.ACTION_CANCEL,0,0,0);
            try{cancellingNative=true;host.dispatchTouchEvent(cancel);}finally{cancellingNative=false;cancel.recycle();}
            DebugLog.write("long-press","Profile photo actions opened");
        }catch(Throwable error){gesture=null;Afterglow.error("AvatarPhoto.open",error);}
    }
    private static void fetch(Activity activity,String url,boolean save) {
        if(!fetching.compareAndSet(false,true)){Toast.makeText(activity,"A profile photo is already loading.",Toast.LENGTH_SHORT).show();return;}
        WeakReference<Activity> owner=new WeakReference<>(activity);
        WORKER.execute(()->{
            try {
                byte[] data=AvatarPhotoSource.read(MorpheFallbackAlbumCovers.overrideImageURL(url));BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;
                BitmapFactory.decodeByteArray(data,0,data.length,options);
                if(options.outWidth<=0||options.outHeight<=0||(long)options.outWidth*options.outHeight>64L*1024*1024)throw new IllegalStateException("Invalid image dimensions");
                options.inJustDecodeBounds=false;options.inSampleSize=1;
                while(Math.max(options.outWidth,options.outHeight)/options.inSampleSize>2048)options.inSampleSize*=2;
                Bitmap image=BitmapFactory.decodeByteArray(data,0,data.length,options);if(image==null)throw new IllegalStateException("Image could not be decoded");
                MAIN.post(()->{Activity live=owner.get();if(live!=null&&!live.isFinishing()&&!live.isDestroyed()){if(save)LongPressImageProvider.save(live,image);else LongPressImageProvider.copy(live,image);}else image.recycle();});
            }catch(Throwable error){DebugLog.write("long-press","Profile photo request failed: "+error.getClass().getSimpleName());MAIN.post(()->{Activity live=owner.get();if(live!=null&&!live.isFinishing()&&!live.isDestroyed())Toast.makeText(live,"Could not load this profile photo.",Toast.LENGTH_SHORT).show();});}
            finally{fetching.set(false);}
        });
    }
}
