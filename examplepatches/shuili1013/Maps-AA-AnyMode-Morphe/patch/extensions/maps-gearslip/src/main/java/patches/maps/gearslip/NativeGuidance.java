package patches.maps.gearslip;

import android.content.Context;
import android.os.Handler;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.concurrent.Executor;
import java.util.function.Consumer;

/** Subscribes to the same immutable native navigation snapshots as Maps' car provider. */
final class NativeGuidance implements AutoCloseable {
    static final class Snapshot {
        final boolean guiding;
        final String cue;
        final int meters,seconds;
        Snapshot(boolean guiding,String cue,int meters,int seconds){this.guiding=guiding;this.cue=cue;this.meters=meters;this.seconds=seconds;}
    }
    private final Object source,listener;
    private final Class<?> marker;
    private boolean closed;

    NativeGuidance(Context context,Handler main,Consumer<Snapshot> callback,Consumer<Throwable> failure)throws Exception{
        this(acquire(context),context.getClassLoader().loadClass("blkt"),context.getClassLoader().loadClass("blku"),
                command->main.post(command),callback,failure);
    }
    NativeGuidance(Object source,Class<?> listenerType,Class<?> marker,Executor executor,Consumer<Snapshot> callback,Consumer<Throwable> failure)throws Exception{
        this.source=source;this.marker=marker;
        listener=Proxy.newProxyInstance(listenerType.getClassLoader(),new Class<?>[]{listenerType},(proxy,method,args)->{
            if(method.getDeclaringClass()==Object.class){
                if("hashCode".equals(method.getName()))return System.identityHashCode(proxy);
                if("equals".equals(method.getName()))return proxy==args[0];
                return "Maps CAL guidance listener";
            }
            if("rW".equals(method.getName())&&!closed){
                try{callback.accept(snapshot(args[0]));}catch(Exception error){failure.accept(error);}
            }
            return null;
        });
        method(source,"a",marker,Executor.class).invoke(source,listener,executor);
        try{callback.accept(snapshot(field(source,"b")));}
        catch(Exception error){close();throw error;}
    }
    private static Object acquire(Context context)throws Exception{
        Object app=context.getApplicationContext();
        Object manager=method(app,"rI").invoke(app);
        Object component=method(manager,"rJ").invoke(manager);
        Object provider=field(component,"bR");
        return method(provider,"a").invoke(provider);
    }
    static Snapshot snapshot(Object value)throws Exception{
        Object mode=field(value,"c");
        if(!(mode instanceof Enum))throw new IllegalStateException("Maps native guidance mode changed");
        boolean guiding="GUIDING".equals(((Enum<?>)mode).name());
        if(!guiding)return new Snapshot(false,null,0,0);
        Object route=field(value,"b");
        Object model=route==null?null:field(route,"a");
        if(model==null)return new Snapshot(true,null,0,0);
        Object progress=method(model,"e").invoke(model);
        Object step=field(progress,"d");
        Object cue=step==null?null:field(step,"q");
        if(cue!=null&&!(cue instanceof CharSequence))throw new IllegalStateException("Maps instruction text ABI changed");
        return new Snapshot(true,cue==null?null:cue.toString(),((Number)field(progress,"i")).intValue(),((Number)field(progress,"j")).intValue());
    }
    @Override public void close()throws Exception{
        if(closed)return;closed=true;method(source,"c",marker).invoke(source,listener);
    }
    private static Object field(Object value,String name)throws Exception{Field field=value.getClass().getField(name);field.setAccessible(true);return field.get(value);}
    private static Method method(Object value,String name,Class<?>...parameters)throws Exception{Method method=value.getClass().getMethod(name,parameters);method.setAccessible(true);return method;}
}
