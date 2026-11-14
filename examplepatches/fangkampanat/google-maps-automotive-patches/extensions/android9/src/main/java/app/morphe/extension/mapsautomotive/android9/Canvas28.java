package app.morphe.extension.mapsautomotive.android9;

import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.RenderNode;
import android.graphics.text.MeasuredText;
import android.os.Build;

/**
 * Android 10 members of Canvas (patch "Android 9 (API 28)"). On Android 9 a hardware canvas is the hidden
 * DisplayListCanvas: render nodes and Z reordering go to its own methods (hidden API exemption, Android9; through
 * Legacy28, which only Android 9 loads); blend modes become their PorterDuff modes and long colors int colors.
 */
public final class Canvas28 {
    public static final String OWNER = "Landroid/graphics/Canvas;";

    private Canvas28() {
    }

    /** Android 9: a hardware canvas starts Z reordering with a reorder barrier; elsewhere there is nothing to do. */
    public static void enableZ(Canvas canvas) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.enableZ();
            return;
        }
        Legacy28.enableZ(canvas);
    }

    public static void disableZ(Canvas canvas) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.disableZ();
            return;
        }
        Legacy28.disableZ(canvas);
    }

    public static void drawRenderNode(Canvas canvas, RenderNode renderNode) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.drawRenderNode(renderNode);
            return;
        }
        Legacy28.drawRenderNode(canvas, renderNode);
    }

    public static void drawColor(Canvas canvas, int color, BlendMode mode) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.drawColor(color, mode);
            return;
        }
        canvas.drawColor(color, Legacy28.porterDuffOrSrcOver(mode));
    }

    public static void drawColor(Canvas canvas, long color) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.drawColor(color);
            return;
        }
        canvas.drawColor(Color.toArgb(color));
    }

    public static void drawColor(Canvas canvas, long color, BlendMode mode) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.drawColor(color, mode);
            return;
        }
        canvas.drawColor(Color.toArgb(color), Legacy28.porterDuffOrSrcOver(mode));
    }

    /** Android 9: the outer round rect minus the inner one, as a path. */
    public static void drawDoubleRoundRect(Canvas canvas, RectF outer, float outerRx, float outerRy, RectF inner,
                                           float innerRx, float innerRy, Paint paint) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.drawDoubleRoundRect(outer, outerRx, outerRy, inner, innerRx, innerRy, paint);
            return;
        }
        Path outerPath = new Path();
        outerPath.addRoundRect(outer, outerRx, outerRy, Path.Direction.CW);
        Path innerPath = new Path();
        innerPath.addRoundRect(inner, innerRx, innerRy, Path.Direction.CW);
        outerPath.op(innerPath, Path.Op.DIFFERENCE);
        canvas.drawPath(outerPath, paint);
    }

    public static void drawDoubleRoundRect(Canvas canvas, RectF outer, float[] outerRadii, RectF inner,
                                           float[] innerRadii, Paint paint) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.drawDoubleRoundRect(outer, outerRadii, inner, innerRadii, paint);
            return;
        }
        Path outerPath = new Path();
        outerPath.addRoundRect(outer, outerRadii, Path.Direction.CW);
        Path innerPath = new Path();
        innerPath.addRoundRect(inner, innerRadii, Path.Direction.CW);
        outerPath.op(innerPath, Path.Op.DIFFERENCE);
        canvas.drawPath(outerPath, paint);
    }

    /** Android 9 has no MeasuredText, so nothing can pass one; nothing to draw. */
    public static void drawTextRun(Canvas canvas, MeasuredText text, int start, int end, int contextStart,
                                   int contextEnd, float x, float y, boolean isRtl, Paint paint) {
        if (Build.VERSION.SDK_INT >= 29) {
            canvas.drawTextRun(text, start, end, contextStart, contextEnd, x, y, isRtl, paint);
        }
    }
}
