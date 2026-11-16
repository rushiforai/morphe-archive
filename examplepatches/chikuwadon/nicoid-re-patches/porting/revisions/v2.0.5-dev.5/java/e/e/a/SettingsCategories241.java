package e.e.a;

import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.util.Log;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * One-shot final settings reorganization.
 * Reparents ORIGINAL Preference instances: no preference key, listener, value,
 * summary, dialog, dependency, intent or default is recreated or reset.
 * Unrecognized/current-development preferences stay in their existing group;
 * log them rather than deleting or inventing an item.
 */
public final class SettingsCategories241 {
 private static final String TAG="nicoid-settings241";
 private static final String PREFIX="nicoid_group_205_";
 private static final String[][] CATEGORIES={
    {"全般","General","一般"},
    {"アカウント","Account","帳號"},
    {"言語","Language","語言"},
    {"テーマ・配色","Theme and colors","主題與配色"},
    {"画面表示","Display","畫面顯示"},
    {"タブ","Tabs","分頁"},
    {"動画一覧・メニュー","Video lists and menus","影片清單與選單"},
    {"再生","Playback","播放"},
    {"再生時の動作","Playback actions","播放行為"},
    {"プレーヤー操作","Player controls","播放器操作"},
    {"ジェスチャー","Gestures","手勢"},
    {"コメント","Comments","留言"},
    {"NG・フィルター","NG and filters","封鎖與過濾"},
    {"キャッシュ・保存","Cache and storage","快取與儲存"},
    {"Google Cast","Google Cast","Google Cast"},
    {"デバッグ","Debugging","偵錯"},
    {"設定のバックアップ","Settings backup","設定備份"},
    {"nicoidについて","About nicoid","關於nicoid"}
 };
 private static final String[][] ITEMS={
    {"起動時の画面","本体の視聴履歴の保存数","アプリ終了時の確認"},
    {"ログインせずに使用","ログイン","ログアウト"},
    {"アプリ全体の言語","コメント・動画情報の言語"},
    {"テーマ","カスタムカラー"},
    {"通常画面の向き","再生画面の向き","ステータスバー非表示"},
    {"複数タブを使用する","アプリバーとタブバーの配置","タブバーのボタン表示","タブ切り替えアニメーション","タブのスクロール位置を復元"},
    {"検索サジェスト","サムネイルに視聴進捗を表示","サムネイルの角丸表示","動画情報欄のボタン","動画メニューの表示項目","サイドバーにショートを表示","サイドバーにニコ生を表示"},
    {"再生モード","画質","モバイル通信時の画質","先行再生","デフォルトの再生速度","長押し中の再生速度","再生位置の保存","画面OFF時も音声を再生","スリープ再生","オーディオフォーカス","アンビエントモード"},
    {"タップ時の動作","リンク時の動作","リンクから起動した場合の戻る動作","アプリ切替時の動作","アプリ復帰時の動作","再生中に戻る場合の動作"},
    {"動画再生画面の初期パネル","操作部の常時表示","操作ボタンのカスタマイズ","ポップアップの動画情報ボタンの位置","ダブルタップでシーク","ポップアップでダブルタップシーク","シングルタップの操作部表示領域","コメントの盛り上がり"},
    {"ジェスチャー","スワイプで音量調整","スワイプで輝度調整","左右スワイプでシーク","上下スワイプ","ジェスチャー中に操作部を表示しない"},
    {"コメント表示設定","コメント取得数","コメントを表示しない","描画フレームレート"},
    {"NGコメントリスト","共有NGレベル","コンテンツフィルター"},
    {"キャッシュ容量","キャッシュ保存先","キャッシュのみを使用し再生","MP4の保存先フォルダ","キャッシュを全て削除する","旧保存先のキャッシュを削除"},
    {"接続","接続解除","Castの画質固定","Cast再生時コメントを減らす"},
    {"デバッグログの保存"},
    {"設定をエクスポート","設定をインポート"},
    {"ライセンス","Version.6.49","パッチバージョン"}
 };
 private static final Map<String,String> KEY_ALIASES=new HashMap<>();
 static {
    KEY_ALIASES.put("startup_screen","起動時の画面");
    KEY_ALIASES.put("multiple_video_tabs","複数タブを使用する");
    KEY_ALIASES.put("search_suggestions_enabled","検索サジェスト");
    KEY_ALIASES.put("show_shorts_menu","サイドバーにショートを表示");
    KEY_ALIASES.put("double_tap_seek_seconds","ダブルタップでシーク");
    KEY_ALIASES.put("popup_double_tap_seek","ポップアップでダブルタップシーク");
    KEY_ALIASES.put("gesture_horizontal_seek","左右スワイプでシーク");
    KEY_ALIASES.put("gesture_vertical_options","上下スワイプ");
    KEY_ALIASES.put("videolist_tap","タップ時の動作");
    KEY_ALIASES.put("intent_type","リンク時の動作");
    KEY_ALIASES.put("app_switch_playback","アプリ切替時の動作");
    KEY_ALIASES.put("nicoid_app_resume_playback","アプリ復帰時の動作");
    KEY_ALIASES.put("back_playback","再生中に戻る場合の動作");
    KEY_ALIASES.put("nicoid_initial_player_panel","動画再生画面の初期パネル");
    KEY_ALIASES.put("nicoid_ng_comments","NGコメントリスト");
    KEY_ALIASES.put("nicoid_filter_list","コンテンツフィルター");
    KEY_ALIASES.put("google_cast_connect","接続");
    KEY_ALIASES.put("google_cast_disconnect","接続解除");
    KEY_ALIASES.put("comment_cast_min","Cast再生時コメントを減らす");
    KEY_ALIASES.put("video_menu_visible_items","動画メニューの表示項目");
 }
 private SettingsCategories241(){}

 private static String normalized(CharSequence title){
  if(title==null)return "";
  String value=Normalizer.normalize(title.toString(),Normalizer.Form.NFKC);
  return value.toLowerCase(Locale.ROOT).replaceAll("[\\\\s\\\\u3000:：・\\\\-]+","");
 }
 private static String translation(String japan){
  try{return UiStrings.translate(japan);}catch(RuntimeException ignored){return japan;}
 }
 private static boolean matches(String actual,String expected){
  if(actual.equals(normalized(expected)))return true;
  return actual.equals(normalized(translation(expected)));
 }
 private static int[] locate(Preference pref){
  String key=pref.getKey(),name=pref.getTitle()==null?"":pref.getTitle().toString();
  String mapped=key==null?null:KEY_ALIASES.get(key);
  String norm=normalized(name);
  for(int cat=0;cat<ITEMS.length;cat++)for(int index=0;index<ITEMS[cat].length;index++){
   String expected=ITEMS[cat][index];
   if(mapped!=null&&mapped.equals(expected))return new int[]{cat,index};
   if(matches(norm,expected))return new int[]{cat,index};
  }
  // Older localized titles, without touching the user-visible label.
  if(key!=null&&key.equals("nicoid_external_back_playback"))return new int[]{8,2};
  if(norm.equals(normalized("Version 6.49")))return new int[]{17,1};
  return null;
 }
 private static PreferenceGroup parent(PreferenceGroup root,Preference item){
  for(int i=0;i<root.getPreferenceCount();i++){
   Preference p=root.getPreference(i);
   if(p==item)return root;
   if(p instanceof PreferenceGroup){
    PreferenceGroup nested=parent((PreferenceGroup)p,item);
    if(nested!=null)return nested;
   }
  }
  return null;
 }
 private static PreferenceCategory category(PreferenceActivity a,PreferenceScreen root,int which){
  String key=PREFIX+(which+1);
  Preference found=a.findPreference(key);
  if(found instanceof PreferenceCategory)return (PreferenceCategory)found;
  if(found!=null)throw new IllegalStateException("Category key collision "+key);
  PreferenceCategory created=new PreferenceCategory(a);
  created.setKey(key);
  String[] labels=CATEGORIES[which];
  created.setTitle(PanelUi.tr(a,labels[0],labels[1],labels[2]));
  created.setOrder(which);
  created.setOrderingAsAdded(false);
  root.addPreference(created);
  return created;
 }
 public static void apply(PreferenceActivity a){
  if(a==null||a.isFinishing()||a.isDestroyed())return;
  PreferenceScreen root=a.getPreferenceScreen();
  if(root==null)return;
  try {
   ArrayList<Preference> candidates=new ArrayList<>();
   ArrayList<PreferenceCategory> prior=new ArrayList<>();
   for(int i=0;i<root.getPreferenceCount();i++){
    Preference p=root.getPreference(i);
    if(p instanceof PreferenceCategory){
     PreferenceCategory group=(PreferenceCategory)p;
     if(group.getKey()!=null&&group.getKey().startsWith(PREFIX))continue;
     prior.add(group);
     for(int j=0;j<group.getPreferenceCount();j++)candidates.add(group.getPreference(j));
    }else{
     candidates.add(p);
    }
   }
   PreferenceCategory[] groups=new PreferenceCategory[CATEGORIES.length];
   int[] counts=new int[CATEGORIES.length];
   int unidentified=0;
   Set<String> duplicate=new HashSet<>();
   // Build an index over ORIGINAL preference instances only; do not synthesize settings.
   for(Preference p:candidates){
    int[] target=locate(p);
    if(target==null){
     unidentified++;
     Log.i(TAG,"Extra or unclassified original preference: "+p.getKey()+" / "+p.getTitle());
     continue;
    }
    if(groups[target[0]]==null)groups[target[0]]=category(a,root,target[0]);
    PreferenceGroup targetGroup=groups[target[0]];
    PreferenceGroup from=parent(root,p);
    // The Android preference adapter sorts on insertion, not reliably on
    // setOrder afterward. Reinsert the SAME object with its final order.
    if(from!=null)from.removePreference(p);
    p.setOrder(target[1]);
    targetGroup.addPreference(p);
    counts[target[0]]++;
    String marker=target[0]+":"+target[1];
    if(!duplicate.add(marker))Log.w(TAG,"More than one existing setting maps to "+marker);
   }
   for(int i=0;i<CATEGORIES.length;i++){
    if(groups[i]==null)groups[i]=category(a,root,i);
    groups[i].setOrder(i);
   }
   for(PreferenceCategory original:prior){
    if(original.getPreferenceCount()==0)root.removePreference(original);
    else original.setOrder(10000+prior.indexOf(original));
   }
   int placed=0;
   for(int n:counts)placed+=n;
   Log.i(TAG,"categorized="+placed+"/79, extra="+unidentified+
     ", categories="+CATEGORIES.length+", displayed conditional settings may differ");
  }catch(RuntimeException problem){
   // Preserve settings in place if an OEM or native version has incompatible groups.
   Log.e(TAG,"Category migration failed (settings values remain unchanged)",problem);
  }
 }
}
