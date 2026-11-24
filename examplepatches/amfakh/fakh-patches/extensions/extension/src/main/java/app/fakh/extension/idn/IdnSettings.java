/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

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

import java.lang.ref.WeakReference;
import java.util.Map;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * The hooks of the IDN patches and their switches, which live in {@link Features} and are edited on
 * {@link IdnSettingsActivity}. A switch is on when the thing it names shows.
 */
@SuppressWarnings("unused")
public final class IdnSettings {
    static final String TAG = "FakhIdn";
    /** The settings file of earlier versions, whose switches move to {@link Features} on the first read. */
    private static final String LEGACY_PREFS = "morphe_idn_settings";

    static final String AUTOPLAY = "autoplay";
    static final String SHOW_ADS = "show_ads";
    static final String SHOW_PACKAGE_BANNER = "show_package_banner";
    static final String SHOW_CREATE_BUTTON = "show_create_button";
    /** The switch of a home tab is this followed by the tab's HomeMenu name. */
    static final String SHOW_TAB = "show_tab_";

    /** Set by the call sites that bind a "buy a package" banner, read by the next bind; see {@link #takeBuyBanner()}. */
    private static boolean buyNext;
    /** Whether the banner bound last is a "buy" banner that is being hidden. */
    private static boolean buyHidden;

    /** The profile banner's frame, as the loading switch last showed it. */
    private static WeakReference<View> bannerFrame;

    /** The uiMode of the app's Settings screen when the page was opened; the app's own night mode setting decides it, not the system. */
    static int uiMode = -1;

    private static boolean migrated;

    private IdnSettings() {
    }

    /**
     * Moves the switches earlier versions saved in their own file into {@link Features}, once. Those kept the hidden
     * tabs and a stopped autoplay, the opposite of the switches now.
     */
    private static void migrate() {
        if (migrated) return;
        Context context = AppRuntime.application();
        if (context == null) return;
        migrated = true;
        SharedPreferences legacy = context.getSharedPreferences(LEGACY_PREFS, Context.MODE_PRIVATE);
        Map<String, ?> saved = legacy.getAll();
        if (saved.isEmpty()) return;
        for (Map.Entry<String, ?> entry : saved.entrySet()) {
            if (!(entry.getValue() instanceof Boolean)) continue;
            boolean value = (Boolean) entry.getValue();
            String key = entry.getKey();
            if (key.startsWith("hide_tab_")) Features.set(SHOW_TAB + key.substring("hide_tab_".length()), !value);
            else if (key.equals("stop_autoplay")) Features.set(AUTOPLAY, !value);
            else Features.set(key, value);
        }
        legacy.edit().clear().commit();
    }

    /** Whether the switch {@code key} is on; off while its patch is not in the app. */
    static boolean flag(String key) {
        migrate();
        return Features.on(key);
    }

    /** Whether a home tab is hidden: its patch is in and its switch is off. */
    static boolean isTabHidden(String tab) {
        migrate();
        return Features.has(SHOW_TAB + tab) && !Features.saved(SHOW_TAB + tab);
    }

    /** How many home tabs there are and how many are hidden right now, as {total, hidden}. */
    static int[] tabCounts() {
        int total = 0;
        int hidden = 0;
        for (Features.Feature feature : Features.all()) {
            if (!feature.id.startsWith(SHOW_TAB)) continue;
            total++;
            if (isTabHidden(feature.id.substring(SHOW_TAB.length()))) hidden++;
        }
        return new int[] {total, hidden};
    }

    static boolean isStopAutoplay() {
        migrate();
        return Features.has(AUTOPLAY) && !Features.saved(AUTOPLAY);
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
        boolean wasHidden = buyHidden;
        buyHidden = buyNext && hidePackageBanner();
        buyNext = false;
        // The loading switch showed the frame again before this bind; a banner that is not hidden anymore brings it back.
        if (wasHidden && !buyHidden) setBannerVisibility(View.VISIBLE);
        return buyHidden;
    }

    /** Called when the profile shows the banner's frame: remembers it, and keeps it hidden if the last banner was hidden. */
    public static void keepBannerHidden(View banner) {
        bannerFrame = new WeakReference<>(banner);
        if (buyHidden) banner.setVisibility(View.GONE);
    }

    /** Called instead of binding a "buy" banner: hides the frame the loading switch showed. */
    public static void hideBanner() {
        setBannerVisibility(View.GONE);
    }

    private static void setBannerVisibility(int visibility) {
        View banner = bannerFrame == null ? null : bannerFrame.get();
        if (banner != null) banner.setVisibility(visibility);
    }

    /**
     * Called on each HomeMenu name read from the remote tab config. A hidden tab is renamed to UNKNOWN, which the app
     * already skips. The last visible tab is never hidden, because the home screen needs one page.
     */
    public static String tab(String name) {
        if (!isTabHidden(name)) return name;
        int[] counts = tabCounts();
        return counts[1] < counts[0] ? "UNKNOWN" : name;
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
