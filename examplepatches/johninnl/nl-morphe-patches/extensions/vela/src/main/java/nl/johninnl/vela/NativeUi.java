package nl.johninnl.vela;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

/** Uses the original Vela composables and Snapshot state. No Compose/runtime classes are bundled. */
public final class NativeUi {
    private NativeUi() {}
    // The patch retargets these declarations to the exact host state type. Java uses reflection only.
    public static Object effectiveFlock, effectiveFlockRoute, effectiveFlockDetour, effectiveCarSpeed, effectiveFlockCard, effectiveFlockVoice;
    private static Object pulse;
    private static long counter;
    private static final Map<String,Object> ACTIONS=new HashMap<>();
    private static Object compactFactory,compactUpdate;
    private static boolean compactDark=true;
    private static Class<?> type(String name)throws ClassNotFoundException{return Class.forName(name);}
    private static Object call(String owner,String name,Class<?>[] parameters,Object...args)throws ReflectiveOperationException {
        Method method=type(owner).getMethod(name,parameters);method.setAccessible(true);return method.invoke(null,args);
    }
    private static Object newState(Object value)throws ReflectiveOperationException {
        return call("fe2","O",new Class[]{Object.class,type("u34")},value,type("ba4").getField("g").get(null));
    }
    private static void setField(String name,Object value)throws ReflectiveOperationException {NativeUi.class.getField(name).set(null,value);}
    private static void setState(String name,boolean value)throws ReflectiveOperationException {
        Object state=NativeUi.class.getField(name).get(null);
        state.getClass().getMethod("setValue",Object.class).invoke(state,Boolean.valueOf(value));
    }
    public static void init(Application app) {
        try {
            if(pulse!=null)return;
            pulse=newState(0L);
            for(String field:new String[]{"effectiveFlock","effectiveFlockRoute","effectiveFlockDetour","effectiveCarSpeed","effectiveFlockCard","effectiveFlockVoice"})setField(field,newState(false));
            TelemetryRuntime.init(app,NativeUi::changed);
            changed();
        }catch(ReflectiveOperationException e){throw new IllegalStateException("Unsupported Vela native state binding",e);}
    }
    public static void changed() {
        if(pulse==null||TelemetryRuntime.app()==null)return;
        try {
            android.content.SharedPreferences prefs=TelemetryRuntime.app().getSharedPreferences("vela_settings",0);
            boolean paused=TelemetryRuntime.suppressNativeFlock();
            setState("effectiveFlock",!paused&&prefs.getBoolean("flock_cameras_on",true));
            setState("effectiveFlockRoute",!paused&&prefs.getBoolean("flock_route_alert_on",false));
            setState("effectiveFlockDetour",!paused&&prefs.getBoolean("flock_detour",false));
            setState("effectiveFlockCard",!paused&&prefs.getBoolean("flock_nav_alert_card",false));
            setState("effectiveFlockVoice",!paused&&prefs.getBoolean("flock_nav_alert_voice",false));
            setState("effectiveCarSpeed",prefs.getBoolean("car_speed_on",false)||(!TelemetryRuntime.selected().isEmpty()&&TelemetryRuntime.carEnabled()));
            pulse.getClass().getMethod("setValue",Object.class).invoke(pulse,++counter);
        }catch(ReflectiveOperationException e){throw new IllegalStateException("Vela native state publication failed",e);}
    }
    public static boolean flockAlertsAny() {
        try {
            Object card=NativeUi.class.getField("effectiveFlockCard").get(null),voice=NativeUi.class.getField("effectiveFlockVoice").get(null);
            return card!=null&&Boolean.TRUE.equals(card.getClass().getMethod("getValue").invoke(card))||voice!=null&&Boolean.TRUE.equals(voice.getClass().getMethod("getValue").invoke(voice));
        }catch(ReflectiveOperationException e){throw new IllegalStateException("Vela Flock state binding failed",e);}
    }
    public static void observe() {
        if(pulse==null)return;
        try{pulse.getClass().getMethod("getValue").invoke(pulse);}catch(ReflectiveOperationException e){throw new IllegalStateException(e);}
    }
    public static String currentLabel(String fallback) { observe();return TelemetryRuntime.phoneCurrentUnknown()?"—":fallback; }
    private static String text(String key,String fallback) {
        Context c=TelemetryRuntime.app();if(c==null)return fallback;
        int id=c.getResources().getIdentifier("morphe_nav_"+key,"string",c.getPackageName());
        return id==0?fallback:c.getString(id);
    }
    private static Object unit()throws ReflectiveOperationException{return type("er4").getField("a").get(null);}
    private static Object objectMethod(Object proxy,Method method,Object[] args) {
        if(method.getName().equals("equals"))return proxy==args[0];
        if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
        if(method.getName().equals("toString"))return "Vela external telemetry action";
        return null;
    }
    private static Object action(String key,Runnable run)throws ReflectiveOperationException {
        Object value=ACTIONS.get(key);if(value!=null)return value;
        Class<?> fn=type("r11");
        value=Proxy.newProxyInstance(fn.getClassLoader(),new Class[]{fn},(proxy,method,args)->{
            if(method.getName().equals("invoke")){run.run();return unit();}return objectMethod(proxy,method,args);
        });ACTIONS.put(key,value);return value;
    }
    private static Object toggleAction(String key,java.util.function.Consumer<Boolean> run)throws ReflectiveOperationException {
        Object value=ACTIONS.get(key);if(value!=null)return value;
        Class<?> fn=type("kotlin.jvm.functions.Function1");
        value=Proxy.newProxyInstance(fn.getClassLoader(),new Class[]{fn},(proxy,method,args)->{
            if(method.getName().equals("invoke")){run.accept(Boolean.TRUE.equals(args[0]));return unit();}return objectMethod(proxy,method,args);
        });ACTIONS.put(key,value);return value;
    }
    private static void title(String value,Object composer)throws ReflectiveOperationException {
        call("ez3","e",new Class[]{String.class,type("e50"),int.class},value,composer,0);
    }
    private static void hint(String value,Object composer)throws ReflectiveOperationException {
        call("ez3","c",new Class[]{String.class,type("e50"),int.class},value,composer,0);
    }
    private static void row(String value,boolean selected,Object action,Object composer)throws ReflectiveOperationException {
        call("ez3","f",new Class[]{String.class,boolean.class,type("r11"),type("lg2"),type("e50"),int.class,int.class},value,selected,action,null,composer,0,8);
    }
    private static void toggle(String value,boolean selected,Object action,String detail,Object composer)throws ReflectiveOperationException {
        call("ez3","i",new Class[]{String.class,boolean.class,type("kotlin.jvm.functions.Function1"),String.class,type("lg2"),type("u11"),type("e50"),int.class,int.class},value,selected,action,detail,null,null,composer,0,48);
    }
    /** Inside Vela's existing navigation-settings group. */
    public static void settings(Object composer) {
        observe();
        try {
            title(text("title","Speed and road alerts"),composer);
            row(text("native","Vela (native data)"),TelemetryRuntime.selected().isEmpty(),action("native",()->TelemetryRuntime.select("")),composer);
            row("De-Waze",TelemetryStore.WAZE.equals(TelemetryRuntime.selected()),action("waze",()->TelemetryRuntime.select(TelemetryStore.WAZE)),composer);
            row("Flitsmeister",TelemetryStore.FLITSMEISTER.equals(TelemetryRuntime.selected()),action("fm",()->TelemetryRuntime.select(TelemetryStore.FLITSMEISTER)),composer);
            if(!TelemetryRuntime.selected().isEmpty()) {
                hint(TelemetryRuntime.statusText(),composer);
                toggle(text("spoken","Spoken road warnings"),TelemetryRuntime.spokenEnabled(),toggleAction("spoken",TelemetryRuntime::setSpokenEnabled),text("spoken_hint","Uses Vela's voice and mute settings"),composer);
                toggle(text("car","Show details on Android Auto"),TelemetryRuntime.carEnabled(),toggleAction("car",TelemetryRuntime::setCarEnabled),null,composer);
                row(text("open","Open selected provider"),false,action("open",()->{
                    Context app=TelemetryRuntime.app();Intent launch=app.getPackageManager().getLaunchIntentForPackage(TelemetryRuntime.selected());
                    if(launch!=null)app.startActivity(launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                }),composer);
                hint(text("flock_hint","Native Flock resumes when both providers stop advertising."),composer);
            }
            call("ez3","b",new Class[]{int.class,type("e50")},0,composer);
        }catch(ReflectiveOperationException e){throw new IllegalStateException("Vela native settings binding failed",e);}
    }
    /** Original Vela placement/size modifier, native Android view, no window or enclosing surface. */
    public static boolean compactWidget(Object modifier,Object composer) {
        if(TelemetryRuntime.selected().isEmpty())return false;
        observe();
        try {
            compactDark=Boolean.TRUE.equals(call("la","H",new Class[]{type("e50")},composer));
            Class<?> fn=type("kotlin.jvm.functions.Function1");
            if(compactFactory==null)compactFactory=Proxy.newProxyInstance(fn.getClassLoader(),new Class[]{fn},(proxy,method,args)->{
                if(!method.getName().equals("invoke"))return objectMethod(proxy,method,args);
                CompactSpeedView view=new CompactSpeedView((Context)args[0]);view.refresh(compactDark);return view;
            });
            if(compactUpdate==null)compactUpdate=Proxy.newProxyInstance(fn.getClassLoader(),new Class[]{fn},(proxy,method,args)->{
                if(!method.getName().equals("invoke"))return objectMethod(proxy,method,args);
                observe();((CompactSpeedView)args[0]).refresh(compactDark);return unit();
            });
            call("androidx.compose.ui.viewinterop.a","a",new Class[]{fn,type("lg2"),fn,type("e50"),int.class,int.class},compactFactory,modifier,compactUpdate,composer,0,0);
            return true;
        }catch(ReflectiveOperationException e){throw new IllegalStateException("Vela compact native widget binding failed",e);}
    }
    public static boolean imperial() {
        try {Object state=type("gr4").getField("a").get(null);return Boolean.TRUE.equals(state.getClass().getMethod("getValue").invoke(state));}
        catch(ReflectiveOperationException e){Context c=TelemetryRuntime.app();return c!=null&&c.getSharedPreferences("vela_units",0).getBoolean("imperial",false);}
    }
    public static String distance(double meters,boolean imperial) {
        if(imperial)return meters<304.8?Math.max(10,Math.round(meters*3.28084/10)*10)+" ft":String.format(java.util.Locale.getDefault(),"%.1f mi",meters/1609.344);
        return meters<1000?Math.round(meters)+" m":String.format(java.util.Locale.getDefault(),"%.1f km",meters/1000);
    }
}
