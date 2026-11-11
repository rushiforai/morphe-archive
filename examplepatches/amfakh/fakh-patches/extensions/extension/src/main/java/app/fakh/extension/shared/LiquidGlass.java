package app.fakh.extension.shared;

import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.graphics.Shader;
import android.os.Build;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;

/**
 * The Liquid Glass look of a {@link GlassCapsule}: what is behind the bar, blurred, inside the capsule (Android 12 and
 * newer), its rim bending that backdrop the way the edge of glass does, and a lens that magnifies it under the pill
 * (both Android 13 and newer). Everything runs on the GPU: the views behind the bar are recorded into a render node,
 * never read back from the screen. A failure turns the part that failed off for this capsule, and the capsule carries
 * on with its plain fill.
 */
final class LiquidGlass {
    /** How far the blur reaches, which is also how far past the capsule the backdrop is recorded. */
    private static final float BLUR_DP = 18;
    /** The backdrop is recorded at a quarter of its size: the blur hides the loss and it costs a sixteenth. */
    private static final float DOWNSAMPLE = 4;
    /** How much the middle of the lens magnifies, and how much more its rim bends the backdrop. */
    private static final float CENTER_MAGNIFY = 0.10f;
    private static final float RIM_BEND = 0.14f;
    /** How deep the lens's curved edge reaches in, as a share of the pill's half height; the middle stays flat. */
    private static final float LENS_BAND = 0.6f;
    /** How deep the capsule's mirrored rim reaches in, as a share of its half height. */
    private static final float RIM_BAND = 0.42f;

    /** The lens: the backdrop drawn larger, bending more toward the rim of the rounded box. */
    private static final String LENS_SHADER = ""
            + "uniform shader content;\n"
            + "uniform float4 box;\n"
            + "uniform float radius;\n"
            + "uniform float center;\n"
            + "uniform float rim;\n"
            + "half4 main(float2 p) {\n"
            + "  float2 mid = (box.xy + box.zw) * 0.5;\n"
            + "  float2 hs = (box.zw - box.xy) * 0.5;\n"
            + "  float2 q = abs(p - mid) - (hs - float2(radius));\n"
            + "  float d = length(max(q, float2(0.0))) + min(max(q.x, q.y), 0.0) - radius;\n"
            + "  float inside = clamp(0.5 - d, 0.0, 1.0);\n"
            + "  if (inside <= 0.0) return half4(0.0);\n"
            // A quarter circle across the outer band: flat and clear inside it, bending ever harder toward the edge.
            + "  float edge = 1.0 - clamp(-d / max(1.0, " + LENS_BAND + " * min(hs.x, hs.y)), 0.0, 1.0);\n"
            + "  float bend = 1.0 - sqrt(1.0 - edge * edge);\n"
            + "  float2 source = mid + (p - mid) * (1.0 - center - rim * bend);\n"
            + "  return content.eval(source) * inside;\n"
            + "}\n";

    /**
     * The rim: within a band along the edge the backdrop is mirrored across the band's inner line, so what runs under
     * the edge shows upside down and moves the other way, as it does through the edge of real glass.
     */
    private static final String RIM_SHADER = ""
            + "uniform shader content;\n"
            + "uniform float4 box;\n"
            + "uniform float radius;\n"
            + "uniform float band;\n"
            + "half4 main(float2 p) {\n"
            + "  float2 mid = (box.xy + box.zw) * 0.5;\n"
            + "  float2 hs = (box.zw - box.xy) * 0.5;\n"
            + "  float2 q = abs(p - mid) - (hs - float2(radius));\n"
            + "  float d = length(max(q, float2(0.0))) + min(max(q.x, q.y), 0.0) - radius;\n"
            + "  float inside = clamp(0.5 - d, 0.0, 1.0);\n"
            + "  if (inside <= 0.0) return half4(0.0);\n"
            + "  float2 side = sign(p - mid);\n"
            + "  float2 normal = q.x > 0.0 && q.y > 0.0 ? normalize(q) * side\n"
            + "      : (q.x > q.y ? float2(side.x, 0.0) : float2(0.0, side.y));\n"
            + "  float depth = max(0.0, -d);\n"
            + "  float2 source = depth < band ? p - normal * (2.0 * (band - depth)) : p;\n"
            + "  return content.eval(source) * inside;\n"
            + "}\n";

    private final float density;
    private final Path clip = new Path();
    private RenderNode backdrop;
    private RenderNode lensNode;
    private RenderNode rimNode;
    private Object lensShader;
    private Object rimShader;
    /** Where the backdrop node was drawn last, in the drawable's coordinates. */
    private float nodeLeft;
    private float nodeTop;
    private boolean blurBroken;
    private boolean shadersBroken;
    /** Whether the backdrop is being recorded, so a view behind the bar that draws the bar again can't recurse. */
    private boolean recording;

    LiquidGlass(float density) {
        this.density = density;
    }

    /**
     * Draws the views behind {@code bar} that {@code shape} covers, blurred, clipped to {@code shape} with corners of
     * {@code radius}, over a fill of {@code base} where they leave the backdrop empty. Says whether it drew: not
     * before Android 12, on a software canvas, or after a failure.
     */
    boolean backdrop(Canvas canvas, View bar, int base, RectF shape, float radius) {
        if (blurBroken || recording || Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !canvas.isHardwareAccelerated()) {
            return false;
        }
        recording = true;
        try {
            float pad = BLUR_DP * density;
            float scale = 1 / DOWNSAMPLE;
            int width = Math.max(1, (int) Math.ceil((shape.width() + 2 * pad) * scale));
            int height = Math.max(1, (int) Math.ceil((shape.height() + 2 * pad) * scale));
            RenderNode node = backdrop;
            if (node == null) {
                node = new RenderNode("fakh-liquid-glass");
                // A little more color, as glass seems to pull out of what's behind it.
                ColorMatrix saturate = new ColorMatrix();
                saturate.setSaturation(1.5f);
                float blur = pad * scale;
                node.setRenderEffect(RenderEffect.createChainEffect(
                        RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(saturate)),
                        RenderEffect.createBlurEffect(blur, blur, Shader.TileMode.CLAMP)));
                backdrop = node;
            }
            node.setPosition(0, 0, width, height);
            nodeLeft = shape.left - pad;
            nodeTop = shape.top - pad;
            Canvas into = node.beginRecording(width, height);
            try {
                into.scale(scale, scale);
                into.translate(-nodeLeft, -nodeTop);
                // Views wholly outside the strip the glass shows are skipped instead of recorded.
                into.clipRect(nodeLeft, nodeTop, nodeLeft + width * DOWNSAMPLE, nodeTop + height * DOWNSAMPLE);
                into.drawColor(base);
                drawBehind(into, bar);
            } finally {
                node.endRecording();
            }
            clip.rewind();
            clip.addRoundRect(shape, radius, radius, Path.Direction.CW);
            int saved = canvas.save();
            canvas.clipPath(clip);
            canvas.translate(nodeLeft, nodeTop);
            canvas.scale(DOWNSAMPLE, DOWNSAMPLE);
            canvas.drawRenderNode(node);
            canvas.restoreToCount(saved);
            return true;
        } catch (Throwable failure) {
            blurBroken = true;
            return false;
        } finally {
            recording = false;
        }
    }

    /** Bends the backdrop at the rim of {@code shape}, as the edge of glass does. Android 13 and newer. */
    void rim(Canvas canvas, RectF shape, float radius, int width, int height) {
        RuntimeShader shader = shader(true);
        if (shader == null) return;
        shader.setFloatUniform("band", RIM_BAND * Math.min(shape.width(), shape.height()) / 2);
        rimNode = bend(canvas, rimNode, shader, shape, radius, width, height);
    }

    /** Magnifies the backdrop under {@code shape}, more toward its rim, as a lens does. Android 13 and newer. */
    void lens(Canvas canvas, RectF shape, float radius, int width, int height) {
        RuntimeShader shader = shader(false);
        if (shader == null) return;
        shader.setFloatUniform("center", CENTER_MAGNIFY);
        shader.setFloatUniform("rim", RIM_BEND);
        lensNode = bend(canvas, lensNode, shader, shape, radius, width, height);
    }

    /** The rim's or the lens's shader, made once; null where shaders can't run or after a failure. */
    private RuntimeShader shader(boolean rim) {
        if (shadersBroken || backdrop == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return null;
        try {
            if (rim && rimShader == null) rimShader = new RuntimeShader(RIM_SHADER);
            if (!rim && lensShader == null) lensShader = new RuntimeShader(LENS_SHADER);
            return (RuntimeShader) (rim ? rimShader : lensShader);
        } catch (Throwable failure) {
            shadersBroken = true;
            return null;
        }
    }

    /** Draws the backdrop through {@code shader} over {@code shape}, using {@code layer} or a new node it returns. */
    private RenderNode bend(Canvas canvas, RenderNode layer, RuntimeShader shader, RectF shape, float radius,
            int width, int height) {
        if (width <= 0 || height <= 0) return layer;
        try {
            if (layer == null) layer = new RenderNode("fakh-liquid-bend");
            shader.setFloatUniform("box", shape.left, shape.top, shape.right, shape.bottom);
            shader.setFloatUniform("radius", Math.max(0, radius));
            layer.setPosition(0, 0, width, height);
            layer.setRenderEffect(RenderEffect.createRuntimeShaderEffect(shader, "content"));
            Canvas into = layer.beginRecording(width, height);
            try {
                into.translate(nodeLeft, nodeTop);
                into.scale(DOWNSAMPLE, DOWNSAMPLE);
                into.drawRenderNode(backdrop);
            } finally {
                layer.endRecording();
            }
            canvas.drawRenderNode(layer);
        } catch (Throwable failure) {
            shadersBroken = true;
        }
        return layer;
    }

    /**
     * Whether a view the window draws before {@code bar} changed since it was last drawn, so the backdrop has to be
     * recorded again. Recording the backdrop can mark some of them changed again (a Compose view inside a pager on
     * Jira does), so this is only asked for a short while after a touch, never on an idle screen.
     */
    static boolean behindChanged(View bar) {
        View branch = bar;
        while (branch.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) branch.getParent();
            int index = parent.indexOfChild(branch);
            for (int i = 0; i < index; i++) {
                View view = parent.getChildAt(i);
                if (view.getVisibility() == View.VISIBLE && view.isDirty()) return true;
            }
            branch = parent;
        }
        return false;
    }

    /**
     * Draws into {@code canvas}, in {@code bar}'s coordinates, every view the window draws before it: at each level
     * up to the window, the siblings that come before the bar's branch. A SurfaceView is left out, as its video is a
     * layer under the window that views can't draw.
     */
    private static void drawBehind(Canvas canvas, View bar) {
        float x = 0;
        float y = 0;
        View branch = bar;
        while (branch.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) branch.getParent();
            // Where the parent's top left corner is, measured from the bar's.
            x -= branch.getLeft() + branch.getTranslationX() - parent.getScrollX();
            y -= branch.getTop() + branch.getTranslationY() - parent.getScrollY();
            int index = parent.indexOfChild(branch);
            for (int i = 0; i < index; i++) {
                View view = parent.getChildAt(i);
                if (view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0 || view instanceof SurfaceView) continue;
                int saved = canvas.save();
                canvas.translate(x + view.getLeft() - parent.getScrollX(), y + view.getTop() - parent.getScrollY());
                if (!view.getMatrix().isIdentity()) canvas.concat(view.getMatrix());
                canvas.translate(-view.getScrollX(), -view.getScrollY());
                view.draw(canvas);
                canvas.restoreToCount(saved);
            }
            branch = parent;
        }
    }
}
