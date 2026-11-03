package app.voidhack.extension.applemusic;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.view.View;

final class GlassLensDrawable extends Drawable {
    private final GlassController controller;
    private final RectF lens = new RectF();
    private final Path path = new Path();
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint composite = new Paint();
    private int opacity = 255;

    GlassLensDrawable(GlassController controller) { this.controller = controller; }

    @Override public void draw(Canvas canvas) {
        GlassDrawable glass = controller.material;
        View navigation = controller.navigation;
        if (glass.backdrop == null || glass.press <= 0.001f || controller.menu == null
                || !navigation.isShown() || navigation.getAlpha() <= 0f) return;
        float inset = GlassDrawable.INSET_DP * glass.density;
        float width = glass.selectionWidth * (1f + 0.25f * glass.press) * (1f + glass.deformation);
        float restingHeight = navigation.getHeight() - 2f * inset;
        float expandedHeight = glass.selectionWidth * 1.25f / 1.52f;
        float height = (restingHeight + (expandedHeight - restingHeight) * glass.press) / (1f + glass.deformation);
        lens.set(glass.center - width / 2f, (navigation.getHeight() - height) / 2f,
                glass.center + width / 2f, (navigation.getHeight() + height) / 2f);
        int save = canvas.save();
        canvas.translate(navigation.getLeft(), navigation.getTop());
        canvas.concat(navigation.getMatrix());
        composite.setAlpha((int) (opacity * navigation.getAlpha()));
        int layer = canvas.saveLayer(lens, composite);
        path.rewind();
        path.addRoundRect(lens, height / 2f, height / 2f, Path.Direction.CW);
        canvas.clipPath(path);
        glass.backdrop.drawLens(canvas, lens, glass.dark, glass.press, controller.menu);
        rim.setStyle(Paint.Style.STROKE);
        rim.setStrokeWidth(glass.density * 0.75f);
        rim.setShader(new LinearGradient(lens.left, lens.top, lens.right, lens.bottom,
                new int[]{0xb0000000, 0x30696969, 0xc0000000}, new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
        canvas.drawRoundRect(lens, height / 2f, height / 2f, rim);
        canvas.restoreToCount(layer);
        canvas.restoreToCount(save);
    }

    @Override public void setAlpha(int alpha) { opacity = alpha; invalidateSelf(); }
    @Override public void setColorFilter(ColorFilter filter) { composite.setColorFilter(filter); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
