package io.github.sabopura.morphe.extension.youtube.danmaku;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/** Runtime settings backed by YouTube's native preference store. */
public final class DanmakuSettings {
    static final int REGULAR_MODE_ALL = 0;
    static final int REGULAR_MODE_TIMESTAMPS_ONLY = 1;
    static final int STREAM_MODE_CHAT_PREFERRED = 0;
    static final int STREAM_MODE_REGULAR_ONLY = 1;
    static final int STREAM_MODE_CHAT_AND_TIMESTAMPS = 2;
    static final int STYLE_OUTLINE = 0;
    static final int STYLE_SHADOW = 1;
    static final int STYLE_OUTLINE_AND_SHADOW = 2;
    static final int SPEED_CONSTANT_DURATION = 0;
    static final int SPEED_CONSTANT_SPEED = 1;
    static final int CROWD_SKIP = 0;
    static final int CROWD_OVERLAP = 1;

    /** What a settings change requires, from cheapest to most expensive. */
    static final int CHANGE_LAYOUT = 1;
    static final int CHANGE_FILTER = 2;
    static final int CHANGE_FETCH = 3;

    private static final String LEGACY_PREFERENCES_NAME = "danmaku_comments";
    private static final String MASTER = "danmaku_enabled";
    private static final String REGULAR = "danmaku_regular_enabled";
    private static final String LIVE = "danmaku_live_enabled";
    private static final String PREMIERE = "danmaku_premiere_enabled";
    /** Legacy combined key, migrated into LIVE and PREMIERE. */
    private static final String STREAM = "danmaku_stream_enabled";
    private static final String REGULAR_MODE = "danmaku_regular_mode";
    private static final String STREAM_COMMENT_MODE = "danmaku_stream_comment_mode";
    private static final String EXCLUDE_LONG = "danmaku_exclude_long";
    private static final String MAX_LENGTH = "danmaku_max_length";
    private static final String NG_WORDS = "danmaku_ng_words";
    private static final String MERGE_DUPLICATES = "danmaku_merge_duplicates";
    private static final String HIGHLIGHT_PAID = "danmaku_highlight_paid";
    private static final String FONT_SIZE = "danmaku_font_size";
    private static final String BOLD = "danmaku_bold";
    private static final String TEXT_STYLE = "danmaku_text_style";
    private static final String OPACITY = "danmaku_opacity";
    private static final String DURATION = "danmaku_duration";
    private static final String SPEED_MODE = "danmaku_speed_mode";
    private static final String COVERAGE = "danmaku_coverage";
    private static final String CROWD_MODE = "danmaku_crowd_mode";
    private static final String SMALL_PLAYER = "danmaku_small_player_enabled";
    private static final String SMALL_PLAYER_SCALE = "danmaku_small_player_scale";
    private static final String MAX_COMMENTS = "danmaku_max_comments";
    private static final String SMOOTH_MOTION = "danmaku_smooth_motion";
    private static final String SHOW_STATS = "danmaku_show_stats";
    private static final String SEPARATE_LAYER = "danmaku_separate_layer";
    private static final String MAX_FPS = "danmaku_max_fps";

    private static final String[] ALL_KEYS = {
            MASTER, REGULAR, LIVE, PREMIERE, STREAM, REGULAR_MODE, STREAM_COMMENT_MODE,
            EXCLUDE_LONG, MAX_LENGTH, NG_WORDS, MERGE_DUPLICATES, HIGHLIGHT_PAID,
            FONT_SIZE, BOLD, TEXT_STYLE, OPACITY, DURATION, SPEED_MODE, COVERAGE, CROWD_MODE,
            SMALL_PLAYER, SMALL_PLAYER_SCALE, MAX_COMMENTS, SMOOTH_MOTION, SHOW_STATS, SEPARATE_LAYER,
            MAX_FPS
    };
    private static final String[] NUMERIC_KEYS = {
            REGULAR_MODE, STREAM_COMMENT_MODE, MAX_LENGTH, FONT_SIZE, TEXT_STYLE, OPACITY,
            DURATION, SPEED_MODE, COVERAGE, CROWD_MODE, SMALL_PLAYER_SCALE, MAX_COMMENTS, MAX_FPS
    };
    private static final Set<String> FETCH_KEYS = new HashSet<>(Arrays.asList(
            MASTER, REGULAR, LIVE, PREMIERE, STREAM_COMMENT_MODE, MAX_COMMENTS));
    private static final Set<String> FILTER_KEYS = new HashSet<>(Arrays.asList(
            REGULAR_MODE, EXCLUDE_LONG, MAX_LENGTH, NG_WORDS, MERGE_DUPLICATES,
            HIGHLIGHT_PAID));

    /** Coalesces the callbacks fired while Android inflates the native preference screen. */
    private static final Handler notificationHandler = new Handler(Looper.getMainLooper());
    private static int pendingChange;
    private static final Runnable notifySettingsChanged = () -> {
        int change;
        synchronized (DanmakuSettings.class) {
            change = pendingChange;
            pendingChange = 0;
        }
        if (change != 0) DanmakuController.onSettingsChanged(change);
    };

    private static final SharedPreferences.OnSharedPreferenceChangeListener preferenceListener =
            (sharedPreferences, key) -> {
                if (key != null && key.startsWith("danmaku_")) reloadAndNotify(key);
            };

    private static volatile SharedPreferences preferences;
    private static volatile boolean masterEnabled = true;
    private static volatile boolean regularEnabled = true;
    private static volatile boolean liveEnabled = true;
    private static volatile boolean premiereEnabled = true;
    private static volatile int regularMode = REGULAR_MODE_ALL;
    private static volatile int streamCommentMode = STREAM_MODE_CHAT_PREFERRED;
    private static volatile boolean excludeLong = true;
    private static volatile int maxLength = 100;
    private static volatile CommentFilter ngFilter = CommentFilter.EMPTY;
    private static volatile boolean mergeDuplicates = true;
    private static volatile boolean smoothMotion = true;
    private static volatile boolean showStats;
    private static volatile boolean separateLayer = true;
    /** 0 = the display's highest rate, otherwise the most comment frames per second. */
    private static volatile int maxFps;
    private static volatile boolean highlightPaid = true;
    private static volatile int fontSize = 22;
    private static volatile boolean bold = true;
    private static volatile int textStyle = STYLE_OUTLINE;
    private static volatile int opacity = 90;
    private static volatile int duration = 8;
    private static volatile int speedMode = SPEED_CONSTANT_DURATION;
    private static volatile int coverage = 65;
    private static volatile int crowdMode = CROWD_SKIP;
    private static volatile boolean smallPlayerEnabled = true;
    private static volatile int smallPlayerScale = 80;
    private static volatile int maxComments = 200;
    /** Bumped whenever a value affecting rendering changes, so caches can be dropped. */
    private static volatile int styleGeneration;

    private DanmakuSettings() {
    }

    public static synchronized void initialize(Context context) {
        if (context == null || preferences != null) return;
        Context application = context.getApplicationContext();
        SharedPreferences nativePreferences =
                io.github.sabopura.morphe.extension.youtube.shared.SettingsStore.open(context);
        migrateLegacyPreferences(application, nativePreferences);
        migrateCombinedStreamPreference(nativePreferences);
        normalizeNumericPreferences(nativePreferences);
        preferences = nativePreferences;
        reload();
        nativePreferences.registerOnSharedPreferenceChangeListener(preferenceListener);
    }

    /** Converts values written by older builds before a ListPreference reads them. */
    static void normalizeForPreferenceScreen(SharedPreferences screenPreferences) {
        normalizeNumericPreferences(screenPreferences);
    }

    static synchronized void reload() {
        SharedPreferences prefs = preferences;
        if (prefs == null) return;
        masterEnabled = prefs.getBoolean(MASTER, true);
        regularEnabled = prefs.getBoolean(REGULAR, true);
        liveEnabled = prefs.getBoolean(LIVE, true);
        premiereEnabled = prefs.getBoolean(PREMIERE, true);
        regularMode = clamp(getInt(prefs, REGULAR_MODE, REGULAR_MODE_ALL), 0, 1);
        streamCommentMode = clamp(getInt(prefs, STREAM_COMMENT_MODE,
                STREAM_MODE_CHAT_PREFERRED), 0, 2);
        excludeLong = prefs.getBoolean(EXCLUDE_LONG, true);
        maxLength = clamp(getInt(prefs, MAX_LENGTH, DanmakuController.configMaxLength()), 20, 300);
        ngFilter = CommentFilter.parse(getString(prefs, NG_WORDS));
        mergeDuplicates = prefs.getBoolean(MERGE_DUPLICATES, true);
        smoothMotion = prefs.getBoolean(SMOOTH_MOTION, true);
        showStats = prefs.getBoolean(SHOW_STATS, false);
        separateLayer = prefs.getBoolean(SEPARATE_LAYER, true);
        maxFps = getInt(prefs, MAX_FPS, 0) == 60 ? 60 : 0;
        highlightPaid = prefs.getBoolean(HIGHLIGHT_PAID, true);
        fontSize = clamp(getInt(prefs, FONT_SIZE, DanmakuController.configFontSizeSp()), 12, 48);
        bold = prefs.getBoolean(BOLD, true);
        textStyle = clamp(getInt(prefs, TEXT_STYLE, STYLE_OUTLINE), 0, 2);
        opacity = clamp(getInt(prefs, OPACITY, DanmakuController.configOpacityPercent()), 20, 100);
        duration = clamp(getInt(prefs, DURATION, DanmakuController.configTravelDurationSeconds()), 3, 20);
        speedMode = clamp(getInt(prefs, SPEED_MODE, SPEED_CONSTANT_DURATION), 0, 1);
        coverage = clamp(getInt(prefs, COVERAGE, DanmakuController.configLaneCoveragePercent()), 20, 100);
        crowdMode = clamp(getInt(prefs, CROWD_MODE, CROWD_SKIP), 0, 1);
        smallPlayerEnabled = prefs.getBoolean(SMALL_PLAYER, true);
        smallPlayerScale = clamp(getInt(prefs, SMALL_PLAYER_SCALE, 80), 50, 100);
        maxComments = clamp(getInt(prefs, MAX_COMMENTS, DanmakuController.configMaxComments()), 20, 500);
        styleGeneration++;
    }

    static void setBoolean(String key, boolean value) {
        SharedPreferences prefs = preferences;
        if (prefs == null) return;
        prefs.edit().putBoolean(key, value).apply();
    }

    public static boolean toggleMaster(Context context) {
        initialize(context);
        boolean enabled = !isMasterEnabled();
        // Update the in-memory value immediately so the flyout label is correct even
        // before the asynchronous preference listener fires.
        masterEnabled = enabled;
        setBoolean(MASTER, enabled);
        return enabled;
    }

    static void reset() {
        SharedPreferences prefs = preferences;
        if (prefs == null) return;
        SharedPreferences.Editor editor = prefs.edit();
        for (String key : ALL_KEYS) editor.remove(key);
        editor.commit();
        reloadAndNotify(MASTER);
    }

    private static void migrateLegacyPreferences(Context context, SharedPreferences target) {
        if (target.contains(MASTER)) return;
        SharedPreferences legacy = context.getSharedPreferences(
                LEGACY_PREFERENCES_NAME, Context.MODE_PRIVATE);
        if (!legacy.contains("enabled")) return;

        SharedPreferences.Editor editor = target.edit()
                .putBoolean(MASTER, legacy.getBoolean("enabled", true))
                .putBoolean(REGULAR, legacy.getBoolean("regular_enabled", true))
                .putBoolean(LIVE, legacy.getBoolean("stream_enabled", true))
                .putBoolean(PREMIERE, legacy.getBoolean("stream_enabled", true))
                .putBoolean(EXCLUDE_LONG, legacy.getBoolean("exclude_long", true));
        copyLegacyInt(legacy, editor, "regular_mode", REGULAR_MODE, REGULAR_MODE_ALL);
        copyLegacyInt(legacy, editor, "max_length", MAX_LENGTH,
                DanmakuController.configMaxLength());
        copyLegacyInt(legacy, editor, "font_size", FONT_SIZE,
                DanmakuController.configFontSizeSp());
        copyLegacyInt(legacy, editor, "opacity", OPACITY,
                DanmakuController.configOpacityPercent());
        copyLegacyInt(legacy, editor, "duration", DURATION,
                DanmakuController.configTravelDurationSeconds());
        copyLegacyInt(legacy, editor, "coverage", COVERAGE,
                DanmakuController.configLaneCoveragePercent());
        copyLegacyInt(legacy, editor, "max_comments", MAX_COMMENTS,
                DanmakuController.configMaxComments());
        editor.apply();
    }

    private static void migrateCombinedStreamPreference(SharedPreferences target) {
        if ((!target.contains(LIVE) || !target.contains(PREMIERE)) && target.contains(STREAM)) {
            boolean combined = target.getBoolean(STREAM, true);
            SharedPreferences.Editor editor = target.edit();
            if (!target.contains(LIVE)) editor.putBoolean(LIVE, combined);
            if (!target.contains(PREMIERE)) editor.putBoolean(PREMIERE, combined);
            editor.apply();
        }
    }

    private static void copyLegacyInt(SharedPreferences source, SharedPreferences.Editor target,
                                      String oldKey, String newKey, int defaultValue) {
        target.putString(newKey, Integer.toString(getInt(source, oldKey, defaultValue)));
    }

    private static void normalizeNumericPreferences(SharedPreferences prefs) {
        if (prefs == null) return;
        Map<String, ?> all = prefs.getAll();
        Map<String, String> replacements = new LinkedHashMap<>();
        for (String key : NUMERIC_KEYS) {
            Object value = all.get(key);
            if (value instanceof Number) {
                replacements.put(key, Integer.toString(((Number) value).intValue()));
            }
        }
        if (replacements.isEmpty()) return;

        // Remove first so Android cannot retain the old value type in its in-memory map.
        SharedPreferences.Editor remove = prefs.edit();
        for (String key : replacements.keySet()) remove.remove(key);
        remove.commit();

        SharedPreferences.Editor replace = prefs.edit();
        for (Map.Entry<String, String> entry : replacements.entrySet()) {
            replace.putString(entry.getKey(), entry.getValue());
        }
        replace.commit();
    }

    private static int getInt(SharedPreferences prefs, String key, int defaultValue) {
        try {
            return prefs.getInt(key, defaultValue);
        } catch (ClassCastException ignored) {
            try {
                String value = prefs.getString(key, Integer.toString(defaultValue));
                return value == null ? defaultValue : Integer.parseInt(value.trim());
            } catch (RuntimeException ignoredAgain) {
                return defaultValue;
            }
        }
    }

    private static String getString(SharedPreferences prefs, String key) {
        try {
            return prefs.getString(key, "");
        } catch (ClassCastException ignored) {
            return "";
        }
    }

    static int changeKind(String key) {
        if (FETCH_KEYS.contains(key)) return CHANGE_FETCH;
        if (FILTER_KEYS.contains(key)) return CHANGE_FILTER;
        return CHANGE_LAYOUT;
    }

    private static void reloadAndNotify(String key) {
        reload();
        synchronized (DanmakuSettings.class) {
            pendingChange = Math.max(pendingChange, changeKind(key));
        }
        notificationHandler.removeCallbacks(notifySettingsChanged);
        notificationHandler.postDelayed(notifySettingsChanged, 300L);
    }

    public static boolean isMasterEnabled() { return masterEnabled; }
    static boolean isRegularEnabled() { return regularEnabled; }
    static boolean isLiveEnabled() { return liveEnabled; }
    static boolean isPremiereEnabled() { return premiereEnabled; }
    static int getRegularMode() { return regularMode; }
    static int getStreamCommentMode() { return streamCommentMode; }
    static boolean shouldExcludeLong() { return excludeLong; }
    static int getMaxLength() { return maxLength; }
    static CommentFilter getNgFilter() { return ngFilter; }
    static boolean shouldMergeDuplicates() { return mergeDuplicates; }
    static boolean isSmoothMotion() { return smoothMotion; }
    static boolean isShowStats() { return showStats; }
    static boolean isSeparateLayer() { return separateLayer; }

    static int getMaxFps() { return maxFps; }
    static boolean shouldHighlightPaid() { return highlightPaid; }
    static int getFontSize() { return fontSize; }
    static boolean isBold() { return bold; }
    static int getTextStyle() { return textStyle; }
    static int getOpacity() { return opacity; }
    static int getDuration() { return duration; }
    static int getSpeedMode() { return speedMode; }
    static int getCoverage() { return coverage; }
    static int getCrowdMode() { return crowdMode; }
    static boolean isSmallPlayerEnabled() { return smallPlayerEnabled; }
    static int getSmallPlayerScale() { return smallPlayerScale; }
    static int getMaxComments() { return maxComments; }
    static int getStyleGeneration() { return styleGeneration; }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
