package xyz.urro.activityspoof;
import android.app.PendingIntent;
import android.content.Intent;
import java.lang.reflect.*;

/** Static call-site adapters. The original SDK implementations remain untouched. */
public final class ApiHooks {
 private ApiHooks(){}
 private static Class<?> type(String name)throws ClassNotFoundException{return Class.forName(name,true,ReceiverRuntime.context().getClassLoader());}
 private static Object invoke(Object target,String api,String name,Class<?>[] types,Object... args){
  try{return type(api).getMethod(name,types).invoke(target,args);}
  catch(InvocationTargetException e){Throwable cause=e.getCause();if(cause instanceof RuntimeException)throw (RuntimeException)cause;throw new IllegalStateException(cause);}
  catch(ReflectiveOperationException e){throw new IllegalStateException("Unsupported Activity Recognition SDK",e);}
 }
 private static Object track(Object task,PendingIntent p,boolean transition,boolean remove,long interval,int[] filters){
  long token=ReceiverRuntime.pending(p,transition);
  try{
   Class<?> listener=type("com.google.android.gms.tasks.OnSuccessListener");
   Object proxy=Proxy.newProxyInstance(listener.getClassLoader(),new Class<?>[]{listener},(o,m,args)->{
    if(m.getName().equals("onSuccess"))ReceiverRuntime.complete(p,transition,remove,token,interval,filters);
    if(m.getName().equals("hashCode"))return System.identityHashCode(o);
    if(m.getName().equals("equals"))return o==args[0];
    if(m.getName().equals("toString"))return "Activity subscription observer";
    return null;
   });
   type("com.google.android.gms.tasks.Task").getMethod("addOnSuccessListener",listener).invoke(task,proxy);
  }catch(Exception e){Trace.write(ReceiverRuntime.context(),"registration_hook_failed",e.getClass().getSimpleName());}
  return task;
 }
 public static Object samplingRequest(Object client,long interval,PendingIntent callback){
  Object task=invoke(client,"com.google.android.gms.location.ActivityRecognitionClient","requestActivityUpdates",new Class<?>[]{long.class,PendingIntent.class},interval,callback);
  return track(task,callback,false,false,interval,null);
 }
 public static Object transitionRequest(Object client,Object request,PendingIntent callback){
  try{
   Object task=invoke(client,"com.google.android.gms.location.ActivityRecognitionClient","requestActivityTransitionUpdates",new Class<?>[]{type("com.google.android.gms.location.ActivityTransitionRequest"),PendingIntent.class},request,callback);
   int[] filters;
   try{filters=Sdk.filters(request);}catch(Exception e){Trace.write(ReceiverRuntime.context(),"filters_unsupported",e.getClass().getSimpleName());return task;}
   return track(task,callback,true,false,0,filters);
  }catch(ClassNotFoundException e){throw new IllegalStateException(e);}
 }
 public static Object samplingRemove(Object client,PendingIntent callback){return track(invoke(client,"com.google.android.gms.location.ActivityRecognitionClient","removeActivityUpdates",new Class<?>[]{PendingIntent.class},callback),callback,false,true,0,null);}
 public static Object transitionRemove(Object client,PendingIntent callback){return track(invoke(client,"com.google.android.gms.location.ActivityRecognitionClient","removeActivityTransitionUpdates",new Class<?>[]{PendingIntent.class},callback),callback,true,true,0,null);}
 private static Object legacy(Object api,Object client,PendingIntent p,long interval,boolean remove){
  try{
   Object result=remove?invoke(api,"com.google.android.gms.location.ActivityRecognitionApi","removeActivityUpdates",new Class<?>[]{type("com.google.android.gms.common.api.GoogleApiClient"),PendingIntent.class},client,p)
    :invoke(api,"com.google.android.gms.location.ActivityRecognitionApi","requestActivityUpdates",new Class<?>[]{type("com.google.android.gms.common.api.GoogleApiClient"),long.class,PendingIntent.class},client,interval,p);
   long token=ReceiverRuntime.pending(p,false);
   Class<?> listener=type("com.google.android.gms.common.api.PendingResult$StatusListener");
   Object proxy=Proxy.newProxyInstance(listener.getClassLoader(),new Class<?>[]{listener},(o,m,args)->{
    if(m.getName().equals("onComplete")&&(Boolean)type("com.google.android.gms.common.api.Status").getMethod("isSuccess").invoke(args[0]))ReceiverRuntime.complete(p,false,remove,token,interval,null);
    if(m.getName().equals("hashCode"))return System.identityHashCode(o);
    if(m.getName().equals("equals"))return o==args[0];
    return null;
   });
   type("com.google.android.gms.common.api.PendingResult").getMethod("addStatusListener",listener).invoke(result,proxy);return result;
  }catch(ReflectiveOperationException e){throw new IllegalStateException(e);}
 }
 public static Object legacyRequest(Object api,Object client,long interval,PendingIntent callback){return legacy(api,client,callback,interval,false);}
 public static Object legacyRemove(Object api,Object client,PendingIntent callback){return legacy(api,client,callback,0,true);}
 public static boolean samplingHas(Intent intent){try{return Sdk.has(intent,false);}catch(Exception e){return false;}}
 public static boolean transitionHas(Intent intent){
  try{
   boolean present=Sdk.has(intent,true);
   if(present&&!intent.getBooleanExtra(Wire.SYNTHETIC,false))ReceiverRuntime.realTransitions(Sdk.extract(intent,true));
   // Suppress contradictory physical transitions while the virtual classification is active.
   return present&&(!ReceiverRuntime.active()||intent.getBooleanExtra(Wire.SYNTHETIC,false));
  }catch(Exception e){return false;}
 }
 public static Object samplingResult(Intent intent){
  try{
   Object genuine=Sdk.extract(intent,false);
   if(intent!=null&&intent.getBooleanExtra(Wire.SYNTHETIC,false))return genuine;
   return ReceiverRuntime.sampleOverride(genuine);
  }catch(Exception e){Trace.write(ReceiverRuntime.context(),"sample_parse_failed",e.getClass().getSimpleName());return null;}
 }
 public static Object transitionResult(Intent intent){
  try{return transitionHas(intent)?Sdk.extract(intent,true):null;}
  catch(Exception e){Trace.write(ReceiverRuntime.context(),"transition_parse_failed",e.getClass().getSimpleName());return null;}
 }
}
