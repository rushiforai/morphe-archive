// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** Optional paint-only outer corners for this application's main-display windows. */
final class AppCorners {
    static final String KEY="rounded_app_corners";
    private static final String TAG="MapsUiCorners";
    private static final Handler main=new Handler(Looper.getMainLooper());
    // Values must also be weak: a Drawable callback can lead back to its host's Activity.
    private static final WeakHashMap<Activity,WeakReference<Binding>> tracked=new WeakHashMap<>();

    static boolean enabled(SharedPreferences prefs){
        try{return prefs!=null&&prefs.getBoolean(KEY,false);}
        catch(RuntimeException invalid){return false;}
    }
    private static boolean ownActivity(Activity activity){
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||!BuildInfo.PACKAGE.equals(activity.getPackageName()))return false;
        String name=activity.getClass().getName();
        return !name.equals("com.google.android.apps.gmm.car.embedded.auxiliarymap.EmbeddedClusterActivity")
            &&!name.equals("com.google.android.apps.gmm.car.embedded.turncard.TurnCardClusterActivity")
            &&!name.endsWith(".ProjectedClusterActivity")&&!name.endsWith(".HudActivity");
    }
    private static boolean mainWindow(Activity activity){
        if(!ownActivity(activity)||activity.isInPictureInPictureMode())return false;
        try{
            Display display=PlatformCompat.getDisplay(activity);Window window=activity.getWindow();
            if(display==null||display.getDisplayId()!=Display.DEFAULT_DISPLAY||window==null)return false;
            WindowManager.LayoutParams params=window.getAttributes();
            if(params.type!=WindowManager.LayoutParams.TYPE_BASE_APPLICATION&&params.type!=WindowManager.LayoutParams.TYPE_APPLICATION)return false;
            if(params.width!=WindowManager.LayoutParams.MATCH_PARENT||params.height!=WindowManager.LayoutParams.MATCH_PARENT)return false;
            TypedArray style=activity.obtainStyledAttributes(new int[]{android.R.attr.windowIsFloating,android.R.attr.windowNoDisplay});
            try{return !style.getBoolean(0,false)&&!style.getBoolean(1,false);}
            finally{style.recycle();}
        }catch(RuntimeException unavailable){return false;}
    }
    /** Lifecycle callbacks and preference listeners invoke these on Android's main thread. */
    static void resumed(Activity activity){
        ensure(activity);postEnsure(activity);
    }
    static void refresh(){
        for(Activity activity:new ArrayList<Activity>(tracked.keySet()))ensure(activity);
    }
    static void destroyed(Activity activity){
        WeakReference<Binding> reference=tracked.remove(activity);Binding binding=reference==null?null:reference.get();
        if(binding!=null)binding.release();
    }
    private static void postEnsure(Activity activity){
        if(!ownActivity(activity)||activity.getWindow()==null)return;
        final WeakReference<Activity> target=new WeakReference<>(activity);
        main.post(()->{Activity current=target.get();if(current!=null)ensure(current);});
    }
    private static void ensure(Activity activity){
        if(!ownActivity(activity)){destroyed(activity);return;}
        WeakReference<Binding> reference=tracked.get(activity);Binding previous=reference==null?null:reference.get();
        View content=activity.findViewById(android.R.id.content);
        if(previous!=null&&!previous.released&&previous.root.get()==content){previous.update();return;}
        if(previous!=null)previous.release();
        if(content==null||!mainWindow(activity)){tracked.remove(activity);return;}
        Binding binding=new Binding(activity,content);tracked.put(activity,new WeakReference<>(binding));binding.update();
    }
    private static final class Binding implements View.OnLayoutChangeListener,View.OnAttachStateChangeListener {
        final WeakReference<Activity> owner;final WeakReference<View> root;final CornerMask mask=new CornerMask();
        boolean added,released;int lastWidth=-1,lastHeight=-1,lastX,lastY;float lastRadius=-1;
        Binding(Activity activity,View content){
            owner=new WeakReference<>(activity);root=new WeakReference<>(content);
            mask.resize(content.getWidth(),content.getHeight(),0);
            content.addOnLayoutChangeListener(this);content.addOnAttachStateChangeListener(this);
        }
        void update(){
            if(released)return;
            Activity activity=owner.get();View content=root.get();
            if(!ownActivity(activity)||content==null){release();return;}
            if(activity.findViewById(android.R.id.content)!=content){release();postEnsure(activity);return;}
            if(!content.isAttachedToWindow()||!mainWindow(activity)){removeMask();return;}
            final boolean on;
            try{on=enabled(activity.getSharedPreferences("local_cluster_settings",Context.MODE_PRIVATE));}
            catch(RuntimeException unavailable){removeMask();return;}
            float density=content.getContext().getResources().getDisplayMetrics().density;
            if(Float.isNaN(density)||Float.isInfinite(density)||density<=0){removeMask();return;}
            int width=content.getWidth(),height=content.getHeight();int[] origin=new int[2];content.getLocationOnScreen(origin);
            float radius=Math.min(28f*density,Math.max(0,Math.min(width,height)/2f));
            boolean changed=width!=lastWidth||height!=lastHeight||origin[0]!=lastX||origin[1]!=lastY||radius!=lastRadius;
            lastWidth=width;lastHeight=height;lastX=origin[0];lastY=origin[1];lastRadius=radius;
            if(changed)mask.resize(width,height,radius);
            if(on&&!added){content.getOverlay().add(mask);added=true;log("on");}
            else if(!on&&added)removeMask();
            else if(changed)log(added?"resize":"attach_off");
        }
        void log(String event){Log.i(TAG,event+" x="+lastX+" y="+lastY+" width="+lastWidth+" height="+lastHeight+" radius_px="+lastRadius+" display=0");}
        void removeMask(){
            View content=root.get();if(added){if(content!=null)content.getOverlay().remove(mask);added=false;log("off");}
        }
        void release(){
            if(released)return;released=true;removeMask();View content=root.get();
            if(content!=null){content.removeOnLayoutChangeListener(this);content.removeOnAttachStateChangeListener(this);}
        }
        public void onLayoutChange(View view,int l,int t,int r,int b,int ol,int ot,int or,int ob){update();}
        public void onViewAttachedToWindow(View view){update();}
        public void onViewDetachedFromWindow(View view){removeMask();Activity activity=owner.get();if(activity!=null)postEnsure(activity);}
    }
    /** A drawable in ViewOverlay cannot consume touch or change content measurements. */
    private static final class CornerMask extends Drawable {
        private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);private final Path path=new Path();private float radius;
        CornerMask(){paint.setColor(0xff000000);}
        void resize(int width,int height,float value){radius=value;setBounds(0,0,width,height);rebuild(getBounds());invalidateSelf();}
        private void rebuild(Rect bounds){
            path.reset();path.setFillType(Path.FillType.EVEN_ODD);
            path.addRect(bounds.left,bounds.top,bounds.right,bounds.bottom,Path.Direction.CW);
            path.addRoundRect(bounds.left,bounds.top,bounds.right,bounds.bottom,radius,radius,Path.Direction.CW);
        }
        protected void onBoundsChange(Rect bounds){rebuild(bounds);}
        public void draw(Canvas canvas){canvas.drawPath(path,paint);}
        public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    private AppCorners(){}
}
