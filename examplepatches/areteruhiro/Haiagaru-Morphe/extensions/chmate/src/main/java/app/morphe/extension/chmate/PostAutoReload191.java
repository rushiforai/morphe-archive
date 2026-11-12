package app.morphe.extension.chmate;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

/** Re-arm an already enabled native timer after the matching composer closes. */
public final class PostAutoReload191 {
    private static WeakReference<Object> pending = new WeakReference<>(null);
    private static String target;
    public static void command(Object fragment,int command) {
        if(command!=2&&command!=0x7f0a012b)return;
        pending.clear();target=null;
        try {
            if(!active(fragment))return;
            String url=url(fragment);
            if(url==null)return;
            pending=new WeakReference<>(fragment);target=normalize(url);
        }catch(Exception error){android.util.Log.w("Haiagaru","Unable to capture reload timer",error);}
    }
    static void editor(View root,String url) {
        Object fragment=pending.get();String expected=target;
        pending.clear();target=null;
        if(fragment==null||url==null||!normalize(url).equals(expected))return;
        WeakReference<Object> owner=new WeakReference<>(fragment);
        root.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View view){}
            public void onViewDetachedFromWindow(View view){
                view.removeOnAttachStateChangeListener(this);
                Handler handler=new Handler(Looper.getMainLooper());
                handler.postDelayed(new Runnable(){int attempts;
                    public void run(){
                        Object reader=owner.get();if(reader==null)return;
                        try{
                            // Never toggle a disabled controller or override native error/max-count stops.
                            if(!active(reader)||!expected.equals(normalize(url(reader))))return;
                            boolean resumed=(Boolean)reader.getClass().getMethod("isResumed").invoke(reader);
                            if(resumed&&field(reader,"K")==null&&!((Boolean)field(reader,"s"))){
                                reader.getClass().getMethod("l").invoke(reader);return;
                            }
                            if(++attempts<60)handler.postDelayed(this,500);
                        }catch(Exception error){android.util.Log.w("Haiagaru","Unable to resume reload timer",error);}
                    }
                },500);
            }
        });
    }
    private static boolean active(Object fragment)throws Exception{return (Boolean)field(field(fragment,"r"),"a");}
    private static String url(Object fragment)throws Exception{Object info=field(fragment,"W");return info==null?null:(String)info.getClass().getMethod("o").invoke(info);}
    private static String normalize(String url){return url==null?"":url.replaceFirst("/+$","");}
    private static Object field(Object object,String name)throws Exception{
        for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{
            Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(object);
        }catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(name);
    }
    private PostAutoReload191(){}
}
