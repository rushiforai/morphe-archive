package app.template.extension.ui;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowMetrics;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.template.extension.settings.AccentPresets;
import app.template.extension.settings.Prefs;
import app.template.extension.settings.SurfaceColors;

public final class ThemedDialogPanel {
    public final LinearLayout body;
    public final Dialog dialog;
    public final int surface, accent, primary, secondary;
    private final Context context;
    private int heightLimit = Integer.MAX_VALUE;

    public ThemedDialogPanel(Context context, String title) {
        this.context = context;
        Prefs.load(context);
        surface = SurfaceColors.elevated(context);
        accent = 0xFF000000 | AccentPresets.previewColor(context,
                Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(context)),
                Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
        primary = AccentPresets.readableText(color("textColorPrimary", Color.WHITE), surface);
        secondary = AccentPresets.readableText(color("textColorSecondary", 0xFF99AABB), surface);

        dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        body = new LinearLayout(context) {
            @Override protected void onMeasure(int widthSpec, int heightSpec) {
                int mode = MeasureSpec.getMode(heightSpec);
                int size = MeasureSpec.getSize(heightSpec);
                int limit = mode == MeasureSpec.UNSPECIFIED ? heightLimit : Math.min(size, heightLimit);
                super.onMeasure(widthSpec, MeasureSpec.makeMeasureSpec(limit,
                        mode == MeasureSpec.EXACTLY ? MeasureSpec.EXACTLY : MeasureSpec.AT_MOST));
            }
        };
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(dp(12), dp(8), dp(12), dp(12));
        body.setFocusableInTouchMode(true);

        LinearLayout header = new LinearLayout(context);
        header.setGravity(Gravity.CENTER_VERTICAL);
        TextView heading = text("TitleLarge", primary);
        heading.setText(title);
        heading.setAccessibilityHeading(true);
        heading.setPaddingRelative(dp(8), 0, 0, 0);
        header.addView(heading, new LinearLayout.LayoutParams(0, -2, 1));
        ImageButton close = new ImageButton(context);
        int icon = resource("drawable", "close");
        close.setImageResource(icon != 0 ? icon : android.R.drawable.ic_menu_close_clear_cancel);
        close.setImageTintList(ColorStateList.valueOf(primary));
        close.setScaleType(android.widget.ImageView.ScaleType.FIT_CENTER);
        close.setPadding(dp(12), dp(12), dp(12), dp(12));
        close.setContentDescription("Close");
        close.setBackground(ripple(Color.TRANSPARENT, 24, 0));
        close.setOnClickListener(v -> dialog.dismiss());
        header.addView(close, new LinearLayout.LayoutParams(dp(48), dp(48)));
        body.addView(header);
        dialog.setContentView(body);
    }

    public void show(int preferredHeightDp) {
        Window window = dialog.getWindow();
        if (window == null) return;
        window.setBackgroundDrawable(shape(surface, 24, 0));
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        heightLimit = Math.max(1, availableBounds().height() - dp(24));
        dialog.show();
        fit(window, preferredHeightDp);
        body.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) ->
                fit(window, preferredHeightDp));
        body.requestFocus();
    }

    public int availableHeight() {
        return availableBounds().height();
    }

    private void fit(Window window, int preferredHeightDp) {
        Rect available = availableBounds();
        int width = Math.max(1, Math.min(dp(480), available.width() - dp(24)));
        int limit = Math.max(1, available.height() - dp(24));
        if (heightLimit != limit) {
            heightLimit = limit;
            body.requestLayout();
        }
        int height = preferredHeightDp > 0 ? Math.min(dp(preferredHeightDp), limit)
                : android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
        WindowManager.LayoutParams attributes = window.getAttributes();
        if (attributes.width != width || attributes.height != height) window.setLayout(width, height);
    }

    private Rect availableBounds() {
        WindowManager windows = context.getSystemService(WindowManager.class);
        WindowMetrics metrics = windows.getCurrentWindowMetrics();
        Insets insets = metrics.getWindowInsets().getInsetsIgnoringVisibility(
                WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
        Rect bounds = new Rect(metrics.getBounds());
        bounds.inset(insets.left, insets.top, insets.right, insets.bottom);
        return bounds;
    }

    public EditText search(String hint) {
        EditText field = new EditText(context);
        field.setTextAppearance(resource("style", "TextAppearance.Letterboxd.BodyMedium"));
        field.setTextColor(primary);
        field.setHintTextColor(secondary);
        field.setSingleLine(true);
        field.setImeOptions(EditorInfo.IME_ACTION_DONE);
        field.setHint(hint);
        int search = resource("drawable", "ic_search");
        field.setCompoundDrawablesRelativeWithIntrinsicBounds(search, 0, 0, 0);
        field.setCompoundDrawableTintList(ColorStateList.valueOf(secondary));
        field.setCompoundDrawablePadding(dp(10));
        field.setMinimumHeight(dp(48));
        field.setPaddingRelative(dp(12), dp(4), dp(12), dp(4));
        field.setBackground(shape(SurfaceColors.background(context), 12, 0));
        field.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        return field;
    }

    public TextView action(String label, boolean filled, Runnable listener) {
        TextView action = text("LabelLarge", filled
                ? AccentPresets.readableText(Color.WHITE, accent)
                : AccentPresets.readableText(accent, surface));
        action.setText(label);
        action.setGravity(Gravity.CENTER);
        action.setMinimumHeight(dp(48));
        action.setPaddingRelative(dp(14), 0, dp(14), 0);
        action.setBackground(ripple(filled ? accent : Color.TRANSPARENT, 14, 0));
        if (listener != null) action.setOnClickListener(v -> listener.run());
        action.setFocusable(true);
        action.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View view,
                    android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(view, info);
                info.setClassName(android.widget.Button.class.getName());
            }
        });
        return action;
    }

    public TextView text(String style, int color) {
        TextView view = new TextView(context);
        int id = resource("style", "TextAppearance.Letterboxd." + style);
        if (id != 0) view.setTextAppearance(id);
        view.setTextColor(color);
        return view;
    }

    public GradientDrawable shape(int fill, int radius, int outline) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(fill);
        shape.setCornerRadius(dp(radius));
        if (outline != 0) shape.setStroke(dp(1), outline);
        return shape;
    }

    public RippleDrawable ripple(int fill, int radius, int outline) {
        return new RippleDrawable(ColorStateList.valueOf((accent & 0xFFFFFF) | 0x33000000),
                shape(fill, radius, outline), shape(Color.WHITE, radius, 0));
    }

    public int dp(int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private int color(String name, int fallback) {
        int id = resource("color", name);
        return id == 0 ? fallback : context.getColor(id);
    }

    private int resource(String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }
}
