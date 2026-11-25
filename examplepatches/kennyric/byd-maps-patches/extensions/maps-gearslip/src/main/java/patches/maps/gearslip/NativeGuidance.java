package patches.maps.gearslip;

import android.content.Context;
import android.os.Handler;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.function.Consumer;

/** Subscribes to the same immutable native navigation snapshots as Maps' car provider. */
final class NativeGuidance implements AutoCloseable {
    static final class Direction {
        final String shape;
        final boolean right, recommended;
        Direction(String shape,boolean right,boolean recommended){this.shape=shape;this.right=right;this.recommended=recommended;}
    }
    static final class Step {
        final String cue,secondary,maneuver,side,turn,drivingSide;
        final int roundaboutAngle,roundaboutExit;
        final List<List<Direction>> lanes;
        Step(String cue,String secondary,String maneuver,String side,String turn,String drivingSide,int angle,int exit,List<List<Direction>> lanes){
            this.cue=cue;this.secondary=secondary;this.maneuver=maneuver;this.side=side;this.turn=turn;this.drivingSide=drivingSide;
            roundaboutAngle=angle;roundaboutExit=exit;
            List<List<Direction>> copy=new ArrayList<>();
            for(List<Direction> lane:lanes)copy.add(Collections.unmodifiableList(new ArrayList<>(lane)));
            this.lanes=Collections.unmodifiableList(copy);
        }
    }
    static final class Snapshot {
        final boolean guiding;
        final String cue;
        final int meters,seconds;
        final Step current,next;
        final int routeMeters,routeSeconds,destinationMeters,destinationSeconds;
        final String distanceUnits;
        Snapshot(boolean guiding,String cue,int meters,int seconds){
            this(guiding,cue,meters,seconds,null,null,-1,-1,-1,-1);
        }
        Snapshot(boolean guiding,String cue,int meters,int seconds,Step current,Step next,int routeMeters,int routeSeconds,int destinationMeters,int destinationSeconds){
            this(guiding,cue,meters,seconds,current,next,routeMeters,routeSeconds,destinationMeters,destinationSeconds,null);
        }
        Snapshot(boolean guiding,String cue,int meters,int seconds,Step current,Step next,int routeMeters,int routeSeconds,int destinationMeters,int destinationSeconds,String distanceUnits){
            this.guiding=guiding;this.cue=cue;this.meters=meters;this.seconds=seconds;this.current=current;this.next=next;
            this.routeMeters=routeMeters;this.routeSeconds=routeSeconds;this.destinationMeters=destinationMeters;this.destinationSeconds=destinationSeconds;
            this.distanceUnits=distanceUnits;
        }
    }
    private final Object source,listener;
    private final Object distanceUtil;
    private final Consumer<Snapshot> callback;
    private final Class<?> marker;
    private boolean closed;

    NativeGuidance(Context context,Handler main,Consumer<Snapshot> callback,Consumer<Throwable> failure)throws Exception{
        this(acquire(context.getApplicationContext()),context.getClassLoader().loadClass("blra"),context.getClassLoader().loadClass("blrb"),
                command->main.post(command),callback,failure,acquireDistanceUtil(context.getApplicationContext()));
    }
    NativeGuidance(Object source,Class<?> listenerType,Class<?> marker,Executor executor,Consumer<Snapshot> callback,Consumer<Throwable> failure)throws Exception{
        this(source,listenerType,marker,executor,callback,failure,null);
    }
    NativeGuidance(Object source,Class<?> listenerType,Class<?> marker,Executor executor,Consumer<Snapshot> callback,Consumer<Throwable> failure,Object distanceUtil)throws Exception{
        this.source=source;this.marker=marker;this.distanceUtil=distanceUtil;this.callback=callback;
        listener=Proxy.newProxyInstance(listenerType.getClassLoader(),new Class<?>[]{listenerType},(proxy,method,args)->{
            if(method.getDeclaringClass()==Object.class){
                if("hashCode".equals(method.getName()))return System.identityHashCode(proxy);
                if("equals".equals(method.getName()))return proxy==args[0];
                return "Maps CAL guidance listener";
            }
            if("se".equals(method.getName())&&!closed){
                try{callback.accept(snapshot(args[0],this.distanceUtil));}catch(Exception error){failure.accept(error);}
            }
            return null;
        });
        method(source,"a",marker,Executor.class).invoke(source,listener,executor);
        try{callback.accept(snapshot(field(source,"b"),distanceUtil));}
        catch(Exception error){close();throw error;}
    }
    static Object acquire(Object app)throws Exception{
        // 26.44 inherits this cached component accessor from nsm. Do not call
        // the protected e() factory, which creates another application manager.
        Object component=method(app,"rS").invoke(app);
        Object provider=field(component,"bR");
        return method(provider,"a").invoke(provider);
    }
    static Object acquireDistanceUtil(Object app)throws Exception{
        Object component=method(app,"rS").invoke(app),provider=field(component,"hN");
        Object util=method(provider,"a").invoke(provider);
        if(!util.getClass().getName().equals("awxs"))throw new IllegalStateException("Maps distance utility changed");
        return util;
    }
    static Snapshot snapshot(Object value)throws Exception{
        return snapshot(value,null);
    }
    static Snapshot snapshot(Object value,Object distanceUtil)throws Exception{
        Object mode=field(value,"c");
        if(!(mode instanceof Enum))throw new IllegalStateException("Maps native guidance mode changed");
        boolean guiding="GUIDING".equals(((Enum<?>)mode).name());
        if(!guiding)return new Snapshot(false,null,0,0);
        Object route=field(value,"b");
        Object model=route==null?null:field(route,"a");
        if(model==null)return new Snapshot(true,null,0,0);
        Object progress=method(model,"e").invoke(model);
        Object path=field(progress,"b"),routeUnits=path==null?null:field(path,"N");
        Class<?> unitType=distanceUtil==null?null:path==null?distanceUtil.getClass().getClassLoader().loadClass("cizm"):fieldType(path,"N");
        Object resolved=distanceUtil==null?routeUnits:method(distanceUtil,"c",unitType).invoke(distanceUtil,routeUnits);
        String units=resolved==null?null:enumName(resolved);
        Object step=field(progress,"d");
        Step current=step(step),next=step==null?null:step(field(step,"S"));
        return new Snapshot(true,current==null?null:current.cue,((Number)field(progress,"i")).intValue(),((Number)field(progress,"j")).intValue(),
                current,next,((Number)field(progress,"m")).intValue(),((Number)method(progress,"c").invoke(progress)).intValue(),
                ((Number)field(progress,"n")).intValue(),((Number)method(progress,"d").invoke(progress)).intValue(),units);
    }
    private static Step step(Object value)throws Exception{
        if(value==null)return null;
        Object cue=field(value,"q"),secondary=field(value,"t");
        if(cue!=null&&!(cue instanceof CharSequence)||secondary!=null&&!(secondary instanceof CharSequence))
            throw new IllegalStateException("Maps instruction text ABI changed");
        List<List<Direction>> lanes=new ArrayList<>();
        Object nativeLanes=field(value,"F");
        if(!(nativeLanes instanceof List))throw new IllegalStateException("Maps lane list ABI changed");
        for(Object lane:(List<?>)nativeLanes){
            Object turns=field(lane,"a");
            if(!(turns instanceof List))throw new IllegalStateException("Maps lane directions ABI changed");
            int guidance=((Number)field(lane,"b")).intValue();List<Direction> directions=new ArrayList<>();
            for(Object direction:(List<?>)turns){
                String shape=enumName(field(direction,"a"));
                // The native bmot/blvs conversion rejects MERGE lane arrows.
                if(!"MERGE".equals(shape))directions.add(new Direction(shape,(Boolean)field(direction,"b"),guidance==1&&directions.isEmpty()));
            }
            if(directions.isEmpty())directions.add(new Direction("UNKNOWN",false,false));
            lanes.add(directions);
        }
        return new Step(cue==null?null:cue.toString(),secondary==null?null:secondary.toString(),enumName(field(value,"c")),enumName(field(value,"d")),
                enumName(field(value,"e")),enumName(field(value,"I")),((Number)field(value,"f")).intValue(),((Number)field(value,"g")).intValue(),lanes);
    }
    private static String enumName(Object value){
        if(!(value instanceof Enum))throw new IllegalStateException("Maps native navigation enum changed");
        return ((Enum<?>)value).name();
    }
    /** Re-read the authoritative native source after a content action. Only cessation is reported. */
    void refresh(){
        if(closed)return;
        try{Snapshot value=snapshot(field(source,"b"),distanceUtil);if(!value.guiding)callback.accept(value);}
        catch(Exception ignored){/* Preserve the listener path and the native action result. */}
    }
    @Override public void close()throws Exception{
        if(closed)return;closed=true;method(source,"c",marker).invoke(source,listener);
    }
    private static Object field(Object value,String name)throws Exception{Field field=value.getClass().getField(name);field.setAccessible(true);return field.get(value);}
    private static Class<?> fieldType(Object value,String name)throws Exception{return value.getClass().getField(name).getType();}
    private static Method method(Object value,String name,Class<?>...parameters)throws Exception{Method method=value.getClass().getMethod(name,parameters);method.setAccessible(true);return method;}
}
