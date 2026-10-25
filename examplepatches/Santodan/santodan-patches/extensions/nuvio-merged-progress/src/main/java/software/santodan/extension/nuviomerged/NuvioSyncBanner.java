package software.santodan.extension.nuviomerged;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.*;
import java.util.Objects;

/** Feeds sync state through the actual native updater host/banner, inside its Compose theme. */
public final class NuvioSyncBanner {
    private static final String MARKER = "santodan-sync-progress";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ThreadLocal<String> LABEL = new ThreadLocal<>();
    private static volatile Status status;
    private static Object revision;
    private static int generation;
    private static String lastState;
    private static long terminalUntil;
    private static boolean visible;
    private static ClassLoader loader;
    private static Method nativeHost, nativeString, nativeFormat, nativeGroupText;
    private static Constructor<?> updateConstructor, stateConstructor;
    private static Object noOp;
    private static boolean initialized;
    private static final class Status {
        final String message; final int step, total; final boolean error;
        final boolean running; final Runnable cancel;
        Status(String text, int at, int count, boolean failed, boolean active, Runnable stop) {
            message=text; total=Math.max(1,count); step=Math.max(0,Math.min(at,total)); error=failed;
            running=active; cancel=stop;
        }
    }
    private NuvioSyncBanner() {}

    public static void update(Activity activity, String message, int step, int total, boolean running, boolean error) {
        update(activity,message,step,total,running,error,()->{});
    }
    public static void update(Activity activity, String message, int step, int total, boolean running, boolean error, Runnable cancel) {
        MAIN.post(() -> {
            String key=message+"|"+step+"|"+total+"|"+running+"|"+error;
            if (!Objects.equals(key,lastState)) {
                lastState=key;
                terminalUntil=running?Long.MAX_VALUE:SystemClock.uptimeMillis()+(error?15000:6000);
            }
            visible=running || SystemClock.uptimeMillis()<terminalUntil;
            status=new Status(message,step,total,error,running,cancel);
            invalidate();
            int ticket=++generation;
            if (!running) MAIN.postDelayed(()->{if(ticket==generation){visible=false;invalidate();}},
                Math.max(0,terminalUntil-SystemClock.uptimeMillis()));
        });
    }
    public static void hide() { MAIN.post(()->{generation++;visible=false;invalidate();}); }
    private static void invalidate() {
        if(revision==null)return;
        try {
            Number value=(Number)revision.getClass().getMethod("getValue").invoke(revision);
            revision.getClass().getMethod("setValue",Object.class).invoke(revision,value.intValue()+1);
        } catch(Exception error){Log.e("SantodanMergedProgress","Sync banner revision failed",error);}
    }
    private static Object field(Object object,String name)throws Exception{
        Field field=object.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(object);
    }
    private static void initialize(Object state)throws Exception{
        if(initialized)return;
        loader=state.getClass().getClassLoader();
        Class<?> callback=loader.loadClass("kotlin.jvm.functions.Function0");
        nativeHost=loader.loadClass("fb.uj").getDeclaredMethod("i",loader.loadClass("kb.k0"),callback,callback,
            callback,callback,callback,callback,loader.loadClass("r1.s"),loader.loadClass("h1.n"),int.class);
        nativeString=loader.loadClass("u6.g").getDeclaredMethod("d0",int.class,loader.loadClass("h1.n"));
        nativeFormat=loader.loadClass("u6.g").getDeclaredMethod("e0",int.class,Object[].class,loader.loadClass("h1.n"));
        nativeGroupText=loader.loadClass("ma.r").getDeclaredMethod("h",loader.loadClass("h1.k0"),int.class,int.class,loader.loadClass("h1.k0"),boolean.class);
        updateConstructor=loader.loadClass("lb.a").getDeclaredConstructor(String.class,String.class,String.class,
            String.class,String.class,String.class,Long.class);
        stateConstructor=loader.loadClass("kb.k0").getDeclaredConstructor(boolean.class,loader.loadClass("lb.a"),
            boolean.class,boolean.class,Float.class,String.class,boolean.class,boolean.class,String.class,String.class,
            boolean.class,loader.loadClass("kb.l"),boolean.class,boolean.class,boolean.class,loader.loadClass("lb.a"));
        noOp=Proxy.newProxyInstance(loader,new Class<?>[]{loader.loadClass("kotlin.jvm.functions.Function0")},
            (proxy,method,args)->{
                if(method.getName().equals("invoke"))return loader.loadClass("kotlin.Unit").getField("INSTANCE").get(null);
                if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                if(method.getName().equals("equals"))return proxy==args[0];
                return "SantodanSyncAction";
            });
        revision=loader.loadClass("h1.h").getDeclaredMethod("t",Object.class).invoke(null,0);
        initialized=true;
    }

    /** Original root updater call, with untouched content and native update precedence. */
    public static void host(Object original,Object dismiss,Object download,Object install,Object dismissUnknown,
            Object openUnknown,Object feedback,Object content,Object composer,int flags) {
        try {
            initialize(original);
            revision.getClass().getMethod("getValue").invoke(revision);
            Status current=status;
            boolean realUpdate=(Boolean.TRUE.equals(field(original,"g")) &&
                (field(original,"b")!=null || field(original,"p")!=null)) || Boolean.TRUE.equals(field(original,"h"))
                || field(original,"j")!=null;
            if(visible && current!=null && !realUpdate){
                Object update=updateConstructor.newInstance("Sync Progress  "+current.step+"/"+current.total,
                    current.message,"",MARKER,"","",null);
                Object state=stateConstructor.newInstance(false,update,false,true,(float)current.step/current.total,
                    null,true,false,current.error?current.message:null,null,false,field(original,"l"),false,false,false,null);
                Object stop=Proxy.newProxyInstance(loader,new Class<?>[]{loader.loadClass("kotlin.jvm.functions.Function0")},
                    (proxy,method,args)->{
                        if(method.getName().equals("invoke")){
                            if(status==current && current.running)current.cancel.run();
                            else if(status==current)hide();
                            return loader.loadClass("kotlin.Unit").getField("INSTANCE").get(null);
                        }
                        if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                        if(method.getName().equals("equals"))return proxy==args[0];
                        return "SantodanCancelSync";
                    });
                nativeHost.invoke(null,state,stop,noOp,noOp,noOp,noOp,noOp,content,composer,0);
            } else nativeHost.invoke(null,original,dismiss,download,install,dismissUnknown,openUnknown,feedback,content,composer,flags);
        } catch(Exception error){
            Log.e("SantodanMergedProgress","Native sync banner failed",error);
            throw new IllegalStateException("Native updater banner contract failed",error);
        }
    }
    /** Called on every native banner invocation, including its own recompositions. */
    public static void begin(Object state){
        LABEL.remove();
        try{
            Object update=field(state,"b");
            if(update!=null&&MARKER.equals(field(update,"d")))LABEL.set((String)field(update,"b"));
        }catch(Exception error){throw new IllegalStateException(error);}
    }
    public static void end(){LABEL.remove();}
    public static boolean installed(boolean original){return LABEL.get()!=null || original;}
    /** Only the close-button guard is changed; the native progress drawing keeps downloading=true. */
    public static boolean hideClose(boolean original){return LABEL.get()==null && original;}
    public static boolean timedClose(boolean original){return LABEL.get()==null && original;}
    public static String closeText(int id,Object composer)throws Exception{
        if(LABEL.get()!=null)return status!=null && status.running?"Cancel sync":"Close";
        return (String)nativeString.invoke(null,id,composer);
    }
    public static String text(int id,Object composer)throws Exception{
        if(LABEL.get()!=null && (id==0x7f110d11 || id==0x7f110d10 || id==0x7f110d18 || id==0x7f110d1c))return LABEL.get();
        return (String)nativeString.invoke(null,id,composer);
    }
    public static String formatted(int id,Object[] arguments,Object composer)throws Exception{
        if(LABEL.get()!=null && id==0x7f110d12)return LABEL.get();
        return (String)nativeFormat.invoke(null,id,arguments,composer);
    }
    public static String groupText(Object first,int key,int id,Object second,boolean end)throws Exception{
        String original=(String)nativeGroupText.invoke(null,first,key,id,second,end);
        return LABEL.get()!=null?LABEL.get():original;
    }
}
