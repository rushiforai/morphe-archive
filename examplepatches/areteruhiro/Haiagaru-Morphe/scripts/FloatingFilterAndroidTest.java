package app.morphe.extension.chmate;
import android.app.*;
import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.concurrent.*;

public final class FloatingFilterAndroidTest {
 public static final class Owner {
  final Activity activity;final View root;int reads;
  Owner(Activity a,View v){activity=a;root=v;}
  public Activity getActivity(){return activity;}
  public View getView(){reads++;return root;}
 }
 static int checks;
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);checks++;}
 static Object field(Object o,String n)throws Exception{Field f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 static void event(View b,int action,float x,float y){MotionEvent e=MotionEvent.obtain(SystemClock.uptimeMillis(),SystemClock.uptimeMillis(),action,x,y,0);b.dispatchTouchEvent(e);e.recycle();}
 public static String run(Context app)throws Exception{
  ClassLoader loader=app.getClassLoader();Class<?> f=Class.forName("app.morphe.extension.chmate.FloatingFilterButton",true,loader);
  Method update=f.getDeclaredMethod("update",Object.class);update.setAccessible(true);
  Class<?> h=Class.forName("app.morphe.extension.chmate.Haiagaru",true,loader);
  Activity activity=(Activity)h.getMethod("toolbarActivity",Object.class).invoke(null,new Object[]{null});
  SharedPreferences prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
  String[] keys={"bottomQuickFilterPanel","floatingQuickFilterButton","floatingFilterX","floatingFilterY"};
  java.util.Map<String,?> saved=prefs.getAll();CompletableFuture<String> done=new CompletableFuture<>();Handler main=new Handler(Looper.getMainLooper());
  main.post(()->{
   FrameLayout host=activity.findViewById(android.R.id.content),root=new FrameLayout(activity);Owner owner=new Owner(activity,root);
   Runnable restore=()->{host.removeView(root);SharedPreferences.Editor edit=prefs.edit();for(String k:keys){Object v=saved.get(k);if(v instanceof Boolean)edit.putBoolean(k,(Boolean)v);else if(v instanceof Float)edit.putFloat(k,(Float)v);else edit.remove(k);}edit.commit();};
   try {
    host.addView(root,new FrameLayout.LayoutParams(-1,-1));
    prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],false).commit();update.invoke(null,owner);
    Field mapField=f.getDeclaredField("bindings");mapField.setAccessible(true);java.util.Map map=(java.util.Map)mapField.get(null);
    check(!map.containsKey(root),"OFF creates no binding");prefs.edit().putBoolean(keys[1],true).commit();update.invoke(null,owner);
    Object binding=((java.lang.ref.WeakReference)map.get(root)).get();Button button=(Button)field(binding,"button");
    check(button.getParent()==host,"ON attaches button");
    main.postDelayed(()->{try {
     int before=owner.reads;event(button,0,10,10);event(button,1,10,10);
     check(owner.reads==before+1,"tap calls native filter entry once");
     float x=button.getX(),y=button.getY();int afterTap=owner.reads;event(button,0,10,10);
     main.postDelayed(()->{try {
      event(button,2,-160,-200);event(button,1,-160,-200);
      check(owner.reads==afterTap,"long drag does not open filter");
      check(button.getX()<x&&button.getY()<y,"long drag moves button");
      check(prefs.contains(keys[2])&&prefs.contains(keys[3]),"position saved");float xx=button.getX(),yy=button.getY();
      prefs.edit().putBoolean(keys[1],false).commit();update.invoke(null,owner);check(button.getParent()==null,"OFF removes button");
      prefs.edit().putBoolean(keys[1],true).commit();update.invoke(null,owner);
      Object next=((java.lang.ref.WeakReference)map.get(root)).get();Button replacement=(Button)field(next,"button");
      main.postDelayed(()->{try {
       check(Math.abs(replacement.getX()-xx)<2&&Math.abs(replacement.getY()-yy)<2,"position restored");host.removeView(root);
       check(replacement.getParent()==null&&!map.containsKey(root),"detach cleans button and registry");restore.run();done.complete("PASS "+checks+" floating button checks");
      }catch(Throwable error){restore.run();done.completeExceptionally(error);}},500);
     }catch(Throwable error){restore.run();done.completeExceptionally(error);}},ViewConfiguration.getLongPressTimeout()+200);
    }catch(Throwable error){restore.run();done.completeExceptionally(error);}},500);
   }catch(Throwable error){restore.run();done.completeExceptionally(error);}
  });return done.get(20,TimeUnit.SECONDS);
 }
}
