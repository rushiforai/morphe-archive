package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.Button;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/** Configurable gestures for native multi-image viewers. Page changes use the current native screen. */
public final class NativeImagePaging {
    static final String ENABLED="imagePagingGestures", NEXT="imagePagingNext", PREVIOUS="imagePagingPrevious";
    static final int UP=1, DOWN=2, LEFT=3, RIGHT=4;
    private static final String[] DIRECTIONS={"割り当てなし","↑ 上","↓ 下","← 左","→ 右"};
    private static final WeakHashMap<View, WeakReference<Object>> CONTAINERS=new WeakHashMap<>();
    private static final WeakHashMap<Object, Swipe> SWIPES=new WeakHashMap<>();

    private static final class Swipe {
        float x,y,threshold,claim;
        int next,previous;
        boolean claimed,cancelling,multiTouch;
        MediaViewerBackGesture back;
    }
    private NativeImagePaging(){}

    static boolean enabled(Context context){return VideoViewerSettings.prefs(context).getBoolean(ENABLED,true);}
    static int direction(SharedPreferences prefs,String key){
        int fallback=NEXT.equals(key)?UP:DOWN;
        int value=prefs.getInt(key,fallback);
        return value>=0&&value<=RIGHT?value:fallback;
    }
    static int axis(float dx,float dy,float threshold){
        float x=Math.abs(dx),y=Math.abs(dy);
        if(x>=threshold&&x>y*1.5f)return dx<0?LEFT:RIGHT;
        if(y>=threshold&&y>x*1.5f)return dy<0?UP:DOWN;
        return 0;
    }
    static int step(int direction,int next,int previous){
        return direction==0?0:direction==next?1:direction==previous?-1:0;
    }
    static boolean mixed(Activity activity){
        if(!Haiagaru.videoViewerEnabled()||!VideoViewerSettings.prefs(activity).getBoolean("videoViewerEnabled",true))return false;
        Intent intent=activity.getIntent();
        boolean thread=intent.getBooleanExtra(MediaViewerNavigation.THREAD_EXTRA,false);
        if(!VideoViewerSettings.prefs(activity).getBoolean(thread?VideoViewerSettings.THREAD_MEDIA:VideoViewerSettings.MEDIA_SWIPE,!thread))return false;
        ArrayList<String> gallery=intent.getStringArrayListExtra(MediaViewerNavigation.EXTRA);
        if(gallery==null)gallery=intent.getStringArrayListExtra("links");
        return MediaGallery.needsExternalPaging(gallery,VideoViewerSettings.nativeGif(activity),VideoViewerSettings.nativeVideo(activity));
    }

    static void addSettingsButton(LinearLayout group,Activity activity){
        try{
            String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
            if(!"0.8.10.191 dev".equals(version)&&!"0.8.10.226 dev".equals(version)&&!"0.8.10.242 dev".equals(version))return;
        }catch(android.content.pm.PackageManager.NameNotFoundException unavailable){return;}
        Button button=new Button(activity);button.setText("画像の切り替えジェスチャー");
        button.setOnClickListener(v->showSettings(activity));group.addView(button);
    }
    private static void showSettings(Activity activity){
        SharedPreferences prefs=VideoViewerSettings.prefs(activity);
        String[] names={"次の画像："+DIRECTIONS[direction(prefs,NEXT)],"前の画像："+DIRECTIONS[direction(prefs,PREVIOUS)],
                enabled(activity)?"ChMate標準の操作に戻す":"方向指定を使う","初期設定（↑ 次へ／↓ 前へ）に戻す"};
        new HaiagaruDialog.Builder(activity).setTitle("画像の切り替えジェスチャー")
                .setItems(names,(dialog,which)->{
                    if(which<2)choose(activity,which==0?NEXT:PREVIOUS);
                    else if(which==2){prefs.edit().putBoolean(ENABLED,!enabled(activity)).apply();showSettings(activity);}
                    else{prefs.edit().remove(NEXT).remove(PREVIOUS).remove(ENABLED).apply();showSettings(activity);}
                }).setNegativeButton("閉じる",null).show();
    }
    private static void choose(Activity activity,String key){
        SharedPreferences prefs=VideoViewerSettings.prefs(activity);
        String other=NEXT.equals(key)?PREVIOUS:NEXT;
        int old=direction(prefs,key),assigned=direction(prefs,other);
        String[] labels=DIRECTIONS.clone();
        if(assigned!=0)labels[assigned]+="（現在の割り当てと入れ替え）";
        new HaiagaruDialog.Builder(activity).setTitle(NEXT.equals(key)?"次の画像へ":"前の画像へ")
                .setSingleChoiceItems(labels,old,(dialog,which)->{
                    SharedPreferences.Editor edit=prefs.edit().putBoolean(ENABLED,true).putInt(key,which);
                    if(which!=0&&which==assigned)edit.putInt(other,old==which?0:old);
                    edit.apply();dialog.dismiss();showSettings(activity);
                }).setNegativeButton("戻る",(dialog,which)->showSettings(activity)).show();
    }

    /** 242 uses this root in both forms; intercept before its native drag-to-close handler. */
    public static void registerContainer(Object fragment){
        try{
            Object binding=NativeFields.find(fragment.getClass(),"d").get(fragment);
            Object container=NativeFields.find(binding.getClass(),"i").get(binding);
            if(container instanceof View)CONTAINERS.put((View)container,new WeakReference<>(fragment));
        }catch(ReflectiveOperationException|RuntimeException ignored){}
    }
    public static boolean onContainerTouch(View container,MotionEvent event){
        WeakReference<Object> reference=CONTAINERS.get(container);
        Object fragment=reference==null?null:reference.get();
        if(fragment==null)return false;
        try{
            if(event.getActionMasked()!=MotionEvent.ACTION_DOWN&&!SWIPES.containsKey(container))return false;
            Activity activity=(Activity)fragment.getClass().getMethod("getActivity").invoke(fragment);
            if(activity==null)return false;
            if(event.getActionMasked()==MotionEvent.ACTION_DOWN){
                SWIPES.remove(container);
                if(!enabled(activity)||isNativeActivity(activity)&&mixed(activity)||pageCount(fragment)<2)return false;
            }
            return touch(container,activity,container,event,container::dispatchTouchEvent,step->{
                Object binding=NativeFields.find(fragment.getClass(),"d").get(fragment);
                Object pager=NativeFields.find(binding.getClass(),"m").get(binding);
                int next=NativeFields.find(pager.getClass(),"b").getInt(pager)+step;
                if(next>=0&&next<pageCount(fragment))invokePage(fragment,"e",next,true);
            });
        }catch(ReflectiveOperationException|RuntimeException ignored){return false;}
    }
    private static int pageCount(Object fragment)throws ReflectiveOperationException{
        Object lazy=NativeFields.find(fragment.getClass(),"s").get(fragment);
        Method get=lazy.getClass().getMethod("getValue");get.setAccessible(true);
        Object model=get.invoke(lazy);
        return ((List<?>)NativeFields.find(model.getClass(),"h").get(model)).size();
    }

    static boolean isNativeActivity(Activity activity){
        return activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.ImagesViewer2Activity");
    }
    public static boolean onActivityTouch(Activity activity,MotionEvent event){
        try{
            if(event.getActionMasked()==MotionEvent.ACTION_DOWN){
                SWIPES.remove(activity);
                ArrayList<String> links=activity.getIntent().getStringArrayListExtra("links");
                if(!enabled(activity)||mixed(activity)||links==null||links.size()<2)return false;
            }else if(!SWIPES.containsKey(activity))return false;
            View root=activity.getWindow().getDecorView();
            return touch(activity,activity,root,event,activity::dispatchTouchEvent,step->{
                boolean old;
                try{old=activity.getClass().getDeclaredField("f").getType()==int.class;}
                catch(NoSuchFieldException not191){old=false;}
                int index=NativeFields.find(activity.getClass(),old?"f":"o").getInt(activity);
                int next=index+step;
                ArrayList<String> links=activity.getIntent().getStringArrayListExtra("links");
                if(index>=0&&links!=null&&next>=0&&next<links.size())invokePage(activity,old?"d":"a",next,false);
            });
        }catch(ReflectiveOperationException|RuntimeException ignored){return false;}
    }
    private static void invokePage(Object target,String method,int next,boolean pager)throws ReflectiveOperationException{
        Method change=pager?target.getClass().getDeclaredMethod(method,int.class,boolean.class)
                :target.getClass().getDeclaredMethod(method,int.class);
        change.setAccessible(true);
        if(pager)change.invoke(target,next,false);else change.invoke(target,next);
    }
    private interface Cancel {boolean dispatch(MotionEvent event);}
    private interface Page {void move(int step)throws ReflectiveOperationException;}
    private static boolean touch(Object key,Activity activity,View surface,MotionEvent event,Cancel cancel,Page page)
            throws ReflectiveOperationException {
        int action=event.getActionMasked();
        Swipe swipe=SWIPES.get(key);
        if(swipe!=null&&swipe.cancelling)return false;
        if(action==MotionEvent.ACTION_DOWN){
            float x=event.getRawX(),y=event.getRawY();
            if(MediaViewerNavigation.zoomed(surface)||MediaViewerNavigation.controlAt(activity.getWindow().getDecorView(),x,y))return false;
            SharedPreferences prefs=VideoViewerSettings.prefs(activity);
            swipe=new Swipe();swipe.x=x;swipe.y=y;swipe.next=direction(prefs,NEXT);swipe.previous=direction(prefs,PREVIOUS);
            swipe.threshold=48*surface.getResources().getDisplayMetrics().density;
            swipe.claim=ViewConfiguration.get(activity).getScaledTouchSlop();
            // In 242 an embedded viewer must close its overlay, not the thread Activity.
            swipe.back=isNativeActivity(activity)?new MediaViewerBackGesture(activity)
                    :new MediaViewerBackGesture(activity,activity::onBackPressed);
            swipe.back.dispatch(event);
            SWIPES.put(key,swipe);return false;
        }
        if(swipe==null)return false;
        if(action==MotionEvent.ACTION_CANCEL){SWIPES.remove(key);return swipe.claimed;}
        if(event.getPointerCount()>1||action==MotionEvent.ACTION_POINTER_DOWN){swipe.multiTouch=true;return swipe.claimed;}
        if(swipe.multiTouch){if(action==MotionEvent.ACTION_UP)SWIPES.remove(key);return swipe.claimed;}
        if(swipe.back.dispatch(event)){SWIPES.remove(key);return true;}
        float dx=event.getRawX()-swipe.x,dy=event.getRawY()-swipe.y;
        // Claim before the old horizontal pager crosses its own drag threshold.
        // This also prevents an unassigned direction from silently changing pages.
        if(action==MotionEvent.ACTION_MOVE&&!swipe.claimed&&axis(dx,dy,swipe.claim)!=0){
            swipe.claimed=true;swipe.cancelling=true;
            MotionEvent stop=MotionEvent.obtain(event);stop.setAction(MotionEvent.ACTION_CANCEL);
            try{cancel.dispatch(stop);}finally{stop.recycle();swipe.cancelling=false;}
        }
        if(action!=MotionEvent.ACTION_UP)return swipe.claimed;
        SWIPES.remove(key);
        if(!swipe.claimed)return false;
        int step=step(axis(dx,dy,swipe.threshold),swipe.next,swipe.previous);
        if(step!=0){
            if(swipe.back.active()){
                MediaViewerBackGesture back=swipe.back;
                surface.post(()->{if(!back.returned()&&surface.isShown()&&!activity.isFinishing())
                    try{page.move(step);}catch(ReflectiveOperationException|RuntimeException ignoredError){}});
            }else page.move(step);
        }
        return true;
    }
}
