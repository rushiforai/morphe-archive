package app.morphe.extension.mapsautomotive.android9;

import android.graphics.BlendMode;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.os.Build;

/** Android 10 members of Paint (patch "Android 9 (API 28)"): long colors as int colors, blend modes as PorterDuff. */
public final class Paint28 {
    public static final String OWNER = "Landroid/graphics/Paint;";

    private Paint28() {
    }

    public static long getColorLong(Paint paint) {
        if (Build.VERSION.SDK_INT >= 29) return paint.getColorLong();
        return Color.pack(paint.getColor());
    }

    public static void setColor(Paint paint, long color) {
        if (Build.VERSION.SDK_INT >= 29) {
            paint.setColor(color);
            return;
        }
        paint.setColor(Color.toArgb(color));
    }

    public static void getTextBounds(Paint paint, CharSequence text, int start, int end, Rect bounds) {
        if (Build.VERSION.SDK_INT >= 29) {
            paint.getTextBounds(text, start, end, bounds);
            return;
        }
        paint.getTextBounds(text.toString(), start, end, bounds);
    }

    /** Android 9: the mode's PorterDuff transfer mode; an advanced mode draws as plain SRC_OVER, null clears it. */
    public static void setBlendMode(Paint paint, BlendMode mode) {
        if (Build.VERSION.SDK_INT >= 29) {
            paint.setBlendMode(mode);
            return;
        }
        PorterDuff.Mode porterDuff = Legacy28.porterDuff(mode);
        paint.setXfermode(porterDuff == null ? null : new PorterDuffXfermode(porterDuff));
    }
}
