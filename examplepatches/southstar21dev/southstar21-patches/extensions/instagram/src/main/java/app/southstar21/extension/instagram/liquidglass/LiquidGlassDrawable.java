package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;

/**
 * Background drawable for the tab bar that renders a floating Liquid Glass pill.
 * <p>
 * Android can't sample what is behind a view, so each frame the siblings drawn below the
 * tab bar are re-recorded into a RenderNode (cheap: their display lists are reused), then
 * drawn back through a blur and an AGSL refraction shader.
 * The selection droplet lives in {@link LiquidGlassLens}, stacked above the bar.
 * <ul>
 *   <li>Android 13+: blur + edge refraction, chromatic fringe, specular rim (shader).</li>
 *   <li>Android 12: blur + tint.</li>
 *   <li>Older: translucent tint only.</li>
 * </ul>
 */
@SuppressLint("NewApi")
final class LiquidGlassDrawable extends Drawable {

    private static final String GLASS_SHADER =
            "uniform shader content;\n" +
            "uniform float2 origin;\n" +   // pill top-left inside the backdrop node
            "uniform float2 size;\n" +     // pill size
            "uniform float radius;\n" +
            "uniform float bezel;\n" +     // width of the refracting edge band
            "uniform float strength;\n" +  // max displacement in px
            "uniform half4 tint;\n" +      // rgb + mix amount in alpha
            "uniform float dark;\n" +

            "float sdRoundRect(float2 p, float2 b, float r) {\n" +
            "  float2 q = abs(p) - b + r;\n" +
            "  return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;\n" +
            "}\n" +

            "half4 main(float2 coord) {\n" +
            "  float2 half_size = size * 0.5;\n" +
            "  float2 p = coord - origin - half_size;\n" +
            "  float d = sdRoundRect(p, half_size, radius);\n" +
            "  float coverage = clamp(0.5 - d, 0.0, 1.0);\n" +   // anti-aliased edge
            "  if (coverage <= 0.0) return half4(0.0);\n" +

            // Surface normal from the SDF gradient.
            "  float e = 0.75;\n" +
            "  float2 n = float2(\n" +
            "    sdRoundRect(p + float2(e, 0.0), half_size, radius) - sdRoundRect(p - float2(e, 0.0), half_size, radius),\n" +
            "    sdRoundRect(p + float2(0.0, e), half_size, radius) - sdRoundRect(p - float2(0.0, e), half_size, radius));\n" +
            "  n = n / max(length(n), 1e-4);\n" +

            // Circular lens profile: flat in the middle, bending hard at the rim,
            // so content from just outside the pill gets pulled in at the edges.
            "  float t = clamp(1.0 + d / bezel, 0.0, 1.0);\n" +  // 0 inside band, 1 at edge
            "  float bend = 1.0 - sqrt(max(1.0 - t * t, 0.0));\n" +
            "  float2 offset = n * bend * strength;\n" +

            "  half4 col;\n" +
            "  col.r = content.eval(coord + offset * 1.06).r;\n" +
            "  col.g = content.eval(coord + offset).g;\n" +
            "  col.b = content.eval(coord + offset * 0.94).b;\n" +
            "  col.a = 1.0;\n" +

            // Vibrancy: glass slightly boosts saturation of what's behind it.
            "  half luma = dot(col.rgb, half3(0.2126, 0.7152, 0.0722));\n" +
            "  col.rgb = mix(half3(luma), col.rgb, 1.25);\n" +
            "  col.rgb = mix(col.rgb, tint.rgb, tint.a);\n" +

            // Specular rim, lit from the top left with a softer bounce bottom right.
            "  float rim = smoothstep(0.55, 1.0, t);\n" +
            "  float2 light = normalize(float2(-0.45, -0.9));\n" +
            "  float spec = pow(max(dot(n, light), 0.0), 2.0) + 0.45 * pow(max(dot(n, -light), 0.0), 2.0);\n" +
            "  col.rgb += half3(rim * spec * mix(0.22, 0.18, dark));\n" +

            // Faint inner glow along the top for depth.
            "  float top = 1.0 - smoothstep(0.0, size.y * 0.55, coord.y - origin.y);\n" +
            "  col.rgb += half3(top * mix(0.06, 0.03, dark));\n" +

            "  return clamp(col, 0.0, 1.0) * coverage;\n" +
            "}\n";

    private final View host;
    private final float density;
    private final int blurRadiusPx;
    private final float refraction;

    /** Size of the shrunk pill relative to the full one, measured from iOS Instagram. */
    static final float MINIMIZED_SCALE = 0.83f;

    private final RectF pill = new RectF();
    private final RectF fullPill = new RectF();
    private float minimize;
    private int insetLeft, insetRight, insetBottom;
    private boolean dark;
    private Integer hostColorHint;
    /** Brightness of the content around the pill, from {@link BackdropSampler}. */
    private float backdropLuminance = -1f;
    /** Current tint mix, eased towards {@link #tintTarget()} each frame. */
    private float tint = -1f;

    private final Paint tintPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    // Backdrop, lazily created on Android 12+.
    private RenderNode backdrop;
    private RenderNode refracted;
    private RenderNode clipped;
    private RuntimeShader shader;
    private RenderEffect blurEffect;
    private RenderEffect glassEffect;
    private String effectKey;


    LiquidGlassDrawable(View host, float density, int blurRadiusDp, int refractionPercent) {
        this.host = host;
        this.density = density;
        this.blurRadiusPx = Math.round(blurRadiusDp * density);
        this.refraction = refractionPercent / 100f;

        rimPaint.setStyle(Paint.Style.STROKE);
        rimPaint.setStrokeWidth(Math.max(1f, 0.8f * density));
    }

    void setPillInsets(int left, int right, int bottom) {
        insetLeft = left;
        insetRight = right;
        insetBottom = bottom;
        invalidateSelf();
    }

    void setDark(boolean dark) {
        if (this.dark == dark) return;
        this.dark = dark;
        effectKey = null;
        invalidateSelf();
    }

    void setHostColorHint(Integer color) {
        hostColorHint = color;
    }

    Integer getHostColorHint() {
        return hostColorHint;
    }

    void setBackdropLuminance(float luminance) {
        backdropLuminance = luminance;
        invalidateSelf();
    }

    /**
     * iOS keeps glass legible by adapting to what's behind it. Instagram's icons are black in
     * light mode and white in dark mode, so frost the glass more when the content behind it
     * has the same brightness as the icons.
     */
    private float tintTarget() {
        // iOS Instagram's glass is heavily frosted: white ~45% in light mode, smoky in dark.
        if (backdropLuminance < 0f) return dark ? 0.42f : 0.55f;
        if (dark) return 0.42f + 0.25f * smoothstep(0.45f, 0.85f, backdropLuminance);
        return 0.55f + 0.23f * (1f - smoothstep(0.22f, 0.62f, backdropLuminance));
    }

    private static float smoothstep(float edge0, float edge1, float x) {
        float t = Math.max(0f, Math.min(1f, (x - edge0) / (edge1 - edge0)));
        return t * t * (3f - 2f * t);
    }

    private void stepTint() {
        float target = tintTarget();
        if (tint < 0f) {
            tint = target;
        } else if (Math.abs(target - tint) > 0.005f) {
            tint += (target - tint) * 0.18f;
            invalidateSelf();
        } else {
            tint = target;
        }
    }

    boolean isDark() {
        return dark;
    }

    /** Full size pill bounds in the host's coordinates, ignoring minimization. */
    RectF getFullPill() {
        Rect b = getBounds();
        fullPill.set(b.left + insetLeft, b.top, b.right - insetRight, b.bottom - insetBottom);
        return fullPill;
    }

    /** Current pill bounds in the host's coordinates, scaled down around the bottom center while shrunk. */
    RectF getPill() {
        RectF full = getFullPill();
        pill.set(full);
        if (minimize > 0f) {
            float s = currentScale();
            float w = full.width() * s;
            float h = full.height() * s;
            pill.set(full.centerX() - w / 2f, full.bottom - h, full.centerX() + w / 2f, full.bottom);
        }
        return pill;
    }

    float currentScale() {
        return 1f - (1f - MINIMIZED_SCALE) * minimize;
    }

    /** {@code progress} 0 = full bar, 1 = shrunk while scrolling. */
    void setMinimize(float progress) {
        if (minimize == progress) return;
        minimize = progress;
        invalidateSelf();
    }

    @Override
    public void draw(Canvas canvas) {
        getPill();
        if (pill.width() <= 0 || pill.height() <= 0) return;
        float radius = pill.height() / 2f;
        stepTint();

        boolean glassDrawn = false;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && canvas.isHardwareAccelerated()) {
            glassDrawn = drawBackdrop(canvas, radius);
        }
        if (!glassDrawn || Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU || refraction <= 0f) {
            // The shader tints on its own; every other path needs a tint layer.
            int alpha = glassDrawn ? Math.round(255 * Math.min(0.9f, 0.22f + tint)) : (dark ? 0xD9 : 0xD0);
            tintPaint.setColor(dark ? Color.argb(alpha, 0x1C, 0x1C, 0x1E) : Color.argb(alpha, 0xFA, 0xFA, 0xFC));
            canvas.drawRoundRect(pill, radius, radius, tintPaint);
        }

        drawRim(canvas, radius);
    }


    /**
     * Records every sibling drawn below the tab bar into a RenderNode and draws it back
     * through the glass effect. Returns false if there was nothing to record.
     */
    private boolean drawBackdrop(Canvas canvas, float radius) {
        if (!(host.getParent() instanceof ViewGroup)) return false;
        ViewGroup parent = (ViewGroup) host.getParent();
        int hostIndex = parent.indexOfChild(host);
        if (hostIndex <= 0) return false;

        boolean refract = Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && refraction > 0f;
        // iOS Instagram bends only a thin band at the rim.
        float strength = refract ? refraction * 0.15f * pill.height() : 0f;
        int pad = (int) Math.ceil(Math.max(strength * 1.1f, blurRadiusPx * 2f)) + 2;

        int w = Math.round(pill.width()) + 2 * pad;
        int h = Math.round(pill.height()) + 2 * pad;

        if (backdrop == null) {
            backdrop = new RenderNode("LiquidGlassBackdrop");
            refracted = new RenderNode("LiquidGlassRefraction");
            clipped = new RenderNode("LiquidGlassClip");
        }
        backdrop.setPosition(0, 0, w, h);

        // Pill origin in the parent's coordinate space.
        float originX = host.getLeft() + host.getTranslationX() + pill.left;
        float originY = host.getTop() + host.getTranslationY() + pill.top;

        RecordingCanvas rc = backdrop.beginRecording(w, h);
        try {
            rc.drawColor(dark ? Color.BLACK : Color.WHITE);
            rc.translate(pad - originX, pad - originY);
            for (int i = 0; i < hostIndex; i++) {
                View child = parent.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE || child.getAlpha() == 0f) continue;
                // The edge blur sits between content and bar; the glass blurs on its own.
                if (child instanceof EdgeBlurView) continue;
                if (!intersects(child, originX - pad, originY - pad, w, h)) continue;
                int save = rc.save();
                rc.translate(child.getLeft() + child.getTranslationX(), child.getTop() + child.getTranslationY());
                child.draw(rc);
                rc.restoreToCount(save);
            }
        } finally {
            backdrop.endRecording();
        }

        updateEffects(w, h, pad, radius, strength, refract);
        backdrop.setRenderEffect(blurEffect);

        // Refraction runs in its own node rather than chained after the blur: in a chain the
        // shader's coordinates no longer match the node, which drew the glass inset from the
        // pill with a transparent band around it.
        RenderNode source = backdrop;
        if (glassEffect != null) {
            refracted.setPosition(0, 0, w, h);
            RecordingCanvas gc = refracted.beginRecording(w, h);
            try {
                gc.drawRenderNode(backdrop);
            } finally {
                refracted.endRecording();
            }
            refracted.setRenderEffect(glassEffect);
            source = refracted;
        }

        // Wrap in a node clipped to the pill outline: anti-aliased, unlike clipPath.
        clipped.setPosition(0, 0, Math.round(pill.width()), Math.round(pill.height()));
        Outline outline = new Outline();
        outline.setRoundRect(0, 0, Math.round(pill.width()), Math.round(pill.height()), radius);
        clipped.setOutline(outline);
        clipped.setClipToOutline(true);
        RecordingCanvas cc = clipped.beginRecording();
        try {
            cc.translate(-pad, -pad);
            cc.drawRenderNode(source);
        } finally {
            clipped.endRecording();
        }

        int save = canvas.save();
        canvas.translate(pill.left, pill.top);
        canvas.drawRenderNode(clipped);
        canvas.restoreToCount(save);
        return true;
    }

    private static boolean intersects(View v, float x, float y, int w, int h) {
        float left = v.getLeft() + v.getTranslationX();
        float top = v.getTop() + v.getTranslationY();
        return left < x + w && left + v.getWidth() > x && top < y + h && top + v.getHeight() > y;
    }

    private void updateEffects(int w, int h, int pad, float radius, float strength, boolean refract) {
        String key = w + "x" + h + ":" + pad + ":" + dark + ":" + refract + ":" + Math.round(tint * 100);
        if (key.equals(effectKey)) return;
        effectKey = key;

        blurEffect = blurRadiusPx > 0
                ? RenderEffect.createBlurEffect(blurRadiusPx, blurRadiusPx, Shader.TileMode.CLAMP)
                : null;

        if (!refract) {
            glassEffect = null;
            return;
        }

        if (shader == null) shader = new RuntimeShader(GLASS_SHADER);
        shader.setFloatUniform("origin", pad, pad);
        shader.setFloatUniform("size", w - 2f * pad, h - 2f * pad);
        shader.setFloatUniform("radius", radius);
        shader.setFloatUniform("bezel", Math.min(radius, 22f * density));
        shader.setFloatUniform("strength", strength);
        if (dark) {
            shader.setFloatUniform("tint", 0.11f, 0.11f, 0.12f, tint);
        } else {
            shader.setFloatUniform("tint", 0.98f, 0.98f, 0.99f, tint);
        }
        shader.setFloatUniform("dark", dark ? 1f : 0f);
        glassEffect = RenderEffect.createRuntimeShaderEffect(shader, "content");
    }

    private void drawRim(Canvas canvas, float radius) {
        int bright = dark ? Color.argb(0x55, 0xFF, 0xFF, 0xFF) : Color.argb(0x99, 0xFF, 0xFF, 0xFF);
        int faint = dark ? Color.argb(0x14, 0xFF, 0xFF, 0xFF) : Color.argb(0x22, 0xFF, 0xFF, 0xFF);
        int mid = Color.argb(0x08, 0xFF, 0xFF, 0xFF);
        rimPaint.setShader(new LinearGradient(
                pill.left, pill.top, pill.left + pill.width() * 0.35f, pill.bottom,
                new int[]{bright, mid, faint}, new float[]{0f, 0.6f, 1f}, Shader.TileMode.CLAMP));
        float half = rimPaint.getStrokeWidth() / 2f;
        RectF r = new RectF(pill.left + half, pill.top + half, pill.right - half, pill.bottom - half);
        canvas.drawRoundRect(r, radius - half, radius - half, rimPaint);
    }

    @Override
    public void setAlpha(int alpha) {
        // The bar fades as a whole via View alpha.
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
        // Don't let setBackground() overwrite the controller's padding.
        padding.set(0, 0, 0, 0);
        return false;
    }
}
