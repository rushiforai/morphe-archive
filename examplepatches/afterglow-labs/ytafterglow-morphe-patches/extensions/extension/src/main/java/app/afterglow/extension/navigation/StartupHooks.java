package app.afterglow.extension.navigation;

import android.content.Intent;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.settings.TabStore;

/**
 * Startup page: iOS startupTab and shortsOnlyMode (YTAfterglow.x:4798-4811), applied where
 * YouTube picks its first page. The rules are in {@link StartupPage}. Injection points of
 * {@code tweaks/navigation/StartupHooksPatch.kt}.
 */
@SuppressWarnings("unused")
public final class StartupHooks {
    private static final String ACTION_MAIN = "android.intent.action.MAIN";

    /** Value of the guide milestone flag that does not wait for Home to be shown. */
    private static final int GUIDE_MILESTONE_NOT_HOME = 1;

    private StartupHooks() {}

    /**
     * iOS startupAnimation forces eligibility when enabled; OFF keeps native behavior.
     * Both Android startup-state and startup-type gates use this additive override.
     * Animation style, memory checks, attached view and lifecycle cleanup remain native.
     */
    public static boolean animationEligible(boolean original) {
        try {
            if (!Gate.on(Gate.STARTUP, "startupAnimation")) return original;
            if (!original) DebugLog.write("startup", "native animation eligibility enabled");
            return true;
        } catch (Throwable error) {
            Afterglow.error("StartupHooks.animationEligible", error);
            return original;
        }
    }

    /** The tab to open, or null when neither the startup tweak nor Shorts only mode applies. */
    static String startTab() {
        boolean shortsOnly = Gate.on(Gate.SHORTS, ShortsHooks.SHORTS_ONLY_MODE);
        if (!shortsOnly && !Gate.installed(Gate.STARTUP)) return null;
        String stored = Gate.installed(Gate.STARTUP) ? TabStore.currentStartupTab() : StartupPage.HOME;
        return StartupPage.effectiveTab(stored, shortsOnly, LiteMode.enabled());
    }

    /** Injection point: the browse id of YouTube's default page ("FEwhat_to_watch"). */
    public static String browseId(String original) {
        try {
            String target = StartupPage.browseIdFor(startTab());
            if (target != null) return target;
        } catch (Throwable error) {
            Afterglow.error("StartupHooks.browseId", error);
        }
        return original;
    }

    /**
     * Injection point: the launch intent. Shorts has no browse id, so a launch from the home
     * screen gets YouTube's own "open Shorts" action, as its Shorts shortcut does. Other intents
     * (links, shortcuts, widgets) are left alone.
     */
    public static void launchIntent(Intent intent) {
        try {
            if (intent == null || !ACTION_MAIN.equals(intent.getAction())) return;
            if (StartupPage.opensShorts(startTab())) intent.setAction(StartupPage.SHORTS_INTENT_ACTION);
        } catch (Throwable error) {
            Afterglow.error("StartupHooks.launchIntent", error);
        }
    }

    /**
     * Injection point: the startup milestone the guide request (top bar and tab bar buttons) waits
     * for. It waits for Home by default, so another start page would show default buttons for
     * about 20 seconds.
     */
    public static int guideMilestone(int original) {
        try {
            if (StartupPage.browseIdFor(startTab()) != null) return GUIDE_MILESTONE_NOT_HOME;
        } catch (Throwable error) {
            Afterglow.error("StartupHooks.guideMilestone", error);
        }
        return original;
    }
}
