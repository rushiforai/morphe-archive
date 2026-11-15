package app.haiagaru.tests.imagescale;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.view.accessibility.AccessibilityNodeInfo;import android.widget.*;
import java.lang.reflect.*;import java.util.concurrent.*;

/** Native zoom settling and real fallback popup on isolated 191/226; no media network. */
public final class ImageScaleControlsInstrumentation extends Instrumentation {
 int checks;Activity activity;ClassLoader loader;boolean old;View canvas;SharedPreferences prefs;boolean hadMenu,hadEnabled,oldMenu,oldEnabled;
 void ok(boolean v,String s){if(!v)throw new AssertionError(s);checks++;}
 Field field(Class<?> c,String n)throws Exception{for(;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(n);}
 <T>T main(Callable<T> c)throws Exception{FutureTask<T> t=new FutureTask<>(c);runOnMainSync(t);return t.get(15,TimeUnit.SECONDS);}
 AccessibilityNodeInfo find(AccessibilityNodeInfo n,String s){if(n==null)return null;if(n.getText()!=null&&s.contentEquals(n.getText())&&n.isVisibleToUser())return n;for(int i=0;i<n.getChildCount();i++){AccessibilityNodeInfo f=find(n.getChild(i),s);if(f!=null)return f;}return null;}
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" native zoom/rotation popup checks; media requests=0");finish(Activity.RESULT_OK,out);}catch(Throwable e){out.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,out);}}
 void test()throws Exception{
  Context app=getTargetContext();ok(app.getPackageName().matches(".*\\.reporter(191|226)"),"isolated legacy viewer only");old=app.getPackageName().endsWith("191");loader=app.getClassLoader();prefs=app.getSharedPreferences("haiagaru_video_viewer",0);
  Class<?> video=loader.loadClass("app.morphe.extension.chmate.VideoViewerSettings");Method pf=video.getDeclaredMethod("prefs",Context.class);pf.setAccessible(true);prefs=(SharedPreferences)pf.invoke(null,app);
  String menuKey="imageViewerRotationInMenu";hadMenu=prefs.contains(menuKey);oldMenu=prefs.getBoolean(menuKey,true);
  SharedPreferences config=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);hadEnabled=config.contains("imageViewerRotationButton");oldEnabled=config.getBoolean("imageViewerRotationButton",true);
  config.edit().putBoolean("imageViewerRotationButton",true).commit();
  activity=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.ToolbarIconsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(1000);
  try{
   main(()->{
    Context themed=new ContextThemeWrapper(activity,android.R.style.Theme_Material);
    Class<?> type=loader.loadClass(old?"o.qhbExternalSyntheticLambda0":"o.TTVideoLandingPageActivity4");
    canvas=(View)type.getConstructor(Context.class,android.util.AttributeSet.class).newInstance(themed,null);canvas.layout(0,0,1000,1000);
    field(type,old?"B":"C").setFloat(canvas,1f);
    field(type,old?"l":"o").setInt(canvas,1000);field(type,old?"m":"n").setInt(canvas,1000);field(type,old?"E":"F").setInt(canvas,1000);field(type,"k").setInt(canvas,1000);
    Method set=type.getMethod("setPosition",float.class,float.class,float.class,boolean.class);Field scale=field(type,old?"C":"D");
    for(float value:new float[]{.25f,.5f,.75f,1f,1.5f,2f,4f}){set.invoke(canvas,0f,0f,value,false);ok(Math.abs(scale.getFloat(canvas)-value)<.001f,"native release keeps scale "+value);}
    set.invoke(canvas,0f,0f,0f,false);ok(scale.getFloat(canvas)>0,"invalid zero keeps positive native scale");set.invoke(canvas,0f,0f,100f,false);ok(scale.getFloat(canvas)<=50f,"native maximum remains bounded");

    FrameLayout root=new FrameLayout(activity);root.addView(canvas,new FrameLayout.LayoutParams(500,500));TextView counter=new TextView(activity);counter.setText("1 / 2");root.addView(counter);activity.setContentView(root);
    prefs.edit().putBoolean(menuKey,true).commit();Class<?> rotation=loader.loadClass("app.morphe.extension.chmate.ImageViewerRotationButton");rotation.getMethod("install",Activity.class,String.class).invoke(null,activity,type.getName());return null;
   });Thread.sleep(500);
   main(()->{Class<?> type=canvas.getClass();type.getMethod("setPosition",float.class,float.class,float.class,boolean.class).invoke(canvas,0f,0f,.5f,false);long now=SystemClock.uptimeMillis();MotionEvent up=MotionEvent.obtain(now-100,now,MotionEvent.ACTION_UP,250,250,0);try{type.getMethod("onTouchEvent",MotionEvent.class).invoke(canvas,up);}finally{up.recycle();}return null;});Thread.sleep(500);
   main(()->{ok(Math.abs(field(canvas.getClass(),old?"C":"D").getFloat(canvas)-.5f)<.001f,"native ACTION_UP preserves half scale after settling");View button=activity.findViewById(0x48415254);ok(button!=null&&button.isShown(),"fallback shown when native overflow missing");ok("︙".contentEquals(((TextView)button).getText()),"fallback uses overflow glyph");button.performClick();return null;});Thread.sleep(350);
   boolean popup=false;for(int i=0;i<30;i++){if(find(getUiAutomation().getRootInActiveWindow(),"画像を右に回転")!=null){popup=true;break;}Thread.sleep(100);}if(!popup){android.graphics.Bitmap shot=getUiAutomation().takeScreenshot();if(shot!=null)try(java.io.FileOutputStream out=new java.io.FileOutputStream(new java.io.File(app.getExternalFilesDir(null),"rotation-popup-test.png"))){shot.compress(android.graphics.Bitmap.CompressFormat.PNG,100,out);}}ok(popup,"real popup exposes rotation action");sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);Thread.sleep(250);
   main(()->{View button=activity.findViewById(0x48415254);prefs.edit().putBoolean(menuKey,false).commit();button.getRootView().invalidate();return null;});Thread.sleep(350);
   main(()->{View button=activity.findViewById(0x48415254);ok(button.isShown()&&"⟳".contentEquals(((TextView)button).getText()),"OFF restores direct rotation control");return null;});
  }finally{if(activity!=null)main(()->{activity.finish();return null;});if(hadEnabled)config.edit().putBoolean("imageViewerRotationButton",oldEnabled).commit();else config.edit().remove("imageViewerRotationButton").commit();if(hadMenu)prefs.edit().putBoolean(menuKey,oldMenu).commit();else prefs.edit().remove(menuKey).commit();}
 }
}
