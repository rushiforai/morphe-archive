package io.github.sabopura.morphe.extension.twitch.danmaku;

import android.content.Context;
import android.content.SharedPreferences;

import io.github.sabopura.morphe.extension.twitch.SafePreferences;

/** Persistent danmaku settings. */
public final class DanmakuSettings {
    public static final String PREFERENCES = "sabopura_twitch_danmaku";

    public static final String KEY_ENABLED = "enabled";
    public static final String KEY_VOD = "vod_enabled";
    public static final String KEY_MATCH_DELAY = "match_stream_delay";
    public static final String KEY_FONT_SIZE = "font_size_sp";
    public static final String KEY_OPACITY = "opacity_percent";
    public static final String KEY_DURATION = "duration_seconds";
    public static final String KEY_COVERAGE = "coverage_percent";
    public static final String KEY_MAX_LENGTH = "max_length";
    public static final String KEY_MAX_ON_SCREEN = "max_on_screen";
    public static final String KEY_SHOW_EMOTES = "show_emotes";
    public static final String KEY_CHAT_COLORS = "chat_colors";
    public static final String KEY_SHOW_NAMES = "show_names";
    public static final String KEY_BOLD = "bold";
    public static final String KEY_NG_WORDS = "ng_words";

    public static final int MIN_FONT_SIZE = 12;
    public static final int MAX_FONT_SIZE = 40;
    public static final int MIN_OPACITY = 20;
    public static final int MIN_DURATION = 3;
    public static final int MAX_DURATION = 15;
    public static final int MIN_COVERAGE = 20;
    public static final int MIN_MAX_LENGTH = 10;
    public static final int MAX_MAX_LENGTH = 200;
    public static final int MIN_ON_SCREEN = 10;
    public static final int MAX_ON_SCREEN = 200;

    private static volatile DanmakuSettings current;

    public final boolean enabled;
    /** Also flow the chat replay of VODs. */
    public final boolean vod;
    /** Hold live comments back by how far the video is behind. */
    public final boolean matchDelay;
    public final int fontSizeSp;
    public final int opacityPercent;
    public final int durationSeconds;
    public final int coveragePercent;
    public final int maxLength;
    public final int maxOnScreen;
    public final boolean showEmotes;
    public final boolean chatColors;
    public final boolean showNames;
    public final boolean bold;
    final CommentFilter filter;

    private DanmakuSettings(SharedPreferences preferences) {
        enabled = preferences.getBoolean(KEY_ENABLED, true);
        vod = preferences.getBoolean(KEY_VOD, true);
        matchDelay = preferences.getBoolean(KEY_MATCH_DELAY, true);
        fontSizeSp = clamp(preferences.getInt(KEY_FONT_SIZE, TwitchDanmaku.configFontSizeSp()),
                MIN_FONT_SIZE, MAX_FONT_SIZE);
        opacityPercent = clamp(preferences.getInt(KEY_OPACITY,
                TwitchDanmaku.configOpacityPercent()), MIN_OPACITY, 100);
        durationSeconds = clamp(preferences.getInt(KEY_DURATION,
                TwitchDanmaku.configDurationSeconds()), MIN_DURATION, MAX_DURATION);
        coveragePercent = clamp(preferences.getInt(KEY_COVERAGE,
                TwitchDanmaku.configCoveragePercent()), MIN_COVERAGE, 100);
        maxLength = clamp(preferences.getInt(KEY_MAX_LENGTH, TwitchDanmaku.configMaxLength()),
                MIN_MAX_LENGTH, MAX_MAX_LENGTH);
        maxOnScreen = clamp(preferences.getInt(KEY_MAX_ON_SCREEN, 80),
                MIN_ON_SCREEN, MAX_ON_SCREEN);
        showEmotes = preferences.getBoolean(KEY_SHOW_EMOTES, true);
        chatColors = preferences.getBoolean(KEY_CHAT_COLORS, false);
        showNames = preferences.getBoolean(KEY_SHOW_NAMES, false);
        bold = preferences.getBoolean(KEY_BOLD, true);
        filter = CommentFilter.parse(preferences.getString(KEY_NG_WORDS, ""));
    }

    private static volatile boolean adopted;

    public static SharedPreferences preferences(Context context) {
        Context application = context.getApplicationContext();
        SharedPreferences preferences =
                SafePreferences.of(application.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE));
        if (!adopted) {
            synchronized (DanmakuSettings.class) {
                if (!adopted) {
                    adopted = true;
                    // Earlier builds stored these settings under another prefix.
                    LegacyPreferences.adopt(application, preferences, PREFERENCES,
                            "_twitch_danmaku");
                }
            }
        }
        return preferences;
    }

    public static DanmakuSettings get(Context context) {
        DanmakuSettings settings = current;
        if (settings == null) {
            settings = new DanmakuSettings(preferences(context));
            current = settings;
        }
        return settings;
    }

    /** Last loaded settings, or null before any player view was attached. */
    static DanmakuSettings peek() {
        return current;
    }

    public static void reload(Context context) {
        current = new DanmakuSettings(preferences(context));
    }

    public static void setEnabled(Context context, boolean enabled) {
        preferences(context).edit().putBoolean(KEY_ENABLED, enabled).apply();
        reload(context);
    }

    /** The blocked-word expressions in {@code rules} that are not applied, for the settings to say so. */
    public static java.util.List<String> refusedRules(String rules) {
        return CommentFilter.refused(rules);
    }

    public static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
