package e.e.a;
import java.util.Locale;

/** Resolve visibility by action title; preserve original stored preferences. */
public final class MenuVisible203 {
 private MenuVisible203(){}
 public static String keyForAction(ListActions.Action action) {
  if (action==null) return "";
  String title=action.title==null?"":action.title.toLowerCase(Locale.ROOT);
  if (title.contains("ポップアップ再生")||title.contains("popup playback")||
      title.contains("懸浮播放")||title.contains("浮動播放"))
   return "video_menu_visible_9";
  if (title.contains("バックグラウンド再生")||
      title.contains("background playback")||title.contains("背景播放"))
   return "video_menu_visible_7";
  return "video_menu_visible_"+action.id;
 }
}
