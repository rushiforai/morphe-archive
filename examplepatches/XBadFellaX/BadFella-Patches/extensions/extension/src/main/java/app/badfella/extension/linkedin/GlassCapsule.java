package app.badfella.extension.linkedin;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;

/**
 * A floating, translucent capsule for the bottom bar, in the style of Morphe's glass navigation bar. The bar
 * supplies where the capsule and its selection pill sit through {@link Layout}; this class only paints.
 */
public final class GlassCapsule extends Drawable {
    private static final float DEFAULT_FILL_ALPHA = 0.85f;

    /** Where the capsule and the pill behind the selected tab are, in the coordinates of the drawable. */
    public interface Layout {
        /** Writes the capsule rectangle into {@code out}; returns false when there is nothing to draw yet. */
        boolean capsule(RectF out);

        /** Writes the pill rectangle into {@code out}; returns false when no tab is selected or the app draws its own. */
        boolean pill(RectF out);
    }

    private final Layout layout;
    private final float density;
    private final RectF rect = new RectF();
    private final RectF pillRect = new RectF();
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint sheen = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint edge = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint shadow = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pill = new Paint(Paint.ANTI_ALIAS_FLAG);
    /** A light bar has no dark backdrop to stand out from, so it gets a dark edge and a soft shadow instead. */
    private boolean light;
    /** How opaque the fill is: lower lets more of the screen behind the bar show through. */
    private final float fillAlpha;

    /**
     * @param color   the color the bar had before, which becomes the translucent fill
     * @param density display density, for the dp sizes
     * @param layout  where the capsule and the pill sit
     */
    public GlassCapsule(int color, float density, Layout layout) {
        this(color, density, layout, DEFAULT_FILL_ALPHA);
    }

    /**
     * @param fillAlpha opacity of the fill, 0 to 1
     * @see #GlassCapsule(int, float, Layout)
     */
    public GlassCapsule(int color, float density, Layout layout, float fillAlpha) {
        this.fillAlpha = fillAlpha;
        this.layout = layout;
        this.density = density;
        fill.setShadowLayer(10 * density, 0, 3 * density, 0x50000000);
        edge.setStyle(Paint.Style.STROKE);
        edge.setStrokeWidth(density);
        setColor(color);
    }

    /** Changes the color of the fill, for an app that only learns its bar color after the capsule is installed. */
    public void setColor(int color) {
        light = Color.red(color) + Color.green(color) + Color.blue(color) > 3 * 128;
        fill.setColor(Color.argb(Math.round(255 * fillAlpha), Color.red(color), Color.green(color), Color.blue(color)));
        pill.setColor(light ? 0x1F000000 : 0x2EFFFFFF);
        invalidateSelf();
    }

    /** Lets the capsule show through the system navigation bar instead of a solid strip under it. */
    public static void clearSystemBar(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                Activity activity = (Activity) context;
                activity.getWindow().setNavigationBarColor(Color.TRANSPARENT);
                activity.getWindow().setNavigationBarContrastEnforced(false);
                return;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
    }

    @Override
    public void draw(Canvas canvas) {
        if (!layout.capsule(rect)) return;
        // Dark bars get a light sheen at the top; on a light bar that would vanish, so it shades the bottom instead.
        sheen.setShader(light
                ? new LinearGradient(0, rect.top, 0, rect.bottom, Color.TRANSPARENT, 0x26000000, Shader.TileMode.CLAMP)
                : new LinearGradient(0, rect.top, 0, rect.bottom, 0x1FFFFFFF, Color.TRANSPARENT, Shader.TileMode.CLAMP));
        edge.setShader(new LinearGradient(0, rect.top, 0, rect.bottom, light ? 0x40000000 : 0x55FFFFFF,
                light ? 0x14000000 : 0x12FFFFFF, Shader.TileMode.CLAMP));
        float radius = Math.min(rect.width(), rect.height()) / 2;
        if (light) {
            // Hardware canvases ignore a shadow layer on shapes, so the shadow is a few widening translucent rings.
            for (int i = 4; i >= 1; i--) {
                float grow = i * 2 * density;
                shadow.setColor(Color.argb(10, 0, 0, 0));
                canvas.drawRoundRect(rect.left - grow, rect.top - grow / 2, rect.right + grow,
                        rect.bottom + grow * 1.5f, radius + grow, radius + grow, shadow);
            }
        }
        canvas.drawRoundRect(rect, radius, radius, fill);
        canvas.drawRoundRect(rect, radius, radius, sheen);
        if (layout.pill(pillRect)) {
            canvas.drawRoundRect(pillRect, Math.min(pillRect.width(), pillRect.height()) / 2,
                    Math.min(pillRect.width(), pillRect.height()) / 2, pill);
        }
        canvas.drawRoundRect(rect, radius, radius, edge);
    }

    @Override
    public void setAlpha(int alpha) {
    }

    @Override
    public void setColorFilter(ColorFilter filter) {
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
