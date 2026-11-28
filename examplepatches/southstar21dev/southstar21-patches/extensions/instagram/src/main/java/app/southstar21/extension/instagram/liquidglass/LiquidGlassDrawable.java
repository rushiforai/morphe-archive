package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RadialGradient;
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
            // Plain white, converted to the shader's working space: SDR white there. In an HDR
            // window that is well below 1.0, so constant whites must be scaled by it or the glass
            // lights up at the display's HDR peak, far brighter than the app around it.
            "layout(color) uniform half4 sdrWhite;\n" +
            "uniform float2 origin;\n" +   // pill top-left inside the backdrop node
            "uniform float2 size;\n" +     // pill size
            "uniform float radius;\n" +
            "uniform float bezel;\n" +     // width of the refracting edge band
            "uniform float strength;\n" +  // max displacement in px
            "uniform float dispersion;\n" +  // red/blue split at the rim in px, signed like strength
            "uniform half4 tint;\n" +      // rgb + mix amount in alpha
            "uniform float dark;\n" +
            "uniform float saturation;\n" +
            "uniform float edgeClear;\n" +   // how much less tint right at the edge, 0..1
            "uniform float edgeWidth;\n" +   // px over which the tint comes back
            "uniform float sideGlare;\n" +   // white glare on the rounded ends
            "uniform float2 light;\n" +      // unit direction towards the light, in screen axes
            "uniform float4 glint;\n" +     // tilt glint: anchor x, y from the center (px), sigma (px), peak (0 = off)
            "uniform float2 glintOpp;\n" +  // the weaker glint opposite it

            "float sdRoundRect(float2 p, float2 b, float r) {\n" +
            "  float2 q = abs(p) - b + r;\n" +
            "  return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;\n" +
            "}\n" +

            // Bend profile, 0 at t=0 and 1 at t=1: t^5 * (4 - 3t). Flat in the middle and
            // bending hardest near the rim like a convex squircle edge, but with a finite slope
            // (2) at the rim. The old quarter circle had a vertical slope at t=1, which turned
            // fine detail at the edge into a hard stretched line.
            "float bendProfile(float t) {\n" +
            "  float t2 = t * t;\n" +
            "  return t2 * t2 * t * (4.0 - 3.0 * t);\n" +
            "}\n" +

            "half4 main(float2 coord) {\n" +
            "  float2 half_size = size * 0.5;\n" +
            "  float2 p = coord - origin - half_size;\n" +
            "  float d = sdRoundRect(p, half_size, radius);\n" +
            "  float coverage = clamp(0.5 - d, 0.0, 1.0);\n" +   // anti-aliased edge
            "  if (coverage <= 0.0) return half4(0.0);\n" +
            "  half w = sdrWhite.g;\n" +

            // Surface normal from the SDF gradient.
            "  float e = 0.75;\n" +
            "  float2 n = float2(\n" +
            "    sdRoundRect(p + float2(e, 0.0), half_size, radius) - sdRoundRect(p - float2(e, 0.0), half_size, radius),\n" +
            "    sdRoundRect(p + float2(0.0, e), half_size, radius) - sdRoundRect(p - float2(0.0, e), half_size, radius));\n" +
            "  n = n / max(length(n), 1e-4);\n" +

            // Lens profile: flat in the middle, bending hard at the rim, so content from
            // just outside the pill gets pulled in at the edges.
            "  float t = clamp(1.0 + d / bezel, 0.0, 1.0);\n" +  // 0 inside band, 1 at edge
            "  float bend = bendProfile(t);\n" +
            "  float2 offset = n * bend * strength;\n" +

            // Dispersion: red and blue split apart along the bend, so zero in the flat middle
            // and widest at the rim. The shift follows the sign of strength (dispersion carries
            // it), so red always lands further along the refraction than blue. Two taps per
            // channel, averaged, smooth the fringe instead of leaving two hard copies.
            "  float2 src = coord + offset;\n" +
            "  float2 fringe = n * bend * dispersion;\n" +
            "  half4 col;\n" +
            "  col.r = 0.5 * (content.eval(src + fringe).r + content.eval(src + fringe * 0.5).r);\n" +
            "  col.g = content.eval(src).g;\n" +
            "  col.b = 0.5 * (content.eval(src - fringe).b + content.eval(src - fringe * 0.5).b);\n" +
            // Kept, not forced opaque: a video plays in a hole of the recording (its own layer,
            // under the window), and the glass must let it show through rather than go solid.
            "  col.a = content.eval(src).a;\n" +

            // Vibrancy: glass slightly boosts saturation of what's behind it.
            "  half luma = dot(col.rgb, half3(0.2126, 0.7152, 0.0722));\n" +
            "  col.rgb = mix(half3(luma), col.rgb, saturation);\n" +
            // As on iOS: dense in the body, clearing towards the edge so what the rim bends in
            // from outside shows there.
            "  float clearing = 1.0 - smoothstep(0.0, edgeWidth, -d);\n" +
            "  half amount = tint.a * (1.0 - edgeClear * clearing * clearing);\n" +
            // Premultiplied: the material covers holes too, as much as it covers content.
            "  col.rgb = mix(col.rgb, tint.rgb * w, amount);\n" +
            "  col.a = mix(col.a, 1.0, amount);\n" +

            // Specular rim, lit from the light's side (the top left at rest, moving as the phone
            // tilts) with a softer bounce opposite.
            "  float rim = smoothstep(0.55, 1.0, t);\n" +
            "  float spec = pow(max(dot(n, light), 0.0), 2.0) + 0.45 * pow(max(dot(n, -light), 0.0), 2.0);\n" +
            "  col.rgb += half3(rim * spec * mix(0.22, 0.18, dark)) * w;\n" +
            "  col.rgb += half3(rim * pow(abs(n.x), 3.0) * sideGlare) * w;\n" +
            // The tilt glint: a soft spot sliding along the rim, and a weaker one opposite it.
            "  float2 ga = p - glint.xy;\n" +
            "  float2 gb = p - glintOpp;\n" +
            "  float gk = -0.5 / max(glint.z * glint.z, 1.0);\n" +
            "  float g = exp(dot(ga, ga) * gk) + 0.35 * exp(dot(gb, gb) * gk);\n" +
            "  col.rgb += half3(rim * g * glint.w) * w;\n" +

            // Faint inner glow along the top for depth.
            "  float top = 1.0 - smoothstep(0.0, size.y * 0.55, coord.y - origin.y);\n" +
            "  col.rgb += half3(top * mix(0.06, 0.03, dark)) * w;\n" +

            "  col.a = clamp(col.a, 0.0, 1.0);\n" +
            "  col.rgb = clamp(col.rgb, 0.0, w * col.a);\n" +
            "  return col * coverage;\n" +
            "}\n";

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
    private int insetLeft, insetRight, insetBottom;
    private boolean dark;
    private Integer hostColorHint;
    /** Brightness of the content around the pill, from {@link BackdropSampler}. */
    private float backdropLuminance = -1f;
    /** Current tint mix, eased towards {@link #tintTarget()} each frame. */
    private float tint = -1f;
    /** Frame time of the last {@link #stepTint()}, for a frame-rate independent ease. */
    private long tintTime;
    /** The tint last handed to {@link #glassEffect}, to recreate only that wrapper when it moves. */
    private float appliedTint = -1f;
    private float tintR, tintG, tintB;

    private final Paint tintPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    // Backdrop, lazily created on Android 12+.
    private RenderNode backdrop;
    private RenderNode refracted;
    private RenderNode clipped;
    private RuntimeShader shader;
    private RenderEffect blurEffect;
    private RenderEffect glassEffect;
    /** Inputs of the last {@link #updateEffects} build; compared field by field so no key is allocated. */
    private boolean effectsValid;
    private int keyW, keyH, keyPad, keyRadius, keyStrength, keyVersion, keyLiquid;
    private boolean keyDark, keyRefract, keySouthstar21;
    /** The tilt angle last handed to the shader's glint. */
    private float appliedGlint = Float.NaN;
    private final float[] glintAt = new float[5];
    private final Outline clipOutline = new Outline();
    private int outlineW = -1, outlineH = -1;
    private float outlineRadius = -1f;
    private final Matrix shaderMatrix = new Matrix();
    private RadialGradient glowShader;
    private LinearGradient edgeGlowShader;
    private LinearGradient rimShader;
    private float shaderRim = -1f;
    private RadialGradient glintRimShader;
    private float glintRimFor = -1f;
    private final Paint glintRimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);


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
        insetLeft = left;
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
        effectsValid = false;
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
        effectsValid = false;
        invalidateSelf();
    }

    /**
     * Over Reels, iOS's bar is much clearer glass than over the feed: the video shows plainly
     * through it. The tint eases there and back like any other change.
     */
    void setOverMedia(boolean overMedia) {
        if (this.overMedia == overMedia) return;
        this.overMedia = overMedia;
        invalidateSelf();
    }

    private boolean overMedia;
    /** Over Reels the Opacity setting is scaled down by this much. */
    private static final float MEDIA_TINT_SCALE = 0.4f;

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
        float base = style.opacity * (overMedia ? MEDIA_TINT_SCALE : 1f);
        if (backdropLuminance < 0f || overMedia) return base;
        float extra = dark ? 0.06f * smoothstep(0.45f, 0.85f, backdropLuminance)
                : 0.05f * (1f - smoothstep(0.22f, 0.62f, backdropLuminance));
        return Math.min(1f, base + extra * (1f - base) / 0.14f);
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
        long now = android.os.SystemClock.uptimeMillis();
        // Clamped so a long gap since the last frame doesn't jump the whole way.
        float dt = Math.max(0f, Math.min(50f, now - tintTime));
        tintTime = now;
        if (tint < 0f) {
            tint = target;
        } else if (Math.abs(target - tint) > 0.005f) {
            // Exponential ease, 18% of the way per frame at 60Hz whatever the refresh rate.
            tint += (target - tint) * (1f - (float) Math.pow(0.82, dt / 16.667f));
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
        fullPill.set(b.left + insetLeft, b.top, b.right - insetRight, b.bottom - insetBottom);
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
        if (style.solid) {
            // Nothing behind the bar is recorded: an opaque pill, then the same glow and rim.
            if (backdrop != null) {
                // Let go of the last recording; made again if the glass comes back.
                backdrop.discardDisplayList();
                refracted.discardDisplayList();
                clipped.discardDisplayList();
                backdrop = refracted = clipped = null;
                effectsValid = false;
            }
            tintPaint.setColor(materialColor(255));
            canvas.drawRoundRect(pill, radius, radius, tintPaint);
            drawGlow(canvas, radius);
            drawRim(canvas, radius);
            return;
        }
        stepTint();

        boolean glassDrawn = false;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && canvas.isHardwareAccelerated()) {
            glassDrawn = drawBackdrop(canvas, radius);
        }
        if (!glassDrawn || Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU || style.refraction <= 0f
                || style.demoVideoHole) {
            // The shader tints on its own; every other path needs a tint layer.
            int alpha = glassDrawn ? Math.round(255 * Math.min(0.9f, 0.22f + tint)) : (dark ? 0xD9 : 0xD0);
            tintPaint.setColor(materialColor(alpha));
            canvas.drawRoundRect(pill, radius, radius, tintPaint);
        }

        drawGlow(canvas, radius);
        drawRim(canvas, radius);
    }

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
        // One white unit gradient, moved and sized with a matrix; the strength is the paint's alpha.
        if (glowShader == null) {
            glowShader = new RadialGradient(0f, 0f, 1f,
                    new int[]{Color.WHITE, Color.WHITE, Color.argb(0, 0xFF, 0xFF, 0xFF)},
                    new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP);
        }
        shaderMatrix.setScale(spot, spot);
        shaderMatrix.postTranslate(x, pill.centerY());
        glowShader.setLocalMatrix(shaderMatrix);
        glowPaint.setShader(glowShader);
        glowPaint.setColor(c);
        canvas.drawRoundRect(pill, radius, radius, glowPaint);
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

        float refraction = style.refraction;
        // A demo of a video the glass can't see: it shows through as it is, neither blurred nor bent.
        int blurRadiusPx = style.demoVideoHole ? 0 : Math.round(style.blurDp * density);
        boolean refract = Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && refraction > 0f
                && !style.demoVideoHole;
        // iOS Instagram bends only a thin band at the rim, outward. The southstar21 style pulls
        // 28dp inward at the default strength (60%), the negative sign samples inside the pill.
        float strength = !refract ? 0f
                : southstar21 ? -28f * density * refraction / 0.6f
                : refraction * 0.15f * pill.height() * (1f + 0.9f * liquid);
        int pad = (int) Math.ceil(Math.max(Math.abs(strength) * 1.1f, blurRadiusPx * 2f)) + 2;

        int w = Math.round(pill.width()) + 2 * pad;
        int h = Math.round(pill.height()) + 2 * pad;

        if (backdrop == null) {
            backdrop = new RenderNode("LiquidGlassBackdrop");
            // Its own layer, so the base color can be filled in behind what's recorded.
            backdrop.setUseCompositingLayer(true, null);
            refracted = new RenderNode("LiquidGlassRefraction");
            clipped = new RenderNode("LiquidGlassClip");
        }
        backdrop.setPosition(0, 0, w, h);

        // Pill origin in the parent's coordinate space.
        float originX = host.getLeft() + host.getTranslationX() + pill.left;
        float originY = host.getTop() + host.getTranslationY() + pill.top;

        RecordingCanvas rc = backdrop.beginRecording(w, h);
        try {
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
            // Videos playing under the bar are holes in the recording: fill them with copies
            // where those work, then the base color (for the window's background) everywhere
            // else, leaving uncopied videos open so the live video shows through the glass.
            if (snapshots != null) {
                snapshots.draw(rc);
                snapshots.drawBase(rc, dark ? Color.BLACK : Color.WHITE);
            } else {
                rc.drawColor(dark ? Color.BLACK : Color.WHITE, android.graphics.PorterDuff.Mode.DST_OVER);
            }
        } finally {
            backdrop.endRecording();
        }

        updateEffects(w, h, pad, radius, strength, refract, blurRadiusPx);
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
        int pw = Math.round(pill.width()), ph = Math.round(pill.height());
        if (pw != outlineW || ph != outlineH || radius != outlineRadius) {
            outlineW = pw;
            outlineH = ph;
            outlineRadius = radius;
            clipOutline.setRoundRect(0, 0, pw, ph, radius);
            clipped.setOutline(clipOutline);
            clipped.setClipToOutline(true);
        }
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

    private void updateEffects(int w, int h, int pad, float radius, float strength, boolean refract,
                               int blurRadiusPx) {
        int radiusKey = Math.round(radius), strengthKey = Math.round(strength);
        int liquidKey = Math.round(liquid * 20);
        boolean same = effectsValid && keyW == w && keyH == h && keyPad == pad && keyDark == dark
                && keyRefract == refract && keySouthstar21 == southstar21 && keyRadius == radiusKey
                && keyStrength == strengthKey && keyVersion == style.version && keyLiquid == liquidKey;
        if (same) {
            // Only the tint moved (it eases over frames): update the uniform and wrap the same
            // shader again, leaving the blur effect alone. The RenderEffect has to be recreated
            // for a changed uniform to be picked up.
            if (glassEffect != null && shader != null
                    && (appliedTint != tint || appliedGlint != glintTilt())) {
                appliedTint = tint;
                shader.setFloatUniform("tint", tintR, tintG, tintB, tint);
                applyGlint(w - 2f * pad, h - 2f * pad, radius);
                glassEffect = RenderEffect.createRuntimeShaderEffect(shader, "content");
            }
            return;
        }
        effectsValid = true;
        keyW = w;
        keyH = h;
        keyPad = pad;
        keyDark = dark;
        keyRefract = refract;
        keySouthstar21 = southstar21;
        keyRadius = radiusKey;
        keyStrength = strengthKey;
        keyVersion = style.version;
        keyLiquid = liquidKey;

        blurEffect = blurRadiusPx > 0
                ? RenderEffect.createBlurEffect(blurRadiusPx, blurRadiusPx, Shader.TileMode.CLAMP)
                : null;

        if (!refract) {
            glassEffect = null;
            return;
        }

        if (shader == null) {
            shader = new RuntimeShader(GLASS_SHADER);
            shader.setColorUniform("sdrWhite", Color.WHITE);
        }
        shader.setFloatUniform("origin", pad, pad);
        shader.setFloatUniform("size", w - 2f * pad, h - 2f * pad);
        shader.setFloatUniform("radius", radius);
        // Pressed, the iOS bar's rim bends over a wider band too.
        shader.setFloatUniform("bezel", Math.min(radius, (southstar21 ? 20f : 22f + 12f * liquid) * density));
        shader.setFloatUniform("strength", strength);
        // Subtle fringe, a few px at the very rim at most; negative with strength so it follows
        // the same direction.
        shader.setFloatUniform("dispersion", Math.max(-3f * density, Math.min(3f * density, strength * 0.12f)));
        // Vibrancy (125% by default); the southstar21 style's glass is a fifth more saturated.
        shader.setFloatUniform("saturation", style.vibrancy * (southstar21 ? 1.2f : 1f));
        // Measured on iOS Instagram: in dark mode the rim shows ~58% of what's beyond the edge,
        // fading to the body's ~14% within a few dp. Light mode keeps a white edge instead, with
        // a glare across the rounded ends.
        shader.setFloatUniform("edgeClear", dark ? style.edgeClarity : 0f);
        shader.setFloatUniform("edgeWidth", 3.5f * density);
        shader.setFloatUniform("sideGlare", dark ? 0f : style.glare);
        int material = materialColor(255);
        tintR = Color.red(material) / 255f;
        tintG = Color.green(material) / 255f;
        tintB = Color.blue(material) / 255f;
        appliedTint = tint;
        shader.setFloatUniform("tint", tintR, tintG, tintB, tint);
        shader.setFloatUniform("dark", dark ? 1f : 0f);
        shader.setFloatUniform("light", REST_X, REST_Y);
        applyGlint(w - 2f * pad, h - 2f * pad, radius);
        glassEffect = RenderEffect.createRuntimeShaderEffect(shader, "content");
    }

    /** The direction towards the light: up and to the left. */
    private static final float REST_X = -0.44721f, REST_Y = -0.89443f;

    /** The tilt the glint follows: the phone's, or 0 when the setting is off. */
    private float glintTilt() {
        return style.tiltLight ? style.tilt() : 0f;
    }

    /** Peak of the glint added in the rim band: a little lower in dark mode. */
    private float glintPeak() {
        return style.tiltLight ? (dark ? 0.6f : 0.75f) : 0f;
    }

    /** Hands the shader the glint for a pill of {@code w} by {@code h} px; the peak is 0 when off. */
    private void applyGlint(float w, float h, float radius) {
        appliedGlint = glintTilt();
        float peak = glintPeak();
        if (peak <= 0f) {
            shader.setFloatUniform("glint", 0f, 0f, 1f, 0f);
            shader.setFloatUniform("glintOpp", 0f, 0f);
            return;
        }
        TiltLight.glint(w / 2f, h / 2f, radius, appliedGlint, glintAt);
        shader.setFloatUniform("glint", glintAt[0], glintAt[1], glintAt[4], peak);
        shader.setFloatUniform("glintOpp", glintAt[2], glintAt[3]);
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
            if (edgeGlowShader == null || rimShader == null || shaderRim != style.rim) {
                // Unit gradients (0..1 down the pill), sized and placed below with a matrix.
                shaderRim = style.rim;
                edgeGlowShader = new LinearGradient(0, 0, 0, 1,
                        Color.argb(0, 0xFF, 0xFF, 0xFF), Color.argb(rimAlpha(0x1C), 0xFF, 0xFF, 0xFF),
                        Shader.TileMode.CLAMP);
                rimShader = new LinearGradient(0, 0, 0, 1,
                        new int[]{Color.argb(rimAlpha(0x48), 0xFF, 0xFF, 0xFF),
                                Color.argb(rimAlpha(0x0C), 0xFF, 0xFF, 0xFF),
                                Color.argb(rimAlpha(0x66), 0xFF, 0xFF, 0xFF)},
                        new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP);
            }
            shaderMatrix.setScale(1f, glow);
            shaderMatrix.postTranslate(0f, pill.bottom - glow);
            edgeGlowShader.setLocalMatrix(shaderMatrix);
            edgeGlowPaint.setShader(edgeGlowShader);
            canvas.drawRoundRect(pill, radius, radius, edgeGlowPaint);
            rimPaint.setStrokeWidth(Math.max(1f, 0.6f * density));
            rimPaint.setColor(Color.WHITE);
            shaderMatrix.setScale(1f, pill.height());
            shaderMatrix.postTranslate(0f, pill.top);
            rimShader.setLocalMatrix(shaderMatrix);
            rimPaint.setShader(rimShader);
        } else if (style.tiltLight) {
            // Dimmer than at rest, so the glint sliding along it stands out.
            rimPaint.setStrokeWidth(Math.max(1f, 0.8f * density));
            rimPaint.setShader(null);
            rimPaint.setColor(Color.argb(rimAlpha(0x99), 0xFF, 0xFF, 0xFF));
        } else {
            rimPaint.setStrokeWidth(Math.max(1f, 0.8f * density));
            rimPaint.setShader(null);
            rimPaint.setColor(Color.argb(rimAlpha(0xF2), 0xFF, 0xFF, 0xFF));
        }
        float half = rimPaint.getStrokeWidth() / 2f;
        rimRect.set(pill.left + half, pill.top + half, pill.right - half, pill.bottom - half);
        canvas.drawRoundRect(rimRect, radius - half, radius - half, rimPaint);
        if (style.tiltLight) drawRimGlint(canvas, radius, half);
    }

    /**
     * The tilt glint on the rim stroke: the stroke again, painted with a radial fade centered on
     * the glint's anchor, then the weaker one opposite. The gradient is built once and moved with
     * its matrix, so a frame allocates nothing.
     */
    private void drawRimGlint(Canvas canvas, float radius, float half) {
        if (glintRimShader == null || glintRimFor != style.rim) {
            glintRimFor = style.rim;
            int peak = Color.argb(rimAlpha(0xFF), 0xFF, 0xFF, 0xFF);
            int mid = Color.argb(rimAlpha(0x70), 0xFF, 0xFF, 0xFF);
            glintRimShader = new RadialGradient(0f, 0f, 1f, new int[]{peak, mid, 0x00FFFFFF},
                    new float[]{0f, 0.45f, 1f}, Shader.TileMode.CLAMP);
            glintRimPaint.setStyle(Paint.Style.STROKE);
            glintRimPaint.setShader(glintRimShader);
        }
        TiltLight.glint(rimRect.width() / 2f, rimRect.height() / 2f, radius - half, glintTilt(), glintAt);
        glintRimPaint.setStrokeWidth(rimPaint.getStrokeWidth());
        float reach = 2.4f * glintAt[4];
        for (int i = 0; i < 2; i++) {
            shaderMatrix.setScale(reach, reach);
            shaderMatrix.postTranslate(rimRect.centerX() + glintAt[2 * i], rimRect.centerY() + glintAt[2 * i + 1]);
            glintRimShader.setLocalMatrix(shaderMatrix);
            glintRimPaint.setAlpha(i == 0 ? 255 : 90);
            canvas.drawRoundRect(rimRect, radius - half, radius - half, glintRimPaint);
        }
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
