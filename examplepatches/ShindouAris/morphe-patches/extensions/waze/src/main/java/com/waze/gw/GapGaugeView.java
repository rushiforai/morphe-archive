package com.waze.gw;

import android.content.Context;
import android.graphics.Canvas;
import android.os.SystemClock;
import android.view.View;

/**
 * The distance gauge as a self-updating View: it polls {@link Gateway#xadasGapState()} while it is
 * attached, shows or hides itself, and breathes while xADAS says "too close". Hosts only add it to
 * their layout and, if their window must resize, listen for visibility changes.
 */
final class GapGaugeView extends View {
    enum Surface {
        FLOAT(null), BUBBLE("xadas_bubble"), HUD("xadas_hud");
        final String prefKey;
        Surface(String prefKey) { this.prefKey = prefKey; }
    }

    interface Listener { void onVisibilityChanged(boolean visible); }

    private static final long IDLE_MS = 150L;
    private static final long ALERT_MS = 50L;
    private static final float PULSE_PERIOD_MS = 700f;

    private final Surface surface;
    private final boolean compact;
    private final int sizePx;
    private final GapGaugeDrawer drawer;
    private XadasGapPolicy.State state = XadasGapPolicy.State.HIDDEN;
    private Listener listener;
    private boolean running;
    private boolean suppressed;

    private final Runnable tick = new Runnable() {
        @Override public void run() {
            if (!running) return;
            try {
                update();
            } catch (Throwable ignored) { /* never crash the host over a gauge */ }
            if (running) postDelayed(this, state.alert ? ALERT_MS : IDLE_MS);
        }
    };

    GapGaugeView(Context context, Surface surface, boolean compact, int sizePx) {
        super(context);
        this.surface = surface;
        this.compact = compact;
        this.sizePx = sizePx;
        this.drawer = new GapGaugeDrawer(ModTypeface.gauge(context));
        setVisibility(GONE);
    }

    void setListener(Listener listener) { this.listener = listener; }

    /** Inside another panel (the traffic bubble): no card of its own, the ring sits on the panel. */
    void setEmbedded(boolean value) { drawer.setCard(!value); }

    /** Hosts hide the gauge while something else owns the space (e.g. the speed report panel). */
    void setSuppressed(boolean value) { suppressed = value; }

    private void update() {
        XadasGapPolicy.State next = Gateway.xadasGapState();
        boolean show = next.visible && !suppressed && Gateway.xadasSurfaceEnabled(surface.prefKey);
        if (!next.equals(state)) {
            state = next;
            if (show) {
                String tooClose = next.alert ? I18n.tr("ui.too_close") : "";
                setContentDescription(Units.imperial()
                        ? I18n.f("ui.distance_to_the_vehicle_ahead_0_feet", Units.feet(next.metres), tooClose)
                        : I18n.f("ui.distance_to_the_vehicle_ahead_0", next.metres, tooClose));
            }
            invalidate();
        }
        if (state.alert) invalidate();
        boolean shown = getVisibility() == VISIBLE;
        if (show != shown) {
            setVisibility(show ? VISIBLE : GONE);
            if (listener != null) listener.onVisibilityChanged(show);
        }
    }

    @Override protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(sizePx, sizePx);
    }

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        running = true;
        removeCallbacks(tick);
        post(tick);
    }

    @Override protected void onDetachedFromWindow() {
        running = false;
        removeCallbacks(tick);
        super.onDetachedFromWindow();
    }

    @Override protected void onDraw(Canvas canvas) {
        float pulse = state.alert
                ? 0.5f + 0.5f * (float) Math.sin(2.0 * Math.PI
                        * (SystemClock.uptimeMillis() % (long) PULSE_PERIOD_MS) / PULSE_PERIOD_MS)
                : 1f;
        drawer.draw(canvas, getWidth(), state, pulse, compact);
    }
}
