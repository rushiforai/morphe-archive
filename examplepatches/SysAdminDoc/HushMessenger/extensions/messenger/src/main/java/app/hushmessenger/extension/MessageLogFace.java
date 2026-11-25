package app.hushmessenger.extension;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;

/**
 * A round face for a row of the message log: the picture its chat's notification carried, else Messenger's blank
 * profile picture, a light figure on a grey circle. A group with no picture of its own gets Messenger's two blank
 * faces, one behind the other.
 */
final class MessageLogFace extends Drawable {
    private final int face, figure, ring;
    private final boolean group;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Path round = new Path();
    private final Matrix fit = new Matrix();
    private Bitmap picture;
    private BitmapShader shader;

    /** [face] is the blank picture's circle and [figure] the person on it; [ring] parts a group's two faces. */
    MessageLogFace(int face, int figure, int ring, boolean group) {
        this.face = face;
        this.figure = figure;
        this.ring = ring;
        this.group = group;
    }

    boolean group() { return group; }

    boolean hasPicture() { return picture != null; }

    /** Shows [picture] in the circle, or the blank face again for null. */
    void setPicture(Bitmap picture) {
        this.picture = picture;
        shader = picture == null ? null : new BitmapShader(picture, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        invalidateSelf();
    }

    @Override public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        float size = Math.min(bounds.width(), bounds.height());
        if (size <= 0) return;
        float cx = bounds.exactCenterX(), cy = bounds.exactCenterY(), radius = size / 2;
        if (shader != null) {
            float scale = size / Math.min(picture.getWidth(), picture.getHeight());
            fit.setScale(scale, scale);
            fit.postTranslate(cx - picture.getWidth() * scale / 2, cy - picture.getHeight() * scale / 2);
            shader.setLocalMatrix(fit);
            paint.setShader(shader);
            canvas.drawCircle(cx, cy, radius, paint);
            paint.setShader(null);
            return;
        }
        if (!group) {
            blank(canvas, cx, cy, radius);
            return;
        }
        // Messenger's group: one face up at the end, the other down at the start and in front, ringed to part them.
        float small = size * 0.34f, left = cx - radius, top = cy - radius;
        blank(canvas, left + size - small, top + small, small);
        paint.setColor(ring);
        canvas.drawCircle(left + small, top + size - small, small + size * 0.045f, paint);
        blank(canvas, left + small, top + size - small, small);
    }

    /** Messenger's blank profile picture: a head and shoulders cut off by the circle. */
    private void blank(Canvas canvas, float cx, float cy, float radius) {
        paint.setColor(face);
        canvas.drawCircle(cx, cy, radius, paint);
        int saved = canvas.save();
        round.reset();
        round.addCircle(cx, cy, radius, Path.Direction.CW);
        canvas.clipPath(round);
        paint.setColor(figure);
        canvas.drawCircle(cx, cy - radius * 0.22f, radius * 0.36f, paint);
        canvas.drawOval(cx - radius * 0.66f, cy + radius * 0.26f, cx + radius * 0.66f, cy + radius * 1.5f, paint);
        canvas.restoreToCount(saved);
    }

    @Override public void setAlpha(int alpha) {
        paint.setAlpha(alpha);
        invalidateSelf();
    }

    @Override public void setColorFilter(ColorFilter filter) {
        paint.setColorFilter(filter);
        invalidateSelf();
    }

    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
