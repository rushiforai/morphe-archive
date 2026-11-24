package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.graphics.Shader;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Real glass for one header's icon buttons (Android 13 and newer). Each button's
 * {@link GlassButtonDrawable} draws its own circle through {@link #draw}; the circles refract
 * the same backdrop and, when two are close, melt into each other as one piece of glass (a smooth
 * union of their shapes), the way iOS glass drops do.
 * <p>
 * The backdrop is the page's content behind the header (the feed scrolling under it), recorded
 * once per frame into a shared display list, and only when the circles are showing. Every circle
 * re-uses that recording through a display list of its own: blurred a little, then bent by an
 * AGSL lens at the rim. The shader works in the circle's own coordinates and only draws the
 * pixels nearest to its own circle, so a bridge between two circles is drawn once, not twice.
 * <p>
 * The press and bridging model follows the jelly glass of the YouTube Music patch.
 */
@SuppressLint("NewApi")
final class HeaderGlass {
    /** Draws the page's content behind the header, in the page's coordinates. */
    interface Backdrop {
        void draw(Canvas canvas);
    }

    /** Four drops (this one and up to three neighbours), a tint, lift, the scalars and the light. */
    static final int UNIFORMS = 32;

    private static final String[] DROP_NAMES = {"s0", "s1", "s2", "s3"};

    private static final String SHADER =
            "uniform shader content;\n" +
            "uniform float4 s0;\n" +        // per drop: center x, y, radius, press 0..1 (radius 0: none)
            "uniform float4 s1;\n" +
            "uniform float4 s2;\n" +
            "uniform float4 s3;\n" +
            "uniform float4 tint;\n" +      // the glass' own color and how much of it
            "uniform float2 lift;\n" +      // gain and bias of what is behind
            "uniform float rimDark;\n" +    // a faint dark rim, for light glass
            "uniform float alpha;\n" +      // how revealed it is
            "uniform float k;\n" +          // how far apart drops still bridge, px
            "uniform float kPress;\n" +     // how much further a pressed drop reaches
            "uniform float bezel;\n" +
            "uniform float strength;\n" +
            "uniform float dp;\n" +
            "uniform float2 light;\n" +    // unit direction towards the light, in screen axes
            "uniform float4 glint;\n" +    // tilt glint: anchor x, y from the drop center (px), sigma (px), peak (0 = off)
            "uniform float2 glintOpp;\n" + // the weaker glint opposite it

            "float drop(float2 p, float4 s) {\n" +
            "  return s.z <= 0.5 ? 10000.0 : length(p - s.xy) - s.z;\n" +
            "}\n" +

            "float smin(float a, float b, float k) {\n" +
            "  float h = max(k - abs(a - b), 0.0) / k;\n" +
            "  return min(a, b) - h * h * k * 0.25;\n" +
            "}\n" +

            // Each pair bridges on its own, further when one of the two is pressed.
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
            "  return blend(drop(p, s0), drop(p, s1), drop(p, s2), drop(p, s3));\n" +
            "}\n" +

            "float weight(float di, float d, float4 s) {\n" +
            "  return s.z <= 0.5 ? 0.0 : exp(-max(di - d, 0.0) / (6.0 * dp));\n" +
            "}\n" +

            "half4 main(float2 p) {\n" +
            "  float d0 = drop(p, s0);\n" +
            "  float d1 = drop(p, s1);\n" +
            "  float d2 = drop(p, s2);\n" +
            "  float d3 = drop(p, s3);\n" +
            // A pixel is drawn by the circle it is nearest to; the others draw their own.
            "  if (d1 < d0 || d2 < d0 || d3 < d0) return half4(0.0);\n" +
            "  float d = blend(d0, d1, d2, d3);\n" +
            "  float coverage = clamp(0.5 - d, 0.0, 1.0);\n" +
            // A soft shadow just below, lifting the glass off the page. Short: the header clips
            // what is drawn below it, a few dp under the circles, and a longer one ends in a line.
            "  float ds = field(p - float2(0.0, 1.0 * dp));\n" +
            "  float sf = 1.0 - smoothstep(-1.0 * dp, 4.0 * dp, ds);\n" +
            "  half4 shadow = half4(0.0, 0.0, 0.0, 0.10 * sf * sf);\n" +
            "  if (coverage <= 0.0) return shadow * alpha;\n" +

            "  float e = 0.75;\n" +
            "  float2 n = float2(field(p + float2(e, 0.0)) - field(p - float2(e, 0.0)),\n" +
            "                    field(p + float2(0.0, e)) - field(p - float2(0.0, e)));\n" +
            "  n = n / max(length(n), 1e-4);\n" +

            // A lens: flat in the middle, bending hard at the rim, pulling in what's just outside.
            "  float t = clamp(1.0 + d / bezel, 0.0, 1.0);\n" +
            "  float bend = 1.0 - sqrt(max(1.0 - t * t, 0.0));\n" +
            "  float2 off = n * bend * strength;\n" +

            "  float w0 = weight(d0, d, s0);\n" +
            "  float w1 = weight(d1, d, s1);\n" +
            "  float w2 = weight(d2, d, s2);\n" +
            "  float w3 = weight(d3, d, s3);\n" +
            "  float ws = max(w0 + w1 + w2 + w3, 1e-4);\n" +
            "  float press = (w0 * s0.w + w1 * s1.w + w2 * s2.w + w3 * s3.w) / ws;\n" +

            // What is behind, premultiplied: where the page is see-through (a video, say) the
            // glass stays see-through too instead of turning black.
            "  half4 mid = content.eval(p + off);\n" +
            "  half a = mid.a;\n" +
            "  half3 rgb = half3(content.eval(p + off * 1.03).r, mid.g, content.eval(p + off * 0.97).b);\n" +
            "  rgb = clamp(rgb / max(a, 0.001), 0.0, 1.0);\n" +
            "  half luma = dot(rgb, half3(0.2126, 0.7152, 0.0722));\n" +
            "  rgb = mix(half3(luma), rgb, 1.15);\n" +
            "  rgb = clamp(rgb * lift.x + lift.y, 0.0, 1.0);\n" +
            "  half4 col = half4(rgb * a, a);\n" +

            // Clear, as iOS glass is: a light wash of the glass' own color, more when pressed.
            "  half amount = tint.a + 0.10 * press;\n" +
            "  col = col * (1.0 - amount) + half4(half3(tint.rgb), 1.0) * amount;\n" +

            // Light gathered in the bent rim, then the specular: thin and sharp where the edge
            // faces the light (top left) and, fainter, opposite it (bottom right).
            "  float rim = smoothstep(0.25, 1.0, t);\n" +
            "  float facing = dot(n, light);\n" +
            "  float spec = pow(max(facing, 0.0), 3.0) + 0.55 * pow(max(-facing, 0.0), 3.0);\n" +
            "  half glow = half(rim * (0.05 + 0.04 * press) + rim * rim * pow(max(facing, 0.0), 4.0) * 0.08);\n" +
            "  col.rgb += glow;\n" +
            "  col.a += glow * (1.0 - col.a);\n" +
            "  float edge = 1.0 - smoothstep(0.0, 1.0 * dp, -d);\n" +
            "  col.rgb *= 1.0 - edge * rimDark;\n" +
            // The tilt glint on the bent rim, on the circle this pixel belongs to.
            "  float2 ga = p - glint.xy;\n" +
            "  float2 gb = p - glintOpp;\n" +
            "  float gk = -0.5 / max(glint.z * glint.z, 1.0);\n" +
            "  float g = exp(dot(ga, ga) * gk) + 0.35 * exp(dot(gb, gb) * gk);\n" +
            "  half shine = half(edge * (0.03 + 0.35 * spec) + rim * g * glint.w);\n" +
            "  col.rgb += shine;\n" +
            "  col.a += shine * (1.0 - col.a);\n" +

            "  col = clamp(col, 0.0, 1.0);\n" +
            "  col.rgb = min(col.rgb, half3(col.a));\n" +
            "  return (col * coverage + shadow * (1.0 - coverage)) * alpha;\n" +
            "}\n";

    private final float density;
    private final Backdrop backdrop;
    /** The header's buttons (shared with the controller, which keeps it up to date). */
    private final ArrayList<GlassButtonDrawable> drops;

    private RenderNode shared;
    private RenderEffect blur;
    private int width, height;
    /** The shared backdrop has to be recorded again for this frame. */
    private boolean stale;

    /** The neighbours of the circle being drawn, in its coordinates. */
    private final float[] glintAt = new float[5];
    private final float[] nx = new float[3], ny = new float[3], nr = new float[3], np = new float[3];

    HeaderGlass(float density, Backdrop backdrop, ArrayList<GlassButtonDrawable> drops) {
        this.density = density;
        this.backdrop = backdrop;
        this.drops = drops;
    }

    /**
     * A new frame is about to draw circles: the backdrop is the page's top {@code height} px, and
     * is recorded when first needed. Not called while the circles are hidden, so nothing is
     * recorded then.
     */
    void beginFrame(int width, int height) {
        this.width = width;
        this.height = height;
        stale = true;
    }

    private boolean ensureBackdrop() {
        if (width <= 0 || height <= 0) return false;
        if (shared == null) {
            shared = new RenderNode("HeaderGlassBackdrop");
            // Its own layer, as the edge blur's backdrop has: the base color is drawn under the
            // page (DST_OVER) and only lands there in a layer of its own. Without one the
            // see-through parts stay empty and the light glass showed them as dark gray.
            shared.setUseCompositingLayer(true, null);
        }
        if (!stale) return true;
        stale = false;
        shared.setPosition(0, 0, width, height);
        RecordingCanvas rc = shared.beginRecording(width, height);
        try {
            backdrop.draw(rc);
        } finally {
            shared.endRecording();
        }
        return true;
    }

    /**
     * Draws {@code self}'s circle (and its share of any bridge to a neighbour) in its own
     * coordinates, which are the button's.
     *
     * @return false if it can't, so the caller draws its flat disc
     */
    boolean draw(Canvas canvas, GlassButtonDrawable self) {
        float r = self.diameter / 2f;
        if (r < 1f || !ensureBackdrop()) return false;
        Rect b = self.getBounds();
        float si = Math.max(0.5f, self.scaleValue());
        float k = 8f * density, kPress = 9f * density;
        float reach = k + kPress;

        // Neighbours close enough to bridge, in this circle's own scale.
        int n = 0;
        for (int i = 0; i < drops.size() && n < 3; i++) {
            GlassButtonDrawable o = drops.get(i);
            if (o == self || o.reveal <= 0.01f || o.diameter <= 0f) continue;
            float dx = (o.pageX - self.pageX) / si;
            float dy = (o.pageY - self.pageY) / si;
            float ro = o.diameter / 2f * o.scaleValue() / si;
            float gap = (float) Math.hypot(dx, dy) - r - ro;
            if (gap > reach + 2f * density) continue;
            nx[n] = dx;
            ny[n] = dy;
            nr[n] = ro;
            np[n] = clamp01(o.press.value);
            n++;
        }

        float strength = 5f * density;
        float pad = (float) Math.ceil(Math.max(14f * density, strength * 1.1f + 2f) + (n > 0 ? reach : 0f));
        float c = r + pad;
        int size = (int) Math.ceil(2f * c);

        float[] u = self.uniforms;
        Arrays.fill(u, 0f);
        put(u, 0, c, c, r, clamp01(self.press.value));
        for (int i = 0; i < n; i++) put(u, 4 * (i + 1), c + nx[i], c + ny[i], nr[i], np[i]);
        if (self.dark) {
            put(u, 16, 0.24f, 0.24f, 0.26f, 0.80f);
            u[20] = 1.0f;
            u[21] = 0.03f;
            u[22] = 0f;
        } else {
            put(u, 16, 1f, 1f, 1f, 0.80f);
            u[20] = 1.08f;
            u[21] = 0.025f;
            u[22] = 0.08f;
        }
        u[23] = clamp01(self.reveal);
        boolean tilt = NavbarStyle.get().tiltLight;
        u[24] = -0.6f;
        u[25] = -0.8f;
        if (tilt) {
            TiltLight.glint(r, r, r, TiltLight.angle(), glintAt);
            u[26] = c + glintAt[0];
            u[27] = c + glintAt[1];
            u[28] = glintAt[4];
            u[29] = self.dark ? 0.6f : 0.75f;
            u[30] = c + glintAt[2];
            u[31] = c + glintAt[3];
        } else {
            u[28] = 1f;
        }

        if (self.node == null) {
            self.node = new RenderNode("HeaderGlassButton");
            self.shader = new RuntimeShader(SHADER);
            self.shader.setFloatUniform("k", k);
            self.shader.setFloatUniform("kPress", kPress);
            self.shader.setFloatUniform("bezel", 8f * density);
            self.shader.setFloatUniform("strength", strength);
            self.shader.setFloatUniform("dp", density);
            if (blur == null) {
                float radius = 9f * density;
                blur = RenderEffect.createBlurEffect(radius, radius, Shader.TileMode.CLAMP);
            }
        }
        // Only a change of what the shader is given needs a new effect.
        if (!self.uniformsSet || !Arrays.equals(u, self.lastUniforms)) {
            RuntimeShader s = self.shader;
            for (int i = 0; i < 4; i++) s.setFloatUniform(DROP_NAMES[i], u[4 * i], u[4 * i + 1], u[4 * i + 2], u[4 * i + 3]);
            s.setFloatUniform("tint", u[16], u[17], u[18], u[19]);
            s.setFloatUniform("lift", u[20], u[21]);
            s.setFloatUniform("rimDark", u[22]);
            s.setFloatUniform("alpha", u[23]);
            s.setFloatUniform("light", u[24], u[25]);
            s.setFloatUniform("glint", u[26], u[27], u[28], u[29]);
            s.setFloatUniform("glintOpp", u[30], u[31]);
            // Blur first, then the lens.
            self.effect = RenderEffect.createChainEffect(
                    RenderEffect.createRuntimeShaderEffect(s, "content"), blur);
            self.node.setRenderEffect(self.effect);
            System.arraycopy(u, 0, self.lastUniforms, 0, UNIFORMS);
            self.uniformsSet = true;
        }

        RenderNode node = self.node;
        node.setPosition(0, 0, size, size);
        RecordingCanvas rc = node.beginRecording(size, size);
        try {
            // The circle's node pixel (c, c) is the page point under the button's center.
            rc.translate(c - self.pageX, c - self.pageY);
            rc.drawRenderNode(shared);
        } finally {
            node.endRecording();
        }

        int save = canvas.save();
        canvas.translate(b.exactCenterX() - c, b.exactCenterY() - c);
        canvas.drawRenderNode(node);
        canvas.restoreToCount(save);
        return true;
    }

    private static void put(float[] u, int at, float a, float b, float c, float d) {
        u[at] = a;
        u[at + 1] = b;
        u[at + 2] = c;
        u[at + 3] = d;
    }

    private static float clamp01(float v) {
        return Math.max(0f, Math.min(1f, v));
    }
}
