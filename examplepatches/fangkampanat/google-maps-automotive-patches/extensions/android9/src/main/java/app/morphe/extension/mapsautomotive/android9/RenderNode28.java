package app.morphe.extension.mapsautomotive.android9;

import android.graphics.Canvas;
import android.graphics.RenderNode;
import android.os.Build;

/**
 * RenderNode.beginRecording() as a Canvas (patch "Android 9 (API 28)"). Its RecordingCanvas does not exist on Android 9,
 * so the patch changes Maps' one call (an R8 outline whose callers use the result as a Canvas) to return Canvas and to
 * call this method. Not a route of the generic pass: the return type differs.
 */
public final class RenderNode28 {
    public static final String OWNER = "Landroid/graphics/RenderNode;";

    private RenderNode28() {
    }

    public static Canvas beginRecording(RenderNode renderNode) {
        if (Build.VERSION.SDK_INT >= 29) return renderNode.beginRecording();
        return Legacy28.beginRecording(renderNode);
    }
}
