package app.southstar21.extension.youtubemusic.liquidglass;

import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * A row of glass buttons drawn as one piece of liquid glass, as on iOS: a pressed button swells,
 * leans a little after the finger, stretching along the pull, and springs back when let go,
 * its icon moving with it as one body. Drops near each other bridge into one (a smooth union
 * of their shapes), so a pressed button pulled towards its neighbour melts into it.
 * <p>
 * It is the background of the row's container, under the buttons' icons, and refracts the
 * page's backdrop (the blurred album art) through an AGSL shader. The springs only run while
 * something moves; at rest it's a static display list.
 */
@SuppressLint("NewApi")
final class JellyGlass extends Drawable {
    /** Draws the page's backdrop, in the page's coordinates. */
    interface Backdrop {
        void draw(Canvas canvas);
    }

    private static final int MAX = 4;

    private static final String SHADER =
            "uniform shader content;\n" +
            "uniform float2 pad;\n" +       // the node's margin around the container
            "uniform float4 s0;\n" +        // per drop: center x, y, half width, press 0..1
            "uniform float4 s1;\n" +
            "uniform float4 s2;\n" +
            "uniform float4 s3;\n" +
            "uniform float4 t0;\n" +        // per drop: scale x, y, half height, fill
            "uniform float4 t1;\n" +
            "uniform float4 t2;\n" +
            "uniform float4 t3;\n" +
            "uniform float k;\n" +          // how far apart drops still bridge, px
            "uniform float kPress;\n" +     // how much further a pressed drop reaches
            "uniform float bezel;\n" +
            "uniform float strength;\n" +
            "uniform float dp;\n" +

            // A capsule (a circle when as wide as tall), scaled on each axis as the button is.
            "float drop(float2 p, float4 s, float4 t) {\n" +
            "  if (s.z <= 0.5) return 10000.0;\n" +
            "  float2 l = (p - s.xy) / t.xy;\n" +
            "  float2 hb = float2(s.z, t.z);\n" +
            "  float r = min(hb.x, hb.y);\n" +
            "  float2 q = abs(l) - hb + r;\n" +
            "  return (length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r) * min(t.x, t.y);\n" +
            "}\n" +

            "float smin(float a, float b, float k) {\n" +
            "  float h = max(k - abs(a - b), 0.0) / k;\n" +
            "  return min(a, b) - h * h * k * 0.25;\n" +
            "}\n" +

            // Each pair bridges on its own, further when one of the two is pressed: a press must
            // not make two other drops reach for each other.
            "float pair(float a, float b, float pa, float pb) {\n" +
            "  return smin(a, b, k + kPress * max(pa, pb));\n" +
            "}\n" +
            "float blend(float d0, float d1, float d2, float d3) {\n" +
            "  float d = min(min(d0, d1), min(d2, d3));\n" +
            "  d = min(d, pair(d0, d1, s0.w, s1.w));\n" +
            "  d = min(d, pair(d0, d2, s0.w, s2.w));\n" +
            "  d = min(d, pair(d0, d3, s0.w, s3.w));\n" +
            "  d = min(d, pair(d1, d2, s1.w, s2.w));\n" +
            "  d = min(d, pair(d1, d3, s1.w, s3.w));\n" +
            "  return min(d, pair(d2, d3, s2.w, s3.w));\n" +
            "}\n" +
            "float field(float2 p) {\n" +
            "  return blend(drop(p, s0, t0), drop(p, s1, t1), drop(p, s2, t2), drop(p, s3, t3));\n" +
            "}\n" +

            "float weight(float di, float d, float4 s) {\n" +
            "  return s.z <= 0.5 ? 0.0 : exp(-max(di - d, 0.0) / (6.0 * dp));\n" +
            "}\n" +

            "half4 main(float2 coord) {\n" +
            "  float2 p = coord - pad;\n" +
            "  float d0 = drop(p, s0, t0);\n" +
            "  float d1 = drop(p, s1, t1);\n" +
            "  float d2 = drop(p, s2, t2);\n" +
            "  float d3 = drop(p, s3, t3);\n" +
            "  float d = blend(d0, d1, d2, d3);\n" +
            "  float coverage = clamp(0.5 - d, 0.0, 1.0);\n" +
            // A soft shadow just below, lifting the glass off the page.
            "  float ds = field(p - float2(0.0, 2.5 * dp));\n" +
            "  half4 shadow = half4(0.0, 0.0, 0.0, 0.16 * (1.0 - smoothstep(-2.0 * dp, 9.0 * dp, ds)));\n" +
            "  if (coverage <= 0.0) return shadow;\n" +

            "  float e = 0.75;\n" +
            "  float2 n = float2(field(p + float2(e, 0.0)) - field(p - float2(e, 0.0)),\n" +
            "                    field(p + float2(0.0, e)) - field(p - float2(0.0, e)));\n" +
            "  n = n / max(length(n), 1e-4);\n" +

            // A lens: flat in the middle, bending hard at the rim, pulling in what's just outside.
            "  float t = clamp(1.0 + d / bezel, 0.0, 1.0);\n" +
            "  float bend = 1.0 - sqrt(max(1.0 - t * t, 0.0));\n" +
            "  float2 off = n * bend * strength;\n" +

            // Each drop's own fill and press, blended where drops melt together.
            "  float w0 = weight(d0, d, s0);\n" +
            "  float w1 = weight(d1, d, s1);\n" +
            "  float w2 = weight(d2, d, s2);\n" +
            "  float w3 = weight(d3, d, s3);\n" +
            "  float ws = max(w0 + w1 + w2 + w3, 1e-4);\n" +
            "  float fill = (w0 * t0.w + w1 * t1.w + w2 * t2.w + w3 * t3.w) / ws;\n" +
            "  float press = (w0 * s0.w + w1 * s1.w + w2 * s2.w + w3 * s3.w) / ws;\n" +

            "  half4 col;\n" +
            "  col.r = content.eval(coord + off * 1.12).r;\n" +
            "  col.g = content.eval(coord + off).g;\n" +
            "  col.b = content.eval(coord + off * 0.88).b;\n" +
            "  col.a = content.eval(coord + off).a;\n" +
            "  half luma = dot(col.rgb, half3(0.2126, 0.7152, 0.0722));\n" +
            "  col.rgb = mix(half3(luma), col.rgb, 1.4);\n" +

            // Clear, as iOS glass is: a light lift of what's behind, a whisper of white, more pressed.
            "  half amount = fill + 0.08 * press;\n" +
            "  col.rgb = mix(col.rgb, half3(1.0), amount);\n" +
            "  col.a = mix(col.a, 1.0, amount);\n" +
            "  col.rgb = min(col.rgb * 1.08 + 0.025, half3(col.a));\n" +

            // Light gathered in the bent rim, then the specular: thin and sharp where the edge
            // faces the light (top left) and, fainter, opposite it (bottom right), dim on the sides.
            "  float rim = smoothstep(0.25, 1.0, t);\n" +
            "  float2 light = normalize(float2(-0.6, -0.8));\n" +
            "  float facing = dot(n, light);\n" +
            "  float spec = pow(max(facing, 0.0), 3.0) + 0.55 * pow(max(-facing, 0.0), 3.0);\n" +
            "  col.rgb += half3(rim * (0.05 + 0.04 * press));\n" +
            "  col.rgb += half3(rim * rim * pow(max(facing, 0.0), 4.0) * 0.16);\n" +
            "  float edge = 1.0 - smoothstep(0.0, 1.3 * dp, -d);\n" +
            "  col.rgb += half3(edge * (0.07 + 0.7 * spec));\n" +

            "  col = clamp(col, 0.0, 1.0);\n" +
            "  col.rgb = min(col.rgb, half3(col.a));\n" +
            "  return col * coverage + shadow * (1.0 - coverage);\n" +
            "}\n";

    /** One button: its view and the springs of its drop. */
    static final class Drop {
        final int id;
        /** The drop's size at rest, px: a circle when equal. */
        float w, h;
        /** The size it's drawn at: as given, but no larger than its view or the row. */
        float drawnW, drawnH;
        /** Sized from its view, rather than given. */
        final boolean fit;
        final float fill;
        View view;
        /** The drop's center at rest, in the container's coordinates. */
        float cx, cy;
        boolean present;
        final LiquidGlassLens.Spring scale = new LiquidGlassLens.Spring(420f, 0.62f, 0.0005f);
        final LiquidGlassLens.Spring dx = new LiquidGlassLens.Spring(380f, 0.7f, 0.05f);
        final LiquidGlassLens.Spring dy = new LiquidGlassLens.Spring(380f, 0.7f, 0.05f);
        final LiquidGlassLens.Spring press = new LiquidGlassLens.Spring(400f, 0.9f, 0.002f);
        /** The button as drawn, glass and icon alike: offset from rest and scale on each axis. */
        float tx, ty, sx = 1f, sy = 1f;
        /** How far it may move up and down without leaving the container (which clips it). */
        float roomUp, roomDown;

        Drop(int id, float sizePx, float fill) {
            this(id, sizePx, sizePx, fill);
        }

        /** A capsule the size of its view. */
        static Drop filling(int id, float fill) {
            return new Drop(id, 0f, 0f, fill);
        }

        Drop(int id, float widthPx, float heightPx, float fill) {
            this.id = id;
            this.fit = widthPx <= 0f;
            this.w = widthPx;
            this.h = heightPx;
            this.fill = fill;
            scale.snap(1f);
        }

        boolean moving() {
            return !scale.isAtRest() || !dx.isAtRest() || !dy.isAtRest() || !press.isAtRest();
        }
    }

    /** Drawn over the glass, under the container's content (a switch's thumb). */
    private Drawable decor;
    /** YouTube Music's own background is replaced, not drawn under the glass. */
    private boolean replaceOriginal;

    JellyGlass decor(Drawable decor) {
        this.decor = decor;
        return this;
    }

    JellyGlass replacingOriginal() {
        replaceOriginal = true;
        return this;
    }

    private final ViewGroup page;
    private final float density;
    private final Backdrop backdrop;
    private final Drop[] drops;
    private ViewGroup container;
    private Drawable original;
    private Drop pressed;
    private float downX, downY;
    private long lastStep;
    private boolean animating;
    private final int[] location = new int[2];
    private final float[] uniform = new float[4];
    private RenderNode node;
    private RuntimeShader shader;
    private final FullPlayerGlass.Glass[] fallback;

    JellyGlass(ViewGroup page, float density, Backdrop backdrop, Drop... drops) {
        this.page = page;
        this.density = density;
        this.backdrop = backdrop;
        this.drops = drops;
        this.fallback = new FullPlayerGlass.Glass[drops.length];
        for (int i = 0; i < drops.length; i++) {
            fallback[i] = new FullPlayerGlass.Glass(FullPlayerGlass.Glass.CIRCLE, 0,
                    drops[i].fill > 0.1f ? FullPlayerGlass.Glass.STRONG_FILL : FullPlayerGlass.Glass.FILL);
        }
    }

    /**
     * Puts the glass behind {@code container}'s buttons and moves the springs one frame on.
     * Runs every frame the full player shows; cheap when everything is in place.
     */
    void apply(ViewGroup container, boolean relayout) {
        if (container == null) return;
        if (container != this.container) {
            // Moving to another copy (YouTube Music keeps more than one of some views): the old
            // one gets its own background back.
            ViewGroup old = this.container;
            if (old != null && old.getBackground() == this) old.setBackground(original);
            this.container = container;
            relayout = true;
        }
        Drawable bg = container.getBackground();
        if (bg != this) {
            original = bg == null ? null : bg.mutate();
            container.setBackground(this);
            relayout = true;
        }
        if (relayout) {
            for (Drop d : drops) d.view = d.id == 0 ? null : container.findViewById(d.id);
        }
        boolean changed = false;
        for (Drop d : drops) {
            View v = d.view;
            boolean present = v != null && v.getVisibility() == View.VISIBLE && v.getAlpha() > 0.05f
                    && v.getWidth() > 0 && v.getHeight() > 0 && isInside(v);
            // YouTube Music's own disc (the play button's white one) and ripples: the drop is the button now.
            if (present && v != container && v.getBackground() != null) v.setBackground(null);
            // Its own press animation would fight the jelly over the view's scale.
            if (present && v.getStateListAnimator() != null) v.setStateListAnimator(null);
            float cx = 0f, cy = 0f;
            if (present && v == container) {
                // The container itself (a switch): its glass fills it.
                cx = v.getWidth() / 2f;
                cy = v.getHeight() / 2f;
            } else if (present) {
                // The view's own translation is the jelly's, so leave it out.
                cx = v.getLeft() + v.getWidth() / 2f;
                cy = v.getTop() + v.getHeight() / 2f;
                for (ViewParent p = v.getParent(); p != container && p instanceof View; p = p.getParent()) {
                    View pv = (View) p;
                    cx += pv.getLeft() + pv.getTranslationX();
                    cy += pv.getTop() + pv.getTranslationY();
                }
            }
            if (present && d.fit && (d.w != v.getWidth() || d.h != v.getHeight())) {
                d.w = v.getWidth();
                d.h = v.getHeight();
                changed = true;
            }
            // Never larger than its button, nor than the row (which clips it): right after launch
            // a button can be measured before its final size.
            float limit = container.getHeight() - 2 * density;
            float dw = present ? Math.min(d.w, Math.min(v.getWidth(), limit)) : 0f;
            float dh = present ? Math.min(d.h, Math.min(v.getHeight(), limit)) : 0f;
            if (d.fit) {
                dw = present ? v.getWidth() : 0f;
                dh = present ? v.getHeight() : 0f;
            }
            if (dw != d.drawnW || dh != d.drawnH) {
                d.drawnW = dw;
                d.drawnH = dh;
                changed = true;
            }
            if (present != d.present || cx != d.cx || cy != d.cy) {
                d.present = present;
                d.cx = cx;
                d.cy = cy;
                float reach = d.h / 2f * 1.12f;
                d.roomUp = Math.max(0f, cy - reach);
                d.roomDown = Math.max(0f, container.getHeight() - cy - reach);
                changed = true;
            }
        }
        // A press that opened a dialog (cast) never sees its finger lift, which goes to the
        // dialog: let go once the window loses focus, or the drop stays swollen (and clipped).
        if (pressed != null && !container.hasWindowFocus()) release();
        // The row sliding into place (the player opening) doesn't redraw it: the backdrop it
        // shows has to be drawn again for where it is now.
        if (!changed && !Float.isNaN(drawnX) && locate(container) && (offX != drawnX || offY != drawnY)) {
            changed = true;
        }
        if (step() || changed) invalidateSelf();
    }

    private boolean isInside(View v) {
        if (v == container) return true;
        for (ViewParent p = v.getParent(); p != null; p = p.getParent()) {
            if (p == container) return true;
        }
        return false;
    }

    /**
     * Set when what the glass shows changed. YouTube Music redraws the row for its own reasons
     * (every frame while the queue sheet moves): then the last drawing is drawn again as is.
     */
    private boolean dirty = true;
    private int drawnW, drawnH;
    private float drawnX = Float.NaN, drawnY = Float.NaN;

    @Override
    public void invalidateSelf() {
        dirty = true;
        super.invalidateSelf();
    }

    /** The backdrop changed (a new song): redraw what the glass shows. */
    void backdropChanged() {
        if (container != null) invalidateSelf();
    }

    // region Touch

    /** Every touch on the window, in screen coordinates; never consumed. */
    void onTouch(MotionEvent event) {
        ViewGroup c = container;
        if (c == null) return;
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                release();
                if (!c.isShown()) return;
                c.getLocationOnScreen(location);
                float x = event.getRawX() - location[0], y = event.getRawY() - location[1];
                for (Drop d : drops) {
                    if (!d.present) continue;
                    float slop = 6 * density;
                    if (Math.abs(x - d.cx) <= d.w / 2f + slop && Math.abs(y - d.cy) <= d.h / 2f + slop
                            && (d.w != d.h || Math.hypot(x - d.cx, y - d.cy) <= d.w / 2f + slop)) {
                        pressed = d;
                        downX = event.getRawX();
                        downY = event.getRawY();
                        d.scale.target = 1.08f;
                        d.press.target = 1f;
                        kick();
                        return;
                    }
                }
                return;
            case MotionEvent.ACTION_MOVE:
                Drop d = pressed;
                if (d == null) return;
                // The button leans after the finger, less the further it goes (rubber band).
                d.dx.target = rubber(event.getRawX() - downX, 8 * density);
                float y2 = rubber(event.getRawY() - downY, 6 * density);
                d.dy.target = Math.max(-d.roomUp, Math.min(d.roomDown, y2));
                kick();
                return;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                release();
                return;
            default:
        }
    }

    private float offX, offY;

    /** The container's place on the page, into {@link #offX}, {@link #offY}; false if it's not on it. */
    private boolean locate(View c) {
        float ox = 0f, oy = 0f;
        for (View v = c; v != page; ) {
            ox += v.getLeft() + v.getTranslationX();
            oy += v.getTop() + v.getTranslationY();
            ViewParent p = v.getParent();
            if (!(p instanceof View)) return false;
            v = (View) p;
        }
        offX = ox;
        offY = oy;
        return true;
    }

    /** Lets go of any press. */
    void release() {
        Drop d = pressed;
        if (d == null) return;
        pressed = null;
        d.scale.target = 1f;
        d.dx.target = 0f;
        d.dy.target = 0f;
        d.press.target = 0f;
        kick();
    }

    private static float rubber(float offset, float max) {
        return max * (float) Math.tanh(offset * 0.3f / max);
    }

    private void kick() {
        if (!animating) lastStep = System.nanoTime();
        animating = true;
        if (container != null) container.postInvalidateOnAnimation();
    }

    // endregion

    /** Moves the springs on to now. Returns whether anything moved. */
    private boolean step() {
        if (!animating) return false;
        long now = System.nanoTime();
        float dt = Math.min(1f / 30f, Math.max(0f, (now - lastStep) / 1e9f));
        lastStep = now;
        boolean moving = false;
        for (Drop d : drops) {
            d.scale.step(dt);
            d.dx.step(dt);
            d.dy.step(dt);
            d.press.step(dt);
            moving |= d.moving();
            shape(d);
            // Glass and icon move as one body.
            if (d.view != null) {
                View v = d.view;
                // YouTube Music animates its buttons on press too: the jelly owns them now.
                v.animate().cancel();
                if (v.getAnimation() != null) v.clearAnimation();
                set(v, d.tx, d.ty, d.sx, d.sy);
            }
        }
        if (moving) {
            container.postInvalidateOnAnimation();
        } else {
            // Settled where the springs are headed: still swollen while held, at rest otherwise
            // (each spring snaps to its target once at rest, so the shape is exact either way).
            animating = false;
        }
        return true;
    }

    private static void set(View v, float tx, float ty, float sx, float sy) {
        if (v.getTranslationX() != tx) v.setTranslationX(tx);
        if (v.getTranslationY() != ty) v.setTranslationY(ty);
        if (v.getScaleX() != sx) v.setScaleX(sx);
        if (v.getScaleY() != sy) v.setScaleY(sy);
    }

    /**
     * The button's transform from its springs: swollen while pressed, offset towards the finger,
     * and, as on iOS, a little wider along a sideways pull and taller along a vertical one, with
     * the other axis giving way.
     */
    private void shape(Drop d) {
        float r = Math.max(1f, Math.min(d.w, d.h) / 2f);
        float pullX = Math.min(0.08f, Math.abs(d.dx.value) / r * 0.35f);
        float pullY = Math.min(0.08f, Math.abs(d.dy.value) / r * 0.35f);
        d.tx = d.dx.value;
        d.ty = d.dy.value;
        d.sx = d.scale.value * (1f + pullX - 0.5f * pullY);
        d.sy = d.scale.value * (1f + pullY - 0.5f * pullX);
    }

    @Override
    public void draw(Canvas canvas) {
        if (original != null && !replaceOriginal) {
            original.setBounds(getBounds());
            original.draw(canvas);
        }
        ViewGroup c = container;
        if (c == null) return;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && canvas.isHardwareAccelerated()
                && c.getWidth() > 0 && c.getHeight() > 0) {
            drawLiquid(canvas, c);
            if (decor != null) decor.draw(canvas);
        } else {
            for (int i = 0; i < drops.length; i++) {
                Drop d = drops[i];
                if (!d.present) continue;
                float x = d.cx + d.tx, y = d.cy + d.ty, rx = d.drawnW / 2f * d.sx, ry = d.drawnH / 2f * d.sy;
                fallback[i].setBounds(Math.round(x - rx), Math.round(y - ry), Math.round(x + rx), Math.round(y + ry));
                fallback[i].draw(canvas);
            }
            if (decor != null) decor.draw(canvas);
        }
    }

    private void drawLiquid(Canvas canvas, ViewGroup c) {
        float strength = 12 * density;
        int pad = (int) Math.ceil(strength * 1.1f) + 2;
        int w = c.getWidth() + 2 * pad, h = c.getHeight() + 2 * pad;
        // The container's place on the page.
        if (!locate(c)) return;
        float ox = offX, oy = offY;
        // Drawn again if the row moved on the page since: recorded mid-animation (the player
        // opening), the backdrop came out shifted and left the buttons' tops uncovered.
        if (!dirty && node != null && node.hasDisplayList() && drawnW == w && drawnH == h
                && ox == drawnX && oy == drawnY) {
            int save = canvas.save();
            canvas.translate(-pad, -pad);
            canvas.drawRenderNode(node);
            canvas.restoreToCount(save);
            return;
        }
        dirty = false;
        drawnW = w;
        drawnH = h;
        drawnX = ox;
        drawnY = oy;
        if (node == null) {
            node = new RenderNode("JellyGlass");
            shader = new RuntimeShader(SHADER);
        }
        node.setPosition(0, 0, w, h);
        RecordingCanvas rc = node.beginRecording(w, h);
        try {
            rc.translate(pad - ox, pad - oy);
            backdrop.draw(rc);
        } finally {
            node.endRecording();
        }

        for (int i = 0; i < MAX; i++) {
            Drop d = i < drops.length && drops[i].present ? drops[i] : null;
            // The container moving itself (a switch) carries its glass along: drawn at rest.
            boolean self = d != null && d.view == c;
            uniform[0] = d == null ? 0f : d.cx + (self ? 0f : d.tx);
            uniform[1] = d == null ? 0f : d.cy + (self ? 0f : d.ty);
            uniform[2] = d == null ? 0f : d.drawnW / 2f;
            uniform[3] = d == null ? 0f : Math.max(0f, Math.min(1f, d.press.value));
            shader.setFloatUniform("s" + i, uniform);
            uniform[0] = d == null || self ? 1f : d.sx;
            uniform[1] = d == null || self ? 1f : d.sy;
            uniform[2] = d == null ? 0f : d.drawnH / 2f;
            uniform[3] = d == null ? 0f : d.fill;
            shader.setFloatUniform("t" + i, uniform);
        }
        shader.setFloatUniform("pad", pad, pad);
        // Drops a little apart only bulge towards each other; pressed, they reach much further.
        shader.setFloatUniform("k", 8f * density);
        shader.setFloatUniform("kPress", 9f * density);
        shader.setFloatUniform("bezel", 18 * density);
        shader.setFloatUniform("strength", strength);
        shader.setFloatUniform("dp", density);
        node.setRenderEffect(RenderEffect.createRuntimeShaderEffect(shader, "content"));

        int save = canvas.save();
        canvas.translate(-pad, -pad);
        canvas.drawRenderNode(node);
        canvas.restoreToCount(save);
    }

    @Override
    public boolean getPadding(Rect padding) {
        padding.set(0, 0, 0, 0);
        return false;
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
}
