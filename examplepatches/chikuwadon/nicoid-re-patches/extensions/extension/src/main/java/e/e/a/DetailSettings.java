package e.e.a;
import android.preference.*;
public final class DetailSettings {
 public static final String FOLLOW="video_info_follow_button";
 private static PreferenceGroup parent(PreferenceGroup root,Preference target){for(int i=0;i<root.getPreferenceCount();i++){Preference p=root.getPreference(i);if(p==target)return root;if(p instanceof PreferenceGroup){PreferenceGroup found=parent((PreferenceGroup)p,target);if(found!=null)return found;}}return null;}
 public static void install(PreferenceActivity a){
  SettingsTools.install(a);
  Preference startup=a.findPreference("startup_screen");if(startup!=null)startup.setTitle(UiStrings.translate("起動時の画面"));
  if(a.findPreference(FOLLOW)==null){CheckBoxPreference p=new CheckBoxPreference(a);p.setKey(FOLLOW);p.setTitle(UiStrings.translate("投稿者のフォローボタンを表示"));p.setSummary(UiStrings.translate("動画情報にフォローボタンを表示します"));p.setDefaultValue(Boolean.TRUE);p.setChecked(PreferenceManager.getDefaultSharedPreferences(a).getBoolean(FOLLOW,true));Preference anchor=a.findPreference("comment_size_percent");PreferenceGroup group=anchor==null?null:parent(a.getPreferenceScreen(),anchor);(group==null?a.getPreferenceScreen():group).addPreference(p);}
 }
}
