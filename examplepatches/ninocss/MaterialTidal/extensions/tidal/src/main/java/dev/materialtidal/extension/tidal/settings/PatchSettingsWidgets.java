package dev.materialtidal.extension.tidal.settings;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Shared Material 3 Expressive palette, grouped card drawables, vector icon badges,
 * spring-animated switches with press squeeze physics, connected segmented controls,
 * and thick-track sliders for {@link PatchSettingsBottomSheet}.
 */
public final class PatchSettingsWidgets {

    private PatchSettingsWidgets() {
    }

    public static final class Palette {
        public int surfaceBase;
        public int surfaceLow;
        public int surfaceContainer;
        public int surfaceHigh;
        public int surfaceHighest;
        public int primary;
        public int onPrimary;
        public int primaryContainer;
        public int onPrimaryContainer;
        public int secondaryContainer;
        public int onSecondaryContainer;
        public int tertiary;
        public int tertiaryContainer;
        public int onTertiaryContainer;
        public int onSurface;
        public int onSurfaceVar;
        public int outline;
        public int outlineVar;
        public int error;
        public int errorContainer;
        public int onErrorContainer;
        public boolean lightMode;

        public Palette(Context ctx) {
            reload(ctx);
        }

        public void reload(Context ctx) {
            boolean useMonet = false;
            try {
                useMonet = MaterialYouConfig.isMaterialYouEnabled();
            } catch (Throwable ignored) {
            }
            if (useMonet) {
                surfaceBase = MaterialYouColorEngine.getSurfaceBase();
                surfaceLow = MaterialYouColorEngine.getSurfaceLow();
                surfaceContainer = MaterialYouColorEngine.getSurfaceContainer();
                surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
                surfaceHighest = MaterialYouColorEngine.getSurfaceContainerHighest();
                primary = MaterialYouColorEngine.getPrimaryAccent();
                onPrimary = MaterialYouColorEngine.getOnPrimary();
                primaryContainer = MaterialYouColorEngine.getPrimaryContainer();
                onPrimaryContainer = MaterialYouColorEngine.getOnPrimaryContainer();
                secondaryContainer = MaterialYouColorEngine.getSecondaryContainer();
                onSecondaryContainer = MaterialYouColorEngine.getOnSecondaryContainer();
                tertiary = MaterialYouColorEngine.getTertiaryAccent();
                tertiaryContainer = MaterialYouColorEngine.getTertiaryContainer();
                onTertiaryContainer = MaterialYouColorEngine.getOnTertiaryContainer();
                onSurface = MaterialYouColorEngine.getOnSurface();
                onSurfaceVar = MaterialYouColorEngine.getOnSurfaceVariant();
                outline = MaterialYouColorEngine.getOutline();
                outlineVar = MaterialYouColorEngine.getOutlineVariant();
                error = MaterialYouColorEngine.getError();
                errorContainer = MaterialYouColorEngine.getErrorContainer();
                onErrorContainer = MaterialYouColorEngine.getOnErrorContainer();
                lightMode = MaterialYouColorEngine.isLightMode(ctx);
            } else {
                surfaceBase = 0xFF0E0E12;
                surfaceLow = 0xFF131318;
                surfaceContainer = 0xFF191920;
                surfaceHigh = 0xFF22222B;
                surfaceHighest = 0xFF2D2D38;
                primary = 0xFF33FFEE;
                onPrimary = 0xFF00201D;
                primaryContainer = 0xFF173E3A;
                onPrimaryContainer = 0xFFB8FFF6;
                secondaryContainer = 0xFF243438;
                onSecondaryContainer = 0xFFCDE7ED;
                tertiary = 0xFFFFBF80;
                tertiaryContainer = 0xFF4A3118;
                onTertiaryContainer = 0xFFFFDDB8;
                onSurface = 0xFFF4F4F8;
                onSurfaceVar = 0xFFAAAAB5;
                outline = 0xFF7B7B86;
                outlineVar = 0xFF3C3C48;
                error = 0xFFFFB4AB;
                errorContainer = 0xFF690005;
                onErrorContainer = 0xFFFFDAD6;
                lightMode = false;
            }
        }
    }

    static final class Choice {
        final int value;
        final String label;

        Choice(int value, String label) {
            this.value = value;
            this.label = label;
        }
    }

    interface IntSelectionListener {
        void onSelected(int value);
    }

    /**
     * Tonal rounded-squircle or circular container hosting a {@link PatchSettingsIcons} vector icon.
     */
    static final class TonalIconBadge extends FrameLayout {
        private final ImageView iconView;
        private final PatchSettingsIcons.SettingsVectorDrawable drawable;
        private final float cornerRadiusPx;
        private final float strokePx;

        TonalIconBadge(
                Context ctx,
                int iconId,
                int badgeSizePx,
                int iconSizePx,
                float cornerRadiusPx,
                float strokePx,
                int bgColor,
                int fgColor
        ) {
            super(ctx);
            this.cornerRadiusPx = cornerRadiusPx;
            this.strokePx = strokePx;
            this.drawable = PatchSettingsIcons.create(iconId, iconSizePx, fgColor);

            this.iconView = new ImageView(ctx);
            this.iconView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            this.iconView.setImageDrawable(drawable);
            LayoutParams lp = new LayoutParams(iconSizePx, iconSizePx, Gravity.CENTER);
            addView(iconView, lp);

            setColors(bgColor, fgColor, 0);
            setLayoutParams(new LinearLayout.LayoutParams(badgeSizePx, badgeSizePx));
        }

        void setColors(int bgColor, int fgColor, int borderColor) {
            drawable.setTintColor(fgColor);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.RECTANGLE);
            bg.setCornerRadius(cornerRadiusPx);
            bg.setColor(bgColor);
            if (borderColor != 0) {
                bg.setStroke(Math.max(1, Math.round(strokePx)), borderColor);
            }
            setBackground(bg);
        }

        void setActiveState(boolean active, Palette p) {
            if (active) {
                setColors(
                        blendRgb(p.primaryContainer, p.primary, 0.14f),
                        p.onPrimaryContainer,
                        withAlpha(p.primary, 0x45)
                );
            } else {
                setColors(p.surfaceHighest, p.onSurfaceVar, 0);
            }
        }
    }

    /**
     * Material 3 Expressive 52x32dp switch with spring overshoot travel, progressive inner
     * checkmark when enabled, and horizontal thumb squeeze-stretch on touch down.
     */
    public static final class ExpressiveSwitchView extends View {
        private final Palette palette;
        private final float density;
        private final Paint trackPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint thumbPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint checkPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF trackRect = new RectF();
        private final RectF thumbRect = new RectF();
        private final Path checkPath = new Path();

        private boolean checked;
        private float animFrac;
        private float pressFrac;
        private ValueAnimator toggleAnimator;
        private ValueAnimator pressAnimator;

        public ExpressiveSwitchView(Context ctx, Palette palette, float density, boolean initialChecked) {
            super(ctx);
            this.palette = palette;
            this.density = density;
            this.checked = initialChecked;
            this.animFrac = initialChecked ? 1f : 0f;

            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeWidth(dpf(density, 2.0f));

            checkPaint.setStyle(Paint.Style.STROKE);
            checkPaint.setStrokeCap(Paint.Cap.ROUND);
            checkPaint.setStrokeJoin(Paint.Join.ROUND);
            checkPaint.setStrokeWidth(dpf(density, 2.15f));
        }

        public void setChecked(boolean newChecked, boolean animate) {
            if (this.checked == newChecked && animate) {
                return;
            }
            this.checked = newChecked;
            float target = newChecked ? 1f : 0f;
            if (!animate) {
                this.animFrac = target;
                invalidate();
                return;
            }
            if (toggleAnimator != null) {
                toggleAnimator.cancel();
            }
            toggleAnimator = ValueAnimator.ofFloat(this.animFrac, target);
            toggleAnimator.setDuration(280L);
            toggleAnimator.setInterpolator(new PathInterpolator(0.34f, 1.35f, 0.64f, 1f));
            toggleAnimator.addUpdateListener(a -> {
                animFrac = (float) a.getAnimatedValue();
                invalidate();
            });
            toggleAnimator.start();
        }

        public void setPressedVisual(boolean pressed) {
            float target = pressed ? 1f : 0f;
            if (pressAnimator != null) {
                pressAnimator.cancel();
            }
            pressAnimator = ValueAnimator.ofFloat(this.pressFrac, target);
            pressAnimator.setDuration(130L);
            pressAnimator.setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f));
            pressAnimator.addUpdateListener(a -> {
                pressFrac = (float) a.getAnimatedValue();
                invalidate();
            });
            pressAnimator.start();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            float clampFrac = Math.max(0f, Math.min(1f, animFrac));
            float inset = dpf(density, 1.2f);
            trackRect.set(inset, inset, w - inset, h - inset);
            float trackRadius = (h - inset * 2f) * 0.5f;

            trackPaint.setColor(blendRgb(palette.surfaceHighest, palette.primary, clampFrac));
            canvas.drawRoundRect(trackRect, trackRadius, trackRadius, trackPaint);

            if (clampFrac < 0.98f) {
                int borderAlpha = Math.round(255f * (1f - clampFrac));
                strokePaint.setColor(withAlpha(palette.outline, borderAlpha));
                canvas.drawRoundRect(trackRect, trackRadius, trackRadius, strokePaint);
            }

            float thumbRadiusOff = dpf(density, 8f);
            float thumbRadiusOn = dpf(density, 12f);
            float baseRadius = thumbRadiusOff + (thumbRadiusOn - thumbRadiusOff) * clampFrac;
            float rx = baseRadius + dpf(density, 2.3f) * pressFrac;
            float ry = Math.max(dpf(density, 6f), baseRadius - dpf(density, 0.8f) * pressFrac);

            float minCx = h * 0.5f;
            float maxCx = w - h * 0.5f;
            float cx = minCx + (maxCx - minCx) * animFrac;
            float safeMargin = dpf(density, 3.2f);
            cx = Math.max(safeMargin + rx, Math.min(w - safeMargin - rx, cx));
            float cy = h * 0.5f;

            thumbPaint.setColor(blendRgb(palette.outline, palette.onPrimary, clampFrac));
            thumbRect.set(cx - rx, cy - ry, cx + rx, cy + ry);
            canvas.drawRoundRect(thumbRect, ry, ry, thumbPaint);

            if (clampFrac > 0.35f) {
                float p = (clampFrac - 0.35f) / 0.65f;
                int checkAlpha = Math.round(255f * Math.max(0f, Math.min(1f, p)));
                checkPaint.setColor(withAlpha(palette.primary, checkAlpha));

                float s = dpf(density, 1f) * (0.72f + 0.28f * p);
                float x1 = cx - 4.4f * s;
                float y1 = cy + 0.3f * s;
                float x2 = cx - 1.1f * s;
                float y2 = cy + 3.6f * s;
                float x3 = cx + 4.9f * s;
                float y3 = cy - 3.3f * s;

                checkPath.reset();
                checkPath.moveTo(x1, y1);
                if (p <= 0.45f) {
                    float seg = p / 0.45f;
                    checkPath.lineTo(x1 + (x2 - x1) * seg, y1 + (y2 - y1) * seg);
                } else {
                    float seg = (p - 0.45f) / 0.55f;
                    checkPath.lineTo(x2, y2);
                    checkPath.lineTo(x2 + (x3 - x2) * seg, y2 + (y3 - y2) * seg);
                }
                canvas.drawPath(checkPath, checkPaint);
            }
        }
    }

    /**
     * Connected Material 3 Expressive segmented button group (2–3 choices) with corner morphing
     * and leading checkmark icon on the selected segment. Supports in-place updates.
     */
    static final class ExpressiveSegmentedControl extends LinearLayout {
        private final Palette palette;
        private final float density;
        private final Choice[] choices;
        private final SegmentViews[] segmentViews;
        private int selectedValue;

        private static final class SegmentViews {
            final LinearLayout container;
            final ImageView checkIcon;
            final PatchSettingsIcons.SettingsVectorDrawable checkDrawable;
            final TextView label;

            SegmentViews(
                    LinearLayout container,
                    ImageView checkIcon,
                    PatchSettingsIcons.SettingsVectorDrawable checkDrawable,
                    TextView label
            ) {
                this.container = container;
                this.checkIcon = checkIcon;
                this.checkDrawable = checkDrawable;
                this.label = label;
            }
        }

        ExpressiveSegmentedControl(
                Context ctx,
                Palette palette,
                float density,
                Choice[] choices,
                int initialValue,
                IntSelectionListener listener
        ) {
            super(ctx);
            this.palette = palette;
            this.density = density;
            this.choices = choices;
            this.selectedValue = initialValue;
            this.segmentViews = new SegmentViews[choices.length];

            setOrientation(HORIZONTAL);
            setGravity(Gravity.CENTER_VERTICAL);

            int iconSize = dp(density, 15f);
            for (int i = 0; i < choices.length; i++) {
                final Choice ch = choices[i];
                LinearLayout seg = new LinearLayout(ctx);
                seg.setOrientation(HORIZONTAL);
                seg.setGravity(Gravity.CENTER);
                seg.setMinimumHeight(dp(density, 40f));
                seg.setPadding(dp(density, 8f), dp(density, 7f), dp(density, 8f), dp(density, 7f));

                PatchSettingsIcons.SettingsVectorDrawable checkDr =
                        PatchSettingsIcons.create(PatchSettingsIcons.ICON_CHECK, iconSize, palette.onPrimaryContainer);
                ImageView iv = new ImageView(ctx);
                iv.setImageDrawable(checkDr);
                LayoutParams ivLp = new LayoutParams(iconSize, iconSize);
                ivLp.setMarginEnd(dp(density, 5f));
                seg.addView(iv, ivLp);

                TextView tv = new TextView(ctx);
                tv.setText(ch.label);
                tv.setGravity(Gravity.CENTER);
                tv.setMaxLines(1);
                tv.setEllipsize(TextUtils.TruncateAt.END);
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
                seg.addView(tv);

                LayoutParams segLp = new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                if (i < choices.length - 1) {
                    segLp.setMarginEnd(dp(density, 2f));
                }
                addView(seg, segLp);
                segmentViews[i] = new SegmentViews(seg, iv, checkDr, tv);

                seg.setOnClickListener(v -> {
                    v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                    if (selectedValue != ch.value) {
                        setSelectedValue(ch.value);
                        if (listener != null) {
                            listener.onSelected(ch.value);
                        }
                    }
                });
            }
            applyVisualState();
        }

        void setSelectedValue(int value) {
            this.selectedValue = value;
            applyVisualState();
        }

        private void applyVisualState() {
            float outerR = dpf(density, 18f);
            float innerR = dpf(density, 6f);
            int n = choices.length;
            for (int i = 0; i < n; i++) {
                boolean selected = choices[i].value == selectedValue;
                SegmentViews sv = segmentViews[i];

                float tl = (selected || i == 0) ? outerR : innerR;
                float tr = (selected || i == n - 1) ? outerR : innerR;
                float br = (selected || i == n - 1) ? outerR : innerR;
                float bl = (selected || i == 0) ? outerR : innerR;
                float[] radii = new float[]{tl, tl, tr, tr, br, br, bl, bl};

                GradientDrawable bg = new GradientDrawable();
                bg.setShape(GradientDrawable.RECTANGLE);
                bg.setCornerRadii(radii);
                bg.setColor(selected ? palette.primaryContainer : palette.surfaceHigh);
                sv.container.setBackground(wrapRippleRadii(bg, palette.primary, radii));

                sv.checkIcon.setVisibility(selected ? VISIBLE : GONE);
                sv.checkDrawable.setTintColor(palette.onPrimaryContainer);
                sv.label.setTextColor(selected ? palette.onPrimaryContainer : palette.onSurfaceVar);
                sv.label.setTypeface(Typeface.create("sans-serif-medium", selected ? Typeface.BOLD : Typeface.NORMAL));
            }
        }
    }

    /**
     * Wrapping Material 3 Expressive filter-chip group for 4+ options (e.g. swipe actions),
     * morphing the selected option into a full pill with a leading check icon.
     */
    static final class ExpressiveChipWrapLayout extends ViewGroup {
        private final Palette palette;
        private final float density;
        private final int hGap;
        private final int vGap;
        private final Choice[] choices;
        private final ChipViews[] chipViews;
        private int selectedValue;

        private static final class ChipViews {
            final LinearLayout pill;
            final ImageView checkIcon;
            final PatchSettingsIcons.SettingsVectorDrawable checkDrawable;
            final TextView label;

            ChipViews(
                    LinearLayout pill,
                    ImageView checkIcon,
                    PatchSettingsIcons.SettingsVectorDrawable checkDrawable,
                    TextView label
            ) {
                this.pill = pill;
                this.checkIcon = checkIcon;
                this.checkDrawable = checkDrawable;
                this.label = label;
            }
        }

        ExpressiveChipWrapLayout(
                Context ctx,
                Palette palette,
                float density,
                Choice[] choices,
                int initialValue,
                IntSelectionListener listener
        ) {
            super(ctx);
            this.palette = palette;
            this.density = density;
            this.hGap = dp(density, 6f);
            this.vGap = dp(density, 6f);
            this.choices = choices;
            this.selectedValue = initialValue;
            this.chipViews = new ChipViews[choices.length];

            int iconSize = dp(density, 14f);
            for (int i = 0; i < choices.length; i++) {
                final Choice ch = choices[i];
                LinearLayout pill = new LinearLayout(ctx);
                pill.setOrientation(LinearLayout.HORIZONTAL);
                pill.setGravity(Gravity.CENTER_VERTICAL);
                pill.setPadding(dp(density, 12f), dp(density, 7f), dp(density, 12f), dp(density, 7f));

                PatchSettingsIcons.SettingsVectorDrawable checkDr =
                        PatchSettingsIcons.create(PatchSettingsIcons.ICON_CHECK, iconSize, palette.onPrimaryContainer);
                ImageView iv = new ImageView(ctx);
                iv.setImageDrawable(checkDr);
                LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(iconSize, iconSize);
                ivLp.setMarginEnd(dp(density, 5f));
                pill.addView(iv, ivLp);

                TextView tv = new TextView(ctx);
                tv.setText(ch.label);
                tv.setGravity(Gravity.CENTER);
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
                pill.addView(tv);

                addView(pill);
                chipViews[i] = new ChipViews(pill, iv, checkDr, tv);

                pill.setOnClickListener(v -> {
                    v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                    if (selectedValue != ch.value) {
                        setSelectedValue(ch.value);
                        if (listener != null) {
                            listener.onSelected(ch.value);
                        }
                    }
                });
            }
            applyVisualState();
        }

        void setSelectedValue(int value) {
            this.selectedValue = value;
            applyVisualState();
        }

        private void applyVisualState() {
            float pillR = dpf(density, 18f);
            float rectR = dpf(density, 12f);
            for (int i = 0; i < choices.length; i++) {
                boolean selected = choices[i].value == selectedValue;
                ChipViews cv = chipViews[i];
                float r = selected ? pillR : rectR;
                GradientDrawable bg = new GradientDrawable();
                bg.setShape(GradientDrawable.RECTANGLE);
                bg.setCornerRadius(r);
                bg.setColor(selected ? palette.primaryContainer : palette.surfaceHigh);
                cv.pill.setBackground(wrapRipple(bg, palette.primary, r));
                cv.checkIcon.setVisibility(selected ? VISIBLE : GONE);
                cv.checkDrawable.setTintColor(palette.onPrimaryContainer);
                cv.label.setTextColor(selected ? palette.onPrimaryContainer : palette.onSurfaceVar);
                cv.label.setTypeface(Typeface.create("sans-serif-medium", selected ? Typeface.BOLD : Typeface.NORMAL));
            }
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int maxW = MeasureSpec.getSize(widthMeasureSpec);
            int widthMode = MeasureSpec.getMode(widthMeasureSpec);
            if (widthMode == MeasureSpec.UNSPECIFIED || maxW <= 0) {
                maxW = Integer.MAX_VALUE;
            }

            int x = 0;
            int y = 0;
            int lineH = 0;
            int measuredMaxW = 0;

            int count = getChildCount();
            for (int i = 0; i < count; i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == GONE) {
                    continue;
                }
                measureChild(
                        child,
                        MeasureSpec.makeMeasureSpec(maxW, widthMode == MeasureSpec.UNSPECIFIED ? MeasureSpec.UNSPECIFIED : MeasureSpec.AT_MOST),
                        heightMeasureSpec
                );
                int cw = child.getMeasuredWidth();
                int ch = child.getMeasuredHeight();
                if (x > 0 && x + cw > maxW) {
                    measuredMaxW = Math.max(measuredMaxW, x - hGap);
                    x = 0;
                    y += lineH + vGap;
                    lineH = 0;
                }
                x += cw + hGap;
                lineH = Math.max(lineH, ch);
            }
            measuredMaxW = Math.max(measuredMaxW, Math.max(0, x - hGap));
            int totalH = y + lineH;
            setMeasuredDimension(
                    widthMode == MeasureSpec.EXACTLY ? maxW : measuredMaxW,
                    resolveSize(totalH, heightMeasureSpec)
            );
        }

        @Override
        protected void onLayout(boolean changed, int l, int t, int r, int b) {
            int maxW = r - l;
            int x = 0;
            int y = 0;
            int lineH = 0;
            int count = getChildCount();
            for (int i = 0; i < count; i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == GONE) {
                    continue;
                }
                int cw = child.getMeasuredWidth();
                int ch = child.getMeasuredHeight();
                if (x > 0 && x + cw > maxW) {
                    x = 0;
                    y += lineH + vGap;
                    lineH = 0;
                }
                child.layout(x, y, x + cw, y + ch);
                x += cw + hGap;
                lineH = Math.max(lineH, ch);
            }
        }
    }

    /**
     * Material 3 Expressive thick-track slider with discrete vertical pill thumb, track gap,
     * end stop-indicator dot, and haptic step feedback.
     */
    public static final class ExpressiveSliderView extends View {
        public interface OnValueChangeListener {
            void onChanged(int value, boolean fromUser);
        }

        private final Palette palette;
        private final float density;
        private final int minVal;
        private final int maxVal;
        private final int step;
        private final OnValueChangeListener listener;

        private final Paint trackPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint activePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint thumbPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint stopDotPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF trackRect = new RectF();
        private final RectF thumbRect = new RectF();

        private int value;
        private boolean dragging;

        public ExpressiveSliderView(
                Context ctx,
                Palette palette,
                float density,
                int minVal,
                int maxVal,
                int step,
                int initialValue,
                OnValueChangeListener listener
        ) {
            super(ctx);
            this.palette = palette;
            this.density = density;
            this.minVal = minVal;
            this.maxVal = maxVal;
            this.step = Math.max(1, step);
            this.value = snapValue(initialValue);
            this.listener = listener;
        }

        public void setValue(int newValue, boolean notify) {
            int snapped = snapValue(newValue);
            if (snapped != this.value) {
                this.value = snapped;
                invalidate();
                if (notify && listener != null) {
                    listener.onChanged(snapped, false);
                }
            }
        }

        private int snapValue(int raw) {
            int clamped = Math.max(minVal, Math.min(maxVal, raw));
            int steps = Math.round((clamped - minVal) / (float) step);
            return Math.max(minVal, Math.min(maxVal, minVal + steps * step));
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            switch (action) {
                case MotionEvent.ACTION_DOWN:
                    dragging = true;
                    if (getParent() != null) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
                    updateFromX(event.getX(), true);
                    return true;
                case MotionEvent.ACTION_MOVE:
                    if (dragging) {
                        updateFromX(event.getX(), false);
                    }
                    return true;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    if (dragging) {
                        dragging = false;
                        if (getParent() != null) {
                            getParent().requestDisallowInterceptTouchEvent(false);
                        }
                        invalidate();
                    }
                    return true;
            }
            return super.onTouchEvent(event);
        }

        private void updateFromX(float x, boolean initialTap) {
            float pad = dpf(density, 10f);
            float usable = Math.max(1f, getWidth() - pad * 2f);
            float frac = Math.max(0f, Math.min(1f, (x - pad) / usable));
            int raw = Math.round(minVal + frac * (maxVal - minVal));
            int snapped = snapValue(raw);
            if (snapped != this.value) {
                this.value = snapped;
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                if (listener != null) {
                    listener.onChanged(snapped, true);
                }
            } else if (initialTap) {
                performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            }
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            float pad = dpf(density, 10f);
            float trackH = dpf(density, 16f);
            float cy = h * 0.5f;
            float left = pad;
            float right = w - pad;
            float usable = Math.max(1f, right - left);
            float frac = (value - minVal) / (float) Math.max(1, maxVal - minVal);
            float thumbX = left + frac * usable;

            float halfGap = dpf(density, 6f);
            float thumbW = dpf(density, dragging ? 5.5f : 4f);
            float thumbH = dpf(density, dragging ? 36f : 32f);

            float inactiveLeft = Math.min(right, thumbX + halfGap);
            if (right - inactiveLeft > 2f) {
                trackPaint.setColor(palette.surfaceHighest);
                trackRect.set(inactiveLeft, cy - trackH * 0.5f, right, cy + trackH * 0.5f);
                canvas.drawRoundRect(trackRect, trackH * 0.5f, trackH * 0.5f, trackPaint);

                float dotX = right - trackH * 0.45f;
                if (dotX > inactiveLeft + dpf(density, 4f)) {
                    stopDotPaint.setColor(withAlpha(palette.primary, 0x95));
                    canvas.drawCircle(dotX, cy, dpf(density, 2.2f), stopDotPaint);
                }
            }

            float activeRight = Math.max(left, thumbX - halfGap);
            if (activeRight - left > 2f) {
                activePaint.setColor(palette.primary);
                trackRect.set(left, cy - trackH * 0.5f, activeRight, cy + trackH * 0.5f);
                canvas.drawRoundRect(trackRect, trackH * 0.5f, trackH * 0.5f, activePaint);
            }

            thumbPaint.setColor(palette.primary);
            thumbRect.set(
                    thumbX - thumbW * 0.5f,
                    cy - thumbH * 0.5f,
                    thumbX + thumbW * 0.5f,
                    cy + thumbH * 0.5f
            );
            canvas.drawRoundRect(thumbRect, thumbW * 0.5f, thumbW * 0.5f, thumbPaint);
        }
    }

    /**
     * Styles a card inside a grouped settings list with flat surfaces (zero strokes, zero shadows)
     * and Android 16 / M3 Expressive corner radii (outer edges 20dp, adjacent inner edges 4dp).
     */
    public static void applyGroupedCardBg(
            View view,
            int index,
            int total,
            Palette palette,
            float density,
            boolean clickable,
            boolean highlighted
    ) {
        float outerR = dpf(density, 20f);
        float innerR = dpf(density, 4f);
        float topR = (total <= 1 || index == 0) ? outerR : innerR;
        float bottomR = (total <= 1 || index == total - 1) ? outerR : innerR;
        float[] radii = new float[]{topR, topR, topR, topR, bottomR, bottomR, bottomR, bottomR};

        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setCornerRadii(radii);
        bg.setColor(palette.surfaceContainer);
        view.setElevation(0f);
        view.setBackground(clickable ? wrapRippleRadii(bg, palette.primary, radii) : bg);
    }

    public static GradientDrawable createRoundedDrawable(int fillColor, int strokeColor, float radiusPx, float strokePx) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.RECTANGLE);
        d.setCornerRadius(radiusPx);
        d.setColor(fillColor);
        if (strokeColor != 0) {
            d.setStroke(Math.max(1, Math.round(strokePx)), strokeColor);
        }
        return d;
    }

    public static RippleDrawable wrapRipple(Drawable content, int accentColor, float cornerRadiusPx) {
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(cornerRadiusPx);
        mask.setColor(0xFFFFFFFF);
        return new RippleDrawable(ColorStateList.valueOf(withAlpha(accentColor, 0x30)), content, mask);
    }

    public static RippleDrawable wrapRippleRadii(Drawable content, int accentColor, float[] radii) {
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadii(radii);
        mask.setColor(0xFFFFFFFF);
        return new RippleDrawable(ColorStateList.valueOf(withAlpha(accentColor, 0x30)), content, mask);
    }

    public static int dp(float density, float dp) {
        return Math.round(dp * density);
    }

    public static float dpf(float density, float dp) {
        return dp * density;
    }

    public static int withAlpha(int argb, int alpha) {
        return (argb & 0x00FFFFFF) | ((alpha & 0xFF) << 24);
    }

    public static int blendRgb(int c1, int c2, float ratio) {
        float t = Math.max(0f, Math.min(1f, ratio));
        int a1 = (c1 >>> 24) & 0xFF;
        int r1 = (c1 >>> 16) & 0xFF;
        int g1 = (c1 >>> 8) & 0xFF;
        int b1 = c1 & 0xFF;
        int a2 = (c2 >>> 24) & 0xFF;
        int r2 = (c2 >>> 16) & 0xFF;
        int g2 = (c2 >>> 8) & 0xFF;
        int b2 = c2 & 0xFF;
        int a = Math.round(a1 + (a2 - a1) * t);
        int r = Math.round(r1 + (r2 - r1) * t);
        int g = Math.round(g1 + (g2 - g1) * t);
        int b = Math.round(b1 + (b2 - b1) * t);
        return (a << 24) | (r << 16) | (g << 8) | b;
    }
}
