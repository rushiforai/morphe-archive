package e.e.a;
import android.app.*;import android.content.*;import android.preference.*;import java.util.*;
/** Fill only absent defaults. Existing choices, including disabled gestures, remain authoritative. */
public final class PlaybackDefaults229 {
 public static void initialize(Context c){if(c!=null)initializePrefs(PreferenceManager.getDefaultSharedPreferences(c));}
 static void initializePrefs(SharedPreferences p){SharedPreferences.Editor e=null;
  if(!p.contains("app_switch_playback")){e=p.edit();e.putString("app_switch_playback","none");}
  if(!p.contains("back_playback")){if(e==null)e=p.edit();e.putString("back_playback","background");}
  if(!p.contains("gesture_swipe_background")){if(e==null)e=p.edit();e.putBoolean("gesture_swipe_background",!p.getBoolean("gesture_swipe_popup",false));}
  if(e!=null)e.apply();
 }
 static boolean mini(SharedPreferences p){return p.getBoolean("gesture_swipe_background",!p.getBoolean("gesture_swipe_popup",false));}
 static PreferenceGroup parent(PreferenceGroup group,Preference target){if(group==null||target==null)return null;for(int n=0;n<group.getPreferenceCount();n++){Preference child=group.getPreference(n);if(child==target)return group;if(child instanceof PreferenceGroup){PreferenceGroup found=parent((PreferenceGroup)child,target);if(found!=null)return found;}}return null;}
 public static void settings(PreferenceActivity a){initialize(a);PreferenceGroup root=a.getPreferenceScreen();if(root==null)return;Preference g=a.findPreference("setting_whole");if(!(g instanceof PreferenceGroup))return;PreferenceGroup general=(PreferenceGroup)g;
  String[] keys={"app_switch_playback","back_playback"};String[] titles={PanelUi.tr(a,"アプリ切替時の動作","When switching apps","切換應用程式時的行為"),PanelUi.tr(a,"再生中に戻る場合の動作","When going back during playback","播放時返回的行為")};ListPreference[] moves=new ListPreference[2];
  for(int n=0;n<2;n++){Preference existing=a.findPreference(keys[n]);ListPreference p=existing instanceof ListPreference?(ListPreference)existing:new ListPreference(a);PreferenceGroup old=parent(root,existing);if(old!=null)old.removePreference(existing);p.setKey(keys[n]);p.setTitle(titles[n]);if(p.getEntries()==null){p.setEntries(new CharSequence[]{PanelUi.tr(a,"何もしない","Do nothing","不執行任何動作"),PanelUi.tr(a,"バックグラウンド再生","Background playback","背景播放"),PanelUi.tr(a,"ポップアップ再生","Popup playback","懸浮播放")});p.setEntryValues(new CharSequence[]{"none","background","popup"});p.setSummary("%s");}p.setDefaultValue(n==0?"none":"background");moves[n]=p;}
  Preference anchor=a.findPreference("videolist_tap");if(anchor!=null&&parent(root,anchor)!=general){PreferenceGroup old=parent(root,anchor);if(old!=null)old.removePreference(anchor);if(old instanceof PreferenceCategory&&old.getPreferenceCount()==0){PreferenceGroup container=parent(root,old);if(container!=null)container.removePreference(old);}anchor.setOrder(Integer.MAX_VALUE);general.addPreference(anchor);}
  ArrayList<Preference> rows=new ArrayList<Preference>();for(int n=0;n<general.getPreferenceCount();n++)rows.add(general.getPreference(n));int at=rows.indexOf(anchor);if(at<0)at=rows.size()-1;rows.add(at+1,moves[0]);rows.add(at+2,moves[1]);for(int n=0;n<rows.size();n++){Preference row=rows.get(n);row.setOrder(n*10);if(row==moves[0]||row==moves[1])general.addPreference(row);}
 }
}
