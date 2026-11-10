package app.fakh.extension.shared;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * A floating, translucent capsule for the bottom bar of any app, in the style of Morphe's glass navigation bar. The
 * app supplies where the capsule and its selection pill sit through {@link Layout}, and tells {@link #slider()}
 * which tab is selected so the pill slides to it. The pill is a pale wash of the app's accent.
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
    /** Whether {@link #setPillColor} set the pill color, which {@link #setColor} then leaves alone. */
    private boolean pillTinted;
    /** The accent set by {@link #setAccent}, or 0; its wash follows the fill from light to dark. */
    private int accent;
    private final SlidingPill slider = new SlidingPill(this::invalidateSelf);
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
        fill.setShadowLayer(2 * density, 0, 1 * density, 0x14000000);
        edge.setStyle(Paint.Style.STROKE);
        edge.setStrokeWidth(density);
        setColor(color);
    }

    /** Changes the color of the fill, for an app that only learns its bar color after the capsule is installed. */
    public void setColor(int color) {
        light = Color.red(color) + Color.green(color) + Color.blue(color) > 3 * 128;
        fill.setColor(Color.argb(Math.round(255 * fillAlpha), Color.red(color), Color.green(color), Color.blue(color)));
        if (accent != 0) pill.setColor(wash(accent));
        else if (!pillTinted) pill.setColor(light ? 0x1F000000 : 0x2EFFFFFF);
        invalidateSelf();
    }

    /** Gives the pill a pale wash of the app's accent, as Material 3 puts behind the selected tab. */
    public void setAccent(int color) {
        accent = color;
        pill.setColor(wash(color));
        invalidateSelf();
    }

    private int wash(int color) {
        return Color.argb(light ? 0x26 : 0x40, Color.red(color), Color.green(color), Color.blue(color));
    }

    /** The position of the pill along the bar, which slides when the app selects another tab. */
    public SlidingPill slider() {
        return slider;
    }

    /** For a bar made of Views: gives the icon and label of the selected tab the accent. */
    public static void tint(View icon, View label, int accent) {
        if (!(icon instanceof ImageView) || !(label instanceof TextView)) return;
        // A color filter, as apps color their icons with a tint or a filled drawable and a filter wins over both.
        ((ImageView) icon).setColorFilter(new PorterDuffColorFilter(accent, PorterDuff.Mode.SRC_IN));
        ((TextView) label).setTextColor(accent);
    }

    /**
     * For a bar made of Views: gives a tab that is no longer selected the colors of a tab that was never
     * selected, {@code likeIcon} and {@code likeLabel}. Its own colors from before were those of a selected tab.
     */
    public static void untint(View icon, View label, View likeIcon, View likeLabel) {
        if (!(icon instanceof ImageView) || !(label instanceof TextView)
                || !(likeIcon instanceof ImageView) || !(likeLabel instanceof TextView)) return;
        ((ImageView) icon).setColorFilter(((ImageView) likeIcon).getColorFilter());
        ((ImageView) icon).setImageTintList(((ImageView) likeIcon).getImageTintList());
        ((TextView) label).setTextColor(((TextView) likeLabel).getTextColors());
    }

    /** Gives the selection pill an exact color of its own, such as the indicator color an app already has. */
    public void setPillColor(int color) {
        pillTinted = true;
        pill.setColor(color);
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
                ? new LinearGradient(0, rect.top, 0, rect.bottom, Color.TRANSPARENT, 0x0A000000, Shader.TileMode.CLAMP)
                : new LinearGradient(0, rect.top, 0, rect.bottom, 0x0AFFFFFF, Color.TRANSPARENT, Shader.TileMode.CLAMP));
        edge.setShader(new LinearGradient(0, rect.top, 0, rect.bottom, light ? 0x1A000000 : 0x2EFFFFFF,
                light ? 0x08000000 : 0x06FFFFFF, Shader.TileMode.CLAMP));
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
        if (layout.pill(pillRect)) canvas.drawRoundRect(pillRect, Math.min(pillRect.width(), pillRect.height()) / 2, Math.min(pillRect.width(), pillRect.height()) / 2, pill);
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
