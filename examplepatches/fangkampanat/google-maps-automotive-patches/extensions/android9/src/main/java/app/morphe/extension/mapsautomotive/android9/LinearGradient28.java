package app.morphe.extension.mapsautomotive.android9;

import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Shader;
import android.os.Build;

/** LinearGradient's Android 10 constructor with long colors (patch "Android 9 (API 28)"): int colors on Android 9. */
public final class LinearGradient28 {
    public static final String OWNER = "Landroid/graphics/LinearGradient;";

    private LinearGradient28() {
    }

    public static LinearGradient create(float x0, float y0, float x1, float y1, long[] colors, float[] positions,
                                        Shader.TileMode tile) {
        if (Build.VERSION.SDK_INT >= 29) return new LinearGradient(x0, y0, x1, y1, colors, positions, tile);
        int[] argb = new int[colors.length];
        for (int i = 0; i < colors.length; i++) argb[i] = Color.toArgb(colors[i]);
        return new LinearGradient(x0, y0, x1, y1, argb, positions, tile);
    }
}
