package e.e.a;
import android.app.*;import android.content.*;import android.preference.*;import android.widget.*;

/** The displayed checked array and preferences are one state, including recycled rows. */
public final class VerticalSwipe226 {
 static final String MINI="gesture_swipe_background",POPUP="gesture_swipe_popup",LAST="gesture_swipe_down_last";
 static final String[] KEYS={MINI,POPUP,"gesture_swipe_fullscreen","gesture_swipe_exit_fullscreen"};
 private VerticalSwipe226(){}
 static boolean[] read(SharedPreferences prefs){
  PlaybackDefaults229.initializePrefs(prefs);boolean[] checked=new boolean[KEYS.length];for(int n=0;n<KEYS.length;n++)checked[n]=prefs.getBoolean(KEYS[n],false);
  if(checked[0]&&checked[1]){int keep=POPUP.equals(prefs.getString(LAST,MINI))?1:0;checked[1-keep]=false;prefs.edit().putBoolean(KEYS[1-keep],false).apply();}
  return checked;
 }
 public static AlertDialog show(final PreferenceActivity a){
  final SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(a);final boolean[] checked=read(prefs);
  String[] labels={PanelUi.tr(a,"下スワイプでバックグラウンド再生","Swipe down for background playback","向下滑動進入背景播放"),PanelUi.tr(a,"下スワイプでポップアップ再生","Swipe down for popup playback","向下滑動進入懸浮播放"),PanelUi.tr(a,"上スワイプで横向き全画面","Swipe up for landscape fullscreen","向上滑動進入橫向全螢幕"),PanelUi.tr(a,"下スワイプで全画面を解除","Swipe down to exit fullscreen","向下滑動離開全螢幕")};
  return UiDialogs.showBuilder(UiDialogs.builder(a).setTitle(PanelUi.tr(a,"上下スワイプ","Vertical swipes","上下滑動")).setMultiChoiceItems(labels,checked,new DialogInterface.OnMultiChoiceClickListener(){public void onClick(DialogInterface d,int which,boolean value){
   checked[which]=value;SharedPreferences.Editor edit=prefs.edit().putBoolean(KEYS[which],value);
   if(value&&(which==0||which==1)){int other=1-which;checked[other]=false;edit.putBoolean(KEYS[other],false).putString(LAST,KEYS[which]);}
   edit.apply();
   if(d instanceof AlertDialog){ListView list=((AlertDialog)d).getListView();for(int n=0;n<checked.length;n++)list.setItemChecked(n,checked[n]);if(list.getAdapter() instanceof BaseAdapter)((BaseAdapter)list.getAdapter()).notifyDataSetChanged();}
  }}).setPositiveButton(android.R.string.ok,null));
 }
}
