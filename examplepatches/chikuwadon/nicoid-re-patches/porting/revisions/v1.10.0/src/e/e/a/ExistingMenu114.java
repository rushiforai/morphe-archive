package e.e.a;
import android.app.Activity;
import android.content.SharedPreferences;
import android.os.*;
import android.preference.PreferenceManager;
import android.view.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
/** Keep the existing menu open for mode changes; no additional menu or window. */
public final class ExistingMenu114 {
 static final int CONTINUOUS=0x7f0f0201,SHUFFLE=18120;
 static final Handler MAIN=new Handler(Looper.getMainLooper());
 public static void install(Object host,Menu menu){if(!(host instanceof Activity)||menu==null)return;Activity a=(Activity)host;MAIN.post(()->{if(a.isDestroyed()||a.isFinishing())return;for(int id:new int[]{CONTINUOUS,SHUFFLE}){MenuItem item=menu.findItem(id);if(item!=null)item.setOnMenuItemClickListener(clicked->change(a,menu,clicked));}});}
 static boolean change(Activity a,Menu menu,MenuItem item){Guard guard=hold(menu);try{SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(a);boolean shuffle=item.getItemId()==SHUFFLE;boolean checked=p.getBoolean("continuous_play",false)&&((p.getInt("continuous_play_mode",0)==2)==shuffle);boolean enabled=!checked;TabPlayback110.changed(a,enabled,shuffle);p.edit().putBoolean("continuous_play",enabled).putInt("continuous_play_mode",shuffle?2:0).apply();Class<?> type=Class.forName("com.sauzask.nicoid.NicoidVideoListActivity");type.getField("I").setBoolean(null,enabled);type.getField("J").setInt(null,shuffle?2:0);MenuItem continuous=menu.findItem(CONTINUOUS),random=menu.findItem(SHUFFLE);if(continuous!=null)continuous.setChecked(enabled&&!shuffle);if(random!=null)random.setChecked(enabled&&shuffle);return true;}catch(Exception error){android.util.Log.w("nicoid-menu","Cannot change playback mode",error);return true;}finally{MAIN.post(guard::restore);}}
 static boolean closeMethod(Method m){Class<?>[] p=m.getParameterTypes();return m.getReturnType()==void.class&&p.length==2&&Menu.class.isAssignableFrom(p[0])&&p[1]==boolean.class;}
 static Class<?> presenterInterface(Class<?> type){for(Class<?> c=type;c!=null;c=c.getSuperclass())for(Class<?> iface:c.getInterfaces())for(Method m:iface.getMethods())if(closeMethod(m))return iface;return null;}
 @SuppressWarnings({"rawtypes","unchecked"})
 static Guard hold(Menu menu){Guard guard=new Guard();try{for(Class<?> type=menu.getClass();type!=null&&type!=Object.class;type=type.getSuperclass())for(Field f:type.getDeclaredFields()){
  if(!List.class.isAssignableFrom(f.getType()))continue;f.setAccessible(true);Object value=f.get(menu);if(!(value instanceof List))continue;List list=(List)value;
  for(int n=0;n<list.size();n++){Object original=list.get(n);if(!(original instanceof WeakReference))continue;Object presenter=((WeakReference)original).get();if(presenter==null)continue;Class<?> iface=presenterInterface(presenter.getClass());if(iface==null)continue;
   Object proxy=Proxy.newProxyInstance(iface.getClassLoader(),new Class<?>[]{iface},(o,m,args)->{if(closeMethod(m))return null;try{return m.invoke(presenter,args);}catch(InvocationTargetException e){throw e.getCause();}});WeakReference replacement=new WeakReference(proxy);list.set(n,replacement);guard.entries.add(new Entry(list,original,replacement,proxy));
  }
 }}catch(Exception error){android.util.Log.w("nicoid-menu","Cannot retain existing menu",error);}return guard;}
 static final class Entry{final List<Object> list;final Object original,replacement,proxy;@SuppressWarnings("unchecked")Entry(List list,Object original,Object replacement,Object proxy){this.list=list;this.original=original;this.replacement=replacement;this.proxy=proxy;}}
 static final class Guard{final ArrayList<Entry> entries=new ArrayList<>();void restore(){for(Entry entry:entries)for(int n=0;n<entry.list.size();n++)if(entry.list.get(n)==entry.replacement){entry.list.set(n,entry.original);break;}entries.clear();}}
}
