package app.morphe.extension.chmate;
import android.app.Activity;
import android.content.*;
import android.graphics.*;
import android.graphics.drawable.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;

/** Synthetic local image only. Never replaces a pre-existing floating icon. */
public final class FloatingFilterIconAndroidTest {
 public static final class Owner {
  final Activity a;final View root;Owner(Activity a,View root){this.a=a;this.root=root;}
  public Activity getActivity(){return a;} public View getView(){return root;}
 }
 static int checks;
 static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
 static Object field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 static Object call(Class<?> c,String name,Class<?>[] types,Object...args)throws Exception{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);}
 public static String run(Context app)throws Exception{
  if(!app.getPackageName().matches(".*\\.haiagaru\\.(settingsfix191|resumefix226|resumefix242)"))throw new AssertionError("Verification package required");
  checks=0;ClassLoader loader=app.getClassLoader();
  Class<?> icons=Class.forName("app.morphe.extension.chmate.ToolbarIcons",true,loader),floating=Class.forName("app.morphe.extension.chmate.FloatingFilterButton",true,loader),importer=Class.forName("app.morphe.extension.chmate.ToolbarIconsActivity",true,loader);
  int index=(Integer)call(icons,"index",new Class[]{int.class},0x7e000008);
  check(index==7,"new slot appended without moving existing image files");
  Field labels=icons.getDeclaredField("NAMES");labels.setAccessible(true);
  check(((String[])labels.get(null))[index].equals("フローティングのフィルター"),"settings item is labelled separately");
  File image=(File)call(icons,"file",new Class[]{Context.class,int.class},app,index);
  if(image.exists())throw new AssertionError("Existing user floating icon left untouched; isolate fixture first");
  File toolbar=(File)call(icons,"file",new Class[]{Context.class,int.class},app,1);
  byte[] previousToolbar=toolbar.exists()?Files.readAllBytes(toolbar.toPath()):null;
  SharedPreferences prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
  Map<String,?> saved=prefs.getAll();String[] keys={"bottomQuickFilterPanel","floatingQuickFilterButton"};
  Activity activity=(Activity)Class.forName("app.morphe.extension.chmate.Haiagaru",true,loader).getMethod("toolbarActivity",Object.class).invoke(null,new Object[]{null});
  CompletableFuture<String> done=new CompletableFuture<>();Handler main=new Handler(Looper.getMainLooper());
  main.post(()->{
   FrameLayout host=activity.findViewById(android.R.id.content),root=new FrameLayout(activity);Owner owner=new Owner(activity,root);
   Runnable restore=()->{host.removeView(root);if(image.exists()&&!image.delete())throw new AssertionError("Cannot remove synthetic icon");
    try{call(icons,"invalidate",new Class[]{int.class},index);}catch(Exception e){throw new RuntimeException(e);}
    SharedPreferences.Editor edit=prefs.edit();for(String k:keys){Object v=saved.get(k);if(v instanceof Boolean)edit.putBoolean(k,(Boolean)v);else edit.remove(k);}edit.commit();};
   try{
    host.addView(root,new FrameLayout.LayoutParams(-1,-1));prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],true).commit();
    call(floating,"update",new Class[]{Object.class},owner);
    Field mf=floating.getDeclaredField("bindings");mf.setAccessible(true);Map bindings=(Map)mf.get(null);
    Object binding=((java.lang.ref.WeakReference)bindings.get(root)).get();Button button=(Button)field(binding,"button");
    check(button.getCompoundDrawablesRelative()[0]!=null,"default filter glyph displayed");
    check(button.getContentDescription().toString().contains("長押し"),"drag accessibility hint retained");
    Bitmap bitmap=Bitmap.createBitmap(12,8,Bitmap.Config.ARGB_8888);bitmap.eraseColor(Color.RED);ByteArrayOutputStream png=new ByteArrayOutputStream();bitmap.compress(Bitmap.CompressFormat.PNG,100,png);bitmap.recycle();
    call(importer,"importImage",new Class[]{Context.class,int.class,InputStream.class},activity,index,new ByteArrayInputStream(png.toByteArray()));
    main.postDelayed(()->{try{
     Drawable icon=button.getCompoundDrawablesRelative()[0];check(icon instanceof BitmapDrawable,"import updates mounted button without restart");
     Bitmap actual=((BitmapDrawable)icon).getBitmap();check(actual.getWidth()==256&&actual.getPixel(128,128)==Color.RED,"normalized image preserves custom color");
     check(actual.getPixel(128,0)==Color.TRANSPARENT,"rectangular image keeps aspect ratio");
     check(button.getCompoundDrawablePadding()>0&&button.getText().toString().equals("フィルター"),"label and icon spacing retained");
     check(toolbar.exists()==(previousToolbar!=null)&&(!toolbar.exists()||Arrays.equals(previousToolbar,Files.readAllBytes(toolbar.toPath()))),"ordinary toolbar filter image unchanged");
     check(image.delete(),"remove synthetic custom image for reset");call(icons,"invalidate",new Class[]{int.class},index);
     main.postDelayed(()->{try{
      check(!(button.getCompoundDrawablesRelative()[0] instanceof BitmapDrawable),"reset restores default glyph live");
      restore.run();check(button.getParent()==null&&!bindings.containsKey(root),"detach cleans overlay and registry");
      done.complete("PASS "+checks+" floating icon settings/import/live-update/reset checks");
     }catch(Throwable e){try{restore.run();}finally{done.completeExceptionally(e);}}},300);
    }catch(Throwable e){try{restore.run();}finally{done.completeExceptionally(e);}}},300);
   }catch(Throwable e){try{restore.run();}finally{done.completeExceptionally(e);}}
  });
  return done.get(20,TimeUnit.SECONDS);
 }
}
