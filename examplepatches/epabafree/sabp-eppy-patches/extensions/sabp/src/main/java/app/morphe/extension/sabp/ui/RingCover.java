package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.GradientDrawable;
import android.view.View;

import app.morphe.extension.sabp.EppyTheme;

/**
 * Ember skin cover: a soft accent glow, a dashed track circle and a solid progress arc with a
 * ring thumb around the cover, like the reference "Now Playing" design. Static unless the
 * position changes; no animation loop.
 */
public class RingCover extends View {
    private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint arc = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint thumb = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint thumbRing = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF r = new RectF();
    private float progress;

    public RingCover(Context c, EppyTheme t) {
        super(c);
        float w = Ui.dp(c, 3);
        track.setStyle(Paint.Style.STROKE);
        track.setStrokeWidth(Ui.dp(c, 1.2f));
        track.setColor(EppyTheme.withAlpha(t.primary, 0.7f));
        track.setPathEffect(new DashPathEffect(new float[]{Ui.dp(c, 4), Ui.dp(c, 4)}, 0));
        arc.setStyle(Paint.Style.STROKE);
        arc.setStrokeWidth(w);
        arc.setStrokeCap(Paint.Cap.ROUND);
        arc.setColor(t.primary);
        thumb.setColor(t.primary);
        thumbRing.setStyle(Paint.Style.STROKE);
        thumbRing.setStrokeWidth(Ui.dp(c, 1.5f));
        thumbRing.setColor(t.primary);
        GradientDrawable glow = new GradientDrawable();
        glow.setGradientType(GradientDrawable.RADIAL_GRADIENT);
        glow.setColors(new int[]{EppyTheme.withAlpha(t.primary, 0.45f), EppyTheme.withAlpha(t.primary, 0.08f), 0});
        setBackground(glow);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    public void setProgress(float p) {
        p = Math.max(0f, Math.min(1f, p));
        if (Math.abs(p - progress) < 0.001f) return;
        progress = p;
        invalidate();
    }

    @Override
    protected void onSizeChanged(int w, int h, int ow, int oh) {
        super.onSizeChanged(w, h, ow, oh);
        if (getBackground() instanceof GradientDrawable) ((GradientDrawable) getBackground()).setGradientRadius(Math.min(w, h) / 2f);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float size = Math.min(getWidth(), getHeight());
        float pad = Ui.dp(getContext(), 14);
        float rad = size / 2f - pad;
        float cx = getWidth() / 2f, cy = getHeight() / 2f;
        r.set(cx - rad, cy - rad, cx + rad, cy + rad);
        canvas.drawOval(r, track);
        float sweep = 360f * progress;
        canvas.drawArc(r, -225f, sweep, false, arc);
        double ang = Math.toRadians(-225f + sweep);
        float tx = cx + (float) (rad * Math.cos(ang)), ty = cy + (float) (rad * Math.sin(ang));
        canvas.drawCircle(tx, ty, Ui.dp(getContext(), 4), thumb);
        canvas.drawCircle(tx, ty, Ui.dp(getContext(), 10), thumbRing);
    }
}
