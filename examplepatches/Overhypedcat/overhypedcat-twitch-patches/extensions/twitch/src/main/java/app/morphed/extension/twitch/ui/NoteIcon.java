package app.morphed.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;

/** Two beamed notes (the song pill's glyph), on a 24-unit grid, antialiased, in one color. */
final class NoteIcon extends View {
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stem = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    private final RectF rect = new RectF();

    NoteIcon(Context context) {
        super(context);
        stem.setStyle(Paint.Style.STROKE);
        stem.setStrokeCap(Paint.Cap.ROUND);
        setColor(0xFFFFFFFF);
    }

    void setColor(int color) {
        if (fill.getColor() == color) return;
        fill.setColor(color);
        stem.setColor(color);
        invalidate();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float u = Math.min(getWidth(), getHeight()) / 24f;
        float left = (getWidth() - 24 * u) / 2f, top = (getHeight() - 24 * u) / 2f;
        stem.setStrokeWidth(1.8f * u);
        // heads
        head(canvas, left + 7.2f * u, top + 17.6f * u, u);
        head(canvas, left + 16.6f * u, top + 15.6f * u, u);
        // stems, from each head's right side up to the beam
        float x1 = left + 9.6f * u, x2 = left + 19f * u;
        canvas.drawLine(x1, top + 17.2f * u, x1, top + 6.6f * u, stem);
        canvas.drawLine(x2, top + 15.2f * u, x2, top + 4.6f * u, stem);
        // beam: a slanted bar joining the stems' tops
        float half = 0.9f * u;
        path.reset();
        path.moveTo(x1 - half, top + 5.6f * u);
        path.lineTo(x2 + half, top + 3.6f * u);
        path.lineTo(x2 + half, top + 7.4f * u);
        path.lineTo(x1 - half, top + 9.4f * u);
        path.close();
        canvas.drawPath(path, fill);
    }

    private void head(Canvas canvas, float cx, float cy, float u) {
        canvas.save();
        canvas.rotate(-20f, cx, cy);
        rect.set(cx - 3.3f * u, cy - 2.5f * u, cx + 3.3f * u, cy + 2.5f * u);
        canvas.drawOval(rect, fill);
        canvas.restore();
    }
}
