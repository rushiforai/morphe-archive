package app.voidhack.extension.applemusic;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.View;

final class GlassLensDrawable extends Drawable {
    private final GlassController controller;
    private final RectF lens = new RectF();
    private final Paint composite = new Paint();
    private int opacity = 255;

    GlassLensDrawable(GlassController controller) { this.controller = controller; }

    @Override public void draw(Canvas canvas) {
        GlassDrawable glass = controller.material;
        View navigation = controller.navigation;
        if (glass.backdrop == null || glass.press <= 0.001f || controller.menu == null
                || !navigation.isShown() || navigation.getAlpha() <= 0f) return;
        float inset = GlassDrawable.INSET_DP * glass.density;
        float expansion = 16f * glass.density * glass.press;
        float width = (glass.selectionWidth + expansion) * (1f + glass.deformation);
        float height = (navigation.getHeight() - 2f * inset + expansion) / (1f + glass.deformation);
        if (width <= 0f || height <= 0f) return;
        lens.set(glass.center - width / 2f, (navigation.getHeight() - height) / 2f,
                glass.center + width / 2f, (navigation.getHeight() + height) / 2f);
        int alpha = Math.max(0, Math.min(255, Math.round(opacity * navigation.getAlpha() * glass.press)));
        if (alpha <= 0) return;
        int save = canvas.save();
        canvas.translate(navigation.getLeft(), navigation.getTop());
        canvas.concat(navigation.getMatrix());
        composite.setAlpha(alpha);
        glass.backdrop.drawLens(canvas, lens, glass.dark, glass.press, controller.menu, composite);
        canvas.restoreToCount(save);
    }

    @Override public void setAlpha(int alpha) { opacity = alpha; invalidateSelf(); }
    @Override public void setColorFilter(ColorFilter filter) { composite.setColorFilter(filter); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
