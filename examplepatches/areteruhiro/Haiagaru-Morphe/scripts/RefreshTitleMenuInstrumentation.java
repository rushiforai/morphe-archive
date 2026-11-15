package app.haiagaru.tests.refreshtitle;
import android.app.*;import android.content.*;import android.os.*;import android.graphics.*;import android.view.*;import java.lang.reflect.*;import java.util.concurrent.*;
public final class RefreshTitleMenuInstrumentation extends Instrumentation{
 static String labels(android.view.accessibility.AccessibilityNodeInfo v){
 StringBuilder b=new StringBuilder();if(v.getText()!=null)b.append(v.getText()).append('|');
 for(int i=0;i<v.getChildCount();i++){var child=v.getChild(i);if(child!=null)b.append(labels(child));}
 return b.toString();}
 static android.view.accessibility.AccessibilityNodeInfo find(android.view.accessibility.AccessibilityNodeInfo node,String text){
 if(node==null)return null;
 if(node.isVisibleToUser()&&text.contentEquals(node.getText()==null?"":node.getText()))return node;
 for(int i=0;i<node.getChildCount();i++){var hit=find(node.getChild(i),text);if(hit!=null)return hit;}
 return null;
 }
 static android.view.accessibility.AccessibilityNodeInfo waitFor(UiAutomation ui,String label)throws Exception{
 for(int i=0;i<35;i++){var n=find(ui.getRootInActiveWindow(),label);if(n!=null)return n;Thread.sleep(150);}
 var root=ui.getRootInActiveWindow();throw new AssertionError("Missing "+label+"; "+(root==null?"":labels(root)));
 }
 static void click(android.view.accessibility.AccessibilityNodeInfo n){
 while(n!=null&&!n.isClickable())n=n.getParent();
 if(n==null||!n.performAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK))throw new AssertionError("Cannot click refresh row");
 }
 public void onCreate(Bundle b){super.onCreate(b);start();}
 public void onStart(){Bundle r=new Bundle();try{
 Context c=getTargetContext();String n=c.getPackageName();if(!n.matches(".*\\.reporter(191|226|242)"))throw new AssertionError(n);
 Activity a=startActivitySync(new Intent().setClassName(n,"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
 ClassLoader l=a.getClassLoader();boolean old=n.endsWith("191"),mid=n.endsWith("226");
 SharedPreferences p=c.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
 String[] keys={"titleMenuShowRefresh","titleMenuShowWatch","titleMenuShowAuth"};var saved=p.getAll(); var previousTargets=p.getStringSet("manualRefreshTargets",null);
 try{
 for(String k:keys)p.edit().putBoolean(k,true).commit();
 FutureTask<Void> t=new FutureTask<>(()->{
 Class<?> url=l.loadClass("jp.syoboi.a2chMate.client.BBSUrlInfo");Object info=null;
 for(Method m:url.getDeclaredMethods())if(Modifier.isStatic(m.getModifiers())&&m.getReturnType()==url&&java.util.Arrays.equals(m.getParameterTypes(),new Class[]{String.class})){
   m.setAccessible(true);try{info=m.invoke(null,"https://bbs.eddibb.cc/test/read.cgi/liveedge/1899999999/");}catch(Exception ignored){}if(info!=null)break;
 }
 if(info==null){
 Object u=Class.forName("sun.misc.Unsafe").getDeclaredField("theUnsafe");((Field)u).setAccessible(true);
 info=Class.forName("sun.misc.Unsafe").getMethod("allocateInstance",Class.class).invoke(((Field)u).get(null),url);
 for(String[] field:new String[][]{{old?"i":mid?"g":"f","bbs.eddibb.cc"},{old?"b":mid?"f":"g","liveedge"}}){Field f=url.getDeclaredField(field[0]);f.setAccessible(true);f.set(info,field[1]);}
 Field f=url.getDeclaredField(mid?"c":"e");f.setAccessible(true);f.set(info,1899999999L);
 }

 Class<?> ft=l.loadClass("androidx.fragment.app.FragmentManager");
 Object fm=null;for(Method m:a.getClass().getMethods())if(m.getParameterCount()==0&&m.getReturnType()==ft){fm=m.invoke(a);if(fm!=null)break;}if(fm==null)throw new AssertionError("native fragment manager");
 String owner=old?"o.q1aExternalSyntheticLambda2":mid?"o.getDislikeManager$RemoteActionCompatParcelizer":"o.zzbbs";
 if(old||mid)l.loadClass(owner).getDeclaredMethod(old?"c":"b",ft,url,String.class,long.class).invoke(null,fm,info,"Haiagaru test",0L);
 else l.loadClass(owner).getDeclaredMethod("e",ft,url,String.class,Long.class,int.class,boolean.class).invoke(null,fm,info,"Haiagaru test",null,0,false);
 return null;});
 runOnMainSync(t);t.get(15,TimeUnit.SECONDS);waitForIdleSync();
 var ui=getUiAutomation();
 android.view.accessibility.AccessibilityNodeInfo item=waitFor(ui,"□ 更新対象に含む");
 click(item);
 item=waitFor(ui,"☑ 更新対象から外す");
 click(item);
 waitFor(ui,"□ 更新対象に含む");
 r.putString("result","PASS native refresh label and check toggle twice "+n);
 finish(Activity.RESULT_OK,r);
 }finally{var restore=p.edit();if(previousTargets==null)restore.remove("manualRefreshTargets");else restore.putStringSet("manualRefreshTargets",previousTargets);restore.commit();for(String k:keys){var e=p.edit();if(saved.get(k) instanceof Boolean)e.putBoolean(k,(Boolean)saved.get(k));else e.remove(k);e.commit();}}
 }catch(Throwable e){r.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,r);}}
}



