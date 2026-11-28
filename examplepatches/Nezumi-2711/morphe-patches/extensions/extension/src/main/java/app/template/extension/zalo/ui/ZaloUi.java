package app.template.extension.zalo.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.Base64;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.PathInterpolator;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;

import app.template.extension.zalo.appearance.CustomFont;
import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;

/** Zalo-styled view builders shared by Nezumi screens: rows, switches, icons, groups, pages. */
public final class ZaloUi {
    private ZaloUi() { }

    static final int BLUE = 0xFF0068FF;

    private static final int BLUE_DARK = 0xFF3D8BFF;

    private static final int ROW_TITLE_KEY = 0x7E4E5A01;

    private static final int ROW_DIVIDER_KEY = 0x7E4E5A02;

    private static final int ROW_ANIMATOR_KEY = 0x7E4E5A03;

    private static final int CHILD_SLIDE_DP = 12;

    private static final long CHILD_ANIMATION_MS = 200;

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
        } catch (RuntimeException failure) {
            NezumiLog.swallowedOnce(Patch.CORE, "ZaloUi", "theme color unavailable, using fallback", failure);
            return fallback;
        }
    }

    private static int resourceColor(Context context, String name, int fallback) {
        int resourceId = context.getResources().getIdentifier(
                name, "color", context.getPackageName());
        if (resourceId == 0) return fallback;
        try {
            return context.getColorStateList(resourceId).getDefaultColor();
        } catch (RuntimeException failure) {
            NezumiLog.swallowedOnce(Patch.CORE, "ZaloUi", "color " + name + " unavailable, using fallback", failure);
            return fallback;
        }
    }

    // Dark-mode colors come from Zalo's own theme tokens so Nezumi screens follow
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
            NezumiLog.swallowedOnce(Patch.CORE, "ZaloUi", "RobotoTextView unavailable, using TextView", failure);
            text = new TextView(context);
        }
        text.setText(value);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        text.setTextColor(textColor(context, darkMode));
        text.setGravity(Gravity.CENTER_VERTICAL);
        android.graphics.Typeface font = CustomFont.forMessageModule(context, text.getTypeface());
        if (font != text.getTypeface()) text.setTypeface(font);
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
            NezumiLog.swallowedOnce(Patch.CORE, "ZaloUi", "gear icon unavailable, using line icon", failure);
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
        return switchRow(list, context, title, zdsIcon(context, icon, darkMode), checked, darkMode, listener);
    }

    /**
     * Adds a container to {@code list} that links a parent row with its dependent rows: add the rows
     * to it with {@link #toggleRow}. While more than one of its rows is visible, a blue bar runs down
     * the left edge and the dividers between the linked rows are hidden (see {@link #trimGroupDividers}).
     */
    public static LinearLayout linkedRows(LinearLayout list, Context context, boolean darkMode) {
        LinkedRows group = new LinkedRows(context, darkMode ? BLUE_DARK : BLUE);
        list.addView(group, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return group;
    }

    /** Draws the 3dp link bar over its rows' left edge, inset 10dp, rounded on the right. */
    private static final class LinkedRows extends LinearLayout {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path bar = new Path();
        private final RectF bounds = new RectF();
        private boolean linked;

        LinkedRows(Context context, int color) {
            super(context);
            setOrientation(VERTICAL);
            paint.setColor(color);
        }

        void setLinked(boolean value) {
            if (linked == value) return;
            linked = value;
            invalidate();
        }

        @Override
        protected void dispatchDraw(Canvas canvas) {
            super.dispatchDraw(canvas);
            int inset = dp(getContext(), 10);
            if (!linked || getHeight() <= inset * 2) return;
            float width = dp(getContext(), 3);
            bounds.set(0, inset, width, getHeight() - inset);
            bar.reset();
            bar.addRoundRect(bounds, new float[] { 0, 0, width, width, width, width, 0, 0 }, Path.Direction.CW);
            canvas.drawPath(bar, paint);
        }
    }

    /**
     * Shows or hides a dependent row (inside {@link #linkedRows} or directly in {@code list}). When
     * animated, the row expands from zero height while fading in and its content slides down from
     * under the row above; collapsing reverses that and ends with GONE. A running animation is
     * cancelled and the new one starts from its current state. Dividers and the link bar are
     * re-trimmed when the row appears and after it is gone, so the bar spans the row while it animates.
     */
    public static void setChildRowVisible(LinearLayout list, View row, boolean visible, boolean animate) {
        Object running = row.getTag(ROW_ANIMATOR_KEY);
        row.setTag(ROW_ANIMATOR_KEY, null);
        if (running instanceof ValueAnimator) ((ValueAnimator) running).cancel();
        boolean shown = row.getVisibility() == View.VISIBLE;
        ViewGroup host = row.getParent() instanceof ViewGroup ? (ViewGroup) row.getParent() : list;
        int width = host.getWidth() - host.getPaddingLeft() - host.getPaddingRight();
        if (!animate || width <= 0 || !row.isAttachedToWindow() || (running == null && shown == visible)) {
            settleChildRow(list, row, visible);
            return;
        }
        float slide = -dp(row.getContext(), CHILD_SLIDE_DP);
        ViewGroup.LayoutParams params = row.getLayoutParams();
        int startHeight = shown ? (params.height >= 0 ? params.height : row.getHeight()) : 0;
        float startAlpha = shown ? row.getAlpha() : 0f;
        float startShift = shown ? childShift(row) : slide;
        int endHeight = 0;
        if (visible) {
            row.setVisibility(View.VISIBLE);
            trimGroupDividers(list);
            row.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            endHeight = row.getMeasuredHeight();
        }
        float endAlpha = visible ? 1f : 0f;
        float endShift = visible ? 0f : slide;
        params.height = startHeight;
        row.setLayoutParams(params);
        row.setAlpha(startAlpha);
        setChildShift(row, startShift);
        int targetHeight = endHeight;
        ValueAnimator animator = ValueAnimator.ofFloat(0f, 1f);
        animator.setDuration(CHILD_ANIMATION_MS);
        animator.setInterpolator(new PathInterpolator(0.4f, 0f, 0.2f, 1f));
        animator.addUpdateListener(animation -> {
            float fraction = (float) animation.getAnimatedValue();
            ViewGroup.LayoutParams current = row.getLayoutParams();
            current.height = Math.round(startHeight + (targetHeight - startHeight) * fraction);
            row.setLayoutParams(current);
            row.setAlpha(startAlpha + (endAlpha - startAlpha) * fraction);
            setChildShift(row, startShift + (endShift - startShift) * fraction);
        });
        animator.addListener(new AnimatorListenerAdapter() {
            private boolean cancelled;

            @Override
            public void onAnimationCancel(Animator animation) {
                cancelled = true;
            }

            @Override
            public void onAnimationEnd(Animator animation) {
                if (cancelled) return;
                row.setTag(ROW_ANIMATOR_KEY, null);
                settleChildRow(list, row, visible);
            }
        });
        row.setTag(ROW_ANIMATOR_KEY, animator);
        animator.start();
    }

    private static void settleChildRow(LinearLayout list, View row, boolean visible) {
        ViewGroup.LayoutParams params = row.getLayoutParams();
        if (params != null && params.height != ViewGroup.LayoutParams.WRAP_CONTENT) {
            params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            row.setLayoutParams(params);
        }
        row.setAlpha(1f);
        setChildShift(row, 0f);
        row.setVisibility(visible ? View.VISIBLE : View.GONE);
        trimGroupDividers(list);
    }

    /** Slides the row's contents rather than the row, so the row's own bounds clip them under the row above. */
    private static void setChildShift(View row, float shift) {
        if (!(row instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) row;
        for (int index = 0; index < group.getChildCount(); index++) group.getChildAt(index).setTranslationY(shift);
    }

    private static float childShift(View row) {
        return row instanceof ViewGroup && ((ViewGroup) row).getChildCount() > 0
            ? ((ViewGroup) row).getChildAt(0).getTranslationY() : 0f;
    }

    private static View switchRow(LinearLayout list, Context context, String title, Drawable icon, boolean checked,
            boolean darkMode, CompoundButton.OnCheckedChangeListener listener) {
        View wrapper = row(context, title, icon, false, darkMode, null);
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
            NezumiLog.swallowedOnce(Patch.CORE, "ZaloUi", "native switch unavailable, using ZaloToggle", failure);
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
        } catch (RuntimeException failure) {
            NezumiLog.swallowedOnce(Patch.CORE, "ZaloUi", "icon " + name + " unavailable", failure);
            return null;
        }
    }

    public static TextView rowTitle(View row) {
        Object title = row.getTag(ROW_TITLE_KEY);
        return title instanceof TextView ? (TextView) title : findTextView(row);
    }

    /**
     * Hide the separator under the last visible row of each group, like Zalo's own lists. Rows inside
     * {@link #linkedRows} count as rows of the list; while linked, the separators between them are hidden.
     */
    public static void trimGroupDividers(LinearLayout list) {
        List<View> children = new ArrayList<>();
        List<LinkedRows> linkedGroups = new ArrayList<>();
        for (int index = 0; index < list.getChildCount(); index++) {
            View child = list.getChildAt(index);
            if (!(child instanceof LinkedRows)) {
                children.add(child);
                continue;
            }
            LinkedRows group = (LinkedRows) child;
            linkedGroups.add(group);
            if (group.getVisibility() == View.GONE) continue;
            for (int inner = 0; inner < group.getChildCount(); inner++) children.add(group.getChildAt(inner));
        }
        View lastRow = null;
        for (int index = 0; index <= children.size(); index++) {
            View child = index < children.size() ? children.get(index) : null;
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
        for (LinkedRows group : linkedGroups) {
            View previous = null;
            int visibleRows = 0;
            for (int index = 0; index < group.getChildCount(); index++) {
                View child = group.getChildAt(index);
                if (child.getVisibility() == View.GONE) continue;
                visibleRows++;
                Object divider = previous == null ? null : previous.getTag(ROW_DIVIDER_KEY);
                if (divider instanceof View) ((View) divider).setVisibility(View.GONE);
                previous = child;
            }
            group.setLinked(group.getVisibility() != View.GONE && visibleRows > 1);
        }
    }

    public static Dialog page(Context context, String title, boolean darkMode) {
        Dialog page = new Dialog(context);
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
        list.setTag("nezumi-list");
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        screen.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        page.setContentView(screen);
        Window window = page.getWindow();
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

    /**
     * Zalo-styled two-button confirmation. Back, a tap outside and the negative button all run
     * {@code onNegative}; exactly one of the two callbacks runs.
     */
    public static Dialog confirm(Context context, boolean darkMode, String title, String message,
            String negative, String positive, Runnable onNegative, Runnable onPositive) {
        Dialog dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        boolean[] decided = { false };
        LinearLayout box = new LinearLayout(context);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(context, 20), dp(context, 22), dp(context, 20), dp(context, 16));
        GradientDrawable background = new GradientDrawable();
        background.setColor(darkMode ? sectionColor(context, true) : 0xFFFFFFFF);
        background.setCornerRadius(dp(context, 12));
        box.setBackground(background);
        TextView heading = label(context, title, darkMode);
        heading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        heading.setTypeface(android.graphics.Typeface.create(heading.getTypeface(), android.graphics.Typeface.BOLD));
        box.addView(heading, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView body = label(context, message, darkMode);
        body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        body.setTextColor(darkMode ? 0xFFA3A9B1 : 0xFF5C6470);
        body.setLineSpacing(0f, 1.2f);
        LinearLayout.LayoutParams bodyParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        bodyParams.topMargin = dp(context, 8);
        bodyParams.bottomMargin = dp(context, 18);
        box.addView(body, bodyParams);
        LinearLayout actions = new LinearLayout(context);
        actions.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        TextView later = pill(context, negative, darkMode ? 0xFF34363A : 0xFFEAEDF0, textColor(context, darkMode), darkMode);
        TextView now = pill(context, positive, darkMode ? BLUE_DARK : BLUE, 0xFFFFFFFF, darkMode);
        actions.addView(later);
        LinearLayout.LayoutParams nowParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        nowParams.leftMargin = dp(context, 8);
        actions.addView(now, nowParams);
        box.addView(actions);
        later.setOnClickListener(view -> dialog.cancel());
        now.setOnClickListener(view -> {
            if (decided[0]) return;
            decided[0] = true;
            dialog.dismiss();
            onPositive.run();
        });
        dialog.setOnCancelListener(view -> {
            if (decided[0]) return;
            decided[0] = true;
            if (onNegative != null) onNegative.run();
        });
        dialog.setContentView(box);
        Window window = dialog.getWindow();
        window.setBackgroundDrawable(new ColorDrawable(0x00000000));
        dialog.show();
        int width = Math.min(context.getResources().getDisplayMetrics().widthPixels - dp(context, 48), dp(context, 320));
        window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
        return dialog;
    }

    /** A tinted strip with an info icon, a message and one action button, for the top of a page. */
    public static View banner(Context context, String message, String action, boolean darkMode, Runnable onAction) {
        LinearLayout strip = new LinearLayout(context);
        strip.setGravity(Gravity.CENTER_VERTICAL);
        strip.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12));
        strip.setBackgroundColor(darkMode ? 0xFF12253F : 0xFFE8F1FF);
        Drawable icon = zdsIcon(context, "info_circle", darkMode);
        if (icon != null) {
            View leading = new View(context);
            leading.setBackground(icon);
            LinearLayout.LayoutParams leadingParams = new LinearLayout.LayoutParams(dp(context, 22), dp(context, 22));
            leadingParams.rightMargin = dp(context, 12);
            strip.addView(leading, leadingParams);
        }
        TextView text = label(context, message, darkMode);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setTextColor(darkMode ? 0xFFBCD6FF : 0xFF0B3D91);
        strip.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView button = pill(context, action, darkMode ? BLUE_DARK : BLUE, 0xFFFFFFFF, darkMode);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        buttonParams.leftMargin = dp(context, 12);
        strip.addView(button, buttonParams);
        button.setOnClickListener(view -> onAction.run());
        return strip;
    }

    private static TextView pill(Context context, String value, int fill, int textColor, boolean darkMode) {
        TextView pill = label(context, value, darkMode);
        pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        pill.setTextColor(textColor);
        pill.setGravity(Gravity.CENTER);
        pill.setSingleLine(true);
        pill.setPadding(dp(context, 16), dp(context, 9), dp(context, 16), dp(context, 9));
        GradientDrawable background = new GradientDrawable();
        background.setColor(fill);
        background.setCornerRadius(dp(context, 18));
        pill.setBackground(background);
        pill.setClickable(true);
        return pill;
    }

    static int attrColor(Context context, String name, int fallback) {
        int attribute = context.getResources().getIdentifier(name, "attr", context.getPackageName());
        return attribute == 0 ? fallback : themeColor(context, attribute, fallback);
    }
}
