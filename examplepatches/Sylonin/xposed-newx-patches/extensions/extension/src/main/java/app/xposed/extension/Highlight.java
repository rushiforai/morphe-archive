package app.xposed.extension;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;

/** X-Posed's highlight: a faint tint with an accent rail on the leading edge, at the chosen contrast. */
final class Highlight extends Drawable implements View.OnLayoutChangeListener {
    private final Paint paint = new Paint();
    private final boolean dark;
    private final float density;

    Highlight(boolean dark, float density) {
        this.dark = dark;
        this.density = density;
    }

    /** Keeps the bounds in step with a view it is an overlay of. */
    @Override
    public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
        setBounds(0, 0, r - l, b - t);
    }

    @Override
    public void draw(Canvas canvas) {
        float[] contrast = Settings.highlightContrast();
        // X-Posed's --xp-filter-surface: 6% / 4.5% of the accent, scaled by the contrast.
        int accent = dark ? 0xC3A06C : 0x906124;
        float alpha = Math.min(1, (dark ? 0.06f : 0.045f) * contrast[0]);
        Rect b = getBounds();
        paint.setColor(Math.round(alpha * 255) << 24 | accent);
        canvas.drawRect(b, paint);
        paint.setColor(0xFF000000 | accent);
        canvas.drawRect(b.left, b.top, b.left + contrast[1] * density, b.bottom, paint);
    }

    @Override
    public void setAlpha(int alpha) {
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
