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
import android.graphics.Path;
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
    /** The capsule's outline, which the shadow is kept out of. */
    private final Path shape = new Path();
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
    /** The corner radius from {@link #setCorner}, or 0 for fully round ends. */
    private float corner;
    /** How many rings the shadow of a light capsule has, from {@link #setShadowRings}. */
    private int shadowRings = 4;
    /** Whether the capsule is drawn as bevelled glass, from {@link #setBevel}. */
    private boolean bevel;
    private final Paint bevelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint bandPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path band = new Path();
    private final Path bandInner = new Path();
    private final RectF bandRect = new RectF();
    /** How many layers the light band inside a bevelled edge is drawn in, each reaching less far in. */
    private static final int BAND_STEPS = 4;
    /** How far the band reaches in along the long sides and along the short ones, in dp. */
    private static final float BAND_LONG_DP = 3.5f;
    private static final float BAND_SHORT_DP = 1;

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

    /**
     * Rounds the corners by {@code radius} pixels instead of making the ends fully round, for a glass card.
     *
     * @param radius the corner radius in pixels; 0 brings back the capsule
     */
    public void setCorner(float radius) {
        corner = radius;
        invalidateSelf();
    }

    /**
     * How many rings the soft shadow of a light capsule has, each 2 dp wider than the last: 4 by default, fewer for a
     * thinner shadow, 0 for none. Fewer rings also leave out the drop shadow under the fill, which shows through a
     * translucent fill as a gray cast.
     */
    public void setShadowRings(int rings) {
        shadowRings = rings;
        if (rings < 4) fill.clearShadowLayer();
        invalidateSelf();
    }

    /**
     * Draws the capsule as Apple's Liquid Glass buttons look over a plain background, in place of the edge, with no
     * recorded backdrop. Light: a hairline edge, the sheen shading the bottom and a soft shadow below, subtle on
     * purpose; the fill should be as light as the page or lighter. Dark: a light edge that catches the light at the top
     * and bottom and a light band inside it in place of the sheen; the fill should be a shade lighter than the page.
     */
    public void setBevel(boolean on) {
        bevel = on;
        bevelPaint.setStyle(Paint.Style.STROKE);
        invalidateSelf();
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
        float radius = corner > 0 ? Math.min(corner, Math.min(rect.width(), rect.height()) / 2)
                : Math.min(rect.width(), rect.height()) / 2;
        if (light && shadowRings > 0) {
            // Hardware canvases ignore a shadow layer on shapes, so the shadow is a few widening translucent rings.
            // They stay outside the capsule, as the translucent fill would show them as a gray cast.
            int saved = canvas.save();
            shape.rewind();
            shape.addRoundRect(rect, radius, radius, Path.Direction.CW);
            canvas.clipOutPath(shape);
            for (int i = shadowRings; i >= 1; i--) {
                // A bevelled capsule gets a fainter shadow of 1.5 dp rings that lifts it off the page.
                float grow = i * (bevel ? 1.5f : 2) * density;
                shadow.setColor(Color.argb(bevel ? 6 : 10, 0, 0, 0));
                canvas.drawRoundRect(rect.left - grow, rect.top - (bevel ? grow / 3 : grow / 2), rect.right + grow,
                        rect.bottom + grow * 1.5f, radius + grow, radius + grow, shadow);
            }
            canvas.restoreToCount(saved);
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
        // On a light page the sheen shades the bottom, which gives a bevelled capsule its depth.
        if (!bevel || light) canvas.drawRoundRect(rect, radius, radius, sheen);
        if (bevel) band(canvas, radius);
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
            // The raised pill needs no backdrop, so bevelled glass has it without Liquid Glass too.
            if (glass != null || bevel) bubble(canvas, corner);
        }
        if (bevel && light) hairline(canvas, radius);
        else if (bevel) specular(canvas, radius);
        else canvas.drawRoundRect(rect, radius, radius, edge);
    }

    /**
     * The thickness of bevelled glass: a light band inside the edge, wide along the long sides and narrow along the
     * short ones, as the light catches a pane of glass along its length. Layers that reach less far in add up, so the
     * band is brightest at the edge and fades out inward. A shape about as tall as wide gets the same band all around.
     */
    private void band(Canvas canvas, float radius) {
        float ratio = rect.width() / Math.max(1, rect.height());
        float wide = (ratio > 1.15f || ratio < 1 / 1.15f ? BAND_LONG_DP : (BAND_LONG_DP + BAND_SHORT_DP) / 2) * density;
        float narrow = (ratio > 1.15f || ratio < 1 / 1.15f ? BAND_SHORT_DP : (BAND_LONG_DP + BAND_SHORT_DP) / 2) * density;
        // On a dark page Apple's glass has no band along the short sides at all.
        float across = ratio >= 1 ? (light ? narrow : 0) : wide;
        float along = ratio >= 1 ? wide : (light ? narrow : 0);
        // On a dark page Apple's band is barely lighter than the fill, about +0x13 at the edge.
        bandPaint.setColor(Color.argb(light ? 0x55 : 0x07, 255, 255, 255));
        for (int i = 1; i <= BAND_STEPS; i++) {
            float x = across * i / BAND_STEPS;
            float y = along * i / BAND_STEPS;
            band.rewind();
            band.addRoundRect(rect, radius, radius, Path.Direction.CW);
            bandRect.set(rect.left + x, rect.top + y, rect.right - x, rect.bottom - y);
            float inner = Math.max(0, radius - Math.max(x, y));
            bandInner.rewind();
            bandInner.addRoundRect(bandRect, inner, inner, Path.Direction.CW);
            band.op(bandInner, Path.Op.DIFFERENCE);
            canvas.drawPath(band, bandPaint);
        }
    }

    /**
     * The light caught by the edge of bevelled glass on a dark page: a light hairline, bright at the top, faint at the
     * bottom and gone at the sides.
     */
    private void specular(Canvas canvas, float radius) {
        float stroke = density / 2;
        float half = stroke / 2;
        bevelPaint.setStrokeWidth(stroke);
        bevelPaint.setColor(Color.WHITE);
        bevelPaint.setShader(new LinearGradient(0, rect.top, 0, rect.bottom,
                new int[] {0x66FFFFFF, Color.TRANSPARENT, 0x26FFFFFF},
                new float[] {0, 0.5f, 1}, Shader.TileMode.CLAMP));
        canvas.drawRoundRect(rect.left + half, rect.top + half, rect.right - half, rect.bottom - half,
                Math.max(0, radius - half), Math.max(0, radius - half), bevelPaint);
    }

    /** The edge of bevelled glass on a light page: a gray hairline, fainter at the top where the light falls. */
    private void hairline(Canvas canvas, float radius) {
        float half = density / 2;
        bevelPaint.setStrokeWidth(density);
        bevelPaint.setColor(Color.BLACK);
        bevelPaint.setShader(new LinearGradient(0, rect.top, 0, rect.bottom, 0x0D000000, 0x1F000000, Shader.TileMode.CLAMP));
        canvas.drawRoundRect(rect.left + half, rect.top + half, rect.right - half, rect.bottom - half,
                Math.max(0, radius - half), Math.max(0, radius - half), bevelPaint);
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
