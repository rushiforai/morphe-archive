package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.view.Menu;
import android.view.MenuItem;
import java.lang.reflect.Method;
import java.util.Locale;

/** Runtime locale additions for native list, queue and multi-select surfaces.
 * Keeps UiStrings' existing translations and locale-selection semantics intact.
 */
public final class LocalePatch215 {
    private LocalePatch215() {}

    /** Returns null for entries already covered by the stable dictionary. */
    public static String[] lookup(String text) {
        if (text == null) return null;
        switch (text) {
            case "再生キュー": return pair("Playback queue", "播放佇列");
            case "再生待ちの動画はありません": return pair("No videos in the playback queue", "播放佇列中沒有影片");
            case "再生キューから削除しますか？": return pair("Remove from playback queue?", "要從播放佇列移除嗎？");
            case "複数選択": return pair("Select multiple", "多選");
            case "一括登録": return pair("Add selected videos", "批次加入影片");
            case "全選択": return pair("Select all", "全選");
            case "全解除": return pair("Deselect all", "取消全選");
            case "移動": return pair("Move", "移動");
            case "完了": return pair("Done", "完成");
            case "登録": return pair("Add", "加入");
            default: return null;
        }
    }

    private static String[] pair(String english, String chinese) {
        return new String[]{english, chinese};
    }

    /** Use the in-app language selected in UiStrings, not the system locale. */
    public static int language(Context context) {
        try {
            Class<?> type = Class.forName("e.e.a.UiStrings");
            Method method = type.getMethod("translate", String.class);
            String marker = (String)method.invoke(null, "更新");
            if ("Refresh".equals(marker)) return 1;
            if ("重新整理".equals(marker)) return 2;
            if ("更新".equals(marker)) return 0;
        } catch (Exception ignored) { }
        Locale locale = context == null ? Locale.getDefault()
            : context.getResources().getConfiguration().locale;
        String lang = locale.getLanguage();
        return "en".equals(lang) ? 1 : "zh".equals(lang) ? 2 : 0;
    }

    public static String label(Context c, String japanese, String english, String chinese) {
        int l = language(c);
        return l == 1 ? english : l == 2 ? chinese : japanese;
    }

    /** Preserve the uploader's name when translating dynamically formed headings. */
    public static CharSequence title(CharSequence source, String refreshMarker) {
        if (source == null) return null;
        String title = source.toString();
        String suffix = "の投稿動画";
        if (!title.endsWith(suffix) || title.length() <= suffix.length()) return source;
        String uploader = title.substring(0,title.length()-suffix.length());
        if ("Refresh".equals(refreshMarker)) return uploader + "'s uploaded videos";
        if ("重新整理".equals(refreshMarker)) return uploader + " 的投稿影片";
        return source;
    }

    /** FollowFeed has already installed its own Refresh action. Never append a twin. */
    /**
     * The tab host is reused between NicoRepo and local playlists. PAGES can
     * retain an inactive playlist even while the visible tab is NicoRepo.
     * Only the *currently routed* playlist may contribute playlist actions.
     */
    public static boolean isActivePlaylist(Activity activity) {
        if (activity == null) return false;
        android.content.Intent intent = activity.getIntent();
        return intent != null && intent.getBooleanExtra("nicoid_local_playlists", false);
    }

    public static boolean shouldSkipTabRefresh(Menu menu) {
        if(menu==null||menu.size()!=1)return false;
        MenuItem first=menu.getItem(0);
        if(first.getItemId()!=0||first.getTitle()==null)return false;
        String label=first.getTitle().toString();
        return "更新".equals(label)||"Refresh".equals(label)||"重新整理".equals(label);
    }


}
