package app.southstar21.extension.youtubemusic.liquidglass;

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
            "uniform float saturation;\n" +
            "uniform float edgeClear;\n" +   // how much less tint right at the edge, 0..1
            "uniform float edgeWidth;\n" +   // px over which the tint comes back
            "uniform float sideGlare;\n" +   // white glare on the rounded ends

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

            // Circular lens profile: flat in the middle, bending hard at the rim,
            // so content from just outside the pill gets pulled in at the edges.
            "  float t = clamp(1.0 + d / bezel, 0.0, 1.0);\n" +  // 0 inside band, 1 at edge
            "  half4 col;\n" +
            "  float2 n = float2(0.0);\n" +
            // The flat middle bends nothing: one sample instead of four.
            "  if (t <= 0.0) {\n" +
            "    col = content.eval(coord);\n" +
            "  } else {\n" +
            // Surface normal: the gradient of the rounded rect's distance, worked out directly
            // (towards the nearest corner's center in the corners, straight out along the sides).
            "    float2 q = abs(p) - half_size + radius;\n" +
            "    float2 sgn = float2(p.x >= 0.0 ? 1.0 : -1.0, p.y >= 0.0 ? 1.0 : -1.0);\n" +
            "    if (q.x > 0.0 && q.y > 0.0) n = normalize(q) * sgn;\n" +
            "    else if (q.x > q.y) n = float2(sgn.x, 0.0);\n" +
            "    else n = float2(0.0, sgn.y);\n" +
            "    float bend = 1.0 - sqrt(max(1.0 - t * t, 0.0));\n" +
            "    float2 offset = n * bend * strength;\n" +
            "    col.r = content.eval(coord + offset * 1.06).r;\n" +
            "    col.g = content.eval(coord + offset).g;\n" +
            "    col.b = content.eval(coord + offset * 0.94).b;\n" +
            // Kept, not forced opaque: a video plays in a hole of the recording (its own layer,
            // under the window), and the glass must let it show through rather than go solid.
            "    col.a = content.eval(coord + offset).a;\n" +
            "  }\n" +

            // Vibrancy: glass slightly boosts saturation of what's behind it.
            "  half luma = dot(col.rgb, half3(0.2126, 0.7152, 0.0722));\n" +
            "  col.rgb = mix(half3(luma), col.rgb, saturation);\n" +
            // As on iOS: dense in the body, clearing towards the edge so what the rim bends in
            // from outside shows there.
            "  float clearing = 1.0 - smoothstep(0.0, edgeWidth, -d);\n" +
            "  half amount = tint.a * (1.0 - edgeClear * clearing * clearing);\n" +
            // Premultiplied: the material covers holes too, as much as it covers content.
            "  col.rgb = mix(col.rgb, tint.rgb, amount);\n" +
            "  col.a = mix(col.a, 1.0, amount);\n" +

            // Specular rim, lit from the top left with a softer bounce bottom right.
            "  float rim = smoothstep(0.55, 1.0, t);\n" +
            "  float2 light = normalize(float2(-0.45, -0.9));\n" +
            "  float spec = pow(max(dot(n, light), 0.0), 2.0) + 0.45 * pow(max(dot(n, -light), 0.0), 2.0);\n" +
            "  col.rgb += half3(rim * spec * mix(0.22, 0.18, dark));\n" +
            "  col.rgb += half3(rim * pow(abs(n.x), 3.0) * sideGlare);\n" +

            // Faint inner glow along the top for depth.
            "  float top = 1.0 - smoothstep(0.0, size.y * 0.55, coord.y - origin.y);\n" +
            "  col.rgb += half3(top * mix(0.06, 0.03, dark));\n" +

            "  col = clamp(col, 0.0, 1.0);\n" +
            "  col.rgb = min(col.rgb, half3(col.a));\n" +
            "  return col * coverage;\n" +
            "}\n";

    /** The backdrop is recorded this many times smaller on each side (see recordBackdrop). */
    private static final int DOWNSAMPLE = 2;

    private final View host;
    private final float density;
    /** The customizable values, refreshed at the start of each draw. */
    private final NavbarStyle.Source styleSource;
    private NavbarStyle style;

    private final RectF pill = new RectF();
    private final RectF fullPill = new RectF();
    private float minimize;
    private boolean southstar21;
    /** iOS style: 0..1 while the bar is pressed, its glass bending more and over a wider rim. */
    private float liquid;
    /** Southstar21 style: the pane swells (around its center) and leans sideways while pressed. */
    private float swell = 1f;
    private float lean;
    /** Southstar21 style: a glow lighting the glass from under the finger, 0..1, at {@link #glowX}. */
    private float glow;
    private float glowX;
    private final Paint glowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private int insetLeft, insetTop, insetRight, insetBottom;
    private boolean dark;
    private Integer hostColorHint;
    /** Brightness of the content around the pill, from {@link BackdropSampler}. */
    private float backdropLuminance = -1f;
    /** Current tint mix, eased towards {@link #tintTarget()} each frame. */
    private float tint = -1f;

    private final Paint tintPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    // Backdrop, lazily created on Android 12+.
    /** Views the glass looks past, such as YouTube Music's dark gradient behind the bar. */
    private final java.util.Set<View> excluded = java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private RenderNode refracted;
    /** Holds the finished glass in a layer (see Layers). */
    private RenderNode glass;
    private RenderNode clipped;
    private RuntimeShader shader;
    private RenderEffect glassEffect;
    private String effectKey;


    LiquidGlassDrawable(View host, float density, NavbarStyle.Source styleSource) {
        this.host = host;
        this.density = density;
        this.styleSource = styleSource;
        this.style = styleSource.get();

        rimPaint.setStyle(Paint.Style.STROKE);
        rimPaint.setStrokeWidth(Math.max(1f, 0.8f * density));
        glowPaint.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.ADD));
    }

    /** Copies of the video surfaces under the bar, drawn into its holes; null for none. */
    private SurfaceSnapshots snapshots;

    void setSnapshots(SurfaceSnapshots snapshots) {
        this.snapshots = snapshots;
    }

    SurfaceSnapshots snapshots() {
        return snapshots;
    }

    void setPillInsets(int left, int right, int bottom) {
        setPillInsets(left, 0, right, bottom);
    }

    /** The pill's distance from each edge of the host. */
    void setPillInsets(int left, int top, int right, int bottom) {
        if (insetLeft == left && insetTop == top && insetRight == right && insetBottom == bottom) return;
        insetLeft = left;
        insetTop = top;
        insetRight = right;
        insetBottom = bottom;
        invalidateSelf();
    }

    /**
     * The southstar21 style's glass: a thick lens whose rim shows the content inside it
     * stretched out to the edge (sampling inward, 28dp across a 20dp band at the default
     * strength), and more saturated. The iOS style bends a thin band outward instead.
     */
    void setSouthstar21(boolean on) {
        if (southstar21 == on) return;
        southstar21 = on;
        effectKey = null;
        invalidateSelf();
    }

    /** iOS style: how liquid the glass is while pressed, 0 at rest. */
    void setLiquid(float liquid) {
        if (Math.abs(this.liquid - liquid) < 0.01f && (liquid != 0f || this.liquid == 0f)) return;
        this.liquid = liquid;
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
        // Measured from iOS Instagram screenshots: the bar is mostly material, ~86% near black
        // in dark mode and ~85% white in light mode, with what's behind it only showing faintly.
        // The Opacity setting is the base (86% by default).
        float base = style.opacity;
        if (backdropLuminance < 0f) return base;
        float extra = dark ? 0.06f * smoothstep(0.45f, 0.85f, backdropLuminance)
                : 0.05f * (1f - smoothstep(0.22f, 0.62f, backdropLuminance));
        return Math.min(1f, base + extra * (1f - base) / 0.14f);
    }

    /** The glass won't show {@code view}, though it stays on screen. */
    void exclude(View view) {
        if (view != null) excluded.add(view);
    }

    boolean isExcluded(View view) {
        return excluded.contains(view);
    }

    /** The material's color, with the Tint setting mixed in. */
    int materialColor(int alpha) {
        return style.material(dark, alpha);
    }

    /** The corner radius of the pill right now, from the Roundness setting. */
    float cornerRadius() {
        return pill.height() / 2f * style.roundness;
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

    /** How much the glass is tinted right now, 0..1 (see {@link #tintTarget()}). */
    float currentTint() {
        return tint < 0f ? tintTarget() : tint;
    }

    boolean isDark() {
        return dark;
    }

    /** Full size pill bounds in the host's coordinates, ignoring minimization. */
    RectF getFullPill() {
        Rect b = getBounds();
        fullPill.set(b.left + insetLeft, b.top + insetTop, b.right - insetRight, b.bottom - insetBottom);
        return fullPill;
    }

    /**
     * Current pill bounds in the host's coordinates: scaled down around the bottom center while
     * shrunk, then swollen around its own center and leaning sideways while pressed.
     */
    RectF getPill() {
        RectF full = getFullPill();
        pill.set(full);
        if (minimize > 0f) {
            float s = currentScale();
            float w = full.width() * s;
            float h = full.height() * s;
            pill.set(full.centerX() - w / 2f, full.bottom - h, full.centerX() + w / 2f, full.bottom);
        }
        if (swell != 1f) {
            float cx = pill.centerX(), cy = pill.centerY();
            float hw = pill.width() * swell / 2f, hh = pill.height() * swell / 2f;
            pill.set(cx - hw, cy - hh, cx + hw, cy + hh);
        }
        if (lean != 0f) pill.offset(lean, 0f);
        return pill;
    }

    /** Southstar21 style: {@code swell} scales the pill around its center, {@code lean} moves it in px. */
    void setPaneTransform(float swell, float lean) {
        if (this.swell == swell && this.lean == lean) return;
        this.swell = swell;
        this.lean = lean;
        invalidateSelf();
    }

    /** Southstar21 style: a glow of {@code progress} 0..1 centered at {@code x} in the host's coordinates. */
    void setGlow(float progress, float x) {
        if (glow == progress && (progress <= 0f || glowX == x)) return;
        glow = progress;
        glowX = x;
        invalidateSelf();
    }

    float currentScale() {
        return 1f - (1f - style.shrunkScale) * minimize;
    }

    /** {@code progress} 0 = full bar, 1 = shrunk while scrolling. */
    void setMinimize(float progress) {
        if (minimize == progress) return;
        minimize = progress;
        invalidateSelf();
    }

    @Override
    public void draw(Canvas canvas) {
        style = styleSource.get();
        getPill();
        if (pill.width() <= 0 || pill.height() <= 0) return;
        float radius = cornerRadius();
        stepTint();

        if (style.lightweight()) {
            drawLightweight(canvas, radius);
            drawGlow(canvas, radius);
            if (style.rim > 0f) drawRim(canvas, radius);
            return;
        }

        boolean glassDrawn = false;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && canvas.isHardwareAccelerated()) {
            glassDrawn = drawBackdrop(canvas, radius);
        }
        if (!glassDrawn || Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU || style.refraction <= 0f) {
            // The shader tints on its own; every other path needs a tint layer.
            int alpha = glassDrawn ? Math.round(255 * Math.min(0.9f, 0.22f + tint)) : (dark ? 0xD9 : 0xD0);
            tintPaint.setColor(materialColor(alpha));
            canvas.drawRoundRect(pill, radius, radius, tintPaint);
        }

        drawGlow(canvas, radius);
        drawRim(canvas, radius);
    }

    // region Lightweight glass

    /**
     * The blurred backdrop's colors made more vivid and a little brighter, which reads as frosted
     * glass; a blur alone leaves them dull and grey.
     */
    private static final android.graphics.ColorMatrix FROSTED = frosted();

    private static android.graphics.ColorMatrix frosted() {
        android.graphics.ColorMatrix colors = new android.graphics.ColorMatrix();
        colors.setSaturation(1.5f);
        float lift = 15f;
        colors.postConcat(new android.graphics.ColorMatrix(new float[]{
                1, 0, 0, 0, lift,
                0, 1, 0, 0, lift,
                0, 0, 1, 0, lift,
                0, 0, 0, 1, 0}));
        return colors;
    }

    /** The content behind the pill, blurred and frosted by its RenderEffect. */
    private RenderNode lightNode;
    private float lightBlur = -1f;
    private final android.graphics.Path lightPath = new android.graphics.Path();
    private final RectF lightArea = new RectF();
    private final RectF shadowRect = new RectF();
    private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint sheenPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    /** The pill's top and bottom and the theme the sheen's gradient was made for. */
    private float sheenTop = Float.NaN, sheenBottom = Float.NaN;
    private boolean sheenDark;

    /**
     * The glass drawn simply: what's behind the pill through one blur (and a color matrix),
     * re-recorded on each draw into a plain node, clipped to the pill, under a translucent fill,
     * a sheen and a painted shadow. No refraction shader, no layers, no elevation shadow, no edge
     * blur. Blurred only on Android 14+ (on 12 and 13 a blur redrawn while the player moves can
     * crash the app); before that the backdrop's base color stands in for the page, or its text
     * would show sharp through the glass.
     */
    private void drawLightweight(Canvas canvas, float radius) {
        drawPaintedShadow(canvas, radius);

        float blur = style.blurDp * density;
        if (blur > 0f) {
            lightPath.reset();
            lightPath.addRoundRect(pill, radius, radius, android.graphics.Path.Direction.CW);
            int save = canvas.save();
            canvas.clipPath(lightPath);
            boolean blurred = Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE
                    && canvas.isHardwareAccelerated() && drawLightBackdrop(canvas, blur);
            if (!blurred) canvas.drawColor(dark ? Color.BLACK : Color.WHITE);
            canvas.restoreToCount(save);
        }

        tintPaint.setColor(materialColor(Math.round(255 * currentTint())));
        canvas.drawRoundRect(pill, radius, radius, tintPaint);

        if (pill.top != sheenTop || pill.bottom != sheenBottom || dark != sheenDark) {
            sheenTop = pill.top;
            sheenBottom = pill.bottom;
            sheenDark = dark;
            sheenPaint.setShader(new LinearGradient(0, pill.top, 0, pill.bottom,
                    Color.argb(dark ? 0x1A : 0x59, 0xFF, 0xFF, 0xFF), Color.TRANSPARENT, Shader.TileMode.CLAMP));
        }
        canvas.drawRoundRect(pill, radius, radius, sheenPaint);
    }

    /** A soft shadow under the pill from three offset round rects, instead of an elevation shadow. */
    private void drawPaintedShadow(Canvas canvas, float radius) {
        // The Shadow setting is 0.5 by default.
        int alpha = Math.round((dark ? 0.10f : 0.05f) * 255 * style.shadow / 0.5f);
        if (alpha <= 0) return;
        float step = density;
        for (int i = 3; i >= 1; i--) {
            shadowRect.set(pill);
            shadowRect.inset(-i * 0.5f * step, -i * 0.5f * step);
            shadowRect.offset(0, i * step);
            shadowPaint.setColor(Color.argb(Math.min(255, alpha / i), 0, 0, 0));
            float r = radius + i * 0.5f * step;
            canvas.drawRoundRect(shadowRect, r, r, shadowPaint);
        }
    }

    /**
     * Records the siblings drawn below the glass around the pill (with room for the blur) over
     * the base color, into {@link #lightNode}, and draws it. The node only refers to the views'
     * display lists, so recording is cheap. False if there's nothing to record.
     */
    private boolean drawLightBackdrop(Canvas canvas, float blur) {
        if (!(host.getParent() instanceof ViewGroup)) return false;
        ViewGroup parent = (ViewGroup) host.getParent();
        int hostIndex = parent.indexOfChild(host);
        if (hostIndex <= 0) return false;

        float hostX = host.getLeft() + host.getTranslationX();
        float hostY = host.getTop() + host.getTranslationY();
        float margin = (float) Math.ceil(blur);
        lightArea.set((float) Math.floor(hostX + pill.left - margin), (float) Math.floor(hostY + pill.top - margin),
                (float) Math.ceil(hostX + pill.right + margin), (float) Math.ceil(hostY + pill.bottom + margin));
        int w = Math.round(lightArea.width()), h = Math.round(lightArea.height());
        if (w <= 0 || h <= 0) return false;

        if (lightNode == null) lightNode = new RenderNode("LiquidGlassLight");
        if (blur != lightBlur) {
            // Set only when it changes: a new effect makes the GPU redo it.
            lightBlur = blur;
            lightNode.setRenderEffect(RenderEffect.createChainEffect(
                    RenderEffect.createColorFilterEffect(new android.graphics.ColorMatrixColorFilter(FROSTED)),
                    RenderEffect.createBlurEffect(blur, blur, Shader.TileMode.CLAMP)));
        }
        lightNode.setPosition(0, 0, w, h);
        RecordingCanvas rc = lightNode.beginRecording(w, h);
        try {
            // Under the content, which may have no background of its own: blurred text over
            // nothing would come out mostly clear, with the sharp text showing.
            rc.drawColor(dark ? Color.BLACK : Color.WHITE);
            rc.translate(-lightArea.left, -lightArea.top);
            for (int i = 0; i < hostIndex; i++) {
                View child = parent.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE || child.getAlpha() == 0f) continue;
                if (child instanceof EdgeBlurView || isExcluded(child)) continue;
                if (!intersects(child, lightArea.left, lightArea.top, w, h)) continue;
                int save = rc.save();
                rc.translate(child.getLeft() + child.getTranslationX(), child.getTop() + child.getTranslationY());
                child.draw(rc);
                rc.restoreToCount(save);
            }
        } finally {
            lightNode.endRecording();
        }

        int save = canvas.save();
        canvas.translate(lightArea.left - hostX, lightArea.top - hostY);
        canvas.drawRenderNode(lightNode);
        canvas.restoreToCount(save);
        return true;
    }

    // endregion

    /**
     * The glass "lit from within" where it's pressed (after Kyant's InteractiveHighlight): a faint
     * lift over the whole pill plus a soft spot around the selection, added on top of the glass
     * and under the tab icons.
     */
    private void drawGlow(Canvas canvas, float radius) {
        if (glow <= 0.001f) return;
        float g = Math.min(glow, 1.5f);
        glowPaint.setShader(null);
        glowPaint.setColor(Color.argb(Math.round(255 * Math.min(1f, 0.08f * g)), 0xFF, 0xFF, 0xFF));
        canvas.drawRoundRect(pill, radius, radius, glowPaint);

        float spot = pill.height() * 1.5f;
        int c = Color.argb(Math.round(255 * Math.min(1f, 0.15f * g)), 0xFF, 0xFF, 0xFF);
        float x = Math.max(pill.left, Math.min(pill.right, glowX));
        glowPaint.setShader(new android.graphics.RadialGradient(x, pill.centerY(), spot,
                new int[]{c, c, Color.argb(0, 0xFF, 0xFF, 0xFF)}, new float[]{0f, 0.5f, 1f},
                Shader.TileMode.CLAMP));
        canvas.drawRoundRect(pill, radius, radius, glowPaint);
    }


    /** The pill's refraction in px: negative bends inward (see drawBackdrop). */
    private float strength(boolean refract) {
        return !refract ? 0f
                : southstar21 ? -28f * density * style.refraction / 0.6f
                : style.refraction * 0.15f * pill.height() * (1f + 0.9f * liquid);
    }

    /**
     * The margin of backdrop recorded around the pill: enough for the blur, plus, for glass
     * that bends content in from outside (the iOS style, strength > 0), the bend. The
     * southstar21 style bends inward, from inside the pill, so it needs none: a 46dp margin
     * for nothing made every glass render several times the area it shows.
     */
    private int pad(float strength) {
        float bendMargin = strength > 0f ? strength * 1.1f : 0f;
        return (int) Math.ceil(Math.max(bendMargin, Math.round(style.blurDp * density) * 2f)) + 2;
    }

    private boolean refracts() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && style.refraction > 0f;
    }

    /**
     * Records every sibling drawn below the glass into a RenderNode and draws it back
     * through the glass effect. Returns false if there was nothing to record.
     */
    private boolean drawBackdrop(Canvas canvas, float radius) {
        if (!(host.getParent() instanceof ViewGroup)) return false;
        ViewGroup parent = (ViewGroup) host.getParent();

        int blurRadiusPx = Math.round(style.blurDp * density);
        boolean refract = refracts();
        // iOS Instagram bends only a thin band at the rim, outward. The southstar21 style pulls
        // 28dp inward at the default strength (60%), the negative sign samples inside the pill.
        float strength = strength(refract);
        // The glass itself only needs a margin where it bends in content from outside the pill
        // (the iOS style); the southstar21 style samples inside it, so the refraction layer is the
        // pill plus a little for its anti-aliased edge. (The blur's margin is the backdrop's.)
        int pad = strength > 0f ? pad(strength) : 2;

        int w = Math.round(pill.width()) + 2 * pad;
        int h = Math.round(pill.height()) + 2 * pad;

        updateEffects(w, h, pad, radius, strength, refract);
        RenderNode recorded = recordBackdrop(parent, pad(strength), blurRadiusPx / (float) DOWNSAMPLE);
        if (recorded == null) return false;
        if (refracted == null) {
            refracted = new RenderNode("LiquidGlassRefraction");
            glass = new RenderNode("LiquidGlass");
            glass.setUseCompositingLayer(true, null);
            clipped = new RenderNode("LiquidGlassClip");
            // A layer of its own too, for the same reason as the glass's (see Layers).
            clipped.setUseCompositingLayer(true, null);
        }

        // The pill's margin in the parent's coordinates, and where it is in the recording.
        float left = host.getLeft() + host.getTranslationX() + pill.left - pad;
        float top = host.getTop() + host.getTranslationY() + pill.top - pad;
        float dx = area.left - left, dy = area.top - top;

        // Refraction runs in its own node rather than chained after the blur: in a chain the
        // shader's coordinates no longer match the node, which drew the glass inset from the
        // pill with a transparent band around it.
        if (glassEffect != null) {
            refracted.setPosition(0, 0, w, h);
            RecordingCanvas gc = refracted.beginRecording(w, h);
            try {
                gc.translate(dx, dy);
                gc.scale(DOWNSAMPLE, DOWNSAMPLE);
                gc.drawRenderNode(recorded);
            } finally {
                refracted.endRecording();
            }
            refracted.setRenderEffect(glassEffect);
            // The shader already cuts the glass to the pill (anti-aliased), so it's drawn as is:
            // no clipping node, one render pass less.
            int save = canvas.save();
            canvas.translate(pill.left - pad, pill.top - pad);
            canvas.drawRenderNode(Layers.hold(glass, refracted));
            canvas.restoreToCount(save);
            return true;
        }

        // Wrap in a node clipped to the pill outline: anti-aliased, unlike clipPath.
        clipped.setPosition(0, 0, Math.round(pill.width()), Math.round(pill.height()));
        Outline outline = new Outline();
        outline.setRoundRect(0, 0, Math.round(pill.width()), Math.round(pill.height()), radius);
        clipped.setOutline(outline);
        clipped.setClipToOutline(true);
        RecordingCanvas cc = clipped.beginRecording();
        try {
            cc.translate(dx - pad, dy - pad);
            cc.scale(DOWNSAMPLE, DOWNSAMPLE);
            cc.drawRenderNode(recorded);
        } finally {
            clipped.endRecording();
        }

        int save = canvas.save();
        canvas.translate(pill.left, pill.top);
        canvas.drawRenderNode(clipped);
        canvas.restoreToCount(save);
        return true;
    }

    /** The recorded backdrop's area, in the parent's coordinates (full size). */
    private final RectF area = new RectF();
    private RenderNode backdrop;
    private float backdropBlur = -1f;

    /**
     * Records the siblings below the glass, around the pill with a margin of {@code margin},
     * into {@link #area}, blurred by {@code blurRadius} (in its small pixels). Null if there's
     * nothing to record.
     * <p>
     * It's only ever seen blurred, so it's recorded {@link #DOWNSAMPLE} times smaller on each
     * side: a quarter of the pixels to draw the content into and to blur.
     */
    private RenderNode recordBackdrop(ViewGroup parent, int margin, float blurRadius) {
        int down = DOWNSAMPLE;
        int hostIndex = parent.indexOfChild(host);
        if (hostIndex <= 0) return null;
        float x = host.getLeft() + host.getTranslationX() + pill.left;
        float y = host.getTop() + host.getTranslationY() + pill.top;
        area.set((float) Math.floor(x - margin), (float) Math.floor(y - margin),
                (float) Math.ceil(x + pill.width() + margin), (float) Math.ceil(y + pill.height() + margin));
        int w = Math.round(area.width()), h = Math.round(area.height());
        int sw = (w + down - 1) / down, sh = (h + down - 1) / down;

        if (backdrop == null) {
            backdrop = new RenderNode("LiquidGlassBackdrop");
            // Its own layer, so the base color can be filled in behind what's recorded.
            backdrop.setUseCompositingLayer(true, null);
        }
        backdrop.setPosition(0, 0, sw, sh);
        RecordingCanvas rc = backdrop.beginRecording(sw, sh);
        try {
            rc.scale(1f / down, 1f / down);
            rc.translate(-area.left, -area.top);
            for (int i = 0; i < hostIndex; i++) {
                View child = parent.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE || child.getAlpha() == 0f) continue;
                // The edge blur sits between content and bar; the glass blurs on its own.
                if (child instanceof EdgeBlurView || isExcluded(child)) continue;
                if (!intersects(child, area.left, area.top, w, h)) continue;
                int save = rc.save();
                rc.translate(child.getLeft() + child.getTranslationX(), child.getTop() + child.getTranslationY());
                child.draw(rc);
                rc.restoreToCount(save);
            }
            // Videos playing under the bar are holes in the recording: fill them with copies
            // where those work, then the base color (for the window's background) everywhere
            // else, leaving uncopied videos open so the live video shows through the glass.
            int base = dark ? Color.BLACK : Color.WHITE;
            if (snapshots != null) {
                snapshots.draw(rc);
                snapshots.drawBase(rc, base);
            } else {
                rc.drawColor(base, android.graphics.PorterDuff.Mode.DST_OVER);
            }
        } finally {
            backdrop.endRecording();
        }
        if (blurRadius != backdropBlur) {
            // Set only when it changes: a new effect is a change the GPU redraws the layer for.
            backdropBlur = blurRadius;
            backdrop.setRenderEffect(blurRadius > 0f
                    ? RenderEffect.createBlurEffect(blurRadius, blurRadius, Shader.TileMode.CLAMP) : null);
        }
        return backdrop;
    }

    private static boolean intersects(View v, float x, float y, int w, int h) {
        float left = v.getLeft() + v.getTranslationX();
        float top = v.getTop() + v.getTranslationY();
        return left < x + w && left + v.getWidth() > x && top < y + h && top + v.getHeight() > y;
    }

    private void updateEffects(int w, int h, int pad, float radius, float strength, boolean refract) {
        String key = w + "x" + h + ":" + pad + ":" + dark + ":" + refract + ":" + Math.round(tint * 100)
                + ":" + southstar21 + ":" + Math.round(radius) + ":" + Math.round(strength) + ":" + style.version
                + ":" + Math.round(liquid * 20);
        if (key.equals(effectKey)) return;
        effectKey = key;

        if (!refract) {
            glassEffect = null;
            return;
        }

        if (shader == null) shader = new RuntimeShader(GLASS_SHADER);
        shader.setFloatUniform("origin", pad, pad);
        shader.setFloatUniform("size", w - 2f * pad, h - 2f * pad);
        shader.setFloatUniform("radius", radius);
        // Pressed, the iOS bar's rim bends over a wider band too.
        shader.setFloatUniform("bezel", Math.min(radius, (southstar21 ? 20f : 22f + 12f * liquid) * density));
        shader.setFloatUniform("strength", strength);
        // Vibrancy (125% by default); the southstar21 style's glass is a fifth more saturated.
        shader.setFloatUniform("saturation", style.vibrancy * (southstar21 ? 1.2f : 1f));
        // Measured on iOS Instagram: in dark mode the rim shows ~58% of what's beyond the edge,
        // fading to the body's ~14% within a few dp. Light mode keeps a white edge instead, with
        // a glare across the rounded ends.
        shader.setFloatUniform("edgeClear", dark ? style.edgeClarity : 0f);
        shader.setFloatUniform("edgeWidth", 3.5f * density);
        shader.setFloatUniform("sideGlare", dark ? 0f : style.glare);
        int material = materialColor(255);
        shader.setFloatUniform("tint", Color.red(material) / 255f, Color.green(material) / 255f,
                Color.blue(material) / 255f, tint);
        shader.setFloatUniform("dark", dark ? 1f : 0f);
        glassEffect = RenderEffect.createRuntimeShaderEffect(shader, "content");
    }

    private final Paint edgeGlowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    /** {@code alpha} scaled by the Rim setting. */
    private int rimAlpha(int alpha) {
        return Math.max(0, Math.min(255, Math.round(alpha * style.rim)));
    }
    private final RectF rimRect = new RectF();

    /**
     * The edge as on iOS Instagram. Light mode: a crisp white line all around. Dark mode: a
     * fine light line, brighter along the bottom than the top, and a soft glow rising inside
     * from the bottom edge.
     */
    private void drawRim(Canvas canvas, float radius) {
        if (dark) {
            float glow = 5f * density;
            edgeGlowPaint.setShader(new LinearGradient(0, pill.bottom - glow, 0, pill.bottom,
                    Color.argb(0, 0xFF, 0xFF, 0xFF), Color.argb(rimAlpha(0x1C), 0xFF, 0xFF, 0xFF),
                    Shader.TileMode.CLAMP));
            canvas.drawRoundRect(pill, radius, radius, edgeGlowPaint);
            rimPaint.setStrokeWidth(Math.max(1f, 0.6f * density));
            rimPaint.setColor(Color.WHITE);
            rimPaint.setShader(new LinearGradient(0, pill.top, 0, pill.bottom,
                    new int[]{Color.argb(rimAlpha(0x48), 0xFF, 0xFF, 0xFF),
                            Color.argb(rimAlpha(0x0C), 0xFF, 0xFF, 0xFF),
                            Color.argb(rimAlpha(0x66), 0xFF, 0xFF, 0xFF)},
                    new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
        } else {
            rimPaint.setStrokeWidth(Math.max(1f, 0.8f * density));
            rimPaint.setShader(null);
            rimPaint.setColor(Color.argb(rimAlpha(0xF2), 0xFF, 0xFF, 0xFF));
        }
        float half = rimPaint.getStrokeWidth() / 2f;
        rimRect.set(pill.left + half, pill.top + half, pill.right - half, pill.bottom - half);
        canvas.drawRoundRect(rimRect, radius - half, radius - half, rimPaint);
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
