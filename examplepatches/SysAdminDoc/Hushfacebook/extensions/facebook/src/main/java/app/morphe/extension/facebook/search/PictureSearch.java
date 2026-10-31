/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.search;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Search with a picture (#245): pressing and holding the top bar's search button opens Google
 * Lens, where you point the camera at something or pick a picture to find out what it is.
 *
 * <p>Facebook's own search takes words only, so this hands off to Lens. The top bar hook
 * ({@link app.morphe.extension.facebook.navigation.TopBarButtons#searchButton}) calls
 * {@link #attach} with the button as the bar makes it, while the switch is on and the button isn't
 * hidden. A tap still opens Facebook's search.
 *
 * <p>The press first asks for the Google app's Lens screen through its {@value #LENS_APP_URI} link,
 * which every Google app with Lens answers. A phone without the Google app gets Lens on the web in
 * the browser, and a phone with neither gets a toast. Facebook's manifest can't see other apps on
 * Android 11 and later, so each one is tried by starting it rather than looking it up first.
 *
 * <p>The switch is read again at each press, so turning it off stops the long press at once and
 * Facebook's own long press comes back. Nothing here throws into Facebook.
 */
public final class PictureSearch {
    /** The Google app, which owns Lens on Android. */
    static final String LENS_PACKAGE = "com.google.android.googlequicksearchbox";

    /** The Google app's link to its Lens screen. */
    static final String LENS_APP_URI = "googleapp://lens";

    /** Lens on the web, for a phone without the Google app. */
    static final String LENS_WEB_URL = "https://lens.google.com/";

    /** Counted under the patch's name each time a press opens Lens. */
    static final String OPENED_APP = "Google Lens opened in the Google app";
    static final String OPENED_WEB = "Google Lens opened on the web";
    static final String NO_LENS = "Google Lens not found";

    private static final String FAMILY = FamilyNames.BOTTOM_TAB_BAR;

    private PictureSearch() {
    }

    /** Gives the search button its long press. Called by the top bar hook with the switch on. */
    public static void attach(View button) {
        button.setOnLongClickListener(PictureSearch::onLongPress);
        HookStatus.bound(FAMILY, "Search with a picture");
        Logger.printDebug(() -> "Top bar: search button opens Google Lens on a long press");
    }

    /** The long press. True when it was handled here, false to leave it to Facebook. */
    static boolean onLongPress(View button) {
        try {
            if (!Utils.settingsReady() || !Settings.SEARCH_WITH_PICTURE.get()) return false;
            Context context = button.getContext();
            if (start(context, lensApp())) {
                HookStatus.counted(FAMILY, OPENED_APP);
                return true;
            }
            if (start(context, lensWeb())) {
                HookStatus.counted(FAMILY, OPENED_WEB);
                return true;
            }
            HookStatus.counted(FAMILY, NO_LENS);
            Utils.showToastShort(L10n.t(context, "No app on this phone can open Google Lens"));
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "Search with a picture", failure);
            return false;
        }
    }

    static Intent lensApp() {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(LENS_APP_URI))
                .setPackage(LENS_PACKAGE)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    static Intent lensWeb() {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(LENS_WEB_URL))
                .addCategory(Intent.CATEGORY_BROWSABLE)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    private static boolean start(Context context, Intent intent) {
        try {
            context.startActivity(intent);
            return true;
        } catch (ActivityNotFoundException | SecurityException missing) {
            Logger.printDebug(() -> "Google Lens: nothing answered " + intent.getData());
            return false;
        }
    }
}
