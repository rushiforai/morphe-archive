package app.morphe.extension.tiktok.settings.preference;

import static app.morphe.extension.shared.Utils.isDarkModeEnabled;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CheckedTextView;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.ColorInt;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.theme.ThemeEngine;
import app.morphe.extension.tiktok.theme.ThemeStateStore;

public final class SettingsUi {
    /** Legacy/fallback accent for callers that still reference the constant directly. */
    public static final @ColorInt int ACCENT = Color.argb(255, 240, 45, 99);
    public static final @ColorInt int DARK_BACKGROUND = Color.argb(255, 13, 13, 16);
    public static final @ColorInt int DARK_SURFACE = Color.argb(255, 21, 21, 26);
    public static final @ColorInt int DARK_SURFACE_LIFTED = Color.argb(255, 32, 32, 39);
    public static final @ColorInt int DARK_BORDER = Color.argb(255, 55, 55, 63);
    public static final @ColorInt int DARK_DIVIDER = Color.argb(255, 29, 29, 34);
    public static final @ColorInt int DARK_TEXT_PRIMARY = Color.argb(255, 242, 242, 245);
    public static final @ColorInt int DARK_TEXT_SECONDARY = Color.argb(255, 151, 151, 159);
    public static final @ColorInt int DARK_TEXT_DISABLED = Color.argb(255, 109, 109, 118);

    public static final @ColorInt int LIGHT_BACKGROUND = Color.WHITE;
    public static final @ColorInt int LIGHT_SURFACE = Color.WHITE;
    public static final @ColorInt int LIGHT_SURFACE_LIFTED = Color.argb(255, 250, 250, 250);
    public static final @ColorInt int LIGHT_BORDER = Color.argb(255, 210, 210, 210);
    public static final @ColorInt int LIGHT_DIVIDER = Color.argb(255, 224, 224, 224);
    public static final @ColorInt int LIGHT_TEXT_PRIMARY = Color.BLACK;
    public static final @ColorInt int LIGHT_TEXT_SECONDARY = Color.argb(255, 80, 80, 80);
    public static final @ColorInt int LIGHT_TEXT_DISABLED = Color.argb(255, 140, 140, 140);

    private SettingsUi() {
    }

    public static boolean isDarkMode() {
        Context context = themeContext();
        if (themeActive(context)) {
            try {
                return ThemeEngine.isDarkUi(context);
            } catch (Throwable ignored) {
            }
        }
        return isDarkModeEnabled();
    }

    public static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    public static @ColorInt int accent() {
        Context context = themeContext();
        if (themeActive(context)) {
            try {
                return ThemeEngine.accentColor(context);
            } catch (Throwable ignored) {
            }
        }
        return ACCENT;
    }

    public static @ColorInt int background() {
        Context context = themeContext();
        if (themeActive(context)) {
            try {
                return ThemeEngine.backgroundColor(context);
            } catch (Throwable ignored) {
            }
        }
        return isDarkModeEnabled() ? DARK_BACKGROUND : LIGHT_BACKGROUND;
    }

    public static @ColorInt int surface() {
        Context context = themeContext();
        if (themeActive(context)) {
            try {
                return ThemeEngine.surfaceColor(context);
            } catch (Throwable ignored) {
            }
        }
        return isDarkModeEnabled() ? DARK_SURFACE : LIGHT_SURFACE;
    }

    public static @ColorInt int liftedSurface() {
        Context context = themeContext();
        if (themeActive(context)) {
            int base = surface();
            return mixPreserveAlpha(base, textPrimary(), isDarkMode() ? 0.075f : 0.045f);
        }
        return isDarkModeEnabled() ? DARK_SURFACE_LIFTED : LIGHT_SURFACE_LIFTED;
    }

    public static @ColorInt int border() {
        Context context = themeContext();
        if (themeActive(context)) {
            int base = surface();
            return withAlpha(mixPreserveAlpha(base, textPrimary(), 0.24f),
                    ThemeStateStore.isLiquidGlass(context) ? 120 : 190);
        }
        return isDarkModeEnabled() ? DARK_BORDER : LIGHT_BORDER;
    }

    public static @ColorInt int divider() {
        Context context = themeContext();
        if (themeActive(context)) {
            try {
                return ThemeEngine.dividerColor(context);
            } catch (Throwable ignored) {
            }
        }
        return isDarkModeEnabled() ? DARK_DIVIDER : LIGHT_DIVIDER;
    }

    public static @ColorInt int textPrimary() {
        Context context = themeContext();
        if (themeActive(context)) {
            try {
                return ThemeEngine.textColor(context);
            } catch (Throwable ignored) {
            }
        }
        return isDarkModeEnabled() ? DARK_TEXT_PRIMARY : LIGHT_TEXT_PRIMARY;
    }

    public static @ColorInt int textSecondary() {
        Context context = themeContext();
        if (themeActive(context)) {
            try {
                return ThemeEngine.secondaryTextColor(context);
            } catch (Throwable ignored) {
            }
        }
        return isDarkModeEnabled() ? DARK_TEXT_SECONDARY : LIGHT_TEXT_SECONDARY;
    }

    public static @ColorInt int textDisabled() {
        Context context = themeContext();
        if (themeActive(context)) {
            return mixPreserveAlpha(textSecondary(), background(), 0.58f);
        }
        return isDarkModeEnabled() ? DARK_TEXT_DISABLED : LIGHT_TEXT_DISABLED;
    }

    public static void styleTitleAndSummary(View view) {
        TextView title = view.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(textPrimary());
        }

        TextView summary = view.findViewById(android.R.id.summary);
        if (summary != null) {
            summary.setTextColor(textSecondary());
        }
    }

    public static void styleCategory(View view) {
        TextView title = view.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(accent());
            title.setTextSize(13);
            title.setTypeface(title.getTypeface(), Typeface.BOLD);
        }
    }

    public static TextView text(Context context, String value, float sizeSp, int color, int style) {
        TextView textView = new TextView(context);
        textView.setText(value);
        textView.setTextColor(color);
        textView.setTextSize(sizeSp);
        textView.setTypeface(textView.getTypeface(), style);
        return textView;
    }

    public static GradientDrawable roundedSurface(Context context, int radiusDp, boolean lifted) {
        GradientDrawable drawable = new GradientDrawable();
        int base = lifted ? liftedSurface() : surface();

        if (themeActive(context) && ThemeStateStore.isLiquidGlass(context)) {
            // Android cannot blur arbitrary content behind a normal View without a custom renderer,
            // but keeping real alpha plus a subtle highlight gradient gives the settings surfaces a
            // visibly translucent glass treatment instead of the old outline-only appearance.
            int highlight = mixPreserveAlpha(base,
                    isDarkMode() ? Color.WHITE : Color.BLACK,
                    isDarkMode() ? 0.10f : 0.045f);
            int lowlight = mixPreserveAlpha(base, background(), 0.16f);
            drawable.setColors(new int[]{highlight, lowlight});
            drawable.setOrientation(GradientDrawable.Orientation.TL_BR);
        } else {
            drawable.setColor(base);
        }

        drawable.setCornerRadius(dp(context, radiusDp));
        return drawable;
    }

    public static GradientDrawable borderedSurface(Context context, int radiusDp, boolean lifted) {
        GradientDrawable drawable = roundedSurface(context, radiusDp, lifted);
        drawable.setStroke(Math.max(1, dp(context, 1)), border());
        return drawable;
    }

    public static void styleDialog(Dialog dialog) {
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            View decorView = window.getDecorView();
            if (decorView != null) {
                decorView.setBackgroundColor(Color.TRANSPARENT);
            }
        }

        if (dialog instanceof AlertDialog) {
            AlertDialog alertDialog = (AlertDialog) dialog;
            View content = alertDialog.findViewById(android.R.id.content);
            if (content != null) {
                content.setBackgroundColor(Color.TRANSPARENT);
            }
            styleActionButton(alertDialog.getButton(DialogInterface.BUTTON_POSITIVE), true);
            styleActionButton(alertDialog.getButton(DialogInterface.BUTTON_NEGATIVE), false);
            styleActionButton(alertDialog.getButton(DialogInterface.BUTTON_NEUTRAL), false);
        }
    }

    public static void styleFramedDialog(Dialog dialog) {
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(borderedSurface(dialog.getContext(), 10, true));
        }

        if (dialog instanceof AlertDialog) {
            AlertDialog alertDialog = (AlertDialog) dialog;
            View content = alertDialog.findViewById(android.R.id.content);
            if (content != null) {
                content.setBackgroundColor(Color.TRANSPARENT);
            }
            styleActionButton(alertDialog.getButton(DialogInterface.BUTTON_POSITIVE), true);
            styleActionButton(alertDialog.getButton(DialogInterface.BUTTON_NEGATIVE), false);
            styleActionButton(alertDialog.getButton(DialogInterface.BUTTON_NEUTRAL), false);
        }
    }

    public static void styleStandardAlertDialog(AlertDialog dialog) {
        styleFramedDialog(dialog);

        Window window = dialog.getWindow();
        if (window == null) {
            return;
        }

        makeDialogPanelsTransparent(window.getDecorView(), dialog.getContext());
        styleDialogText(window.getDecorView());

        ListView list = dialog.getListView();
        if (list != null) {
            list.setBackgroundColor(Color.TRANSPARENT);
            list.setDivider(new ColorDrawable(divider()));
            list.setDividerHeight(Math.max(1, dp(dialog.getContext(), 1)));
            list.post(() -> {
                styleDialogText(list);
                list.postDelayed(() -> styleDialogText(list), 50);
            });
        }

        styleActionButton(dialog.getButton(DialogInterface.BUTTON_POSITIVE), true);
        styleActionButton(dialog.getButton(DialogInterface.BUTTON_NEGATIVE), false);
        styleActionButton(dialog.getButton(DialogInterface.BUTTON_NEUTRAL), false);
    }

    private static void makeDialogPanelsTransparent(View root, Context context) {
        String[] panelNames = {
                "parentPanel",
                "topPanel",
                "contentPanel",
                "buttonPanel",
                "customPanel"
        };
        for (String panelName : panelNames) {
            int id = context.getResources().getIdentifier(panelName, "id", "android");
            if (id == 0) {
                continue;
            }
            View panel = root.findViewById(id);
            if (panel != null) {
                panel.setBackgroundColor(Color.TRANSPARENT);
            }
        }
    }

    private static void styleDialogText(View view) {
        if (view instanceof CheckBox) {
            CheckBox checkBox = (CheckBox) view;
            checkBox.setTextColor(textPrimary());
            styleCheckBox(checkBox);
        } else if (view instanceof CheckedTextView) {
            CheckedTextView checkedTextView = (CheckedTextView) view;
            checkedTextView.setTextColor(textPrimary());
            checkedTextView.setCheckMarkDrawable(new DialogCheckMarkDrawable(checkedTextView.getContext()));
        } else if (view instanceof Button) {
            ((Button) view).setTextColor(accent());
        } else if (view instanceof TextView) {
            ((TextView) view).setTextColor(textPrimary());
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                styleDialogText(group.getChildAt(i));
            }
        }
    }

    public static void styleActionButton(Button button, boolean primary) {
        if (button == null) {
            return;
        }
        button.setTextColor(primary ? accent() : textSecondary());
        button.setAllCaps(false);
        button.setTypeface(button.getTypeface(), primary ? Typeface.BOLD : Typeface.NORMAL);
    }

    public static void styleTextAction(TextView button, boolean primary) {
        button.setTextColor(primary ? accent() : textSecondary());
        button.setTypeface(button.getTypeface(), primary ? Typeface.BOLD : Typeface.NORMAL);
    }

    public static void styleEditText(EditText editText) {
        editText.setTextColor(textPrimary());
        editText.setHintTextColor(textSecondary());
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            editText.setBackgroundTintList(ColorStateList.valueOf(accent()));
        }
    }

    public static void styleCheckBox(CompoundButton button) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            int[][] states = new int[][]{
                    new int[]{android.R.attr.state_checked},
                    new int[]{-android.R.attr.state_enabled},
                    new int[]{}
            };
            int[] colors = new int[]{accent(), textDisabled(), textSecondary()};
            button.setButtonTintList(new ColorStateList(states, colors));
        }
    }

    private static Context themeContext() {
        try {
            return Utils.getContext();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean themeActive(Context context) {
        if (context == null) return false;
        try {
            return !"default".equals(ThemeStateStore.currentPreset(context));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static int withAlpha(int color, int alpha) {
        return Color.argb(
                Math.max(0, Math.min(255, alpha)),
                Color.red(color),
                Color.green(color),
                Color.blue(color)
        );
    }

    /** Mixes RGB toward target while preserving the source alpha. */
    private static int mixPreserveAlpha(int source, int target, float amount) {
        float t = Math.max(0f, Math.min(1f, amount));
        int red = Math.round(Color.red(source) * (1f - t) + Color.red(target) * t);
        int green = Math.round(Color.green(source) * (1f - t) + Color.green(target) * t);
        int blue = Math.round(Color.blue(source) * (1f - t) + Color.blue(target) * t);
        return Color.argb(Color.alpha(source), red, green, blue);
    }

    private static final class DialogCheckMarkDrawable extends Drawable {
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int intrinsicSize;
        private final float boxSize;
        private final float radius;
        private boolean checked;

        DialogCheckMarkDrawable(Context context) {
            intrinsicSize = dp(context, 32);
            boxSize = dp(context, 18);
            radius = dp(context, 2);
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeWidth(Math.max(2, dp(context, 2)));
            stroke.setStrokeCap(Paint.Cap.ROUND);
            stroke.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            float left = getBounds().exactCenterX() - boxSize / 2f;
            float top = getBounds().exactCenterY() - boxSize / 2f;
            RectF box = new RectF(left, top, left + boxSize, top + boxSize);

            if (checked) {
                fill.setColor(accent());
                canvas.drawRoundRect(box, radius, radius, fill);
                stroke.setColor(Color.WHITE);
                float unit = boxSize / 18f;
                canvas.drawLine(left + 4f * unit, top + 9f * unit,
                        left + 8f * unit, top + 13f * unit, stroke);
                canvas.drawLine(left + 8f * unit, top + 13f * unit,
                        left + 15f * unit, top + 5f * unit, stroke);
            } else {
                stroke.setColor(textSecondary());
                canvas.drawRoundRect(box, radius, radius, stroke);
            }
        }

        @Override
        protected boolean onStateChange(int[] stateSet) {
            boolean nextChecked = false;
            for (int state : stateSet) {
                if (state == android.R.attr.state_checked) {
                    nextChecked = true;
                    break;
                }
            }
            if (checked == nextChecked) {
                return false;
            }
            checked = nextChecked;
            invalidateSelf();
            return true;
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        public int getIntrinsicWidth() {
            return intrinsicSize;
        }

        @Override
        public int getIntrinsicHeight() {
            return intrinsicSize;
        }

        @Override
        public void setAlpha(int alpha) {
            fill.setAlpha(alpha);
            stroke.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            fill.setColorFilter(colorFilter);
            stroke.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
