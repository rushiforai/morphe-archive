// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.accountcolors;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.GridLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.onelouder.baconreader.adapters.DrawerAdapter;
import com.onelouder.baconreader.data.SessionManager;

import java.lang.ref.WeakReference;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;

/**
 * BaconReader switches between several Reddit accounts from the menu, but every account looks the
 * same once it is in use. Each account row of the menu gets a circle between its name and its ✕,
 * which picks a color for the account, and the color of the account in use shows as a line along
 * the bottom of every screen's toolbar.
 */
@SuppressWarnings("unused")
public final class AccountColorsPatch {
    private static final String PREFERENCES = "baconreader_patches";
    private static final String KEY_PREFIX = "account_colors.color.";

    // DrawerAdapter's account row type, and DrawerHandler's ACTION_ACCOUNT, the tag of the rows of
    // the accounts. "Log out" and "Add account" are rows of the same type with other tags.
    private static final int TYPE_ACCOUNT = 2;
    private static final int TAG_ACCOUNT = 110;

    private static final int CIRCLE_DP = 20;
    private static final int CIRCLE_TOUCH_DP = 40;
    private static final int SWATCH_DP = 36;
    private static final int SWATCH_CELL_DP = 56;
    private static final int LINE_DP = 3;

    /** The colors to pick from, and the keys of the names that describe them to TalkBack and the tests. */
    private static final int[] COLORS = {
            0xFFF44336, 0xFFE91E63, 0xFF9C27B0, 0xFF3F51B5, 0xFF2196F3, 0xFF00BCD4,
            0xFF009688, 0xFF4CAF50, 0xFFCDDC39, 0xFFFFEB3B, 0xFFFF9800, 0xFF795548,
    };
    private static final String[] COLOR_NAMES = {
            "red", "pink", "purple", "indigo", "blue", "cyan",
            "teal", "green", "lime", "yellow", "orange", "brown",
    };

    private static SharedPreferences preferences;
    private static WeakReference<Activity> resumed = new WeakReference<>(null);

    /** The circle added to each account row the menu's list made, by row. */
    private static final Map<View, ImageView> circles = new WeakHashMap<>();

    /** The line drawn over each toolbar, by toolbar. */
    private static final Map<View, ToolbarLine> lines = new WeakHashMap<>();

    private AccountColorsPatch() {
    }

    /**
     * Injected at the start of BaconReader.onCreate, the application's: draws the account's line
     * under the toolbar of each screen as it comes to the front.
     */
    public static void init(Application application) {
        if (application == null) return;
        try {
            preferences = application.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    resumed = new WeakReference<>(activity);
                    showLine(activity);
                }

                @Override
                public void onActivityCreated(Activity activity, Bundle state) {
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityPaused(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle state) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                }
            });
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not start Account colors", ex);
        }
    }

    /**
     * Injected at the start of DrawerAdapter.Holder.updateView(item), which shows a row of the
     * menu, with the row's text: adds the circle between an account's name and its ✕, or hides it
     * on the other rows of the same layout.
     */
    public static void bindRow(TextView text, DrawerAdapter.DrawerItem item) {
        try {
            if (text == null) return;
            ViewParent parent = text.getParent();
            if (!(parent instanceof RelativeLayout)) return;
            RelativeLayout row = (RelativeLayout) parent;
            String name = item != null && item.type == TYPE_ACCOUNT && item.tag == TAG_ACCOUNT ? item.tagString : null;
            ImageView existing = circles.get(row);
            if (name == null || name.isEmpty() || !Settings.ACCOUNT_COLORS.get()) {
                if (existing != null) existing.setVisibility(View.GONE);
                return;
            }
            ImageView circle = existing != null ? existing : addCircle(row);
            if (circle == null) return;
            circle.setVisibility(View.VISIBLE);
            showCircle(circle, name);
            circle.setOnClickListener(view -> pickColor(circle, name));
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the account's color", ex);
        }
    }

    /**
     * Injected in DrawerHandler.updateDrawer, which runs again whenever the account changes, before
     * the menu gets its items: redraws the line of the screen in front.
     */
    public static void onDrawerUpdated() {
        Activity activity = resumed.get();
        if (activity != null) showLine(activity);
    }

    /** Injected before SessionManager.removeSession(context, name): forgets the account's color. */
    public static void onAccountRemoved(String name) {
        if (name == null || name.isEmpty() || preferences == null) return;
        preferences.edit().remove(key(name)).apply();
    }

    private static ImageView addCircle(RelativeLayout row) {
        View icon = row.findViewById(ResourceUtils.getIdentifier(ResourceType.ID, "icon"));
        if (icon == null) return null;
        float density = row.getResources().getDisplayMetrics().density;
        ImageView circle = new ImageView(row.getContext());
        circle.setId(View.generateViewId());
        circle.setScaleType(ImageView.ScaleType.CENTER);
        RelativeLayout.LayoutParams params =
                new RelativeLayout.LayoutParams(dp(CIRCLE_TOUCH_DP, density), ViewGroup.LayoutParams.MATCH_PARENT);
        params.addRule(RelativeLayout.LEFT_OF, icon.getId());
        params.addRule(RelativeLayout.CENTER_VERTICAL);
        params.rightMargin = dp(8, density);
        row.addView(circle, params);
        circles.put(row, circle);
        return circle;
    }

    private static void showCircle(ImageView circle, String name) {
        circle.setImageDrawable(circleDrawable(circle, colorOf(name), CIRCLE_DP, false));
        circle.setContentDescription(str("revanced_baconreader_account_color_description", name));
    }

    private static void pickColor(ImageView circle, String name) {
        try {
            Context context = circle.getContext();
            float density = context.getResources().getDisplayMetrics().density;
            Integer current = colorOf(name);
            GridLayout grid = new GridLayout(context);
            grid.setColumnCount(4);
            int padding = dp(16, density);
            grid.setPadding(padding, padding, padding, 0);
            AlertDialog[] dialog = new AlertDialog[1];
            for (int i = 0; i < COLORS.length; i++) {
                int color = COLORS[i];
                ImageView swatch = new ImageView(context);
                swatch.setScaleType(ImageView.ScaleType.CENTER);
                swatch.setImageDrawable(circleDrawable(swatch, color, SWATCH_DP, current != null && current == color));
                swatch.setContentDescription(str("revanced_baconreader_account_color_" + COLOR_NAMES[i]));
                swatch.setOnClickListener(view -> {
                    setColor(name, color);
                    showCircle(circle, name);
                    if (dialog[0] != null) dialog[0].dismiss();
                });
                grid.addView(swatch, new ViewGroup.LayoutParams(dp(SWATCH_CELL_DP, density), dp(SWATCH_CELL_DP, density)));
            }
            // The swatches in the middle of the dialog, which is wider than them.
            FrameLayout frame = new FrameLayout(context);
            frame.addView(grid, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER_HORIZONTAL));
            dialog[0] = new AlertDialog.Builder(context)
                    .setTitle(str("revanced_baconreader_account_color_title", name))
                    .setView(frame)
                    .setNegativeButton(str("revanced_baconreader_account_color_none"), (d, which) -> {
                        setColor(name, null);
                        showCircle(circle, name);
                    })
                    .show();
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the account colors", ex);
        }
    }

    private static void setColor(String name, Integer color) {
        if (preferences == null) return;
        SharedPreferences.Editor editor = preferences.edit();
        if (color == null) editor.remove(key(name));
        else editor.putInt(key(name), color);
        editor.apply();
        onDrawerUpdated();
    }

    private static void showLine(Activity activity) {
        try {
            View toolbar = activity.findViewById(ResourceUtils.getIdentifier(ResourceType.ID, "toolbar"));
            if (toolbar == null) return;
            String user = Settings.ACCOUNT_COLORS.get() ? SessionManager.getUsername() : null;
            Integer color = user != null ? colorOf(user) : null;
            ToolbarLine line = lines.get(toolbar);
            if (color == null) {
                if (line != null) line.remove();
                lines.remove(toolbar);
            } else {
                if (line == null) {
                    line = new ToolbarLine(toolbar);
                    lines.put(toolbar, line);
                }
                line.show(color);
            }
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the account's color on the toolbar", ex);
        }
    }

    /** A line of the account's color along the bottom of a toolbar, over its own background. */
    private static final class ToolbarLine {
        private final View toolbar;
        private final ColorDrawable drawable = new ColorDrawable();
        private final int height;
        private final View.OnLayoutChangeListener layoutListener =
                (view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> place();

        ToolbarLine(View toolbar) {
            this.toolbar = toolbar;
            height = dp(LINE_DP, toolbar.getResources().getDisplayMetrics().density);
            toolbar.getOverlay().add(drawable);
            toolbar.addOnLayoutChangeListener(layoutListener);
            place();
        }

        void show(int color) {
            drawable.setColor(color);
            toolbar.invalidate();
        }

        void remove() {
            toolbar.getOverlay().remove(drawable);
            toolbar.removeOnLayoutChangeListener(layoutListener);
        }

        private void place() {
            drawable.setBounds(0, toolbar.getHeight() - height, toolbar.getWidth(), toolbar.getHeight());
        }
    }

    /** A filled circle of the color, or an outlined one in the theme's secondary color without one. */
    private static GradientDrawable circleDrawable(View view, Integer color, int sizeDp, boolean selected) {
        float density = view.getResources().getDisplayMetrics().density;
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        int size = dp(sizeDp, density);
        circle.setSize(size, size);
        if (color == null) {
            circle.setColor(Color.TRANSPARENT);
            circle.setStroke(dp(2, density), secondaryColor(view));
        } else {
            circle.setColor(color);
            if (selected) circle.setStroke(dp(3, density), secondaryColor(view));
        }
        return circle;
    }

    private static Integer colorOf(String name) {
        if (preferences == null) return null;
        String key = key(name);
        return preferences.contains(key) ? preferences.getInt(key, 0) : null;
    }

    // Reddit's user names are the same in any case.
    private static String key(String name) {
        return KEY_PREFIX + name.toLowerCase(Locale.ROOT);
    }

    private static int dp(int value, float density) {
        return Math.round(value * density);
    }

    /** The color of the app's secondary icons and text in the current theme. */
    private static int secondaryColor(View view) {
        TypedArray array = view.getContext().obtainStyledAttributes(new int[]{android.R.attr.textColorSecondary});
        try {
            return array.getColor(0, 0xFF888888);
        } finally {
            array.recycle();
        }
    }
}
