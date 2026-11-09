package org.ungoogled.ui;

import android.content.Context;
import android.media.AudioManager;
import android.media.AudioFocusRequest;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import nl.johninnl.navigation.alerts.WarningAudioOwner;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.WarningPassage;
import android.location.Location;

/** Native Maps queue hold. Never writes mute preferences or stream volume. */
public final class MapsGuidanceCoordinator {
    public interface Ready { void complete(boolean quiet,String reason); }
    private static final Object LOCK=new Object();
    private static final Map<Object,Object> PLAYERS=new IdentityHashMap<>();
    private static WeakReference<Object> route=new WeakReference<>(null);
    private static MapsGuidanceCoordinator current;
    private static int nativeFocusInFlight;
    private static Object cachedPolyline;
    private static RoadWarningEngine.Route cachedWarningRoute;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Context app;
    private Object manager;
    private volatile boolean bound,fault,holding,waiting;
    private volatile long generation;
    private volatile boolean regenerate;
    private String holdToken;

    public MapsGuidanceCoordinator(Context context) {
        app=context.getApplicationContext();synchronized(LOCK){current=this;}
        main.post(this::bind);
    }
    /** Patched true only after every native speech guard has passed. */
    private static boolean hooksInstalled(){return false;}
    private void bind() {
        try {
            Object component=applicationComponent(app);
            Object provider=field(component.getClass(),"hU").get(component);
            Object actual=method(provider.getClass(),"a").invoke(provider);
            if(!actual.getClass().getName().equals("bmrc"))throw new IllegalStateException("NATIVE_MANAGER");
            manager=actual;bound=true;
        }catch(ReflectiveOperationException | RuntimeException error){fault=true;}
    }
    static Object applicationComponent(Object application)throws ReflectiveOperationException{
        // This Maps build exposes its generated component manager through rI;
        // rJ belongs to that manager, not GoogleMapsApplication itself.
        Object manager=method(application.getClass(),"rI").invoke(application);
        return method(manager.getClass(),"rJ").invoke(manager);
    }
    public boolean isReady(){return hooksInstalled()&&bound&&!fault;}
    public WarningAudioOwner.Mode effectiveMode(WarningAudioOwner.Mode requested) {
        if(requested==WarningAudioOwner.Mode.SILENT)return requested;
        if(!isReady())return requested;
        try {
            Object mute=field(manager.getClass(),"f").get(manager);
            Object value=method(mute.getClass(),"c").invoke(mute);
            String nativeMode=((Enum<?>)value).name();
            WarningAudioOwner.Mode capped=capNativeMode(requested,nativeMode);
            if(capped==null){fault=true;return requested;}return capped;
        }catch(ReflectiveOperationException | RuntimeException error){fault=true;return requested;}
    }
    static WarningAudioOwner.Mode capNativeMode(WarningAudioOwner.Mode requested,String verifiedNativeMode) {
        if("MUTED".equals(verifiedNativeMode))return WarningAudioOwner.Mode.SILENT;
        if("MINIMAL".equals(verifiedNativeMode))return requested==WarningAudioOwner.Mode.VOICE?WarningAudioOwner.Mode.TONE:requested;
        return "UNMUTED".equals(verifiedNativeMode)?requested:null;
    }
    public void acquire(String token,WarningEvent.Priority priority,long deadline,Ready callback) {
        main.post(()->acquireMain(token,priority,deadline,callback));
    }
    private void acquireMain(String token,WarningEvent.Priority priority,long deadline,Ready callback) {
        if(!isReady() || holding || waiting || SystemClock.elapsedRealtime()>=deadline){callback.complete(false,"GUIDANCE_UNAVAILABLE");return;}
        long version;
        synchronized(LOCK){holdToken=token;regenerate=false;waiting=priority!=WarningEvent.Priority.P0;holding=priority==WarningEvent.Priority.P0;version=++generation;}
        inspectGap(version,priority,deadline,callback);
    }
    private void inspectGap(long version,WarningEvent.Priority priority,long deadline,Ready callback) {
        if(version!=generation || !(holding||waiting))return;
        if(SystemClock.elapsedRealtime()>=deadline){abandon(version,callback,"GUIDANCE_DEADLINE");return;}
        try {
            Executor serial=(Executor)field(manager.getClass(),"j").get(manager);
            serial.execute(()-> {
                try {
                    Object active,pending;
                    synchronized(LOCK){
                        if(version!=generation || !(holding||waiting))return;
                        if(SystemClock.elapsedRealtime()>=deadline){main.post(()->abandon(version,callback,"GUIDANCE_DEADLINE"));return;}
                        active=field(manager.getClass(),"p").get(manager);pending=field(manager.getClass(),"q").get(manager);
                        // Reserve the actual gap on the native serial executor, not later
                        // from a stale snapshot on main. Queue/focus hooks see it atomically.
                        if(active==null&&pending==null){holding=true;waiting=false;}
                    }
                    main.post(()-> {
                        if(version!=generation || !(holding||waiting))return;
                        if(SystemClock.elapsedRealtime()>=deadline){abandon(version,callback,"GUIDANCE_DEADLINE");return;}
                        if(active!=null || pending!=null) {
                            if(priority!=WarningEvent.Priority.P0){
                                // Keep native queue/focus/dispatch unheld while waiting for its
                                // own instruction to finish. Never extend the warning deadline.
                                main.postDelayed(()->inspectGap(version,priority,deadline,callback),50);return;
                            }
                            if(!canRegenerate()){abandon(version,callback,"GUIDANCE_BUSY");return;}
                            regenerate=true;
                            try {
                                if(active!=null)cancel(active);
                                if(pending!=null)cancel(pending);
                            }catch(ReflectiveOperationException | RuntimeException error){fault=true;abandon(version,callback,"GUIDANCE_CANCEL_FAILED");return;}
                        }
                        awaitQuiet(version,deadline,callback);
                    });
                }catch(ReflectiveOperationException | RuntimeException error){main.post(()->{if(version==generation){fault=true;abandon(version,callback,"GUIDANCE_STATE_FAILED");}});}
            });
        }catch(ReflectiveOperationException | RuntimeException error){fault=true;abandon(version,callback,"GUIDANCE_EXECUTOR_FAILED");}
    }
    private void cancel(Object job) throws ReflectiveOperationException {
        Class<?> jobInterface=Class.forName("bmud",false,app.getClassLoader());
        method(manager.getClass(),"l",jobInterface).invoke(manager,job);
    }
    private void awaitQuiet(long version,long deadline,Ready callback) {
        if(version!=generation || !holding)return;
        if(SystemClock.elapsedRealtime()>=deadline){abandon(version,callback,"GUIDANCE_DEADLINE");return;}
        boolean quiet=true;
        synchronized(LOCK) {
            if(nativeFocusInFlight!=0)quiet=false;
            for(Object player:PLAYERS.values())try { if(!released(player,0))quiet=false; }
            catch(ReflectiveOperationException | RuntimeException error){fault=true;abandon(version,callback,"GUIDANCE_PLAYER_UNSUPPORTED");return;}
        }
        if(quiet){callback.complete(true,"QUIESCENT");return;}
        if(SystemClock.elapsedRealtime()>=deadline){abandon(version,callback,"GUIDANCE_DEADLINE");return;}
        main.postDelayed(()->awaitQuiet(version,deadline,callback),10);
    }
    private void abandon(long version,Ready callback,String reason) {
        if(version!=generation)return;releaseMain(holdToken);callback.complete(false,reason);
    }
    public void release(String token){main.post(()->releaseMain(token));}
    private void releaseMain(String token) {
        boolean restore;
        synchronized(LOCK){
            if(!(holding||waiting) || token==null || !token.equals(holdToken))return;
            holding=false;waiting=false;holdToken=null;generation++;
            restore=regenerate;regenerate=false;
        }
        if(restore)regenerateCurrent();
    }
    private boolean canRegenerate(){synchronized(LOCK){Object owner=route.get();if(owner==null)return false;try{return routeField(owner,"o").get(owner)!=null&&routeField(owner,"e").get(owner)!=null&&navigationActive(owner);}catch(ReflectiveOperationException | RuntimeException error){return false;}}}
    /** Read current route and step at release. No captured turn text or stale ybc is replayed. */
    private void regenerateCurrent() {
        Object owner;synchronized(LOCK){owner=route.get();}if(owner==null)return;
        try {
            Object step=routeField(owner,"o").get(owner),model=routeField(owner,"e").get(owner);
            if(step!=null && model!=null && navigationActive(owner))method(routeBase(owner),"u",Class.forName("ybc",false,app.getClassLoader())).invoke(owner,step);
        }catch(ReflectiveOperationException | RuntimeException error){fault=true;}
    }
    public void close(){main.post(()->{releaseMain(holdToken);synchronized(LOCK){if(current==this)current=null;}});}
    public static void captureRoute(Object owner){synchronized(LOCK){route=new WeakReference<>(owner);cachedPolyline=null;cachedWarningRoute=null;}}
    public static void routeEnded(Object owner){synchronized(LOCK){if(route.get()==owner){route.clear();cachedPolyline=null;cachedWarningRoute=null;}}}
    /** Directed native route takes precedence over a straight heading, including around bends. */
    public static boolean passed(WarningEvent event,Location fix,long now){
        if(!event.relevance.equals("point_ahead")||event.latitude==null||event.longitude==null||fix==null)return false;
        Object owner;synchronized(LOCK){owner=route.get();}
        if(owner!=null)try{if(navigationActive(owner)){RoadWarningEngine.Route shape=warningRoute(owner);return shape!=null&&WarningPassage.passedOnRoute(event,fix,now,shape.passageDistance(fix.getLatitude(),fix.getLongitude(),event.latitude,event.longitude,fix.hasAccuracy()?fix.getAccuracy():Double.NaN));}}catch(ReflectiveOperationException|RuntimeException unavailable){return false;}
        return WarningPassage.passed(event,fix,now);
    }
    public static WarningPassage.Relevance relevance(WarningEvent event,Location fix,long now,boolean navigating){
        if(!event.relevance.equals("point_ahead"))return WarningPassage.Relevance.RELEVANT;
        Object owner;synchronized(LOCK){owner=route.get();}
        try{
            if(owner!=null&&navigationActive(owner)){
                if(!WarningPassage.freshFix(fix,now)||event.latitude==null||event.longitude==null)return WarningPassage.Relevance.CONTEXT_UNVERIFIED;
                RoadWarningEngine.Route shape=warningRoute(owner);
                return shape==null?WarningPassage.Relevance.CONTEXT_UNVERIFIED:shape.warningRelevance(fix.getLatitude(),fix.getLongitude(),event.latitude,event.longitude,fix.getAccuracy());
            }
            if(navigating)return WarningPassage.Relevance.CONTEXT_UNVERIFIED;
        }catch(ReflectiveOperationException|RuntimeException unavailable){return WarningPassage.Relevance.CONTEXT_UNVERIFIED;}
        return WarningPassage.passed(event,fix,now)?WarningPassage.Relevance.PASSED:WarningPassage.Relevance.RELEVANT;
    }
    private static RoadWarningEngine.Route warningRoute(Object owner)throws ReflectiveOperationException{
        Object model=routeField(owner,"e").get(owner);if(model==null)return null;
        ClassLoader loader=owner.getClass().getClassLoader();Class<?> routeModel=Class.forName("blot",false,loader),pathType=Class.forName("yap",false,loader),polylineType=Class.forName("bjix",false,loader),pointType=Class.forName("bjis",false,loader);
        if(!routeModel.isInstance(model))return null;Field pathField=field(routeModel,"b");if(pathField.getType()!=pathType)return null;Object path=pathField.get(model);if(path==null)return null;Field geometry=field(pathType,"k");if(geometry.getType()!=polylineType)return null;Object polyline=geometry.get(path);if(polyline==null)return null;
        synchronized(LOCK){if(polyline==cachedPolyline)return cachedWarningRoute;}
        int count=((Number)method(polylineType,"g").invoke(polyline)).intValue();if(count<2||count>50000)return null;double[] latitudes=new double[count],longitudes=new double[count];Method point=method(polylineType,"n",int.class),latitude=method(pointType,"b"),longitude=method(pointType,"d");
        for(int i=0;i<count;i++){Object value=point.invoke(polyline,i);latitudes[i]=((Number)latitude.invoke(value)).doubleValue();longitudes[i]=((Number)longitude.invoke(value)).doubleValue();if(!Double.isFinite(latitudes[i])||!Double.isFinite(longitudes[i])||Math.abs(latitudes[i])>90||Math.abs(longitudes[i])>180)return null;}
        RoadWarningEngine.Route snapshot=new RoadWarningEngine.Route(latitudes,longitudes);synchronized(LOCK){if(route.get()==owner){cachedPolyline=polyline;cachedWarningRoute=snapshot;}}return snapshot;
    }
    private static Class<?> routeBase(Object owner)throws ClassNotFoundException {
        Class<?> base=Class.forName("bmia",false,owner.getClass().getClassLoader());
        if(!base.isInstance(owner))throw new IllegalArgumentException("ROUTE_OWNER");return base;
    }
    /** Obfuscated subclasses reuse member names; use the guarded base declaration, not a name walk. */
    private static Field routeField(Object owner,String name)throws ReflectiveOperationException {
        Field value=routeBase(owner).getDeclaredField(name);value.setAccessible(true);
        String expected="o".equals(name)?"ybc":"e".equals(name)?"blot":"bmhh";
        if(!value.getType().getName().equals(expected))throw new NoSuchFieldException("ROUTE_FIELD_TYPE");return value;
    }
    private static boolean navigationActive(Object owner)throws ReflectiveOperationException {
        Object controller=routeField(owner,"c").get(owner);return controller!=null&&(Boolean)method(controller.getClass(),"bv").invoke(controller);
    }

    /** Intercept only the native Maps navigation manager's focus call, never another app or stream. */
    public static int requestNativeFocus(AudioManager audio,AudioFocusRequest request) {
        synchronized(LOCK) {
            if(current!=null && current.holding){current.regenerate=true;return AudioManager.AUDIOFOCUS_REQUEST_FAILED;}
            nativeFocusInFlight++;
        }
        // No Binder call is made while holding LOCK. Acquiring a hold waits for earlier calls to return.
        try{return audio.requestAudioFocus(request);}
        finally{synchronized(LOCK){nativeFocusInFlight--;}}
    }
    /** Focus-denied callbacks take an earlier native return than bmuc.d; release their prepared media too. */
    public static boolean cancelPreparedCallback(Object callback) {
        MapsGuidanceCoordinator coordinator;synchronized(LOCK){coordinator=current;}
        if(coordinator==null || !coordinator.holding)return false;
        try {
            if(field(callback.getClass(),"$cid").getInt(callback)!=0)return false;
            Object parent=field(callback.getClass(),"b").get(callback),job=field(parent.getClass(),"a").get(parent),player=field(callback.getClass(),"a").get(callback);
            reject(coordinator,job,player);return true;
        }catch(InvocationTargetException error){Throwable cause=error.getCause();if(cause instanceof RuntimeException)throw (RuntimeException)cause;if(cause instanceof Error)throw (Error)cause;throw new IllegalStateException(cause);}
        catch(ReflectiveOperationException error){coordinator.fault=true;throw new IllegalStateException("Maps prepared callback ABI",error);}
    }
    private static void reject(MapsGuidanceCoordinator coordinator,Object job,Object player)throws ReflectiveOperationException {
        coordinator.regenerate=true;((AtomicBoolean)field(job.getClass(),"s").get(job)).set(true);
        method(player.getClass(),"l").invoke(player);
        method(job.getClass(),"e",Class.forName("bmuc",false,job.getClass().getClassLoader())).invoke(job,player);
        synchronized(LOCK) {
            try{if(released(player,0))PLAYERS.remove(job);}
            catch(ReflectiveOperationException | RuntimeException error){coordinator.fault=true;}
        }
    }

    /** Exact final bmuc.d boundary after asynchronous focus/readiness. Native unheld behavior stays intact. */
    public static void dispatch(Object job,Object player,Object callback) {
        MapsGuidanceCoordinator coordinator;
        synchronized(LOCK) {
            coordinator=current;
            if(PLAYERS.size()>=128 && !PLAYERS.containsKey(job)) { if(coordinator!=null)coordinator.fault=true; }
            else PLAYERS.put(job,player);
        }
        try {
            if(coordinator!=null && coordinator.holding) {
                // A not-yet-dispatched prepared player has no native completion listener installed.
                // Release its resources, then use the original never-played queue completion path.
                reject(coordinator,job,player);return;
            }
            method(player.getClass(),"d",Class.forName("bmua",false,player.getClass().getClassLoader())).invoke(player,callback);
        }catch(InvocationTargetException error) {
            Throwable cause=error.getCause();if(cause instanceof RuntimeException)throw (RuntimeException)cause;if(cause instanceof Error)throw (Error)cause;throw new IllegalStateException(cause);
        }catch(ReflectiveOperationException error){if(coordinator!=null)coordinator.fault=true;throw new IllegalStateException("Maps native dispatch ABI",error);}
    }
    /** Original native completion remains installed; observe before it advances the queue. */
    public static void terminal(Object nativeListener,Object player) {
        try {
            Object job=field(nativeListener.getClass(),"a").get(nativeListener);
            MapsGuidanceCoordinator coordinator;
            synchronized(LOCK) {
                coordinator=current;
                if(released(player,0))PLAYERS.remove(job);
                else if(coordinator!=null)coordinator.main.post(()->pruneReleased(job,player));
            }
        }
        catch(ReflectiveOperationException error){synchronized(LOCK){if(current!=null)current.fault=true;}}
        catch(RuntimeException error){synchronized(LOCK){if(current!=null)current.fault=true;}}
    }
    private static void pruneReleased(Object job,Object player) {
        synchronized(LOCK) {
            try { if(PLAYERS.get(job)==player && released(player,0))PLAYERS.remove(job); }
            catch(ReflectiveOperationException | RuntimeException error){if(current!=null)current.fault=true;}
        }
    }
    private static boolean released(Object player,int depth) throws ReflectiveOperationException {
        if(depth>8)throw new IllegalArgumentException("PLAYER_DEPTH");
        switch(player.getClass().getName()) {
            case "bmsk":return field(player.getClass(),"a").get(player)==null;
            case "bmtu":Object leaf=field(player.getClass(),"a").get(player);return leaf==null || released(leaf,depth+1);
            case "bmsh":for(Object leafPlayer:(Object[])field(player.getClass(),"a").get(player))if(!released(leafPlayer,depth+1))return false;return true;
            case "bmsi":return true; // Native non-audio silence timer.
            case "bmtp":return true; // Native no-op sentinel: callbacks only, no audio resource.
            case "bmty":return true; // Native vibration/wearable transport, not a local audio player.
            default:throw new IllegalArgumentException("PLAYER_UNSUPPORTED");
        }
    }
    static Field field(Class<?> type,String name) throws NoSuchFieldException {
        for(Class<?> owner=type;owner!=null;owner=owner.getSuperclass())try { Field f=owner.getDeclaredField(name);f.setAccessible(true);return f; }catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(type.getName()+"."+name);
    }
    static Method method(Class<?> type,String name,Class<?>...parameters) throws NoSuchMethodException {
        for(Class<?> owner=type;owner!=null;owner=owner.getSuperclass())try { Method m=owner.getDeclaredMethod(name,parameters);m.setAccessible(true);return m; }catch(NoSuchMethodException ignored){}
        throw new NoSuchMethodException(type.getName()+"."+name);
    }
}
