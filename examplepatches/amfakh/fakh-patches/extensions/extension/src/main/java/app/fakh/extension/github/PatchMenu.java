/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.LinkedHashSet;
import java.util.Set;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.I18n;

/**
 * The Fakh Patches pages: the app's own Settings screen, filled with the rows of the patches instead of GitHub's. The
 * first page lists the groups of patches and each group opens a page with a row per patch. The patch has the screen
 * ask {@link #build} before it adds GitHub's rows, and adds a helper to the fragment that creates one row, since the
 * preference API is renamed.
 */
@SuppressWarnings("unused")
public final class PatchMenu {
    private static final String TITLE = "Fakh Patches";
    // The intent extra naming the page: empty for the list of groups, otherwise a group.
    private static final String PAGE = "fakh_page";
    // The key of a row that opens a page, followed by the page.
    private static final String OPENS = "fakh_page:";
    static final String SETTINGS_ACTIVITY = "com.github.android.settings.SettingsActivity";
    private static final String SETTINGS_FRAGMENT = "com.github.android.settings.SettingsFragment";
    private static final String TAG = "FakhPatches";

    private PatchMenu() {
    }

    /**
     * Fills the screen with the rows of a Fakh Patches page.
     *
     * @param screen  The app's new, empty preference screen.
     * @param context The screen's context.
     * @return False for GitHub's own Settings, which the app then builds itself.
     */
    public static boolean build(Object screen, Context context) {
        String page = page(context);
        if (page == null) return false;
        try {
            Method row = row();
            if (page.isEmpty()) {
                Set<String> groups = new LinkedHashSet<>();
                for (Features.Feature feature : Features.all()) groups.add(feature.section);
                for (String group : groups) row.invoke(null, screen, OPENS + group, I18n.tr(group), null, null);
                return true;
            }
            for (Features.Feature feature : Features.all()) {
                if (!feature.section.equals(page)) continue;
                // The saved side of the landscape bar is chosen from a sheet, not switched.
                String key = NavigationBar.NAV_RIGHT.equals(feature.id) ? ChoiceSheets.NAV_POSITION : feature.id;
                boolean sheet = ChoiceSheets.opens(key);
                String summary = sheet ? ChoiceSheets.summary(key)
                        : feature.description.isEmpty() ? null : I18n.tr(feature.description);
                row.invoke(null, screen, key, I18n.tr(feature.title), summary,
                        sheet ? null : Boolean.valueOf(feature.defaultOn));
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Page " + page, error);
        }
        return true;
    }

    /**
     * The title of a Settings screen.
     *
     * @param context  The screen's context.
     * @param original GitHub's title.
     * @return The page's title, or {@code original} for GitHub's own Settings.
     */
    public static String title(Context context, String original) {
        String page = page(context);
        if (page == null) return original;
        return page.isEmpty() ? TITLE : I18n.tr(page);
    }

    /** Whether the row with this key opens a page. */
    static boolean opens(String key) {
        return key.startsWith(OPENS);
    }

    /** Opens the page of the row {@code key} over the current screen. */
    static void open(Context context, String key) {
        try {
            Intent intent = new Intent(context, Class.forName(SETTINGS_ACTIVITY))
                    .putExtra(PAGE, key.substring(OPENS.length()));
            if (MaterialYou.activity(context) == null) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (ClassNotFoundException error) {
            Log.w(TAG, "Settings screen", error);
        }
    }

    /** The page a screen was opened for, or null for GitHub's own Settings. */
    private static String page(Context context) {
        Activity activity = MaterialYou.activity(context);
        return activity == null ? null : activity.getIntent().getStringExtra(PAGE);
    }

    /** The helper the patch adds to the fragment: {@code (screen, key, title, summary, switch default or null)}. */
    private static Method row() throws ReflectiveOperationException {
        for (Method method : Class.forName(SETTINGS_FRAGMENT).getDeclaredMethods()) {
            if (method.getName().equals("fakhRow")) return method;
        }
        throw new NoSuchMethodException("fakhRow");
    }
}
