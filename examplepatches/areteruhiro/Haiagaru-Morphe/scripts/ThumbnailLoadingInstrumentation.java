package app.haiagaru.tests.thumbnail242;

import android.app.*;
import android.content.*;
import android.graphics.*;
import android.os.*;
import android.view.*;
import java.lang.reflect.*;
import java.util.concurrent.*;

/** Isolated native thumbnail regression, without ART hooks/network. */
public final class ThumbnailLoadingInstrumentation extends Instrumentation {
 private boolean baseline; private int checks;
 private Field field(Class<?> c,String name)throws Exception{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}
 private void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 @Override public void onCreate(Bundle args){super.onCreate(args);baseline=args!=null&&"true".equals(args.getString("baseline"));start();}
 @Override public void onStart(){Bundle result=new Bundle();try{
  Context app=getTargetContext();Intent launch=new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity");
  launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);Activity activity=startActivitySync(launch);waitForIdleSync();
  FutureTask<Void> test=new FutureTask<>(()->{runChecks(activity);return null;});runOnMainSync(test);test.get(15,TimeUnit.SECONDS);
  result.putString("result","PASS "+checks+" native thumbnail checks; baseline="+baseline);finish(Activity.RESULT_OK,result);
 }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}}
 private void runChecks(Activity activity)throws Exception{
  checkSearchBack(activity);
  checkPlaybackOverlay(activity);
  if(baseline)return;
  if(!activity.getPackageName().endsWith("242")){runLegacy(activity);return;}
  ClassLoader loader=activity.getClassLoader();Class<?> image=loader.loadClass("o.zzbes"),bitmap=loader.loadClass("o.VN22"),state=loader.loadClass("o.zzbes$write");
  Object view=image.getConstructor(Context.class).newInstance(activity);
  Bitmap pixels=Bitmap.createBitmap(16,16,Bitmap.Config.ARGB_8888);pixels.eraseColor(Color.GREEN);
  String url="https://example.invalid/haiagaru-thumbnail.png";
  Object decoded=bitmap.getConstructor(Bitmap.class,String.class).newInstance(pixels,url);
  Field held=field(image,"a"),byUser=field(image,"mDownloadByUser");
  // onPreExecute only needs its owning ImageView; the task/URL network path is never run.
  Class<?> callback=loader.loadClass("o.zzbes$_init_lambda1"),unsafeClass=Class.forName("sun.misc.Unsafe");
  Object unsafe=field(unsafeClass,"theUnsafe").get(null);
  Object cb=unsafeClass.getMethod("allocateInstance",Class.class).invoke(unsafe,callback);field(callback,"b").set(cb,view);
  Method before=callback.getDeclaredMethod("e");before.setAccessible(true);
  held.set(view,decoded);byUser.setBoolean(view,false);before.invoke(cb);
  check(baseline?held.get(view)==null:held.get(view)==decoded,"automatic onPreExecute bitmap retention");
  if(baseline)return;
  for(int i=0;i<100;i++){before.invoke(cb);check(held.get(view)==decoded,"repeated loading notification "+i);}
  check(!pixels.isRecycled()&&pixels.getPixel(0,0)==Color.GREEN,"decoded pixels retained through loading notifications");
  byUser.setBoolean(view,true);before.invoke(cb);check(held.get(view)==null,"manual retry clears old bitmap");
  byUser.setBoolean(view,false);before.invoke(cb);check(held.get(view)==null,"initial load remains native");
  Method setState=image.getDeclaredMethod("c",state);setState.setAccessible(true);
  held.set(view,decoded);Object error=loader.loadClass("o.zzbes$write$read").getConstructor(String.class).newInstance("fixture error");
  setState.invoke(view,error);check(held.get(view)==null,"completed error clears old bitmap");
  held.set(view,decoded);image.getMethod("setImageUrl",String.class).invoke(view,url+"?changed");
  check(held.get(view)==null,"changed URL clears old bitmap");
 }
 private Object allocate(Class<?> type)throws Exception{
  Class<?> c=Class.forName("sun.misc.Unsafe");Object u=field(c,"theUnsafe").get(null);
  return c.getMethod("allocateInstance",Class.class).invoke(u,type);
 }
 private Field inherited(Class<?> type,String name)throws Exception{
  for(Class<?> c=type;c!=null;c=c.getSuperclass())try{return field(c,name);}catch(NoSuchFieldException ignored){}
  throw new NoSuchFieldException(name);
 }
 private void checkSearchBack(Activity activity)throws Exception{
  boolean old=activity.getPackageName().endsWith("191");if(activity.getPackageName().endsWith("226"))return;
  ClassLoader l=activity.getClassLoader();Class<?> type=l.loadClass(old?"o.pa":"jp.syoboi.a2chMate.ui.reslist.ResListFragment");Object fragment=type.getConstructor().newInstance();
  Class<?> base=l.loadClass(old?"o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM":"jp.syoboi.a2chMate.fragment.RoidonListFragment");
  Field modelField=field(base,old?"p":"f");Object model=allocate(modelField.getType());modelField.set(fragment,model);
  Object[] showing={Boolean.TRUE};
  if(old){Field input=inherited(model.getClass(),"c");input.set(model,l.loadClass("o.doHash").getConstructor(Object.class).newInstance(Boolean.TRUE));}
  else {
   Field read=inherited(model.getClass(),"g"),write=inherited(model.getClass(),"d");
   Object flow=java.lang.reflect.Proxy.newProxyInstance(l,new Class<?>[]{write.getType()},(p,m,a)->{
    if(m.getName().equals("d")&&m.getParameterTypes().length==0)return showing[0];
    if(m.getName().equals("b")&&a!=null&&a.length==1){showing[0]=a[0];return null;}return null;
   });read.set(model,flow);write.set(model,flow);
   Field nav=field(type,"S");Object controller=allocate(l.loadClass("o.zzaee"));nav.set(fragment,java.lang.reflect.Proxy.newProxyInstance(l,new Class<?>[]{nav.getType()},(p,m,a)->controller));
   Field vm=field(type,"t");Object responseModel=allocate(l.loadClass("jp.syoboi.a2chMate.ui.reslist.ResListFragmentViewModel"));
   Object closed=field(l.loadClass("o.zzaef$ComponentActivity"),"INSTANCE").get(null);Field mode=field(responseModel.getClass(),"t");mode.set(responseModel,java.lang.reflect.Proxy.newProxyInstance(l,new Class<?>[]{mode.getType()},(p,m,a)->closed));
   vm.set(fragment,java.lang.reflect.Proxy.newProxyInstance(l,new Class<?>[]{vm.getType()},(p,m,a)->responseModel));
  }
  Method update=type.getDeclaredMethod(old?"A":"q");update.setAccessible(true);update.invoke(fragment);
  Object callback=field(base,old?"t":"l").get(fragment);Field enabled=field(l.loadClass(old?"o.setTransitioning":"o.getNavigationEventDispatcher"),old?"b":"d");
  check(enabled.getBoolean(callback)!=baseline,"search input Back callback enabled without a query or hit bar");
  if(old){Field input=inherited(model.getClass(),"c");Object flow=input.get(model);flow.getClass().getMethod("a",Object.class).invoke(flow,Boolean.FALSE);}
  else {check(Boolean.TRUE.equals(type.getMethod("c").invoke(fragment)),"native Back consumes input close");check(Boolean.FALSE.equals(showing[0]),"native Back closes input state");}
  update.invoke(fragment);check(!enabled.getBoolean(callback),"search input Back releases navigation after closing");
 }
 private void checkPlaybackOverlay(Activity activity)throws Exception{
  boolean old=activity.getPackageName().endsWith("191"),mid=activity.getPackageName().endsWith("226");ClassLoader l=activity.getClassLoader();
  Class<?> image=l.loadClass(old?"o.qaf":mid?"o.TTRewardExpressVideoActivity":"o.zzbes"),bitmap=l.loadClass(old?"o.onAdRequestStarted":mid?"o.buildIfSupporteddefault":"o.VN22");
  Context context=old?new android.view.ContextThemeWrapper(activity.getApplicationContext(),android.R.style.Theme_Material):activity;
  Object view=image.getConstructor(Context.class).newInstance(context);Field held=field(image,old?"c":mid?"b":"a"),url=field(image,old?"f":mid?"P":"u"),res=field(image,old?"I":mid?"H":"mOverlayResId");
  int gif=old?2131231093:mid?2131231171:2131231061,video=gif+2;String address="https://example.invalid/animation.gif";
  held.set(view,decoded(bitmap,address));url.set(view,address);image.getMethod("setAutoLoad",boolean.class).invoke(view,false);
  Method bind=image.getMethod(baseline?"setOverlayDrawable":"haiagaruBindOverlay",android.graphics.drawable.Drawable.class);
  image.getMethod("setOverlayResource",int.class).invoke(view,gif);bind.invoke(view,new Object[]{null});
  check(res.getInt(view)==(baseline?0:gif),"same-URL GIF marker retention");if(baseline)return;
  for(int i=0;i<5;i++){bind.invoke(view,new Object[]{null});check(res.getInt(view)==gif,"repeated GIF marker retention");}
  image.getMethod("haiagaruOverlayUrl",String.class).invoke(view,address);check(res.getInt(view)==gif,"same URL keeps GIF marker");
  image.getMethod("haiagaruOverlayUrl",String.class).invoke(view,"https://example.invalid/still.png");check(res.getInt(view)==0,"new still URL clears old GIF marker");
  image.getMethod("setOverlayResource",int.class).invoke(view,video);image.getMethod("haiagaruOverlayUrl",String.class).invoke(view,"https://example.invalid/movie.mp4");check(res.getInt(view)==video,"new URL preserves native video marker");
  bind.invoke(view,new Object[]{null});check(res.getInt(view)==0,"ordinary overlay clearing remains native");
  held.set(view,null);image.getMethod("setOverlayResource",int.class).invoke(view,gif);bind.invoke(view,new Object[]{null});check(res.getInt(view)==0,"unloaded image clears GIF marker");
 }
 private Object decoded(Class<?> type,String url)throws Exception{
  Bitmap b=Bitmap.createBitmap(16,16,Bitmap.Config.ARGB_8888);b.eraseColor(Color.GREEN);
  return type.getConstructor(Bitmap.class,String.class).newInstance(b,url);
 }
 private void runLegacy(Activity activity)throws Exception{
  boolean old=activity.getPackageName().endsWith("191");ClassLoader loader=activity.getClassLoader();
  Class<?> image=loader.loadClass(old?"o.qaf":"o.TTRewardExpressVideoActivity"),bitmap=loader.loadClass(old?"o.onAdRequestStarted":"o.buildIfSupporteddefault");
  Context themed=old?new android.view.ContextThemeWrapper(activity.getApplicationContext(),android.R.style.Theme_Material):activity;
  Object view=image.getConstructor(Context.class).newInstance(themed);Field held=field(image,old?"c":"b");
  String url="https://example.invalid/thumbnail.png";Object picture=decoded(bitmap,url);held.set(view,picture);
  Method retry=image.getDeclaredMethod(old?"b":"d",boolean.class);retry.setAccessible(true);retry.invoke(view,false);
  check(baseline?held.get(view)==null:held.get(view)==picture,"automatic legacy requery bitmap retention");
  if(baseline){checkLegacyBind(loader,view,image,bitmap,held,url,old);return;}
  View canvasView=(View)view;canvasView.layout(0,0,120,120);
  Bitmap firstFrame=Bitmap.createBitmap(120,120,Bitmap.Config.ARGB_8888);canvasView.draw(new Canvas(firstFrame));
  check(firstFrame.getPixel(60,60)==Color.GREEN,"native thumbnail renders decoded image");
  for(int i=0;i<100;i++){retry.invoke(view,false);check(held.get(view)==picture,"repeated legacy requery "+i);}
  Bitmap lastFrame=Bitmap.createBitmap(120,120,Bitmap.Config.ARGB_8888);canvasView.draw(new Canvas(lastFrame));
  check(firstFrame.sameAs(lastFrame),"native thumbnail pixels unchanged after automatic requery");firstFrame.recycle();lastFrame.recycle();
  Field pixels=null;for(Field f:bitmap.getDeclaredFields())if(f.getType()==Bitmap[].class)pixels=f;
  if(pixels==null)throw new AssertionError("native bitmap pixels missing");pixels.setAccessible(true);
  Bitmap b=((Bitmap[])pixels.get(picture))[0];check(!b.isRecycled()&&b.getPixel(0,0)==Color.GREEN,"legacy decoded pixels retained");
  retry.invoke(view,true);check(held.get(view)==null,"legacy manual retry clears");
  retry.invoke(view,false);check(held.get(view)==null,"legacy initial load unchanged");
  held.set(view,decoded(bitmap,url));image.getMethod("setImageUrl",String.class).invoke(view,(String)null);
  check(held.get(view)==null,"legacy URL change clears");
  // Deliver an actual native completed error result; it must replace the old picture.
  field(image,old?"f":"P").set(view,url);
  Class<?> result=loader.loadClass(image.getName()+"$read"),meta=loader.loadClass(old?"o.r8lambdaGfBO6rYJt3TE6iaAn62xGRkuUwg":"o.GNkKjv");
  Object error=result.getConstructor().newInstance();Class<?> uc=Class.forName("sun.misc.Unsafe");Object unsafe=field(uc,"theUnsafe").get(null);
  Object status=uc.getMethod("allocateInstance",Class.class).invoke(unsafe,meta);field(meta,old?"g":"f").setInt(status,7);field(result,old?"e":"c").set(error,status);
  held.set(view,decoded(bitmap,url));Method completed=image.getDeclaredMethod(old?"d":"c",result);completed.setAccessible(true);completed.invoke(view,error);
  check(held.get(view)==null,"legacy completed error clears");
  checkLegacyBind(loader,view,image,bitmap,held,url,old);
 }
 private void checkLegacyBind(ClassLoader loader,Object view,Class<?> image,Class<?> bitmap,Field held,String url,boolean old)throws Exception{
  Class<?> uc=Class.forName("sun.misc.Unsafe");Object unsafe=field(uc,"theUnsafe").get(null);Method allocate=uc.getMethod("allocateInstance",Class.class);
  Class<?> row=loader.loadClass(old?"o.qrExternalSyntheticLambda2":"o.setCornerBottomRightRadius");Object holder=allocate.invoke(unsafe,row);
  Field settings=field(row,old?"G":"D"),density=field(row,old?"q":"H");
  Object size=allocate.invoke(unsafe,settings.getType()),scale=field(image,old?"S":"R").get(view);field(size.getClass(),"t").setInt(size,40);
  settings.set(holder,size);density.set(holder,scale);field(row,old?"f":"e").set(holder,new java.util.ArrayList<>(java.util.Collections.singletonList(view)));
  image.getMethod("setAutoLoad",boolean.class).invoke(view,false);field(image,old?"f":"P").set(view,url);Object picture=decoded(bitmap,url);held.set(view,picture);
  Method bind=row.getDeclaredMethod(baseline?(old?"b":"setImageLinks2"):"haiagaruBindImageLinks",old?new Class<?>[]{CharSequence[].class,boolean.class}:new Class<?>[]{CharSequence[].class,boolean.class,boolean.class});bind.setAccessible(true);
  if(old)bind.invoke(holder,new CharSequence[]{url},false);else bind.invoke(holder,new CharSequence[]{url},true,false);
  check(baseline?held.get(view)==null:held.get(view)==picture,"native same-URL row binding bitmap retention");
  if(!baseline){Method explicit=row.getDeclaredMethod(old?"b":"setImageLinks2",old?new Class<?>[]{CharSequence[].class,boolean.class}:new Class<?>[]{CharSequence[].class,boolean.class,boolean.class});explicit.setAccessible(true);if(old)explicit.invoke(holder,new CharSequence[]{url},false);else explicit.invoke(holder,new CharSequence[]{url},true,false);check(held.get(view)==null,"explicit native row reload preserved");}
 }
}
