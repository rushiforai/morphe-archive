/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package eightbitlab.com.blurview;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.widget.FrameLayout;

import app.liquidmusic.extension.LiquidGlassPatch;

/**
 * Stand-in for BlurView as compiled in Apple Music 7.0.0-beta, with draw(Canvas) as the
 * "Liquid Glass" patch rewrites it. Its only interface-typed field is the controller.
 */
public class BlurView extends FrameLayout {
    /** false draws Apple's original blur. */
    public static boolean patched = true;

    public BlurController a = canvas -> true;
    public int b;
    public final boolean c = true;
    /** Whether the last draw was the glass. */
    public boolean drewGlass;

    public BlurView(Context context) {
        super(context);
    }

    public void setupWith(BlurTarget target, Drawable frameClear) {
        a = new RenderNodeBlurController(this, target, frameClear);
    }

    @Override
    public void draw(Canvas canvas) {
        drewGlass = patched && LiquidGlassPatch.drawBlurView(this, canvas);
        if (drewGlass) {
            super.draw(canvas);
            return;
        }
        if (a.g(canvas)) super.draw(canvas);
    }
}
