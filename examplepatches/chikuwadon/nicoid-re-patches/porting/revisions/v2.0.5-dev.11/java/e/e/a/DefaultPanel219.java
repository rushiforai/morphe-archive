package e.e.a;

import android.content.Context;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;

/**
 * Apply the initial player panel to the actual native ViewPager, after the
 * adapter binds. No permanent listener and no settings / adapter replacement.
 */
public final class DefaultPanel219 {
 private static final String KEY="nicoid_initial_player_panel";
 private static final String[] IDS={"info","comments","menu","related"};
 private static final String[] LABELS={"動画情報","コメント","メニュー","関連動画"};
 private static final StringBuilder EVENTS=new StringBuilder();
 private DefaultPanel219(){}

 private static synchronized void log(String message){
  String line=System.currentTimeMillis()+" "+message;
  android.util.Log.i("nicoid-panel",message);
  EVENTS.append(line).append('\n');
  if(EVENTS.length()>5000)EVENTS.delete(0,EVENTS.length()-4000);
 }
 public static synchronized String append(Context unused,String previous){
  if(EVENTS.length()==0)return previous;
  return (previous==null?"":previous)+"\n\nInitial player panel diagnostics:\n"+EVENTS;
 }

 public static void install(PreferenceActivity a){
  if(a==null||a.isFinishing())return;
  Preference existing=a.findPreference(KEY);
  ListPreference p;
  if(existing instanceof ListPreference)p=(ListPreference)existing;
  else {
   if(existing!=null)return;
   Preference group=a.findPreference("player");
   if(!(group instanceof PreferenceGroup))group=a.findPreference("setting_whole");
   if(!(group instanceof PreferenceGroup))return;
   p=new ListPreference(a);
   p.setKey(KEY);
   p.setOrder(145);
   ((PreferenceGroup)group).addPreference(p);
  }
  p.setTitle(PanelUi.tr(a,"動画再生画面の初期パネル","Default player panel","播放器預設面板"));
  CharSequence[] labels=new CharSequence[IDS.length];
  for(int i=0;i<IDS.length;i++)labels[i]=UiStrings.translate(LABELS[i]);
  p.setEntries(labels);
  p.setEntryValues(IDS);
  p.setDefaultValue("info");
  String saved=PreferenceManager.getDefaultSharedPreferences(a).getString(KEY,"info");
  updateSummary(a,p,saved);
  log("Settings panel selection loaded="+saved);
  p.setOnPreferenceChangeListener((pref,newValue)->{
   String choice=String.valueOf(newValue);
   if(index(choice)<0)return false;
   // Explicitly persist the stable ID; the displayed row index is not an ID.
   PreferenceManager.getDefaultSharedPreferences(a).edit().putString(KEY,choice).apply();
   p.setValue(choice);
   updateSummary(a,p,choice);
   log("Settings panel selection saved="+choice);
   return true;
  });
 }
 private static int index(String value){
  for(int i=0;i<IDS.length;i++)if(IDS[i].equals(value))return i;
  return -1;
 }
 private static void updateSummary(Context c,ListPreference p,String value){
  int selected=index(value);
  if(selected<0)selected=0;
  String label=String.valueOf(p.getEntries()[selected]);
  String detail=PanelUi.tr(c,"動画を開いたときに最初に表示する下部パネル",
      "Choose the bottom panel shown when opening a video",
      "選擇開啟影片時首先顯示的底部面板");
  p.setSummary(label+PanelUi.tr(c,"：",": ","：")+detail);
 }

 /** Retain compatibility with the previous hook; see applyPager below. */
 public static void apply(Object fragment){
  if(fragment==null)return;
  try{
   Field field=fragment.getClass().getField("E1");
   Object value=field.get(fragment);
   if(value instanceof View)applyPager((View)value);
   else log("Legacy hook: E1 is not a View");
  }catch(Exception e){log("Legacy hook failed: "+e.getClass().getSimpleName());}
 }

 /** Passed directly from NicoidVideoFragment.E1 rather than using reflection. */
 public static void applyPager(View pager){
  if(pager==null){log("Player hook called with null pager");return;}
  Context c=pager.getContext();
  String value=PreferenceManager.getDefaultSharedPreferences(c).getString(KEY,"info");
  log("Player entry requested="+value+" class="+pager.getClass().getName());
  if(index(value)<0){log("Ignoring unknown saved panel ID="+value);return;}
  pager.postDelayed(()->select(pager,value,0),180);
 }

 private static void select(View pager,String choice,int attempt){
  if(!pager.isAttachedToWindow()){
   if(attempt<60)retry(pager,choice,attempt,"view detached");
   else log("Give up: detached after 60 tries");
   return;
  }
  Object adapter=invoke(pager,"getAdapter",new Class<?>[0]);
  int count=number(adapter,"getCount");
  if(adapter==null||count<4){
   if(attempt<60)retry(pager,choice,attempt,"adapter count="+count);
   else log("Give up: adapter not ready, count="+count);
   return;
  }

  int dest=-1;
  StringBuilder titles=new StringBuilder();
  for(int i=0;i<count;i++){
   Object raw=invoke(adapter,"getPageTitle",new Class<?>[]{int.class},i);
   String title=raw==null?"":raw.toString();
   if(i>0)titles.append(", ");
   titles.append(i).append('=').append(title);
   if(matches(choice,title))dest=i;
  }
  // nicoid 6.49 native player: 0=Menu, 1=Video information,
  // 2=Related videos, 3=Comments. Only use the fixed map with exactly 4 tabs.
  if(dest<0&&count==4)dest=fixedIndex(choice);
  if(dest<0){log("No matching panel "+choice+", pages="+titles);return;}
  int before=number(pager,"getCurrentItem");
  Object result=invoke(pager,"setCurrentItem",new Class<?>[]{int.class,boolean.class},dest,false);
  int after=number(pager,"getCurrentItem");
  log("Apply "+choice+": page "+before+" -> "+after+", target="+dest+
      ", count="+count+", titles=["+titles+"]");
  if(after!=dest && attempt<60){retry(pager,choice,attempt,"page did not change");return;}

  if(attempt==0||attempt==1){
   final int target=dest;
   pager.postDelayed(()->{
    // An initial native default may reset the pager shortly after binding.
    // Do not override any other page (e.g. a deliberate user tab change).
    int current=number(pager,"getCurrentItem");
    if(pager.isAttachedToWindow()&&current==1&&target!=1){
     log("Native reset to Video info; restoring saved choice="+choice);
     invoke(pager,"setCurrentItem",new Class<?>[]{int.class,boolean.class},target,false);
    }
   },650);
  }
 }
 private static void retry(View pager,String choice,int attempt,String reason){
  if(attempt==0||attempt==10||attempt==30||attempt==59)
   log("Waiting for panel: "+reason+", try="+attempt+", requested="+choice);
  pager.postDelayed(()->select(pager,choice,attempt+1),120);
 }
 private static int fixedIndex(String id){
  if("menu".equals(id))return 0;
  if("info".equals(id))return 1;
  if("related".equals(id))return 2;
  if("comments".equals(id))return 3;
  return -1;
 }
 private static boolean matches(String key,String title){
  if(title==null)return false;
  String v=title.toLowerCase(Locale.ROOT).replace(" ","");
  if("info".equals(key))return v.contains("動画情報")||v.contains("video information")
      ||v.contains("videoinfo")||v.contains("影片資訊");
  if("comments".equals(key))return v.contains("コメント")||v.contains("comment")||v.contains("留言");
  if("menu".equals(key))return v.contains("メニュー")||v.contains("menu")||v.contains("選單");
  if("related".equals(key))return v.contains("関連")||v.contains("related")||v.contains("相關");
  return false;
 }
 private static Object invoke(Object o,String method,Class<?>[] types,Object... args){
  if(o==null)return null;
  try{
   Method m=o.getClass().getMethod(method,types);
   m.setAccessible(true);
   return m.invoke(o,args);
  }catch(Exception error){
   if("getAdapter".equals(method)||"setCurrentItem".equals(method))
    log("Reflection "+method+" failed: "+error.getClass().getSimpleName());
   return null;
  }
 }
 private static int number(Object o,String method){
  Object result=invoke(o,method,new Class<?>[0]);
  return result instanceof Number?((Number)result).intValue():-1;
 }
}
