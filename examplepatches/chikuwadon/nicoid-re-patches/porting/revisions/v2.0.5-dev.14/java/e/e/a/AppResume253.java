package e.e.a;

import android.app.Activity;
import android.app.Service;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.util.Log;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

/** Issue #139/#141: selectable background/popup return, preserving the native decoder. */
public final class AppResume253 {
 private static final String TAG="nicoid-resume253";
 private static final String MODE="app_switch_playback", KEY="nicoid_app_resume_playback";
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final WeakHashMap<PreferenceActivity,SharedPreferences.OnSharedPreferenceChangeListener> OBSERVERS=new WeakHashMap<>();
 private static boolean away,restoring;
 private static int generation;
 private AppResume253(){}

 private static SharedPreferences prefs(Context c){return PreferenceManager.getDefaultSharedPreferences(c);}
 private static boolean supported(String mode){return "background".equals(mode)||"popup".equals(mode);}
 private static boolean valid(Activity a){return a!=null&&!a.isFinishing()&&!a.isDestroyed();}
 public static synchronized void left(Context context){
  if(context==null||!supported(prefs(context).getString(MODE,"none")))return;
  away=true;generation++;
  Log.i(TAG,"App backgrounded; awaiting true foreground transition");
 }
 /** Returns true only when this foreground transition is handled, preventing a
  * second legacy service-to-normal Activity launch on the same event. */
 public static boolean resumed(Activity activity){
  if(!valid(activity))return false;
  final int token;
  synchronized(AppResume253.class){
   if(!away||restoring)return false;
   away=false;token=++generation;
  }
  clearLegacyArm();
  String mode=prefs(activity).getString(MODE,"none");
  boolean normal="normal".equals(prefs(activity).getString(KEY,"background"));
  if(!supported(mode)||!normal){
   Log.i(TAG,"Retain existing playback presentation="+mode);
   return true;
  }
  if("com.sauzask.nicoid.NicoidVideoActivity".equals(activity.getClass().getName())){
   Log.i(TAG,"Player Activity already foreground; no additional launch");
   return true;
  }
  WeakReference<Activity> ref=new WeakReference<>(activity);
  MAIN.postDelayed(()->restore(ref,token,0),120);
  return true;
 }
 private static void clearLegacyArm(){
  try{Field f=field(Class.forName("e.e.a.PlaybackReturn"),"automaticVideo");f.set(null,null);}
  catch(Exception ignored){}
 }
 private static Field field(Class<?> cls,String name)throws Exception{
  for(Class<?> c=cls;c!=null;c=c.getSuperclass())try{
   Field f=c.getDeclaredField(name);f.setAccessible(true);return f;
  }catch(NoSuchFieldException ignored){}
  throw new NoSuchFieldException(name);
 }
 private static Service service(){
  try{
   Object state=field(Class.forName("e.e.a.DirectBackground235"),"active").get(null);
   if(state!=null){
    Object owner=field(state.getClass(),"service").get(state);
    if(owner instanceof Service)return (Service)owner;
   }
  }catch(Exception ignored){}
  try{
   Object ref=field(Class.forName("e.e.a.PlaybackReturn"),"active").get(null);
   Object owner=ref instanceof Reference?((Reference<?>)ref).get():null;
   if(owner instanceof Service)return (Service)owner;
  }catch(Exception ignored){}
  return null;
 }
 private static boolean handoffPending(){
  try{return field(Class.forName("e.e.a.PopupReturn244"),"pending").get(null)!=null;}
  catch(Exception ignored){return false;}
 }
 private static void restore(WeakReference<Activity> ref,int token,int tries){
  Activity activity=ref.get();
  if(!valid(activity))return;
  synchronized(AppResume253.class){if(token!=generation||restoring)return;}
  if(!"normal".equals(prefs(activity).getString(KEY,"background"))
      ||!supported(prefs(activity).getString(MODE,"none")))return;
  if(handoffPending())return;
  Service s=service();
  if(s!=null)try{
   Object player=field(s.getClass(),"e").get(s);
   long duration=player==null?0:((Number)player.getClass().getMethod("getDuration").invoke(player)).longValue();
   if(duration>0){
    synchronized(AppResume253.class){if(token!=generation||restoring)return;restoring=true;}
    boolean accepted=false;
    try{accepted=Dev115.seamlessReturn(s);}
    finally{synchronized(AppResume253.class){restoring=false;}}
    if(accepted){Log.i(TAG,"Retained decoder handed to normal player on app return");return;}
   }
  }catch(Exception e){Log.w(TAG,"Waiting for prepared player",e);}
  if(tries<35)MAIN.postDelayed(()->restore(ref,token,tries+1),150);
  else Log.w(TAG,"No prepared service available for app return");
 }

 public static void install(PreferenceActivity activity){
  if(!valid(activity))return;
  SharedPreferences p=prefs(activity);
  SharedPreferences.OnSharedPreferenceChangeListener old=OBSERVERS.remove(activity);
  if(old!=null)p.unregisterOnSharedPreferenceChangeListener(old);
  refresh(activity);
  // The legacy Dev111 summary updater can disable the preference after
  // our refresh when app-switch mode is "popup". Correct only the enabled
  // bit before drawing; preserve the native ListPreference and its callback.
  android.widget.ListView screen=activity.getListView();
  if(screen!=null){
   WeakReference<PreferenceActivity> owner=new WeakReference<>(activity);
   screen.getViewTreeObserver().addOnPreDrawListener(new android.view.ViewTreeObserver.OnPreDrawListener(){
    public boolean onPreDraw(){
     PreferenceActivity a=owner.get();
     if(!valid(a)){
      android.view.ViewTreeObserver observer=screen.getViewTreeObserver();
      if(observer.isAlive())observer.removeOnPreDrawListener(this);
      return true;
     }
     Preference preference=a.findPreference(KEY);
     if(preference!=null){
      boolean enabled=supported(prefs(a).getString(MODE,"none"));
      if(preference.isEnabled()!=enabled)preference.setEnabled(enabled);
     }
     return true;
    }
   });
  }
  WeakReference<PreferenceActivity> ref=new WeakReference<>(activity);
  SharedPreferences.OnSharedPreferenceChangeListener listener=(shared,key)->{
   if(!MODE.equals(key)&&!KEY.equals(key)&&!"app_lang".equals(key))return;
   MAIN.post(()->{PreferenceActivity a=ref.get();if(valid(a))refresh(a);});
  };
  p.registerOnSharedPreferenceChangeListener(listener);
  OBSERVERS.put(activity,listener);
 }
 private static void refresh(PreferenceActivity activity){
  Preference option=activity.findPreference(KEY);
  if(!(option instanceof ListPreference))return;
  ListPreference list=(ListPreference)option;
  String mode=prefs(activity).getString(MODE,"none");
  boolean popup="popup".equals(mode);
  list.setEnabled(supported(mode));
  list.setEntries(new CharSequence[]{
   PanelUi.tr(activity,popup?"ポップアップ再生を継続":"バックグラウンド再生を継続",
      popup?"Keep popup playback":"Keep background playback",
      popup?"繼續彈出視窗播放":"繼續背景播放"),
   PanelUi.tr(activity,"通常再生に戻る","Return to normal playback","返回一般播放")
  });
  // Do not change value IDs: "background" means keep current presentation.
  String value=prefs(activity).getString(KEY,"background");
  String current="normal".equals(value)?list.getEntries()[1].toString():list.getEntries()[0].toString();
  String detail=PanelUi.tr(activity,"アプリに戻ったときの再生方法",
      "Playback behavior when returning to the app","返回應用程式時的播放方式");
  list.setSummary(current+PanelUi.tr(activity,"：",": ","：")+detail);
 }
}
