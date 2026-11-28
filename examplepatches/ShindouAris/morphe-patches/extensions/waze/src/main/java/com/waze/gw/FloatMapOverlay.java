package com.waze.gw;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.List;
import java.util.Locale;

/**
 * Widgets drawn over the live map inside the floating map window: next maneuver on top, speed-limit sign with the
 * current speed as a small badge on the map, and a bottom strip that shows the arrival time or, when one is close,
 * the nearest upcoming alert. Everything comes from the same Gateway fields the bubble and HUD use.
 */
final class FloatMapOverlay extends FrameLayout {
    private static final int STRIP = 0xFF0F172A;           // opaque: the map is laid out between the strips, never under them
    private static final int ALERT_ON_M = 300;             // show an alert once it is this close ...
    private static final int ALERT_OFF_M = 360;            // ... and keep it until it is clearly behind (hysteresis)

    private final float density;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final LinearLayout top;
    private final ImageView turnIcon;
    private final TextView turnDistance;
    private final TextView street;
    private final ImageView limitSign;
    private final TextView speedBadge;
    private final LinearLayout bottom;
    private final TextView eta;
    private final ImageView alertIcon;
    private final TextView alertDistance;
    private final ImageView alertIcon2;
    private final TextView alertDistance2;

    /** How many alerts the bottom strip may show: the window decides (a bigger window has room for two). */
    private volatile int maxAlerts = 1;
    private final java.util.HashSet<String> shownAlertKeys = new java.util.HashSet<String>();

    private int lastTurn = Integer.MIN_VALUE;
    private int lastLimit = Integer.MIN_VALUE;
    private boolean lastSquareSign;
    private boolean running;

    FloatMapOverlay(Context c) {
        super(c);
        density = c.getResources().getDisplayMetrics().density;
        setClipChildren(false);

        top = new LinearLayout(c);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        top.setBackgroundColor(STRIP);
        top.setPadding(px(8), px(4), px(8), px(4));
        turnIcon = new ImageView(c);
        top.addView(turnIcon, new LinearLayout.LayoutParams(px(26), px(26)));
        turnDistance = text(c, 17, true);
        LinearLayout.LayoutParams dp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        dp.leftMargin = px(6);
        top.addView(turnDistance, dp);
        street = text(c, 12, false);
        street.setSingleLine(true);
        street.setEllipsize(android.text.TextUtils.TruncateAt.END);
        street.setTextColor(0xFF5EEAD4);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        sp.leftMargin = px(8);
        top.addView(street, sp);
        addView(top, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP));

        FrameLayout badge = new FrameLayout(c);
        limitSign = new ImageView(c);
        badge.addView(limitSign, new FrameLayout.LayoutParams(px(52), px(52), Gravity.START | Gravity.BOTTOM));
        speedBadge = text(c, 12, true);
        speedBadge.setGravity(Gravity.CENTER);
        speedBadge.setTextColor(0xFF111827);
        badge.addView(speedBadge, new FrameLayout.LayoutParams(px(28), px(28), Gravity.END | Gravity.TOP));
        FrameLayout.LayoutParams bp = new FrameLayout.LayoutParams(px(64), px(68), Gravity.TOP | Gravity.START);
        bp.leftMargin = px(6);
        addView(badge, bp);
        badgeParams = bp;

        bottom = new LinearLayout(c);
        bottom.setOrientation(LinearLayout.HORIZONTAL);
        bottom.setGravity(Gravity.CENTER);
        bottom.setBackgroundColor(STRIP);
        bottom.setPadding(px(8), px(5), px(8), px(5));
        alertIcon = new ImageView(c);
        bottom.addView(alertIcon, new LinearLayout.LayoutParams(px(30), px(30)));
        alertDistance = text(c, 17, true);
        LinearLayout.LayoutParams ap = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        ap.leftMargin = px(8);
        bottom.addView(alertDistance, ap);
        alertIcon2 = new ImageView(c);
        LinearLayout.LayoutParams i2 = new LinearLayout.LayoutParams(px(30), px(30));
        i2.leftMargin = px(16);
        bottom.addView(alertIcon2, i2);
        alertDistance2 = text(c, 17, true);
        LinearLayout.LayoutParams d2 = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        d2.leftMargin = px(8);
        bottom.addView(alertDistance2, d2);
        eta = text(c, 17, true);
        eta.setTextColor(0xFF4ADE80);
        bottom.addView(eta, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        // Alerts slide up into the strip (and the ETA drops out) instead of popping: LayoutTransition animates the
        // visibility changes of the strip's children.
        android.animation.LayoutTransition lt = new android.animation.LayoutTransition();
        lt.setAnimator(android.animation.LayoutTransition.APPEARING, android.animation.ObjectAnimator.ofPropertyValuesHolder(
                (Object) null,
                android.animation.PropertyValuesHolder.ofFloat("alpha", 0f, 1f),
                android.animation.PropertyValuesHolder.ofFloat("translationY", px(22), 0f)));
        lt.setAnimator(android.animation.LayoutTransition.DISAPPEARING, android.animation.ObjectAnimator.ofPropertyValuesHolder(
                (Object) null,
                android.animation.PropertyValuesHolder.ofFloat("alpha", 1f, 0f),
                android.animation.PropertyValuesHolder.ofFloat("translationY", 0f, px(22))));
        lt.setDuration(android.animation.LayoutTransition.APPEARING, 240);
        lt.setDuration(android.animation.LayoutTransition.DISAPPEARING, 160);
        lt.setDuration(android.animation.LayoutTransition.CHANGE_APPEARING, 200);
        lt.setDuration(android.animation.LayoutTransition.CHANGE_DISAPPEARING, 200);
        lt.setStartDelay(android.animation.LayoutTransition.APPEARING, 0);
        lt.setStartDelay(android.animation.LayoutTransition.CHANGE_DISAPPEARING, 0);
        lt.setInterpolator(android.animation.LayoutTransition.APPEARING, new android.view.animation.DecelerateInterpolator());
        bottom.setLayoutTransition(lt);
        addView(bottom, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM));
    }

    private final FrameLayout.LayoutParams badgeParams;

    private int px(int dp) { return Math.round(dp * density); }

    private TextView text(Context c, int sp, boolean bold) {
        TextView t = new TextView(c);
        t.setTextColor(0xFFFFFFFF);
        t.setTextSize(sp);
        t.setIncludeFontPadding(false);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        ModTypeface.applySpeed(t);
        return t;
    }

    void start() {
        if (running) return;
        running = true;
        handler.post(tick);
    }

    void stop() {
        running = false;
        handler.removeCallbacks(tick);
    }

    private final Runnable tick = new Runnable() {
        @Override public void run() {
            if (!running) return;
            try { update(); } catch (Throwable ignored) { }
            handler.postDelayed(this, 500);
        }
    };

    private void update() {
        Context c = getContext();
        reportStrips();

        // top strip: next maneuver; hidden during a free drive
        int turn = Gateway.hudTurn;
        boolean guidance = Gateway.hudNavigating && turn >= 1;
        top.setVisibility(guidance ? View.VISIBLE : View.GONE);
        if (guidance) {
            if (turn != lastTurn) {
                lastTurn = turn;
                int id = turnDrawable(c, turn);
                if (id != 0) turnIcon.setImageResource(id); else turnIcon.setImageDrawable(null);
                if (HudManeuverAssets.preserveArtwork(turn)) turnIcon.clearColorFilter();
                else turnIcon.setColorFilter(0xFFFFFFFF, android.graphics.PorterDuff.Mode.SRC_IN);
            }
            turnDistance.setText(compact(Gateway.hudTurnDist));
            String road = Gateway.hudStreet == null ? "" : Gateway.hudStreet.trim();
            street.setText(road);
            street.setVisibility(road.length() > 0 ? View.VISIBLE : View.GONE);
        }
        // keep the speed badge under the top strip
        int wantTop = guidance ? top.getHeight() + px(4) : px(6);
        if (badgeParams.topMargin != wantTop) {
            badgeParams.topMargin = wantTop;
            ((View) limitSign.getParent()).setLayoutParams(badgeParams);
        }

        // speed-limit sign + current speed
        int limit = Gateway.hudLimit;
        boolean haveLimit = limit >= 10;
        ((View) limitSign.getParent()).setVisibility(haveLimit || Gateway.hudSpeed >= 0 ? View.VISIBLE : View.GONE);
        boolean squareSign = LimitSign.square();
        if (limit != lastLimit || squareSign != lastSquareSign) {
            lastLimit = limit;
            lastSquareSign = squareSign;
            Bitmap sign = haveLimit ? Signs.limitFor(c, limit) : null;
            limitSign.setImageBitmap(sign);
            limitSign.setVisibility(sign != null ? View.VISIBLE : View.GONE);
        }
        int speed = Gateway.hudSpeed;
        boolean over = haveLimit && speed > limit;
        speedBadge.setText(speed >= 0 ? String.valueOf(speed) : "");
        GradientDrawable ring = new GradientDrawable();
        ring.setShape(GradientDrawable.OVAL);
        ring.setColor(0xFFF3F4F6);
        ring.setStroke(px(2), over ? 0xFFEF4444 : 0xFF2563EB);
        speedBadge.setBackground(ring);
        speedBadge.setTextColor(over ? 0xFFB91C1C : 0xFF111827);

        // bottom strip: close alert wins over ETA
        List<UpcomingAlertModel.Entry> near = nearestAlerts(maxAlerts);
        boolean shown = false;
        ImageView[] icons = {alertIcon, alertIcon2};
        TextView[] dists = {alertDistance, alertDistance2};
        for (int k = 0; k < icons.length; k++) {
            Bitmap bm = k < near.size() ? Signs.alertIcon(c, near.get(k).rawIcon) : null;
            icons[k].setImageBitmap(bm);
            icons[k].setVisibility(bm != null ? View.VISIBLE : View.GONE);
            dists[k].setVisibility(bm != null ? View.VISIBLE : View.GONE);
            if (bm != null) { dists[k].setText(compact(near.get(k).meters)); shown = true; }
        }
        if (shown) {
            eta.setVisibility(View.GONE);
            bottom.setVisibility(View.VISIBLE);
            return;
        }
        String clock = Gateway.hudEtaClock == null ? "" : Gateway.hudEtaClock.trim();
        if (Gateway.hudNavigating && clock.length() > 0) {
            eta.setText("ETA " + clock);
            eta.setVisibility(View.VISIBLE);
            bottom.setVisibility(View.VISIBLE);
        } else {
            bottom.setVisibility(View.GONE);
        }
    }

    /** Tell the window how much of its top and bottom the strips cover (real pixels), so the map avoids them. */
    private void reportStrips() {
        float s = getScaleY();
        int t = top.getVisibility() == View.VISIBLE ? Math.round(top.getHeight() * s) : 0;
        int b = bottom.getVisibility() == View.VISIBLE ? Math.round(bottom.getHeight() * s) : 0;
        FloatMap.stripsChanged(t, b);
    }

    private float corner = -1f;

    /** Round the outer corners of the top and bottom strips so they follow the window's rounded border. */
    void setCornerRadius(float r) {
        if (Math.abs(r - corner) < 0.5f) return;
        corner = r;
        top.setBackground(strip(new float[] {r, r, r, r, 0, 0, 0, 0}));
        bottom.setBackground(strip(new float[] {0, 0, 0, 0, r, r, r, r}));
    }

    private static GradientDrawable strip(float[] radii) {
        GradientDrawable g = new GradientDrawable();
        g.setColor(STRIP);
        g.setCornerRadii(radii);
        return g;
    }

    void setMaxAlerts(int n) { maxAlerts = Math.max(1, Math.min(2, n)); }

    /** The closest alerts (up to n), each shown once it is within ALERT_ON_M and kept until ALERT_OFF_M. */
    private List<UpcomingAlertModel.Entry> nearestAlerts(int n) {
        List<UpcomingAlertModel.Entry> list = new java.util.ArrayList<UpcomingAlertModel.Entry>(
                UpcomingAlertModel.select(Gateway.hudAlerts, Gateway.hudLimit, ALERT_OFF_M, 4));
        java.util.Collections.sort(list, new java.util.Comparator<UpcomingAlertModel.Entry>() {
            @Override public int compare(UpcomingAlertModel.Entry a, UpcomingAlertModel.Entry b) {
                return a.meters < b.meters ? -1 : (a.meters > b.meters ? 1 : 0);
            }
        });
        List<UpcomingAlertModel.Entry> out = new java.util.ArrayList<UpcomingAlertModel.Entry>();
        java.util.HashSet<String> keys = new java.util.HashSet<String>();
        for (UpcomingAlertModel.Entry e : list) {
            if (out.size() >= n) break;
            if (e.meters <= (shownAlertKeys.contains(e.key()) ? ALERT_OFF_M : ALERT_ON_M)) {
                out.add(e);
                keys.add(e.key());
            }
        }
        shownAlertKeys.clear();
        shownAlertKeys.addAll(keys);
        return out;
    }

    private static String compact(int meters) {
        if (meters < 0) return "";
        String imperial = Units.imperialDistance(meters, true);
        if (imperial != null) return imperial;
        if (meters < 1000) return meters + "M";
        return String.format(Locale.US, "%.1fKM", meters / 1000.0);
    }

    private static int turnDrawable(Context c, int t) {
        String n = HudManeuverAssets.drawableName(t);
        int id = c.getResources().getIdentifier(n, "drawable", c.getPackageName());
        if (id == 0) id = c.getResources().getIdentifier(n, "drawable", "com.waze");
        return id;
    }
}
