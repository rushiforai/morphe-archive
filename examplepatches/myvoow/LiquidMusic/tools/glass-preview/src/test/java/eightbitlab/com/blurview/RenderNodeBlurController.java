/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package eightbitlab.com.blurview;

import android.graphics.Canvas;
import android.graphics.RecordingCanvas;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;

/**
 * Stand-in for Apple's blur (oh.f in Apple Music 7.0.0-beta): the window background ("frame
 * clear" drawable), then BlurTarget's node, blurred by 16 x 4 = 64 px, clipped to the view.
 */
public final class RenderNodeBlurController implements BlurController {
    public final int[] a = new int[2];
    public final int[] b = new int[2];
    public final BlurView c;
    public final BlurTarget d;
    public final RenderNode e = new RenderNode("BlurView node");
    public final float f = 4f;
    public Drawable h;
    public float k = 16f;

    public RenderNodeBlurController(BlurView view, BlurTarget target, Drawable frameClear) {
        c = view;
        d = target;
        h = frameClear;
        view.setWillNotDraw(false);
    }

    @Override
    public boolean g(Canvas canvas) {
        d.getLocationOnScreen(a);
        c.getLocationOnScreen(b);
        e.setPosition(0, 0, d.getWidth(), d.getHeight());
        e.setTranslationX(-(b[0] - a[0]));
        e.setTranslationY(-(b[1] - a[1]));
        RecordingCanvas recording = e.beginRecording();
        if (h != null) h.draw(recording);
        recording.drawRenderNode(d.a);
        e.setRenderEffect(RenderEffect.createBlurEffect(k * f, k * f, Shader.TileMode.CLAMP));
        e.endRecording();
        canvas.save();
        canvas.clipRect(0f, 0f, c.getWidth(), c.getHeight());
        canvas.drawRenderNode(e);
        canvas.restore();
        return true;
    }
}
