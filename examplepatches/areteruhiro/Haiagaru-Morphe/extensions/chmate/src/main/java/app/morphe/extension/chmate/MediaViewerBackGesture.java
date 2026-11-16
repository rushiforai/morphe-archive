package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.view.MotionEvent;
import java.lang.reflect.*;

/** Let ChMate decode its own saved Back gesture before gallery navigation claims it. */
final class MediaViewerBackGesture {
    static final String DOUBLE_BACK="mediaViewerDoubleBack";
    private static final java.util.Map<Activity,Long> ARMED=new java.util.WeakHashMap<>();
    private final Activity activity;
    private Object recognizer;
    private Method touch;
    private boolean returned;
    MediaViewerBackGesture(Activity activity){this(activity,activity::finish);}
    MediaViewerBackGesture(Activity activity,Runnable onBack){
        this(activity,onBack,false);
    }
    MediaViewerBackGesture(Activity activity,Runnable onBack,boolean dedicated){
        this.activity=activity;
        SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(activity);
        int back=prefs.getInt("gestureBack",0);
        if(back==0||!prefs.getBoolean("gesture",true))return;
        try{
            Class<?> type=Class.forName(VideoViewerGestures.recognizerClassName(),false,activity.getClassLoader());
            for(Constructor<?> constructor:type.getConstructors()){
                Class<?>[] p=constructor.getParameterTypes();
                if(p.length!=2||p[0]!=android.content.Context.class||!p[1].isInterface())continue;
                Object listener=Proxy.newProxyInstance(type.getClassLoader(),new Class<?>[]{p[1]},(proxy,method,args)->{
                    if(method.getDeclaringClass()==Object.class){
                        if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                        if(method.getName().equals("equals"))return proxy==args[0];return "HaiagaruMediaBack";
                    }
                    if(args!=null&&args.length==3&&args[0] instanceof Integer&&(Integer)args[0]==back){
                        returned=true;
                        if(activity instanceof VideoViewerActivity)((VideoViewerActivity)activity).endHoldSpeed();
                        if (dedicated) finishDedicated(activity,onBack);
                        else onBack.run();
                    }return null;
                });
                recognizer=constructor.newInstance(activity,listener);break;
            }
            if(recognizer==null)return;
            for(Method m:type.getDeclaredMethods()){
                if(!Modifier.isPublic(m.getModifiers()))continue;
                if(m.getReturnType()==boolean.class&&java.util.Arrays.equals(m.getParameterTypes(),new Class<?>[]{MotionEvent.class}))touch=m;
                if(m.getReturnType()==void.class&&java.util.Arrays.equals(m.getParameterTypes(),new Class<?>[]{int.class}))m.invoke(recognizer,prefs.getInt("gestureLength",100));
            }
        }catch(ReflectiveOperationException|RuntimeException error){recognizer=null;touch=null;}
    }
    static void finishDedicated(Activity activity,Runnable close){
        if(!VideoViewerSettings.prefs(activity).getBoolean(DOUBLE_BACK,false)){
            ARMED.remove(activity);close.run();return;
        }
        long now=android.os.SystemClock.uptimeMillis();
        Long previous=ARMED.get(activity);
        // The video surface and the gallery recognizer may report the same gesture.
        if(previous!=null&&now-previous<120)return;
        if(previous!=null&&now-previous<=1000){ARMED.remove(activity);close.run();return;}
        ARMED.put(activity,now);
        android.widget.Toast.makeText(activity,"もう一度戻るジェスチャーで閉じる",0).show();
    }
    boolean returned(){return returned;}
    boolean active(){return recognizer!=null&&touch!=null;}
    boolean dispatch(MotionEvent event){
        if(active())try{touch.invoke(recognizer,event);}catch(ReflectiveOperationException|RuntimeException error){recognizer=null;touch=null;}
        return returned;
    }
}
