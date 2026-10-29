package e.e.a;
import android.preference.*;
public final class DetailSettings {
 public static final String FOLLOW="video_info_follow_button";
 private static PreferenceGroup parent(PreferenceGroup root,Preference target){for(int i=0;i<root.getPreferenceCount();i++){Preference p=root.getPreference(i);if(p==target)return root;if(p instanceof PreferenceGroup){PreferenceGroup found=parent((PreferenceGroup)p,target);if(found!=null)return found;}}return null;}
 public static void install(PreferenceActivity a){
  SettingsTools.install(a);
  if(a.findPreference(PopupGestures.KEY)==null){CheckBoxPreference p=new CheckBoxPreference(a);p.setKey(PopupGestures.KEY);p.setTitle(PanelUi.tr(a,"ポップアップでダブルタップシーク","Double tap to seek in popup","浮動播放輕觸兩次跳轉"));p.setSummary(PanelUi.tr(a,"通常再生と同じ秒数でシークします。右上の×で終了します","Use the normal seek interval. Close with × at top right","使用一般播放的跳轉秒數，右上角×關閉"));p.setDefaultValue(Boolean.FALSE);p.setChecked(PopupGestures.enabled(a));Preference category=a.findPreference("player");PreferenceGroup group=category instanceof PreferenceGroup?(PreferenceGroup)category:null;(group==null?a.getPreferenceScreen():group).addPreference(p);}
  if(a.findPreference(PlayerControlsDock.KEY)==null){CheckBoxPreference p=new CheckBoxPreference(a);p.setKey(PlayerControlsDock.KEY);p.setTitle(PanelUi.tr(a,"操作部を動画の外側に常時表示","Always show controls outside the video","在影片外側持續顯示操作列"));p.setSummary(PanelUi.tr(a,"シークバーと操作ボタンが動画に重ならないように表示します","Keep the seek bar and player controls visible without covering the picture","持續顯示進度與操作列，不遮擋影片"));p.setDefaultValue(Boolean.FALSE);p.setChecked(PlayerControlsDock.enabled(a));Preference anchor=a.findPreference("quality_mode");PreferenceGroup group=anchor==null?null:parent(a.getPreferenceScreen(),anchor);(group==null?a.getPreferenceScreen():group).addPreference(p);}

  Preference startup=a.findPreference("startup_screen");if(startup!=null){startup.setTitle(UiStrings.translate("起動時の画面"));Ranking190.startupSettings(startup);}
  if(a.findPreference(FOLLOW)==null){CheckBoxPreference p=new CheckBoxPreference(a);p.setKey(FOLLOW);p.setTitle(UiStrings.translate("投稿者のフォローボタンを表示"));p.setSummary(UiStrings.translate("動画情報にフォローボタンを表示します"));p.setDefaultValue(Boolean.TRUE);p.setChecked(PreferenceManager.getDefaultSharedPreferences(a).getBoolean(FOLLOW,true));Preference anchor=a.findPreference("comment_size_percent");PreferenceGroup group=anchor==null?null:parent(a.getPreferenceScreen(),anchor);(group==null?a.getPreferenceScreen():group).addPreference(p);}
 }
}
