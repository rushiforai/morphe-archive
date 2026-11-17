package app.morphed.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;

/**
 * A padlock, open or closed, drawn as the player's own glyphs are: white outlines of the same weight, on a
 * 24-unit grid, antialiased, nothing behind it.
 */
final class LockIcon extends View {
    private final Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pressed = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    private final RectF rect = new RectF();
    private final float glyph; // the grid's size in pixels (24 units), as the player's icons
    private boolean open;

    LockIcon(Context context, float glyph) {
        super(context);
        this.glyph = glyph;
        line.setColor(0xFFFFFFFF);
        line.setStyle(Paint.Style.STROKE);
        line.setStrokeCap(Paint.Cap.ROUND);
        line.setStrokeJoin(Paint.Join.ROUND);
        fill.setColor(0xFFFFFFFF);
        pressed.setColor(0x26FFFFFF);
    }

    void setOpen(boolean open) {
        if (this.open == open) return;
        this.open = open;
        invalidate();
    }

    @Override
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        invalidate();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float w = getWidth(), h = getHeight();
        if (isPressed()) {
            rect.set(0, 0, w, h);
            canvas.drawPath(Squircle.path(rect, Math.min(w, h) / 2f, path), pressed);
        }
        float u = Math.min(glyph, Math.min(w, h)) / 24f; // one grid unit
        float left = (w - 24 * u) / 2f, top = (h - 24 * u) / 2f;
        line.setStrokeWidth(2 * u);
        // body: an outlined, rounded box in the lower half
        rect.set(left + 5 * u, top + 10.5f * u, left + 19 * u, top + 20.5f * u);
        canvas.drawPath(Squircle.path(rect, 2.6f * u, path), line);
        // keyhole
        canvas.drawCircle(left + 12 * u, top + 15.5f * u, 1.4f * u, fill);
        // shackle: an arch over the body; open, it's lifted and its right leg ends in the air
        float lift = open ? 2.2f * u : 0f;
        float archLeft = left + 8 * u, archRight = left + 16 * u, archTop = top + 3.5f * u - lift * 0.3f;
        float radius = (archRight - archLeft) / 2f;
        path.reset();
        path.moveTo(archLeft, top + 10.5f * u);
        path.lineTo(archLeft, archTop + radius);
        rect.set(archLeft, archTop, archRight, archTop + 2 * radius);
        path.arcTo(rect, 180f, 180f, false);
        path.lineTo(archRight, open ? archTop + radius + 0.8f * u : top + 10.5f * u);
        canvas.drawPath(path, line);
    }
}
