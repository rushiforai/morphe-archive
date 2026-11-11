package app.fakh.extension.shared;

import android.app.Activity;
import android.content.ContentResolver;
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
import android.os.SystemClock;
import android.provider.Settings;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * A floating, translucent capsule for the bottom bar of any app, in the style of Morphe's glass navigation bar. The
 * app supplies where the capsule and its selection pill sit through {@link Layout}, and tells {@link #slider()}
 * which tab is selected so the pill slides to it. The pill is a pale wash of the accent from {@link #setAccent}, or
 * neutral gray without one.
 */
public final class GlassCapsule extends Drawable {
    private static final float DEFAULT_FILL_ALPHA = 0.85f;
    /** How long after a touch the Liquid Glass backdrop follows the screen: past the end of a fling. */
    private static final long STIR_MS = 2000;

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
    private final Paint tint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint bubbleSheen = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint bubbleRim = new Paint(Paint.ANTI_ALIAS_FLAG);
    /** The color the fill comes from, opaque. */
    private int base;
    /** The Liquid Glass look while it's on, else null. */
    private LiquidGlass glass;
    /** The bar whose frames redraw the backdrop; its listener does nothing once the look is off. */
    private View watched;
    /** Until when, in uptime, the backdrop follows what changes behind the bar. */
    private long stirredUntil;
    /** Draws the backdrop once more as the time after a touch runs out, so it rests on what the screen settled on. */
    private final Runnable settle = this::invalidateSelf;
    /** A light bar has no dark backdrop to stand out from, so it gets a dark edge and a soft shadow instead. */
    private boolean light;
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
        bubbleRim.setStyle(Paint.Style.STROKE);
        setColor(color);
    }

    /** Changes the color of the fill, for an app that only learns its bar color after the capsule is installed. */
    public void setColor(int color) {
        light = Color.red(color) + Color.green(color) + Color.blue(color) > 3 * 128;
        base = color | 0xFF000000;
        fill.setColor(Color.argb(Math.round(255 * fillAlpha), Color.red(color), Color.green(color), Color.blue(color)));
        if (accent != 0) pill.setColor(wash(accent));
        else pill.setColor(light ? 0x1F000000 : 0x2EFFFFFF);
        invalidateSelf();
    }

    /** Gives the pill a pale wash of the app's accent, as Material 3 puts behind the selected tab. */
    public void setAccent(int color) {
        accent = color;
        pill.setColor(wash(color));
        invalidateSelf();
    }

    private int wash(int color) {
        // Strong enough to stand out from a near-white capsule, and from under the Liquid Glass sheen.
        return Color.argb(light ? 0x47 : 0x59, Color.red(color), Color.green(color), Color.blue(color));
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
        View bar = getCallback() instanceof View ? (View) getCallback() : null;
        boolean solid = bar != null && solid(bar.getContext());
        if (glass != null && bar != null && bar != watched) {
            watched = bar;
            // A screen loads what's behind the bar for a moment after it opens.
            stir();
            // The recorded backdrop doesn't follow the views it drew, so while the screen is being touched the bar
            // is drawn again whenever one of them changed; from the pre-draw pass that lands in the frame being drawn.
            bar.getViewTreeObserver().addOnPreDrawListener(() -> {
                if (glass != null && bar.getBackground() == this && SystemClock.uptimeMillis() < stirredUntil
                        && !solid(bar.getContext()) && LiquidGlass.behindChanged(bar)) {
                    bar.invalidate();
                }
                return true;
            });
        }
        boolean blurred = glass != null && bar != null && !solid && glass.backdrop(canvas, bar, base, rect, radius);
        if (solid) {
            tint.setColor(base);
            canvas.drawRoundRect(rect, radius, radius, tint);
        } else if (blurred) {
            glass.rim(canvas, rect, radius, getBounds().width(), getBounds().height());
            // Over the blur the tint is lighter, so what's behind shows through it.
            tint.setColor(Color.argb(light ? 0xA6 : 0x70, Color.red(base), Color.green(base), Color.blue(base)));
            canvas.drawRoundRect(rect, radius, radius, tint);
        } else {
            canvas.drawRoundRect(rect, radius, radius, fill);
        }
        canvas.drawRoundRect(rect, radius, radius, sheen);
        boolean pillShown = layout.pill(pillRect);
        if (pillShown) {
            float swell = (slider.swell() - 1) / 2;
            pillRect.inset(-pillRect.width() * swell, -pillRect.height() * swell);
            // Past its tab at the end of the bar the spring squashes the pill against the capsule instead of leaving it.
            pillShown = pillRect.intersect(rect);
        }
        if (pillShown) {
            float corner = Math.min(pillRect.width(), pillRect.height()) / 2;
            if (blurred) glass.lens(canvas, pillRect, corner, getBounds().width(), getBounds().height());
            canvas.drawRoundRect(pillRect, corner, corner, pill);
            if (glass != null) bubble(canvas, corner);
        }
        canvas.drawRoundRect(rect, radius, radius, edge);
    }

    /**
     * Whether the phone asks for solid surfaces, through Samsung's Reduce transparency and blur or High contrast
     * fonts: the capsule is then opaque, with nothing of the screen behind it showing through.
     */
    private static boolean solid(Context context) {
        ContentResolver resolver = context.getContentResolver();
        return Settings.Global.getInt(resolver, "accessibility_reduce_transparency", 0) == 1
                || Settings.Secure.getInt(resolver, "high_text_contrast_enabled", 0) == 1;
    }

    /**
     * The raised look of the Liquid Glass pill: light along its top fading out by its middle, so the accent below
     * stays clear, and a white rim, bright at the top and faint at the bottom.
     */
    private void bubble(Canvas canvas, float corner) {
        bubbleSheen.setShader(new LinearGradient(0, pillRect.top, 0, pillRect.centerY(),
                light ? 0x4DFFFFFF : 0x33FFFFFF, Color.TRANSPARENT, Shader.TileMode.CLAMP));
        canvas.drawRoundRect(pillRect, corner, corner, bubbleSheen);
        float stroke = Math.max(1, 1.25f * density);
        bubbleRim.setStrokeWidth(stroke);
        bubbleRim.setShader(new LinearGradient(0, pillRect.top, 0, pillRect.bottom,
                light ? 0xE6FFFFFF : 0xB0FFFFFF, light ? 0x4DFFFFFF : 0x28FFFFFF, Shader.TileMode.CLAMP));
        float half = stroke / 2;
        pillRect.inset(half, half);
        canvas.drawRoundRect(pillRect, corner - half, corner - half, bubbleRim);
        pillRect.inset(-half, -half);
    }

    /**
     * Lets the Liquid Glass backdrop follow what changes behind the bar for {@link #STIR_MS}: a touch on the screen
     * starts a scroll, a fling or a new page. An idle screen is never drawn again for it.
     */
    void stir() {
        View bar = watched;
        if (glass == null || bar == null) return;
        stirredUntil = SystemClock.uptimeMillis() + STIR_MS;
        bar.removeCallbacks(settle);
        bar.postDelayed(settle, STIR_MS);
    }

    /**
     * Turns the Liquid Glass look on or off: what's behind the bar blurred inside the capsule, its rim bending it and
     * a lens under the pill where the phone can draw them, and a raised pill everywhere.
     */
    public void setLiquid(boolean on) {
        if (on == (glass != null)) return;
        glass = on ? new LiquidGlass(density) : null;
        invalidateSelf();
    }

    /** Whether {@code x}, {@code y}, in the drawable's coordinates, were on the capsule when it was last drawn. */
    boolean onCapsule(float x, float y) {
        return rect.contains(x, y);
    }

    /** The middle of the pill as last drawn, along x or, on a rail, along y. */
    float pillCenter(boolean vertical) {
        return vertical ? pillRect.centerY() : pillRect.centerX();
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
