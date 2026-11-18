package nl.johninnl.wuplaycar;

import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import kotlin.coroutines.*;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/** Checked reflection boundary for the optimized mobile ABI. Never log native arguments. */
final class NativeCalls implements AutoCloseable {
    private final Set<Object> jobs = Collections.synchronizedSet(new HashSet<>());
    private volatile boolean closed;
    static Object field(Object target, String name) throws Exception {
        return target.getClass().getField(name).get(target);
    }
    static Object optional(Object target, String name) {
        if (target == null) return null;
        try { return field(target,name); } catch (ReflectiveOperationException e) { return null; } catch (Exception e) { throw new IllegalStateException(e); }
    }
    static String text(Object target, String name) {
        Object value=optional(target,name); return value==null ? "" : String.valueOf(value);
    }
    static Object call(Object target, String name, Object... args) throws Exception {
        Class<?> owner=target instanceof Class ? (Class<?>)target : target.getClass();
        Method chosen=null;
        for(Method m:owner.getMethods()) if(m.getName().equals(name) && matches(m.getParameterTypes(),args)) {
            if(chosen!=null) throw new IllegalStateException("Ambiguous native method: "+owner.getName()+"."+name);
            chosen=m;
        }
        if(chosen==null) throw new NoSuchMethodException(owner.getName()+"."+name);
        try { return chosen.invoke(target instanceof Class ? null : target,args); }
        catch(InvocationTargetException e) { throw cause(e); }
    }
    static Object make(String name, Object... args) throws Exception {
        Constructor<?> chosen=null;
        for(Constructor<?> c:Class.forName(name).getConstructors()) if(matches(c.getParameterTypes(),args)) {
            if(chosen!=null) throw new IllegalStateException("Ambiguous native constructor: "+name);
            chosen=c;
        }
        if(chosen==null) throw new NoSuchMethodException(name+" constructor");
        try { return chosen.newInstance(args); } catch(InvocationTargetException e) { throw cause(e); }
    }
    private static boolean matches(Class<?>[] types,Object[] args) {
        if(types.length!=args.length)return false;
        for(int i=0;i<types.length;i++) {
            Class<?> t=types[i]; Object a=args[i];
            if(a==null){if(t.isPrimitive())return false;continue;}
            if(t.isPrimitive()) t=t==boolean.class?Boolean.class:t==int.class?Integer.class:t==long.class?Long.class:t==float.class?Float.class:t==double.class?Double.class:t;
            if(!t.isInstance(a))return false;
        }
        return true;
    }
    private static Exception cause(InvocationTargetException e) {
        Throwable t=e.getCause(); return t instanceof Exception?(Exception)t:new IllegalStateException("Native call failed",t);
    }
    static Object unwrap(Object value) throws Exception {
        failure(value);
        if(value!=null && value.getClass().getName().equals("kotlin.Result"))value=field(value,"value");
        failure(value);return value;
    }
    private static void failure(Object value) throws Exception {
        if(value!=null && value.getClass().getName().equals("kotlin.Result$Failure")) {
            Throwable t=(Throwable)field(value,"exception");
            if(t instanceof Exception)throw (Exception)t;
            throw new IllegalStateException("Native operation failed",t);
        }
    }
    Object first(Object flow) throws Exception {
        return await(Class.forName("kotlinx.coroutines.flow.FlowKt"),"first",flow);
    }
    Object await(Object target,String name,Object... args) throws Exception {return awaitFor(45,target,name,args);}
    Thread watch(Object flow,java.util.function.Consumer<Object> receive) throws Exception {
        Class<?> collector=Class.forName("kotlinx.coroutines.flow.FlowCollector");
        Object callback=Proxy.newProxyInstance(collector.getClassLoader(),new Class<?>[]{collector},(proxy,method,args)->{
            if(method.getName().equals("emit")){receive.accept(args[0]);return kotlin.Unit.INSTANCE;}
            if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
            if(method.getName().equals("equals"))return proxy==args[0];
            if(method.getName().equals("toString"))return "WuPlay car profile observer";
            return null;
        });
        Thread thread=new Thread(()->{try{awaitFor(0,flow,"collect",callback);}
            catch(InterruptedException e){Thread.currentThread().interrupt();}
            catch(CancellationException ignored){}
            catch(Exception e){android.util.Log.w("WuPlayCar","Profile observer ended");}},"WuPlay car profile");
        thread.setDaemon(true);thread.start();return thread;
    }
    private Object awaitFor(long seconds,Object target,String name,Object... args) throws Exception {
        if(closed)throw new CancellationException("Car session ended");
        Object job=call(Class.forName("kotlinx.coroutines.JobKt"),"SupervisorJob$default");
        synchronized(jobs){if(closed){cancel(job);throw new CancellationException("Car session ended");}jobs.add(job);}
        CoroutineContext context=(CoroutineContext)job;
        CountDownLatch done=new CountDownLatch(1);Object[] result=new Object[1];
        Continuation<Object> completion=new Continuation<Object>() {
            public CoroutineContext getContext(){return context;}
            public void resumeWith(Object value){result[0]=value;done.countDown();}
        };
        ContinuationImpl continuation=new ContinuationImpl(completion,context) {
            @Override protected Object invokeSuspend(Object value){return value;}
        };
        try {
            Object[] parameters=Arrays.copyOf(args,args.length+1);parameters[args.length]=continuation;
            Object value=call(target,name,parameters);
            if(value==CoroutineSingletons.COROUTINE_SUSPENDED) {
                if(seconds==0)done.await();else if(!done.await(seconds,TimeUnit.SECONDS))throw new TimeoutException("WuPlay request timed out");
                value=result[0];
            }
            if(closed)throw new CancellationException("Car session ended");
            return unwrap(value);
        } finally { jobs.remove(job);cancel(job); }
    }
    static void cancel(Object job) {
        if(job==null)return;
        try {call(job,"cancel",new CancellationException("Car operation ended"));}
        catch(Exception ignored) { android.util.Log.w("WuPlayCar","Native job cancellation failed"); }
    }
    @Override public void close() {
        closed=true;
        synchronized(jobs){for(Object job:new ArrayList<>(jobs))cancel(job);jobs.clear();}
    }
}
