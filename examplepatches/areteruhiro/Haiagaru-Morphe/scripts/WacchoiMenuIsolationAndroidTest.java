package app.morphe.extension.chmate;
import android.app.Activity;
import android.content.*;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.*;
/** Real menu creation, synthetic selected response; no actions are dispatched. */
public final class WacchoiMenuIsolationAndroidTest {
 public static final class Owner {public Object W;final Activity activity;Owner(Activity a,Object board){activity=a;W=board;}public Activity getActivity(){return activity;}}
 public static final class Response {public String n="名無しさん (ﾜｯﾁｮｲ abcd-EFGH)",q="";}
 static void invoke(Class<?> c,String name,Owner owner,Menu menu)throws Exception{c.getMethod(name,Object.class,Object.class,Object.class).invoke(null,owner,menu,new Response());}
 public static String run(Context app)throws Exception{
  ClassLoader loader=app.getClassLoader();Class<?> bbs=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",true,loader);Object board=null;
  for(Method m:bbs.getDeclaredMethods())if(Modifier.isStatic(m.getModifiers())&&m.getReturnType()==bbs&&Arrays.equals(m.getParameterTypes(),new Class[]{String.class})){m.setAccessible(true);board=m.invoke(null,"https://egg.5ch.io/test/read.cgi/android/1792500780/");if(board!=null)break;}
  if(board==null)throw new AssertionError("Native board parser");
  Activity activity=(Activity)Class.forName("app.morphe.extension.chmate.Haiagaru",true,loader).getMethod("toolbarActivity",Object.class).invoke(null,new Object[]{null});
  Owner owner=new Owner(activity,board);Class<?> menuClass=Class.forName("app.morphe.extension.chmate.WacchoiLongPressMenu",true,loader);
  SharedPreferences p=app.getSharedPreferences("haiagaru_response_actions",0);Map<String,?> old=p.getAll();
  int[] ids={75,0x7e000077,0x7e000078,0x7e000079};String[] names={"wacchoiLongPressSearch","wacchoiLongPressSuffixSearch","wacchoiLongPressPrefixSearch","wacchoiLongPressPrefixNg"};int checks=0;
  try{
   SharedPreferences.Editor e=p.edit();for(int i=0;i<ids.length;i++)e.putBoolean(names[i],true).putInt("responseVisibility."+ids[i],2);e.commit();
   Menu name=new PopupMenu(activity,new View(activity)).getMenu();name.add(0,75,0,"native Wacchoi search");invoke(menuClass,"appendLegacyForName",owner,name);
   Menu body=new PopupMenu(activity,new View(activity)).getMenu();invoke(menuClass,"appendLegacyForResponse",owner,body);
   for(int id:ids){if(name.findItem(id)==null||!name.findItem(id).isVisible())throw new AssertionError("Name menu missing "+id);checks++;
    if(body.findItem(id)!=null&&body.findItem(id).isVisible())throw new AssertionError("Name action leaked into body "+id);checks++;}
   e=p.edit();for(int i=0;i<ids.length;i++)e.putBoolean(names[i],false).putInt("responseVisibility."+ids[i],1);e.commit();
   name=new PopupMenu(activity,new View(activity)).getMenu();name.add(0,75,0,"native Wacchoi search");invoke(menuClass,"appendLegacyForName",owner,name);
   body=new PopupMenu(activity,new View(activity)).getMenu();invoke(menuClass,"appendLegacyForResponse",owner,body);
   for(int id:ids){if(name.findItem(id)!=null&&name.findItem(id).isVisible())throw new AssertionError("Name OFF ignored "+id);checks++;
    if(body.findItem(id)==null||!body.findItem(id).isVisible())throw new AssertionError("Body explicit ON lost "+id);checks++;}
   return "PASS "+checks+" real name/body menu isolation checks";
  }finally{SharedPreferences.Editor e=p.edit();for(int i=0;i<ids.length;i++)for(String key:new String[]{names[i],"responseVisibility."+ids[i]}){Object v=old.get(key);if(v instanceof Boolean)e.putBoolean(key,(Boolean)v);else if(v instanceof Integer)e.putInt(key,(Integer)v);else e.remove(key);}e.commit();}
 }
}
