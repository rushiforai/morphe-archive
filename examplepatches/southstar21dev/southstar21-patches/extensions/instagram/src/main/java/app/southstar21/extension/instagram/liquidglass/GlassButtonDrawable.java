package app.southstar21.extension.instagram.liquidglass;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.graphics.drawable.Drawable;
import android.os.Build;

/**
 * iOS 26 glass circle behind a header icon button (Home's + and heart, Explore's Saved and
 * More). On Android 13 and newer it is real glass, drawn by {@link HeaderGlass} (the circle
 * refracts the blurred content behind the header, and close neighbours bridge into each other).
 * Older versions, and canvases that are not hardware accelerated, get a plain translucent disc
 * with a faint rim.
 * <p>
 * It's hidden at the very top of the feed, so the icons blend into the header there, and shows
 * once the feed is scrolled ({@link #setReveal}). Pressing the button swells the circle and, since the
 * circle is the button's background, the icon with it; both spring back on release. The circle is
 * centered on the button and may be larger than it (its parents are told not to clip it).
 */
final class GlassButtonDrawable extends Drawable {
    /** A damped spring towards a target, stepped by hand. */
    static final class Spring {
        final float stiffness, damping, epsilon;
        float value, velocity, target;

        Spring(float stiffness, float dampingRatio, float epsilon) {
            this.stiffness = stiffness;
            this.damping = 2f * dampingRatio * (float) Math.sqrt(stiffness);
            this.epsilon = epsilon;
        }

        void snap(float v) {
            value = target = v;
            velocity = 0f;
        }

        boolean isAtRest() {
            return Math.abs(value - target) <= epsilon && Math.abs(velocity) <= epsilon * 10f;
        }

        void step(float dt) {
            float remaining = dt;
            while (remaining > 0f) {
                float h = Math.min(remaining, 1f / 240f);
                float force = -stiffness * (value - target) - damping * velocity;
                velocity += force * h;
                value += velocity * h;
                remaining -= h;
            }
            if (isAtRest()) {
                value = target;
                velocity = 0f;
            }
        }
    }

    /** How much a pressed button swells. */
    private static final float PRESS_SCALE = 1.10f;

    float diameter;
    boolean dark;
    private boolean pressed;
    /** 0 hidden, 1 fully shown. */
    float reveal;

    /** The press swell, which the controller applies to the button view (icon and circle alike). */
    final Spring scale = new Spring(420f, 0.62f, 0.0005f);
    final Spring press = new Spring(400f, 0.9f, 0.002f);
    /** The scale last written to the view, so Instagram's own scale is left alone at rest. */
    float appliedScale = 1f;
    /** The circle's center on the page, set by the controller each frame. */
    float pageX, pageY;

    /** Used by {@link HeaderGlass}. */
    RenderNode node;
    RuntimeShader shader;
    RenderEffect effect;
    final float[] uniforms = new float[HeaderGlass.UNIFORMS];
    final float[] lastUniforms = new float[HeaderGlass.UNIFORMS];
    boolean uniformsSet;

    private final HeaderGlass group;
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);

    GlassButtonDrawable(float density, HeaderGlass group) {
        this.group = group;
        rim.setStyle(Paint.Style.STROKE);
        rim.setStrokeWidth(Math.max(1f, 0.6f * density));
        scale.snap(1f);
        press.snap(0f);
    }

    void setDiameter(float diameter) {
        if (this.diameter == diameter) return;
        this.diameter = diameter;
        invalidateSelf();
    }

    void setDark(boolean dark) {
        if (this.dark == dark) return;
        this.dark = dark;
        invalidateSelf();
    }

    void setReveal(float reveal) {
        if (this.reveal == reveal) return;
        this.reveal = reveal;
        invalidateSelf();
    }

    void setPlacement(float pageX, float pageY) {
        this.pageX = pageX;
        this.pageY = pageY;
    }

    /** The scale the button is drawn at: 1 at rest, a little more while pressed. */
    float scaleValue() {
        return scale.value;
    }

    /** Moves the springs on by {@code dt} seconds; true while they still move. */
    boolean step(float dt) {
        boolean down = pressed && reveal > 0.01f;
        scale.target = down ? PRESS_SCALE : 1f;
        press.target = down ? 1f : 0f;
        scale.step(dt);
        press.step(dt);
        return !scale.isAtRest() || !press.isAtRest();
    }

    @Override
    public boolean isStateful() {
        return true;
    }

    @Override
    protected boolean onStateChange(int[] state) {
        boolean now = false;
        for (int s : state) {
            if (s == android.R.attr.state_pressed) now = true;
        }
        if (now == pressed) return false;
        pressed = now;
        invalidateSelf();
        return true;
    }

    @Override
    public void draw(Canvas canvas) {
        Rect b = getBounds();
        if (b.isEmpty() || diameter <= 0 || reveal <= 0.01f) return;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && group != null
                && canvas.isHardwareAccelerated() && group.draw(canvas, this)) {
            return;
        }
        drawFlat(canvas, b);
    }

    private void drawFlat(Canvas canvas, Rect b) {
        float r = diameter / 2f;
        float cx = b.exactCenterX();
        float cy = b.exactCenterY();

        int fillColor = dark
                ? (pressed ? Color.argb(0xD0, 0x3A, 0x3A, 0x3E) : Color.argb(0xB8, 0x26, 0x26, 0x2A))
                : (pressed ? Color.argb(0xD0, 0xE8, 0xE8, 0xEC) : Color.argb(0xB8, 0xFF, 0xFF, 0xFF));
        int rimColor = dark ? Color.argb(0x2A, 0xFF, 0xFF, 0xFF) : Color.argb(0x14, 0, 0, 0);
        fill.setColor(scaleAlpha(fillColor, reveal));
        rim.setColor(scaleAlpha(rimColor, reveal));

        canvas.drawCircle(cx, cy, r, fill);
        canvas.drawCircle(cx, cy, r - rim.getStrokeWidth() / 2f, rim);
    }

    private static int scaleAlpha(int color, float factor) {
        return (color & 0x00FFFFFF) | (Math.round(Color.alpha(color) * factor) << 24);
    }

    @Override
    public void setAlpha(int alpha) {
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }

    @Override
    public boolean getPadding(Rect padding) {
        padding.set(0, 0, 0, 0);
        return false;
    }
}
