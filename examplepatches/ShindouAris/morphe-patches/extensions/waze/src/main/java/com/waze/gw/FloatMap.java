package com.waze.gw;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Point;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;

import java.lang.reflect.Method;

/**
 * Floating map, like the traffic bubble: when the user leaves Waze during a drive, Waze's live map view is moved
 * into a small draggable window drawn over other apps (with the maneuver, speed and ETA/alert overlay on top)
 * and moved back when Waze returns. The map is a native surface that follows the car, so the window shows the
 * same live map. MainActivity hooks call onPause/onStop/onResume/onDestroy; u.m() (the map pausing itself when
 * the activity stops) is skipped while the map is held here.
 */
final class FloatMap {
    private static final String TAG = "WazeGW-FloatMap";
    private static final String PREFS = "waze_hud_gw";
    private static final String PREF_FLOAT_MAP = "float_map";

    /** The floating map is its own switch; the bubble layout picker only decides what shows when not navigating. */
    static boolean enabled(Context c) {
        migrate(c);
        return Gateway.pref(PREF_FLOAT_MAP, false);
    }

    /** Older builds stored the floating map as bubble layout 4: that becomes the switch plus the vertical bubble. */
    static void migrate(Context c) {
        try {
            SharedPreferences p = c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            if (p.getInt("bubble_layout", 0) == 4) {
                p.edit().putBoolean(PREF_FLOAT_MAP, true).putInt("bubble_layout", 1).apply();
            }
        } catch (Throwable ignored) { }
    }

    /** True while the live map view is in (or on its way to) the floating window instead of Waze's own view tree. */
    static boolean active() { return root != null; }

    private static final float ZOOM_OUT = 2.0f;   // the map renders at phone density: render a bigger buffer, scale down
    private static final float REF_DP = 200f;     // the overlay is designed for a window this wide
    private static final float TWO_ALERTS_SCALE = 1.3f;   // window at least this much wider than REF_DP shows 2 alerts
    private static final int DEFAULT_W_DP = 200, MIN_W_DP = 140, MAX_W_DP = 360;
    private static final float ASPECT = 4f / 3f;  // height / width

    private static final Handler ui = new Handler(Looper.getMainLooper());

    /** True from Activity.onPause (when a float is wanted) until the map is back in Waze's own view tree. */
    private static volatile boolean holding;

    private static Activity owner;          // activity whose map view is (or is about to be) in the float window
    private static View map;
    private static ViewGroup mapParent;
    private static int mapIndex;
    private static ViewGroup.LayoutParams mapParams;
    // Where the map sat in Waze's tree before it left (parent coordinates), to verify it comes back to the same frame.
    private static int homeL, homeT, homeW, homeH, homeParentW, homeParentH;

    private static WindowManager wm;
    private static WindowManager.LayoutParams lp;
    private static FrameLayout root;
    private static FloatMapOverlay overlay;
    private static float dens = 1f;

    private FloatMap() { }

    static boolean holding() { return holding; }

    /**
     * True while one of our own screens other than Waze's map (HUD, Mod settings, Waze's search or settings...) is on
     * screen: the floating map never belongs over it. Tracked from resume/pause, not from the started-activity counter,
     * because that counter can drift and then lets the window appear over such a screen.
     */
    private static volatile boolean otherScreenVisible;

    /** Another screen came to the front: drop a floating map that is still showing. The map itself waits for Waze's onResume. */
    static void onOtherScreenResumed() {
        otherScreenVisible = true;
        if (root != null) removeWindow();
    }

    static void onOtherScreenPaused() { otherScreenVisible = false; }

    private static boolean wanted(Context c) {
        if (otherScreenVisible || !Gateway.modEnabled() || !enabled(c) || !Gateway.hudNavigating)
            return false;
        if (Build.VERSION.SDK_INT >= 23 && !Settings.canDrawOverlays(c)) return false;
        try {
            PowerManager pm = (PowerManager) c.getSystemService(Context.POWER_SERVICE);
            if (pm != null && !pm.isInteractive()) return false;   // screen off: nobody sees it
        } catch (Throwable ignored) { }
        return true;
    }

    // ---- MainActivity hooks ------------------------------------------------------------------------------------

    /** Activity.onPause: decide early, because the map's own lifecycle observer stops it on ON_STOP (u.m). */
    static void onPause(Activity a) {
        if (map == null && wanted(a)) holding = true;
    }

    /**
     * Activity.onStop: the activity is gone from the screen. If the user really left Waze, move the live map into
     * the floating window. Another Waze screen (search, route preview, settings) taking over is not leaving: the
     * activity counter settles a moment after onStop, so decide then.
     */
    static void onStop(final Activity a) {
        if (!holding || map != null) return;
        ui.postDelayed(new Runnable() {
            @Override public void run() {
                if (!holding || map != null || a.isDestroyed()) return;   // came back meanwhile
                if (Bubble.appStarted() || !wanted(a) || !enter(a)) {
                    holding = false;
                    View m = findMap(a);
                    if (m != null) pauseMap(m);   // u.m() was skipped while holding: stop the renderer now
                }
            }
        }, 200);
    }

    /** One of Waze's own screens came to the front: the floating window has no business over it. */
    static void onAnyActivityStarted() {
        if (root != null) removeWindow();
    }

    static void onResume(Activity a) {
        if (map != null) leave(a);
        holding = false;
    }

    static void onDestroy(Activity a) {
        if (a != owner) return;
        removeWindow();
        clearMap();
        holding = false;
    }

    // ---- map view <-> floating window -------------------------------------------------------------------------

    private static View findMap(Activity a) {
        // The arsc package stays com.waze in the Dual build, so resolve with that when the app id does not match.
        int id = a.getResources().getIdentifier("wazeMapAndroidView", "id", Gateway.resPackage(a.getPackageName()));
        return id == 0 ? null : a.findViewById(id);
    }

    private static boolean enter(Activity a) {
        View m = findMap(a);
        if (m == null || !(m.getParent() instanceof ViewGroup)) {
            Log.w(TAG, "map view not found");
            return false;
        }
        Context app = a.getApplicationContext();
        ViewGroup parent = (ViewGroup) m.getParent();
        int index = parent.indexOfChild(m);
        ViewGroup.LayoutParams params = m.getLayoutParams();
        homeL = m.getLeft();
        homeT = m.getTop();
        homeW = m.getWidth();
        homeH = m.getHeight();
        homeParentW = parent.getWidth();
        homeParentH = parent.getHeight();
        Log.i(TAG, "map home frame " + homeL + "," + homeT + " " + homeW + "x" + homeH + " in "
                + parent.getClass().getName() + " " + homeParentW + "x" + homeParentH
                + " params=" + (params == null ? "null" : params.getClass().getName()
                + " " + params.width + "x" + params.height));
        parent.removeView(m);
        try {
            wm = (WindowManager) app.getSystemService(Context.WINDOW_SERVICE);
            dens = app.getResources().getDisplayMetrics().density;
            buildWindow(app, m);
            owner = a;
            map = m;
            mapParent = parent;
            mapIndex = index;
            mapParams = params;
            ui.removeCallbacks(tick);
            ui.postDelayed(tick, 1000);
            Log.i(TAG, "map moved to floating window");
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "floating map failed", t);
            removeWindow();
            if (m.getParent() instanceof ViewGroup) ((ViewGroup) m.getParent()).removeView(m);
            if (params != null) parent.addView(m, Math.min(index, parent.getChildCount()), params);
            else parent.addView(m, Math.min(index, parent.getChildCount()));
            return false;
        }
    }

    /** Put the map back where Waze had it (activity visible again) and drop the window. */
    private static void leave(Activity a) {
        removeWindow();
        View m = map;
        ViewGroup parent = mapParent;
        boolean same = a == owner;
        ViewGroup.LayoutParams params = mapParams;
        int index = mapIndex;
        clearMap();
        if (m == null || parent == null || !same) return;
        if (m.getParent() instanceof ViewGroup) ((ViewGroup) m.getParent()).removeView(m);
        if (mapLayout != null) { m.removeOnLayoutChangeListener(mapLayout); mapLayout = null; }
        mapLp = null;
        if (m instanceof SurfaceView) ((SurfaceView) m).getHolder().setSizeFromLayout();
        // The view still carries the float window's measurements; make the parent measure it for real.
        m.forceLayout();
        if (params != null) parent.addView(m, Math.min(index, parent.getChildCount()), params);
        else parent.addView(m, Math.min(index, parent.getChildCount()));
        parent.requestLayout();
        Log.i(TAG, "map restored to Waze");
        verifyRestored(m, parent);
    }

    /**
     * After the next layout the map must be back at its old size. If Waze's parent did not lay it out again (the
     * map then shows as a small patch in the corner), lay it out by hand at the size it had before it left.
     */
    private static void verifyRestored(final View m, final ViewGroup parent) {
        final int l = homeL, t = homeT, w = homeW, h = homeH, pw = homeParentW, ph = homeParentH;
        ui.postDelayed(new Runnable() {
            @Override public void run() {
                if (m.getParent() != parent || w <= 0 || h <= 0) return;
                boolean wrong = m.getWidth() != w || m.getHeight() != h;
                Log.i(TAG, "map frame after restore " + m.getLeft() + "," + m.getTop() + " "
                        + m.getWidth() + "x" + m.getHeight() + " (home " + w + "x" + h + ") parent "
                        + parent.getWidth() + "x" + parent.getHeight());
                if (!wrong || parent.getWidth() != pw || parent.getHeight() != ph) return;
                Log.w(TAG, "map not laid out by Waze after restore: laying it out by hand");
                m.measure(View.MeasureSpec.makeMeasureSpec(w, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(h, View.MeasureSpec.EXACTLY));
                m.layout(l, t, l + w, t + h);
            }
        }, 500);
    }

    private static void clearMap() {
        map = null;
        mapParent = null;
        mapParams = null;
        owner = null;
        ui.removeCallbacks(tick);
    }

    /** Drive ended (or the layout changed) while Waze is in the background: drop the window, keep the map for onResume. */
    private static final Runnable tick = new Runnable() {
        @Override public void run() {
            if (map == null) return;
            Activity a = owner;
            if (a == null || a.isDestroyed()) { removeWindow(); clearMap(); holding = false; return; }
            if (root != null && !animating && (!Gateway.hudNavigating || !enabled(a))) {
                final Context app = a.getApplicationContext();
                slide(lp.x, edgeX(lp.width), new Runnable() {
                    @Override public void run() {
                        removeWindow();
                        Bubble.onFloatMapEnded(app);       // not navigating any more: the bubble takes over
                    }
                });
            }
            ui.postDelayed(this, 1000);
        }
    };

    private static void pauseMap(View m) {
        try {
            for (Class<?> k = m.getClass(); k != null; k = k.getSuperclass()) {
                try {
                    Method pause = k.getDeclaredMethod("m");
                    pause.setAccessible(true);
                    pause.invoke(m);
                    return;
                } catch (NoSuchMethodException next) { /* look in the superclass */ }
            }
        } catch (Throwable t) {
            Log.w(TAG, "pause map failed", t);
        }
    }

    // ---- the window ------------------------------------------------------------------------------------------

    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static int px(float dp) { return Math.round(dp * dens); }

    private static Point display() {
        Point p = new Point();
        wm.getDefaultDisplay().getSize(p);
        return p;
    }

    private static void buildWindow(final Context app, View m) {
        Point d = display();
        SharedPreferences p = prefs(app);
        int w = clampWidth(px(p.getInt("float_map_w", DEFAULT_W_DP)), d);
        int h = Math.round(w * ASPECT);

        final FrameLayout r = new FrameLayout(app) {
            private float downX, downY, startX, startY, startW;
            private boolean moved, resizing;

            @Override public boolean onInterceptTouchEvent(MotionEvent e) { return true; }   // the map is view-only

            @Override public boolean onTouchEvent(MotionEvent e) {
                if (animating) return true;
                int slop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
                switch (e.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        downX = e.getRawX(); downY = e.getRawY();
                        startX = lp.x; startY = lp.y; startW = lp.width;
                        moved = false;
                        resizing = e.getX() > getWidth() - px(44) && e.getY() > getHeight() - px(44);
                        return true;
                    case MotionEvent.ACTION_MOVE: {
                        float dx = e.getRawX() - downX, dy = e.getRawY() - downY;
                        if (!moved && (Math.abs(dx) > slop || Math.abs(dy) > slop)) moved = true;
                        if (!moved) return true;
                        Point disp = display();
                        if (resizing) {
                            lp.width = clampWidth(Math.round(startW + dx), disp);
                            lp.height = Math.round(lp.width * ASPECT);
                        } else {
                            lp.x = Math.round(startX + dx);
                            lp.y = Math.round(startY + dy);
                        }
                        lp.x = Math.max(0, Math.min(lp.x, disp.x - lp.width));
                        lp.y = Math.max(0, Math.min(lp.y, disp.y - lp.height));
                        try { wm.updateViewLayout(this, lp); } catch (Throwable ignored) { }
                        return true;
                    }
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        if (!moved) {
                            if (e.getActionMasked() == MotionEvent.ACTION_UP) dismissToWaze(getContext());
                        } else {
                            prefs(getContext()).edit().putInt("float_map_x", lp.x).putInt("float_map_y", lp.y)
                                    .putInt("float_map_w", Math.round(lp.width / dens)).apply();
                        }
                        return true;
                }
                return true;
            }
        };
        final float radius = px(16);
        // Round the window (views clip to it; the map surface is kept off the corners by the strips, see below).
        android.view.ViewOutlineProvider rounded = new android.view.ViewOutlineProvider() {
            @Override public void getOutline(View v, android.graphics.Outline o) {
                o.setRoundRect(0, 0, v.getWidth(), v.getHeight(), radius);
            }
        };
        r.setClipToOutline(true);
        r.setOutlineProvider(rounded);

        // A SurfaceView composes its own surface and ignores rounded clipping on this device, so the map sits
        // between the opaque top and bottom strips (margins follow the strips) and never reaches the rounded corners.
        // The overlay is drawn at its design size and scaled to the real window size.
        final android.widget.FrameLayout.LayoutParams mlp = new android.widget.FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        r.addView(m, mlp);
        mapLp = mlp;
        stripTop = 0;
        stripBottom = 0;
        mapLayout = new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View v, int l, int t, int rr, int b, int ol, int ot, int or, int ob) {
                // The map keeps a fixed number of pixels per metre, so it renders ZOOM_OUT times more ground when its
                // surface buffer is ZOOM_OUT times bigger than the view; the compositor scales it down to fit.
                int cw = rr - l, ch = b - t;
                if (cw > 0 && ch > 0 && v instanceof SurfaceView)
                    ((SurfaceView) v).getHolder().setFixedSize(Math.round(cw * ZOOM_OUT), Math.round(ch * ZOOM_OUT));
            }
        };
        m.addOnLayoutChangeListener(mapLayout);
        final View mapView = m;
        overlay = new FloatMapOverlay(app);
        r.addView(overlay, new android.widget.FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        r.addView(new Grip(app), new android.widget.FrameLayout.LayoutParams(px(26), px(26), Gravity.END | Gravity.BOTTOM));
        View border = new View(app);
        GradientDrawable stroke = new GradientDrawable();
        stroke.setCornerRadius(radius);
        stroke.setStroke(px(1.5f), 0x99FFFFFF);
        border.setBackground(stroke);
        r.addView(border, new android.widget.FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        r.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View v, int l, int t, int rr, int b, int ol, int ot, int or, int ob) {
                int cw = rr - l, ch = b - t;
                // Window teardown can still deliver a layout pass after the map went back to Waze: leave it alone.
                if (cw <= 0 || ch <= 0 || mapView.getParent() != v) return;
                FloatMapOverlay o = overlay;
                if (o != null) {
                    float refPx = REF_DP * dens;
                    float s = cw / refPx;
                    o.setCornerRadius(radius / s);                   // the overlay is scaled by s: keep the arc the same on screen
                    o.setMaxAlerts(s >= TWO_ALERTS_SCALE ? 2 : 1);   // a bigger window has room for a second alert
                    android.widget.FrameLayout.LayoutParams olp =
                            (android.widget.FrameLayout.LayoutParams) o.getLayoutParams();
                    int ow = Math.round(refPx), oh = Math.round(ch / s);
                    if (olp.width != ow || olp.height != oh) {
                        olp.width = ow;
                        olp.height = oh;
                        olp.gravity = Gravity.TOP | Gravity.START;
                        o.setLayoutParams(olp);
                    }
                    o.setPivotX(0f);
                    o.setPivotY(0f);
                    o.setScaleX(s);
                    o.setScaleY(s);
                }
            }
        });

        lp = new WindowManager.LayoutParams(w, h,
                Build.VERSION.SDK_INT >= 26 ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                        : WindowManager.LayoutParams.TYPE_PHONE,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                        | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                        | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                PixelFormat.TRANSLUCENT);
        lp.gravity = Gravity.TOP | Gravity.START;
        lp.x = p.getInt("float_map_x", d.x - w - px(12));
        lp.y = p.getInt("float_map_y", px(96));
        lp.x = Math.max(0, Math.min(lp.x, d.x - w));
        lp.y = Math.max(0, Math.min(lp.y, d.y - h));
        int restX = lp.x;
        lp.x = edgeX(w);                 // appears off-screen, then slides in from the nearer edge
        wm.addView(r, lp);
        root = r;
        overlay.start();
        slide(lp.x, restX, null);
    }

    // ---- slide in / out ----------------------------------------------------------------------------------------

    private static final int SLIDE_MS = 220;
    private static android.animation.ValueAnimator slider;
    private static volatile boolean animating;   // touches are ignored while the window is sliding

    /** Off-screen x on the side of the screen the window is closest to. */
    private static int edgeX(int w) {
        Point d = display();
        return lp.x + w / 2 < d.x / 2 ? -w : d.x;
    }

    private static void slide(int from, int to, final Runnable end) {
        final FrameLayout r = root;
        if (slider != null) slider.cancel();
        if (r == null) { if (end != null) end.run(); return; }
        final boolean out = Math.abs(to) > Math.abs(from) || to < 0;
        animating = true;
        android.animation.ValueAnimator va = android.animation.ValueAnimator.ofInt(from, to);
        va.setDuration(SLIDE_MS);
        va.setInterpolator(out ? new android.view.animation.AccelerateInterpolator()
                : new android.view.animation.DecelerateInterpolator());
        va.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {
            @Override public void onAnimationUpdate(android.animation.ValueAnimator a) {
                if (root != r) return;
                lp.x = (Integer) a.getAnimatedValue();
                try { wm.updateViewLayout(r, lp); } catch (Throwable ignored) { }
            }
        });
        va.addListener(new android.animation.AnimatorListenerAdapter() {
            private boolean cancelled;
            @Override public void onAnimationCancel(android.animation.Animator a) { cancelled = true; }
            @Override public void onAnimationEnd(android.animation.Animator a) {
                if (slider == a) { slider = null; animating = false; }
                if (!cancelled && end != null) end.run();
            }
        });
        slider = va;
        va.start();
    }

    /** Tap on the window: slide it away, then bring Waze back (the map returns to Waze in MainActivity.onResume). */
    private static void dismissToWaze(final Context c) {
        if (animating || root == null) return;
        slide(lp.x, edgeX(lp.width), new Runnable() { @Override public void run() { openWaze(c); } });
    }

    private static android.widget.FrameLayout.LayoutParams mapLp;
    private static View.OnLayoutChangeListener mapLayout;
    private static int stripTop, stripBottom;

    /** The overlay reports the on-screen height of its top and bottom strips; the map fills what is left between them. */
    static void stripsChanged(int top, int bottom) {
        if (top == stripTop && bottom == stripBottom) return;
        stripTop = top;
        stripBottom = bottom;
        android.widget.FrameLayout.LayoutParams lp2 = mapLp;
        View m = map;
        if (lp2 == null || m == null || m.getParent() != root) return;
        lp2.topMargin = top;
        lp2.bottomMargin = bottom;
        m.setLayoutParams(lp2);
    }

    private static int clampWidth(int w, Point d) {
        return Math.max(px(MIN_W_DP), Math.min(w, Math.min(px(MAX_W_DP), d.x)));
    }

    private static void removeWindow() {
        if (slider != null) { slider.cancel(); slider = null; }
        animating = false;
        if (overlay != null) { overlay.stop(); overlay = null; }
        FrameLayout r = root;
        root = null;
        if (r == null) return;
        try { r.removeAllViews(); } catch (Throwable ignored) { }
        try { if (wm != null) wm.removeView(r); } catch (Throwable ignored) { }
    }

    private static void openWaze(Context c) {
        try {
            Intent it = c.getPackageManager().getLaunchIntentForPackage(c.getPackageName());
            if (it != null) { it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK); c.startActivity(it); }
        } catch (Throwable ignored) { }
    }

    /** Two diagonal lines in the bottom-right corner: drag to resize. */
    private static final class Grip extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        Grip(Context c) {
            super(c);
            paint.setColor(0xCCFFFFFF);
            paint.setStrokeWidth(px(2f));
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override protected void onDraw(Canvas c) {
            float w = getWidth(), h = getHeight(), m = px(5f);
            c.drawLine(w - m, h - m - px(11f), w - m - px(11f), h - m, paint);
            c.drawLine(w - m, h - m - px(5f), w - m - px(5f), h - m, paint);
        }
    }
}
