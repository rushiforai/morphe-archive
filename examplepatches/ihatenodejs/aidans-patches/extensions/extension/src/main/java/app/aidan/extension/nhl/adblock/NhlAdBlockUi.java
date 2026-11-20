package app.aidan.extension.nhl.adblock;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.util.StateSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/**
 * Shared UI styling and construction toolkit for NHL Web Ad Blocker.
 * Guarantees visual consistency with native NHL Android app patterns:
 * - Visible system status & navigation bars with dynamic window insets
 * - Native NHL toolbar with rounded back button tile and 16sp bold title
 * - White/dark cards with 8dp corner radius and consistent insets
 * - Native NHL outlined switch toggles
 * - Black rounded title-case primary buttons
 * - Centered navigation chevrons and Tabler vector icons
 */
final class NhlAdBlockUi {

    private NhlAdBlockUi() {}

    // --- Color Palette ---

    public static boolean isNightMode(Context context) {
        int uiMode = context.getResources().getConfiguration().uiMode;
        return (uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    public static int getPageBgColor(Context context) {
        return isNightMode(context) ? 0xFF121212 : 0xFFEFEFEF;
    }

    public static int getCardBgColor(Context context) {
        return isNightMode(context) ? 0xFF1E1E1E : 0xFFFFFFFF;
    }

    public static int getPrimaryTextColor(Context context) {
        return isNightMode(context) ? 0xFFFFFFFF : 0xFF121212;
    }

    public static int getSecondaryTextColor(Context context) {
        return isNightMode(context) ? 0xFFB0B0B0 : 0xFF666666;
    }

    public static int getDividerColor(Context context) {
        return isNightMode(context) ? 0xFF2A2A2A : 0xFFDEDEDE;
    }

    public static int getTileBgColor(Context context) {
        return isNightMode(context) ? 0xFF2A2A2A : 0xFFEFEFEF;
    }

    public static int dp(Context context, int dpVal) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dpVal,
                context.getResources().getDisplayMetrics()
        );
    }

    // --- Window and Status Bar Insets ---

    public static void configureWindowInsets(Activity activity, View root, View toolbar) {
        Window window = activity.getWindow();
        if (window == null) return;

        // Ensure window is not fullscreen and system bars are visible
        window.clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);

        boolean night = isNightMode(activity);
        int pageBg = getCardBgColor(activity); // Match header background
        window.setStatusBarColor(pageBg);
        window.setNavigationBarColor(getPageBgColor(activity));

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            android.view.WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                int appearance = night ? 0 : (android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
                controller.setSystemBarsAppearance(appearance,
                        android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                                | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
                controller.show(WindowInsets.Type.statusBars() | WindowInsets.Type.navigationBars());
            }
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            int flags = window.getDecorView().getSystemUiVisibility();
            if (!night) {
                flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            } else {
                flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            }
            flags &= ~View.SYSTEM_UI_FLAG_FULLSCREEN;
            flags &= ~View.SYSTEM_UI_FLAG_HIDE_NAVIGATION;
            window.getDecorView().setSystemUiVisibility(flags);
        }

        // Apply insets gracefully to avoid jumping or double accumulation
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            int top = 0;
            int bottom = 0;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                android.graphics.Insets bars = insets.getInsets(
                        WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()
                );
                top = bars.top;
                android.graphics.Insets nav = insets.getInsets(
                        WindowInsets.Type.navigationBars() | WindowInsets.Type.ime()
                );
                bottom = nav.bottom;
            } else {
                top = insets.getSystemWindowInsetTop();
                bottom = insets.getSystemWindowInsetBottom();
            }

            if (toolbar != null) {
                toolbar.setPadding(
                        dp(activity, 16),
                        top + dp(activity, 8),
                        dp(activity, 16),
                        dp(activity, 8)
                );
            }
            v.setPadding(0, 0, 0, bottom);
            return insets;
        });
    }

    // --- Native Header and Back Button ---

    public static LinearLayout createToolbar(Activity activity, String title, View.OnClickListener onBackClick, TextView[] outTitleView) {
        Context context = activity;
        LinearLayout toolbar = new LinearLayout(context);
        toolbar.setOrientation(LinearLayout.HORIZONTAL);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setBackgroundColor(getCardBgColor(context));

        int padH = dp(context, 16);
        int padV = dp(context, 8);
        toolbar.setPadding(padH, padV, padH, padV);
        toolbar.setMinimumHeight(dp(context, 52));

        // Back button: 34dp x 34dp squircle tile matching native NHL settings header
        FrameLayout backTouchArea = new FrameLayout(context);
        LinearLayout.LayoutParams touchLp = new LinearLayout.LayoutParams(dp(context, 34), dp(context, 34));
        backTouchArea.setLayoutParams(touchLp);
        backTouchArea.setFocusable(true);
        backTouchArea.setClickable(true);
        backTouchArea.setContentDescription("Back");
        backTouchArea.setOnClickListener(onBackClick);

        GradientDrawable tileDrawable = new GradientDrawable();
        tileDrawable.setColor(getTileBgColor(context));
        tileDrawable.setCornerRadius(dp(context, 8));
        backTouchArea.setBackground(tileDrawable);

        ImageView backIcon = new ImageView(context);
        FrameLayout.LayoutParams iconLp = new FrameLayout.LayoutParams(dp(context, 16), dp(context, 16));
        iconLp.gravity = Gravity.CENTER;
        backIcon.setLayoutParams(iconLp);
        backIcon.setImageDrawable(createBackArrowDrawable(getPrimaryTextColor(context)));
        backIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        backTouchArea.addView(backIcon);

        toolbar.addView(backTouchArea);

        // Gap between back button tile and title (16dp)
        View gap = new View(context);
        gap.setLayoutParams(new LinearLayout.LayoutParams(dp(context, 16), 1));
        toolbar.addView(gap);

        // Screen title: 18sp bold matching native NHL Settings header
        TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextColor(getPrimaryTextColor(context));
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1.0f
        );
        toolbar.addView(titleView, titleLp);

        if (outTitleView != null && outTitleView.length > 0) {
            outTitleView[0] = titleView;
        }

        return toolbar;
    }
    private static Drawable createBackArrowDrawable(int color) {
        Path path = new Path();
        path.moveTo(5f, 12f);
        path.lineTo(19f, 12f);
        path.moveTo(12f, 5f);
        path.lineTo(5f, 12f);
        path.lineTo(12f, 19f);

        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(color);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(2.4f);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeJoin(Paint.Join.ROUND);

        return new Drawable() {
            @Override
            public void draw(Canvas canvas) {
                Rect b = getBounds();
                int save = canvas.save();
                canvas.translate(b.left, b.top);
                float sx = b.width() / 24.0f;
                float sy = b.height() / 24.0f;
                canvas.scale(sx, sy);
                canvas.drawPath(path, paint);
                canvas.restoreToCount(save);
            }

            @Override
            public void setAlpha(int alpha) {
                paint.setAlpha(alpha);
            }

            @Override
            public void setColorFilter(ColorFilter colorFilter) {
                paint.setColorFilter(colorFilter);
            }

            @Override
            public int getOpacity() {
                return PixelFormat.TRANSLUCENT;
            }

            @Override
            public int getIntrinsicWidth() {
                return 24;
            }

            @Override
            public int getIntrinsicHeight() {
                return 24;
            }
        };
    }


    // --- Cards and Layout ---

    public static LinearLayout createCard(Context context, boolean isRowGroup) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(getCardBgColor(context));
        bg.setCornerRadius(dp(context, 8));
        card.setBackground(bg);

        if (isRowGroup) {
            // Row-group cards: zero vertical outer padding; individual rows own padding
            card.setPadding(0, 0, 0, 0);
        } else {
            // Plain content cards: 16dp padding on all sides
            int p = dp(context, 16);
            card.setPadding(p, p, p, p);
        }
        return card;
    }

    public static View createDivider(Context context, boolean indentForIcon) {
        View div = new View(context);
        div.setBackgroundColor(getDividerColor(context));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(context, 1)
        );
        if (indentForIcon) {
            // Indent divider to align with text column: 16dp pad + 24dp icon + 12dp gap = 52dp
            lp.setMarginStart(dp(context, 52));
        }
        div.setLayoutParams(lp);
        return div;
    }

    public static View createSectionSpacer(Context context) {
        View v = new View(context);
        v.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 20)));
        return v;
    }

    public static View createSpace(Context context, int dpVal) {
        View v = new View(context);
        v.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, dpVal)));
        return v;
    }

    // --- Navigation Row with Centered Chevron ---

    public static LinearLayout createNavRow(
            Context context,
            String iconName,
            String title,
            String subtitle,
            Runnable onClick
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12));
        row.setMinimumHeight(dp(context, 48));
        row.setFocusable(true);
        row.setClickable(true);

        // Ripple feedback
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            row.setBackground(new RippleDrawable(
                    ColorStateList.valueOf(isNightMode(context) ? 0x22FFFFFF : 0x1A000000),
                    null,
                    new ColorDrawable(Color.WHITE)
            ));
        }

        row.setOnClickListener(v -> {
            if (onClick != null) onClick.run();
        });

        // 24dp leading Tabler icon
        ImageView iconView = new ImageView(context);
        iconView.setLayoutParams(new LinearLayout.LayoutParams(dp(context, 24), dp(context, 24)));
        iconView.setImageDrawable(getDrawable(context, iconName, getPrimaryTextColor(context)));
        iconView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.addView(iconView);

        // Gap between icon and text (12dp)
        View gap = new View(context);
        gap.setLayoutParams(new LinearLayout.LayoutParams(dp(context, 12), 1));
        row.addView(gap);

        // Text column
        LinearLayout textCol = new LinearLayout(context);
        textCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1.0f
        );
        textCol.setLayoutParams(textLp);

        TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextColor(getPrimaryTextColor(context));
        textCol.addView(titleView);

        if (subtitle != null && !subtitle.isEmpty()) {
            TextView subView = new TextView(context);
            subView.setText(subtitle);
            subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            subView.setTextColor(getSecondaryTextColor(context));
            subView.setPadding(0, dp(context, 2), 0, 0);
            textCol.addView(subView);
        }

        row.addView(textCol);

        // Trailing native NHL chevron (vertically centered against entire row)
        ImageView chevron = new ImageView(context);
        LinearLayout.LayoutParams chevLp = new LinearLayout.LayoutParams(dp(context, 20), dp(context, 20));
        chevLp.gravity = Gravity.CENTER_VERTICAL;
        chevron.setLayoutParams(chevLp);
        chevron.setImageDrawable(getDrawable(context, "ic_chevron_right", getSecondaryTextColor(context)));
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.addView(chevron);

        return row;
    }

    // --- Outlined NHL Switch Construction ---

    public static View createNhlSwitch(Context context, boolean isChecked, Switch.OnCheckedChangeListener listener) {
        NhlSwitchView s = new NhlSwitchView(context);
        s.setChecked(isChecked, false);
        if (listener != null) {
            s.setOnCheckedChangeListener((btn, checked) -> listener.onCheckedChanged(null, checked));
        }
        return s;
    }

    /**
     * Custom View replicating the native NHL Compose Switch with pixel-perfect accuracy.
     * Features 48x28dp pill track, 2dp solid outline, 18dp smooth circular thumb, and 180ms animation.
     */
    public static final class NhlSwitchView extends View implements android.widget.Checkable {
        private boolean mChecked = false;
        private float mThumbPosition = 0.0f;
        private android.animation.ValueAnimator mAnimator;
        private Switch.OnCheckedChangeListener mListener;
        private Paint mPaint;

        public NhlSwitchView(Context context) {
            super(context);
            init();
        }

        private void init() {
            setFocusable(true);
            setClickable(true);
            mPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        }

        public void setOnCheckedChangeListener(Switch.OnCheckedChangeListener listener) {
            mListener = listener;
        }

        @Override
        public boolean isChecked() {
            return mChecked;
        }

        @Override
        public void setChecked(boolean checked) {
            setChecked(checked, true);
        }

        public void setChecked(boolean checked, boolean animate) {
            boolean changed = (mChecked != checked);
            mChecked = checked;
            if (changed && mListener != null) {
                mListener.onCheckedChanged(null, mChecked);
            }
            float target = checked ? 1.0f : 0.0f;
            if (animate && isAttachedToWindow()) {
                if (mAnimator != null) mAnimator.cancel();
                mAnimator = android.animation.ValueAnimator.ofFloat(mThumbPosition, target);
                mAnimator.setDuration(180);
                mAnimator.addUpdateListener(anim -> {
                    mThumbPosition = (float) anim.getAnimatedValue();
                    invalidate();
                });
                mAnimator.start();
            } else {
                mThumbPosition = target;
                invalidate();
            }
        }

        @Override
        public void toggle() {
            setChecked(!mChecked, true);
        }

        @Override
        public boolean performClick() {
            toggle();
            return super.performClick();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int w = dp(getContext(), 52); // 48dp track + 4dp margin
            int h = dp(getContext(), 44); // 28dp track + 16dp touch target padding
            setMeasuredDimension(w, h);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            boolean night = isNightMode(getContext());

            int w = getWidth();
            int h = getHeight();

            int trackW = dp(getContext(), 48);
            int trackH = dp(getContext(), 28);
            int radius = trackH / 2;

            float left = (w - trackW) / 2f;
            float top = (h - trackH) / 2f;
            float right = left + trackW;
            float bottom = top + trackH;

            // 1. Draw Track Fill
            mPaint.setStyle(Paint.Style.FILL);
            if (mChecked) {
                mPaint.setColor(night ? 0xFFFFFFFF : 0xFF121212);
            } else {
                mPaint.setColor(night ? 0xFF1E1E1E : 0xFFFFFFFF);
            }
            android.graphics.RectF trackRect = new android.graphics.RectF(left, top, right, bottom);
            canvas.drawRoundRect(trackRect, radius, radius, mPaint);

            // 2. Draw Track Border
            mPaint.setStyle(Paint.Style.STROKE);
            mPaint.setStrokeWidth(dp(getContext(), 2));
            if (mChecked) {
                mPaint.setColor(night ? 0xFFFFFFFF : 0xFF121212);
            } else {
                mPaint.setColor(night ? 0xFF4A4A4A : 0xFF121212);
            }
            canvas.drawRoundRect(trackRect, radius, radius, mPaint);

            // 3. Draw Thumb (9dp radius circle)
            float thumbRadius = dp(getContext(), 9);
            float startCx = left + radius;
            float endCx = right - radius;
            float cx = startCx + (endCx - startCx) * mThumbPosition;
            float cy = top + radius;

            mPaint.setStyle(Paint.Style.FILL);
            if (mChecked) {
                mPaint.setColor(night ? 0xFF121212 : 0xFFFFFFFF);
            } else {
                mPaint.setColor(night ? 0xFFB0B0B0 : 0xFF757575);
            }
            canvas.drawCircle(cx, cy, thumbRadius, mPaint);
        }
    }

    // --- Primary Action Button ---

    public static Button createPrimaryButton(Context context, String label, View.OnClickListener onClick) {
        Button btn = new Button(context);
        btn.setText(label);
        btn.setAllCaps(false);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        btn.setTypeface(Typeface.DEFAULT_BOLD);
        btn.setMinimumHeight(dp(context, 44));

        boolean night = isNightMode(context);
        int normalBg = night ? 0xFFFFFFFF : 0xFF121212;
        int normalText = night ? 0xFF121212 : 0xFFFFFFFF;
        int pressedBg = night ? 0xFFD0D0D0 : 0xFF2A2A2A;
        int disabledBg = night ? 0x66FFFFFF : 0x66121212;

        btn.setTextColor(normalText);

        GradientDrawable normalD = new GradientDrawable();
        normalD.setColor(normalBg);
        normalD.setCornerRadius(dp(context, 8));

        GradientDrawable pressedD = new GradientDrawable();
        pressedD.setColor(pressedBg);
        pressedD.setCornerRadius(dp(context, 8));

        GradientDrawable disabledD = new GradientDrawable();
        disabledD.setColor(disabledBg);
        disabledD.setCornerRadius(dp(context, 8));

        StateListDrawable sld = new StateListDrawable();
        sld.addState(new int[]{-android.R.attr.state_enabled}, disabledD);
        sld.addState(new int[]{android.R.attr.state_pressed}, pressedD);
        sld.addState(StateSet.WILD_CARD, normalD);
        btn.setBackground(sld);

        if (onClick != null) {
            btn.setOnClickListener(onClick);
        }
        return btn;
    }

    // --- Drawable Resource Resolution & Vector Fallbacks ---

    public static Drawable getDrawable(Context context, String name, int tintColor) {
        try {
            int resId = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
            if (resId != 0) {
                Drawable d = context.getDrawable(resId);
                if (d != null) {
                    d = d.mutate();
                    d.setTint(tintColor);
                    return d;
                }
            }
        } catch (Exception ignored) {}

        // Programmatic vector path fallback for the 6 Tabler outline icons and NHL vectors
        return new TablerVectorFallbackDrawable(name, tintColor);
    }

    /**
     * Exact Tabler outline vector path fallback drawable.
     * Ensures icons display crisply even if APK resources were not recompiled with IDs.
     */
    private static final class TablerVectorFallbackDrawable extends Drawable {
        private final String mName;
        private final Paint mPaint;
        private final Path mPath;

        public TablerVectorFallbackDrawable(String name, int color) {
            mName = name;
            mPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            mPaint.setColor(color);
            mPaint.setStyle(Paint.Style.STROKE);
            mPaint.setStrokeWidth(2.0f);
            mPaint.setStrokeCap(Paint.Cap.ROUND);
            mPaint.setStrokeJoin(Paint.Join.ROUND);

            mPath = new Path();
            buildPath(name, mPath, mPaint);
        }

        private static void buildPath(String name, Path p, Paint paint) {
            switch (name) {
                case "aidan_nhl_adblock_shield_check":
                    // M11.46 20.846 a12 12 0 0 1 -7.96 -14.846 a12 12 0 0 0 8.5 -3 a12 12 0 0 0 8.5 3 a12 12 0 0 1 -.09 7.06
                    p.moveTo(11.46f, 20.846f);
                    p.arcTo(3.5f, 6.0f, 19.5f, 22.0f, 90f, 130f, false);
                    p.lineTo(3.5f, 6.0f);
                    p.lineTo(12.0f, 3.0f);
                    p.lineTo(20.5f, 6.0f);
                    p.lineTo(20.41f, 13.06f);
                    // Checkmark: M15 19l2 2l4 -4
                    p.moveTo(15f, 19f);
                    p.lineTo(17f, 21f);
                    p.lineTo(21f, 17f);
                    break;
                case "aidan_nhl_adblock_shield_off":
                    p.moveTo(17.67f, 17.667f);
                    p.lineTo(12.0f, 21.0f);
                    p.lineTo(3.5f, 6.0f);
                    p.lineTo(5.857f, 5.876f);
                    p.moveTo(8.985f, 4.95f);
                    p.lineTo(12.0f, 3.0f);
                    p.lineTo(20.5f, 6.0f);
                    p.lineTo(19.384f, 15.376f);
                    // Slash: M3 3l18 18
                    p.moveTo(3f, 3f);
                    p.lineTo(21f, 21f);
                    break;
                case "aidan_nhl_adblock_settings":
                    // Gear circle M9 12a3 3 0 1 0 6 0a3 3 0 0 0 -6 0
                    p.addCircle(12f, 12f, 3f, Path.Direction.CW);
                    // Simplified gear cogs
                    p.moveTo(10.3f, 4.3f); p.lineTo(13.7f, 4.3f);
                    p.moveTo(19.7f, 10.3f); p.lineTo(19.7f, 13.7f);
                    p.moveTo(13.7f, 19.7f); p.lineTo(10.3f, 19.7f);
                    p.moveTo(4.3f, 13.7f); p.lineTo(4.3f, 10.3f);
                    break;
                case "aidan_nhl_adblock_filter":
                    // M4 4h16v2.172a2 2 0 0 1 -.586 1.414l-4.414 4.414v7l-6 2v-8.5l-4.48 -4.928a2 2 0 0 1 -.52 -1.345v-2.227
                    p.moveTo(4f, 4f);
                    p.lineTo(20f, 4f);
                    p.lineTo(20f, 6.172f);
                    p.lineTo(15f, 12f);
                    p.lineTo(15f, 19f);
                    p.lineTo(9f, 21f);
                    p.lineTo(9f, 12.5f);
                    p.lineTo(4.52f, 7.572f);
                    p.lineTo(4f, 6.227f);
                    p.close();
                    break;
                case "aidan_nhl_adblock_history":
                    // M12 8l0 4l2 2
                    p.moveTo(12f, 8f);
                    p.lineTo(12f, 12f);
                    p.lineTo(14f, 14f);
                    // M3.05 11a9 9 0 1 1 .5 4m-.5 5v-5h5
                    p.moveTo(3.05f, 11f);
                    p.arcTo(3f, 3f, 21f, 21f, 180f, 310f, false);
                    p.moveTo(3f, 20f);
                    p.lineTo(3f, 15f);
                    p.lineTo(8f, 15f);
                    break;
                case "aidan_nhl_adblock_chart_bar":
                    // 3 bars
                    p.moveTo(3f, 13f); p.lineTo(7f, 13f); p.lineTo(7f, 19f); p.lineTo(3f, 19f); p.close();
                    p.moveTo(9f, 5f); p.lineTo(13f, 5f); p.lineTo(13f, 19f); p.lineTo(9f, 19f); p.close();
                    p.moveTo(15f, 9f); p.lineTo(19f, 9f); p.lineTo(19f, 19f); p.lineTo(15f, 19f); p.close();
                    p.moveTo(4f, 20f); p.lineTo(18f, 20f);
                    break;
                case "ic_arrow_back":
                    // Centered arrow
                    paint.setStyle(Paint.Style.FILL);
                    p.moveTo(0.231f, 6.0f);
                    p.lineTo(5.731f, 0.208f);
                    p.lineTo(6.791f, 1.293f);
                    p.lineTo(2.622f, 5.252f);
                    p.lineTo(13.25f, 5.252f);
                    p.lineTo(13.25f, 6.752f);
                    p.lineTo(2.622f, 6.752f);
                    p.lineTo(6.769f, 10.708f);
                    p.lineTo(5.734f, 11.793f);
                    p.close();
                    break;
                case "ic_chevron_right":
                    paint.setStyle(Paint.Style.FILL);
                    p.moveTo(9.9f, 4.36f);
                    p.lineTo(16.15f, 10.61f);
                    p.lineTo(16.15f, 12.38f);
                    p.lineTo(9.9f, 18.63f);
                    p.lineTo(8.13f, 16.86f);
                    p.lineTo(13.5f, 11.5f);
                    p.lineTo(8.13f, 6.13f);
                    p.close();
                    break;
                default:
                    p.addCircle(12f, 12f, 8f, Path.Direction.CW);
                    break;
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            int save = canvas.save();
            canvas.translate(bounds.left, bounds.top);
            float scaleX = bounds.width() / 24.0f;
            float scaleY = bounds.height() / 24.0f;
            canvas.scale(scaleX, scaleY);
            canvas.drawPath(mPath, mPaint);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
            mPaint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            mPaint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public int getIntrinsicWidth() {
            return "ic_arrow_back".equals(mName) ? 14 : 24;
        }

        @Override
        public int getIntrinsicHeight() {
            return "ic_arrow_back".equals(mName) ? 12 : 24;
        }
    }
}
