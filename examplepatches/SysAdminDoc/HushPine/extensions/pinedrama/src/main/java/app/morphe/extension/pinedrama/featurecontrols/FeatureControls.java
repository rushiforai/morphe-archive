/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.pinedrama.featurecontrols;

import android.view.View;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.settings.Settings;

public final class FeatureControls {
    private static final int DEFAULT_LONG_PRESS_LOCK_DISTANCE_DP = 140;
    static final String NON_PERSONALIZED_SEARCH_FAMILY = "non-personalized search";
    static final String LIVE_SEARCH_FAMILY = "LIVE search";

    private FeatureControls() {
    }

    public static Object filterNormalPendant(Object pendant) {
        return filterPromotionalTouchPoint(pendant);
    }

    public static Object filterPromotionalTouchPoint(Object touchPoint) {
        if (!Settings.HIDE_HOMEPAGE_COIN.get() || touchPoint == null) return touchPoint;

        String className = touchPoint.getClass().getName();
        switch (className) {
            case "com.bytedance.touchpoint.api.model.NormalPendant":
            case "com.bytedance.touchpoint.api.model.TimerPendant":
            case "com.bytedance.touchpoint.api.model.SunshinePendant":
            case "com.bytedance.touchpoint.api.model.CoinBottomTab":
            case "com.bytedance.touchpoint.api.model.BottomTabBubble":
                return null;
            default:
                return touchPoint;
        }
    }

    /** Runs after PineDrama has attached and configured its profile rewards icon. */
    public static void hideProfileRewardsShortcut(View shortcut) {
        if (shortcut != null && Settings.HIDE_PROFILE_REWARDS_SHORTCUT.get()) {
            shortcut.setVisibility(View.GONE);
        }
    }

    public static boolean overrideLongPressSpeedUpEnabled(boolean enabled) {
        return Settings.ENABLE_LONG_PRESS_SPEED_LOCK.get() || enabled;
    }

    public static int overrideLongPressSpeedUpLockDistance(int distanceDp) {
        if (!Settings.ENABLE_LONG_PRESS_SPEED_LOCK.get()) return distanceDp;
        return distanceDp > 0 ? distanceDp : DEFAULT_LONG_PRESS_LOCK_DISTANCE_DP;
    }

    public static int hideQuickCommentReactionsVisibility(int originalVisibility) {
        return Settings.HIDE_COMMENT_QUICK_REACTIONS.get() ? View.GONE : originalVisibility;
    }

    /**
     * The comment box's emoji row is added by a trigger rather than shown by a visibility
     * write, so the same switch answers the trigger before its own checks run.
     */
    public static boolean hideQuickCommentReactions() {
        return Settings.HIDE_COMMENT_QUICK_REACTIONS.get();
    }

    public static int hideFeedFollowButtonVisibility(int originalVisibility) {
        return Settings.HIDE_FEED_FOLLOW_BUTTON.get() ? View.GONE : originalVisibility;
    }

    public static int hideFeedSaveButtonVisibility(int originalVisibility) {
        return Settings.HIDE_FEED_SAVE_BUTTON.get() ? View.GONE : originalVisibility;
    }

    /** The same question for the search button: false hides it. */
    public static boolean hideFeedSearchButtonEnabled(boolean originalEnabled) {
        return !Settings.HIDE_FEED_SEARCH_BUTTON.get() && originalEnabled;
    }

    public static int overrideLongPressQuickShare(int originalMode) {
        return Settings.DISABLE_LONG_PRESS_QUICK_SHARE.get() ? 0 : originalMode;
    }

    public static boolean disableLongPressRepost() {
        return Settings.DISABLE_LONG_PRESS_REPOST.get();
    }

    /**
     * PineDrama's own "is non-personalized search on" gates, both of them. The settings read under
     * them still answers PineDrama's value, so a gate recorder shows 0 there even while this forces
     * the gate. The Hook status line is the sign in a report that the gate was asked.
     */
    public static boolean enableNonPersonalizedSearch(boolean original) {
        boolean on = Settings.ENABLE_NON_PERSONALIZED_SEARCH.get();
        HookStatus.bound(NON_PERSONALIZED_SEARCH_FAMILY, on ? "gate forced" : "left to PineDrama");
        return on || original;
    }

    public static int forceNonPersonalizedSearchGate(String key, int value) {
        if (!"enable_non_personalized_search".equals(key)) return value;
        return Settings.ENABLE_NON_PERSONALIZED_SEARCH.get() ? 1 : value;
    }

    /** The LIVE drawer's "show search" setting, asked as the drawer builds its top bar. */
    public static boolean enableLiveSearch(boolean original) {
        boolean on = Settings.ENABLE_LIVE_SEARCH.get();
        HookStatus.bound(LIVE_SEARCH_FAMILY, on ? "search shown" : "left to PineDrama");
        return on || original;
    }
}
