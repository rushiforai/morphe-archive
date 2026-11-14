package app.haiagaru.tests.nativehistory;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Genuine native toolbar models in isolated packages; no history writes or network operations. */
public final class NativeHistoryTabsInstrumentation extends Instrumentation {
 int checks;void ok(boolean value,String text){if(!value)throw new AssertionError(text);checks++;}
 Field field(Class<?> type,String name)throws Exception{for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
 Method method(Class<?> c,String name,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(name,p);m.setAccessible(true);return m;}
 Object button(Class<?> type,int id,int label,boolean modern)throws Exception{
  Constructor<?> ctor=modern?type.getDeclaredConstructor(int.class,int.class,int.class,int.class,boolean.class,Intent.class,boolean.class):type.getConstructor(int.class,int.class,int.class,int.class,boolean.class);ctor.setAccessible(true);
  return modern?ctor.newInstance(id,0,label,0,true,null,true):ctor.newInstance(id,0,label,0,true);
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();try{
  Context app=getTargetContext();ok(app.getPackageName().matches(".*\\.haiagaru\\.reporter(191|226|242)"),"isolated package");
  SharedPreferences nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);boolean hadTablet=nativePrefs.contains("enableTabletHome2"),tablet=nativePrefs.getBoolean("enableTabletHome2",false);nativePrefs.edit().putBoolean("enableTabletHome2",false).commit();
  Activity activity=startActivitySync(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(700);
  FutureTask<Void> task=new FutureTask<>(()->{run(activity);return null;});runOnMainSync(task);task.get(15,TimeUnit.SECONDS);
  SharedPreferences config=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);String key="showRefreshTargetsInHistoryPopup";boolean had=config.contains(key),previous=config.getBoolean(key,false);config.edit().putBoolean(key,true).commit();
  try{
   FutureTask<Void> open=new FutureTask<>(()->{String v=app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName;Class<?> owner=app.getClassLoader().loadClass(v.contains("191")?"o.r8lambdaXGaXuWPLiVQXXQ4i5OruQyr7jtc":v.contains("226")?"o.TTWebsiteActivity$write":"o.mapOfKeyValueArrays$read");Method entry=null;for(Method m:owner.getDeclaredMethods())if(Modifier.isStatic(m.getModifiers())&&Arrays.equals(m.getParameterTypes(),new Class<?>[]{Activity.class,View.class,int.class}))entry=m;ok(entry!=null,"native popup entry");entry.setAccessible(true);entry.invoke(null,activity,activity.getWindow().getDecorView(),0);return null;});runOnMainSync(open);open.get(15,TimeUnit.SECONDS);Thread.sleep(1200);
   FutureTask<Void> inspect=new FutureTask<>(()->{View root=null;for(View window:android.view.inspector.WindowInspector.getGlobalWindowViews()){View found=window.findViewWithTag(Integer.valueOf(0x48690e11));if(found!=null)root=found;}ok(root!=null,"real stock popup is decorated");Object tabs=root.getTag(0x48690e11);ok(field(tabs.getClass(),"standardTabs").get(tabs)!=null,"real popup uses native tab binding");View bar=(View)field(tabs.getClass(),"nativeTabs").get(tabs);ok(bar.getVisibility()==View.VISIBLE&&bar.getHeight()>0,"real native tabs visible");View fallback=(View)field(tabs.getClass(),"fallbackTabs").get(tabs);ok(fallback.getVisibility()==View.GONE,"custom tab row removed");((android.widget.PopupWindow)field(tabs.getClass(),"popup").get(tabs)).dismiss();return null;});runOnMainSync(inspect);inspect.get(15,TimeUnit.SECONDS);
  }finally{if(had)config.edit().putBoolean(key,previous).commit();else config.edit().remove(key).commit();if(hadTablet)nativePrefs.edit().putBoolean("enableTabletHome2",tablet).commit();else nativePrefs.edit().remove("enableTabletHome2").commit();}
  runOnMainSync(activity::finish);result.putString("result","PASS "+checks+" native history toolbar checks");finish(Activity.RESULT_OK,result);
 }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}}
 void run(Activity activity)throws Exception{
  ClassLoader loader=activity.getClassLoader();String v=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
  boolean old=v.contains("191"),middle=v.contains("226"),modern=!old;
  Class<?> popup=loader.loadClass(old?"o.r8lambdaXGaXuWPLiVQXXQ4i5OruQyr7jtc":middle?"o.TTWebsiteActivity":"o.mapOfKeyValueArrays");
  Class<?> barType=field(popup,old?"o":middle?"r":"h").getType();
  View bar=(View)barType.getConstructor(Context.class,android.util.AttributeSet.class).newInstance(old?activity.getApplicationContext():activity,null);
  int[] ids={android.R.id.copy,android.R.id.cut,android.R.id.paste,android.R.id.selectAll};
  int[] labels={android.R.string.copy,android.R.string.cut,android.R.string.paste,android.R.string.selectAll};
  if(modern){
   Class<?> state=loader.loadClass(middle?"o.PAGBannerAdWrapperListener":"o.zzcF"),spec=loader.loadClass(middle?"o.PAGBannerAdLoadCallback":"o.zzcI");
   List<Object> items=new ArrayList<>();for(int i=0;i<4;i++)items.add(button(spec,ids[i],labels[i],true));
   Object settings;
   if(middle)settings=state.getConstructor(int.class,int.class,List.class).newInstance(80,80,items);
   else{Class<?> gravity=field(state,"e").getType();Object value=field(gravity,"e").get(null);settings=state.getConstructor(gravity,gravity,List.class).newInstance(value,value,items);}
   barType.getMethod("setToolbarState",state).invoke(bar,settings);
   barType.getMethod("setMButtonSize",int.class).invoke(bar,120);
   barType.getMethod("setMTextSize",float.class).invoke(bar,32f);
  }else{
   Method setter=null;for(Method m:barType.getMethods())if(m.getName().equals("setButtons"))setter=m;
   Class<?> model=setter.getParameterTypes()[0];Constructor<?> constructor=null;
   for(Constructor<?> c:model.getConstructors()){Class<?>[] p=c.getParameterTypes();if(p.length==3&&p[0]==int.class&&p[1]==int.class&&p[2].isArray())constructor=c;}
   Class<?> spec=constructor.getParameterTypes()[2].getComponentType();Object array=Array.newInstance(spec,4);
   for(int i=0;i<4;i++)Array.set(array,i,button(spec,ids[i],labels[i],false));
   setter.invoke(bar,constructor.newInstance(80,80,array));
  }
  Class<?> helper=loader.loadClass("app.morphe.extension.chmate.NativeHistoryTabs");int[] selected={-1};
  Constructor<?> constructor=helper.getDeclaredConstructor(View.class,java.util.function.IntConsumer.class);constructor.setAccessible(true);
  Object binding=constructor.newInstance(bar,(java.util.function.IntConsumer)n->selected[0]=n);
  Method configure=method(helper,"configure",boolean.class),select=method(helper,"select",int.class);
  for(boolean enabled:new boolean[]{false,true,false,true}){
   configure.invoke(binding,enabled);ok(field(helper,"targets").getBoolean(binding)==enabled,"target option reflected");
   for(int tab:new int[]{0,2,3,4})select.invoke(binding,tab);
   if(enabled)select.invoke(binding,1);
   bar.measure(View.MeasureSpec.makeMeasureSpec(1080,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(200,View.MeasureSpec.AT_MOST));bar.layout(0,0,1080,bar.getMeasuredHeight());
   ok(bar.getMeasuredHeight()>0,"native toolbar measured");
   View.OnClickListener listener=null;for(Field f:barType.getDeclaredFields())if(f.getType()==View.OnClickListener.class){f.setAccessible(true);if(f.get(bar)!=null)listener=(View.OnClickListener)f.get(bar);}
   View click=new View(activity);click.setId(enabled?0x7e000e12:ids[1]);listener.onClick(click);
   ok(selected[0]==(enabled?1:2),"native action dispatched to correct history tab");
  }
 }
}
