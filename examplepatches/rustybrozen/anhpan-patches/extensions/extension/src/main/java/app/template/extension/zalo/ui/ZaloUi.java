package app.template.extension.zalo.ui;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Base64;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.lang.reflect.Constructor;

/** Zalo-styled view builders shared by Anhpan screens: rows, switches, icons, groups, pages. */
public final class ZaloUi {
    private ZaloUi() { }

    static final int BLUE = 0xFF0068FF;

    private static final int BLUE_DARK = 0xFF3D8BFF;

    private static final int ROW_TITLE_KEY = 0x7E4E5A01;

    private static final int ROW_DIVIDER_KEY = 0x7E4E5A02;

    private static final int HEADER_BLUE = 0xFF008DFA;

    private static final int DIVIDER = 0xFFE9EAEC;

    private static final int SECTION = 0xFFF2F3F5;

    private static final String GEAR_ICON = "iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAQAAAD9CzEMAAADgklEQVR42u1Yv09UQRD+7viRozjACCZiYsRSQE2MgEQtjI2ggCgkiv+AdmDhj4LYKWo8FK7wB7HSKFFjY+dJCAhaaRQUC0iMCQGRAiGBxJPPgmFu99493oNgbNwt9u3szJuX2W++2X0B4u+2IP47WDMHQTSgB1OYQg/qV2BHfz2dT2i2Lqb5s/Tr4BqTW+taOsjlT4eDn8zxY5vuErn9aMAGxPECTzGPMwgDAEZwAEHEsBVAGKdxBSEcQxUyMI7H6PO7B1m8b3zpFAe4IM9NBMFmmS1wgD8MzU5m+QvRfaZuk1xPEMyzXkvLhQ8He12M53hIdao476JV4e2gXVQ/8AhbOC7B6OVuS6uUfaI3zhZWc1BmN70dPBfVKsF/EfdwY0qEFLCMJUwnCFaL1TNvFM3JuAsvAMQx5JqjYxjT551J1sugqFG+ZUK+zU/P4IRYnfQOUUgxUmLJi9nGIc5ylkOMsNha2644C/mB6RtR36OSTEYZt9ASZwczdb1CpAPeMM3hRUmrBd3aTMZSQjKmLgrU5kIygdiMeZ0zat6n8ijdWofq9BocddVk2sTrgxYhzynuizU4w6xlmGHWclgDVaR5MWeRecDpoMEihUTWtonsM3NVto5fRHpDZZUWgRx3OuiRpRE2Cecs9iGR11qxPSrSQUOWxyaOiLzb6WBKljYnbfvSroQtabZG3NYu1BiIJGhk3GILODJxJS3gXvQHZexGM/IMjW8yHrTslmZfDVk+mvFSnj86qaLe2KIfQnXmJg9z3bKbfFiDTJJ1qWDaZSjMszQFTI8ym9ms09cnYFpuVYhHqWAKprHVKO69PhKtXXVeq2yal1Mn2hI6zvumipdKFZvU5hyzvcnubQqy63CQ3S2D7JbKbL+fmpyga5uSixjhIGc4w4+8obFf7DtWQtentNaupOB8dys4zkNslYxRxH2n1y9E5akyeclZk7NkfAcAyMA2hDFqVN9EK8AWzOIT4gDeJ1kvU5PblcZqeImTWh1KLa0yrQATbGGNUmLEew/2uWB+npVG1rodvMr91OROj6NjvuvR8Y6/s2kW71mvfZ10+D0rs9/st1zddYLU/X5QwQi7+IAnGCJ4XotRIbdyVGbnCIbYyIfsYsRIy1VcQMKcXu0FxN9lbga3HbIoptfyEphmkTn5aK0vgWCAx/iKk5xkjHUJvvfqgf//Kv65gz/gmFMG8oKg/wAAAABJRU5ErkJggg==";

    static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics());
    }

    public static boolean isDarkMode(Context context) {
        return (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    public static boolean isDarkMode(Context context, View reference) {
        if (isDarkMode(context)) return true;
        TextView nativeLabel = findTextView(reference);
        if (nativeLabel == null) return false;
        int color = nativeLabel.getCurrentTextColor();
        int red = (color >> 16) & 0xFF;
        int green = (color >> 8) & 0xFF;
        int blue = color & 0xFF;
        return (red * 299 + green * 587 + blue * 114) / 1000 > 180;
    }

    private static TextView findTextView(View view) {
        if (view instanceof TextView) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            TextView text = findTextView(group.getChildAt(index));
            if (text != null) return text;
        }
        return null;
    }

    private static int themeColor(Context context, int attribute, int fallback) {
        TypedValue color = new TypedValue();
        if (!context.getTheme().resolveAttribute(attribute, color, true)) return fallback;
        try {
            return color.resourceId != 0
                    ? context.getColorStateList(color.resourceId).getDefaultColor() : color.data;
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    private static int resourceColor(Context context, String name, int fallback) {
        int resourceId = context.getResources().getIdentifier(
                name, "color", context.getPackageName());
        if (resourceId == 0) return fallback;
        try {
            return context.getColorStateList(resourceId).getDefaultColor();
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    // Dark-mode colors come from Zalo's own theme tokens so Anhpan screens follow
    // the stock dark palette and the AMOLED dark theme patch alike.
    private static int surfaceColor(Context context, boolean darkMode) {
        if (darkMode) return attrColor(context, "layer_background", 0xFF121212);
        return resourceColor(context, "ui_background", themeColor(context, android.R.attr.colorBackground,
            0xFFFFFFFF));
    }

    private static int sectionColor(Context context, boolean darkMode) {
        return darkMode ? attrColor(context, "surface_background", 0xFF1E1E1E) : SECTION;
    }

    private static int dividerColor(Context context, boolean darkMode) {
        return darkMode ? attrColor(context, "divider_01", 0xFF303030) : DIVIDER;
    }

    private static int headerColor(Context context, boolean darkMode) {
        return darkMode ? attrColor(context, "header_blue_container", HEADER_BLUE) : HEADER_BLUE;
    }

    private static int textColor(Context context, boolean darkMode) {
        return darkMode ? 0xFFFFFFFF
                : resourceColor(context, "list_item_title",
                themeColor(context, android.R.attr.textColorPrimary, 0xFF222222));
    }

    private static TextView label(Context context, String value, boolean darkMode) {
        TextView text;
        try {
            Constructor<?> constructor = Class.forName("com.zing.zalo.ui.widget.RobotoTextView")
                    .getConstructor(Context.class);
            text = (TextView) constructor.newInstance(context);
        } catch (ReflectiveOperationException | ClassCastException | SecurityException failure) {
            text = new TextView(context);
        }
        text.setText(value);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        text.setTextColor(textColor(context, darkMode));
        text.setGravity(Gravity.CENTER_VERTICAL);
        return text;
    }

    public static View row(Context context, String title, Drawable icon, boolean chevron,
                            boolean darkMode, TextView nativeTitle) {
        return row(context, title, icon, chevron, darkMode, nativeTitle, 56);
    }

    public static View row(Context context, String title, Drawable icon, boolean chevron,
                            boolean darkMode, TextView nativeTitle, int heightDp) {
        LinearLayout wrapper = new LinearLayout(context);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        wrapper.setBackgroundColor(surfaceColor(context, darkMode));
        LinearLayout content = new LinearLayout(context);
        content.setGravity(Gravity.CENTER_VERTICAL);
        content.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        TypedValue ripple = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
            content.setBackgroundResource(ripple.resourceId);
        }
        if (icon != null) {
            View leading = new View(context);
            leading.setBackground(icon);
            LinearLayout.LayoutParams leadingParams = new LinearLayout.LayoutParams(dp(context, 24), dp(context, 24));
            leadingParams.rightMargin = dp(context, 18);
            content.addView(leading, leadingParams);
        }
        TextView text = nativeTitle == null ? label(context, title, darkMode) : new TextView(context);
        if (nativeTitle != null) {
            text.setText(title);
            text.setTextSize(TypedValue.COMPLEX_UNIT_PX, nativeTitle.getTextSize());
            text.setTypeface(nativeTitle.getTypeface());
            text.setTextColor(nativeTitle.getTextColors());
            text.setGravity(Gravity.CENTER_VERTICAL);
        }
        text.setSingleLine(true);
        text.setEllipsize(android.text.TextUtils.TruncateAt.END);
        content.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        wrapper.setTag(ROW_TITLE_KEY, text);
        if (chevron) {
            ImageView trailing = new ImageView(context);
            int chevronId = context.getResources().getIdentifier(
                    "zds_ic_chevron_right_line_16", "drawable", context.getPackageName());
            if (chevronId != 0) {
                trailing.setImageResource(chevronId);
                int colorAttribute = context.getResources().getIdentifier("icon_02", "attr", context.getPackageName());
                TypedValue color = new TypedValue();
                if (colorAttribute != 0 && context.getTheme().resolveAttribute(colorAttribute, color, true)) {
                    trailing.setImageTintList(ColorStateList.valueOf(color.resourceId != 0
                            ? context.getColorStateList(color.resourceId).getDefaultColor() : color.data));
                }
            } else {
                trailing.setImageDrawable(new LineIcon(0xFF999999, 1));
            }
            content.addView(trailing, new LinearLayout.LayoutParams(dp(context, 16), dp(context, 16)));
        }
        wrapper.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, heightDp)));
        View divider = new View(context);
        divider.setBackgroundColor(dividerColor(context, darkMode));
        LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 1));
        // The entry row (49dp) keeps the inset that lines up with Zalo's native list.
        dividerParams.leftMargin = dp(context, icon == null ? 16 : heightDp < 56 ? 50 : 58);
        wrapper.addView(divider, dividerParams);
        wrapper.setTag(ROW_DIVIDER_KEY, divider);
        content.setOnClickListener(view -> wrapper.performClick());
        return wrapper;
    }

    public static Drawable gearIcon(Context context) {
        try {
            byte[] bytes = Base64.decode(GEAR_ICON, Base64.DEFAULT);
            Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
            if (bitmap == null) throw new IllegalStateException("Invalid icon image");
            Drawable icon = new BitmapDrawable(context.getResources(), bitmap);
            icon.setColorFilter(BLUE, PorterDuff.Mode.SRC_IN);
            return icon;
        } catch (Exception failure) {
            return new LineIcon(BLUE, 0);
        }
    }

    public static void addGroup(LinearLayout list, Context context, String title, boolean darkMode) {
        View spacer = new View(context);
        spacer.setBackgroundColor(sectionColor(context, darkMode));
        list.addView(spacer, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 8)));
        TextView heading = label(context, title, darkMode);
        heading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        heading.setTextColor(darkMode ? BLUE_DARK : 0xFF1255B8);
        heading.setPadding(dp(context, 16), 0, 0, 0);
        heading.setBackgroundColor(surfaceColor(context, darkMode));
        list.addView(heading, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 48)));
    }

    /** Settings row with a leading Zalo icon, a label and a trailing Zalo-style switch. */
    public static View toggleRow(LinearLayout list, Context context, String title, String icon, boolean checked,
            boolean darkMode, CompoundButton.OnCheckedChangeListener listener) {
        View wrapper = row(context, title, zdsIcon(context, icon, darkMode), false, darkMode, null);
        LinearLayout content = (LinearLayout) ((ViewGroup) wrapper).getChildAt(0);
        CompoundButton toggle = zaloSwitch(context, darkMode);
        toggle.setContentDescription(title);
        toggle.setChecked(checked);
        toggle.setOnCheckedChangeListener(listener);
        LinearLayout.LayoutParams toggleParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        toggleParams.leftMargin = dp(context, 12);
        content.addView(toggle, toggleParams);
        wrapper.setOnClickListener(view -> toggle.setChecked(!toggle.isChecked()));
        list.addView(wrapper);
        return wrapper;
    }

    /** Prefer Zalo's own design-system switch; fall back to a look-alike when it is unavailable. */
    private static CompoundButton zaloSwitch(Context context, boolean darkMode) {
        try {
            CompoundButton native_ = (CompoundButton) Class.forName("com.zing.zalo.zdesign.component.Switch")
                .getConstructor(Context.class).newInstance(context);
            int unspecified = View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED);
            native_.measure(unspecified, unspecified);
            if (native_.getMeasuredWidth() > 0 && native_.getMeasuredHeight() > 0) return native_;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
        }
        return new ZaloToggle(context, darkMode);
    }

    public static Drawable zdsIcon(Context context, String name, boolean darkMode) {
        int id = context.getResources().getIdentifier("zds_ic_" + name + "_line_24", "drawable",
            context.getPackageName());
        if (id == 0) return null;
        try {
            Drawable icon = context.getDrawable(id);
            if (icon == null) return null;
            icon = icon.mutate();
            icon.setTint(darkMode ? BLUE_DARK : BLUE);
            return icon;
        } catch (RuntimeException ignored) {
            return null;
        }
    }

    public static TextView rowTitle(View row) {
        Object title = row.getTag(ROW_TITLE_KEY);
        return title instanceof TextView ? (TextView) title : findTextView(row);
    }

    /** Hide the separator under the last visible row of each group, like Zalo's own lists. */
    public static void trimGroupDividers(LinearLayout list) {
        View lastRow = null;
        for (int index = 0; index <= list.getChildCount(); index++) {
            View child = index < list.getChildCount() ? list.getChildAt(index) : null;
            if (child != null && child.getVisibility() == View.GONE) continue;
            Object divider = child == null ? null : child.getTag(ROW_DIVIDER_KEY);
            if (child != null && divider instanceof View) {
                if (lastRow != null) ((View) lastRow.getTag(ROW_DIVIDER_KEY)).setVisibility(View.VISIBLE);
                lastRow = child;
                continue;
            }
            if (lastRow != null) ((View) lastRow.getTag(ROW_DIVIDER_KEY)).setVisibility(View.GONE);
            lastRow = null;
        }
    }

    public static Dialog page(Context context, String title, boolean darkMode) {
        Dialog page = new Dialog(context, android.R.style.Theme_DeviceDefault_NoActionBar);
        page.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout screen = new LinearLayout(context);
        screen.setOrientation(LinearLayout.VERTICAL);
        screen.setBackgroundColor(headerColor(context, darkMode));
        screen.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(0, insets.getSystemWindowInsetTop(), 0, 0);
            return insets;
        });
        LinearLayout bar = new LinearLayout(context);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(headerColor(context, darkMode));
        ImageView back = new ImageView(context);
        int backId = context.getResources().getIdentifier(
            "zds_ic_arrow_left_line_24", "drawable", context.getPackageName());
        if (backId != 0) back.setImageResource(backId);
        else {
            back.setImageDrawable(new LineIcon(0xFFFFFFFF, 1));
            back.setRotation(180f);
        }
        back.setImageTintList(ColorStateList.valueOf(0xFFFFFFFF));
        back.setScaleType(ImageView.ScaleType.CENTER);
        back.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        back.setContentDescription("Back");
        back.setOnClickListener(view -> page.dismiss());
        bar.addView(back, new LinearLayout.LayoutParams(dp(context, 56), ViewGroup.LayoutParams.MATCH_PARENT));
        TextView pageTitle = label(context, title, darkMode);
        pageTitle.setTextColor(0xFFFFFFFF);
        bar.addView(pageTitle, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        screen.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        ScrollView scroll = new ScrollView(context);
        scroll.setBackgroundColor(sectionColor(context, darkMode));
        LinearLayout list = new LinearLayout(context);
        list.setTag("anhpan-list");
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        screen.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        page.setContentView(screen);
        Window window = page.getWindow();
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        window.setBackgroundDrawable(new ColorDrawable(surfaceColor(context, darkMode)));
        window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(0f);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) window.setStatusBarContrastEnforced(false);
        window.setStatusBarColor(0x00000000);
        window.getDecorView().setSystemUiVisibility(
            (window.getDecorView().getSystemUiVisibility() | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                | View.SYSTEM_UI_FLAG_LAYOUT_STABLE) & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        return page;
    }

    static int attrColor(Context context, String name, int fallback) {
        int attribute = context.getResources().getIdentifier(name, "attr", context.getPackageName());
        return attribute == 0 ? fallback : themeColor(context, attribute, fallback);
    }
}
