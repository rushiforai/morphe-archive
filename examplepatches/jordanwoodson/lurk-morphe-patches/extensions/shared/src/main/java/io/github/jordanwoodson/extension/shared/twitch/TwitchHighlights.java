package io.github.jordanwoodson.extension.shared.twitch;

import android.view.View;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Presentation-only filters for chat highlights, player buttons and other interface extras. They decide
 * whether Twitch shows something; no chat message, account or playback state is changed.
 */
@SuppressWarnings("unused")
public final class TwitchHighlights {
    static final String HYPE_TRAIN = "hide_hype_train";
    static final String LEADERBOARDS = "hide_leaderboards";
    static final String SUB_NOTICES = "hide_sub_notices";
    static final String PINNED_CHEERS = "hide_pinned_cheers";
    static final String WATCH_STREAKS = "hide_watch_streaks";
    static final String CELEBRATIONS = "hide_celebrations";
    static final String EXTENSIONS = "hide_extensions";
    static final String CHAT_MODE_POPUP = "hide_chat_mode_popup";
    static final String CLIP_BUTTON = "hide_clip_button";
    static final String CAST_BUTTON = "hide_cast_button";
    static final String SHARE_BUTTON = "hide_share_button";
    static final String HOME_STORIES = "hide_home_stories";
    static final String HOME_CONTINUE_WATCHING = "hide_home_continue_watching";
    static final String HOME_OFFLINE = "hide_home_offline_channels";
    static final String HOME_RECOMMENDED = "hide_home_recommended";

    private TwitchHighlights() { }

    /**
     * A top-of-chat community highlight, by the tracking id of its type ("hype_train_level_up",
     * "gift_sub", ...). Hidden highlights are never added, so nothing waits for them to be dismissed.
     */
    public static boolean hideHighlight(String type) {
        if (type == null) return false;
        if (type.startsWith("hype_train")) return Settings.isEnabled(HYPE_TRAIN);
        switch (type) {
            case "gift_sub":
            case "gift_promotion":
            case "subtember":
                return Settings.isEnabled(SUB_NOTICES);
            default:
                return false;
        }
    }

    /** A subscription chat notice, by its kind. Charity and unknown notices always stay. */
    public static boolean hideSubscriptionNotice(Enum<?> kind) {
        if (kind == null) return false;
        switch (kind.name()) {
            case "Sub":
            case "Resub":
            case "SubGift":
            case "SubMassGift":
            case "ExtendSub":
                return Settings.isEnabled(SUB_NOTICES);
            default:
                return false;
        }
    }

    /** Gift-match and shared gift-reward chat notices. */
    public static boolean hideGiftNotice() {
        return Settings.isEnabled(SUB_NOTICES);
    }

    /** Other viewers' watch-streak chat notices. */
    public static boolean hideWatchStreakNotice() {
        return Settings.isEnabled(WATCH_STREAKS);
    }

    /** Private pop-ups for the viewer: watch-streak milestones and Hype Train rewards. */
    public static boolean hideCallout(Enum<?> type) {
        if (type == null) return false;
        switch (type.name()) {
            case "WATCH_STREAK_REACHED":
                return Settings.isEnabled(WATCH_STREAKS);
            case "HYPE_TRAIN_REWARD":
                return Settings.isEnabled(HYPE_TRAIN);
            default:
                return false;
        }
    }

    public static boolean leaderboardEnabled(boolean stock) {
        return stock && !Settings.isEnabled(LEADERBOARDS);
    }

    public static boolean pinnedCheersVisible(boolean stock) {
        return stock && !Settings.isEnabled(PINNED_CHEERS);
    }

    /** Celebrations: the presenter only switches state when told to, so a hidden state forces the update. */
    public static boolean celebrationsEnabled(boolean stock) {
        return stock && !Settings.isEnabled(CELEBRATIONS);
    }

    public static boolean celebrationsUpdate(boolean stock) {
        return stock || Settings.isEnabled(CELEBRATIONS);
    }

    public static boolean clipButtonVisible(boolean stock) {
        return stock && !Settings.isEnabled(CLIP_BUTTON);
    }

    public static boolean shareButtonVisible(boolean stock) {
        return stock && !Settings.isEnabled(SHARE_BUTTON);
    }

    /** Cast buttons are AndroidX MediaRouteButtons; Twitch shows them through setVisibility. */
    public static int castVisibility(int stock) {
        return Settings.isEnabled(CAST_BUTTON) ? View.GONE : stock;
    }

    /** For cast buttons made in code (Compose AndroidView), which never call setVisibility. */
    public static void hideCastButton(View button) {
        if (button != null && Settings.isEnabled(CAST_BUTTON)) button.setVisibility(View.GONE);
    }

    /**
     * Injection point: the extensions about to be shown as icons above chat or in its header (issue 81). While
     * hidden, the row's view is gone and gets no icons, so neither the icons nor the extensions button show.
     */
    public static List<?> extensionIcons(View row, List<?> extensions) {
        if (!Settings.isEnabled(EXTENSIONS)) return extensions;
        if (row != null) row.setVisibility(View.GONE);
        return Collections.emptyList();
    }

    /** Injection point: whether the "Changed to Column Chat" pop-up, with Next Mode, is skipped (issue 85). */
    public static boolean hideChatModePopup() {
        return Settings.isEnabled(CHAT_MODE_POPUP);
    }

    /** A share button that is only shown by its layout default. */
    public static void hideShareButton(View button) {
        if (button != null && Settings.isEnabled(SHARE_BUTTON)) button.setVisibility(View.GONE);
    }

    public static boolean storiesShelf(boolean stock) {
        return stock && !Settings.isEnabled(HOME_STORIES);
    }

    /**
     * Following page sections without the hidden kinds. Sections are told apart by their toString
     * prefix (Kotlin data classes), checked once per class.
     */
    public static List<?> followingSections(List<?> sections) {
        if (sections == null) return null;
        boolean resume = Settings.isEnabled(HOME_CONTINUE_WATCHING);
        boolean offline = Settings.isEnabled(HOME_OFFLINE);
        boolean recommended = Settings.isEnabled(HOME_RECOMMENDED);
        if (!resume && !offline && !recommended) return sections;
        List<Object> kept = new ArrayList<>(sections.size());
        for (Object section : sections) {
            String kind = section == null ? "" : sectionKind(section);
            if ((resume && kind.equals("ResumeWatching")) || (offline && kind.equals("OfflineChannels")) ||
                    (recommended && kind.equals("RecommendedLiveChannels"))) continue;
            kept.add(section);
        }
        return kept.size() == sections.size() ? sections : kept;
    }

    private static final Map<Class<?>, String> SECTION_KINDS = new ConcurrentHashMap<>();

    private static String sectionKind(Object section) {
        String kind = SECTION_KINDS.get(section.getClass());
        if (kind == null) {
            String text = String.valueOf(section);
            int open = text.indexOf('(');
            kind = open > 0 ? text.substring(0, open) : "";
            SECTION_KINDS.put(section.getClass(), kind);
        }
        return kind;
    }
}
