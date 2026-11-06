/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package eightbitlab.com.blurview;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.RecordingCanvas;
import android.graphics.RenderNode;
import android.os.Build;
import android.widget.FrameLayout;

/**
 * Stand-in for BlurTarget as compiled in Apple Music 7.0.0-beta (BlurView v3, obfuscated):
 * a static flag, a RenderNode field, and dispatchDraw recording the children into that node.
 */
public class BlurTarget extends FrameLayout {
    public static final boolean b = Build.VERSION.SDK_INT >= 31;
    public final RenderNode a;

    public BlurTarget(Context context) {
        super(context);
        a = b ? new RenderNode("BlurViewHost node") : null;
    }

    @Override
    protected void dispatchDraw(Canvas canvas) {
        if (b && canvas.isHardwareAccelerated()) {
            a.setPosition(0, 0, getWidth(), getHeight());
            RecordingCanvas recording = a.beginRecording();
            super.dispatchDraw(recording);
            a.endRecording();
            canvas.drawRenderNode(a);
        } else {
            super.dispatchDraw(canvas);
        }
    }
}
