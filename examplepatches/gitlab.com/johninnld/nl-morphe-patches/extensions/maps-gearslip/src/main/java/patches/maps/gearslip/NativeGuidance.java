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
        this(acquire(context.getApplicationContext()),type(context.getClassLoader(),"blxx","blra"),type(context.getClassLoader(),"blxy","blrb"),
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
            if(("se".equals(method.getName())||"qk".equals(method.getName()))&&!closed){
                try{callback.accept(snapshot(args[0],this.distanceUtil));}catch(Exception error){failure.accept(error);}
            }
            return null;
        });
        method(source,"a",marker,Executor.class).invoke(source,listener,executor);
        try{callback.accept(snapshot(field(source,"b"),distanceUtil));}
        catch(Exception error){close();throw error;}
    }
    /** Maps renames obfuscated types every release; take the first name this build has. */
    static Class<?> type(ClassLoader loader,String... names)throws ClassNotFoundException{
        for(String name:names)try{return Class.forName(name,false,loader);}catch(ClassNotFoundException ignored){}
        throw new ClassNotFoundException(java.util.Arrays.toString(names));
    }
    /**
     * The cached application component. 26.44 inherits it as rS() from nsm; 26.47 inherits pY()
     * from nup. Never the protected factory e(), which creates another application manager.
     */
    static Object component(Object app)throws Exception{
        try{return method(app,"rS").invoke(app);}
        catch(NoSuchMethodException older){return method(app,"pY").invoke(app);}
    }
    /** A shape test for a provider's value. Maps renumbers its dependency slots every release. */
    interface Shape{boolean matches(Object value)throws Exception;}
    static boolean hasMethod(Object value,String name,int arguments){
        for(Class<?> type=value.getClass();type!=null;type=type.getSuperclass())
            for(java.lang.reflect.Method candidate:type.getDeclaredMethods())
                if(candidate.getName().equals(name)&&candidate.getParameterCount()==arguments)return true;
        return false;
    }
    /** The first slot whose value has the expected shape: 26.44 and 26.47 put them in different slots. */
    static Object provider(Object component,String[] slots,Shape shape)throws Exception{
        Exception last=null;
        for(String slot:slots)try{
            Object provider=field(component,slot);
            Object value=method(provider,"a").invoke(provider);
            if(value!=null&&shape.matches(value))return value;
        }catch(ReflectiveOperationException|RuntimeException ignored){last=ignored;}
        throw new IllegalStateException("Maps guidance provider changed: "+java.util.Arrays.toString(slots),last);
    }
    static Object acquire(Object app)throws Exception{
        Object component=component(app);
        // The guidance source takes (marker, Executor); 26.44 slot bR, 26.47 slot bS.
        return provider(component,new String[]{"bS","bR"},value->hasMethod(value,"a",2));
    }
    static Object acquireDistanceUtil(Object app)throws Exception{
        Object component=component(app);
        // The unit converter is the class whose c(unit) returns the same unit type:
        // 26.44 awxs.c(cizm)cizm, 26.47 axju.c(cjkl)cjkl, in slots hN and hQ.
        return provider(component,new String[]{"hQ","hN"},value->{
            for(Class<?> owner=value.getClass();owner!=null;owner=owner.getSuperclass())
                for(java.lang.reflect.Method candidate:owner.getDeclaredMethods())
                    if(candidate.getName().equals("c")&&candidate.getParameterCount()==1&&
                        candidate.getParameterTypes()[0]==candidate.getReturnType())return true;
            return false;
        });
    }
    /** The distance unit is whatever the utility converts through its one-argument c(...). */
    static Class<?> unitParameter(Object util)throws Exception{
        for(Class<?> owner=util.getClass();owner!=null;owner=owner.getSuperclass())
            for(java.lang.reflect.Method candidate:owner.getDeclaredMethods())
                if(candidate.getName().equals("c")&&candidate.getParameterCount()==1)return candidate.getParameterTypes()[0];
        throw new NoSuchMethodException("distance utility has no one-argument c");
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
        Class<?> unitType=distanceUtil==null?null:path==null?unitParameter(distanceUtil):fieldType(path,"N");
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
    /**
     * Maps releases change a member's visibility as freely as its class name: 26.47's component has a
     * public bR and a package-private hN. getField() only sees public members, so walk the declared
     * fields of the whole hierarchy instead.
     */
    static Field declaredField(Class<?> type,String name)throws NoSuchFieldException{
        for(Class<?> owner=type;owner!=null;owner=owner.getSuperclass())
            try{Field found=owner.getDeclaredField(name);found.setAccessible(true);return found;}catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException(name);
    }
    private static Object field(Object value,String name)throws Exception{return declaredField(value.getClass(),name).get(value);}
    private static Class<?> fieldType(Object value,String name)throws Exception{return declaredField(value.getClass(),name).getType();}
    private static Method method(Object value,String name,Class<?>...parameters)throws Exception{return declaredMethod(value.getClass(),name,parameters);}
    static Method declaredMethod(Class<?> type,String name,Class<?>...parameters)throws NoSuchMethodException{
        for(Class<?> owner=type;owner!=null;owner=owner.getSuperclass())
            try{Method found=owner.getDeclaredMethod(name,parameters);found.setAccessible(true);return found;}catch(NoSuchMethodException absent){}
        throw new NoSuchMethodException(name);
    }
}
