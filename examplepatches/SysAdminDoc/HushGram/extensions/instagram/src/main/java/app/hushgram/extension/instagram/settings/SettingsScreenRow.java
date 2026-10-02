/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Logger;

/**
 * The HushGram settings row on Instagram's own Settings and activity screen, for a launcher that
 * shows no shortcuts on a long press. Instagram draws that screen in Compose from a list its
 * server sends, so the row can't join the list. It sits above it instead, in the colours of
 * Instagram's light or dark theme, and opens the same screen the launcher shortcut does.
 */
final class SettingsScreenRow {
    /** The key Instagram's settings screen keeps the screen it shows under, an enum. */
    static final String SCREEN_ID = "screen_id";
    /** That enum's name for the top screen, Settings and activity. An enum's name is kept. */
    static final String MAIN_SETTINGS_SCREEN = "MAIN_SETTINGS_SCREEN";
    static final String TAG = "hushgram_settings_row";

    private SettingsScreenRow() {
    }

    /** Whether [arguments] are those of the top settings screen rather than one opened from it. */
    @SuppressWarnings("deprecation") // The typed getSerializable is Android 13 and newer.
    static boolean isMainScreen(Bundle arguments) {
        if (arguments == null) return false;
        Object screen = arguments.getSerializable(SCREEN_ID);
        return screen instanceof Enum && MAIN_SETTINGS_SCREEN.equals(((Enum<?>) screen).name());
    }

    /**
     * [screen] under the row, in a column that takes [screen]'s place, or [screen] as it came when
     * it's already in a layout of its own.
     */
    static View above(View screen) {
        if (screen.getParent() != null) return screen;
        Context context = screen.getContext();
        Colors colors = Colors.of(context);
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setBackgroundColor(colors.background);
        column.addView(row(context, colors), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        View divider = new View(context);
        divider.setBackgroundColor(colors.divider);
        column.addView(divider, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1));
        column.addView(screen, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        return column;
    }

    private static View row(Context context, Colors colors) {
        LinearLayout row = new LinearLayout(context);
        row.setTag(TAG);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(context, 56));
        row.setPaddingRelative(dp(context, 16), dp(context, 8), dp(context, 16), dp(context, 8));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(ScreenColors.half(colors.summary)),
                null, new ColorDrawable(0xFFFFFFFF)));
        row.setClickable(true);
        row.setFocusable(true);

        ImageView mark = new ImageView(context);
        int size = dp(context, 28);
        Bitmap drawn = SettingsEntry.mark(size, 0, 0.5f);
        mark.setImageDrawable(new BitmapDrawable(context.getResources(), drawn));
        mark.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams markSize = new LinearLayout.LayoutParams(size, size);
        markSize.setMarginEnd(dp(context, 16));
        row.addView(mark, markSize);

        TextView title = new TextView(context);
        title.setText(L10n.t(context, "HushGram settings"));
        title.setTextColor(colors.title);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        // Wraps rather than running off the row at a large text size or in a long translation.
        row.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        ImageView chevron = new ImageView(context);
        chevron.setImageDrawable(new ScreenColors.Chevron(colors.summary, dp(context, 2)));
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.addView(chevron, new LinearLayout.LayoutParams(dp(context, 16), dp(context, 24)));

        row.setOnClickListener(tapped -> {
            Activity activity = activityOf(tapped.getContext());
            if (activity == null) {
                Logger.printInfo(() -> "Settings row: no activity behind the row's context");
                return;
            }
            SettingsEntry.open(activity);
        });
        return row;
    }

    static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    /**
     * The page, text and line colours of the screen the row joins, read from Instagram's theme, or
     * Instagram's own light and dark values when its theme leaves one out.
     */
    static final class Colors {
        final int background;
        final int title;
        final int summary;
        final int divider;

        private Colors(int background, int title, int summary, int divider) {
            this.background = background;
            this.title = title;
            this.summary = summary;
            this.divider = divider;
        }

        static Colors of(Context context) {
            int night = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
            boolean dark = night == Configuration.UI_MODE_NIGHT_YES;
            return new Colors(
                    themeColor(context, android.R.attr.colorBackground, dark ? 0xFF000000 : 0xFFFFFFFF),
                    themeColor(context, android.R.attr.textColorPrimary, dark ? 0xFFF5F5F5 : 0xFF0C1014),
                    themeColor(context, android.R.attr.textColorSecondary, dark ? 0xFFA8A8A8 : 0xFF737373),
                    dark ? 0xFF262626 : 0xFFDBDBDB);
        }

        private static int themeColor(Context context, int attribute, int fallback) {
            TypedArray theme = context.obtainStyledAttributes(new int[]{attribute});
            try {
                return theme.getColor(0, fallback);
            } finally {
                theme.recycle();
            }
        }
    }
}
