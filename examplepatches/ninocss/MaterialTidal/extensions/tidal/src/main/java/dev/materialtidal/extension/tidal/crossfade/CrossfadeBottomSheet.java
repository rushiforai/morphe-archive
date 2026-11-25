package dev.materialtidal.extension.tidal.crossfade;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

import dev.materialtidal.extension.tidal.settings.PatchSettingsIcons;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.ExpressiveSliderView;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.ExpressiveSwitchView;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.Palette;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;

import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.applyGroupedCardBg;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.dp;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.dpf;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.withAlpha;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.wrapRipple;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.wrapRippleRadii;

/**
 * Full-screen Instagram-style Material 3 Expressive Crossfade settings screen accessible from
 * Settings -> Audio & Playback, MaterialTidal Settings, and the Now Playing Player context menu.
 * Follows the same clean flat hierarchy as {@code PatchSettingsBottomSheet}: zero drop shadows,
 * zero gradients, zero outline strokes, quiet section headers, and expressive sliders & switches.
 */
@SuppressWarnings("unused")
public final class CrossfadeBottomSheet {

    private static final int[] DURATION_PRESETS = new int[]{0, 3, 5, 8, 12};
    private static final int[] CURVE_ORDER = new int[]{
            CrossfadeConfig.CURVE_EQUAL_POWER,
            CrossfadeConfig.CURVE_SMOOTH_S,
            CrossfadeConfig.CURVE_SOFT_DIP,
            CrossfadeConfig.CURVE_DJ_BLEND,
    };

    private static WeakReference<Dialog> activeDialogRef = new WeakReference<>(null);

    private CrossfadeBottomSheet() {
    }

    private static final class ScreenController {
        final Dialog dialog;
        final Palette palette;
        final float density;
        final boolean de;

        int durationSeconds;
        int lastNonZeroDuration;
        int curveType;
        int strengthPercent;
        boolean preserveGapless;

        FrameLayout resetBtn;
        CrossfadeCurveView curveView;
        PatchSettingsIcons.SettingsVectorDrawable masterIconDrawable;
        ExpressiveSwitchView masterSwitch;
        TextView durationValueView;
        ExpressiveSliderView durationSlider;
        final TextView[] presetPills = new TextView[DURATION_PRESETS.length];

        LinearLayout curveGroupContainer;
        final LinearLayout[] curveCards = new LinearLayout[CURVE_ORDER.length];
        final MiniCurveIconView[] curveMiniIcons = new MiniCurveIconView[CURVE_ORDER.length];
        final TextView[] curveTitles = new TextView[CURVE_ORDER.length];
        final TextView[] curveSubtitles = new TextView[CURVE_ORDER.length];
        final ImageView[] curveChecks = new ImageView[CURVE_ORDER.length];

        LinearLayout fineGroupContainer;
        TextView strengthValueView;
        ExpressiveSliderView strengthSlider;
        PatchSettingsIcons.SettingsVectorDrawable gaplessIconDrawable;
        ExpressiveSwitchView gaplessSwitch;

        ScreenController(Dialog dialog, Palette palette, float density) {
            this.dialog = dialog;
            this.palette = palette;
            this.density = density;
            this.de = CrossfadeEngine.isGermanLocale();
            this.durationSeconds = CrossfadeTidalBridge.readDurationSeconds();
            int defSec = CrossfadeConfig.getDefaultDurationSeconds();
            this.lastNonZeroDuration = this.durationSeconds > 0
                    ? this.durationSeconds
                    : (defSec > 0 ? defSec : 5);
            this.curveType = CrossfadePrefs.getCurveType();
            this.strengthPercent = CrossfadePrefs.getStrengthPercent();
            this.preserveGapless = CrossfadePrefs.isPreserveGaplessAlbums();
        }

        void onMasterToggled(boolean enable) {
            int next = enable ? (lastNonZeroDuration > 0 ? lastNonZeroDuration : 5) : 0;
            onDurationChanged(next, false);
        }

        void onDurationChanged(int seconds, boolean fromSlider) {
            int clamped = Math.max(
                    CrossfadeConfig.MIN_DURATION_SECONDS,
                    Math.min(CrossfadeConfig.MAX_DURATION_SECONDS, seconds)
            );
            if (clamped > 0) {
                lastNonZeroDuration = clamped;
            }
            if (this.durationSeconds != clamped) {
                this.durationSeconds = clamped;
                CrossfadeTidalBridge.writeDurationSeconds(clamped);
            }
            if (!fromSlider && durationSlider != null) {
                durationSlider.setValue(clamped, false);
            }
            if (masterSwitch != null) {
                masterSwitch.setChecked(clamped > 0, true);
            }
            syncUiState();
        }

        void onCurveSelected(int curve) {
            int clamped = CrossfadePrefs.clampCurve(curve);
            if (this.curveType != clamped) {
                this.curveType = clamped;
                CrossfadePrefs.setCurveType(clamped);
            }
            syncUiState();
        }

        void onStrengthChanged(int strength, boolean fromSlider) {
            int clamped = CrossfadePrefs.clampStrength(strength);
            if (this.strengthPercent != clamped) {
                this.strengthPercent = clamped;
                CrossfadePrefs.setStrengthPercent(clamped);
            }
            if (!fromSlider && strengthSlider != null) {
                strengthSlider.setValue(clamped, false);
            }
            syncUiState();
        }

        void onGaplessToggled(boolean preserve) {
            if (this.preserveGapless != preserve) {
                this.preserveGapless = preserve;
                CrossfadePrefs.setPreserveGaplessAlbums(preserve);
                CrossfadeTidalBridge.retriggerPlaybackCrossfade();
            }
            if (gaplessSwitch != null) {
                gaplessSwitch.setChecked(preserve, true);
            }
            syncUiState();
        }

        void resetToDefaults() {
            int defDur = CrossfadeConfig.getDefaultDurationSeconds();
            int defCurve = CrossfadePrefs.clampCurve(CrossfadeConfig.getDefaultCurveType());
            int defStr = CrossfadePrefs.clampStrength(CrossfadeConfig.getDefaultStrengthPercent());
            boolean defGapless = CrossfadeConfig.isDefaultPreserveGaplessAlbums();

            if (defDur > 0) {
                lastNonZeroDuration = defDur;
            }
            this.durationSeconds = defDur;
            this.curveType = defCurve;
            this.strengthPercent = defStr;
            this.preserveGapless = defGapless;

            CrossfadeTidalBridge.writeDurationSeconds(defDur);
            CrossfadePrefs.setCurveType(defCurve);
            CrossfadePrefs.setStrengthPercent(defStr);
            CrossfadePrefs.setPreserveGaplessAlbums(defGapless);
            CrossfadeTidalBridge.retriggerPlaybackCrossfade();

            if (masterSwitch != null) {
                masterSwitch.setChecked(defDur > 0, true);
            }
            if (durationSlider != null) {
                durationSlider.setValue(defDur, false);
            }
            if (strengthSlider != null) {
                strengthSlider.setValue(defStr, false);
            }
            if (gaplessSwitch != null) {
                gaplessSwitch.setChecked(defGapless, true);
            }
            syncUiState();
        }

        boolean isModifiedFromDefaults() {
            return durationSeconds != CrossfadeConfig.getDefaultDurationSeconds()
                    || curveType != CrossfadePrefs.clampCurve(CrossfadeConfig.getDefaultCurveType())
                    || strengthPercent != CrossfadePrefs.clampStrength(CrossfadeConfig.getDefaultStrengthPercent())
                    || preserveGapless != CrossfadeConfig.isDefaultPreserveGaplessAlbums();
        }

        void syncUiState() {
            boolean active = durationSeconds > 0;
            String durLabel = active ? (durationSeconds + " s") : (de ? "Aus" : "Off");

            if (resetBtn != null) {
                resetBtn.setVisibility(isModifiedFromDefaults() ? View.VISIBLE : View.GONE);
            }
            if (masterIconDrawable != null) {
                masterIconDrawable.setTintColor(active ? palette.primary : palette.onSurfaceVar);
            }
            if (gaplessIconDrawable != null) {
                gaplessIconDrawable.setTintColor(preserveGapless ? palette.primary : palette.onSurfaceVar);
            }
            if (durationValueView != null) {
                durationValueView.setText(durLabel);
                durationValueView.setTextColor(active ? palette.primary : palette.onSurfaceVar);
            }

            // Connected flat presets (18dp outer / 6dp inner morphing to 18dp pill when selected)
            float outerR = dpf(density, 18f);
            float innerR = dpf(density, 6f);
            int pn = DURATION_PRESETS.length;
            for (int i = 0; i < pn; i++) {
                TextView pill = presetPills[i];
                if (pill == null) {
                    continue;
                }
                boolean selected = durationSeconds == DURATION_PRESETS[i];
                float tl = (selected || i == 0) ? outerR : innerR;
                float tr = (selected || i == pn - 1) ? outerR : innerR;
                float br = (selected || i == pn - 1) ? outerR : innerR;
                float bl = (selected || i == 0) ? outerR : innerR;
                float[] radii = new float[]{tl, tl, tr, tr, br, br, bl, bl};

                GradientDrawable bg = new GradientDrawable();
                bg.setShape(GradientDrawable.RECTANGLE);
                bg.setCornerRadii(radii);
                bg.setColor(selected ? palette.primaryContainer : palette.surfaceHigh);
                pill.setBackground(wrapRippleRadii(bg, palette.primary, radii));
                pill.setTextColor(selected ? palette.onPrimaryContainer : palette.onSurfaceVar);
                pill.setTypeface(Typeface.create("sans-serif-medium", selected ? Typeface.BOLD : Typeface.NORMAL));
            }

            // Selectable grouped curve rows (flat surfaceContainer / surfaceHigh, zero borders)
            float rowOuterR = dpf(density, 20f);
            float rowInnerR = dpf(density, 4f);
            int cn = CURVE_ORDER.length;
            for (int i = 0; i < cn; i++) {
                LinearLayout card = curveCards[i];
                if (card == null) {
                    continue;
                }
                boolean selected = curveType == CURVE_ORDER[i];
                float topR = (i == 0) ? rowOuterR : rowInnerR;
                float botR = (i == cn - 1) ? rowOuterR : rowInnerR;
                float[] radii = new float[]{topR, topR, topR, topR, botR, botR, botR, botR};

                GradientDrawable bg = new GradientDrawable();
                bg.setShape(GradientDrawable.RECTANGLE);
                bg.setCornerRadii(radii);
                bg.setColor(selected ? palette.surfaceHigh : palette.surfaceContainer);
                card.setElevation(0f);
                card.setBackground(wrapRippleRadii(bg, palette.primary, radii));

                if (curveMiniIcons[i] != null) {
                    curveMiniIcons[i].setSelectedState(selected);
                }
                if (curveTitles[i] != null) {
                    curveTitles[i].setTextColor(palette.onSurface);
                    curveTitles[i].setTypeface(Typeface.create("sans-serif-medium", selected ? Typeface.BOLD : Typeface.NORMAL));
                }
                if (curveSubtitles[i] != null) {
                    curveSubtitles[i].setTextColor(palette.onSurfaceVar);
                }
                if (curveChecks[i] != null) {
                    curveChecks[i].setVisibility(selected ? View.VISIBLE : View.INVISIBLE);
                }
            }

            if (strengthValueView != null) {
                strengthValueView.setText(strengthPercent + "% · " + CrossfadeEngine.getStrengthDescriptor(strengthPercent));
                strengthValueView.setTextColor(palette.onSurfaceVar);
            }

            if (curveGroupContainer != null) {
                curveGroupContainer.setAlpha(active ? 1f : 0.48f);
            }
            if (fineGroupContainer != null) {
                fineGroupContainer.setAlpha(active ? 1f : 0.48f);
            }

            if (curveView != null) {
                curveView.setCurveParams(durationSeconds, curveType, strengthPercent);
            }
        }
    }

    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        CrossfadePrefs.ensureInitialized(activity);

        Dialog existing = activeDialogRef.get();
        if (existing != null && existing.isShowing()) {
            try {
                existing.dismiss();
            } catch (Throwable ignored) {
            }
        }

        final FrameLayout[] rootHolder = new FrameLayout[1];
        final Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar) {
            @Override
            public void onBackPressed() {
                animateScreenDismiss(this, rootHolder[0]);
            }
        };
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCanceledOnTouchOutside(false);

        Context ctx = dialog.getContext();
        float density = ctx.getResources().getDisplayMetrics().density;
        Palette palette = new Palette(ctx);
        final ScreenController ctrl = new ScreenController(dialog, palette, density);

        FrameLayout rootContainer = new FrameLayout(ctx);
        rootContainer.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        rootContainer.setBackgroundColor(palette.surfaceBase);
        rootContainer.setElevation(0f);
        rootContainer.setOutlineProvider(null);
        rootContainer.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));
        rootHolder[0] = rootContainer;

        LinearLayout mainColumn = new LinearLayout(ctx);
        mainColumn.setOrientation(LinearLayout.VERTICAL);
        mainColumn.setElevation(0f);
        mainColumn.setOutlineProvider(null);
        mainColumn.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));

        final int padH = dp(density, 16f);

        // Minimal Instagram-style flat Top App Bar (zero drop shadow, zero divider)
        LinearLayout topBar = new LinearLayout(ctx);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        topBar.setBackgroundColor(palette.surfaceBase);
        topBar.setElevation(0f);
        topBar.setOutlineProvider(null);
        topBar.setPadding(dp(density, 8f), dp(density, 8f), dp(density, 8f), dp(density, 6f));

        FrameLayout backBtn = new FrameLayout(ctx);
        ImageView backIv = new ImageView(ctx);
        backIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        backIv.setImageDrawable(PatchSettingsIcons.create(PatchSettingsIcons.ICON_BACK, dp(density, 22f), palette.onSurface));
        backBtn.addView(backIv, new FrameLayout.LayoutParams(dp(density, 22f), dp(density, 22f), Gravity.CENTER));
        backBtn.setBackground(wrapRipple(new ColorDrawable(Color.TRANSPARENT), palette.onSurface, dpf(density, 22f)));
        backBtn.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            animateScreenDismiss(dialog, rootContainer);
        });
        LinearLayout.LayoutParams backLp = new LinearLayout.LayoutParams(dp(density, 44f), dp(density, 44f));
        backLp.setMarginEnd(dp(density, 6f));
        topBar.addView(backBtn, backLp);

        TextView titleTv = new TextView(ctx);
        titleTv.setText("Crossfade");
        titleTv.setTextColor(palette.onSurface);
        titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19.5f);
        titleTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        titleTv.setMaxLines(1);
        titleTv.setEllipsize(TextUtils.TruncateAt.END);
        topBar.addView(titleTv, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        FrameLayout resetBtn = new FrameLayout(ctx);
        ImageView resetIv = new ImageView(ctx);
        resetIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        resetIv.setImageDrawable(PatchSettingsIcons.create(PatchSettingsIcons.ICON_RESET, dp(density, 20f), palette.onSurfaceVar));
        resetBtn.addView(resetIv, new FrameLayout.LayoutParams(dp(density, 20f), dp(density, 20f), Gravity.CENTER));
        resetBtn.setBackground(wrapRipple(new ColorDrawable(Color.TRANSPARENT), palette.onSurface, dpf(density, 22f)));
        resetBtn.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            ctrl.resetToDefaults();
        });
        ctrl.resetBtn = resetBtn;
        topBar.addView(resetBtn, new LinearLayout.LayoutParams(dp(density, 44f), dp(density, 44f)));

        mainColumn.addView(topBar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        // Clean ScrollView without edge fade shadows or overscroll glow
        int screenW = ctx.getResources().getDisplayMetrics().widthPixels;
        int maxContentWidth = Math.min(screenW, dp(density, 680f));

        ScrollView scrollView = new ScrollView(ctx);
        scrollView.setVerticalScrollBarEnabled(false);
        scrollView.setVerticalFadingEdgeEnabled(false);
        scrollView.setOverScrollMode(View.OVER_SCROLL_NEVER);

        final LinearLayout content = new LinearLayout(ctx);
        content.setOrientation(LinearLayout.VERTICAL);
        final int basePadTop = dp(density, 4f);
        final int basePadBottom = dp(density, 28f);
        content.setPadding(padH, basePadTop, padH, basePadBottom);

        // 1. Live Curve Visualizer (pure flat card, zero gradients, zero border)
        CrossfadeCurveView curveView = new CrossfadeCurveView(ctx, palette, density);
        LinearLayout.LayoutParams curveLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(density, 128f)
        );
        curveLp.bottomMargin = dp(density, 16f);
        ctrl.curveView = curveView;
        content.addView(curveView, curveLp);

        // 2. Section: Dauer / Duration (grouped flat cards)
        addSectionHeader(content, ctrl.de ? "Dauer" : "Duration", palette, density);
        List<View> durationRows = new ArrayList<>();

        // Row 2a: Master Enable Toggle
        LinearLayout masterRow = new LinearLayout(ctx);
        masterRow.setOrientation(LinearLayout.HORIZONTAL);
        masterRow.setGravity(Gravity.CENTER_VERTICAL);
        masterRow.setClickable(true);
        masterRow.setFocusable(true);
        masterRow.setPadding(dp(density, 16f), dp(density, 13f), dp(density, 15f), dp(density, 13f));

        int iconSize = dp(density, 22f);
        ctrl.masterIconDrawable = PatchSettingsIcons.create(
                PatchSettingsIcons.ICON_CROSSFADE,
                iconSize,
                ctrl.durationSeconds > 0 ? palette.primary : palette.onSurfaceVar
        );
        ImageView masterIv = new ImageView(ctx);
        masterIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        masterIv.setImageDrawable(ctrl.masterIconDrawable);
        LinearLayout.LayoutParams mIvLp = new LinearLayout.LayoutParams(iconSize, iconSize);
        mIvLp.setMarginEnd(dp(density, 14f));
        masterRow.addView(masterIv, mIvLp);

        LinearLayout masterTextCol = new LinearLayout(ctx);
        masterTextCol.setOrientation(LinearLayout.VERTICAL);
        TextView masterTitle = new TextView(ctx);
        masterTitle.setText(ctrl.de ? "Crossfade aktivieren" : "Enable Crossfade");
        masterTitle.setTextColor(palette.onSurface);
        masterTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        masterTextCol.addView(masterTitle);

        TextView masterSub = new TextView(ctx);
        masterSub.setText(ctrl.de
                ? "Blendet aufeinanderfolgende Tracks nahtlos über"
                : "Blends consecutive tracks smoothly into one another");
        masterSub.setTextColor(palette.onSurfaceVar);
        masterSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
        masterSub.setPadding(0, dp(density, 2f), dp(density, 8f), 0);
        masterTextCol.addView(masterSub);
        masterRow.addView(masterTextCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final ExpressiveSwitchView masterSwitch = new ExpressiveSwitchView(ctx, palette, density, ctrl.durationSeconds > 0);
        masterSwitch.setClickable(false);
        ctrl.masterSwitch = masterSwitch;
        LinearLayout.LayoutParams mSwLp = new LinearLayout.LayoutParams(dp(density, 52f), dp(density, 32f));
        mSwLp.setMarginStart(dp(density, 8f));
        masterRow.addView(masterSwitch, mSwLp);

        masterRow.setOnTouchListener((v, ev) -> {
            switch (ev.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    masterSwitch.setPressedVisual(true);
                    break;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    masterSwitch.setPressedVisual(false);
                    break;
            }
            return false;
        });
        masterRow.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            ctrl.onMasterToggled(ctrl.durationSeconds <= 0);
        });
        durationRows.add(masterRow);

        // Row 2b: Duration slider + connected preset pills
        LinearLayout durSliderRow = new LinearLayout(ctx);
        durSliderRow.setOrientation(LinearLayout.VERTICAL);
        durSliderRow.setClickable(false);
        durSliderRow.setPadding(dp(density, 16f), dp(density, 13f), dp(density, 16f), dp(density, 14f));

        LinearLayout durHead = new LinearLayout(ctx);
        durHead.setOrientation(LinearLayout.HORIZONTAL);
        durHead.setGravity(Gravity.CENTER_VERTICAL);

        ImageView durIv = new ImageView(ctx);
        durIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        durIv.setImageDrawable(PatchSettingsIcons.create(PatchSettingsIcons.ICON_SLIDER, iconSize, palette.onSurfaceVar));
        LinearLayout.LayoutParams dIvLp = new LinearLayout.LayoutParams(iconSize, iconSize);
        dIvLp.setMarginEnd(dp(density, 14f));
        durHead.addView(durIv, dIvLp);

        TextView durTitle = new TextView(ctx);
        durTitle.setText(ctrl.de ? "Übergangsdauer" : "Crossfade duration");
        durTitle.setTextColor(palette.onSurface);
        durTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        durHead.addView(durTitle, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView durVal = new TextView(ctx);
        durVal.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        durVal.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        ctrl.durationValueView = durVal;
        durHead.addView(durVal);
        durSliderRow.addView(durHead);

        ExpressiveSliderView durationSlider = new ExpressiveSliderView(
                ctx,
                palette,
                density,
                CrossfadeConfig.MIN_DURATION_SECONDS,
                CrossfadeConfig.MAX_DURATION_SECONDS,
                1,
                ctrl.durationSeconds,
                (value, fromUser) -> ctrl.onDurationChanged(value, true)
        );
        LinearLayout.LayoutParams durSliderLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(density, 42f)
        );
        durSliderLp.topMargin = dp(density, 8f);
        ctrl.durationSlider = durationSlider;
        durSliderRow.addView(durationSlider, durSliderLp);

        LinearLayout presetRow = new LinearLayout(ctx);
        presetRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams presetRowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        presetRowLp.topMargin = dp(density, 8f);
        for (int i = 0; i < DURATION_PRESETS.length; i++) {
            final int presetSec = DURATION_PRESETS[i];
            TextView pill = new TextView(ctx);
            pill.setText(presetSec <= 0 ? (ctrl.de ? "Aus" : "Off") : (presetSec + " s"));
            pill.setGravity(Gravity.CENTER);
            pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
            pill.setMinimumHeight(dp(density, 38f));
            pill.setPadding(dp(density, 4f), dp(density, 7f), dp(density, 4f), dp(density, 7f));
            pill.setOnClickListener(v -> {
                v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                ctrl.onDurationChanged(presetSec, false);
            });
            ctrl.presetPills[i] = pill;
            LinearLayout.LayoutParams pillLp = new LinearLayout.LayoutParams(
                    0,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    1f
            );
            if (i < DURATION_PRESETS.length - 1) {
                pillLp.setMarginEnd(dp(density, 2f));
            }
            presetRow.addView(pill, pillLp);
        }
        durSliderRow.addView(presetRow, presetRowLp);
        durationRows.add(durSliderRow);
        addGroupedSection(content, durationRows, palette, density);

        // 3. Section: Übergangskurve / Transition Curve (4-row selectable grouped list)
        LinearLayout curveGroupHolder = new LinearLayout(ctx);
        curveGroupHolder.setOrientation(LinearLayout.VERTICAL);
        ctrl.curveGroupContainer = curveGroupHolder;
        addSectionHeader(curveGroupHolder, ctrl.de ? "Übergangskurve" : "Transition curve", palette, density);

        int checkSize = dp(density, 18f);
        for (int i = 0; i < CURVE_ORDER.length; i++) {
            final int curveId = CURVE_ORDER[i];

            LinearLayout card = new LinearLayout(ctx);
            card.setOrientation(LinearLayout.HORIZONTAL);
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setPadding(dp(density, 16f), dp(density, 13f), dp(density, 16f), dp(density, 13f));
            card.setOnClickListener(v -> {
                v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                ctrl.onCurveSelected(curveId);
            });

            MiniCurveIconView miniCurve = new MiniCurveIconView(ctx, palette, density, curveId);
            LinearLayout.LayoutParams mcLp = new LinearLayout.LayoutParams(dp(density, 28f), dp(density, 18f));
            mcLp.setMarginEnd(dp(density, 14f));
            card.addView(miniCurve, mcLp);

            LinearLayout cTextCol = new LinearLayout(ctx);
            cTextCol.setOrientation(LinearLayout.VERTICAL);

            TextView cTitle = new TextView(ctx);
            cTitle.setText(CrossfadeEngine.getCurveDisplayName(curveId));
            cTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            cTitle.setMaxLines(1);
            cTitle.setEllipsize(TextUtils.TruncateAt.END);
            cTextCol.addView(cTitle);

            TextView cSub = new TextView(ctx);
            cSub.setText(CrossfadeEngine.getCurveShortSubtitle(curveId));
            cSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
            cSub.setMaxLines(1);
            cSub.setEllipsize(TextUtils.TruncateAt.END);
            cSub.setPadding(0, dp(density, 1.5f), dp(density, 8f), 0);
            cTextCol.addView(cSub);

            card.addView(cTextCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            ImageView checkIv = new ImageView(ctx);
            checkIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            checkIv.setImageDrawable(PatchSettingsIcons.create(PatchSettingsIcons.ICON_CHECK, checkSize, palette.primary));
            card.addView(checkIv, new LinearLayout.LayoutParams(checkSize, checkSize));

            ctrl.curveCards[i] = card;
            ctrl.curveMiniIcons[i] = miniCurve;
            ctrl.curveTitles[i] = cTitle;
            ctrl.curveSubtitles[i] = cSub;
            ctrl.curveChecks[i] = checkIv;

            LinearLayout.LayoutParams cellLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            cellLp.bottomMargin = (i == CURVE_ORDER.length - 1) ? dp(density, 14f) : dp(density, 2f);
            curveGroupHolder.addView(card, cellLp);
        }
        content.addView(curveGroupHolder);

        // 4. Section: Feinabstimmung / Fine-tuning (Strength + Gapless albums toggle)
        LinearLayout fineGroupHolder = new LinearLayout(ctx);
        fineGroupHolder.setOrientation(LinearLayout.VERTICAL);
        ctrl.fineGroupContainer = fineGroupHolder;
        addSectionHeader(fineGroupHolder, ctrl.de ? "Feinabstimmung" : "Fine-tuning", palette, density);

        List<View> fineRows = new ArrayList<>();

        // Row 4a: Blend intensity slider
        LinearLayout strRow = new LinearLayout(ctx);
        strRow.setOrientation(LinearLayout.VERTICAL);
        strRow.setClickable(false);
        strRow.setPadding(dp(density, 16f), dp(density, 13f), dp(density, 16f), dp(density, 13f));

        LinearLayout strHead = new LinearLayout(ctx);
        strHead.setOrientation(LinearLayout.HORIZONTAL);
        strHead.setGravity(Gravity.CENTER_VERTICAL);

        ImageView strIv = new ImageView(ctx);
        strIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        strIv.setImageDrawable(PatchSettingsIcons.create(PatchSettingsIcons.ICON_PULSE, iconSize, palette.onSurfaceVar));
        LinearLayout.LayoutParams sIvLp = new LinearLayout.LayoutParams(iconSize, iconSize);
        sIvLp.setMarginEnd(dp(density, 14f));
        strHead.addView(strIv, sIvLp);

        TextView strTitle = new TextView(ctx);
        strTitle.setText(ctrl.de ? "Übergangsstärke" : "Blend intensity");
        strTitle.setTextColor(palette.onSurface);
        strTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        strHead.addView(strTitle, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView strVal = new TextView(ctx);
        strVal.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        strVal.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        ctrl.strengthValueView = strVal;
        strHead.addView(strVal);
        strRow.addView(strHead);

        ExpressiveSliderView strengthSlider = new ExpressiveSliderView(
                ctx,
                palette,
                density,
                0,
                100,
                5,
                ctrl.strengthPercent,
                (value, fromUser) -> ctrl.onStrengthChanged(value, true)
        );
        LinearLayout.LayoutParams strSliderLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(density, 42f)
        );
        strSliderLp.topMargin = dp(density, 8f);
        ctrl.strengthSlider = strengthSlider;
        strRow.addView(strengthSlider, strSliderLp);
        fineRows.add(strRow);

        // Row 4b: Keep albums gapless toggle
        LinearLayout gaplessRow = new LinearLayout(ctx);
        gaplessRow.setOrientation(LinearLayout.HORIZONTAL);
        gaplessRow.setGravity(Gravity.CENTER_VERTICAL);
        gaplessRow.setClickable(true);
        gaplessRow.setFocusable(true);
        gaplessRow.setPadding(dp(density, 16f), dp(density, 13f), dp(density, 15f), dp(density, 13f));

        ctrl.gaplessIconDrawable = PatchSettingsIcons.create(
                PatchSettingsIcons.ICON_MEDIA,
                iconSize,
                ctrl.preserveGapless ? palette.primary : palette.onSurfaceVar
        );
        ImageView gaplessIv = new ImageView(ctx);
        gaplessIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        gaplessIv.setImageDrawable(ctrl.gaplessIconDrawable);
        LinearLayout.LayoutParams gIvLp = new LinearLayout.LayoutParams(iconSize, iconSize);
        gIvLp.setMarginEnd(dp(density, 14f));
        gaplessRow.addView(gaplessIv, gIvLp);

        LinearLayout gaplessTextCol = new LinearLayout(ctx);
        gaplessTextCol.setOrientation(LinearLayout.VERTICAL);
        TextView gaplessTitle = new TextView(ctx);
        gaplessTitle.setText(ctrl.de ? "Alben nahtlos erhalten" : "Keep albums gapless");
        gaplessTitle.setTextColor(palette.onSurface);
        gaplessTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        gaplessTextCol.addView(gaplessTitle);

        TextView gaplessSub = new TextView(ctx);
        gaplessSub.setText(ctrl.de
                ? "Überspringt Crossfades bei aufeinanderfolgenden Album-Tracks"
                : "Preserves original gapless flow on consecutive album tracks");
        gaplessSub.setTextColor(palette.onSurfaceVar);
        gaplessSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
        gaplessSub.setPadding(0, dp(density, 2f), dp(density, 8f), 0);
        gaplessTextCol.addView(gaplessSub);
        gaplessRow.addView(gaplessTextCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final ExpressiveSwitchView gaplessSwitch = new ExpressiveSwitchView(ctx, palette, density, ctrl.preserveGapless);
        gaplessSwitch.setClickable(false);
        ctrl.gaplessSwitch = gaplessSwitch;
        LinearLayout.LayoutParams gSwLp = new LinearLayout.LayoutParams(dp(density, 52f), dp(density, 32f));
        gSwLp.setMarginStart(dp(density, 8f));
        gaplessRow.addView(gaplessSwitch, gSwLp);

        gaplessRow.setOnTouchListener((v, ev) -> {
            switch (ev.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    gaplessSwitch.setPressedVisual(true);
                    break;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    gaplessSwitch.setPressedVisual(false);
                    break;
            }
            return false;
        });
        gaplessRow.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            ctrl.onGaplessToggled(!ctrl.preserveGapless);
        });
        fineRows.add(gaplessRow);

        addGroupedSection(fineGroupHolder, fineRows, palette, density);
        content.addView(fineGroupHolder);

        // 5. Quiet footnote
        TextView footnote = new TextView(ctx);
        footnote.setText(ctrl.de
                ? "Änderungen gelten sofort für den nächsten Übergang (Dolby Atmos & Videos bleiben unberührt)."
                : "Changes apply immediately to the next track transition (Dolby Atmos & videos stay untouched).");
        footnote.setTextColor(withAlpha(palette.onSurfaceVar, 0x99));
        footnote.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        footnote.setGravity(Gravity.CENTER_HORIZONTAL);
        footnote.setPadding(dp(density, 6f), dp(density, 6f), dp(density, 6f), dp(density, 8f));
        content.addView(footnote);

        FrameLayout.LayoutParams contentLp = new FrameLayout.LayoutParams(
                maxContentWidth,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER_HORIZONTAL
        );
        scrollView.addView(content, contentLp);

        mainColumn.addView(scrollView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                0,
                1f
        ));
        rootContainer.addView(mainColumn);

        if (Build.VERSION.SDK_INT >= 20) {
            final int topBarBasePadTop = dp(density, 8f);
            final int topBarPadH = dp(density, 8f);
            rootContainer.setOnApplyWindowInsetsListener((v, insets) -> {
                int topInset;
                int bottomInset;
                if (Build.VERSION.SDK_INT >= 30) {
                    topInset = insets.getInsets(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()).top;
                    bottomInset = insets.getInsets(WindowInsets.Type.navigationBars() | WindowInsets.Type.displayCutout()).bottom;
                } else {
                    topInset = insets.getSystemWindowInsetTop();
                    bottomInset = insets.getSystemWindowInsetBottom();
                }
                topBar.setPadding(topBarPadH, topBarBasePadTop + topInset, topBarPadH, dp(density, 6f));
                content.setPadding(padH, basePadTop, padH, basePadBottom + bottomInset);
                return insets;
            });
        }

        ctrl.syncUiState();

        dialog.setContentView(rootContainer);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setBackgroundDrawable(new ColorDrawable(palette.surfaceBase));
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(0f);
            window.setElevation(0f);
            window.setWindowAnimations(0);
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= 29) {
                window.setStatusBarContrastEnforced(false);
                window.setNavigationBarContrastEnforced(false);
            }
            if (Build.VERSION.SDK_INT >= 30) {
                window.setDecorFitsSystemWindows(false);
            }
            View decor = window.getDecorView();
            if (decor != null) {
                decor.setElevation(0f);
                decor.setOutlineProvider(null);
            }
            try {
                MaterialYouColorEngine.applySystemBarAppearance(window, palette.lightMode);
            } catch (Throwable ignored) {
            }
        }

        activeDialogRef = new WeakReference<>(dialog);
        dialog.setOnDismissListener(d -> {
            if (activeDialogRef.get() == dialog) {
                activeDialogRef = new WeakReference<>(null);
            }
        });
        dialog.show();

        float startX = Math.max(dpf(density, 64f), screenW * 0.18f);
        rootContainer.setTranslationX(startX);
        rootContainer.setAlpha(0f);
        rootContainer.animate()
                .translationX(0f)
                .alpha(1f)
                .setDuration(240L)
                .setInterpolator(new PathInterpolator(0.05f, 0.7f, 0.1f, 1.0f))
                .start();
    }

    private static void addSectionHeader(LinearLayout parent, String title, Palette palette, float density) {
        TextView tv = new TextView(parent.getContext());
        tv.setText(title);
        tv.setTextColor(palette.onSurfaceVar);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        tv.setPadding(dp(density, 6f), dp(density, 6f), dp(density, 6f), dp(density, 7f));
        parent.addView(tv);
    }

    private static void addGroupedSection(LinearLayout target, List<View> rows, Palette palette, float density) {
        if (rows == null || rows.isEmpty()) {
            return;
        }
        int total = rows.size();
        for (int i = 0; i < total; i++) {
            View row = rows.get(i);
            applyGroupedCardBg(row, i, total, palette, density, row.isClickable(), false);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.bottomMargin = (i == total - 1) ? dp(density, 14f) : dp(density, 2f);
            target.addView(row, lp);
        }
    }

    private static void animateScreenDismiss(final Dialog dialog, View rootView) {
        if (dialog == null || !dialog.isShowing()) {
            return;
        }
        if (rootView == null) {
            try {
                dialog.dismiss();
            } catch (Throwable ignored) {
            }
            return;
        }
        rootView.animate().cancel();
        float exitX = Math.max(rootView.getWidth() * 0.22f, 160f);
        rootView.animate()
                .translationX(exitX)
                .alpha(0f)
                .setDuration(190L)
                .setInterpolator(new PathInterpolator(0.3f, 0f, 0.8f, 0.15f))
                .setListener(new AnimatorListenerAdapter() {
                    @Override
                    public void onAnimationEnd(Animator animation) {
                        try {
                            if (dialog.isShowing()) {
                                dialog.dismiss();
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                })
                .start();
    }

    /**
     * Compact crisp 28x18dp Canvas silhouette showing a single crossfade curve shape.
     */
    private static final class MiniCurveIconView extends View {
        private final Palette palette;
        private final float density;
        private final int curveType;
        private final Paint outPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint inPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path outPath = new Path();
        private final Path inPath = new Path();
        private boolean selected;

        MiniCurveIconView(Context ctx, Palette palette, float density, int curveType) {
            super(ctx);
            this.palette = palette;
            this.density = density;
            this.curveType = curveType;

            outPaint.setStyle(Paint.Style.STROKE);
            outPaint.setStrokeWidth(dpf(density, 1.8f));
            outPaint.setStrokeCap(Paint.Cap.ROUND);
            outPaint.setStrokeJoin(Paint.Join.ROUND);

            inPaint.setStyle(Paint.Style.STROKE);
            inPaint.setStrokeWidth(dpf(density, 2.0f));
            inPaint.setStrokeCap(Paint.Cap.ROUND);
            inPaint.setStrokeJoin(Paint.Join.ROUND);
        }

        void setSelectedState(boolean selected) {
            if (this.selected != selected) {
                this.selected = selected;
                invalidate();
            }
        }

        @Override
        protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            float padX = dpf(density, 1.5f);
            float padY = dpf(density, 2f);
            float usableW = Math.max(1f, w - padX * 2f);
            float usableH = Math.max(1f, h - padY * 2f);
            float baseY = padY + usableH;

            outPaint.setColor(withAlpha(selected ? palette.tertiary : palette.onSurfaceVar, selected ? 0xD0 : 0x70));
            inPaint.setColor(selected ? palette.primary : palette.onSurfaceVar);

            outPath.reset();
            inPath.reset();
            final int samples = 20;
            for (int i = 0; i <= samples; i++) {
                float t = i / (float) samples;
                float gOut = CrossfadeEngine.computeFadeOutGain(t, 1f, curveType, 50);
                float gIn = CrossfadeEngine.computeFadeInGain(t, 1f, curveType, 50);
                float x = padX + t * usableW;
                float yOut = baseY - gOut * usableH;
                float yIn = baseY - gIn * usableH;
                if (i == 0) {
                    outPath.moveTo(x, yOut);
                    inPath.moveTo(x, yIn);
                } else {
                    outPath.lineTo(x, yOut);
                    inPath.lineTo(x, yIn);
                }
            }
            canvas.drawPath(outPath, outPaint);
            canvas.drawPath(inPath, inPaint);
        }
    }

    /**
     * Pure flat live visualizer plotting Track A fade-out and Track B fade-in gain curves
     * (zero gradients, zero border strokes, crisp solid lines).
     */
    private static final class CrossfadeCurveView extends View {
        private static final int SAMPLES = 64;

        private final Palette palette;
        private final float density;
        private final Paint cardPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint gridPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint midDashPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint outLinePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint inLinePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint dotPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path outPath = new Path();
        private final Path inPath = new Path();
        private final RectF cardRect = new RectF();

        private int durationSeconds;
        private int fromCurve;
        private int targetCurve;
        private float curveMorph = 1f;
        private float fromStrength;
        private float targetStrength;
        private float currentStrength;
        private ValueAnimator morphAnimator;

        CrossfadeCurveView(Context ctx, Palette palette, float density) {
            super(ctx);
            this.palette = palette;
            this.density = density;

            cardPaint.setStyle(Paint.Style.FILL);
            cardPaint.setColor(palette.surfaceContainer);

            gridPaint.setStyle(Paint.Style.STROKE);
            gridPaint.setStrokeWidth(dpf(density, 1f));
            gridPaint.setColor(withAlpha(palette.onSurfaceVar, 0x1E));

            midDashPaint.setStyle(Paint.Style.STROKE);
            midDashPaint.setStrokeWidth(dpf(density, 1.1f));
            midDashPaint.setColor(withAlpha(palette.onSurfaceVar, 0x38));
            midDashPaint.setPathEffect(new DashPathEffect(new float[]{dpf(density, 4f), dpf(density, 4f)}, 0f));

            outLinePaint.setStyle(Paint.Style.STROKE);
            outLinePaint.setStrokeWidth(dpf(density, 2.5f));
            outLinePaint.setStrokeCap(Paint.Cap.ROUND);
            outLinePaint.setStrokeJoin(Paint.Join.ROUND);

            inLinePaint.setStyle(Paint.Style.STROKE);
            inLinePaint.setStrokeWidth(dpf(density, 2.7f));
            inLinePaint.setStrokeCap(Paint.Cap.ROUND);
            inLinePaint.setStrokeJoin(Paint.Join.ROUND);

            textPaint.setTextSize(dpf(density, 11.5f));
            textPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        }

        void setCurveParams(int durationSeconds, int curveType, int strengthPercent) {
            boolean first = morphAnimator == null && currentStrength == 0f && fromStrength == 0f;
            this.durationSeconds = durationSeconds;
            if (first) {
                this.fromCurve = curveType;
                this.targetCurve = curveType;
                this.curveMorph = 1f;
                this.fromStrength = strengthPercent;
                this.targetStrength = strengthPercent;
                this.currentStrength = strengthPercent;
                invalidate();
                return;
            }
            if (this.targetCurve == curveType && Math.round(this.targetStrength) == strengthPercent) {
                invalidate();
                return;
            }
            if (morphAnimator != null) {
                morphAnimator.cancel();
            }
            this.fromCurve = this.curveMorph >= 0.5f ? this.targetCurve : this.fromCurve;
            this.targetCurve = curveType;
            this.fromStrength = this.currentStrength;
            this.targetStrength = strengthPercent;
            this.curveMorph = 0f;

            morphAnimator = ValueAnimator.ofFloat(0f, 1f);
            morphAnimator.setDuration(220L);
            morphAnimator.setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f));
            morphAnimator.addUpdateListener(anim -> {
                float f = (float) anim.getAnimatedValue();
                curveMorph = f;
                currentStrength = fromStrength + (targetStrength - fromStrength) * f;
                invalidate();
            });
            morphAnimator.start();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            float r = dpf(density, 20f);
            cardRect.set(0f, 0f, w, h);
            canvas.drawRoundRect(cardRect, r, r, cardPaint);

            float padL = dpf(density, 16f);
            float padR = dpf(density, 16f);
            float padT = dpf(density, 32f);
            float padB = dpf(density, 24f);
            float plotW = Math.max(1f, w - padL - padR);
            float plotH = Math.max(1f, h - padT - padB);
            float baseLineY = padT + plotH;

            canvas.drawLine(padL, padT, padL + plotW, padT, gridPaint);
            canvas.drawLine(padL, padT + plotH * 0.5f, padL + plotW, padT + plotH * 0.5f, gridPaint);
            canvas.drawLine(padL, baseLineY, padL + plotW, baseLineY, gridPaint);
            canvas.drawLine(padL + plotW * 0.5f, padT, padL + plotW * 0.5f, baseLineY, midDashPaint);

            boolean active = durationSeconds > 0;
            int outCol = active ? palette.tertiary : withAlpha(palette.onSurfaceVar, 0x60);
            int inCol = active ? palette.primary : withAlpha(palette.onSurfaceVar, 0x80);
            outLinePaint.setColor(outCol);
            inLinePaint.setColor(inCol);

            outPath.reset();
            inPath.reset();

            int roundedStrength = Math.round(currentStrength);
            float midOutY = padT + plotH * 0.5f;
            float midInY = padT + plotH * 0.5f;

            for (int i = 0; i <= SAMPLES; i++) {
                float t = i / (float) SAMPLES;
                float gOutA = CrossfadeEngine.computeFadeOutGain(t, 1f, fromCurve, roundedStrength);
                float gOutB = CrossfadeEngine.computeFadeOutGain(t, 1f, targetCurve, roundedStrength);
                float gOut = gOutA + (gOutB - gOutA) * curveMorph;

                float gInA = CrossfadeEngine.computeFadeInGain(t, 1f, fromCurve, roundedStrength);
                float gInB = CrossfadeEngine.computeFadeInGain(t, 1f, targetCurve, roundedStrength);
                float gIn = gInA + (gInB - gInA) * curveMorph;

                float x = padL + t * plotW;
                float yOut = baseLineY - gOut * plotH;
                float yIn = baseLineY - gIn * plotH;
                if (i == SAMPLES / 2) {
                    midOutY = yOut;
                    midInY = yIn;
                }
                if (i == 0) {
                    outPath.moveTo(x, yOut);
                    inPath.moveTo(x, yIn);
                } else {
                    outPath.lineTo(x, yOut);
                    inPath.lineTo(x, yIn);
                }
            }

            canvas.drawPath(outPath, outLinePaint);
            canvas.drawPath(inPath, inLinePaint);

            dotPaint.setColor(outCol);
            canvas.drawCircle(padL + plotW * 0.5f, midOutY, dpf(density, 3.5f), dotPaint);
            dotPaint.setColor(inCol);
            canvas.drawCircle(padL + plotW * 0.5f, midInY, dpf(density, 3.5f), dotPaint);

            textPaint.setTextSize(dpf(density, 11.5f));
            textPaint.setTextAlign(Paint.Align.LEFT);
            textPaint.setColor(outCol);
            canvas.drawText("Track A", padL, dpf(density, 20f), textPaint);

            float trackAWidth = textPaint.measureText("Track A");
            textPaint.setColor(inCol);
            canvas.drawText("Track B", padL + trackAWidth + dpf(density, 12f), dpf(density, 20f), textPaint);

            boolean de = CrossfadeEngine.isGermanLocale();
            String statusText = active ? (durationSeconds + " s") : (de ? "Aus" : "Off");
            textPaint.setTextAlign(Paint.Align.RIGHT);
            textPaint.setColor(active ? palette.primary : palette.onSurfaceVar);
            canvas.drawText(statusText, w - padR, dpf(density, 20f), textPaint);

            textPaint.setTextSize(dpf(density, 10f));
            textPaint.setColor(withAlpha(palette.onSurfaceVar, 0x88));
            textPaint.setTextAlign(Paint.Align.LEFT);
            canvas.drawText("0%", padL, h - dpf(density, 7f), textPaint);
            textPaint.setTextAlign(Paint.Align.CENTER);
            canvas.drawText("50%", padL + plotW * 0.5f, h - dpf(density, 7f), textPaint);
            textPaint.setTextAlign(Paint.Align.RIGHT);
            canvas.drawText("100%", padL + plotW, h - dpf(density, 7f), textPaint);
        }
    }
}
