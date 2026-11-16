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
    {"キャッシュ容量","キャッシュ保存先","キャッシュのみを使用し再生","動画・音声の保存先フォルダ","キャッシュを全て削除する","旧保存先のキャッシュを削除"},
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
    KEY_ALIASES.put("app_theme","テーマ");
    KEY_ALIASES.put("custom_palette","カスタムカラー");
    KEY_ALIASES.put("custom_palette_enabled","カスタムカラー");
    KEY_ALIASES.put("list_gestures_enabled","ジェスチャー");
    KEY_ALIASES.put("nicoid_restore_tab_scroll","タブのスクロール位置を復元");
    KEY_ALIASES.put("tab_swipe_animation","タブ切り替えアニメーション");
    KEY_ALIASES.put("tab_switch_animation","タブ切り替えアニメーション");
    KEY_ALIASES.put("tab_animation_enabled","タブ切り替えアニメーション");
    KEY_ALIASES.put("show_watch_progress","サムネイルに視聴進捗を表示");
    KEY_ALIASES.put("main_rotation","通常画面の向き");
    KEY_ALIASES.put("player_rotation","再生画面の向き");
    KEY_ALIASES.put("display_mode","通常画面の向き");
    KEY_ALIASES.put("app_lang","アプリ全体の言語");
    KEY_ALIASES.put("video_menu_options","動画メニューの表示項目");
    KEY_ALIASES.put("video_info_follow_button","動画情報欄のボタン");
    KEY_ALIASES.put("multiple_video_tabs_at_bottom","アプリバーとタブバーの配置");
    KEY_ALIASES.put("nicoid_app_tab_layout","アプリバーとタブバーの配置");
    KEY_ALIASES.put("google_cast","接続");
    KEY_ALIASES.put("comment_fetch_limit","コメント取得数");
    KEY_ALIASES.put("play_mode","再生モード");
    KEY_ALIASES.put("quality_mode","画質");
    KEY_ALIASES.put("mobile_quality_mode","モバイル通信時の画質");
    KEY_ALIASES.put("default_playback_speed","デフォルトの再生速度");
    KEY_ALIASES.put("nicoid_share_debug","デバッグログの保存");
    KEY_ALIASES.put("nicoid_external_back_playback","リンクから起動した場合の戻る動作");
    KEY_ALIASES.put("mp4_tree_uri","動画・音声の保存先フォルダ");
 }
 public static void updateLanguage(PreferenceActivity activity){
  if(activity==null||activity.isFinishing()||activity.isDestroyed())return;
  // Repaint titles in place after an app language change. Do not rebuild,
  // reorder, or reparent any preference when only the locale changes.
  for(int i=0;i<CATEGORIES.length;i++){
   Preference group=activity.findPreference(PREFIX+(i+1));
   if(group instanceof PreferenceCategory){
    String[] labels=CATEGORIES[i];
    group.setTitle(PanelUi.tr(activity,labels[0],labels[1],labels[2]));
   }
  }
 }
 private SettingsCategories241(){}

 private static String normalized(CharSequence title){
  if(title==null)return "";
  String value=Normalizer.normalize(title.toString(),Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
  StringBuilder result=new StringBuilder(value.length());
  for(int i=0;i<value.length();i++){
   char c=value.charAt(i);
   if(Character.isWhitespace(c)||Character.isSpaceChar(c)||
      ":：・-‐‑–—".indexOf(c)>=0)continue;
   result.append(c);
  }
  return result.toString();
 }
 private static boolean matches(String actual,String expected){
  if(actual.equals(normalized(expected)))return true;
  // The original native preferences can already be in another language.
  if(actual.equals(normalized(UiStrings.translate(expected,Locale.JAPANESE))))return true;
  if(actual.equals(normalized(UiStrings.translate(expected,Locale.ENGLISH))))return true;
  if(actual.equals(normalized(UiStrings.translate(expected,Locale.TRADITIONAL_CHINESE))))return true;
  return actual.equals(normalized(UiStrings.translate(expected)));
 }
 private static int[] locate(Preference pref){
  String key=pref.getKey(),name=pref.getTitle()==null?"":pref.getTitle().toString();
  // The extra dev-only setting is not one of the 79 release settings.
  if("nicoid_storage_diagnostic".equals(key))return new int[]{15,1};
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
  String[] labels=CATEGORIES[which];
  String localized=PanelUi.tr(a,labels[0],labels[1],labels[2]);
  if(found instanceof PreferenceCategory){
   // In-place language changes can reuse the same preference tree.
   PreferenceCategory existing=(PreferenceCategory)found;
   existing.setTitle(localized);
   existing.setOrder(which);
   existing.setOrderingAsAdded(false);
   return existing;
  }
  if(found!=null)throw new IllegalStateException("Category key collision "+key);
  PreferenceCategory created=new PreferenceCategory(a);
  created.setKey(key);
  created.setTitle(localized);
  created.setOrder(which);
  created.setOrderingAsAdded(false);
  root.addPreference(created);
  return created;
 }
 private static int fallbackCategory(PreferenceCategory owner){
  if(owner==null)return 0;
  String key=owner.getKey();
  if(key!=null&&key.startsWith(PREFIX)){
   try{
    int index=Integer.parseInt(key.substring(PREFIX.length()))-1;
    if(index>=0&&index<CATEGORIES.length)return index;
   }catch(NumberFormatException ignored){}
  }
  String title=normalized(owner.getTitle());
  // Preserve unrecognized dev preferences without retaining old category rows.
  if(title.contains("debug")||title.contains("デバッグ")||title.contains("偵錯"))return 15;
  if(title.contains("cache")||title.contains("キャッシュ")||title.contains("快取"))return 13;
  if(title.contains("backup")||title.contains("バックアップ")||title.contains("備份"))return 16;
  if(title.contains("googlecast"))return 14;
  if(title.contains("account")||title.contains("アカウント")||title.contains("帳號"))return 1;
  if(title.contains("about")||title.contains("nicoidについて")||title.contains("關於"))return 17;
  if(title.contains("player")||title.contains("プレーヤー")||title.contains("播放器"))return 7;
  return 0;
 }
 public static void apply(PreferenceActivity a){
  if(a==null||a.isFinishing()||a.isDestroyed())return;
  UiStrings.selectLanguage(android.preference.PreferenceManager.getDefaultSharedPreferences(a).getString("app_lang","0"));
  PreferenceScreen root=a.getPreferenceScreen();
  if(root==null)return;
  try{
   ArrayList<Preference> candidates=new ArrayList<>();
   ArrayList<PreferenceCategory> prior=new ArrayList<>();
   IdentityHashMap<Preference,PreferenceCategory> origins=new IdentityHashMap<>();
   // Include generated groups too: locale changes may reuse the same screen.
   for(int i=0;i<root.getPreferenceCount();i++){
    Preference item=root.getPreference(i);
    if(item instanceof PreferenceCategory){
     PreferenceCategory group=(PreferenceCategory)item;
     if(group.getKey()==null||!group.getKey().startsWith(PREFIX))prior.add(group);
     for(int j=0;j<group.getPreferenceCount();j++){
      Preference child=group.getPreference(j);
      candidates.add(child);
      origins.put(child,group);
     }
    }else{
     candidates.add(item);
    }
   }
   PreferenceCategory[] groups=new PreferenceCategory[CATEGORIES.length];
   int[] counts=new int[CATEGORIES.length];
   int[] extraOrder=new int[CATEGORIES.length];
   Set<String> duplicate=new HashSet<>();
   for(int i=0;i<CATEGORIES.length;i++)groups[i]=category(a,root,i);
   int unidentified=0;
   for(Preference p:candidates){
    int[] target=locate(p);
    if(target==null){
     unidentified++;
     PreferenceCategory source=origins.get(p);
     if(source==null){
      Log.w(TAG,"Unclassified root preference left unchanged: "+p.getKey()+" / "+p.getTitle());
      continue;
     }
     int fallback=fallbackCategory(source);
     target=new int[]{fallback,1000+extraOrder[fallback]++};
     Log.w(TAG,"Unclassified preference preserved in category "+fallback+
       ": "+p.getKey()+" / "+p.getTitle()+" (from "+source.getTitle()+")");
    }
    PreferenceGroup from=parent(root,p);
    if(from==null)continue;
    // Reapply the canonical visible label from stable keys on every locale
    // rebuild. This changes no preference identity, value, dependency or action.
    if(target[1]>=0 && target[1]<ITEMS[target[0]].length){
      String translated=UiStrings.translate(ITEMS[target[0]][target[1]]);
      if(translated!=null&&!translated.isEmpty())p.setTitle(translated);
    }
    PreferenceCategory destination=groups[target[0]];
    // Never recreate a setting, its listener, key, stored value or dialog.
    // Reinsert to make Android's preference adapter obey the final order.
    from.removePreference(p);
    p.setOrder(target[1]);
    destination.addPreference(p);
    counts[target[0]]++;
    String marker=target[0]+":"+target[1];
    if(!duplicate.add(marker))Log.w(TAG,"Multiple settings map to "+marker);
   }
   for(PreferenceCategory original:prior){
    if(original.getPreferenceCount()==0)root.removePreference(original);
    else{
     original.setOrder(10000+prior.indexOf(original));
     Log.e(TAG,"Original category still populated: "+original.getKey()+" / "+original.getTitle());
    }
   }
   int placed=0;
   for(int n:counts)placed+=n;
   Log.i(TAG,"categorized="+placed+", release settings=79, extra/unclassified="+
        unidentified+", categories="+CATEGORIES.length);
   SettingsValue251.install(a);
   SettingsLabels252.install(a);
  }catch(RuntimeException problem){
   Log.e(TAG,"Category migration failed (settings values remain unchanged)",problem);
  }
 }
}
