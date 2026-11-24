/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.fomo;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.FeaturesDialog;

/**
 * The Fakh Patches switches of FOMO, as a row at the bottom of the Settings screen ("Pengaturan"). Settings is a React
 * Native screen, so the row is a native view laid over it: it shows while the screen is up, and opens the dialog with
 * the switches of the applied patches. Theme colors are read once, so a change applies after a restart.
 */
public final class FomoSettings {
    static final String MATERIAL_YOU = "material_you";
    static final String PITCH_BLACK = "pitch_black";
    static final String HIDE_POST_DIVIDER = "hide_post_divider";
    static final String HIDE_ADS = "hide_ads";

    private static final String TAG = "fakh_patches_row";
    private static final long DEBOUNCE_MS = 250;

    private static final List<java.lang.ref.WeakReference<View>> shifted = new ArrayList<>();
    /** How far the rows of Settings are slid down, in pixels. */
    private static int applied;
    private static final Handler HANDLER = new Handler(Looper.getMainLooper());

    private FomoSettings() {
    }

    /**
     * The bundle to load: Hide ads rewrites the app's own bundle and keeps the original next to it, which loads while
     * the Hide ads switch is off.
     *
     * @param asset the name of the bundle in the assets
     */
    public static String bundleAsset(String asset) {
        return Features.has(HIDE_ADS) && !Features.on(HIDE_ADS) ? asset + ".original" : asset;
    }

    /**
     * Called at the end of MainActivity.onCreate: keeps the row in step with the screen that is showing.
     *
     * @param activity FOMO's one activity
     */
    public static void attach(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        Runnable check = () -> sync(activity);
        decor.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
            HANDLER.removeCallbacks(check);
            HANDLER.postDelayed(check, DEBOUNCE_MS);
        });
    }

    /** Adds the row under the version row of Settings, or removes it when the screen is not Settings. */
    private static void sync(Activity activity) {
        ViewGroup root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        View row = root.findViewWithTag(TAG);
        List<TextView> texts = new ArrayList<>();
        collectTexts(root, texts);

        // Settings is the screen with the app version on its first row, whatever the language.
        String version;
        try {
            version = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName;
        } catch (Exception e) {
            return;
        }
        int[] at = new int[2];
        root.getLocationOnScreen(at);
        TextView versionValue = null;
        for (TextView text : texts) {
            if (version.contentEquals(text.getText()) && text.getVisibility() == View.VISIBLE) versionValue = text;
        }
        if (versionValue == null || screenTop(versionValue) - applied - at[1] > root.getHeight() / 3) {
            if (row != null) root.removeView(row);
            unshift();
            return;
        }

        // The label of the version row names the column the other rows line up with.
        int versionTop = screenTop(versionValue);
        TextView label = null;
        for (TextView text : texts) {
            if (text != versionValue && Math.abs(screenTop(text) - versionTop) < 20 && screenLeft(text) < screenLeft(versionValue)) label = text;
        }
        if (label == null) return;
        int column = screenLeft(label);
        TextView style = null;
        for (TextView text : texts) {
            if (Math.abs(screenLeft(text) - column) > 8 || screenTop(text) <= versionTop + 20) continue;
            if (style == null || screenTop(text) < screenTop(style)) style = text;
        }
        if (style == null) return;

        // The rows of Settings sit in one view under the title bar. Slide each one below the version row down by one row
        // to open a place for ours.
        int pitch = screenTop(style) - screenTop(label);
        if (shifted.isEmpty()) {
            // The lowest view that holds both the version row and the next row: its children after the version row's.
            View band = label;
            while (band.getParent() instanceof ViewGroup && !contains((ViewGroup) band.getParent(), style)) band = (View) band.getParent();
            if (!(band.getParent() instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) band.getParent();
            for (int i = group.indexOfChild(band) + 1; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                child.setTranslationY(pitch);
                shifted.add(new java.lang.ref.WeakReference<>(child));
            }
            applied = pitch;
            // The last rows slide past the bottom of their parents, which clip them unless told not to.
            for (android.view.ViewParent parent = group; parent instanceof ViewGroup && parent != root; parent = parent.getParent()) {
                ViewGroup each = (ViewGroup) parent;
                each.setClipChildren(false);
                each.setClipToPadding(false);
                try {
                    each.getClass().getMethod("setOverflow", String.class).invoke(each, "visible");
                } catch (ReflectiveOperationException notReact) {
                    // Not a React view.
                }
            }
        }
        if (shifted.isEmpty()) return;

        float density = activity.getResources().getDisplayMetrics().density;
        int height = Math.round(64 * density);
        int center = screenTop(style) - applied + style.getHeight() / 2 - at[1];
        int top = center - height / 2;
        if (row == null) {
            TextView made = new TextView(activity);
            made.setTag(TAG);
            // Copy the font, size and color the row above is drawn with: React Native sets them as spans on its text.
            android.text.SpannableString title = new android.text.SpannableString("Fakh Patches");
            CharSequence source = style.getText();
            if (source instanceof android.text.Spanned) {
                for (Object span : ((android.text.Spanned) source).getSpans(0, source.length(), android.text.style.CharacterStyle.class)) {
                    title.setSpan(span, 0, title.length(), android.text.Spanned.SPAN_INCLUSIVE_INCLUSIVE);
                }
            }
            made.setText(title);
            made.setGravity(Gravity.CENTER_VERTICAL);
            made.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, style.getTextSize());
            made.setTextColor(style.getTextColors());
            made.setOnClickListener(v -> FeaturesDialog.show(activity, each -> tint(activity, each)));
            root.addView(made, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
            row = made;
        }
        row.setPadding(column - at[0], 0, 0, 0);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) row.getLayoutParams();
        if (params.topMargin != top) {
            params.topMargin = top;
            row.setLayoutParams(params);
        }
    }

    /** Puts the rows of Settings back where the app drew them. */
    private static void unshift() {
        for (java.lang.ref.WeakReference<View> reference : shifted) {
            View view = reference.get();
            if (view != null) view.setTranslationY(0);
        }
        shifted.clear();
        applied = 0;
    }

    private static boolean contains(View ancestor, View view) {
        for (android.view.ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
            if (parent == ancestor) return true;
        }
        return false;
    }

    /** Whether [view] holds a text that starts above [limit] on the screen, such as the title of the screen. */
    private static boolean hasTextAbove(View view, List<TextView> texts, int limit) {
        for (TextView text : texts) {
            if (screenTop(text) >= limit) continue;
            for (android.view.ViewParent parent = text.getParent(); parent != null; parent = parent.getParent()) {
                if (parent == view) return true;
            }
        }
        return false;
    }

    private static int screenTop(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return at[1];
    }

    private static int screenLeft(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return at[0];
    }

    private static void collectTexts(View view, List<TextView> out) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view instanceof TextView && ((TextView) view).getText().length() > 0 && !TAG.equals(view.getTag())) {
            out.add((TextView) view);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collectTexts(group.getChildAt(i), out);
        }
    }

    /**
     * Colors a switch with the wallpaper accent while Material You is on, and with the app's blue while it is off, as
     * the app itself would draw it.
     */
    static void tint(Activity activity, Switch row) {
        boolean dynamic = Features.on(MATERIAL_YOU);
        int thumb = dynamic ? activity.getColor(android.R.color.system_accent1_200) : 0xFF3A90F7;
        int track = dynamic ? activity.getColor(android.R.color.system_accent1_700) : 0xFF0C43A2;
        int[][] states = {{android.R.attr.state_checked}, {}};
        row.setThumbTintList(new android.content.res.ColorStateList(states, new int[] {thumb, 0xFF9E9E9E}));
        row.setTrackTintList(new android.content.res.ColorStateList(states, new int[] {track, 0xFF424242}));
    }
}
