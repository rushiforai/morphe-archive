package e.e.a;

import android.os.Handler;
import android.os.Looper;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.content.SharedPreferences;
import android.util.Log;
import java.util.WeakHashMap;

/**
 * Audit every native and extension ListPreference by its persistent entry value,
 * never by display order or translated label.
 * Do not modify saved settings or replace other setting change handlers.
 */
public final class SettingsValue251 {
 private static final String TAG="nicoid-values251";
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final WeakHashMap<Preference,Boolean> HOOKED=new WeakHashMap<>();
 private SettingsValue251(){}

 public static void install(PreferenceActivity a){
  if(a==null||a.isFinishing()||a.isDestroyed()||a.getPreferenceScreen()==null)return;
  visit(a,a.getPreferenceScreen());
 }
 private static void visit(PreferenceActivity a,Preference p){
  if(p instanceof ListPreference)audit(a,(ListPreference)p);
  if(p instanceof PreferenceGroup){
   PreferenceGroup group=(PreferenceGroup)p;
   for(int i=0;i<group.getPreferenceCount();i++)visit(a,group.getPreference(i));
  }
 }
 private static int valueIndex(ListPreference p,String value){
  CharSequence[] values=p.getEntryValues(),labels=p.getEntries();
  if(values==null||labels==null||values.length!=labels.length){
   Log.e(TAG,"Entry/value size mismatch: "+p.getKey()+" (entries="+
     (labels==null?-1:labels.length)+", values="+(values==null?-1:values.length)+")");
   return -1;
  }
  for(int i=0;i<values.length;i++)
   if(values[i]!=null&&values[i].toString().equals(value))return i;
  return -1;
 }
 private static void audit(PreferenceActivity a,ListPreference p){
  String key=p.getKey();
  if(key==null)return;
  String actual=p.getValue();
  // Some older app versions stored a value before the UI entries were expanded.
  SharedPreferences preferences=PreferenceManager.getDefaultSharedPreferences(a);
  String saved=preferences.getString(key,actual==null?"":actual);
  int index=valueIndex(p,saved);
  if(index<0){
   Log.w(TAG,"Saved value has no entry (preserved): "+key+" value="+saved);
   return;
  }
  if(actual==null||!actual.equals(saved))p.setValue(saved);
  if(!"startup_screen".equals(key)||HOOKED.containsKey(p))return;
  HOOKED.put(p,Boolean.TRUE);
  refresh(a,p);
  Preference.OnPreferenceChangeListener original=p.getOnPreferenceChangeListener();
  p.setOnPreferenceChangeListener((preference,next)->{
   if(original!=null&&!original.onPreferenceChange(preference,next))return false;
   String value=String.valueOf(next);
   if(valueIndex(p,value)<0){
    Log.e(TAG,"Rejected invalid startup entry value "+value);
    return false;
   }
   // Persist by the stable ID, not the selected row index. Android's own
   // ListPreference persistence runs after this listener returns.
   preferences.edit().putString(key,value).apply();
   p.setValue(value);
   MAIN.post(()->{
    if(!a.isFinishing()&&!a.isDestroyed())refresh(a,p);
   });
   return true;
  });
 }
 private static void refresh(PreferenceActivity a,ListPreference p){
  String value=PreferenceManager.getDefaultSharedPreferences(a).getString("startup_screen","home");
  int index=valueIndex(p,value);
  if(index<0)return;
  CharSequence label=p.getEntries()[index];
  if(label!=null)p.setSummary(label);
  Log.i(TAG,"startup_screen="+value+", entry="+index+" / "+label);
 }
}
