package com.waze.gw;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Car HUD. Responsive:
 *   landscape -> [speed-limit + speedometer]  centered  | separator | alerts (right)
 *   portrait  -> clock / [limit + speedometer] on top  -- separator -- alerts (below)
 */
public class HudActivity extends Activity {

    /**
     * The HUD is a fixed dashboard layout sized in sp; a large system font size ("Cỡ chữ" in
     * Android settings) inflated every label and made rows overlap. Pin the font scale to 1 for
     * this screen only; the rest of the phone keeps the user's setting.
     */
    @Override protected void attachBaseContext(android.content.Context base) {
        android.content.Context context = base;
        try {
            Configuration current = base.getResources().getConfiguration();
            if (current.fontScale != 1f) {
                Configuration fixed = new Configuration(current);
                fixed.fontScale = 1f;
                context = base.createConfigurationContext(fixed);
            }
        } catch (Throwable ignored) { }
        super.attachBaseContext(context);
    }

    private TextView clock, eta, limit, speed;
    private TextView speedUnitText;   // the "km/h" / "mph" label under speed
    private FrameLayout limitStack;
    private TextView minimumLimit;
    private boolean minimumShown;
    private int limitDiameter, minimumDiameter, minimumLeft, minimumTop;
    private LinearLayout alertsBox;
    private String alertsSig = "";
    private String v2ActiveKey = "";
    private final java.util.HashMap<String, android.graphics.Bitmap> iconCache =
            new java.util.HashMap<String, android.graphics.Bitmap>();
    private Vignette vignette;
    private boolean pulsing;
    private boolean mirror;
    private View hudRoot;
    private View hudDeviceStatus;
    private TextView flipBtn;
    private GpsSignalView hudGpsSignal;
    private BatteryLevelView hudBatteryIcon;
    private TextView hudBattery;
    private long lastBatteryReadElapsed;
    private ImageView navTurn;
    private TextView exitNum;      // roundabout exit-number overlay on Waze's segmented ring
    private int lastTurn = -2;
    private TextView navDist;
    private TextView navStreet;
    private LaneGuidanceStrip laneStrip;
    private ImageView avgSign;     // "cấm vượt" no-passing sign, shown only inside an average-speed zone
    private TextView v2RouteSummary, v2RoadName;
    private boolean useV2;
    private boolean portraitHud;
    private int portraitGaugeStyle = 1;
    private View navWrap;
    private GradientDrawable spkRing;
    private HudSpeedometerDial v2Speedometer;
    private int spkStroke;
    private float gaugeScale = 1f;
    private int observedWindowWidth, observedWindowHeight;
    private static final int RING_OK = 0xFF8A5CFF, RING_OVER = 0xFFE2231A;
    private final Handler h = new Handler(Looper.getMainLooper());
    private final SimpleDateFormat fmt = new SimpleDateFormat("EEE  dd/MM/yyyy    HH:mm:ss", Locale.US);
    private final SimpleDateFormat fmtV2 = new SimpleDateFormat("HH:mm", Locale.US);
    private boolean returningToMap;

    /** Pick an Activity whose manifest orientation already matches the requested HUD mode. */
    public static android.content.Intent createIntent(android.content.Context context) {
        int orientation = context.getSharedPreferences("waze_hud_gw", MODE_PRIVATE)
                .getInt("hud_orientation", 1);
        Class<?> target = orientation == 2 ? PortraitHudActivity.class : HudActivity.class;
        return new android.content.Intent(context, target);
    }

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        if (!Gateway.modEnabled(this)) {
            finish();
            return;
        }
        // Keep the historic landscape default, while allowing portrait heads/phones and sensor auto-rotate.
        // setRequestedOrientation() overrides the legacy manifest default before the HUD hierarchy is built.
        android.content.SharedPreferences hudPrefs =
                getSharedPreferences("waze_hud_gw", MODE_PRIVATE);
        int requestedHudOrientation = hudPrefs.getInt("hud_orientation", 1);
        if (requestedHudOrientation == 2) {
            setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT);
        } else if (requestedHudOrientation == 0) {
            setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_FULL_SENSOR);
        } else {
            setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
        }
        // Keep the screen on. Brightness is forced to MAX only in windshield-reflection mode.
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);

        clock = text(22, 0xFFD2D8DD, Gravity.CENTER, true);
        eta = text(24, 0xFFDDE2E6, Gravity.CENTER, true);
        eta.setVisibility(View.GONE);
        portraitHud = getResources().getConfiguration().orientation
                == Configuration.ORIENTATION_PORTRAIT;
        portraitGaugeStyle = hudPrefs.getInt("hud_portrait_gauge_style", 1);
        if (portraitGaugeStyle < 1 || portraitGaugeStyle > 3) portraitGaugeStyle = 1;
        // Portrait has its own dashboard and instrument selection.  The landscape
        // HUD V1/V2 preference must not silently change the portrait experience.
        useV2 = portraitHud || hudPrefs.getInt("hud_layout", 1) == 2;
        View content = portraitHud
                ? buildV2Portrait()
                : (useV2 ? buildV2() : buildLandscape());
        installMapReturnGesture();

        // wrap in a FrameLayout so the red over-speed vignette can overlay any orientation
        FrameLayout outer = new FrameLayout(this);
        outer.addView(content, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        vignette = new Vignette(this);
        outer.addView(vignette, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        // xADAS distance gauge: one switch (Settings > xADAS) covers both HUD layouts. It sits inside
        // the mirrored layer so windshield reflection mode flips it with the rest of the HUD.
        GapGaugeView gapGauge = new GapGaugeView(this, GapGaugeView.Surface.HUD, false, dp(132));
        FrameLayout.LayoutParams gaugeLp = new FrameLayout.LayoutParams(dp(132), dp(132),
                Gravity.BOTTOM | Gravity.END);
        gaugeLp.bottomMargin = dp(16);
        gaugeLp.rightMargin = dp(16);
        outer.addView(gapGauge, gaugeLp);
        // overlay layer that is NOT mirrored, so the flip control stays upright, in place and tappable
        FrameLayout superRoot = new FrameLayout(this);
        superRoot.addView(outer, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // windshield "HUD reflection" mode: a real button (top-right) mirrors the whole view horizontally.
        flipBtn = new TextView(this);
        flipBtn.setText("⇄");                 // ⇄
        flipBtn.setTextSize(26);
        flipBtn.setTypeface(Typeface.DEFAULT_BOLD);
        flipBtn.setGravity(Gravity.CENTER);
        flipBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) { toggleMirror(); }
        });
        FrameLayout.LayoutParams fp = new FrameLayout.LayoutParams(dp(54), dp(54),
                Gravity.TOP | Gravity.END);
        fp.topMargin = dp(12); fp.rightMargin = dp(12);
        superRoot.addView(flipBtn, fp);

        View deviceStatus = buildDeviceStatus();
        hudDeviceStatus = deviceStatus;
        FrameLayout.LayoutParams deviceLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dp(38), Gravity.TOP | Gravity.START);
        deviceLp.topMargin = dp(12);
        deviceLp.leftMargin = dp(12);
        superRoot.addView(deviceStatus, deviceLp);

        ModReport.attach(superRoot, true);   // "báo sai tốc độ" trigger + preset picker (unmirrored layer)
        setContentView(superRoot);
        applyDisplayCutoutInsets(superRoot);
        installWindowResizeWatcher(superRoot);

        hudRoot = outer;
        mirror = getSharedPreferences("waze_hud_gw", MODE_PRIVATE).getBoolean("mirror", false);
        applyMirror();

        tick.run();
    }

    /** Keep every HUD surface clear of hole-punch/notch cameras and rounded display edges. */
    private void applyDisplayCutoutInsets(final View root) {
        if (android.os.Build.VERSION.SDK_INT < 20 || root == null) return;
        root.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override public android.view.WindowInsets onApplyWindowInsets(
                    View view, android.view.WindowInsets insets) {
                int left = insets.getSystemWindowInsetLeft();
                int top = insets.getSystemWindowInsetTop();
                int right = insets.getSystemWindowInsetRight();
                int bottom = insets.getSystemWindowInsetBottom();
                if (android.os.Build.VERSION.SDK_INT >= 28) {
                    android.view.DisplayCutout cutout = insets.getDisplayCutout();
                    if (cutout != null) {
                        left = Math.max(left, cutout.getSafeInsetLeft());
                        top = Math.max(top, cutout.getSafeInsetTop());
                        right = Math.max(right, cutout.getSafeInsetRight());
                        bottom = Math.max(bottom, cutout.getSafeInsetBottom());
                    }
                }
                view.setPadding(left, top, right, bottom);
                return insets;
            }
        });
        root.requestApplyInsets();
    }

    /**
     * Freeform/desktop Android can resize an Activity without a clean orientation transition.
     * Rebuild after the drag settles so every dp-based gauge is recalculated from the new bounds.
     */
    private void installWindowResizeWatcher(View root) {
        root.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                                                  int oldLeft, int oldTop, int oldRight, int oldBottom) {
                int width = right - left;
                int height = bottom - top;
                if (width <= 0 || height <= 0) return;
                if (observedWindowWidth == 0 || observedWindowHeight == 0) {
                    observedWindowWidth = width;
                    observedWindowHeight = height;
                    return;
                }
                if (Math.abs(width - observedWindowWidth) < dp(12)
                        && Math.abs(height - observedWindowHeight) < dp(12)) return;
                observedWindowWidth = width;
                observedWindowHeight = height;
                h.removeCallbacks(resizeRecreate);
                h.postDelayed(resizeRecreate, 350L);
            }
        });
    }

    private final Runnable resizeRecreate = new Runnable() {
        @Override public void run() {
            if (isFinishing()) return;
            if (android.os.Build.VERSION.SDK_INT >= 17 && isDestroyed()) return;
            recreate();
        }
    };

    /** GPS and phone-battery status in the quiet top-left HUD corner. */
    private View buildDeviceStatus() {
        LinearLayout status = new LinearLayout(this);
        status.setOrientation(LinearLayout.HORIZONTAL);
        status.setGravity(Gravity.CENTER_VERTICAL);
        status.setPadding(dp(10), dp(5), dp(11), dp(5));
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setColor(0xB314171F);
        bg.setCornerRadius(dp(19));
        bg.setStroke(dp(1), 0x664E5968);
        status.setBackground(bg);

        hudGpsSignal = new GpsSignalView(this);
        status.addView(hudGpsSignal, new LinearLayout.LayoutParams(dp(21), dp(21)));

        View divider = new View(this);
        divider.setBackgroundColor(0x665F6876);
        LinearLayout.LayoutParams dividerLp = new LinearLayout.LayoutParams(dp(1), dp(18));
        dividerLp.leftMargin = dp(9);
        dividerLp.rightMargin = dp(9);
        status.addView(divider, dividerLp);

        hudBatteryIcon = new BatteryLevelView(this);
        LinearLayout.LayoutParams batteryIconLp = new LinearLayout.LayoutParams(dp(30), dp(18));
        batteryIconLp.rightMargin = dp(5);
        status.addView(hudBatteryIcon, batteryIconLp);

        hudBattery = text(14, 0xFFE7E9ED, Gravity.CENTER, true);
        hudBattery.setText("--");
        status.addView(hudBattery, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return status;
    }

    private void updateDeviceStatus() {
        if (hudGpsSignal != null) hudGpsSignal.setLevel(Gateway.gpsSignalLevel());
        long now = android.os.SystemClock.elapsedRealtime();
        if (hudBattery == null || now - lastBatteryReadElapsed < 15000L) return;
        lastBatteryReadElapsed = now;
        int percent = -1;
        try {
            android.os.BatteryManager manager = (android.os.BatteryManager)
                    getSystemService(BATTERY_SERVICE);
            if (manager != null) percent = manager.getIntProperty(
                    android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } catch (Throwable ignored) { }
        if (hudBatteryIcon != null) hudBatteryIcon.setPercent(percent);
        hudBattery.setText(percent >= 0 && percent <= 100 ? percent + "%" : "--");
    }

    /** Long-press either speed gauge to close HUD and reveal Waze's map Activity below it. */
    private void installMapReturnGesture() {
        final View.OnLongClickListener returnToMap = new View.OnLongClickListener() {
            @Override public boolean onLongClick(View view) {
                if (returningToMap) return true;
                returningToMap = true;
                try {
                    view.performHapticFeedback(
                            android.view.HapticFeedbackConstants.LONG_PRESS);
                } catch (Throwable ignored) { }
                finish();
                // Reveal the Waze map with a short cross-fade instead of disappearing abruptly.
                overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
                return true;
            }
        };
        installMapReturnGesture(limitStack, returnToMap);
        installMapReturnGesture(limit, returnToMap);
        installMapReturnGesture(minimumLimit, returnToMap);
        installMapReturnGesture(speed, returnToMap);
        installMapReturnGesture(v2Speedometer, returnToMap);
    }

    private void installMapReturnGesture(View target, View.OnLongClickListener listener) {
        if (target == null) return;
        target.setLongClickable(true);
        target.setOnLongClickListener(listener);
        target.setContentDescription(I18n.tr("hud.press_and_hold_to_return_to"));
    }

    private void applyMirror() {
        if (hudRoot != null) hudRoot.setScaleX(mirror ? -1f : 1f);
        // Device status lives on the unmirrored control overlay so it does not move under the
        // top-right flip button. Mirror the complete pill in place for windshield reflection.
        if (hudDeviceStatus != null) hudDeviceStatus.setScaleX(mirror ? -1f : 1f);
        if (flipBtn != null) {
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.OVAL);
            bg.setColor(mirror ? 0xCC8A5CFF : 0xCC1E1E28);          // purple when ON, dark when OFF
            bg.setStroke(dp(2), mirror ? 0xFFFFFFFF : 0x55FFFFFF);
            flipBtn.setBackground(bg);
            flipBtn.setTextColor(0xFFFFFFFF);
        }
        applyBrightness();
    }

    /** Windshield-reflection mode needs a very bright screen, so force MAX brightness only when mirror is ON;
     *  when OFF, release the override (BRIGHTNESS_OVERRIDE_NONE) so the user's own screen brightness is used. */
    private void applyBrightness() {
        WindowManager.LayoutParams wlp = getWindow().getAttributes();
        wlp.screenBrightness = mirror ? 1.0f : WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE;
        getWindow().setAttributes(wlp);
    }

    private void toggleMirror() {
        mirror = !mirror;
        getSharedPreferences("waze_hud_gw", MODE_PRIVATE).edit().putBoolean("mirror", mirror).apply();
        applyMirror();
        android.widget.Toast.makeText(this, I18n.f("hud.hud_mirror_0", (mirror ? I18n.tr("hud.on") : I18n.tr("hud.off"))),
                android.widget.Toast.LENGTH_SHORT).show();
    }

    // ---------- LANDSCAPE: circles centered, alerts on the right ----------
    private View buildLandscape() {
        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(0xFF080808);

        FrameLayout.LayoutParams clp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        clp.topMargin = dp(14);
        root.addView(clock, clp);

        FrameLayout.LayoutParams elp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        elp.topMargin = dp(44);
        root.addView(eta, elp);

        // [arrow + limit + speedometer] cluster, with a compact alerts strip right below it, centered
        LinearLayout centerCol = new LinearLayout(this);
        centerCol.setOrientation(LinearLayout.VERTICAL);
        centerCol.setGravity(Gravity.CENTER_HORIZONTAL);
        centerCol.addView(buildCircles(), mw(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams ap = mw(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        ap.topMargin = dp(16);
        centerCol.addView(buildAlerts(), ap);
        root.addView(centerCol, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        return root;
    }

    // ---------- PORTRAIT V1: navigation, compact gauges and a short horizontal alert rail ----------
    private View buildPortrait() {
        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(0xFF080808);

        FrameLayout.LayoutParams clockLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        clockLp.topMargin = dp(14);
        root.addView(clock, clockLp);

        FrameLayout.LayoutParams etaLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        etaLp.topMargin = dp(46);
        etaLp.leftMargin = dp(14);
        etaLp.rightMargin = dp(14);
        root.addView(eta, etaLp);

        float density = getResources().getDisplayMetrics().density;
        float widthDp = getResources().getDisplayMetrics().widthPixels / density;
        float requested = getSharedPreferences("waze_hud_gw", MODE_PRIVATE)
                .getInt("hud_size", 100) / 100f;
        // Reserve enough width for the minimum-speed badge even when it appears later.
        float heightDp = getResources().getDisplayMetrics().heightPixels / density;
        float fitWidth = Math.max(0.32f, (widthDp - 28f) / 588f);
        float fitHeight = Math.max(0.32f, (heightDp - 110f) / 560f);
        float s = Math.max(0.32f, Math.min(requested, Math.min(fitWidth, fitHeight)));

        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setGravity(Gravity.CENTER_HORIZONTAL);
        body.setPadding(dp(14), 0, dp(14), dp(10));

        View navigation = buildNavBlock(dp((int) (244 * s)), s);
        LinearLayout.LayoutParams navLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        navLp.bottomMargin = dp(10);
        body.addView(navigation, navLp);

        body.addView(buildPortraitV1Gauges(s), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout.LayoutParams alertsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        alertsLp.topMargin = dp(14);
        body.addView(buildAlerts(), alertsLp);

        FrameLayout.LayoutParams bodyLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER);
        bodyLp.topMargin = dp(64);
        root.addView(body, bodyLp);
        return root;
    }

    /** Portrait V1 gauge row. Kept separate so the landscape cluster remains pixel-identical. */
    private View buildPortraitV1Gauges(float s) {
        gaugeScale = s;
        LinearLayout group = new LinearLayout(this);
        group.setOrientation(LinearLayout.VERTICAL);
        group.setGravity(Gravity.CENTER_HORIZONTAL);

        LinearLayout gauges = new LinearLayout(this);
        gauges.setOrientation(LinearLayout.HORIZONTAL);
        gauges.setGravity(Gravity.CENTER);

        int diameter = dp((int) (256 * s));
        limitDiameter = diameter;
        minimumDiameter = dp((int) (154 * s));
        minimumLeft = dp((int) (154 * s));
        minimumTop = dp((int) (142 * s));
        limitStack = new FrameLayout(this);
        limitStack.setClipChildren(false);
        limitStack.setClipToPadding(false);

        limit = text((int) (104 * s), Color.BLACK, Gravity.CENTER, true);
        extraBold(limit);
        ModTypeface.applySpeed(limit);
        limit.setBackground(oval(0xFFFFFFFF, dp((int) (27 * s)), 0xFFE2231A));
        limitStack.addView(limit, new FrameLayout.LayoutParams(diameter, diameter));

        minimumLimit = text((int) (67 * s), 0xFFFFFFFF, Gravity.CENTER, true);
        minimumLimit.setIncludeFontPadding(false);
        extraBold(minimumLimit);
        ModTypeface.applySpeed(minimumLimit);
        minimumLimit.setBackground(oval(0xFF0B4FB3, 0, 0xFF0B4FB3));
        minimumLimit.setVisibility(View.GONE);
        FrameLayout.LayoutParams minLp = new FrameLayout.LayoutParams(
                minimumDiameter, minimumDiameter);
        minLp.leftMargin = minimumLeft;
        minLp.topMargin = minimumTop;
        limitStack.addView(minimumLimit, minLp);

        LinearLayout.LayoutParams limitLp = new LinearLayout.LayoutParams(diameter, diameter);
        limitLp.rightMargin = dp(16);
        gauges.addView(limitStack, limitLp);

        LinearLayout speedGauge = new LinearLayout(this);
        speedGauge.setOrientation(LinearLayout.VERTICAL);
        speedGauge.setGravity(Gravity.CENTER);
        spkStroke = dp((int) (14 * s));
        spkRing = oval(0xFF14141E, spkStroke, RING_OK);
        speedGauge.setBackground(spkRing);
        speed = text((int) (74 * s), 0xFFFFFFFF, Gravity.CENTER, true);
        extraBold(speed);
        ModTypeface.applySpeed(speed);
        TextView unit = text((int) (26 * s), 0xFFAEB4BA, Gravity.CENTER, true);
        speedUnitText = unit;
        unit.setText(Units.speedUnit("km/h"));
        speedGauge.addView(speed, mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        speedGauge.addView(unit, mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        gauges.addView(speedGauge, new LinearLayout.LayoutParams(diameter, diameter));
        group.addView(gauges);

        avgSign = new ImageView(this);
        avgSign.setScaleType(ImageView.ScaleType.FIT_CENTER);
        avgSign.setVisibility(View.GONE);
        LinearLayout.LayoutParams activeLp = new LinearLayout.LayoutParams(
                dp((int) (82 * s)), dp((int) (82 * s)));
        activeLp.topMargin = dp(8);
        group.addView(avgSign, activeLp);
        return group;
    }

    // ---------- HUD V2: navigation left, large legal-speed cluster center, upcoming alerts right ----------
    private View buildV2() {
        FrameLayout root = new FrameLayout(this);
        GradientDrawable frame = new GradientDrawable();
        frame.setShape(GradientDrawable.RECTANGLE);
        frame.setColor(0xFF050506);
        frame.setCornerRadius(dp(10));
        root.setBackground(frame);
        root.setPadding(dp(18), dp(12), dp(18), dp(12));

        clock.setTextSize(20);
        clock.setTextColor(0xFFE6E7EA);
        GradientDrawable header = new GradientDrawable();
        header.setShape(GradientDrawable.RECTANGLE);
        header.setColor(0xFF050506);
        header.setStroke(dp(1), 0xFFB7BBC1);
        header.setCornerRadius(dp(4));
        clock.setBackground(header);
        clock.setPadding(dp(24), dp(4), dp(24), dp(4));
        FrameLayout.LayoutParams headerLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        root.addView(clock, headerLp);

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout left = new LinearLayout(this);
        left.setOrientation(LinearLayout.VERTICAL);
        left.setGravity(Gravity.CENTER);
        v2RouteSummary = text(19, 0xFFD8DADF, Gravity.CENTER, true);
        v2RouteSummary.setSingleLine(true);
        LinearLayout.LayoutParams summaryLp = mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        summaryLp.bottomMargin = dp(6);
        left.addView(v2RouteSummary, summaryLp);
        left.addView(buildV2NavBlock(1f), mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        avgSign = new ImageView(this);
        avgSign.setScaleType(ImageView.ScaleType.FIT_CENTER);
        avgSign.setVisibility(View.GONE);
        LinearLayout.LayoutParams activeLp = new LinearLayout.LayoutParams(dp(62), dp(62));
        activeLp.topMargin = dp(8);
        left.addView(avgSign, activeLp);
        row.addView(left, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.MATCH_PARENT, 0.27f));

        LinearLayout center = new LinearLayout(this);
        center.setOrientation(LinearLayout.VERTICAL);
        center.setGravity(Gravity.CENTER);
        center.addView(buildV2Gauges(1f));
        v2RoadName = text(20, 0xFFE8E9EC, Gravity.CENTER, true);
        v2RoadName.setSingleLine(true);
        v2RoadName.setEllipsize(android.text.TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams roadLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        roadLp.topMargin = dp(2);
        center.addView(v2RoadName, roadLp);
        laneStrip = new LaneGuidanceStrip(this);
        LinearLayout.LayoutParams laneLp = new LinearLayout.LayoutParams(dp(250), dp(54));
        laneLp.topMargin = dp(2);
        center.addView(laneStrip, laneLp);
        row.addView(center, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.MATCH_PARENT, 0.46f));

        alertsBox = new LinearLayout(this);
        alertsBox.setOrientation(LinearLayout.VERTICAL);
        alertsBox.setGravity(Gravity.CENTER);
        row.addView(alertsBox, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.MATCH_PARENT, 0.27f));

        FrameLayout.LayoutParams rowLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        rowLp.topMargin = dp(42);
        rowLp.bottomMargin = dp(8);
        root.addView(row, rowLp);
        return root;
    }

    // ---------- HUD V2 PORTRAIT: one readable column; alerts stay short and horizontal ----------
    private View buildV2Portrait() {
        FrameLayout root = new FrameLayout(this);
        GradientDrawable frame = new GradientDrawable();
        frame.setShape(GradientDrawable.RECTANGLE);
        frame.setColor(0xFF050506);
        frame.setCornerRadius(dp(10));
        root.setBackground(frame);

        clock.setTextSize(18);
        clock.setTextColor(0xFFE6E7EA);
        GradientDrawable header = new GradientDrawable();
        header.setShape(GradientDrawable.RECTANGLE);
        header.setColor(0xFF050506);
        header.setStroke(dp(1), 0xFFB7BBC1);
        header.setCornerRadius(dp(4));
        clock.setBackground(header);
        clock.setPadding(dp(20), dp(4), dp(20), dp(4));
        FrameLayout.LayoutParams headerLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        headerLp.topMargin = dp(12);
        root.addView(clock, headerLp);

        LinearLayout column = new LinearLayout(this);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setGravity(Gravity.CENTER_HORIZONTAL);
        column.setPadding(dp(12), 0, dp(12), dp(10));

        // Portrait is a different dashboard, not the landscape row squeezed into a column:
        // current speed dominates, while legal/minimum speed float at its upper-right edge.
        column.addView(buildV2PortraitGauges());

        v2RoadName = text(18, 0xFFE8E9EC, Gravity.CENTER, true);
        v2RoadName.setSingleLine(true);
        v2RoadName.setEllipsize(android.text.TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams roadLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        roadLp.topMargin = dp(2);
        column.addView(v2RoadName, roadLp);

        laneStrip = new LaneGuidanceStrip(this);
        LinearLayout.LayoutParams laneLp = new LinearLayout.LayoutParams(dp(230), dp(50));
        laneLp.topMargin = dp(2);
        column.addView(laneStrip, laneLp);

        View nav = buildV2PortraitNavBlock();
        LinearLayout.LayoutParams navLp = mw(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        navLp.topMargin = dp(4);
        column.addView(nav, navLp);

        v2RouteSummary = text(17, 0xFFD8DADF, Gravity.CENTER, true);
        v2RouteSummary.setSingleLine(true);
        LinearLayout.LayoutParams summaryLp = mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        summaryLp.topMargin = dp(4);
        column.addView(v2RouteSummary, summaryLp);

        LinearLayout notices = new LinearLayout(this);
        notices.setOrientation(LinearLayout.HORIZONTAL);
        notices.setGravity(Gravity.CENTER);
        avgSign = new ImageView(this);
        avgSign.setScaleType(ImageView.ScaleType.FIT_CENTER);
        avgSign.setVisibility(View.GONE);
        LinearLayout.LayoutParams activeLp = new LinearLayout.LayoutParams(dp(54), dp(54));
        activeLp.rightMargin = dp(6);
        notices.addView(avgSign, activeLp);
        alertsBox = new LinearLayout(this);
        alertsBox.setOrientation(LinearLayout.HORIZONTAL);
        alertsBox.setGravity(Gravity.CENTER);
        notices.addView(alertsBox, mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams noticesLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        noticesLp.topMargin = dp(5);
        column.addView(notices, noticesLp);

        FrameLayout.LayoutParams columnLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER);
        columnLp.topMargin = dp(56);
        root.addView(column, columnLp);
        return root;
    }

    /** Portrait instrument cluster selected independently from the landscape HUD layout. */
    private View buildV2PortraitGauges() {
        android.content.SharedPreferences prefs =
                getSharedPreferences("waze_hud_gw", MODE_PRIVATE);
        float requested = prefs.getInt("hud_size", 100) / 100f;
        float density = getResources().getDisplayMetrics().density;
        float widthDp = getResources().getDisplayMetrics().widthPixels / density;
        float heightDp = getResources().getDisplayMetrics().heightPixels / density;
        float fitWidth = Math.max(0.36f, (widthDp - 28f) / 350f);
        float fitHeight = Math.max(0.36f, (heightDp - 120f) / 570f);
        gaugeScale = Math.max(0.36f,
                Math.min(1.15f, Math.min(requested, Math.min(fitWidth, fitHeight))));
        float s = gaugeScale;

        int clusterWidth = dp((int) (350 * s));
        // Leave room for the minimum-speed badge after it is moved outside the
        // main sign instead of letting the following road-name row overlap it.
        int clusterHeight = dp((int) (280 * s));
        FrameLayout cluster = new FrameLayout(this);
        cluster.setClipChildren(false);
        cluster.setClipToPadding(false);

        int speedDiameter;
        int speedLeft;
        int speedTop;
        int legalLeft;
        int legalTop;
        float speedTextSp;
        float unitTextSp;
        if (portraitGaugeStyle == 2) {
            // The legal speed sign is dominant; current speed is a compact dial.
            speedDiameter = dp((int) (94 * s));
            speedLeft = dp((int) (246 * s));
            speedTop = dp((int) (15 * s));
            limitDiameter = dp((int) (210 * s));
            minimumDiameter = dp((int) (82 * s));
            minimumLeft = dp((int) (155 * s));
            minimumTop = dp((int) (165 * s));
            legalLeft = dp((int) (28 * s));
            legalTop = dp((int) (30 * s));
            speedTextSp = 36f * s;
            unitTextSp = 11f * s;
        } else if (portraitGaugeStyle == 3) {
            // Two large, equally readable instruments.
            speedDiameter = dp((int) (142 * s));
            speedLeft = dp((int) (204 * s));
            speedTop = dp((int) (49 * s));
            limitDiameter = dp((int) (184 * s));
            minimumDiameter = dp((int) (76 * s));
            minimumLeft = dp((int) (138 * s));
            minimumTop = dp((int) (145 * s));
            legalLeft = dp((int) (4 * s));
            legalTop = dp((int) (42 * s));
            speedTextSp = 52f * s;
            unitTextSp = 14f * s;
        } else {
            // Current speed is dominant; legal/minimum speed stay contextual.
            speedDiameter = dp((int) (210 * s));
            speedLeft = dp((int) (42 * s));
            speedTop = dp((int) (42 * s));
            limitDiameter = dp((int) (126 * s));
            minimumDiameter = dp((int) (72 * s));
            minimumLeft = dp((int) (82 * s));
            minimumTop = dp((int) (88 * s));
            legalLeft = dp((int) (198 * s));
            legalTop = dp((int) (10 * s));
            speedTextSp = 72f * s;
            unitTextSp = 16f * s;
        }

        HudSpeedometerDial speedGauge = new HudSpeedometerDial(this);
        v2Speedometer = speedGauge;
        speed = speedGauge.speedText();
        speedGauge.setTextSizes(speedTextSp, unitTextSp);
        FrameLayout.LayoutParams speedLp = new FrameLayout.LayoutParams(
                speedDiameter, speedDiameter);
        speedLp.leftMargin = speedLeft;
        speedLp.topMargin = speedTop;
        cluster.addView(speedGauge, speedLp);

        limitStack = new FrameLayout(this);
        limitStack.setClipChildren(false);
        limitStack.setClipToPadding(false);

        int initialLimitText = portraitGaugeStyle == 1
                ? (int) (57 * s) : (portraitGaugeStyle == 2 ? (int) (94 * s) : (int) (82 * s));
        limit = text(initialLimitText, Color.BLACK, Gravity.CENTER, true);
        extraBold(limit);
        ModTypeface.applySpeed(limit);
        int border = portraitGaugeStyle == 1 ? 14 : 18;
        limit.setBackground(oval(0xFFFFFFFF, dp((int) (border * s)), 0xFFE2231A));
        limitStack.addView(limit, new FrameLayout.LayoutParams(limitDiameter, limitDiameter));

        int initialMinText = portraitGaugeStyle == 1
                ? (int) (38 * s) : (portraitGaugeStyle == 2 ? (int) (45 * s) : (int) (42 * s));
        minimumLimit = text(initialMinText, 0xFFFFFFFF, Gravity.CENTER, true);
        minimumLimit.setIncludeFontPadding(false);
        extraBold(minimumLimit);
        ModTypeface.applySpeed(minimumLimit);
        minimumLimit.setBackground(oval(0xFF0B4FB3, 0, 0xFF0B4FB3));
        minimumLimit.setVisibility(View.GONE);
        FrameLayout.LayoutParams minLp = new FrameLayout.LayoutParams(
                minimumDiameter, minimumDiameter);
        minLp.leftMargin = minimumLeft;
        minLp.topMargin = minimumTop;
        limitStack.addView(minimumLimit, minLp);

        FrameLayout.LayoutParams legalLp = new FrameLayout.LayoutParams(
                limitDiameter, limitDiameter);
        legalLp.leftMargin = legalLeft;
        legalLp.topMargin = legalTop;
        cluster.addView(limitStack, legalLp);
        cluster.setLayoutParams(new LinearLayout.LayoutParams(clusterWidth, clusterHeight));
        return cluster;
    }

    /** Portrait navigation card: arrow on the left; distance and next street on the right. */
    private View buildV2PortraitNavBlock() {
        LinearLayout nav = new LinearLayout(this);
        nav.setOrientation(LinearLayout.HORIZONTAL);
        nav.setGravity(Gravity.CENTER);
        nav.setPadding(dp(12), dp(7), dp(12), dp(7));
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setColor(0x9914171F);
        bg.setCornerRadius(dp(18));
        bg.setStroke(dp(1), 0x554E5968);
        nav.setBackground(bg);

        int arrowSize = dp(104);
        FrameLayout arrowWrap = new FrameLayout(this);
        navTurn = new ImageView(this);
        navTurn.setScaleType(ImageView.ScaleType.FIT_CENTER);
        navTurn.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);
        arrowWrap.addView(navTurn, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        exitNum = text(30, 0xFFFFFFFF, Gravity.CENTER, true);
        extraBold(exitNum);
        exitNum.setVisibility(View.GONE);
        arrowWrap.addView(exitNum, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        nav.addView(arrowWrap, new LinearLayout.LayoutParams(arrowSize, arrowSize));

        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
        navDist = text(32, 0xFFFFFFFF, Gravity.START, true);
        extraBold(navDist);
        copy.addView(navDist, mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        navStreet = text(20, AmbientTheme.color(this), Gravity.START, true);
        navStreet.setMaxLines(2);
        navStreet.setEllipsize(android.text.TextUtils.TruncateAt.END);
        navStreet.setMaxWidth(dp(220));
        navStreet.setVisibility(View.GONE);
        LinearLayout.LayoutParams streetLp = mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        streetLp.topMargin = dp(2);
        copy.addView(navStreet, streetLp);
        LinearLayout.LayoutParams copyLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        copyLp.leftMargin = dp(12);
        nav.addView(copy, copyLp);

        navWrap = nav;
        navWrap.setVisibility(View.GONE);
        return nav;
    }

    private View buildV2NavBlock(float scale) {
        LinearLayout nav = new LinearLayout(this);
        nav.setOrientation(LinearLayout.VERTICAL);
        nav.setGravity(Gravity.CENTER);

        int arrowSize = dp((int) (118 * scale));
        FrameLayout arrowWrap = new FrameLayout(this);
        navTurn = new ImageView(this);
        navTurn.setScaleType(ImageView.ScaleType.FIT_CENTER);
        navTurn.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);
        arrowWrap.addView(navTurn, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        exitNum = text((int) (34 * scale), 0xFFFFFFFF, Gravity.CENTER, true);
        extraBold(exitNum);
        exitNum.setVisibility(View.GONE);
        arrowWrap.addView(exitNum, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        nav.addView(arrowWrap, new LinearLayout.LayoutParams(arrowSize, arrowSize));

        navDist = text((int) (30 * scale), 0xFFFFFFFF, Gravity.CENTER, true);
        extraBold(navDist);
        nav.addView(navDist, mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        navStreet = text((int) (19 * scale), AmbientTheme.color(this), Gravity.CENTER, true);
        navStreet.setMaxLines(2);
        navStreet.setEllipsize(android.text.TextUtils.TruncateAt.END);
        navStreet.setMaxWidth(dp((int) (300 * scale)));
        navStreet.setVisibility(View.GONE);
        LinearLayout.LayoutParams streetLp = mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        streetLp.topMargin = dp(3);
        nav.addView(navStreet, streetLp);
        navWrap = nav;
        navWrap.setVisibility(View.GONE);
        return nav;
    }

    private View buildV2Gauges(float orientationScale) {
        android.content.SharedPreferences prefs =
                getSharedPreferences("waze_hud_gw", MODE_PRIVATE);
        float requested = prefs.getInt("hud_size", 100) / 100f;
        float density = getResources().getDisplayMetrics().density;
        float widthDp = getResources().getDisplayMetrics().widthPixels / density;
        float heightDp = getResources().getDisplayMetrics().heightPixels / density;
        float fitWidth = Math.max(0.32f, ((widthDp * 0.46f) - 18f) / 410f);
        float fitHeight = Math.max(0.32f, (heightDp - 76f) / 310f);
        gaugeScale = Math.max(0.32f, Math.min(1.25f,
                Math.min(requested * orientationScale, Math.min(fitWidth, fitHeight))));
        float s = gaugeScale;

        int clusterWidth = dp((int) (410 * s));
        int clusterHeight = dp((int) (292 * s));
        FrameLayout cluster = new FrameLayout(this);

        limitDiameter = dp((int) (224 * s));
        minimumDiameter = dp((int) (112 * s));
        minimumLeft = dp((int) (166 * s));
        minimumTop = dp((int) (162 * s));
        limitStack = new FrameLayout(this);
        limitStack.setClipChildren(false);
        limitStack.setClipToPadding(false);

        limit = text((int) (98 * s), Color.BLACK, Gravity.CENTER, true);
        extraBold(limit);
        ModTypeface.applySpeed(limit);
        limit.setBackground(oval(0xFFFFFFFF, dp((int) (23 * s)), 0xFFE2231A));
        limitStack.addView(limit, new FrameLayout.LayoutParams(limitDiameter, limitDiameter));

        minimumLimit = text((int) (58 * s), 0xFFFFFFFF, Gravity.CENTER, true);
        minimumLimit.setIncludeFontPadding(false);
        extraBold(minimumLimit);
        ModTypeface.applySpeed(minimumLimit);
        minimumLimit.setBackground(oval(0xFF0B4FB3, 0, 0xFF0B4FB3));
        minimumLimit.setVisibility(View.GONE);
        FrameLayout.LayoutParams minLp =
                new FrameLayout.LayoutParams(minimumDiameter, minimumDiameter);
        minLp.leftMargin = minimumLeft;
        minLp.topMargin = minimumTop;
        limitStack.addView(minimumLimit, minLp);

        FrameLayout.LayoutParams legalLp =
                new FrameLayout.LayoutParams(limitDiameter, limitDiameter);
        legalLp.leftMargin = dp((int) (22 * s));
        legalLp.topMargin = dp((int) (10 * s));
        cluster.addView(limitStack, legalLp);

        int speedDiameter = dp((int) (130 * s));
        HudSpeedometerDial speedGauge = new HudSpeedometerDial(this);
        v2Speedometer = speedGauge;
        speed = speedGauge.speedText();
        FrameLayout.LayoutParams speedLp =
                new FrameLayout.LayoutParams(speedDiameter, speedDiameter);
        speedLp.leftMargin = dp((int) (270 * s));
        speedLp.topMargin = dp((int) (68 * s));
        cluster.addView(speedGauge, speedLp);

        cluster.setLayoutParams(new LinearLayout.LayoutParams(clusterWidth, clusterHeight));
        return cluster;
    }

    // ---------- shared pieces ----------
    private LinearLayout buildCircles() {
        LinearLayout circles = new LinearLayout(this);
        circles.setOrientation(LinearLayout.HORIZONTAL);
        circles.setGravity(Gravity.CENTER);
        // sizes are user-adjustable via Mod settings (percent of the base 256dp gauge)
        android.content.SharedPreferences sp = getSharedPreferences("waze_hud_gw", MODE_PRIVATE);
        float requested = sp.getInt("hud_size", 100) / 100f;
        float density = getResources().getDisplayMetrics().density;
        float widthDp = getResources().getDisplayMetrics().widthPixels / density;
        float heightDp = getResources().getDisplayMetrics().heightPixels / density;
        float fitWidth = Math.max(0.30f, (widthDp - 30f) / 920f);
        float fitHeight = Math.max(0.30f, (heightDp - 100f) / 330f);
        float s = Math.max(0.30f, Math.min(requested, Math.min(fitWidth, fitHeight)));
        gaugeScale = s;
        float slS = s, spdS = s;
        int slDia = dp((int) (256 * slS));
        int spdDia = dp((int) (256 * spdS));

        // direction arrow (scaled with the speedometer) + distance below, LEFT of the speed-limit; nav-only
        circles.addView(buildNavBlock(spdDia, spdS));

        limitDiameter = slDia;
        minimumDiameter = dp((int) (154 * slS));
        minimumLeft = dp((int) (154 * slS));
        minimumTop = dp((int) (142 * slS));
        limitStack = new FrameLayout(this);
        limitStack.setClipChildren(false);
        limitStack.setClipToPadding(false);

        limit = text((int) (104 * slS), Color.BLACK, Gravity.CENTER, true);
        extraBold(limit);
        ModTypeface.applySpeed(limit);
        limit.setBackground(oval(0xFFFFFFFF, dp((int) (27 * slS)), 0xFFE2231A));
        limitStack.addView(limit, new FrameLayout.LayoutParams(slDia, slDia));

        minimumLimit = text((int) (67 * slS), 0xFFFFFFFF, Gravity.CENTER, true);
        minimumLimit.setIncludeFontPadding(false);
        extraBold(minimumLimit);
        ModTypeface.applySpeed(minimumLimit);
        minimumLimit.setBackground(oval(0xFF0B4FB3, 0, 0xFF0B4FB3));
        minimumLimit.setVisibility(View.GONE);
        FrameLayout.LayoutParams minLp = new FrameLayout.LayoutParams(minimumDiameter, minimumDiameter);
        minLp.leftMargin = minimumLeft;
        minLp.topMargin = minimumTop;
        limitStack.addView(minimumLimit, minLp);

        LinearLayout.LayoutParams lpL = new LinearLayout.LayoutParams(slDia, slDia);
        lpL.rightMargin = dp(48);
        circles.addView(limitStack, lpL);

        LinearLayout spk = new LinearLayout(this);
        spk.setOrientation(LinearLayout.VERTICAL);
        spk.setGravity(Gravity.CENTER);
        spkStroke = dp((int) (14 * spdS));
        spkRing = oval(0xFF14141E, spkStroke, RING_OK);
        spk.setBackground(spkRing);
        speed = text((int) (74 * spdS), 0xFFFFFFFF, Gravity.CENTER, true);
        extraBold(speed);
        ModTypeface.applySpeed(speed);
        TextView unit = text((int) (26 * spdS), 0xFFAEB4BA, Gravity.CENTER, true);
        speedUnitText = unit;
        unit.setText(Units.speedUnit("km/h"));
        spk.addView(speed, mw(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        spk.addView(unit, mw(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        circles.addView(spk, new LinearLayout.LayoutParams(spdDia, spdDia));

        avgSign = new ImageView(this);                    // right of the speedometer: "cấm vượt" no-passing sign
        avgSign.setScaleType(ImageView.ScaleType.FIT_CENTER);
        avgSign.setVisibility(View.GONE);
        int avgDia = dp((int) (150 * spdS));
        LinearLayout.LayoutParams avlp = new LinearLayout.LayoutParams(avgDia, avgDia);
        avlp.leftMargin = dp(40);
        circles.addView(avgSign, avlp);
        return circles;
    }

    /** A centered horizontal strip of compact alert chips (icon + meters), below the gauge cluster. */
    private LinearLayout buildAlerts() {
        alertsBox = new LinearLayout(this);
        alertsBox.setOrientation(LinearLayout.HORIZONTAL);
        alertsBox.setGravity(Gravity.CENTER);
        return alertsBox;
    }

    /** Gauge-sized direction arrow with the distance below it (scaled by s). Hidden until navigating. */
    private View buildNavBlock(int dia, float s) {
        LinearLayout nav = new LinearLayout(this);
        nav.setOrientation(LinearLayout.VERTICAL);
        nav.setGravity(Gravity.CENTER);

        laneStrip = new LaneGuidanceStrip(this);
        LinearLayout.LayoutParams laneLp = new LinearLayout.LayoutParams(
                dp((int) (210 * s)), dp((int) (66 * s)));
        laneLp.bottomMargin = dp((int) (4 * s));
        nav.addView(laneStrip, laneLp);

        int as = dp((int) (190 * s));
        FrameLayout arrowWrap = new FrameLayout(this);
        navTurn = new ImageView(this);
        navTurn.setScaleType(ImageView.ScaleType.FIT_CENTER);
        navTurn.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);  // tint Waze's dark arrow white
        arrowWrap.addView(navTurn, new FrameLayout.LayoutParams(as, as));
        exitNum = text((int) (52 * s), 0xFFFFFFFF, Gravity.CENTER, true);
        extraBold(exitNum);
        exitNum.setVisibility(View.GONE);
        arrowWrap.addView(exitNum, new FrameLayout.LayoutParams(as, as));
        nav.addView(arrowWrap, new LinearLayout.LayoutParams(as, as));

        navDist = text((int) (46 * s), 0xFFFFFFFF, Gravity.CENTER, true);
        extraBold(navDist);
        nav.addView(navDist, mw(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        navStreet = text((int) (25 * s), AmbientTheme.color(this), Gravity.CENTER, true);
        navStreet.setMaxLines(2);
        navStreet.setEllipsize(android.text.TextUtils.TruncateAt.END);
        navStreet.setMaxWidth(dia - dp((int) (12 * s)));
        navStreet.setVisibility(View.GONE);
        LinearLayout.LayoutParams streetLp = mw(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        streetLp.topMargin = dp((int) (3 * s));
        nav.addView(navStreet, streetLp);

        // Height WRAP (not fixed dia): the arrow already fills ~190*s, leaving too little room for the
        // distance text below -> its descenders got clipped. Wrapping fits arrow+text; the row's CENTER
        // gravity keeps the arrow aligned with the gauges just as before.
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dia, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.rightMargin = dp(48);
        nav.setClipChildren(false);
        nav.setClipToPadding(false);
        nav.setLayoutParams(lp);
        navWrap = nav;
        navWrap.setVisibility(View.GONE);
        return nav;
    }

    private final Runnable tick = new Runnable() {
        @Override
        public void run() {
            Date now = new Date();
            updateDeviceStatus();
            clock.setText(useV2
                    ? (portraitHud ? fmtV2.format(now) : "HUD  ·  " + fmtV2.format(now))
                    : fmt.format(now));
            int lim = Gateway.hudLimit;
            if (useV2 && portraitHud) {
                if (portraitGaugeStyle == 2) {
                    ModTypeface.fitSpeed(limit, lim, 100f * gaugeScale, 80f * gaugeScale);
                } else if (portraitGaugeStyle == 3) {
                    ModTypeface.fitSpeed(limit, lim, 88f * gaugeScale, 70f * gaugeScale);
                } else {
                    ModTypeface.fitSpeed(limit, lim, 61f * gaugeScale, 49f * gaugeScale);
                }
            } else {
                ModTypeface.fitSpeed(limit, lim, 132f * gaugeScale, 108f * gaugeScale);
            }
            limit.setText(lim >= 10 ? String.valueOf(lim) : "--");
            LimitSign.apply(limit);
            int min = Gateway.minimumSpeedLimit;
            boolean showMinimum = min >= 10 && min <= 160;
            if (showMinimum) {
                if (useV2 && portraitHud) {
                    if (portraitGaugeStyle == 2) {
                        ModTypeface.fitSpeed(minimumLimit, min, 47f * gaugeScale, 38f * gaugeScale);
                    } else if (portraitGaugeStyle == 3) {
                        ModTypeface.fitSpeed(minimumLimit, min, 44f * gaugeScale, 35f * gaugeScale);
                    } else {
                        ModTypeface.fitSpeed(minimumLimit, min, 41f * gaugeScale, 33f * gaugeScale);
                    }
                } else {
                    ModTypeface.fitSpeed(minimumLimit, min, 86f * gaugeScale, 70f * gaugeScale);
                }
                minimumLimit.setText(String.valueOf(min));
            }
            minimumLimit.setVisibility(showMinimum ? View.VISIBLE : View.GONE);
            if (showMinimum != minimumShown) {
                minimumShown = showMinimum;
                ViewGroup.LayoutParams p = limitStack.getLayoutParams();
                p.width = showMinimum
                        ? Math.max(limitDiameter, minimumLeft + minimumDiameter) : limitDiameter;
                p.height = showMinimum
                        ? Math.max(limitDiameter, minimumTop + minimumDiameter) : limitDiameter;
                if (p instanceof LinearLayout.LayoutParams) {
                    ((LinearLayout.LayoutParams) p).rightMargin = portraitHud
                            ? dp(16) : (showMinimum ? dp(48) : 0);
                }
                limitStack.setLayoutParams(p);
            }
            int sp = Gateway.hudSpeed;
            if (useV2) {
                float speedSize = 42f;
                if (portraitHud) {
                    speedSize = portraitGaugeStyle == 2 ? 36f
                            : (portraitGaugeStyle == 3 ? 52f : 72f);
                }
                speed.setTextSize(speedSize * gaugeScale);
            } else {
                ModTypeface.fitSpeed(speed, sp, 96f * gaugeScale, 78f * gaugeScale);
            }
            speed.setText(String.valueOf(sp >= 0 ? sp : 0));
            if (speedUnitText != null) speedUnitText.setText(Units.speedUnit("km/h"));

            // next-turn navigation: show only while navigating (turn >= 1 == a real maneuver)
            laneStrip.setSnapshot(Gateway.hudLanes);
            int turnT = Gateway.hudTurn;
            if (turnT >= 1) {
                navWrap.setVisibility(View.VISIBLE);
                if (turnT != lastTurn) {                 // reload Waze's arrow drawable only on change
                    lastTurn = turnT;
                    int id = turnDrawable(turnT);
                    if (id != 0) navTurn.setImageResource(id);
                    applyNavTint(turnT);
                }
                navDist.setText(fmtDist(Gateway.hudTurnDist));
                Gateway.refreshNavStreetFromManager();
                String nextStreet = Gateway.hudStreet == null ? "" : Gateway.hudStreet.trim();
                navStreet.setTextColor(AmbientTheme.color(HudActivity.this));
                navStreet.setText(nextStreet);
                navStreet.setVisibility(nextStreet.length() > 0 ? View.VISIBLE : View.GONE);
                int ex = Gateway.hudExit;
                boolean roundabout = turnT >= 6 && turnT <= 15 && ex > 0;
                navTurn.setVisibility(View.VISIBLE);
                if (roundabout) exitNum.setText(String.valueOf(ex));
                exitNum.setVisibility(roundabout ? View.VISIBLE : View.GONE);
            } else {
                navStreet.setText("");
                navStreet.setVisibility(View.GONE);
                navWrap.setVisibility(View.GONE);
            }

            // ETA row: arrival clock · remaining time · remaining distance
            int em = Gateway.hudEtaMin;
            if (useV2) {
                StringBuilder summary = new StringBuilder();
                if (em >= 0) summary.append(fmtMin(em));
                if (Gateway.hudEtaDistM >= 0) {
                    if (summary.length() > 0) summary.append("   ·   ");
                    summary.append(fmtDist(Gateway.hudEtaDistM));
                }
                v2RouteSummary.setText(summary.toString());
                v2RouteSummary.setVisibility(summary.length() > 0 ? View.VISIBLE : View.INVISIBLE);
                String road = Gateway.hudCurStreet == null ? "" : Gateway.hudCurStreet.trim();
                v2RoadName.setText(road);
                v2RoadName.setVisibility(road.length() > 0 ? View.VISIBLE : View.INVISIBLE);
            } else if (em >= 0) {
                eta.setVisibility(View.VISIBLE);
                StringBuilder sb = new StringBuilder();
                String clk = Gateway.hudEtaClock;
                if (clk != null && clk.length() > 0) sb.append(clk);
                if (sb.length() > 0) sb.append("    ·    ");
                sb.append(fmtMin(em));
                if (Gateway.hudEtaDistM >= 0) sb.append("    ·    ").append(fmtDist(Gateway.hudEtaDistM));
                eta.setText(sb.toString());
            } else {
                eta.setVisibility(View.GONE);
            }

            // over-speed: red ring + pulsing red vignette (smooth fade out when back under limit)
            boolean over = lim >= 10 && sp > lim;
            android.content.SharedPreferences visualPrefs =
                    getSharedPreferences("waze_hud_gw", MODE_PRIVATE);
            int overspeedEffectMode = visualPrefs.getInt("hud_overspeed_effect_mode",
                    Vignette.MODE_NONE);
            boolean overspeedEffect = overspeedEffectMode != Vignette.MODE_NONE;
            vignette.setMode(overspeedEffectMode);
            if (useV2) {
                v2Speedometer.setValues(sp, lim, over);
            } else {
                spkRing.setStroke(spkStroke, over ? RING_OVER : RING_OK);
            }
            if (over && overspeedEffect && !pulsing) {
                pulsing = true;
                vignette.setActive(true);
            } else if ((!over || !overspeedEffect) && pulsing) {
                pulsing = false;
                vignette.setActive(false);
            }

            // "cấm vượt" no-passing sign — visible only while inside an average-speed zone
            if (Gateway.avgZone) {
                if (avgSign.getDrawable() == null) {
                    android.graphics.Bitmap nb = Signs.pin(HudActivity.this, "no_passing_in");
                    if (nb != null) avgSign.setImageBitmap(nb);
                }
                avgSign.setVisibility(View.VISIBLE);
            } else if (!useV2) {
                avgSign.setVisibility(View.GONE);
            }

            List<String> a = Gateway.hudAlerts;
            // Select V2's active warning before rebuilding the upcoming rail so
            // one alert type cannot be rendered in both slots at the same time.
            if (useV2) updateV2ActiveAlert();
            String sig = String.valueOf(a) + (useV2 ? "|active=" + v2ActiveKey : "");
            if (!sig.equals(alertsSig)) {                // rebuild rows only when the list changes
                alertsSig = sig;
                rebuildAlerts(a);
            }
            h.postDelayed(this, 500);
        }
    };

    /** Rebuild the compact alert chips: [Waze icon] + meters, side by side. */
    private void rebuildAlerts(List<String> a) {
        alertsBox.removeAllViews();
        if (a == null || a.isEmpty()) return;
        java.util.HashSet<String> seen = new java.util.HashSet<String>();
        int shown = 0;
        int maxShown = portraitHud ? (useV2 ? 2 : 3) : (useV2 ? 3 : 5);
        for (int i = 0; i < a.size() && shown < maxShown; i++) {
            String[] p = a.get(i).split("\t");        // [resolved, name, distText, meters, rawIcon]
            if (p.length < 5 || p[4].length() == 0) continue;
            int dm;
            try { dm = Integer.parseInt(p[3]); } catch (Throwable t) { continue; }
            if (dm < 0 || dm > 2000) continue;                 // within ~2 km
            if (!seen.add(p[4])) continue;                     // one per alert type
            android.graphics.Bitmap bm = Signs.alertIcon(this, p[4]);   // same VietMap mapping as the bubble
            if (bm == null) continue;

            LinearLayout chip = new LinearLayout(this);
            chip.setOrientation(LinearLayout.HORIZONTAL);
            chip.setGravity(Gravity.CENTER_VERTICAL);
            chip.setPadding(dp(6), dp(useV2 ? 7 : 4), dp(11), dp(useV2 ? 7 : 4));
            if (!useV2) {
                GradientDrawable bg = new GradientDrawable();
                bg.setShape(GradientDrawable.RECTANGLE);
                bg.setColor(0xCC14141E);
                bg.setCornerRadius(dp(18));
                chip.setBackground(bg);
            }

            ImageView iv = new ImageView(this);
            iv.setImageBitmap(bm);
            int iconSize = dp(useV2 ? 52 : 32);
            LinearLayout.LayoutParams ip = new LinearLayout.LayoutParams(iconSize, iconSize);
            ip.rightMargin = dp(useV2 ? 10 : 6);
            chip.addView(iv, ip);

            TextView tv = text(useV2 ? 20 : 17, 0xFFEDEDED, Gravity.CENTER, true);
            tv.setText(p[2]);
            chip.addView(tv, mw(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            LinearLayout.LayoutParams cp = mw(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cp.leftMargin = dp(5);
            cp.rightMargin = dp(5);
            if (useV2) {
                cp.topMargin = dp(3);
                cp.bottomMargin = dp(3);
            }
            alertsBox.addView(chip, cp);
            shown++;
        }
    }

    /** V2's lower-left active-warning slot: average-speed zone or parking restriction only.
     *  Camera and speed-drop alerts stay in the right-hand list at every distance. */
    private void updateV2ActiveAlert() {
        String key = "";
        android.graphics.Bitmap bitmap = null;
        if (Gateway.avgZone) {
            key = "avg";
            bitmap = Signs.pin(this, "no_passing_in");
        } else if (Gateway.parkingRestriction > 0) {
            key = "parking:" + Gateway.parkingRestriction;
            bitmap = Signs.pin(this, Gateway.parkingRestriction == 1
                    ? "no_parking" : "no_stopping_and_parking");
        }
        if (key.length() == 0 || bitmap == null) {
            if (v2ActiveKey.length() != 0) {
                v2ActiveKey = "";
                avgSign.setImageDrawable(null);
            }
            avgSign.setVisibility(View.GONE);
            return;
        }
        if (!key.equals(v2ActiveKey)) {
            v2ActiveKey = key;
            avgSign.setImageBitmap(bitmap);
        }
        avgSign.setVisibility(View.VISIBLE);
    }

    /** Load a Waze alert icon, trying alert_icons + skins (with/without "icon_" prefix, @3x/@2x/base). Cached. */
    private android.graphics.Bitmap loadIcon(String name) {
        if (name == null || name.length() == 0) return null;
        if (iconCache.containsKey(name)) return iconCache.get(name);
        String stripped = name.startsWith("icon_") ? name.substring(5) : name;
        String[] bases = name.equals(stripped) ? new String[]{name} : new String[]{name, stripped};
        String[] dirs = {"res/skins/default/alert_icons/", "res/skins/default/"};
        String[] suf = {"@3x", "@2x", ""};
        android.graphics.Bitmap bm = null;
        outer:
        for (String base : bases) {
            for (String dir : dirs) {
                for (String s : suf) {
                    try {
                        java.io.InputStream is = getAssets().open(dir + base + s + ".png");
                        bm = android.graphics.BitmapFactory.decodeStream(is);
                        is.close();
                        if (bm != null) break outer;
                    } catch (Throwable t) { /* try next */ }
                }
            }
        }
        iconCache.put(name, bm);   // cache even null to avoid retrying
        return bm;
    }

    private TextView text(int sizeSp, int color, int gravity, boolean bold) {
        TextView t = new TextView(this);
        t.setTextSize(sizeSp);
        t.setTextColor(color);
        t.setGravity(gravity);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        return t;
    }

    /** Heavier than DEFAULT_BOLD: bold typeface + a paint stroke (~5.5% of the text size). */
    private void extraBold(TextView t) {
        t.setTypeface(Typeface.DEFAULT_BOLD);
        t.getPaint().setStyle(android.graphics.Paint.Style.FILL_AND_STROKE);
        t.getPaint().setStrokeWidth(t.getTextSize() * 0.055f);
    }

    private GradientDrawable oval(int fill, int strokeW, int strokeColor) {
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.OVAL);
        g.setColor(fill);
        g.setStroke(strokeW, strokeColor);
        return g;
    }

    private LinearLayout.LayoutParams mw(int w, int hh) {
        return new LinearLayout.LayoutParams(w, hh);
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    private String fmtDist(int m) {
        if (m < 0) return "";
        String imperial = Units.imperialDistance(m, false);
        if (imperial != null) return imperial;
        if (m < 1000) return m + " m";
        return String.format(Locale.US, "%.1f km", m / 1000.0);
    }

    private String fmtMin(int m) {
        if (m < 0) return "";
        if (m < 60) return I18n.f("core.0_minutes", m);
        return String.format(Locale.US, "%dh%02dm", m / 60, m % 60);
    }

    /** Map a Waze Instruction$Type ordinal to one of Waze's own big_trans_direction_* arrow drawables. */
    private int turnDrawable(int t) {
        String n = HudManeuverAssets.drawableName(t);
        // Resolve against the app's own resource table. On the CLONE the manifest package (applicationId)
        // is renamed (com.chisadin.wazemod) but the resources.arsc package stays "com.waze", so
        // getPackageName() misses -> fall back to the real resource package "com.waze". Fixes missing arrow.
        int id = getResources().getIdentifier(n, "drawable", getPackageName());
        if (id == 0) id = getResources().getIdentifier(n, "drawable", "com.waze");
        return id;
    }

    /** Preserve colored/gradient Waze artwork; only monochrome maneuver arrows need white tint. */
    private void applyNavTint(int turn) {
        boolean preserveArtwork = HudManeuverAssets.preserveArtwork(turn);
        if (preserveArtwork) navTurn.clearColorFilter();
        else navTurn.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);
    }

    @Override
    protected void onDestroy() {
        if (vignette != null) vignette.setActive(false);
        super.onDestroy();
        h.removeCallbacks(tick);
        h.removeCallbacks(resizeRecreate);
    }
}
