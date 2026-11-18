package app.afterglow.extension.navigation;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewParent;
import android.widget.ImageView;

import app.afterglow.extension.Afterglow;

/**
 * The iOS "Navigation bar" settings, which on iOS mean the top bar (YTHeaderView and
 * YTRightNavigationButtons, YTAfterglow.x:1035-1122). On Android that is YouTube's toolbar.
 * Every method is an injection point of {@code tweaks/navigation/NavigationBarHooksPatch.kt}
 * and returns YouTube's own value when the setting is off or anything fails.
 */
@SuppressWarnings("unused")
public final class NavigationBarHooks {
    private static final String NO_YT_LOGO = "noYTLogo";
    private static final String PREMIUM_YT_LOGO = "premiumYTLogo";
    private static final String NO_NOTIFS_BUTTON = "noNotifsButton";
    private static final String NO_SEARCH_BUTTON = "noSearchButton";
    private static final String NO_VOICE_SEARCH_BUTTON = "noVoiceSearchButton";
    private static final String NO_CAST = "noCast";
    private static final String STICKY_NAVBAR = "stickyNavbar";

    /** Icon types (enum Lbgdf names) of the toolbar notifications button, Cairo and classic. */
    private static final String[] NOTIFICATION_ICONS = {"TAB_ACTIVITY_CAIRO", "TAB_ACTIVITY"};
    /** Icon types of the toolbar search button. */
    private static final String[] SEARCH_ICONS = {"SEARCH", "SEARCH_BOLD", "SEARCH_CAIRO"};

    private static final String MAIN_APP_BAR = "com.google.android.apps.youtube.app.ui.actionbar.ElevatedAppBarLayout";

    /** Icon of the toolbar button being built; set and read on the main thread within one call. */
    private static final ThreadLocal<String> pendingToolbarIcon = new ThreadLocal<>();
    private static volatile Boolean castFlagsHidden;

    private static int regularLogoAttr = -1;
    private static int premiumLogoAttr = -1;

    private NavigationBarHooks() {}

    // region YouTube logo

    /**
     * Injection point, before the toolbar sets its logo (the regular, Premium or doodle drawable).
     * iOS noYTLogo drops the header's title view (YTHeaderView setCustomTitleView:), so the
     * logo is replaced by nothing; a later call with the setting off shows it again.
     */
    public static Drawable headerLogo(ImageView logoView, Drawable original) {
        try {
            if (Gate.on(Gate.NAVIGATION_BAR, NO_YT_LOGO)) return null;
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.headerLogo", error);
        }
        return original;
    }

    /**
     * Injection point, after YouTube loads the theme attribute of the regular wordmark
     * (?attr/ytWordmarkHeader), in the toolbar and in the icon table of the YOUTUBE_LOGO icon.
     * iOS premiumYTLogo swaps youtube_logo for youtube_premium_logo (YTAfterglow.x:1104-1122);
     * here the regular attribute is swapped for YouTube's own ?attr/ytPremiumWordmarkHeader.
     */
    public static int headerLogoAttribute(int original) {
        try {
            if (!Gate.on(Gate.NAVIGATION_BAR, PREMIUM_YT_LOGO)) return original;
            resolveLogoAttributes();
            if (original == regularLogoAttr && premiumLogoAttr != 0) return premiumLogoAttr;
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.headerLogoAttribute", error);
        }
        return original;
    }

    private static void resolveLogoAttributes() {
        if (regularLogoAttr != -1) return;
        Context context = Afterglow.context();
        if (context == null) return;
        String packageName = context.getPackageName();
        premiumLogoAttr = context.getResources().getIdentifier("ytPremiumWordmarkHeader", "attr", packageName);
        regularLogoAttr = context.getResources().getIdentifier("ytWordmarkHeader", "attr", packageName);
    }

    // endregion

    // region Toolbar buttons (noNotifsButton, noSearchButton)

    /** Injection point, right after the toolbar button resolves its icon type. */
    public static void toolbarButtonIcon(Enum<?> icon) {
        try {
            pendingToolbarIcon.set(icon == null ? null : icon.name());
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.toolbarButtonIcon", error);
        }
    }

    /**
     * Injection point, right after the toolbar button loads its ImageView. Hides the whole button
     * (the ImageView's parent, which holds the badges too), as iOS hides YTRightNavigationButtons'
     * notificationButton and searchButton.
     */
    public static void toolbarButtonView(ImageView imageView) {
        try {
            String icon = pendingToolbarIcon.get();
            pendingToolbarIcon.remove();
            if (icon == null || imageView == null) return;
            boolean hide = (contains(NOTIFICATION_ICONS, icon) && Gate.on(Gate.NAVIGATION_BAR, NO_NOTIFS_BUTTON))
                    || (contains(SEARCH_ICONS, icon) && Gate.on(Gate.NAVIGATION_BAR, NO_SEARCH_BUTTON));
            if (!hide) return;
            ViewParent parent = imageView.getParent();
            View button = parent instanceof View ? (View) parent : imageView;
            button.setVisibility(View.GONE);
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.toolbarButtonView", error);
        }
    }

    /** Injection point, replaces setShowAsAction of the classic (non-Cairo) search menu item. */
    public static void classicSearchItem(MenuItem item, int showAsAction) {
        try {
            if (Gate.on(Gate.NAVIGATION_BAR, NO_SEARCH_BUTTON)) {
                item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
                item.setVisible(false);
                return;
            }
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.classicSearchItem", error);
        }
        item.setShowAsAction(showAsAction);
    }

    // endregion

    // region Voice search (noVoiceSearchButton)

    /**
     * Injection point, after the search box finds its microphone button. iOS turns voice search off
     * (_isVoiceSearchAllowed = NO) and hides the button.
     */
    public static void voiceSearchButton(View button) {
        try {
            if (button != null && Gate.on(Gate.NAVIGATION_BAR, NO_VOICE_SEARCH_BUTTON)) button.setVisibility(View.GONE);
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.voiceSearchButton", error);
        }
    }

    /** Injection point, replaces the microphone's setVisibility while the search text changes. */
    public static void voiceSearchVisibility(View button, int visibility) {
        try {
            if (Gate.on(Gate.NAVIGATION_BAR, NO_VOICE_SEARCH_BUTTON)) visibility = View.GONE;
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.voiceSearchVisibility", error);
        }
        if (button != null) button.setVisibility(visibility);
    }

    // endregion

    // region Cast (noCast)

    /** Injection point, before the toolbar Cast menu item is shown. */
    public static void castMenuItem(MenuItem item) {
        try {
            if (item != null && Gate.on(Gate.NAVIGATION_BAR, NO_CAST)) {
                item.setVisible(false);
                item.setEnabled(false);
            }
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.castMenuItem", error);
        }
    }

    /** Injection point, the visible/enabled value YouTube gives the toolbar Cast menu item. */
    public static boolean castMenuItemVisible(boolean original) {
        try {
            if (Gate.on(Gate.NAVIGATION_BAR, NO_CAST)) return false;
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.castMenuItemVisible", error);
        }
        return original;
    }

    /** Injection point, the visibility YouTube gives the player's Cast buttons. */
    public static int castButtonVisibility(int original) {
        try {
            if (Gate.on(Gate.NAVIGATION_BAR, NO_CAST)) return View.GONE;
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.castButtonVisibility", error);
        }
        return original;
    }

    /**
     * Injection point, the Cast entry point flags (45690090 and 45690091). Read once per launch,
     * so every class that reads them sees the same value, as iOS's YTSettings
     * setDisableMDXDeviceDiscovery applies to the session.
     */
    public static boolean castFlag(boolean original) {
        try {
            Boolean hidden = castFlagsHidden;
            if (hidden == null) {
                hidden = Gate.on(Gate.NAVIGATION_BAR, NO_CAST);
                castFlagsHidden = hidden;
            }
            if (hidden) return false;
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.castFlag", error);
        }
        return original;
    }

    // endregion

    // region Sticky navigation bar (stickyNavbar)

    /**
     * Injection point, at the start of the AppBarLayout scroll range getters. iOS stickyNavHeaderEnabled
     * keeps the header on screen; here YouTube's own top bar (ElevatedAppBarLayout) reports no scroll
     * range, so the coordinator layout never scrolls it away. Other app bars keep their behavior.
     */
    public static boolean pinsAppBar(View appBar) {
        try {
            return appBar != null && MAIN_APP_BAR.equals(appBar.getClass().getName())
                    && Gate.on(Gate.NAVIGATION_BAR, STICKY_NAVBAR);
        } catch (Throwable error) {
            Afterglow.error("NavigationBarHooks.pinsAppBar", error);
            return false;
        }
    }

    // endregion

    private static boolean contains(String[] values, String value) {
        for (String candidate : values) if (candidate.equals(value)) return true;
        return false;
    }
}
