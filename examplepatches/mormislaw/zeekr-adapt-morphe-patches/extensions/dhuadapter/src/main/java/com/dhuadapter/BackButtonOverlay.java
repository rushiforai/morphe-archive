package com.dhuadapter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.GridLayout;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.ScrollView;
import android.widget.TextView;

import com.dhuadapter.core.HookEnv;

/**
 * Floating button overlay for DHU with two modes, driven by the embedded config:
 *
 * - backButton.onlySettings=false → BACK MODE: circle with a back arrow.
 *     tap = onBackPressed(), drag = reposition, long-press = settings menu.
 * - backButton.onlySettings=true  → SETTINGS-ONLY MODE: the circle shows the
 *     current metricsDpi value as digits. tap OR long-press = settings menu,
 *     drag = reposition. No "back" functionality.
 *
 * The settings menu lets the user tune metricsDpi, configDpi, button sizeDp,
 * alpha and color (12-color palette) at runtime. Changes are applied to
 * HookEnv.config immediately (density hooks pick them up on the next resource
 * update), persisted to SharedPreferences so DhuConfig.applyRuntimeOverrides
 * restores them on the next launch, and an in-panel "Restart app" button
 * cold-restarts the app so already-inflated views pick the new density up.
 */
public class BackButtonOverlay {

    private static final String TAG = "DhuAdapter";

    /** Prefs shared with DhuConfig.applyRuntimeOverrides (runtime overrides). */
    public static final String PREFS_NAME = "DhuAdapterPrefs";
    public static final String KEY_METRICS_DPI = "set_metricsDpi";
    public static final String KEY_CONFIG_DPI  = "set_configDpi";
    public static final String KEY_SIZE_DP     = "set_sizeDp";
    public static final String KEY_ALPHA       = "set_alpha";
    public static final String KEY_COLOR       = "set_color";

    private static final String KEY_X = "back_btn_x";
    private static final String KEY_Y = "back_btn_y";
    private static final String KEY_VISIBLE = "back_btn_visible";

    private static final long LONG_PRESS_MS = 2000;
    private static final int DRAG_THRESHOLD_PX = 10;

    // Settings panel sizing: never exceed 80% of the screen on either axis —
    // an oversized panel is REBUILT at a proportionally smaller density
    // (smaller fonts/buttons/padding), scrolling is only a fallback.
    private static final float PANEL_MAX_FRACTION = 0.8f;
    private static final float PANEL_WIDTH_DP = 440f;

    // Settings panel ranges / steps
    private static final int DPI_MIN = 160, DPI_MAX = 560, DPI_STEP = 20;
    private static final int SIZE_MIN = 24, SIZE_MAX = 96;
    private static final int ALPHA_MIN = 10, ALPHA_MAX = 100;   // percent

    /** 12-color Material palette offered in the settings panel. */
    private static final int[] PALETTE = {
            0xFFF44336, // Red
            0xFFE91E63, // Pink
            0xFF9C27B0, // Purple
            0xFF3F51B5, // Indigo
            0xFF2196F3, // Blue
            0xFF00BCD4, // Cyan
            0xFF009688, // Teal
            0xFF4CAF50, // Green
            0xFFFFC107, // Amber
            0xFFFF9800, // Orange
            0xFF795548, // Brown
            0xFF607D8B  // Blue Grey
    };

    private View overlayView;
    private View panelView;
    private WindowManager windowManager;
    private WindowManager.LayoutParams layoutParams;
    private WindowManager.LayoutParams panelParams;
    private SharedPreferences prefs;
    private Activity attachedActivity;
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    /** Visibility toggle (settings panel). Hidden = alpha 0, window stays
     *  attached so the invisible button still catches a long-press. */
    private boolean shown = true;

    /**
     * Attach the overlay to the given activity's window.
     */
    public void attach(Activity activity) {
        try {
            attachedActivity = activity;
            prefs = activity.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            windowManager = (WindowManager) activity.getSystemService(Context.WINDOW_SERVICE);

            shown = prefs.getBoolean(KEY_VISIBLE, true);

            createButton(activity);
            applyVisibility();

            // Add the button window (createButton only builds the view/params).
            windowManager.addView(overlayView, layoutParams);

            if (Log.isLoggable(TAG, Log.DEBUG)) {
                Log.d(TAG, "BackButtonOverlay attached at ("
                        + layoutParams.x + "," + layoutParams.y + ")");
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed to attach BackButtonOverlay", e);
        }
    }

    /** Build the button view + its window params from the current config. */
    private void createButton(Activity activity) {
        DhuConfig cfg = HookEnv.config;
        float density = activity.getResources().getDisplayMetrics().density;
        int sizePxActual = (int) (cfg.backButtonSize * density);

        overlayView = new BackButtonView(activity, sizePxActual, cfg.backButtonColor,
                cfg.backButtonOnlySettings, cfg.metricsDpi);
        overlayView.setAlpha(cfg.backButtonAlpha);

        layoutParams = new WindowManager.LayoutParams(
                sizePxActual,
                sizePxActual,
                WindowManager.LayoutParams.TYPE_APPLICATION,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                        | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL,
                PixelFormat.TRANSLUCENT
        );
        layoutParams.gravity = Gravity.TOP | Gravity.START;
        layoutParams.x = prefs.getInt(KEY_X, 200);
        layoutParams.y = prefs.getInt(KEY_Y, 200);

        setupTouchListener(activity);
    }

    /**
     * Rebuild the button in place with the current config values (called after
     * the user changes size / alpha / color / dpi in the settings menu).
     */
    private void refreshButton() {
        try {
            if (windowManager == null || attachedActivity == null || overlayView == null) return;
            try {
                windowManager.removeViewImmediate(overlayView);
            } catch (IllegalArgumentException notAttached) {
                // addView was still queued — the rebuild below re-queues it.
            }
            createButton(attachedActivity);
            applyVisibility();
            windowManager.addView(overlayView, layoutParams);
        } catch (Exception e) {
            Log.e(TAG, "refreshButton failed", e);
        }
    }

    /**
     * Show/hide the button visually. Hidden does NOT remove the window — the
     * view just goes alpha 0 (still VISIBLE), so it keeps catching touches and
     * a long-press on the invisible button reopens the settings panel.
     */
    private void applyVisibility() {
        if (overlayView == null || attachedActivity == null || HookEnv.config == null) return;
        overlayView.setAlpha(shown ? HookEnv.config.backButtonAlpha : 0f);
        overlayView.setVisibility(View.VISIBLE);
    }

    /**
     * Remove the overlay from the window.
     *
     * addView() on a TYPE_APPLICATION window is queued asynchronously, so on a
     * short-lived activity (splash / UID onboarding) the view may still be
     * PENDING (isAttachedToWindow()==false) when the activity is destroyed.
     * Gating removeView on isAttachedToWindow() would then skip the removal and
     * leak the window (WindowLeaked BackButtonView). So we remove unconditionally
     * and use removeViewImmediate to tear it down synchronously before the
     * activity's own window token is gone.
     */
    public void detach() {
        dismissPanel();
        try {
            if (overlayView != null && windowManager != null) {
                windowManager.removeViewImmediate(overlayView);
            }
        } catch (IllegalArgumentException notAttached) {
            // View was never actually added (addView failed / not yet queued) —
            // nothing to remove, safe to ignore.
        } catch (Exception e) {
            Log.e(TAG, "Failed to detach BackButtonOverlay", e);
        }
        overlayView = null;
        windowManager = null;
        attachedActivity = null;
        mainHandler.removeCallbacksAndMessages(null);
    }

    private void setupTouchListener(final Activity activity) {
        overlayView.setOnTouchListener(new View.OnTouchListener() {
            private float downX, downY;
            private int origX, origY;
            private boolean dragging = false;
            private boolean longPressed = false;
            private final Handler handler = new Handler(Looper.getMainLooper());
            private final Runnable longPressRunnable = new Runnable() {
                @Override
                public void run() {
                    longPressed = true;
                    openSettings();
                }
            };

            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        downX = event.getRawX();
                        downY = event.getRawY();
                        origX = layoutParams.x;
                        origY = layoutParams.y;
                        dragging = false;
                        longPressed = false;
                        handler.postDelayed(longPressRunnable, LONG_PRESS_MS);
                        return true;

                    case MotionEvent.ACTION_MOVE:
                        float dx = event.getRawX() - downX;
                        float dy = event.getRawY() - downY;
                        if (Math.abs(dx) > DRAG_THRESHOLD_PX || Math.abs(dy) > DRAG_THRESHOLD_PX) {
                            dragging = true;
                            handler.removeCallbacks(longPressRunnable);
                        }
                        if (dragging) {
                            layoutParams.x = origX + (int) dx;
                            layoutParams.y = origY + (int) dy;
                            try {
                                windowManager.updateViewLayout(overlayView, layoutParams);
                            } catch (Exception ignored) {}
                        }
                        return true;

                    case MotionEvent.ACTION_UP:
                        handler.removeCallbacks(longPressRunnable);
                        if (dragging) {
                            // Save position
                            prefs.edit()
                                    .putInt(KEY_X, layoutParams.x)
                                    .putInt(KEY_Y, layoutParams.y)
                                    .apply();
                        } else if (!longPressed) {
                            if (!shown) {
                                // Hidden button: a tap must do nothing — the
                                // invisible button must not fire "back".
                                // Long-press (handled above) opens the panel.
                                return true;
                            }
                            if (HookEnv.config == null || !HookEnv.config.backButtonOnlySettings) {
                                // BACK MODE: tap -> back
                                try {
                                    activity.onBackPressed();
                                } catch (Exception e) {
                                    Log.e(TAG, "onBackPressed failed", e);
                                }
                            } else {
                                // SETTINGS-ONLY MODE: tap -> settings menu
                                openSettings();
                            }
                        }
                        return true;

                    case MotionEvent.ACTION_CANCEL:
                        handler.removeCallbacks(longPressRunnable);
                        return true;
                }
                return false;
            }
        });
    }

    // ────────────────────────────────────────────────────────────────────
    //  Settings panel
    // ────────────────────────────────────────────────────────────────────

    private void openSettings() {
        try {
            if (panelView != null || windowManager == null
                    || attachedActivity == null || HookEnv.config == null) {
                return;
            }
            android.util.DisplayMetrics dm = attachedActivity.getResources().getDisplayMetrics();
            int maxW = (int) (dm.widthPixels * PANEL_MAX_FRACTION);
            int maxH = (int) (dm.heightPixels * PANEL_MAX_FRACTION);

            // Pass 1 — build at the real (hooked) density and measure.
            float density = dm.density;
            LinearLayout root = buildPanel(density);
            int width = (int) (PANEL_WIDTH_DP * density);
            root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.UNSPECIFIED);
            int contentH = root.getMeasuredHeight();

            // Pass 2 — oversized (e.g. metricsDpi 560)? Rebuild the whole panel
            // at a proportionally smaller density: fonts, buttons, sliders,
            // swatches and padding all shrink by the same factor so the panel
            // fits within 80% of the screen on BOTH axes.
            if (width > maxW || contentH > maxH) {
                float shrink = Math.min(
                        maxW / (float) width,
                        maxH / (float) Math.max(1, contentH));
                density *= shrink;
                root = buildPanel(density);
                width = (int) (PANEL_WIDTH_DP * density);
                root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.UNSPECIFIED);
            }

            // Safety net: if it STILL doesn't fit (non-linear sizes at extreme
            // densities), scroll the remainder inside the pinned window.
            int height = ViewGroup.LayoutParams.WRAP_CONTENT;
            View content = root;
            if (root.getMeasuredHeight() > maxH || width > maxW) {
                ScrollView scroller = new ScrollView(attachedActivity);
                scroller.addView(root, new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                content = scroller;
                if (root.getMeasuredHeight() > maxH) height = maxH;
                if (width > maxW) width = maxW;
            }

            panelView = content;
            panelParams = new WindowManager.LayoutParams(
                    width,
                    height,
                    WindowManager.LayoutParams.TYPE_APPLICATION,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                            | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL,
                    PixelFormat.TRANSLUCENT
            );
            panelParams.gravity = Gravity.CENTER;

            windowManager.addView(panelView, panelParams);
            Log.i(TAG, "Settings panel opened (density " + density + ")");
        } catch (Exception e) {
            Log.e(TAG, "openSettings failed", e);
            panelView = null;
        }
    }

    /** Build the panel content at the given density — used twice by the
     *  shrink-to-fit pass: once to measure, once at the reduced density. */
    private LinearLayout buildPanel(float density) {
        DhuConfig cfg = HookEnv.config;

        LinearLayout root = new LinearLayout(attachedActivity);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (20 * density);
        root.setPadding(pad, pad, pad, pad);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xF0212121);
        bg.setCornerRadius(16 * density);
        root.setBackground(bg);

        root.addView(label("DHU Adapter — Settings", density, 0xFFFFFFFF, 20, true));

        // metricsDpi / configDpi steppers — DPI changes need an app restart to
        // re-render already-inflated views, so we track them and surface a soft
        // "Need restart" cue ONLY when they differ from the values the panel was
        // opened with. size/alpha/color apply live and don't need a restart.
        final int initialMetricsDpi = cfg.metricsDpi;
        final int initialConfigDpi = cfg.configDpi;

        final TextView restartHint = new TextView(attachedActivity);
        restartHint.setText("Need restart");
        restartHint.setTextColor(0xFFFFB74D);            // soft orange
        restartHint.setTextSize(14);
        restartHint.setGravity(Gravity.CENTER);
        int hintPad = (int) (8 * density);
        restartHint.setPadding(hintPad, hintPad, hintPad, hintPad);
        GradientDrawable hintBg = new GradientDrawable();
        hintBg.setColor(0x26FF9800);                     // 15% orange wash
        hintBg.setCornerRadius(12 * density);
        restartHint.setBackground(hintBg);
        restartHint.setVisibility(View.GONE);

        final Button restart = panelButton("Restart app", density);
        final int restartDefaultColor = restart.getCurrentTextColor();

        final Runnable updateRestartUi = () -> {
            boolean dirty = cfg.metricsDpi != initialMetricsDpi
                    || cfg.configDpi != initialConfigDpi;
            if (dirty) {
                restartHint.setVisibility(View.VISIBLE);
                restartHint.animate().alpha(1f).setDuration(200).start();
                restart.setBackgroundTintList(
                        android.content.res.ColorStateList.valueOf(0x33FF9800));
                restart.setTextColor(0xFFFFB74D);
            } else {
                // fading out; a new animate() below cancels this if it flips back
                restartHint.animate().alpha(0f).setDuration(200)
                        .withEndAction(() -> restartHint.setVisibility(View.GONE))
                        .start();
                restart.setBackgroundTintList(null);
                restart.setTextColor(restartDefaultColor);
            }
        };

        root.addView(stepperRow("metricsDpi", cfg.metricsDpi, DPI_MIN, DPI_MAX, DPI_STEP,
                density, v -> { cfg.metricsDpi = v; persist(); updateRestartUi.run(); }));
        root.addView(stepperRow("configDpi", cfg.configDpi, DPI_MIN, DPI_MAX, DPI_STEP,
                density, v -> { cfg.configDpi = v; persist(); updateRestartUi.run(); }));

        // button size slider
        final TextView sizeLabel = label(sizeText(cfg.backButtonSize), density, 0xFFE0E0E0, 16, false);
        root.addView(sizeLabel);
        root.addView(seekBar(cfg.backButtonSize, SIZE_MIN, SIZE_MAX, density,
                (bar, progress) -> {
                    cfg.backButtonSize = progress;
                    sizeLabel.setText(sizeText(progress));
                    persist();
                    refreshButton();
                }));

        // button alpha slider
        final TextView alphaLabel = label(alphaText(cfg.backButtonAlpha), density, 0xFFE0E0E0, 16, false);
        root.addView(alphaLabel);
        root.addView(seekBar(Math.round(cfg.backButtonAlpha * 100), ALPHA_MIN, ALPHA_MAX, density,
                (bar, progress) -> {
                    cfg.backButtonAlpha = progress / 100f;
                    alphaLabel.setText(alphaText(cfg.backButtonAlpha));
                    persist();
                    applyVisibility();   // no-op while hidden; keeps alpha in sync
                }));

        // button color palette (12 swatches, 6 per row)
        root.addView(label("button color", density, 0xFFE0E0E0, 16, false));
        root.addView(colorGrid(cfg.backButtonColor, density));

        // "Need restart" cue — hidden until a DPI value actually changes
        LinearLayout.LayoutParams hintLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintLp.topMargin = (int) (12 * density);
        root.addView(restartHint, hintLp);

        // visibility toggle: hide/show the floating button. Hidden keeps the
        // window attached (alpha 0) — a long-press on the invisible button
        // reopens this panel, so it can never be lost.
        Button visibilityToggle = panelButton(shown ? "Hide button" : "Show button", density);
        visibilityToggle.setOnClickListener(v -> {
            shown = !shown;
            prefs.edit().putBoolean(KEY_VISIBLE, shown).apply();
            applyVisibility();
            visibilityToggle.setText(shown ? "Hide button" : "Show button");
            Log.i(TAG, "BackButton visibility toggled: " + shown);
        });
        LinearLayout.LayoutParams toggleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        toggleLp.topMargin = (int) (8 * density);
        root.addView(visibilityToggle, toggleLp);

        // buttons row: Restart app / Close
        LinearLayout buttons = new LinearLayout(attachedActivity);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowLp.topMargin = (int) (12 * density);

        restart.setOnClickListener(v -> restartApp());
        buttons.addView(restart, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button close = panelButton("Close", density);
        close.setOnClickListener(v -> dismissPanel());
        LinearLayout.LayoutParams closeLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        closeLp.leftMargin = (int) (12 * density);
        buttons.addView(close, closeLp);

        root.addView(buttons, rowLp);
        return root;
    }

    private void dismissPanel() {
        try {
            if (panelView != null && windowManager != null) {
                windowManager.removeViewImmediate(panelView);
            }
        } catch (IllegalArgumentException notAttached) {
            // never added — nothing to remove
        } catch (Exception e) {
            Log.e(TAG, "dismissPanel failed", e);
        }
        panelView = null;
        panelParams = null;
    }

    /** Persist the current config values as runtime overrides (next-launch restore). */
    private void persist() {
        try {
            DhuConfig cfg = HookEnv.config;
            prefs.edit()
                    .putInt(KEY_METRICS_DPI, cfg.metricsDpi)
                    .putInt(KEY_CONFIG_DPI, cfg.configDpi)
                    .putInt(KEY_SIZE_DP, cfg.backButtonSize)
                    .putFloat(KEY_ALPHA, cfg.backButtonAlpha)
                    .putInt(KEY_COLOR, cfg.backButtonColor)
                    .apply();
        } catch (Exception e) {
            Log.e(TAG, "persist failed", e);
        }
    }

    /** Cold-restart the app so already-inflated views pick the new density up. */
    private void restartApp() {
        try {
            Context ctx = attachedActivity != null
                    ? attachedActivity.getApplicationContext() : HookEnv.appContext;
            dismissPanel();
            if (ctx != null) {
                Intent relaunch = ctx.getPackageManager()
                        .getLaunchIntentForPackage(ctx.getPackageName());
                if (relaunch != null) {
                    relaunch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                            | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                    ctx.startActivity(relaunch);
                }
            }
            Log.i(TAG, "Restarting app to apply new settings");
            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(0); // unreachable fallback if killProcess is blocked
        } catch (Exception e) {
            Log.e(TAG, "restartApp failed", e);
        }
    }

    // ---- Panel widget helpers (framework widgets only, no app resources) ----

    private interface SeekBarCallback {
        void onChanged(SeekBar bar, int progress);
    }

    private interface StepperCallback {
        void onValue(int v);
    }

    private TextView label(String text, float density, int color, int sp, boolean bold) {
        TextView tv = new TextView(attachedActivity);
        tv.setText(text);
        tv.setTextColor(color);
        tv.setTextSize(sp);
        if (bold) tv.getPaint().setFakeBoldText(true);
        int bottom = (int) (8 * density);
        tv.setPadding(0, 0, 0, bottom);
        return tv;
    }

    private LinearLayout stepperRow(String title, int value, int min, int max, int step,
                                    float density, StepperCallback cb) {
        LinearLayout row = new LinearLayout(attachedActivity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        TextView name = label(title, density, 0xFFE0E0E0, 16, false);
        name.setPadding(0, 0, 0, 0);
        row.addView(name, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final int[] cur = {value};

        final TextView val = label(String.valueOf(value), density, 0xFFFFFFFF, 18, true);
        val.setPadding(0, 0, 0, 0);
        val.setGravity(Gravity.CENTER);
        val.setMinWidth((int) (64 * density));

        Button minus = panelButton("−", density);
        Button plus = panelButton("+", density);
        Runnable sync = () -> val.setText(String.valueOf(cur[0]));
        minus.setOnClickListener(v -> {
            cur[0] = Math.max(min, cur[0] - step);
            cb.onValue(cur[0]);
            sync.run();
        });
        plus.setOnClickListener(v -> {
            cur[0] = Math.min(max, cur[0] + step);
            cb.onValue(cur[0]);
            sync.run();
        });

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        row.addView(minus, lp);

        LinearLayout.LayoutParams vlp = new LinearLayout.LayoutParams(
                (int) (72 * density), ViewGroup.LayoutParams.WRAP_CONTENT);
        row.addView(val, vlp);

        row.addView(plus, lp);
        return row;
    }

    private SeekBar seekBar(int progress, int min, int max, float density, SeekBarCallback cb) {
        SeekBar bar = new SeekBar(attachedActivity);
        bar.setMax(max - min);
        bar.setProgress(progress - min);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int p, boolean fromUser) {
                if (fromUser) cb.onChanged(seekBar, p + min);
            }

            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        return bar;
    }

    private GridLayout colorGrid(int selectedColor, float density) {
        GridLayout grid = new GridLayout(attachedActivity);
        grid.setColumnCount(6);
        int cell = (int) (44 * density);

        java.util.List<ColorSwatch> swatches = new java.util.ArrayList<>();
        for (final int color : PALETTE) {
            ColorSwatch swatch = new ColorSwatch(attachedActivity, color,
                    color == selectedColor, density);
            swatches.add(swatch);
            GridLayout.LayoutParams lp = new GridLayout.LayoutParams();
            lp.width = cell;
            lp.height = cell;
            int m = (int) (4 * density);
            lp.setMargins(m, m, m, m);
            swatch.setLayoutParams(lp);
            swatch.setOnClickListener(v -> {
                HookEnv.config.backButtonColor = color;
                persist();
                for (ColorSwatch s : swatches) {
                    s.selected = (s.swatchColor == color);
                    s.invalidate();
                }
                refreshButton();
            });
            grid.addView(swatch);
        }
        return grid;
    }

    private Button panelButton(String text, float density) {
        Button b = new Button(attachedActivity);
        b.setText(text);
        b.setAllCaps(false);
        int hpad = (int) (12 * density);
        b.setPadding(hpad, 0, hpad, 0);
        return b;
    }

    private static String sizeText(int sizeDp) {
        return "button size: " + sizeDp;
    }

    private static String alphaText(float alpha) {
        return "button alpha: " + Math.round(alpha * 100) + "%";
    }

    // ---- Custom views rendered on Canvas ----

    /** One color swatch of the palette: filled circle + white ring when selected. */
    private static final class ColorSwatch extends View {
        final int swatchColor;
        boolean selected;
        private final Paint swatchPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ringPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        ColorSwatch(Context context, int color, boolean sel, float density) {
            super(context);
            swatchColor = color;
            selected = sel;
            ringPaint.setStyle(Paint.Style.STROKE);
            ringPaint.setColor(Color.WHITE);
            ringPaint.setStrokeWidth(Math.max(2f, 2.5f * density));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float r = Math.min(cx, cy) - (selected ? ringPaint.getStrokeWidth() : 2f);
            swatchPaint.setColor(swatchColor);
            canvas.drawCircle(cx, cy, r, swatchPaint);
            if (selected) {
                canvas.drawCircle(cx, cy, r - ringPaint.getStrokeWidth() / 2f, ringPaint);
            }
        }
    }

    private static final class BackButtonView extends View {

        private final Paint circlePaint;
        private final Paint arrowPaint;
        private final Paint textPaint;
        private final int sizePx;
        private final boolean showDigits;
        private final String digitText;

        BackButtonView(Context context, int sizePx, int color, boolean showDigits, int digitValue) {
            super(context);
            this.sizePx = sizePx;
            this.showDigits = showDigits;
            this.digitText = String.valueOf(digitValue);

            circlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            circlePaint.setColor(color);
            circlePaint.setStyle(Paint.Style.FILL);

            arrowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            arrowPaint.setColor(Color.WHITE);
            arrowPaint.setStyle(Paint.Style.STROKE);
            arrowPaint.setStrokeWidth(sizePx * 0.08f);
            arrowPaint.setStrokeCap(Paint.Cap.ROUND);
            arrowPaint.setStrokeJoin(Paint.Join.ROUND);

            textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            textPaint.setColor(Color.WHITE);
            textPaint.setTextSize(sizePx * 0.32f);
            textPaint.setTextAlign(Paint.Align.CENTER);
            textPaint.setFakeBoldText(true);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            setMeasuredDimension(sizePx, sizePx);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float cx = sizePx / 2f;
            float cy = sizePx / 2f;
            float radius = sizePx / 2f - 2f;

            canvas.drawCircle(cx, cy, radius, circlePaint);

            if (showDigits) {
                // DPI badge mode: the current metricsDpi value as digits
                Paint.FontMetrics fm = textPaint.getFontMetrics();
                float baseline = cy - (fm.ascent + fm.descent) / 2f;
                canvas.drawText(digitText, cx, baseline, textPaint);
                return;
            }

            // White back arrow  <-
            float arrowLen = sizePx * 0.3f;
            float headLen = sizePx * 0.15f;

            // Shaft: from right to left
            float startX = cx + arrowLen / 2f;
            float endX = cx - arrowLen / 2f;
            canvas.drawLine(startX, cy, endX, cy, arrowPaint);

            // Arrowhead
            Path head = new Path();
            head.moveTo(endX + headLen, cy - headLen);
            head.lineTo(endX, cy);
            head.lineTo(endX + headLen, cy + headLen);
            canvas.drawPath(head, arrowPaint);
        }
    }
}
