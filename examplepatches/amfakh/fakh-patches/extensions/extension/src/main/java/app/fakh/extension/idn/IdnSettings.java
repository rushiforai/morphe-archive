package app.fakh.extension.idn;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.net.Uri;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Feature switches of the IDN patches, stored in their own SharedPreferences and edited on {@link IdnSettingsActivity}.
 *
 * The isXIncluded() methods return false here. Each feature patch rewrites its method to return true, so the settings
 * screen only lists features that were actually patched in.
 */
@SuppressWarnings("unused")
public final class IdnSettings {
    static final String TAG = "FakhIdn";
    private static final String PREFS = "morphe_idn_settings";

    static final String STOP_AUTOPLAY = "stop_autoplay";
    static final String SHOW_ADS = "show_ads";
    static final String SHOW_PACKAGE_BANNER = "show_package_banner";
    static final String SHOW_CREATE_BUTTON = "show_create_button";
    private static final String HIDE_TAB_PREFIX = "hide_tab_";

    /** HomeMenu names of the home tabs, in the order the app shows them, with the labels the app uses. */
    static final String[] TABS = {"SHORT_MOVIE", "LIVE", "NEWS", "QUIZ"};
    static final String[] TAB_LABELS = {"Nonton", "IDN Live", "Berita", "Quiz"};

    /** Set by the call sites that bind a "buy a package" banner, read by the next bind; see {@link #takeBuyBanner()}. */
    private static boolean buyNext;
    /** Whether the banner bound last is a "buy" banner that is being hidden. */
    private static boolean buyHidden;

    /** The uiMode of the app's Settings screen when the page was opened; the app's own night mode setting decides it, not the system. */
    static int uiMode = -1;

    private static SharedPreferences prefs;

    private IdnSettings() {
    }

    public static boolean isHideTabsIncluded() {
        return false;
    }

    public static boolean isStopAutoplayIncluded() {
        return false;
    }

    public static boolean isHideAdsIncluded() {
        return false;
    }

    public static boolean isHidePackageBannerIncluded() {
        return false;
    }

    public static boolean isHideCreateButtonIncluded() {
        return false;
    }

    /** The app's SharedPreferences-backed store for these switches; null before the Application exists. */
    @SuppressWarnings("PrivateApi")
    static synchronized SharedPreferences prefs() {
        if (prefs == null) {
            try {
                Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
                prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            } catch (Throwable t) {
                Log.w(TAG, "No application for the settings", t);
            }
        }
        return prefs;
    }

    static boolean isTabHidden(String tab) {
        SharedPreferences p = prefs();
        return p != null && p.getBoolean(HIDE_TAB_PREFIX + tab, false);
    }

    static void setTabHidden(String tab, boolean hidden) {
        SharedPreferences p = prefs();
        if (p != null) p.edit().putBoolean(HIDE_TAB_PREFIX + tab, hidden).apply();
    }

    /** How many home tabs are hidden right now. */
    static int hiddenTabCount() {
        int count = 0;
        for (String tab : TABS) if (isTabHidden(tab)) count++;
        return count;
    }

    static boolean isStopAutoplay() {
        SharedPreferences p = prefs();
        return p != null && p.getBoolean(STOP_AUTOPLAY, false);
    }

    static void setStopAutoplay(boolean stop) {
        SharedPreferences p = prefs();
        if (p != null) p.edit().putBoolean(STOP_AUTOPLAY, stop).apply();
    }

    /** A switch that is off until the user turns it on, so a patched feature is active by default. */
    static boolean flag(String key) {
        SharedPreferences p = prefs();
        return p != null && p.getBoolean(key, false);
    }

    static void setFlag(String key, boolean value) {
        SharedPreferences p = prefs();
        if (p != null) p.edit().putBoolean(key, value).apply();
    }

    /** Whether the ad banners and promo popups are removed: they are, unless the user turned them back on. */
    public static boolean hideAds() {
        return !flag(SHOW_ADS);
    }

    /** Whether the "+" button is removed: it is, unless the user turned it back on. */
    public static boolean hideCreateButton() {
        return !flag(SHOW_CREATE_BUTTON);
    }

    /**
     * Called with the main screen's view binding. Hides the "+" button and the empty bottom bar item under it, unless
     * the user turned the button back on. The views are found by id name, since R8 renames the binding's fields.
     */
    public static void applyCreateButton(Object binding) {
        if (!hideCreateButton()) return;
        try {
            View root = null;
            for (java.lang.reflect.Field field : binding.getClass().getFields()) {
                Object value = field.get(binding);
                if (value instanceof View) {
                    root = ((View) value).getRootView();
                    break;
                }
            }
            Context context = root.getContext();
            String pkg = context.getPackageName();
            root.findViewById(context.getResources().getIdentifier("iv_edit", "id", pkg)).setVisibility(View.GONE);
            View nav = root.findViewById(context.getResources().getIdentifier("bnvMain", "id", pkg));
            Menu menu = (Menu) nav.getClass().getMethod("getMenu").invoke(nav);
            menu.findItem(context.getResources().getIdentifier("action_edit", "id", pkg)).setVisible(false);
        } catch (Throwable t) {
            Log.w(TAG, "Could not hide the Create button", t);
        }
    }

    /** Whether the "Beli Paket" banner on the profile is removed: it is, unless the user turned it back on. */
    public static boolean hidePackageBanner() {
        return !flag(SHOW_PACKAGE_BANNER);
    }

    /** Called right before the profile binds a "buy a package" banner (none is active, or one is available). */
    public static void buyBanner() {
        buyNext = true;
    }

    /** Called when the profile binds any banner: true when it is a "buy" banner that has to be hidden. */
    public static boolean takeBuyBanner() {
        buyHidden = buyNext && hidePackageBanner();
        buyNext = false;
        return buyHidden;
    }

    /** Called when the profile shows the banner's frame again without binding it: it stays hidden if it was. */
    public static void keepBannerHidden(View banner) {
        if (buyHidden) banner.setVisibility(View.GONE);
    }

    /**
     * Called on each HomeMenu name read from the remote tab config. A hidden tab is renamed to UNKNOWN, which the app
     * already skips. The last visible tab is never hidden, because the home screen needs one page.
     */
    public static String tab(String name) {
        return isTabHidden(name) && hiddenTabCount() < TABS.length ? "UNKNOWN" : name;
    }

    /** Called on the autoPlay value of a carousel: off while autoplay is stopped. */
    public static boolean autoPlay(boolean value) {
        return value && !isStopAutoplay();
    }

    /** Called on the preview video url of a home carousel card: null (no video, the cover stays) while autoplay is stopped. */
    public static String previewUrl(String url) {
        return isStopAutoplay() ? null : url;
    }

    /** The page of IDN Connect where Gold is bought; the app's own in-app purchase is not used. */
    private static final String GOLD_URL = "https://connect.idn.media/my-account/gold";

    /** Opens the Gold page in the browser. Safe to call with any context. */
    private static void openGold(Context context) {
        try {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(GOLD_URL)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (Throwable t) {
            Log.w(TAG, "Could not open the Gold page", t);
        }
    }

    /** Called instead of showing the Gold packages sheet. */
    public static void openGoldTopUp() {
        try {
            openGold((Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null));
        } catch (Throwable t) {
            Log.w(TAG, "No application to open the Gold page", t);
        }
    }

    /** Called when the Profile activity is about to show a screen: sends the Top up Gold screen to the browser and closes the activity. */
    public static boolean redirectGold(Activity activity, Object screen) {
        if (!"TOP_UP_GOLD".equals(String.valueOf(screen))) return false;
        openGold(activity);
        activity.finish();
        return true;
    }

    /**
     * Turns the app's hidden notification row on its Settings screen into the "Fakh Patches" entry. That row is in
     * the layout already (gone), with an icon, a title and an arrow, so no resource has to be added.
     */
    public static void installEntry(View root) {
        // Posted: the app sets its own listeners and visibilities after onViewCreated starts, and they must not win.
        root.post(() -> {
            try {
                Context context = root.getContext();
                int id = context.getResources().getIdentifier("rlNotification", "id", context.getPackageName());
                ViewGroup row = (ViewGroup) root.findViewById(id);
                ImageView icon = (ImageView) row.getChildAt(0);
                TextView title = (TextView) row.getChildAt(1);
                // Same size and color as the icons of the other rows.
                int size = Math.round(24 * context.getResources().getDisplayMetrics().density);
                icon.getLayoutParams().width = size;
                icon.getLayoutParams().height = size;
                icon.setImageResource(android.R.drawable.ic_menu_preferences);
                icon.setImageTintList(ColorStateList.valueOf(title.getCurrentTextColor()));
                title.setText("Fakh Patches");
                row.setOnClickListener(v -> {
                    uiMode = context.getResources().getConfiguration().uiMode;
                    context.startActivity(new Intent(context, IdnSettingsActivity.class));
                });
                row.setVisibility(View.VISIBLE);
            } catch (Throwable t) {
                Log.w(TAG, "Could not add the Settings entry", t);
            }
        });
    }
}
