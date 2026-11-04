package app.southstar21.extension.instagram.navbuttons;

import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;

import app.southstar21.extension.instagram.InstagramHooks;
import app.southstar21.extension.instagram.settings.BooleanSetting;
import app.southstar21.extension.instagram.settings.Icons;
import app.southstar21.extension.instagram.settings.PatchSettings;
import app.southstar21.extension.instagram.settings.SettingsGroup;
import app.southstar21.extension.instagram.tabs.TabsHook;

/**
 * Hide navigation buttons patch. The tabs are removed by {@link TabsHook}, which filters the
 * tab list Instagram builds when the main activity starts. The heart at the top of the home
 * page isn't a tab, so it's hidden by {@link #onActivityButton}.
 */
@SuppressWarnings("unused")
public final class HideNavigationButtonsPatch {
    static final BooleanSetting HIDE_SEARCH = new BooleanSetting("nav_buttons_hide_search",
            "Search", "The Search and Explore tab.", true, false);
    static final BooleanSetting HIDE_REELS = new BooleanSetting("nav_buttons_hide_reels",
            "Reels", null, true, false);
    static final BooleanSetting HIDE_CREATE = new BooleanSetting("nav_buttons_hide_create",
            "Create", "The + button for new posts, shown in the bar on some accounts.", true, false);
    static final BooleanSetting HIDE_MESSAGES = new BooleanSetting("nav_buttons_hide_messages",
            "Messages", "Direct messages are still reachable from the home page.", true, false);
    static final BooleanSetting HIDE_ACTIVITY = new BooleanSetting("nav_buttons_hide_activity",
            "Activity", "The heart, at the top of the home page or in the bar.", true, false);
    static final BooleanSetting HIDE_DYNAMIC = new BooleanSetting("nav_buttons_hide_dynamic",
            "Rotating tab", "The tab Instagram swaps between features on some accounts.", true, false);

    public static final PatchSettings SETTINGS = new PatchSettings("nav_buttons",
            "Navigation buttons",
            "Choose which tabs to hide from the bottom bar.",
            HideNavigationButtonsPatch::isIncluded,
            new SettingsGroup("Hide",
                    "Home and Profile always stay, the southstar21 Patches menu lives on Profile.",
                    HIDE_SEARCH, HIDE_REELS, HIDE_CREATE, HIDE_MESSAGES, HIDE_ACTIVITY, HIDE_DYNAMIC))
            .icon(Icons.Glyph.TABS, 0xFF34C759);

    /** The patch makes this return true, so the menu only shows patches that were applied. */
    public static boolean isIncluded() {
        return false;
    }

    /**
     * Called when the home page's action bar sets up its heart button. Hides it and keeps it
     * hidden, since Instagram shows it again when it changes the bar.
     */
    public static void onActivityButton(View button) {
        try {
            if (button == null || !SETTINGS.isActive() || !HIDE_ACTIVITY.get()) return;
            button.setVisibility(View.GONE);
            button.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    if (button.getVisibility() != View.GONE) button.setVisibility(View.GONE);
                }
            });
        } catch (Throwable t) {
            Log.e(InstagramHooks.TAG, "Failed to hide activity button", t);
        }
    }

    /**
     * @param tab name of Instagram's IgTab enum constant, e.g. "CLIPS"
     */
    public static boolean hides(String tab) {
        if (!SETTINGS.isActive()) return false;
        switch (tab) {
            case "SEARCH":
                return HIDE_SEARCH.get();
            case "CLIPS":
                return HIDE_REELS.get();
            case "CREATION":
            case "SHARE":
                return HIDE_CREATE.get();
            case "DIRECT":
                return HIDE_MESSAGES.get();
            case "NEWS":
                return HIDE_ACTIVITY.get();
            case "DYNAMIC_TAB":
                return HIDE_DYNAMIC.get();
            default:
                return false;
        }
    }
}
