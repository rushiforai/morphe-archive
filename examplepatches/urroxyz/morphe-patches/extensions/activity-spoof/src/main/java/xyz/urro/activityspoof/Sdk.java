package xyz.urro.activityspoof;
import android.content.*;
import android.os.*;
import java.lang.reflect.*;
import java.util.*;

/** Use the receiving APK's SDK. No Play services classes are merged by this extension. */
final class Sdk {
 static final String SAMPLE="com.google.android.location.internal.EXTRA_ACTIVITY_RESULT";
 static final String TRANSITION="com.google.android.location.internal.EXTRA_ACTIVITY_TRANSITION_RESULT";
 private static Class<?> type(String name)throws Exception{return Class.forName(name,true,ReceiverRuntime.context().getClassLoader());}
 static Object call(Object o,String name)throws Exception{return o.getClass().getMethod(name).invoke(o);}
 static Object sample(int activity,int confidence)throws Exception{
  Object detected=type("com.google.android.gms.location.DetectedActivity").getConstructor(int.class,int.class).newInstance(activity,confidence);
  return type("com.google.android.gms.location.ActivityRecognitionResult").getConstructor(List.class,long.class,long.class)
   .newInstance(Collections.singletonList(detected),System.currentTimeMillis(),SystemClock.elapsedRealtime());
 }
 static Object transitions(List<int[]> events)throws Exception{
  List<Object> result=new ArrayList<>();long time=SystemClock.elapsedRealtimeNanos();
  Class<?> event=type("com.google.android.gms.location.ActivityTransitionEvent");
  for(int[] e:events)result.add(event.getConstructor(int.class,int.class,long.class).newInstance(e[0],e[1],time++));
  return type("com.google.android.gms.location.ActivityTransitionResult").getConstructor(List.class).newInstance(result);
 }
 static Object extract(Intent intent,boolean transition)throws Exception{
  return type("com.google.android.gms.location."+(transition?"ActivityTransitionResult":"ActivityRecognitionResult"))
   .getMethod("extractResult",Intent.class).invoke(null,intent);
 }
 static boolean has(Intent intent,boolean transition)throws Exception{
  return (Boolean)type("com.google.android.gms.location."+(transition?"ActivityTransitionResult":"ActivityRecognitionResult"))
   .getMethod("hasResult",Intent.class).invoke(null,intent);
 }
 static Intent payload(Object result,boolean transition)throws Exception{
  Intent intent=new Intent();Parcel parcel=Parcel.obtain();
  try{((Parcelable)result).writeToParcel(parcel,0);intent.putExtra(transition?TRANSITION:SAMPLE,parcel.marshall());}
  finally{parcel.recycle();}
  intent.putExtra(Wire.SYNTHETIC,true);return intent;
 }
 static int[] filters(Object request)throws Exception{
  // Prefer an accessor when available; otherwise identify the SDK list by its element type.
  List<?> transitions=null;
  for(Method method:request.getClass().getMethods())if(method.getParameterTypes().length==0&&List.class.isAssignableFrom(method.getReturnType())){
   Object value=method.invoke(request);
   if(value instanceof List){List<?> list=(List<?>)value;if(!list.isEmpty()&&list.get(0).getClass().getName().equals("com.google.android.gms.location.ActivityTransition")){transitions=list;break;}}
  }
  if(transitions==null)for(Field field:request.getClass().getDeclaredFields()){
   if(java.lang.reflect.Modifier.isStatic(field.getModifiers())||!List.class.isAssignableFrom(field.getType()))continue;
   field.setAccessible(true);Object value=field.get(request);
   if(value instanceof List){List<?> list=(List<?>)value;if(!list.isEmpty()&&list.get(0).getClass().getName().equals("com.google.android.gms.location.ActivityTransition")){transitions=list;break;}}
  }
  if(transitions==null)throw new IllegalArgumentException("Unsupported transition request layout");
  int[] result=new int[transitions.size()*2];int i=0;
  for(Object t:transitions){result[i++]=((Number)call(t,"getActivityType")).intValue();result[i++]=((Number)call(t,"getTransitionType")).intValue();}
  return result;
 }
 static int mostProbable(Object sample)throws Exception{return ((Number)call(call(sample,"getMostProbableActivity"),"getType")).intValue();}
}
