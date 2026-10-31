// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.settings;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Toolbar;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * Shows the settings of the patches in GoogleApiActivity, and adds an entry for them at the end of
 * BaconReader's settings menu. An existing activity is used, as adding one fails for root installations.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class BaconReaderActivityHook {
    private static final String SETTINGS_ACTIVITY_CLASS = "com.google.android.gms.common.api.GoogleApiActivity";
    private static final String SETTINGS_INTENT_DATA = "baconreader_patches_settings";

    /** Number of sections in BaconReader's settings menu, captured when the entry is added. */
    private static int appSectionCount = -1;

    /** BaconReader's toolbars have white text and icons in all themes. */
    static final int TOOLBAR_FOREGROUND_COLOR = Color.WHITE;

    /** White at 87%, the color of BaconReader's toolbar titles. */
    private static final int TOOLBAR_TITLE_COLOR = 0xDEFFFFFF;

    private BaconReaderActivityHook() {
    }

    /**
     * Injection point. Called by SettingsMenuFragment.initAdapter with the titles of the
     * settings sections: the menu shows them plus the settings of the patches.
     */
    public static String[] addSettingsMenuEntry(String[] sections) {
        appSectionCount = sections.length;
        String[] result = new String[sections.length + 1];
        System.arraycopy(sections, 0, result, 0, sections.length);
        result[sections.length] = str("revanced_settings_title");
        return result;
    }

    /**
     * Injection point. Called at the start of SettingsActivity.openFragment(int).
     *
     * @return If the click was on the entry of the patches (the original method must then return).
     */
    public static boolean handleSettingsMenuClick(Activity activity, int position) {
        if (appSectionCount < 0 || position != appSectionCount) return false;
        try {
            Intent intent = new Intent();
            intent.setClassName(activity, SETTINGS_ACTIVITY_CLASS);
            intent.setData(Uri.parse(SETTINGS_INTENT_DATA));
            activity.startActivity(intent);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not open the settings of the patches", ex);
        }
        return true;
    }

    /**
     * Injection point. Called at the start of GoogleApiActivity.onCreate.
     *
     * @return If the activity was opened to show the settings of the patches.
     */
    public static boolean isSettingsIntent(Activity activity) {
        Intent intent = activity.getIntent();
        return intent != null && intent.getData() != null
                && SETTINGS_INTENT_DATA.equals(intent.getData().toString());
    }

    /**
     * Injection point. Called by GoogleApiActivity.onCreate, after Activity.onCreate,
     * when {@link #isSettingsIntent(Activity)} is true.
     */
    public static void initialize(Activity activity) {
        try {
            applyBaconReaderTheme(activity);

            Context context = activity;
            int backgroundColor = appThemeColor(context, "bgColor",
                    themeColor(context, android.R.attr.colorBackground, Color.WHITE));
            int toolbarColor = appThemeColor(context, "colorPrimary", backgroundColor);
            int statusBarColor = appThemeColor(context, "colorPrimaryDark", toolbarColor);

            // The host activity is translucent.
            Window window = activity.getWindow();
            window.setBackgroundDrawable(new ColorDrawable(backgroundColor));
            window.setStatusBarColor(statusBarColor);
            window.setNavigationBarColor(backgroundColor);

            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setFitsSystemWindows(true);
            root.setBackgroundColor(backgroundColor);

            Toolbar toolbar = new Toolbar(context);
            toolbar.setBackgroundColor(toolbarColor);
            toolbar.setTitle(str("revanced_settings_title"));
            toolbar.setTitleTextColor(TOOLBAR_TITLE_COLOR);
            Drawable navigationIcon = homeAsUpIndicator(context);
            if (navigationIcon != null) {
                navigationIcon.setTint(TOOLBAR_FOREGROUND_COLOR);
                toolbar.setNavigationIcon(navigationIcon);
            }
            toolbar.setNavigationOnClickListener(view -> activity.finish());
            root.addView(toolbar, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, actionBarSize(context)));

            FrameLayout content = new FrameLayout(context);
            content.setId(View.generateViewId());
            root.addView(content, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));

            activity.setContentView(root);
            activity.getFragmentManager().beginTransaction()
                    .replace(content.getId(), new BaconReaderPreferenceFragment())
                    .commit();
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the settings of the patches", ex);
            activity.finish();
        }
    }

    /** Uses BaconReader's current theme (light, dark or black). */
    private static void applyBaconReaderTheme(Activity activity) {
        try {
            int theme = (Integer) Class.forName("com.onelouder.baconreader.Preferences")
                    .getMethod("getTheme").invoke(null);
            activity.setTheme(theme);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not apply the BaconReader theme", ex);
        }
    }

    private static Drawable homeAsUpIndicator(Context context) {
        TypedArray array = context.obtainStyledAttributes(new int[]{android.R.attr.homeAsUpIndicator});
        try {
            return array.getDrawable(0);
        } finally {
            array.recycle();
        }
    }

    private static int actionBarSize(Context context) {
        TypedValue value = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.actionBarSize, value, true)) {
            return TypedValue.complexToDimensionPixelSize(value.data, context.getResources().getDisplayMetrics());
        }
        return (int) (56 * context.getResources().getDisplayMetrics().density);
    }

    /** A color attribute of BaconReader's theme. */
    private static int appThemeColor(Context context, String attributeName, int fallback) {
        int attribute = context.getResources().getIdentifier(attributeName, "attr", context.getPackageName());
        if (attribute == 0) return fallback;
        return themeColor(context, attribute, fallback);
    }

    private static int themeColor(Context context, int attribute, int fallback) {
        TypedArray array = context.obtainStyledAttributes(new int[]{attribute});
        try {
            return array.getColor(0, fallback);
        } finally {
            array.recycle();
        }
    }
}
