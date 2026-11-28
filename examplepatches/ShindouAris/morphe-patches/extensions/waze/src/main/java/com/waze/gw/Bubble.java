package com.waze.gw;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * System-overlay "chat-head" bubble (HORIZONTAL, VietMap-Live style) shown OVER OTHER APPS while
 * Waze navigates in the background. Layout: a "WAZE" brand pill on top, overlapping a horizontal
 * capsule below it that reads [current speed] [speed-limit sign] | [live alert icons + distance].
 * Draggable; tap re-opens Waze. Size user-adjustable (bub_size, up to 200%). Uses
 * SYSTEM_ALERT_WINDOW (already declared by Waze).
 */
final class Bubble {

    private static final String PREFS = "waze_hud_gw";
    private static final int COLOR_BUBBLE_GLASS = 0xBF0E0E14; // 75% opacity
    private static final int COLOR_BRAND_GLASS = COLOR_BUBBLE_GLASS;
    private static final int COLOR_BUBBLE_BORDER = 0xFF364258;
    private static View view;                       // overlay root (null when hidden)
    /** Window content: the bubble itself, or the speed report panel while one is open. */
    private static FrameLayout host;
    private static View bubbleContent;
    private static SpeedReportPanel reportPanel;
    private static View bubbleBody;
    private static TextView dismissTarget;
    private static WindowManager wm;
    private static WindowManager.LayoutParams lp;
    private static TextView spd, limitDash;
    private static TextView spdUnit;   // the "km/h" / "mph" label under spd
    private static TextView gapChip;                // advisory following distance (when xADAS is not measuring)
    private static GapGaugeView gapGauge;           // xADAS measured gap
    private static boolean gapShown;
    private static GpsSignalView gpsSignal;
    private static ImageView limitImg;
    private static FrameLayout limitStack;
    private static TextView minimumLimit;
    private static boolean minimumShown;
    private static int limitBaseSize, minimumDiameter, minimumLeft, minimumTop, minimumSafePadding;
    private static ImageView avgImg;                // "cấm vượt" no-passing sign, visible only inside an average-speed zone
    private static ImageView parkingImg;             // cấm dừng/đỗ sign, gated by parkingRestriction
    private static LinearLayout navWrap;             // next-turn arrow + distance + next street; hidden when not navigating
    private static ImageView navTurn;
    private static TextView navDist, navStreet, navExit;
    private static LaneGuidanceStrip laneStrip;
    private static View lanePanel;                 // vertical layout only: detached lane capsule
    // Vertical layout only: lane capsule + no-passing + no-parking signs live in their own overlay window beside the
    // column, so the empty space around them is not part of any window and touches there reach the app underneath.
    private static LinearLayout sideRow;
    private static WindowManager.LayoutParams sideLp;
    private static boolean sideAttached;
    private static int lastTurn = Integer.MIN_VALUE;
    private static boolean navShown, navStreetShown;
    private static boolean avgShown;                // last-applied avgImg visibility (re-measure the window on change)
    private static LinearLayout alertsCol;          // live list of warnings (icon + distance), grows rightward
    private static BubbleAlertRailView alertRailV2;
    private static String alertsSig = "";
    private static float dens, scale;               // device density, user size factor
    private static int bubbleLayout;                // 0 = extended horizontal, 1 = vertical, 2 = basic, 3 = info panel
    private static boolean verticalLayout;
    private static boolean basicLayout;
    private static boolean infoLayout;
    // Info panel only: lane strip on top, alerts | road notices row, then [next turn | limit + speed].
    private static LinearLayout infoRow, noticeGroup;
    private static View infoLine, noticeDivider;
    private static ImageView schoolImg;
    private static TextView navIdle;                // "--" in the turn cell while not navigating
    private static TextView nextStreet;             // street the next turn leads onto, under the turn
    private static final int INFO_WIDTH_DP = 272;
    private static final int SCHOOL_ACTIVE_M = 30;  // a school-zone alert this close counts as "inside"
    private static final Handler h = new Handler(Looper.getMainLooper());
    private static boolean dismissedForAppSession;

    /** WindowManager does NOT reliably re-measure a WRAP_CONTENT overlay when its content grows
     *  (it silently keeps the first-measured size — the "locked width" bug). So instead of leaving
     *  lp.width/height as WRAP_CONTENT, we measure the tree ourselves on every content change and
     *  push the real pixel size into lp before calling updateViewLayout. */
    private static final Runnable resizeR = new Runnable() {
        @Override public void run() {
            try {
                if (view == null) return;
                view.measure(
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                lp.width = view.getMeasuredWidth();
                lp.height = view.getMeasuredHeight();
                boolean corrected = clampPosition();
                wm.updateViewLayout(view, lp);
                layoutSide();
                if (corrected) savePosition(view.getContext());
            } catch (Throwable t) { }
        }
    };

    // foreground tracking: the bubble only appears while Waze (map / HUD / settings) is NOT on screen
    private static boolean lifecycleReady;
    private static int startedActivities;

    /** True while any of Waze's own screens is on screen (the app is not in the background). */
    static boolean appStarted() { return startedActivities > 0; }

    /** Register foreground/background tracking once so the bubble auto-hides while Waze is visible. */
    static void installAutoHide(Context ctx) {
        if (!Gateway.modEnabled(ctx)) return;
        // Start while a Waze activity is still foreground. Android 12+ may reject a new
        // foreground service if we wait until after the app has already moved to background.
        BubbleKeepAliveService.sync(ctx);
        if (lifecycleReady) return;
        try {
            final Application app = (Application) ctx.getApplicationContext();
            // Registration happens after the current Waze activity has already reached onStart(),
            // so seed the counter with that foreground activity. Starting at 0 makes its later
            // onStop() decrement to -1 and the background bubble is never shown.
            startedActivities = 1;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                private final Handler hh = new Handler(Looper.getMainLooper());
                private Runnable pendingShow;

                @Override public void onActivityStarted(Activity a) {
                    cancelPendingShow();
                    dismissedForAppSession = false;
                    startedActivities++;
                    hide();                         // never trust a possibly under-counted late registration
                    FloatMap.onAnyActivityStarted();
                }
                @Override public void onActivityStopped(Activity a) {
                    startedActivities = Math.max(0, startedActivities - 1);
                    if (startedActivities == 0) {
                        cancelPendingShow();
                        pendingShow = () -> {
                            boolean enabled = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                                    .getBoolean("bubble", false);
                            // A late-registered lifecycle counter can briefly reach zero while another
                            // Waze activity is already resumed. The process state is the final guard.
                            boolean foreground = isProcessForeground();
                            if (enabled && !foreground && !dismissedForAppSession)
                                show(app);
                            else if (foreground)
                                hide();
                            pendingShow = null;
                        };
                        hh.postDelayed(pendingShow, 700);
                    }
                }
                private void cancelPendingShow() {
                    if (pendingShow != null) {
                        hh.removeCallbacks(pendingShow);
                        pendingShow = null;
                    }
                }
                private boolean isProcessForeground() {
                    try {
                        android.app.ActivityManager.RunningAppProcessInfo state =
                                new android.app.ActivityManager.RunningAppProcessInfo();
                        android.app.ActivityManager.getMyMemoryState(state);
                        return state.importance ==
                                android.app.ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND;
                    } catch (Throwable t) {
                        return startedActivities > 0;
                    }
                }
                @Override public void onActivityCreated(Activity a, Bundle b) { }
                @Override public void onActivityResumed(Activity a) {
                    cancelPendingShow();
                    hide();
                    if (!isMapScreen(a)) FloatMap.onOtherScreenResumed();
                }
                @Override public void onActivityPaused(Activity a) {
                    if (!isMapScreen(a)) FloatMap.onOtherScreenPaused();
                }
                private boolean isMapScreen(Activity a) {
                    return "com.waze.MainActivity".equals(a.getClass().getName());
                }
                @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
                @Override public void onActivityDestroyed(Activity a) { }
            });
            lifecycleReady = true;
        } catch (Throwable ignored) { /* ignore */ }
    }

    static boolean canShow(Context c) {
        return Gateway.modEnabled(c)
                && (Build.VERSION.SDK_INT < 23 || Settings.canDrawOverlays(c));
    }

    /** Open the system "display over other apps" permission screen for this package. */
    static void requestPermission(Context c) {
        try {
            Intent i = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                    Uri.parse("package:" + c.getPackageName()));
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            c.startActivity(i);
        } catch (Throwable t) { /* ignore */ }
    }

    static synchronized void show(Context ctx) {
        try {
            if (!Gateway.modEnabled(ctx)) { hide(); return; }
            if (view != null) return;                       // already showing
            final Context c = ctx.getApplicationContext();
            if (!canShow(c)) return;
            wm = (WindowManager) c.getSystemService(Context.WINDOW_SERVICE);
            dens = c.getResources().getDisplayMetrics().density;
            android.content.SharedPreferences p = c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            int bs = p.getInt("bub_size", 100);
            scale = Math.max(0.8f, Math.min(2.0f, bs / 100f));
            FloatMap.migrate(c);                             // old layout 4 (floating map) became a switch
            bubbleLayout = p.getInt("bubble_layout", 0);
            if (FloatMap.active()) { hide(); return; }       // the floating map is showing: no bubble on top of it
            verticalLayout = bubbleLayout == 1;
            basicLayout = bubbleLayout == 2;
            infoLayout = bubbleLayout == 3;

            bubbleContent = build(c);
            // The window hosts either the bubble or the speed report panel, so wrap the bubble.
            host = new FrameLayout(c);
            host.setClipChildren(false);
            host.setClipToPadding(false);
            gapChip = new TextView(c);
            gapChip.setTextColor(0xFFFFFFFF);
            gapChip.setTypeface(Typeface.DEFAULT_BOLD);
            gapChip.setTextSize(15f * scale);
            gapChip.setGravity(Gravity.CENTER);
            gapChip.setPadding(px(10), px(3), px(10), px(3));
            gapChip.setVisibility(View.GONE);
            gapShown = false;
            gapGauge = new GapGaugeView(c, GapGaugeView.Surface.BUBBLE, true, px(64));
            gapGauge.setEmbedded(true);
            gapGauge.setListener(new GapGaugeView.Listener() {
                @Override public void onVisibilityChanged(boolean visible) {
                    updateGapChip();
                    if (view != null) view.post(resizeR);
                }
            });
            attachGapViews();
            host.addView(bubbleContent, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            view = host;
            alertsSig = null;            // force the first fillAlerts even when the list starts empty (placeholder)

            int type = Build.VERSION.SDK_INT >= 26
                    ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                    : WindowManager.LayoutParams.TYPE_PHONE;
            lp = new WindowManager.LayoutParams(
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.WRAP_CONTENT, type,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                            | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                            | WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
                            | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                    PixelFormat.TRANSLUCENT);
            lp.gravity = Gravity.TOP | Gravity.START;
            lp.x = p.getInt("bub_x", (int) (10 * dens));
            lp.y = p.getInt("bub_y", (int) (150 * dens));
            wm.addView(view, lp);
            setupTouch(c);
            tick.run();
            view.post(resizeR);                              // sizes the main window and places the side window
        } catch (Throwable t) { view = null; }
    }

    /** The floating map went away because the drive ended: show the bubble as if Waze had just been left. */
    static synchronized void onFloatMapEnded(Context ctx) {
        try {
            Context app = ctx.getApplicationContext();
            boolean enabled = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean("bubble", false);
            if (enabled && startedActivities == 0 && !dismissedForAppSession) show(app);
        } catch (Throwable ignored) { }
    }

    static synchronized void hide() {
        try { h.removeCallbacks(tick); } catch (Throwable t) { }
        hideDismissTarget();
        SpeedReportPanel panel = reportPanel;
        reportPanel = null;
        if (panel != null) panel.dispose();          // hidden mid-report: cancel, never auto-submit
        detachSide();
        sideRow = null;
        try { if (wm != null && view != null) wm.removeView(view); } catch (Throwable t) { }
        view = null;
        host = null;
        bubbleContent = null;
        gapChip = null;
        gapGauge = null;
        gapShown = false;
    }

    // ---------------- side window (vertical layout) ----------------

    private static boolean sideHasContent() {
        if (sideRow == null) return false;
        for (int i = 0; i < sideRow.getChildCount(); i++) {
            if (sideRow.getChildAt(i).getVisibility() == View.VISIBLE) return true;
        }
        return false;
    }

    private static void detachSide() {
        if (!sideAttached) return;
        sideAttached = false;
        try { if (wm != null && sideRow != null) wm.removeView(sideRow); } catch (Throwable ignored) { }
    }

    /** Size and place the side window next to the main one; it exists only while it has something to show. */
    private static void layoutSide() {
        try {
            if (sideRow == null || wm == null || view == null || lp == null) return;
            if (!sideHasContent()) { detachSide(); return; }
            sideRow.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            int sw = sideRow.getMeasuredWidth(), sh = sideRow.getMeasuredHeight();
            if (sw <= 0 || sh <= 0) { detachSide(); return; }
            Point display = new Point();
            wm.getDefaultDisplay().getSize(display);
            int mainW = lp.width > 0 ? lp.width : Math.max(view.getWidth(), view.getMeasuredWidth());
            int gap = px(8);
            // Free side of the column: left when the bubble sits in the right half of the screen.
            boolean left = lp.x + mainW / 2 > display.x / 2;
            if (left && lp.x - gap - sw < 0) left = false;
            else if (!left && lp.x + mainW + gap + sw > display.x) left = lp.x - gap - sw >= 0;
            int x = left ? lp.x - gap - sw : lp.x + mainW + gap;
            int y = lp.y + px(7);
            if (sideLp == null) {
                sideLp = new WindowManager.LayoutParams(sw, sh,
                        Build.VERSION.SDK_INT >= 26 ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                                : WindowManager.LayoutParams.TYPE_PHONE,
                        WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                                | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                                | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                        PixelFormat.TRANSLUCENT);
                sideLp.gravity = Gravity.TOP | Gravity.START;
            }
            sideLp.width = sw;
            sideLp.height = sh;
            sideLp.x = x;
            sideLp.y = y;
            if (sideAttached) wm.updateViewLayout(sideRow, sideLp);
            else { wm.addView(sideRow, sideLp); sideAttached = true; }
        } catch (Throwable ignored) { }
    }

    // ---------------- speed limit report ----------------

    /** Tapping the speed-limit sign turns the bubble into the "Báo lỗi tốc độ giới hạn" panel. */
    private static void startSpeedReport(Context c) {
        if (view == null || host == null || bubbleContent == null || reportPanel != null) return;
        try {
            Point display = new Point();
            wm.getDefaultDisplay().getSize(display);
            // Scale with the bubble size factor, but never wider than the screen.
            float fit = (display.x - 16f * dens) / (SpeedReportPanel.DESIGN_WIDTH_DP * dens);
            float unit = dens * Math.max(0.7f, Math.min(scale, fit));
            Gateway.beginSpeedReport();        // capture the report location now, submit later
            SpeedReportPanel panel = new SpeedReportPanel(c, unit, new SpeedReportPanel.Callback() {
                @Override public void onFinished(int correctKmh, boolean submit) {
                    endSpeedReport(correctKmh, submit);
                }
            });
            reportPanel = panel;
            bubbleContent.setVisibility(View.GONE);
            if (gapGauge != null) gapGauge.setSuppressed(true);
            host.addView(panel, new FrameLayout.LayoutParams(panel.widthPx(),
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            view.post(resizeR);
            panel.start();
        } catch (Throwable error) {
            reportPanel = null;
            if (bubbleContent != null) bubbleContent.setVisibility(View.VISIBLE);
        }
    }

    /** Back to the bubble; on Send or timeout the report is filed. Cancel files nothing. */
    private static void endSpeedReport(int correctKmh, boolean submit) {
        SpeedReportPanel panel = reportPanel;
        if (panel == null) return;
        reportPanel = null;
        panel.dispose();
        try {
            if (host != null) host.removeView(panel);
            if (bubbleContent != null) bubbleContent.setVisibility(View.VISIBLE);
            if (gapGauge != null) gapGauge.setSuppressed(false);
            if (view != null) view.post(resizeR);
        } catch (Throwable ignored) { }
        if (submit) Gateway.submitSpeedReport(correctKmh == SpeedReportPanel.UNKNOWN ? -1 : correctKmh);
    }

    private static boolean speedReportEnabled(Context c) {
        return c.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean("bubble_speed_report", true);
    }

    /** Is this tap on the speed-limit sign? Screen coordinates, so dragging from the sign still works. */
    private static boolean hitLimitSign(MotionEvent e) {
        FrameLayout sign = limitStack;
        if (sign == null || sign.getVisibility() != View.VISIBLE || sign.getWidth() <= 0) return false;
        int[] xy = new int[2];
        sign.getLocationOnScreen(xy);
        float x = e.getRawX();
        float y = e.getRawY();
        return x >= xy[0] && x <= xy[0] + sign.getWidth() && y >= xy[1] && y <= xy[1] + sign.getHeight();
    }

    static synchronized boolean isShowing() {
        return view != null;
    }

    /** Rebuild at the current size (called when the size slider changes). */
    static synchronized void refresh() {
        if (!Gateway.modEnabled()) { hide(); return; }
        if (view == null) return;
        Context c = view.getContext();
        hide();
        show(c);
    }

    private interface NumberFormat { String of(int value); }

    private static final NumberFormat PLAIN_NUMBER = new NumberFormat() {
        @Override public String of(int value) { return String.valueOf(value); }
    };

    /** Counts a TextView from its shown number to a new one over a moment, instead of swapping it at once. */
    private static final class NumberTween {
        private static final int NONE = Integer.MIN_VALUE;
        private int shown = NONE;
        private android.animation.ValueAnimator anim;

        void set(final TextView tv, final int target, final NumberFormat format) {
            if (target == shown) return;
            if (anim != null) { anim.cancel(); anim = null; }
            final int from = shown;
            shown = target;
            if (from == NONE || Math.abs(target - from) < 2) {      // first value or a tiny step: no animation
                tv.setText(format.of(target));
                return;
            }
            android.animation.ValueAnimator a = android.animation.ValueAnimator.ofInt(from, target);
            a.setDuration(280);
            a.setInterpolator(new android.view.animation.DecelerateInterpolator());
            a.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {
                @Override public void onAnimationUpdate(android.animation.ValueAnimator va) {
                    tv.setText(format.of((Integer) va.getAnimatedValue()));
                }
            });
            a.addListener(new android.animation.AnimatorListenerAdapter() {
                @Override public void onAnimationEnd(android.animation.Animator animation) {
                    if (anim == animation) { anim = null; tv.setText(format.of(target)); }
                }
            });
            anim = a;
            a.start();
        }

        void reset() {
            if (anim != null) { anim.cancel(); anim = null; }
            shown = NONE;
        }
    }

    private static final NumberTween speedTween = new NumberTween();
    private static final NumberTween turnDistTween = new NumberTween();

    private static final Runnable tick = new Runnable() {
        @Override public void run() {
            try {
                final Context c = view.getContext();
                int s = Gateway.hudSpeed, l = Gateway.hudLimit;
                ModTypeface.fitSpeed(spd, s,
                        (verticalLayout ? 29f : 30f) * scale,
                        (verticalLayout ? 24f : 25f) * scale);
                speedTween.set(spd, s >= 0 ? s : 0, PLAIN_NUMBER);
                if (spdUnit != null) spdUnit.setText(Units.speedUnit("km/h"));
                boolean overspeed = l >= 10 && s > l;
                spd.setTextColor(overspeed ? 0xFFFF4D4D : 0xFFFFFFFF);
                updateOverspeedBackground(overspeed);
                if (gpsSignal != null) gpsSignal.setLevel(Gateway.gpsSignalLevel());
                updateGapChip();

                // speed-limit sign, else white-circle "–" placeholder
                Bitmap sign = Signs.limitFor(c, l);
                if (sign != null) { limitImg.setImageBitmap(sign); limitImg.setVisibility(View.VISIBLE); limitDash.setVisibility(View.GONE); }
                else { limitDash.setVisibility(View.VISIBLE); limitImg.setVisibility(View.GONE); }

                int min = Gateway.minimumSpeedLimit;
                boolean showMinimum = min >= 10 && min <= 160;
                if (showMinimum) {
                    ModTypeface.fitSpeed(minimumLimit, min,
                            (infoLayout ? 14f : 18f) * scale, (infoLayout ? 11f : 15f) * scale);
                    minimumLimit.setText(String.valueOf(min));
                }
                minimumLimit.setVisibility(showMinimum ? View.VISIBLE : View.GONE);
                if (showMinimum != minimumShown) {
                    minimumShown = showMinimum;
                    LinearLayout.LayoutParams p =
                            (LinearLayout.LayoutParams) limitStack.getLayoutParams();
                    p.width = showMinimum
                            ? Math.max(limitBaseSize,
                                    minimumLeft + minimumDiameter + minimumSafePadding)
                            : limitBaseSize;
                    p.height = showMinimum
                            ? Math.max(limitBaseSize,
                                    minimumTop + minimumDiameter + minimumSafePadding)
                            : limitBaseSize;
                    limitStack.setLayoutParams(p);
                    view.post(resizeR);
                }

                // immediate turn guidance. Reuse Waze's own maneuver drawables and hide the whole block
                // when guidance is inactive so the original bubble dimensions remain unchanged.
                boolean laneChanged = laneStrip.setSnapshot(Gateway.hudLanes);
                if (lanePanel != null) {
                    int visibility = Gateway.hudLanes.size() > 0 ? View.VISIBLE : View.GONE;
                    if (lanePanel.getVisibility() != visibility) {
                        lanePanel.setVisibility(visibility);
                        laneChanged = true;
                    }
                }
                if (laneChanged) view.post(resizeR);
                int turn = Gateway.hudTurn;
                boolean showNav = turn >= 1;
                if (showNav) {
                    if (turn != lastTurn) {
                        boolean firstArrow = lastTurn == Integer.MIN_VALUE;
                        lastTurn = turn;
                        int id = turnDrawable(c, turn);
                        if (id != 0) navTurn.setImageResource(id); else navTurn.setImageDrawable(null);
                        applyNavTint(turn);
                        turnDistTween.reset();            // a new maneuver restarts the distance from its own value
                        if (!firstArrow) {                // the new arrow slides up into place
                            navTurn.animate().cancel();
                            navTurn.setAlpha(0f);
                            navTurn.setTranslationY(px(9));
                            navTurn.animate().alpha(1f).translationY(0f).setDuration(240)
                                    .setInterpolator(new android.view.animation.DecelerateInterpolator()).start();
                        }
                    }
                    int turnMeters = Gateway.hudTurnDist;
                    if (turnMeters >= 0 && turnMeters < 1000) {
                        turnDistTween.set(navDist, turnMeters, new NumberFormat() {
                            @Override public String of(int v) {
                                String d = fmtTurnDist(v);
                                return infoLayout ? compactDistance(d) : d;
                            }
                        });
                    } else {
                        turnDistTween.reset();
                        String turnDist = fmtTurnDist(turnMeters);
                        navDist.setText(infoLayout ? compactDistance(turnDist) : turnDist);
                    }
                    String street = Gateway.hudStreet == null ? "" : Gateway.hudStreet.trim();
                    navStreet.setTextColor(AmbientTheme.color(c));
                    navStreet.setText(street);
                    boolean hasStreet = street.length() > 0;
                    navStreet.setVisibility(hasStreet ? View.VISIBLE : View.GONE);
                    if (hasStreet != navStreetShown) {
                        navStreetShown = hasStreet;
                        view.post(resizeR);
                    }
                    int ex = Gateway.hudExit;
                    boolean roundabout = turn >= 6 && turn <= 15 && ex > 0;
                    navTurn.setVisibility(View.VISIBLE);
                    if (roundabout) navExit.setText(String.valueOf(ex));
                    navExit.setVisibility(roundabout ? View.VISIBLE : View.GONE);
                }
                navWrap.setVisibility(showNav ? View.VISIBLE : View.GONE);
                if (navIdle != null) navIdle.setVisibility(showNav ? View.GONE : View.VISIBLE);
                if (nextStreet != null) {
                    // The street the next turn leads onto; only meaningful while navigating.
                    String road = !showNav || Gateway.hudStreet == null
                            ? "" : Gateway.hudStreet.trim();
                    nextStreet.setText(road);
                    nextStreet.setVisibility(road.length() > 0 ? View.VISIBLE : View.GONE);
                }
                if (showNav != navShown) {
                    navShown = showNav;
                    view.post(resizeR);
                }

                // "cấm vượt" no-passing sign — only while inside an average-speed zone
                boolean az = Gateway.avgZone;
                if (az && avgImg.getDrawable() == null) {
                    Bitmap nb = Signs.pin(c, "no_passing_in");
                    if (nb != null) avgImg.setImageBitmap(nb);
                }
                avgImg.setVisibility(az ? View.VISIBLE : View.GONE);
                if (az != avgShown) { avgShown = az; view.post(resizeR); }

                // parking/stopping-restriction sign
                int pr = Gateway.parkingRestriction;
                if (pr > 0 && parkingImg.getDrawable() == null) {
                    String name = pr == 1 ? "no_parking" : "no_stopping_and_parking";
                    Bitmap nb = Signs.pin(c, name);
                    if (nb != null) parkingImg.setImageBitmap(nb);
                }
                parkingImg.setVisibility(pr > 0 ? View.VISIBLE : View.GONE);

                // V2 uses the distance rail in either orientation; V1 keeps its icon list.
                java.util.List<UpcomingAlertModel.Entry> al = alertsList();
                StringBuilder sb = new StringBuilder();
                for (UpcomingAlertModel.Entry it : al)
                    sb.append(it.key()).append('@').append(it.meters).append(';');
                if (infoLayout) sb.append(az).append(pr);   // notice count decides how many alerts fit
                String sig = sb.toString();
                if (!sig.equals(alertsSig)) {
                    alertsSig = sig;
                    if (infoLayout) {
                        fillInfoAlerts(c, al);
                        view.post(resizeR);
                    } else if (alertRailV2 != null) alertRailV2.setEntries(al);
                    else {
                        fillAlerts(c, al);
                        view.post(resizeR);
                    }
                }
                if (infoLayout) updateInfoRow();
            } catch (Throwable t) { /* ignore */ }
            h.postDelayed(this, 500);
        }
    };

    private static final int MAX_ALERT_M = 2000;    // only show warnings within ~2 km (skip far look-aheads)

    private static java.util.List<UpcomingAlertModel.Entry> alertsList() {
        return UpcomingAlertModel.select(Gateway.hudAlerts, Gateway.hudLimit,
                alertRailV2 == null ? MAX_ALERT_M : 1000,
                alertRailV2 == null ? 4 : 3);
    }

    /** Build the warning row: each = round icon + distance in metres, laid out LEFT TO RIGHT. When empty,
     *  a single white-circle placeholder with "–" keeps the layout from collapsing after the separator. */
    private static void fillAlerts(Context c, java.util.List<UpcomingAlertModel.Entry> items) {
        alertsCol.removeAllViews();
        boolean any = false;
        java.util.HashSet<String> now = new java.util.HashSet<String>();
        for (UpcomingAlertModel.Entry it : items) {
            Bitmap bm = Signs.alertIcon(c, it.rawIcon);
            if (bm == null) continue;
            LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (any) {
                if (verticalLayout) p.topMargin = px(8);
                else p.leftMargin = px(10);
            }
            View item = alertItem(c, bm, it.distance);
            if (alertsPopulated && !shownAlertKeys.contains(it.key())) popIn(item);   // only the new one animates
            now.add(it.key());
            alertsCol.addView(item, p);
            any = true;
        }
        if (!any) alertsCol.addView(alertItem(c, null, "–"));   // no alerts -> placeholder
        alertsCol.setVisibility(View.VISIBLE);
        shownAlertKeys = now;
        alertsPopulated = true;
    }

    /** Alerts the strip already shows; a key that is not in here yet is a newly appended alert. */
    private static java.util.HashSet<String> shownAlertKeys = new java.util.HashSet<String>();
    private static boolean alertsPopulated;                   // false until the strip has been filled once

    /** A new alert pops in: fades up from a smaller size with a soft overshoot. */
    private static void popIn(View item) {
        item.setAlpha(0f);
        item.setScaleX(0.55f);
        item.setScaleY(0.55f);
        item.animate().alpha(1f).scaleX(1f).scaleY(1f).setDuration(340)
                .setInterpolator(new android.view.animation.OvershootInterpolator(1.6f)).start();
    }

    /** One warning item: icon (or a white-circle placeholder when bm==null) + distance text underneath. */
    private static View alertItem(Context c, Bitmap bm, String dist) {
        LinearLayout item = new LinearLayout(c);
        item.setOrientation(LinearLayout.VERTICAL);
        item.setGravity(Gravity.CENTER_HORIZONTAL);
        int isz = px(verticalLayout ? 42 : 38);
        if (bm != null) {
            ImageView iv = new ImageView(c);                 // v2 icons are already round badges
            iv.setImageBitmap(bm);
            item.addView(iv, new LinearLayout.LayoutParams(isz, isz));
        } else {
            TextView ph = new TextView(c);                   // placeholder circle, like the speed-limit one
            GradientDrawable g = new GradientDrawable();
            g.setShape(GradientDrawable.OVAL);
            g.setColor(0xFFEDEDED);
            g.setStroke(px(3), 0xFFB0B0B0);
            ph.setBackground(g);
            item.addView(ph, new LinearLayout.LayoutParams(isz, isz));
        }
        TextView dt = new TextView(c);                       // distance in metres (or "–" for the placeholder)
        dt.setText(dist);
        dt.setTextColor(0xFFDDE2E6);
        dt.setTextSize(10 * scale);
        dt.setTypeface(Typeface.DEFAULT_BOLD);
        dt.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams dtp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        dtp.topMargin = px(verticalLayout ? 1 : 2);
        item.addView(dt, dtp);
        return item;
    }


    // ---------------- info panel (layout 3) ----------------

    /** "750 m" -> "750M", "1.2 km" -> "1.2KM": the panel's compact, upper-case distance style. */
    private static String compactDistance(String distance) {
        return distance == null ? "" : distance.replace(" ", "").toUpperCase(java.util.Locale.US);
    }

    /**
     * Left group of the info row: up to three alerts, each icon + compact distance. A school-zone
     * alert that is already on top of us is a notice, so it moves to the right-hand notice group.
     * Fewer alerts fit when notices are showing, which keeps the panel at its fixed width.
     */
    private static void fillInfoAlerts(Context c, java.util.List<UpcomingAlertModel.Entry> items) {
        alertsCol.removeAllViews();
        int notices = (Gateway.avgZone ? 1 : 0) + (Gateway.parkingRestriction > 0 ? 1 : 0);
        boolean school = false;
        for (UpcomingAlertModel.Entry it : items) {
            if (isActiveSchoolZone(it)) {
                Bitmap bm = Signs.alertIcon(c, it.rawIcon);
                if (bm != null && schoolImg != null) {
                    schoolImg.setImageBitmap(bm);
                    school = true;
                }
            }
        }
        if (school) notices++;
        int maxAlerts = notices > 0 ? 2 : 3;
        int shown = 0;
        java.util.HashSet<String> now = new java.util.HashSet<String>();
        for (UpcomingAlertModel.Entry it : items) {
            if (shown >= maxAlerts) break;
            if (isActiveSchoolZone(it)) continue;
            Bitmap bm = Signs.alertIcon(c, it.rawIcon);
            if (bm == null) continue;
            LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (shown > 0) p.leftMargin = px(8);
            View item = infoAlertItem(c, bm, compactDistance(it.distance));
            if (alertsPopulated && !shownAlertKeys.contains(it.key())) popIn(item);
            now.add(it.key());
            alertsCol.addView(item, p);
            shown++;
        }
        shownAlertKeys = now;
        alertsPopulated = true;
        if (schoolImg != null) schoolImg.setVisibility(school ? View.VISIBLE : View.GONE);
    }

    private static boolean isActiveSchoolZone(UpcomingAlertModel.Entry it) {
        return it.rawIcon != null && it.meters <= SCHOOL_ACTIVE_M
                && it.rawIcon.toLowerCase(java.util.Locale.US).contains("school_zone");
    }

    private static View infoAlertItem(Context c, Bitmap bm, String dist) {
        LinearLayout item = new LinearLayout(c);
        item.setOrientation(LinearLayout.HORIZONTAL);
        item.setGravity(Gravity.CENTER_VERTICAL);
        ImageView iv = new ImageView(c);
        iv.setImageBitmap(bm);
        item.addView(iv, new LinearLayout.LayoutParams(px(30), px(30)));
        TextView dt = new TextView(c);
        dt.setText(dist);
        dt.setTextColor(0xFFFFFFFF);
        dt.setTextSize(15 * scale);
        dt.setIncludeFontPadding(false);
        dt.setSingleLine(true);
        ModTypeface.applySpeed(dt);
        LinearLayout.LayoutParams dtp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        dtp.leftMargin = px(4);
        item.addView(dt, dtp);
        return item;
    }

    /** Show/hide the alert row, its dashed divider and the line under the top sections. */
    private static void updateInfoRow() {
        if (infoRow == null) return;
        boolean alerts = alertsCol.getChildCount() > 0;
        boolean notices = avgImg.getVisibility() == View.VISIBLE
                || parkingImg.getVisibility() == View.VISIBLE
                || schoolImg.getVisibility() == View.VISIBLE;
        boolean lanes = lanePanel != null && lanePanel.getVisibility() == View.VISIBLE;
        boolean changed = setVisible(infoRow, alerts || notices);
        changed |= setVisible(noticeGroup, notices);
        changed |= setVisible(noticeDivider, alerts && notices);
        changed |= setVisible(infoLine, alerts || notices || lanes);
        if (changed) view.post(resizeR);
    }

    private static boolean setVisible(View v, boolean visible) {
        int target = visible ? View.VISIBLE : View.GONE;
        if (v.getVisibility() == target) return false;
        v.setVisibility(target);
        return true;
    }

    /**
     * Info panel: brand tab, then a fixed-width body with [lane strip] / [alerts | road notices] /
     * a line / [next turn | limit sign + speed]. The lane strip and the alert row disappear when
     * empty so the panel shrinks to its two lower cells.
     */
    private static View buildInfo(Context c) {
        LinearLayout root = new LinearLayout(c);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER_HORIZONTAL);
        root.setClipChildren(false);
        root.setClipToPadding(false);

        LinearLayout body = new LinearLayout(c);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setBackground(roundBorder(COLOR_BUBBLE_GLASS, px(22)));
        body.setPadding(px(8), px(8), px(8), px(6));
        bubbleBody = body;
        root.addView(brandTabHorizontal(c), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(body, new LinearLayout.LayoutParams(
                px(INFO_WIDTH_DP), ViewGroup.LayoutParams.WRAP_CONTENT));

        // Lane guidance on a blue panel (hidden until Waze reports lanes).
        FrameLayout lane = new FrameLayout(c);
        GradientDrawable laneBg = new GradientDrawable();
        laneBg.setColor(0xFF2389E3);
        laneBg.setCornerRadius(px(12));
        laneBg.setStroke(Math.max(1, px(2)), 0xFF63A9F0);
        lane.setBackground(laneBg);
        lane.setPadding(px(8), px(3), px(8), px(3));
        lane.setVisibility(View.GONE);
        laneStrip = new LaneGuidanceStrip(c);
        lane.addView(laneStrip, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, px(38)));
        LinearLayout.LayoutParams laneLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        laneLp.bottomMargin = px(6);
        body.addView(lane, laneLp);
        lanePanel = lane;

        // Alerts on the left, then a dashed divider and the road notices in force on the right.
        infoRow = new LinearLayout(c);
        infoRow.setOrientation(LinearLayout.HORIZONTAL);
        infoRow.setGravity(Gravity.CENTER_VERTICAL);
        infoRow.setVisibility(View.GONE);
        alertsCol = new LinearLayout(c);
        alertsCol.setOrientation(LinearLayout.HORIZONTAL);
        alertsCol.setGravity(Gravity.CENTER_VERTICAL);
        infoRow.addView(alertsCol, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        noticeDivider = new DashedDivider(c);
        noticeDivider.setVisibility(View.GONE);
        LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                Math.max(2, px(2)), px(30));
        divLp.leftMargin = px(6);
        divLp.rightMargin = px(8);
        infoRow.addView(noticeDivider, divLp);
        noticeGroup = new LinearLayout(c);
        noticeGroup.setOrientation(LinearLayout.HORIZONTAL);
        noticeGroup.setGravity(Gravity.CENTER_VERTICAL);
        noticeGroup.setVisibility(View.GONE);
        avgImg = noticeIcon(c);
        parkingImg = noticeIcon(c);
        schoolImg = noticeIcon(c);
        noticeGroup.addView(avgImg, noticeLp(false));
        noticeGroup.addView(parkingImg, noticeLp(true));
        noticeGroup.addView(schoolImg, noticeLp(true));
        infoRow.addView(noticeGroup);
        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, px(36));
        rowLp.bottomMargin = px(6);
        body.addView(infoRow, rowLp);

        infoLine = new View(c);
        infoLine.setBackgroundColor(0xB3FFFFFF);
        infoLine.setVisibility(View.GONE);
        body.addView(infoLine, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, (int) (1.5f * scale))));

        LinearLayout bottom = new LinearLayout(c);
        bottom.setOrientation(LinearLayout.HORIZONTAL);
        bottom.setGravity(Gravity.CENTER_VERTICAL);
        bottom.addView(infoTurnCell(c), new LinearLayout.LayoutParams(0, px(88), 1f));
        View vline = new View(c);
        vline.setBackgroundColor(0xB3FFFFFF);
        bottom.addView(vline, new LinearLayout.LayoutParams(
                Math.max(1, (int) (1.5f * scale)), ViewGroup.LayoutParams.MATCH_PARENT));
        bottom.addView(infoSpeedCell(c), new LinearLayout.LayoutParams(0, px(88), 1f));
        body.addView(bottom, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return root;
    }

    private static ImageView noticeIcon(Context c) {
        ImageView iv = new ImageView(c);
        iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
        iv.setVisibility(View.GONE);
        return iv;
    }

    private static LinearLayout.LayoutParams noticeLp(boolean gap) {
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(px(30), px(30));
        if (gap) p.leftMargin = px(6);
        return p;
    }

    /** Left cell: next-turn arrow and compact distance, or "--" while not navigating. */
    private static View infoTurnCell(Context c) {
        FrameLayout cell = new FrameLayout(c);
        navWrap = new LinearLayout(c);
        navWrap.setOrientation(LinearLayout.HORIZONTAL);
        navWrap.setGravity(Gravity.CENTER_VERTICAL);
        navWrap.setVisibility(View.GONE);

        int arrowSize = px(38);
        FrameLayout arrow = new FrameLayout(c);
        navTurn = new ImageView(c);
        navTurn.setScaleType(ImageView.ScaleType.FIT_CENTER);
        navTurn.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);
        arrow.addView(navTurn, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        navExit = new TextView(c);
        navExit.setTextColor(0xFFFFFFFF);
        navExit.setTextSize(12 * scale);
        navExit.setTypeface(Typeface.DEFAULT_BOLD);
        navExit.setGravity(Gravity.CENTER);
        navExit.setVisibility(View.GONE);
        arrow.addView(navExit, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        navWrap.addView(arrow, new LinearLayout.LayoutParams(arrowSize, arrowSize));

        navDist = new TextView(c);
        navDist.setTextColor(0xFFFFFFFF);
        navDist.setTextSize(19 * scale);
        navDist.setSingleLine(true);
        navDist.setIncludeFontPadding(false);
        ModTypeface.applySpeed(navDist);
        LinearLayout.LayoutParams distLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        distLp.leftMargin = px(6);
        navWrap.addView(navDist, distLp);
        navStreet = new TextView(c);                // shared loop writes it; the panel shows the
        navStreet.setVisibility(View.GONE);         // next street goes in nextStreet below

        // Turn (or "--") on top, the street it leads onto right under it.
        FrameLayout turn = new FrameLayout(c);
        turn.addView(navWrap, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        navIdle = new TextView(c);
        navIdle.setText("--");
        navIdle.setTextColor(0xFF6E7479);
        navIdle.setTextSize(22 * scale);
        ModTypeface.applySpeed(navIdle);
        turn.addView(navIdle, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

        LinearLayout stack = new LinearLayout(c);
        stack.setOrientation(LinearLayout.VERTICAL);
        stack.setGravity(Gravity.CENTER_HORIZONTAL);
        stack.addView(turn, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        nextStreet = new TextView(c);
        nextStreet.setTextColor(AmbientTheme.color(c));
        nextStreet.setTextSize(10.5f * scale);
        nextStreet.setGravity(Gravity.CENTER);
        nextStreet.setSingleLine(true);
        nextStreet.setEllipsize(android.text.TextUtils.TruncateAt.END);
        nextStreet.setMaxWidth(px(112));
        nextStreet.setVisibility(View.GONE);
        LinearLayout.LayoutParams streetLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        streetLp.topMargin = px(3);
        stack.addView(nextStreet, streetLp);
        cell.addView(stack, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        return cell;
    }

    /** Right cell: speed-limit sign (tap = report) beside the current speed. */
    private static View infoSpeedCell(Context c) {
        LinearLayout cell = new LinearLayout(c);
        cell.setOrientation(LinearLayout.HORIZONTAL);
        cell.setGravity(Gravity.CENTER);

        FrameLayout f = new FrameLayout(c);
        int sz = px(54);
        limitStack = f;
        limitBaseSize = sz;
        limitDash = new TextView(c);
        limitDash.setText("–");
        limitDash.setTextColor(0xFF6E7479);
        limitDash.setTextSize(22 * scale);
        limitDash.setTypeface(Typeface.DEFAULT_BOLD);
        limitDash.setGravity(Gravity.CENTER);
        GradientDrawable ph = new GradientDrawable();
        ph.setShape(GradientDrawable.OVAL);
        ph.setColor(0xFFEDEDED);
        ph.setStroke(px(2), 0xFFB0B0B0);
        limitDash.setBackground(ph);
        f.addView(limitDash, new FrameLayout.LayoutParams(sz, sz));
        limitImg = new ImageView(c);
        limitImg.setScaleType(ImageView.ScaleType.FIT_CENTER);
        limitImg.setVisibility(View.GONE);
        f.addView(limitImg, new FrameLayout.LayoutParams(sz, sz));
        // The blue minimum badge is centred on the sign's lower-right rim (34 + 12 = 46dp, the 45
        // degree point of the 54dp circle), so it no longer covers the digits. It overhangs the frame
        // by 4dp; the frame is not grown for it, which would push the sign against the divider.
        f.setClipChildren(false);
        addMinimumLimit(c, f, px(24), px(34), px(34));
        minimumSafePadding = 0;
        cell.addView(f, new LinearLayout.LayoutParams(sz, sz));

        LinearLayout speed = speedBlockHorizontal(c);
        speed.setMinimumWidth(px(46));
        LinearLayout.LayoutParams speedLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        speedLp.leftMargin = px(6);
        cell.addView(speed, speedLp);
        return cell;
    }

    /** Vertical dashed line between the alert group and the road-notice group. */
    private static final class DashedDivider extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        DashedDivider(Context c) {
            super(c);
            paint.setColor(0xE6FFFFFF);
            paint.setStyle(Paint.Style.STROKE);
            paint.setPathEffect(new android.graphics.DashPathEffect(
                    new float[]{px(4), px(3)}, 0f));
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            paint.setStrokeWidth(getWidth());
            canvas.drawLine(getWidth() / 2f, 0f, getWidth() / 2f, getHeight(), paint);
        }
    }

    // ---------------- view construction ----------------
    private static View build(Context c) {
        lastTurn = Integer.MIN_VALUE;
        speedTween.reset();
        turnDistTween.reset();
        shownAlertKeys.clear();
        alertsPopulated = false;
        navShown = false;
        navStreetShown = false;
        minimumShown = false;
        minimumSafePadding = 0;
        lanePanel = null;
        sideRow = null;
        alertRailV2 = null;
        bubbleBody = null;
        gpsSignal = null;
        infoRow = null;
        noticeGroup = null;
        infoLine = null;
        noticeDivider = null;
        schoolImg = null;
        navIdle = null;
        nextStreet = null;
        if (infoLayout) return buildInfo(c);
        if (basicLayout) return buildBasic(c);
        return verticalLayout ? buildVertical(c) : buildHorizontal(c);
    }

    /**
     * The gap gauge and the advisory chip live inside the bubble body, as its last child: below
     * the alerts in the column layouts, after them in the row layouts. Only one shows at a time.
     */
    private static void attachGapViews() {
        if (!(bubbleBody instanceof LinearLayout)) return;
        LinearLayout body = (LinearLayout) bubbleBody;
        boolean column = body.getOrientation() == LinearLayout.VERTICAL;
        LinearLayout.LayoutParams chipLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        LinearLayout.LayoutParams gaugeLp = new LinearLayout.LayoutParams(px(64), px(64));
        if (column) {
            chipLp.topMargin = px(6);
            chipLp.gravity = Gravity.CENTER_HORIZONTAL;
            gaugeLp.topMargin = px(6);
            gaugeLp.gravity = Gravity.CENTER_HORIZONTAL;
        } else {
            chipLp.leftMargin = px(10);
            chipLp.gravity = Gravity.CENTER_VERTICAL;
            gaugeLp.leftMargin = px(10);
            gaugeLp.gravity = Gravity.CENTER_VERTICAL;
        }
        body.addView(gapChip, chipLp);
        body.addView(gapGauge, gaugeLp);
    }

    /** Advisory distance to the vehicle ahead, inside the bubble (the measured gauge replaces it). */
    private static void updateGapChip() {
        TextView chip = gapChip;
        if (chip == null) return;
        boolean gaugeShown = gapGauge != null && gapGauge.getVisibility() == View.VISIBLE;
        int metres = reportPanel == null && !gaugeShown ? Gateway.followingDistanceMetres() : 0;
        boolean show = metres > 0;
        if (show) {
            String imperialGap = Units.imperialDistance(metres, true);
            chip.setText(imperialGap != null ? imperialGap : metres + "M");
        }
        if (show != gapShown) {
            gapShown = show;
            chip.setVisibility(show ? View.VISIBLE : View.GONE);
            if (view != null) view.post(resizeR);
        }
    }

    /** Only the body turns red while over the limit; the WAZE MOD brand tab always stays black. */
    private static void updateOverspeedBackground(boolean active) {
        int bodyColor = active ? 0xD9A9151C : COLOR_BUBBLE_GLASS;
        if (bubbleBody != null) {
            int radius = verticalLayout ? px(22) : px(basicLayout ? 30 : 22);
            bubbleBody.setBackground(roundBorder(bodyColor, radius));
        }
    }

    /** Minimal style: current speed and the current maximum/minimum limit only. */
    private static View buildBasic(Context c) {
        LinearLayout body = new LinearLayout(c);
        body.setOrientation(LinearLayout.HORIZONTAL);
        body.setGravity(Gravity.CENTER_VERTICAL);
        body.setBackground(roundBorder(COLOR_BUBBLE_GLASS, px(30)));
        bubbleBody = body;
        body.setPadding(px(3), px(3), px(3), px(3));

        FrameLayout logoBadge = new FrameLayout(c);
        GradientDrawable logoBorder = new GradientDrawable();
        logoBorder.setShape(GradientDrawable.OVAL);
        logoBorder.setColor(COLOR_BUBBLE_BORDER);
        logoBadge.setBackground(logoBorder);
        ImageView logo = new ImageView(c);
        logo.setScaleType(ImageView.ScaleType.FIT_XY);
        logo.setImageBitmap(circularAppIcon(c, px(42)));
        int logoSize = px(46);
        FrameLayout.LayoutParams iconLp = new FrameLayout.LayoutParams(px(42), px(42));
        iconLp.gravity = Gravity.CENTER;
        logoBadge.addView(logo, iconLp);
        LinearLayout.LayoutParams logoLp = new LinearLayout.LayoutParams(logoSize, logoSize);
        logoLp.rightMargin = px(4);
        body.addView(logoBadge, logoLp);

        LinearLayout speedBlock = speedBlockHorizontal(c);
        gpsSignal = new GpsSignalView(c);
        LinearLayout.LayoutParams gpsLp = new LinearLayout.LayoutParams(px(15), px(15));
        gpsLp.gravity = Gravity.CENTER_HORIZONTAL;
        gpsLp.topMargin = px(2);
        speedBlock.addView(gpsSignal, gpsLp);
        body.addView(speedBlock);

        body.addView(limitBlockBasic(c));

        // Keep the shared update loop null-safe while intentionally excluding these modules.
        navWrap = new LinearLayout(c);
        navWrap.setVisibility(View.GONE);
        navTurn = new ImageView(c);
        navDist = new TextView(c);
        navStreet = new TextView(c);
        navExit = new TextView(c);
        laneStrip = new LaneGuidanceStrip(c);
        alertsCol = new LinearLayout(c);
        alertsCol.setOrientation(LinearLayout.HORIZONTAL);
        avgImg = new ImageView(c);
        avgImg.setVisibility(View.GONE);
        parkingImg = new ImageView(c);
        parkingImg.setVisibility(View.GONE);
        return body;
    }

    private static View limitBlockBasic(Context c) {
        FrameLayout frame = new FrameLayout(c);
        int size = px(46);
        limitStack = frame;
        limitBaseSize = size;
        LinearLayout.LayoutParams frameLp = new LinearLayout.LayoutParams(size, size);
        frameLp.leftMargin = px(4);
        frame.setLayoutParams(frameLp);

        limitDash = new TextView(c);
        limitDash.setText("–");
        limitDash.setTextColor(0xFF6E7479);
        limitDash.setTextSize(22 * scale);
        limitDash.setTypeface(Typeface.DEFAULT_BOLD);
        limitDash.setGravity(Gravity.CENTER);
        GradientDrawable placeholder = new GradientDrawable();
        placeholder.setShape(GradientDrawable.OVAL);
        placeholder.setColor(0xFFEDEDED);
        placeholder.setStroke(px(2), 0xFFB0B0B0);
        limitDash.setBackground(placeholder);
        frame.addView(limitDash, new FrameLayout.LayoutParams(size, size));

        limitImg = new ImageView(c);
        limitImg.setScaleType(ImageView.ScaleType.FIT_CENTER);
        limitImg.setVisibility(View.GONE);
        frame.addView(limitImg, new FrameLayout.LayoutParams(size, size));
        addMinimumLimit(c, frame, px(27), px(29), px(25));
        minimumSafePadding = px(4);
        return frame;
    }

    private static Bitmap circularAppIcon(Context c, int size) {
        if (size <= 0) return null;
        try {
            Drawable icon = c.getPackageManager().getApplicationIcon(c.getPackageName());
            Bitmap out = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(out);
            Path circle = new Path();
            circle.addCircle(size / 2f, size / 2f, size / 2f, Path.Direction.CW);
            canvas.save();
            canvas.clipPath(circle);
            int bleed = Math.max(1, size / 10);
            icon.setBounds(-bleed, -bleed, size + bleed, size + bleed);
            icon.draw(canvas);
            canvas.restore();
            return out;
        } catch (Throwable ignored) {
            return null;
        }
    }

    // Current style: a small WAZE pill overlaps a horizontal capsule containing speed, limit and alerts.
    private static View buildHorizontal(Context c) {
        // 1. Dùng FrameLayout làm gốc để đè các lớp (Tab đè lên Body) một cách chuẩn xác
        LinearLayout root = new LinearLayout(c);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER_HORIZONTAL);
        root.setClipChildren(false);
        root.setClipToPadding(false);

        // 2. Main Capsule (body) - Add vào trước để nằm dưới
        LinearLayout body = new LinearLayout(c);
        body.setOrientation(LinearLayout.HORIZONTAL);
        body.setGravity(Gravity.CENTER_VERTICAL);
        body.setBackground(roundBorder(COLOR_BUBBLE_GLASS, px(22)));
        bubbleBody = body;

        int padH = px(14);
        int padTop = px(14);
        int padBottom = px(10);
        body.setPadding(padH, padTop, padH, padBottom);

        View tab = brandTabHorizontal(c);
        root.addView(tab, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(body, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Thêm các thành phần con vào body
        body.addView(turnBlockHorizontal(c));
        body.addView(speedBlockHorizontal(c));
        body.addView(limitBlockHorizontal(c));

        // Vạch kẻ chia cách
        View sep = new View(c);
        sep.setBackgroundColor(0x80FFFFFF); // Giảm opacity một chút cho đỡ chói
        LinearLayout.LayoutParams sepP = new LinearLayout.LayoutParams(
                Math.max(1, (int) (1.5f * scale)), px(34));
        sepP.leftMargin = px(12);
        sepP.rightMargin = px(12);
        body.addView(sep, sepP);

        if (c.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean("bubble_alert_rail_v2", false)) {
            // V2 distance rail: fixed arrow at the left; alerts approach it from right to left.
            alertRailV2 = new BubbleAlertRailView(c, false);
            body.addView(alertRailV2, new LinearLayout.LayoutParams(px(190), px(66)));
        } else {
            alertsCol = new LinearLayout(c);
            alertsCol.setOrientation(LinearLayout.HORIZONTAL);
            alertsCol.setGravity(Gravity.CENTER_VERTICAL);
            alertsCol.setVisibility(View.GONE);
            body.addView(alertsCol);
        }

        // Các biển cấm
        avgImg = new ImageView(c);
        avgImg.setScaleType(ImageView.ScaleType.FIT_CENTER);
        avgImg.setVisibility(View.GONE);
        LinearLayout.LayoutParams avp = new LinearLayout.LayoutParams(px(40), px(40));
        avp.gravity = Gravity.CENTER_VERTICAL;
        avp.leftMargin = px(10);
        body.addView(avgImg, avp);

        parkingImg = new ImageView(c);
        parkingImg.setScaleType(ImageView.ScaleType.FIT_CENTER);
        parkingImg.setVisibility(View.GONE);
        LinearLayout.LayoutParams pp = new LinearLayout.LayoutParams(px(40), px(40));
        pp.gravity = Gravity.CENTER_VERTICAL;
        pp.leftMargin = px(6);
        body.addView(parkingImg, pp);

        return root;
    }

    private static View brandTabHorizontal(Context c) {
        LinearLayout tab = new LinearLayout(c);
        tab.setOrientation(LinearLayout.HORIZONTAL);
        tab.setGravity(Gravity.CENTER_VERTICAL);
        tab.setBackground(brandTopRoundBorder(COLOR_BRAND_GLASS, brandPx(10)));
        int padH = brandPx(11), padV = brandPx(4);
        tab.setPadding(padH, padV, padH, padV);

        gpsSignal = new GpsSignalView(c);
        LinearLayout.LayoutParams gpsLp = new LinearLayout.LayoutParams(
                brandPx(15), brandPx(15));
        gpsLp.rightMargin = brandPx(6);
        tab.addView(gpsSignal, gpsLp);

        TextView t = new TextView(c);
        t.setText("WAZE MOD");
        t.setTextColor(0xFFFFFFFF);
        t.setTextSize(10.5f);
        ModTypeface.applyBrand(t);
        t.setGravity(Gravity.CENTER_VERTICAL);
        tab.addView(t);

        ImageView logo = new ImageView(c);
        try {
            Drawable ic = c.getPackageManager().getApplicationIcon(c.getPackageName());
            if (ic != null) logo.setImageDrawable(ic);
        } catch (Throwable ignored) { /* ignore */ }
        int ls = brandPx(16);
        LinearLayout.LayoutParams lgp = new LinearLayout.LayoutParams(ls, ls);
        lgp.leftMargin = brandPx(6);
        tab.addView(logo, lgp);
        return tab;
    }

    private static LinearLayout speedBlockHorizontal(Context c) {
        LinearLayout b = new LinearLayout(c);
        b.setOrientation(LinearLayout.VERTICAL);
        b.setGravity(Gravity.CENTER_HORIZONTAL);
        b.setMinimumWidth(px(45)); // [QUAN TRỌNG] Fix cứng một width tối thiểu để chữ 0 km/h không bị dí sát vào biển 50

        spd = new TextView(c);
        spd.setTextColor(0xFFFFFFFF);
        spd.setTextSize(24 * scale); 
        spd.setGravity(Gravity.CENTER);
        spd.setIncludeFontPadding(false); // Xóa khoảng trắng thừa của font
        extraBold(spd);
        ModTypeface.applySpeed(spd);
        b.addView(spd);

        TextView unit = new TextView(c);
        spdUnit = unit;
        unit.setText(Units.speedUnit("km/h"));
        unit.setTextColor(0xFFAEB4BA);
        unit.setTextSize(11 * scale);
        unit.setGravity(Gravity.CENTER);
        b.addView(unit);
        return b;
    }

    private static View limitBlockHorizontal(Context c) {
        FrameLayout f = new FrameLayout(c);
        int sz = px(44);
        limitStack = f;
        limitBaseSize = sz;

        // [QUAN TRỌNG] Set cứng kích thước của khối này luôn ở đây để không bị WRAP_CONTENT làm méo ảnh
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(sz, sz);
        lp.leftMargin = px(12);
        f.setLayoutParams(lp);

        limitDash = new TextView(c);
        limitDash.setText("–");
        limitDash.setTextColor(0xFF6E7479);
        limitDash.setTextSize(22 * scale);
        limitDash.setTypeface(Typeface.DEFAULT_BOLD);
        limitDash.setGravity(Gravity.CENTER);
        GradientDrawable ph = new GradientDrawable();
        ph.setShape(GradientDrawable.OVAL);
        ph.setColor(0xFFEDEDED);
        ph.setStroke(px(2), 0xFFB0B0B0);
        limitDash.setBackground(ph);
        f.addView(limitDash, new FrameLayout.LayoutParams(sz, sz));

        limitImg = new ImageView(c);
        limitImg.setScaleType(ImageView.ScaleType.FIT_CENTER); // Đảm bảo hình ảnh luôn fit vừa khung vuông
        limitImg.setVisibility(View.GONE);
        f.addView(limitImg, new FrameLayout.LayoutParams(sz, sz));
        addMinimumLimit(c, f, px(27), px(27), px(24));
        return f;
    }

    /** Compact horizontal navigation block: [white Waze arrow] [distance + next street] | */
    private static View turnBlockHorizontal(Context c) {
        navWrap = new LinearLayout(c);
        navWrap.setOrientation(LinearLayout.HORIZONTAL);
        navWrap.setGravity(Gravity.CENTER_VERTICAL);
        navWrap.setVisibility(View.GONE);

        LinearLayout block = new LinearLayout(c);
        block.setOrientation(LinearLayout.HORIZONTAL);
        block.setGravity(Gravity.CENTER_VERTICAL);
        block.setMinimumWidth(px(102));

        int arrowSize = px(38);
        FrameLayout arrow = new FrameLayout(c);
        navTurn = new ImageView(c);
        navTurn.setScaleType(ImageView.ScaleType.FIT_CENTER);
        navTurn.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);
        arrow.addView(navTurn, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        navExit = new TextView(c);
        navExit.setTextColor(0xFFFFFFFF);
        navExit.setTextSize(12 * scale);
        navExit.setTypeface(Typeface.DEFAULT_BOLD);
        navExit.setGravity(Gravity.CENTER);
        navExit.setVisibility(View.GONE);
        arrow.addView(navExit, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        block.addView(arrow, new LinearLayout.LayoutParams(arrowSize, arrowSize));

        LinearLayout text = new LinearLayout(c);
        text.setOrientation(LinearLayout.VERTICAL);
        text.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(px(62), ViewGroup.LayoutParams.WRAP_CONTENT);
        textLp.leftMargin = px(5);
        navDist = new TextView(c);
        navDist.setTextColor(0xFFFFFFFF);
        navDist.setTextSize(13 * scale);
        navDist.setTypeface(Typeface.DEFAULT_BOLD);
        navDist.setSingleLine(true);
        text.addView(navDist);
        navStreet = new TextView(c);
        navStreet.setTextColor(AmbientTheme.color(c));
        navStreet.setTextSize(9 * scale);
        navStreet.setSingleLine(true);
        navStreet.setEllipsize(android.text.TextUtils.TruncateAt.END);
        navStreet.setVisibility(View.GONE);
        text.addView(navStreet);
        block.addView(text, textLp);
        LinearLayout stack = new LinearLayout(c);
        stack.setOrientation(LinearLayout.VERTICAL);
        stack.setGravity(Gravity.CENTER_HORIZONTAL);
        laneStrip = new LaneGuidanceStrip(c);
        LinearLayout.LayoutParams laneLp = new LinearLayout.LayoutParams(px(104), px(34));
        laneLp.bottomMargin = px(2);
        stack.addView(laneStrip, laneLp);
        stack.addView(block);
        navWrap.addView(stack);

        View sep = new View(c);
        sep.setBackgroundColor(0x80FFFFFF);
        LinearLayout.LayoutParams sepP = new LinearLayout.LayoutParams(
                Math.max(1, (int) (1.5f * scale)), px(34));
        sepP.leftMargin = px(8);
        sepP.rightMargin = px(10);
        navWrap.addView(sep, sepP);
        return navWrap;
    }

    // Legacy style: vertical brand tab, then limit, speed and an alert column stacked top to bottom.
    private static View buildVertical(Context c) {
        LinearLayout root = new LinearLayout(c);
        root.setOrientation(LinearLayout.HORIZONTAL);
        root.setGravity(Gravity.TOP);
        root.setClipChildren(false);
        root.setClipToPadding(false);
        root.addView(brandTabVertical(c));

        LinearLayout col = new LinearLayout(c);
        col.setOrientation(LinearLayout.VERTICAL);
        col.setGravity(Gravity.CENTER_HORIZONTAL);
        col.setBackground(roundBorder(COLOR_BUBBLE_GLASS, px(22)));
        bubbleBody = col;
        int pad = px(7);
        col.setPadding(pad, px(9), pad, px(9));
        col.addView(turnBlockVertical(c));
        col.addView(limitBlockVertical(c));
        col.addView(speedBlockVertical(c), gapTop(6));

        View sep = new View(c);
        sep.setBackgroundColor(0xFFFFFFFF);
        LinearLayout.LayoutParams sepP = new LinearLayout.LayoutParams(
                px(44), Math.max(1, (int) (2 * scale)));
        sepP.topMargin = (int) (15 * scale);
        sepP.bottomMargin = (int) (15 * scale);
        col.addView(sep, sepP);

        if (c.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean("bubble_alert_rail_v2", false)) {
            alertRailV2 = new BubbleAlertRailView(c, true);
            col.addView(alertRailV2, new LinearLayout.LayoutParams(px(66), px(190)));
        } else {
            alertsCol = new LinearLayout(c);
            alertsCol.setOrientation(LinearLayout.VERTICAL);
            alertsCol.setGravity(Gravity.CENTER_HORIZONTAL);
            alertsCol.setVisibility(View.GONE);
            col.addView(alertsCol);
        }
        root.addView(col);

        // Lane guidance is deliberately detached from the narrow vertical column. Keeping it in
        // turnBlockVertical crowds the WAZE tab and maneuver arrow; a separate capsule mirrors the
        // horizontal layout while leaving the legacy column unchanged.
        // The capsule and the two signs go in sideRow, which show() puts in a window of its own (see layoutSide).
        sideRow = new LinearLayout(c);
        sideRow.setOrientation(LinearLayout.HORIZONTAL);
        sideRow.setGravity(Gravity.TOP);
        sideRow.setClipChildren(false);
        sideRow.setClipToPadding(false);

        FrameLayout panel = new FrameLayout(c);
        panel.setBackground(roundBorder(COLOR_BUBBLE_GLASS, px(17)));
        panel.setPadding(px(7), px(5), px(7), px(5));
        panel.setVisibility(View.GONE);
        laneStrip = new LaneGuidanceStrip(c);
        panel.addView(laneStrip, new FrameLayout.LayoutParams(px(116), px(46)));
        sideRow.addView(panel, new LinearLayout.LayoutParams(px(130), px(56)));
        lanePanel = panel;

        avgImg = new ImageView(c);
        avgImg.setVisibility(View.GONE);
        LinearLayout.LayoutParams avp = new LinearLayout.LayoutParams(px(46), px(46));
        avp.gravity = Gravity.CENTER_VERTICAL;
        avp.leftMargin = px(6);
        sideRow.addView(avgImg, avp);

        parkingImg = new ImageView(c);
        parkingImg.setVisibility(View.GONE);
        LinearLayout.LayoutParams pp = new LinearLayout.LayoutParams(px(46), px(46));
        pp.gravity = Gravity.CENTER_VERTICAL;
        pp.leftMargin = px(4);
        sideRow.addView(parkingImg, pp);
        return root;
    }

    private static View brandTabVertical(Context c) {
        // VietMap uses a wide, mostly off-layout wrapper and only paints the thin strip at its
        // right edge.  The negative leading margin makes that strip contribute just its visible
        // width to the horizontal LinearLayout, so it joins the bubble without overlapping the
        // translucent body (an overlap would show through the 75% body background).
        final int wrapperWidth = brandPx(112);
        final int visibleWidth = brandPx(30);
        final int tabHeight = brandPx(132);

        FrameLayout wrapper = new FrameLayout(c);
        FrameLayout tab = new FrameLayout(c);
        tab.setBackground(brandLeftRoundBorder(COLOR_BRAND_GLASS, brandPx(10)));
        // Only the visible 30dp strip carries the glass background. The wrapper is mostly
        // off-layout and overlaps the body, so it must stay transparent.
        FrameLayout.LayoutParams panelLp = new FrameLayout.LayoutParams(visibleWidth, tabHeight);
        panelLp.gravity = Gravity.RIGHT | Gravity.CENTER_VERTICAL;
        wrapper.addView(tab, panelLp);

        ImageView logo = new ImageView(c);
        try {
            Drawable ic = c.getPackageManager().getApplicationIcon(c.getPackageName());
            if (ic != null) logo.setImageDrawable(ic);
        } catch (Throwable t) { /* ignore */ }
        int ls = brandPx(16);
        FrameLayout.LayoutParams logoLp = new FrameLayout.LayoutParams(ls, ls);
        logoLp.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        logoLp.topMargin = brandPx(8);
        tab.addView(logo, logoLp);

        TextView t = new TextView(c);
        t.setText("WAZE MOD");
        t.setTextColor(0xFFFFFFFF);
        t.setTextSize(9.5f);
        ModTypeface.applyBrand(t);
        t.setGravity(Gravity.CENTER);
        t.setSingleLine(true);
        t.setRotation(-90f);
        FrameLayout.LayoutParams textLp = new FrameLayout.LayoutParams(
                brandPx(80), brandPx(22));
        textLp.gravity = Gravity.CENTER;
        textLp.topMargin = brandPx(9);
        tab.addView(t, textLp);

        gpsSignal = new GpsSignalView(c);
        FrameLayout.LayoutParams gpsLp = new FrameLayout.LayoutParams(
                brandPx(14), brandPx(14));
        gpsLp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
        gpsLp.bottomMargin = brandPx(6);
        tab.addView(gpsSignal, gpsLp);

        LinearLayout.LayoutParams lpTab = new LinearLayout.LayoutParams(wrapperWidth, tabHeight);
        lpTab.gravity = Gravity.CENTER_VERTICAL;
        lpTab.leftMargin = -(wrapperWidth - visibleWidth);
        wrapper.setLayoutParams(lpTab);
        return wrapper;
    }

    private static View speedBlockVertical(Context c) {
        LinearLayout b = new LinearLayout(c);
        b.setOrientation(LinearLayout.VERTICAL);
        b.setGravity(Gravity.CENTER_HORIZONTAL);
        spd = new TextView(c);
        spd.setTextColor(0xFFFFFFFF);
        spd.setTextSize(23 * scale);
        spd.setGravity(Gravity.CENTER);
        extraBold(spd);
        ModTypeface.applySpeed(spd);
        b.addView(spd);
        TextView unit = new TextView(c);
        spdUnit = unit;
        unit.setText(Units.speedUnit("km/h"));
        unit.setTextColor(0xFFAEB4BA);
        unit.setTextSize(10 * scale);
        unit.setGravity(Gravity.CENTER);
        b.addView(unit);
        return b;
    }

    private static View limitBlockVertical(Context c) {
        FrameLayout f = new FrameLayout(c);
        int sz = px(42);
        limitStack = f;
        limitBaseSize = sz;
        f.setLayoutParams(new LinearLayout.LayoutParams(sz, sz));
        limitDash = new TextView(c);
        limitDash.setText("–");
        limitDash.setTextColor(0xFF6E7479);
        limitDash.setTextSize(22 * scale);
        limitDash.setTypeface(Typeface.DEFAULT_BOLD);
        limitDash.setGravity(Gravity.CENTER);
        GradientDrawable ph = new GradientDrawable();
        ph.setShape(GradientDrawable.OVAL);
        ph.setColor(0xFFEDEDED);
        ph.setStroke(px(3), 0xFFB0B0B0);
        limitDash.setBackground(ph);
        f.addView(limitDash, new FrameLayout.LayoutParams(sz, sz));
        limitImg = new ImageView(c);
        limitImg.setVisibility(View.GONE);
        f.addView(limitImg, new FrameLayout.LayoutParams(sz, sz));
        addMinimumLimit(c, f, px(25), px(26), px(23));
        return f;
    }

    /** Blue minimum-speed badge layered over the lower-right corner of the red maximum sign. */
    private static void addMinimumLimit(Context c, FrameLayout parent, int diameter, int left, int top) {
        minimumDiameter = diameter;
        minimumLeft = left;
        minimumTop = top;
        minimumLimit = new TextView(c);
        minimumLimit.setTextColor(0xFFFFFFFF);
        minimumLimit.setTextSize(14 * scale);
        minimumLimit.setGravity(Gravity.CENTER);
        minimumLimit.setIncludeFontPadding(false);
        extraBold(minimumLimit);
        ModTypeface.applySpeed(minimumLimit);
        minimumLimit.setBackground(oval(0xFF0B4FB3));
        minimumLimit.setVisibility(View.GONE);
        FrameLayout.LayoutParams p = new FrameLayout.LayoutParams(diameter, diameter);
        p.leftMargin = left;
        p.topMargin = top;
        parent.addView(minimumLimit, p);
    }

    /** Narrow navigation block used by the legacy vertical bubble. */
    private static View turnBlockVertical(Context c) {
        navWrap = new LinearLayout(c);
        navWrap.setOrientation(LinearLayout.VERTICAL);
        navWrap.setGravity(Gravity.CENTER_HORIZONTAL);
        navWrap.setVisibility(View.GONE);

        int arrowSize = px(42);
        FrameLayout arrow = new FrameLayout(c);
        navTurn = new ImageView(c);
        navTurn.setScaleType(ImageView.ScaleType.FIT_CENTER);
        navTurn.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);
        arrow.addView(navTurn, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        navExit = new TextView(c);
        navExit.setTextColor(0xFFFFFFFF);
        navExit.setTextSize(12 * scale);
        navExit.setTypeface(Typeface.DEFAULT_BOLD);
        navExit.setGravity(Gravity.CENTER);
        navExit.setVisibility(View.GONE);
        arrow.addView(navExit, new FrameLayout.LayoutParams(arrowSize, arrowSize));
        navWrap.addView(arrow, new LinearLayout.LayoutParams(arrowSize, arrowSize));

        navDist = new TextView(c);
        navDist.setTextColor(0xFFFFFFFF);
        navDist.setTextSize(12 * scale);
        navDist.setTypeface(Typeface.DEFAULT_BOLD);
        navDist.setGravity(Gravity.CENTER);
        navDist.setSingleLine(true);
        // Reserve enough width for values such as "94.7 km". WindowManager can otherwise keep
        // the narrower first measurement (for example "20 m") and clip the trailing "m".
        navDist.setMinWidth(px(60));
        navWrap.addView(navDist);
        navStreet = new TextView(c);
        navStreet.setTextColor(AmbientTheme.color(c));
        navStreet.setTextSize(8 * scale);
        navStreet.setGravity(Gravity.CENTER);
        navStreet.setSingleLine(true);
        navStreet.setMaxWidth(px(56));
        navStreet.setEllipsize(android.text.TextUtils.TruncateAt.END);
        navStreet.setVisibility(View.GONE);
        navWrap.addView(navStreet);

        View sep = new View(c);
        sep.setBackgroundColor(0x80FFFFFF);
        LinearLayout.LayoutParams sepP = new LinearLayout.LayoutParams(
                px(44), Math.max(1, (int) (1.5f * scale)));
        sepP.topMargin = px(7);
        sepP.bottomMargin = px(8);
        navWrap.addView(sep, sepP);
        return navWrap;
    }

    private static void setupTouch(final Context c) {
        final int slop = ViewConfiguration.get(c).getScaledTouchSlop();
        View.OnTouchListener touch = new View.OnTouchListener() {
            float dx, dy, downX, downY;
            boolean moved;
            @Override
            public boolean onTouch(View v, MotionEvent e) {
                switch (e.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        downX = e.getRawX(); downY = e.getRawY(); moved = false;
                        dx = e.getRawX() - lp.x; dy = e.getRawY() - lp.y;
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        if (!moved && (Math.abs(e.getRawX() - downX) > slop
                                || Math.abs(e.getRawY() - downY) > slop)) moved = true;
                        if (moved) {
                            showDismissTarget(c);
                            lp.x = (int) (e.getRawX() - dx);
                            lp.y = (int) (e.getRawY() - dy);
                            clampPosition();
                            updateDismissTarget(isNearBottomEdge());
                            try { wm.updateViewLayout(view, lp); } catch (Throwable t) { }
                            layoutSide();
                        }
                        return true;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        if (!moved) {
                            if (reportPanel != null) {
                                // The report panel owns taps: only its buttons and tiles act.
                            } else if (v == view && hitLimitSign(e) && speedReportEnabled(c)) {
                                startSpeedReport(c);
                            } else {
                                openWaze(c);             // a tap (not a drag) brings Waze back to front
                            }
                        } else if (e.getActionMasked() == MotionEvent.ACTION_UP && isNearBottomEdge())
                            dismissForAppSession();
                        else savePosition(c);
                        hideDismissTarget();
                        return true;
                }
                return false;
            }
        };
        view.setOnTouchListener(touch);
        if (sideRow != null) sideRow.setOnTouchListener(touch);   // dragging or tapping the side window acts on the bubble
    }

    private static boolean isNearBottomEdge() {
        try {
            Point display = new Point();
            wm.getDefaultDisplay().getSize(display);
            int height = lp.height > 0 ? lp.height
                    : Math.max(view.getHeight(), view.getMeasuredHeight());
            return display.y - (lp.y + height) <= Math.max(12, (int) (24 * dens));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void showDismissTarget(Context context) {
        if (dismissTarget != null || wm == null) return;
        try {
            TextView target = new TextView(context.getApplicationContext());
            target.setText(I18n.tr("bubble.x_delete"));
            target.setTextColor(0xFFFFFFFF);
            target.setTextSize(15f);
            target.setGravity(Gravity.CENTER);
            target.setTypeface(Typeface.DEFAULT_BOLD);
            target.setPadding((int) (18 * dens), (int) (8 * dens),
                    (int) (18 * dens), (int) (8 * dens));
            target.setBackground(roundBorder(0xE6292D35, (int) (22 * dens)));
            WindowManager.LayoutParams targetLp = new WindowManager.LayoutParams(
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    Build.VERSION.SDK_INT >= 26
                            ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                            : WindowManager.LayoutParams.TYPE_PHONE,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                            | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE,
                    PixelFormat.TRANSLUCENT);
            targetLp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
            targetLp.y = (int) (22 * dens);
            wm.addView(target, targetLp);
            dismissTarget = target;
        } catch (Throwable ignored) { }
    }

    private static void updateDismissTarget(boolean active) {
        if (dismissTarget == null) return;
        dismissTarget.setTextColor(active ? 0xFFFFFFFF : 0xFFB8BEC8);
        dismissTarget.setBackground(roundBorder(active ? 0xFFE53935 : 0xE6292D35,
                (int) (22 * dens)));
    }

    private static void hideDismissTarget() {
        TextView target = dismissTarget;
        dismissTarget = null;
        if (target != null && wm != null) {
            try { wm.removeView(target); } catch (Throwable ignored) { }
        }
    }

    private static synchronized void dismissForAppSession() {
        dismissedForAppSession = true;
        hide();
    }

    /** Keep the whole overlay inside the usable display, including after its content changes size. */
    private static boolean clampPosition() {
        try {
            if (wm == null || lp == null) return false;
            Point display = new Point();
            wm.getDefaultDisplay().getSize(display);

            int width = lp.width > 0 ? lp.width
                    : (view == null ? 0 : Math.max(view.getWidth(), view.getMeasuredWidth()));
            int height = lp.height > 0 ? lp.height
                    : (view == null ? 0 : Math.max(view.getHeight(), view.getMeasuredHeight()));
            int maxX = Math.max(0, display.x - Math.max(0, width));
            int maxY = Math.max(0, display.y - Math.max(0, height));
            int x = Math.max(0, Math.min(lp.x, maxX));
            int y = Math.max(0, Math.min(lp.y, maxY));
            if (x == lp.x && y == lp.y) return false;
            lp.x = x;
            lp.y = y;
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void savePosition(Context c) {
        if (c == null || lp == null) return;
        c.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putInt("bub_x", lp.x).putInt("bub_y", lp.y).apply();
    }

    private static void openWaze(Context c) {
        try {
            Intent it = c.getPackageManager().getLaunchIntentForPackage(c.getPackageName());
            if (it != null) { it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK); c.startActivity(it); }
        } catch (Throwable t) { /* ignore */ }
    }

    private static String fmtTurnDist(int m) {
        if (m < 0) return "";
        String imperial = Units.imperialDistance(m, false);
        if (imperial != null) return imperial;
        if (m < 1000) return m + " m";
        return String.format(java.util.Locale.US, "%.1f km", m / 1000.0);
    }

    /** Map Waze Instruction$Type ordinal to the same native arrow used by HudActivity. */
    private static int turnDrawable(Context c, int t) {
        String n = HudManeuverAssets.drawableName(t);
        int id = c.getResources().getIdentifier(n, "drawable", c.getPackageName());
        if (id == 0) id = c.getResources().getIdentifier(n, "drawable", "com.waze");
        return id;
    }

    /** Preserve Waze's gradient roundabout and colored destination/stop artwork. */
    private static void applyNavTint(int turn) {
        boolean preserveArtwork = HudManeuverAssets.preserveArtwork(turn);
        if (preserveArtwork) navTurn.clearColorFilter();
        else navTurn.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);
    }

    /** Compact upcoming alert rail for the traffic bubble. */
    private static final class BubbleAlertRailView extends View {
        private static final int HORIZON_METERS = 1000;
        private static final float ANIMATION_MS = 360f;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path carPath = new Path();
        private final boolean vertical;
        private java.util.List<RailMarker> markers = new java.util.ArrayList<RailMarker>();
        private long animationStarted;

        BubbleAlertRailView(Context context, boolean vertical) {
            super(context);
            this.vertical = vertical;
            setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        }

        void setEntries(java.util.List<UpcomingAlertModel.Entry> entries) {
            java.util.HashMap<String, RailMarker> previous =
                    new java.util.HashMap<String, RailMarker>();
            for (RailMarker marker : markers) previous.put(marker.entry.key(), marker);
            java.util.ArrayList<RailMarker> next = new java.util.ArrayList<RailMarker>();
            for (UpcomingAlertModel.Entry entry : entries) {
                float target = UpcomingAlertModel.position(entry.meters, HORIZON_METERS);
                RailMarker old = previous.get(entry.key());
                float start = old == null ? 1f : old.currentPosition();
                float targetScale = proximityScale(entry.meters);
                float startScale = old == null ? targetScale : old.currentScale();
                next.add(new RailMarker(entry, start, target, startScale, targetScale));
            }
            markers = next;
            animationStarted = android.os.SystemClock.uptimeMillis();
            invalidate();
        }

        private float proximityScale(int meters) {
            float t = Math.max(0f, Math.min(1f, (meters - 200) / 800f));
            return 1.08f - 0.28f * t;
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (vertical) drawVertical(canvas); else drawHorizontal(canvas);
            if (android.os.SystemClock.uptimeMillis() - animationStarted < (long) ANIMATION_MS)
                postInvalidateOnAnimation();
        }

        private void drawHorizontal(Canvas canvas) {
            float trackStart = px(36);
            float trackEnd = getWidth() - px(11);
            float centerY = px(27);

            float carX = px(18);
            canvas.save();
            canvas.rotate(90f, carX, centerY);
            UpcomingRailCarGlyph.draw(canvas, paint, carPath, carX, centerY, dens * scale);
            canvas.restore();
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeWidth(px(5));
            int ambient = AmbientTheme.color(getContext());
            int faded = (ambient & 0x00FFFFFF) | 0x18000000;
            paint.setShader(new LinearGradient(trackStart, centerY, trackEnd, centerY,
                    new int[]{ambient, ambient, faded}, new float[]{0f, 0.55f, 1f},
                    Shader.TileMode.CLAMP));
            canvas.drawLine(trackStart, centerY, trackEnd, centerY, paint);
            paint.setShader(null);

            float[] positions = markerPositions(trackStart, trackEnd);
            for (int i = markers.size() - 1; i >= 0; i--) {
                RailMarker marker = markers.get(i);
                drawMarker(canvas, marker.entry, positions[i], centerY, marker.currentScale());
            }
            if (!markers.isEmpty()) drawDistance(canvas, markers.get(0).entry.meters,
                    trackStart, px(62));
        }

        private void drawVertical(Canvas canvas) {
            float centerX = getWidth() / 2f;
            float trackTop = px(11);
            float trackBottom = getHeight() - px(64);

            UpcomingRailCarGlyph.draw(canvas, paint, carPath,
                    centerX, getHeight() - px(40), dens * scale);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeWidth(px(5));
            int ambient = AmbientTheme.color(getContext());
            int faded = (ambient & 0x00FFFFFF) | 0x18000000;
            paint.setShader(new LinearGradient(centerX, trackTop, centerX, trackBottom,
                    new int[]{faded, ambient, ambient}, new float[]{0f, 0.45f, 1f},
                    Shader.TileMode.CLAMP));
            canvas.drawLine(centerX, trackTop, centerX, trackBottom, paint);
            paint.setShader(null);

            float[] positions = markerPositions(trackBottom, trackTop);
            for (int i = markers.size() - 1; i >= 0; i--) {
                RailMarker marker = markers.get(i);
                drawMarker(canvas, marker.entry, centerX, positions[i], marker.currentScale());
            }
            if (!markers.isEmpty()) drawDistanceCentered(canvas, markers.get(0).entry.meters,
                    centerX, getHeight() - px(5));
        }

        /** Preserve marker order and a readable minimum gap without changing the view width. */
        private float[] markerPositions(float start, float end) {
            int count = markers.size();
            float[] result = new float[count];
            float direction = end >= start ? 1f : -1f;
            float previous = start;
            for (int i = 0; i < count; i++) {
                float raw = start + markers.get(i).currentPosition() * (end - start);
                float gap = i == 0 ? px(18) : px(30);
                result[i] = direction > 0f
                        ? Math.max(raw, previous + gap)
                        : Math.min(raw, previous - gap);
                previous = result[i];
            }
            if (count > 0 && direction > 0f && result[count - 1] > end) {
                float shift = result[count - 1] - end;
                for (int i = 0; i < count; i++) result[i] -= shift;
            } else if (count > 0 && direction < 0f && result[count - 1] < end) {
                float shift = end - result[count - 1];
                for (int i = 0; i < count; i++) result[i] += shift;
            }
            if (count > 0) {
                float minimum = start + direction * px(18);
                boolean crossed = direction > 0f ? result[0] < minimum : result[0] > minimum;
                if (crossed) {
                    float correction = minimum - result[0];
                    for (int i = 0; i < count; i++) result[i] += correction;
                }
            }
            return result;
        }

        private void drawMarker(Canvas canvas, UpcomingAlertModel.Entry entry,
                                float x, float y, float markerScale) {
            if (entry.speed > 0) {
                float radius = px(15) * markerScale;
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(Color.WHITE);
                canvas.drawCircle(x, y, radius, paint);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(px(3) * markerScale);
                paint.setColor(0xFFE52329);
                canvas.drawCircle(x, y, radius - px(2) * markerScale, paint);
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(Color.BLACK);
                paint.setTypeface(Typeface.DEFAULT_BOLD);
                paint.setTextAlign(Paint.Align.CENTER);
                paint.setTextSize(px(entry.speed >= 100 ? 10 : 12) * markerScale);
                canvas.drawText(String.valueOf(entry.speed), x,
                        y - (paint.ascent() + paint.descent()) / 2f, paint);
                return;
            }
            Bitmap bitmap = Signs.alertIcon(getContext(), entry.rawIcon);
            if (bitmap == null) return;
            float half = px(14) * markerScale;
            paint.setAlpha(255);
            paint.setFilterBitmap(true);
            canvas.drawBitmap(bitmap, null, new RectF(x - half, y - half, x + half, y + half), paint);
        }

        private void drawDistance(Canvas canvas, int meters, float x, float baseline) {
            String imperial = Units.imperialDistance(meters, false);
            String text = imperial != null ? imperial
                    : meters < 1000 ? meters + " m"
                    : String.format(java.util.Locale.US, "%.1f km", meters / 1000f);
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(null);
            paint.setColor(0xFFF3F3F5);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            paint.setTextAlign(Paint.Align.LEFT);
            paint.setTextSize(px(14));
            canvas.drawText(text, x, baseline, paint);
        }

        private void drawDistanceCentered(Canvas canvas, int meters, float x, float baseline) {
            String imperial = Units.imperialDistance(meters, false);
            String text = imperial != null ? imperial
                    : meters < 1000 ? meters + " m"
                    : String.format(java.util.Locale.US, "%.1f km", meters / 1000f);
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(null);
            paint.setColor(0xFFF3F3F5);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTextSize(px(14));
            canvas.drawText(text, x, baseline, paint);
        }

        private final class RailMarker {
            final UpcomingAlertModel.Entry entry;
            final float startPosition;
            final float targetPosition;
            final float startScale;
            final float targetScale;

            RailMarker(UpcomingAlertModel.Entry entry, float startPosition, float targetPosition,
                       float startScale, float targetScale) {
                this.entry = entry;
                this.startPosition = startPosition;
                this.targetPosition = targetPosition;
                this.startScale = startScale;
                this.targetScale = targetScale;
            }

            private float progress() {
                float t = Math.min(1f, Math.max(0f,
                        (android.os.SystemClock.uptimeMillis() - animationStarted) / ANIMATION_MS));
                return 1f - (1f - t) * (1f - t);
            }

            float currentPosition() {
                return startPosition + (targetPosition - startPosition) * progress();
            }

            float currentScale() {
                return startScale + (targetScale - startScale) * progress();
            }
        }
    }

    // ---------------- small helpers ----------------
    private static int px(float dp) { return (int) (dp * dens * scale + 0.5f); }

    /** Brand identity stays optically stable while the user scales the data capsule. */
    private static int brandPx(float dp) { return (int) (dp * dens + 0.5f); }

    private static LinearLayout.LayoutParams gapLeft(int left) {
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        p.leftMargin = px(left);
        return p;
    }

    private static LinearLayout.LayoutParams gapTop(int top) {
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        p.topMargin = px(top);
        return p;
    }

    private static GradientDrawable round(int color, float radius) {
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.RECTANGLE);
        g.setColor(color);
        g.setCornerRadius(radius);
        return g;
    }

    private static GradientDrawable roundBorder(int color, float radius) {
        GradientDrawable g = round(color, radius);
        g.setStroke(Math.max(1, px(1)), COLOR_BUBBLE_BORDER);
        return g;
    }

    private static GradientDrawable topRoundBorder(int color, float radius) {
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.RECTANGLE);
        g.setColor(color);
        g.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        g.setStroke(Math.max(1, px(1)), COLOR_BUBBLE_BORDER);
        return g;
    }

    private static GradientDrawable brandTopRoundBorder(int color, float radius) {
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.RECTANGLE);
        g.setColor(color);
        g.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        g.setStroke(Math.max(1, brandPx(1)), COLOR_BUBBLE_BORDER);
        return g;
    }

    private static GradientDrawable leftRoundBorder(int color, float radius) {
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.RECTANGLE);
        g.setColor(color);
        // Rounded only on the exposed edge. The right edge remains square and seals against body.
        g.setCornerRadii(new float[]{radius, radius, 0, 0, 0, 0, radius, radius});
        g.setStroke(Math.max(1, px(1)), COLOR_BUBBLE_BORDER);
        return g;
    }

    private static GradientDrawable brandLeftRoundBorder(int color, float radius) {
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.RECTANGLE);
        g.setColor(color);
        g.setCornerRadii(new float[]{radius, radius, 0, 0, 0, 0, radius, radius});
        g.setStroke(Math.max(1, brandPx(1)), COLOR_BUBBLE_BORDER);
        return g;
    }

    private static GradientDrawable oval(int color) {
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.OVAL);
        g.setColor(color);
        return g;
    }

    private static void extraBold(TextView t) {
        t.setTypeface(Typeface.DEFAULT_BOLD);
        t.getPaint().setStyle(android.graphics.Paint.Style.FILL_AND_STROKE);
        t.getPaint().setStrokeWidth(t.getTextSize() * 0.05f);
    }
}
