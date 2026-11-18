package io.github.sabopura.morphe.extension.twitch.chat;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;

import io.github.sabopura.morphe.extension.twitch.SafePreferences;

import java.util.HashSet;
import java.util.Set;

/** Read once and kept, since chat rows bind many times a second; {@link #reload} after a change. */
public final class ChatSettings {
    public final boolean enabled, sevenTv, bttv, ffz, repeats, timestamps;
    public final boolean alternating, showLogin, timestampSeconds, vibrateHighlight, saveHistory;
    public final boolean badges, pronouns, paints;
    public final boolean compactBadges, compactEmotes, firstChatters, emotePreview, highlightMentions;
    public final boolean deletedStrike, ignoreClearChat, hideGiftBanners, hideGiftLeaderboards, hideWatchStreaks;
    private final Set<String> badgeProviders = new HashSet<>();
    public final int fontPercent, highlightColor, vibrationMs, emotePercent, badgePercent, spacingPercent;
    public final ChatRules rules;
    private static volatile ChatSettings cached;
    private static volatile Context app;

    private ChatSettings(SharedPreferences p) {
        enabled = p.getBoolean("enabled", true);
        sevenTv = p.getBoolean("7tv", true);
        bttv = p.getBoolean("bttv", true);
        ffz = p.getBoolean("ffz", true);
        repeats = p.getBoolean("repeats", false);
        timestamps = p.getBoolean("timestamps", false);
        alternating = p.getBoolean("alternating", false);
        showLogin = p.getBoolean("show_login", false);
        timestampSeconds = p.getBoolean("timestamp_seconds", false);
        vibrateHighlight = p.getBoolean("vibrate_highlight", false);
        saveHistory = p.getBoolean("save_history", false);
        badges = p.getBoolean("badges", false);
        pronouns = p.getBoolean("pronouns", false);
        paints = p.getBoolean("7tv_paints", false);
        for (String provider : new String[] {"7tv", "ffz", "chatterino", "bttv", "dankchat", "chatsen"})
            if (p.getBoolean("badge_" + provider, true)) badgeProviders.add(provider);
        fontPercent = Math.max(70, Math.min(160, p.getInt("font_percent", 100)));
        emotePercent = Math.max(50, Math.min(200, p.getInt("emote_percent", 100)));
        badgePercent = Math.max(50, Math.min(200, p.getInt("badge_percent", 100)));
        spacingPercent = Math.max(25, Math.min(300, p.getInt("spacing_percent", 100)));
        compactBadges = p.getBoolean("compact_badges", false);
        compactEmotes = p.getBoolean("compact_emotes", false);
        firstChatters = p.getBoolean("first_chatters", false);
        emotePreview = p.getBoolean("emote_preview", false);
        highlightMentions = p.getBoolean("highlight_mentions", false);
        deletedStrike = "strikethrough".equals(p.getString("deleted_style", "spoiler"));
        ignoreClearChat = p.getBoolean("ignore_clear_chat", false);
        hideGiftBanners = p.getBoolean("hide_gift_banners", false);
        hideGiftLeaderboards = p.getBoolean("hide_gift_leaderboards", false);
        hideWatchStreaks = p.getBoolean("hide_watch_streaks", false);
        highlightColor = p.getInt("highlight_color", Color.argb(100, 145, 70, 255));
        vibrationMs = p.getInt("vibration_ms", 100);
        rules =
                new ChatRules(
                        p.getString("words", ""),
                        p.getString("users", ""),
                        p.getString("highlights", ""),
                        p.getString("highlight_users", ""));
    }

    public boolean badgeEnabled(String provider) {
        return badgeProviders.contains(provider);
    }

    public static SharedPreferences preferences(Context context) {
        app = context.getApplicationContext();
        return SafePreferences.of(app.getSharedPreferences("sabopura_chat", Context.MODE_PRIVATE));
    }

    /** For callers without a Context; null until any screen has read the settings. */
    public static SharedPreferences preferences() {
        Context context = app;
        return context == null ? null : preferences(context);
    }

    public static ChatSettings get(Context context) {
        ChatSettings result = cached;
        if (result == null) cached = result = new ChatSettings(preferences(context));
        return result;
    }

    /** For hooks that have no Context; null only before the app's first screen has initialized this. */
    public static ChatSettings current() {
        ChatSettings result = cached;
        if (result != null) return result;
        SharedPreferences prefs = preferences();
        return prefs == null ? null : (cached = new ChatSettings(prefs));
    }

    /** The loaded settings, or null when nothing has read them yet. */
    public static ChatSettings peek() {
        return cached;
    }

    public static void reload(Context context) {
        cached = new ChatSettings(preferences(context));
        ChatEnhancements.refresh();
        ViewCustomization.refresh();
    }
}
