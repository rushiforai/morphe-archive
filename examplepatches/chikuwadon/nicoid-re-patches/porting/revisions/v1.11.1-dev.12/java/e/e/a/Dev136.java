package e.e.a;
import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Safe Java-only inspection of stale retained playback-return requests. */
public final class Dev136 {
 private Dev136(){}
 public static synchronized void releaseStaleReturn(android.app.Service service){
  if(service==null)return;
  try{
   Class<?> cls=Class.forName("e.e.a.PopupReturn244");
   Field pending=cls.getDeclaredField("pending");pending.setAccessible(true);
   Object request=pending.get(null);
   if(request==null)return;
   Object owner=field(request,"service");
   if(owner!=service||keepPending(request))return;
   Method cancel=cls.getDeclaredMethod("cancel",request.getClass());
   cancel.setAccessible(true);cancel.invoke(null,request);
   Log.w("nicoid-return","Stale retained-return attempt cancelled without smali modification");
  }catch(Exception e){
   Log.w("nicoid-return","Cannot evaluate stale retained-return request",e);
  }
 }

 private static final java.util.WeakHashMap<Object,Long> RETURN_REQUESTS=new java.util.WeakHashMap<>();
 /** A pending return is not success unless its target has been adopted. */
 public static synchronized boolean keepPending(Object pending){
  if(pending==null)return false;
  long now=SystemClock.uptimeMillis();
  Long first=RETURN_REQUESTS.get(pending);
  if(first==null){first=now;RETURN_REQUESTS.put(pending,first);}
  try {
   Object target=field(pending,"target");
   boolean adopted=Boolean.TRUE.equals(field(pending,"adopted"));
   if(adopted&&target instanceof android.app.Activity
      && !((android.app.Activity)target).isFinishing())return true;
  }catch(Exception ignored){}
  if(now-first>=2500L){
   RETURN_REQUESTS.remove(pending);
   Log.w("nicoid-return","Abandoning stale unadopted normal-return request");
   return false;
  }
  return true;
 }

 private static Object field(Object owner,String name)throws Exception{
  Field f=owner.getClass().getDeclaredField(name); f.setAccessible(true);return f.get(owner);
 }
}
