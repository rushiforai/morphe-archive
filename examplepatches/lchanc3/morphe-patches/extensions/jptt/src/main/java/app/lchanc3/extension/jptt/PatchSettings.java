package app.lchanc3.extension.jptt;

import android.content.Context;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * The options these patches used to bake into the APK, read at runtime instead.
 *
 * <p>Each patch registers the default it was built with from
 * {@code JpttApplication.onCreate()}, and a patch that was not selected registers
 * nothing, so the settings page shows exactly the options the build actually has.
 * Everything else about a setting -- what it is called, what it explains, what
 * range it accepts -- belongs here, because this is what draws it.
 *
 * <p>Values are stored as text, which is what {@code EditTextPreference} writes,
 * in the same preferences file as the rest of the app's settings so that they are
 * covered by {@link SettingsBackup}.
 */
@SuppressWarnings("unused")
public final class PatchSettings {

    /** One option: what the patch supplied, and what this file knows about it. */
    public static final class Setting {
        public final String key;
        public final String title;
        public final String summary;
        public final int defaultValue;
        public final int min;
        public final int max;

        Setting(String key, String title, String summary, int defaultValue, int min, int max) {
            this.key = key;
            this.title = title;
            this.summary = summary;
            this.defaultValue = defaultValue;
            this.min = min;
            this.max = max;
        }
    }

    public static final String KEY_IMAGE_CACHE_MB = "lchanc3_image_cache_mb";
    public static final String KEY_IMAGE_MEMORY_CACHE_MB = "lchanc3_image_memory_cache_mb";
    public static final String KEY_IMAGE_MEMORY_RELEASE_MINUTES = "lchanc3_image_memory_release_minutes";
    public static final String KEY_PRELOAD_LIMIT = "lchanc3_preload_limit";
    public static final String KEY_PRELOAD_CONCURRENCY = "lchanc3_preload_concurrency";
    public static final String KEY_BOARD_KEYWORDS = "lchanc3_board_keyword_count";
    public static final String KEY_ALL_KEYWORDS = "lchanc3_all_keyword_count";

    /** Insertion ordered, so the page lists options in the order they registered. */
    private static final Map<String, Setting> REGISTRY = new LinkedHashMap<>();

    /** Called from the patched JpttApplication.onCreate(). */
    public static void registerImageCaches(int defaultMemoryMb, int defaultReleaseMinutes, int defaultDiskMb) {
        register(KEY_IMAGE_MEMORY_CACHE_MB, "圖片記憶體快取上限 (MB)",
                "看過和預先載入的圖片放在記憶體裡，捲動、回頭看都不用重新讀取，設為 0 關閉，一分鐘內生效",
                defaultMemoryMb, 0, 1536);
        register(KEY_IMAGE_MEMORY_RELEASE_MINUTES, "背景多久後釋放記憶體快取 (分鐘)",
                "應用程式在背景超過這段時間，就清空圖片記憶體快取，比較不會被系統關閉，設為 0 則一離開就清空",
                defaultReleaseMinutes, 0, 120);
        register(KEY_IMAGE_CACHE_MB, "圖片磁碟快取上限 (MB)",
                "存在手機裡的圖片快取容量，記憶體快取清掉之後從這裡讀，不必重新下載，重新啟動應用程式生效",
                defaultDiskMb, 16, 8192);
    }

    /** Called from the patched JpttApplication.onCreate(). */
    public static void registerPreload(int defaultLimit, int defaultConcurrency) {
        register(KEY_PRELOAD_LIMIT, "預載圖片張數",
                "開啟文章時預先下載的圖片數量",
                defaultLimit, 5, 300);
        register(KEY_PRELOAD_CONCURRENCY, "同時下載張數",
                "同時下載的圖片數量，數值越高載入越快，但記憶體用量越大，若發生閃退請調低",
                defaultConcurrency, 1, 8);
    }

    /** Called from the patched JpttApplication.onCreate(). */
    public static void registerRecentSearches(int defaultBoardCount, int defaultAllCount) {
        register(KEY_BOARD_KEYWORDS, "看板搜尋紀錄",
                "「這個看板」保留的搜尋紀錄筆數，預設為 5 筆",
                defaultBoardCount, 1, 50);
        register(KEY_ALL_KEYWORDS, "全站搜尋紀錄",
                "「所有看板」保留的搜尋紀錄筆數，預設為 15 筆",
                defaultAllCount, 1, 100);
    }

    private static void register(
            String key, String title, String summary, int defaultValue, int min, int max) {
        synchronized (REGISTRY) {
            REGISTRY.put(key, new Setting(key, title, summary, clamp(defaultValue, min, max), min, max));
        }
    }

    /** The options this build actually has, in registration order. */
    public static List<Setting> registered() {
        synchronized (REGISTRY) {
            return Collections.unmodifiableList(new ArrayList<>(REGISTRY.values()));
        }
    }

    public static Setting setting(String key) {
        synchronized (REGISTRY) {
            return REGISTRY.get(key);
        }
    }

    /** The stored value, or what the patch was built with when there is none. */
    public static int value(String key) {
        Setting setting = setting(key);
        if (setting == null) {
            return 0;
        }
        Context context = JpttContext.get();
        if (context == null) {
            return setting.defaultValue;
        }
        try {
            String stored = SettingsBackup.preferences(context).getString(key, null);
            if (stored == null || stored.trim().isEmpty()) {
                return setting.defaultValue;
            }
            return clamp(Integer.parseInt(stored.trim()), setting.min, setting.max);
        } catch (Throwable ex) {
            // A hand edited import, or preferences not ready yet.
            return setting.defaultValue;
        }
    }

    /**
     * Stores what was typed, or forgets the setting when the box was left empty,
     * which is how a value goes back to the default the patch was built with.
     * Kept here so that what is written is what {@link #value} would read back.
     */
    public static void store(Context context, String key, String text) {
        Setting setting = setting(key);
        if (context == null || setting == null) {
            return;
        }
        String trimmed = text == null ? "" : text.trim();
        android.content.SharedPreferences.Editor editor = SettingsBackup.preferences(context).edit();
        if (trimmed.isEmpty()) {
            editor.remove(key);
        } else {
            try {
                editor.putString(key, String.valueOf(
                        clamp(Integer.parseInt(trimmed), setting.min, setting.max)));
            } catch (NumberFormatException ex) {
                editor.remove(key);
            }
        }
        editor.apply();
    }

    // Called from the patched app, one per value that used to be a constant.

    public static long imageCacheBytes() {
        return (long) value(KEY_IMAGE_CACHE_MB) * 1024L * 1024L;
    }

    public static int imageMemoryCacheBytes() {
        return value(KEY_IMAGE_MEMORY_CACHE_MB) * 1024 * 1024;
    }

    public static long imageMemoryCacheReleaseMs() {
        return value(KEY_IMAGE_MEMORY_RELEASE_MINUTES) * 60L * 1000L;
    }

    public static int preloadLimit() {
        return value(KEY_PRELOAD_LIMIT);
    }

    public static int preloadConcurrency() {
        return value(KEY_PRELOAD_CONCURRENCY);
    }

    public static int boardKeywordCount() {
        return value(KEY_BOARD_KEYWORDS);
    }

    public static int allKeywordCount() {
        return value(KEY_ALL_KEYWORDS);
    }

    private static int clamp(int value, int min, int max) {
        return value < min ? min : (value > max ? max : value);
    }

    private PatchSettings() {
    }
}
