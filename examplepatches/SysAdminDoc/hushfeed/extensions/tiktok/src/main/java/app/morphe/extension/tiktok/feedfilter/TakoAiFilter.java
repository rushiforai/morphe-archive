/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.tiktok.feedfilter;

import android.view.View;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;

import java.util.concurrent.atomic.AtomicInteger;

public final class TakoAiFilter {
    private static final int MAX_LOGS = 20;
    private static final AtomicInteger floatingButtonRouteLogCount = new AtomicInteger();
    private static final AtomicInteger boundViewHideLogCount = new AtomicInteger();

    private TakoAiFilter() {}

    public static boolean shouldHideFeedButton() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY,
                "floating button " + (enabled ? "hidden" : "left"));
        logFloatingButtonRoute("feed-tako-state", enabled);
        return enabled;
    }

    public static void hideBoundFeedButtonView(View view) {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY,
                "bound button " + (enabled ? "hidden" : "left"));
        if (!enabled || view == null) return;

        view.setVisibility(View.GONE);
        logBoundViewHide();
    }

    private static final String HOOK_FAMILY = "tako AI";
    private static final AtomicInteger askBarHideLogCount = new AtomicInteger();

    /**
     * The "Ask" strip under a video's caption (issue #6), a second Tako surface the floating
     * button switch never covered. It is a slot component bound per video; asked at the top of
     * that bind, so the strip is neither filled nor shown.
     */
    public static boolean shouldHideAskBar() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY, "ask bar " + (enabled ? "hidden" : "left"));
        return enabled;
    }

    /** The slot's content view, hidden in place of the bind the guard skipped. */
    public static void hideAskBar(View view) {
        if (view == null) return;
        view.setVisibility(View.GONE);
        int count = askBarHideLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Ask bar hidden");
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Ask bar hidden (further logs suppressed)");
        }
    }

    private static void logFloatingButtonRoute(String source, boolean enabled) {
        int count = floatingButtonRouteLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Floating button route hit"
                    + " source=" + source
                    + " enabled=" + enabled);
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Floating button route hit (further logs suppressed)");
        }
    }

    private static void logBoundViewHide() {
        int count = boundViewHideLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Bound feed button view hidden");
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Bound feed button view hidden (further logs suppressed)");
        }
    }
}
