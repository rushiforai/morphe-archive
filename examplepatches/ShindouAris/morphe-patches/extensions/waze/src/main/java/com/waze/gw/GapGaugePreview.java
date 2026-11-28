package com.waze.gw;

import android.content.Context;
import android.graphics.Canvas;
import android.os.SystemClock;
import android.view.View;

/** Static sample of the distance gauge for the xADAS settings page; no live data involved. */
final class GapGaugePreview extends View {
    private final XadasGapPolicy.State state;
    private final boolean compact;
    private final int sizePx;
    private final GapGaugeDrawer drawer;

    GapGaugePreview(Context context, XadasGapPolicy.State state, boolean compact, int sizePx) {
        super(context);
        this.state = state;
        this.compact = compact;
        this.sizePx = sizePx;
        this.drawer = new GapGaugeDrawer(ModTypeface.gauge(context));
    }

    @Override protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(sizePx, sizePx);
    }

    @Override protected void onDraw(Canvas canvas) {
        float pulse = 1f;
        if (state.alert) {
            pulse = 0.5f + 0.5f * (float) Math.sin(2.0 * Math.PI * (SystemClock.uptimeMillis() % 700L) / 700.0);
            postInvalidateOnAnimation();
        }
        drawer.draw(canvas, getWidth(), state, pulse, compact);
    }
}
