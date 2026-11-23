package dev.materialtidal.extension.tidal.theme;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RecordingCanvas;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;

/**
 * Hardware-accelerated GPU progressive blur & frosted glass toolkit (API 31+/32+).
 * Pure Android SDK implementation (zero AndroidX/Compose/Kotlin dependencies so the
 * extension DEX remains minimal and conflict-free).
 */
public final class ExpressiveBlurKit {

    /**
     * Re-entrancy guard set while recording a sibling/parent view subtree into an offscreen
     * backdrop RenderNode, preventing nested overlays, invalidation loops, or layer hooks.
     */
    public static volatile boolean CAPTURING_BACKDROP = false;

    private ExpressiveBlurKit() {
    }

    public static boolean isHardwareBlurSupported() {
        return Build.VERSION.SDK_INT >= 31;
    }

    public static boolean isCrossWindowBlurAvailable(Context context) {
        if (!isHardwareBlurSupported()
                || !MaterialYouConfig.isExpressiveBlurEnabled()
                || MaterialYouColorEngine.isEffectiveAmoledBlack()
                || context == null) {
            return false;
        }
        try {
            WindowManager wm = context.getSystemService(WindowManager.class);
            return wm != null && wm.isCrossWindowBlurEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Applies native SurfaceFlinger cross-window blur behind dialogs and bottom sheets,
     * softening the dark modal scrim when live backdrop blur is active.
     */
    public static void applyWindowBackdropBlur(
            Window window,
            int blurBehindRadiusDp,
            int backgroundBlurRadiusDp,
            float scrimDimAmount,
            float blurDimRatio,
            float density) {
        if (window == null) {
            return;
        }
        try {
            Context context = window.getContext();
            boolean allowBlur = isCrossWindowBlurAvailable(context);
            float mult = MaterialYouConfig.getBlurIntensityMultiplier();
            float effectiveDim = MaterialYouColorEngine.isLightMode(context)
                    ? scrimDimAmount * 0.60f
                    : scrimDimAmount;

            if (backgroundBlurRadiusDp > 0 && Build.VERSION.SDK_INT >= 31) {
                int bgPx = allowBlur ? Math.max(0, Math.round(backgroundBlurRadiusDp * density * mult)) : 0;
                window.setBackgroundBlurRadius(bgPx);
            }

            WindowManager.LayoutParams lp = window.getAttributes();
            if (lp != null) {
                boolean changed = false;
                if (allowBlur && blurBehindRadiusDp > 0 && Build.VERSION.SDK_INT >= 31) {
                    int behindPx = Math.max(1, Math.round(blurBehindRadiusDp * density * mult));
                    lp.flags |= WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
                    lp.setBlurBehindRadius(behindPx);
                    if (effectiveDim > 0f && blurDimRatio > 0f) {
                        lp.dimAmount = Math.max(0f, Math.min(1f, effectiveDim * blurDimRatio));
                    }
                    changed = true;
                } else {
                    if ((lp.flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND) != 0) {
                        lp.flags &= ~WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
                        changed = true;
                    }
                    if (effectiveDim > 0f && lp.dimAmount <= 0f) {
                        lp.dimAmount = effectiveDim;
                        changed = true;
                    }
                }
                if (changed) {
                    window.setAttributes(lp);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Renders a multi-tier GPU Gaussian progressive blur without double-exposure halos by
     * cascading 4 overlapping RenderEffect blur tiers masked with smoothstep DST_IN gradients.
     */
    public static final class MultiTierProgressiveBlurRenderer {

        public static final int DIR_BOTTOM_UP = 0;
        public static final int DIR_TOP_DOWN = 1;
        public static final int DIR_UNIFORM = 2;

        private static final int MAX_TIERS = 4;

        private final RenderNode sourceNode;
        private final RenderNode[] tierNodes = new RenderNode[MAX_TIERS];
        private final Paint[] maskPaints = new Paint[MAX_TIERS];
        private final Paint veilPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fallbackPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final PorterDuffXfermode dstInMode = new PorterDuffXfermode(PorterDuff.Mode.DST_IN);

        private int tierCount = 4;
        private int direction = DIR_BOTTOM_UP;
        private float fadeStartFrac = 0.06f;
        private float[] radiiDp = new float[]{4f, 11f, 24f, 44f};
        private float[] tierStarts = new float[]{0.00f, 0.24f, 0.50f, 0.72f};
        private int veilColor = MaterialYouColorEngine.getSurfaceBase();
        private float veilStartFrac = 0.14f;
        private float veilMaxAlpha = 0.54f;

        private float lastMult = -1f;
        private float lastScale = 0.5f;
        private int lastCapW = -1;
        private int lastCapH = -1;
        private int cachedMaskW = -1;
        private int cachedMaskH = -1;
        private int cachedDirection = -1;
        private float cachedFadeStart = -1f;
        private int cachedVeilColor = 0;
        private float cachedVeilStart = -1f;
        private float cachedVeilAlpha = -1f;
        private boolean hasCapturedSource = false;
        private boolean recordingSource = false;

        public MultiTierProgressiveBlurRenderer(String namePrefix) {
            sourceNode = new RenderNode(namePrefix + "_src");
            sourceNode.setForceDarkAllowed(false);
            for (int i = 0; i < MAX_TIERS; i++) {
                tierNodes[i] = new RenderNode(namePrefix + "_t" + i);
                tierNodes[i].setForceDarkAllowed(false);
                Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
                p.setXfermode(dstInMode);
                maskPaints[i] = p;
            }
        }

        public void configure(
                int direction,
                float fadeStartFrac,
                float[] radiiDp,
                float[] tierStarts,
                int veilColor,
                float veilStartFrac,
                float veilMaxAlpha) {
            int count = Math.min(MAX_TIERS, Math.min(radiiDp.length, tierStarts.length));
            if (count <= 0) {
                return;
            }
            boolean changed = this.direction != direction
                    || this.tierCount != count
                    || Math.abs(this.fadeStartFrac - fadeStartFrac) > 0.001f
                    || this.veilColor != veilColor
                    || Math.abs(this.veilStartFrac - veilStartFrac) > 0.001f
                    || Math.abs(this.veilMaxAlpha - veilMaxAlpha) > 0.001f;
            if (!changed) {
                for (int i = 0; i < count; i++) {
                    if (Math.abs(this.radiiDp[i] - radiiDp[i]) > 0.01f
                            || Math.abs(this.tierStarts[i] - tierStarts[i]) > 0.001f) {
                        changed = true;
                        break;
                    }
                }
            }
            if (!changed) {
                return;
            }
            this.direction = direction;
            this.tierCount = count;
            this.fadeStartFrac = clamp01(fadeStartFrac);
            this.radiiDp = radiiDp.clone();
            this.tierStarts = tierStarts.clone();
            this.veilColor = veilColor;
            this.veilStartFrac = clamp01(veilStartFrac);
            this.veilMaxAlpha = clamp01(veilMaxAlpha);
            this.cachedMaskW = -1;
            this.lastMult = -1f;
        }

        public boolean canUseHardwareBlur(Canvas canvas) {
            return canvas != null
                    && canvas.isHardwareAccelerated()
                    && Build.VERSION.SDK_INT >= 31
                    && MaterialYouConfig.isExpressiveBlurEnabled();
        }

        public RecordingCanvas beginBackdropCapture(
                int width, int height, float bleedPx, float captureScale, int backdropBaseColor) {
            if (width <= 0 || height <= 0) {
                return null;
            }
            if (recordingSource) {
                try {
                    sourceNode.endRecording();
                } catch (Throwable ignored) {
                } finally {
                    recordingSource = false;
                }
            }
            try {
                float scale = Math.max(0.25f, Math.min(1.0f, captureScale));
                int capW = Math.max(1, Math.round((width + 2f * bleedPx) * scale));
                int capH = Math.max(1, Math.round((height + 2f * bleedPx) * scale));

                sourceNode.setPosition(0, 0, capW, capH);
                sourceNode.setForceDarkAllowed(false);

                this.lastCapW = capW;
                this.lastCapH = capH;
                this.lastScale = scale;
                this.hasCapturedSource = false;

                RecordingCanvas rc = sourceNode.beginRecording(capW, capH);
                recordingSource = true;
                rc.drawColor(withAlpha(backdropBaseColor, 0xFF));
                rc.scale(scale, scale);
                rc.translate(bleedPx, bleedPx);
                return rc;
            } catch (Throwable ignored) {
                if (recordingSource) {
                    try {
                        sourceNode.endRecording();
                    } catch (Throwable ignored2) {
                    } finally {
                        recordingSource = false;
                    }
                }
                this.hasCapturedSource = false;
                return null;
            }
        }

        public void endBackdropCapture(float density) {
            if (recordingSource) {
                try {
                    sourceNode.endRecording();
                } catch (Throwable ignored) {
                    recordingSource = false;
                    hasCapturedSource = false;
                    return;
                } finally {
                    recordingSource = false;
                }
            } else {
                return;
            }
            try {
                hasCapturedSource = true;
                syncTierRenderEffects(density);
            } catch (Throwable ignored) {
                hasCapturedSource = false;
            }
        }

        private void syncTierRenderEffects(float density) {
            float mult = MaterialYouConfig.getBlurIntensityMultiplier();
            boolean updateEffect = Math.abs(lastMult - mult) > 0.001f;
            if (updateEffect) {
                lastMult = mult;
            }
            for (int i = 0; i < tierCount; i++) {
                RenderNode tier = tierNodes[i];
                tier.setPosition(0, 0, lastCapW, lastCapH);
                tier.setForceDarkAllowed(false);
                if (updateEffect && Build.VERSION.SDK_INT >= 31) {
                    float radiusPx = Math.max(0.5f, radiiDp[i] * density * mult * lastScale);
                    tier.setRenderEffect(RenderEffect.createBlurEffect(
                            radiusPx, radiusPx, Shader.TileMode.CLAMP));
                }
                boolean tierRecording = false;
                try {
                    RecordingCanvas tc = tier.beginRecording(lastCapW, lastCapH);
                    tierRecording = true;
                    tc.drawRenderNode(sourceNode);
                } finally {
                    if (tierRecording) {
                        try {
                            tier.endRecording();
                        } catch (Throwable ignored) {
                        }
                    }
                }
            }
        }

        public void draw(Canvas canvas, int width, int height, float bleedPx) {
            if (canvas == null || width <= 0 || height <= 0) {
                return;
            }
            ensureMasks(width, height);

            if (!canUseHardwareBlur(canvas) || !hasCapturedSource) {
                if (fallbackPaint.getShader() != null) {
                    canvas.drawRect(0, 0, width, height, fallbackPaint);
                }
                return;
            }

            float invScale = 1f / Math.max(0.25f, lastScale);
            int rootSave = canvas.save();
            try {
                canvas.clipRect(0, 0, width, height);

                if (direction == DIR_UNIFORM) {
                    int idx = Math.max(0, tierCount - 1);
                    canvas.save();
                    canvas.translate(-bleedPx, -bleedPx);
                    canvas.scale(invScale, invScale);
                    canvas.drawRenderNode(tierNodes[idx]);
                    canvas.restore();
                } else {
                    for (int i = 0; i < tierCount; i++) {
                        float bandStart = remapBandFrac(tierStarts[i]);
                        int bandTop = 0;
                        int bandBottom = height;
                        if (direction == DIR_BOTTOM_UP) {
                            bandTop = Math.max(0, (int) Math.floor(height * bandStart));
                        } else if (direction == DIR_TOP_DOWN) {
                            bandBottom = Math.min(height, (int) Math.ceil(height * (1f - bandStart)));
                        }
                        if (bandBottom <= bandTop) {
                            continue;
                        }
                        int sc = canvas.saveLayer(0, bandTop, width, bandBottom, null);
                        canvas.save();
                        canvas.translate(-bleedPx, -bleedPx);
                        canvas.scale(invScale, invScale);
                        canvas.drawRenderNode(tierNodes[i]);
                        canvas.restore();
                        canvas.drawRect(0, bandTop, width, bandBottom, maskPaints[i]);
                        canvas.restoreToCount(sc);
                    }
                }

                if (veilMaxAlpha > 0.005f && veilPaint.getShader() != null) {
                    canvas.drawRect(0, 0, width, height, veilPaint);
                } else if (direction == DIR_UNIFORM && veilMaxAlpha > 0.005f) {
                    veilPaint.setShader(null);
                    veilPaint.setColor(withAlpha(veilColor, Math.round(255f * veilMaxAlpha)));
                    canvas.drawRect(0, 0, width, height, veilPaint);
                }
            } catch (Throwable ignored) {
                if (fallbackPaint.getShader() != null) {
                    canvas.drawRect(0, 0, width, height, fallbackPaint);
                }
            } finally {
                canvas.restoreToCount(rootSave);
            }
        }

        private float remapBandFrac(float normPos) {
            return fadeStartFrac + clamp01(normPos) * (1f - fadeStartFrac);
        }

        private void ensureMasks(int w, int h) {
            if (cachedMaskW == w
                    && cachedMaskH == h
                    && cachedDirection == direction
                    && Math.abs(cachedFadeStart - fadeStartFrac) < 0.001f
                    && cachedVeilColor == veilColor
                    && Math.abs(cachedVeilStart - veilStartFrac) < 0.001f
                    && Math.abs(cachedVeilAlpha - veilMaxAlpha) < 0.001f) {
                return;
            }
            cachedMaskW = w;
            cachedMaskH = h;
            cachedDirection = direction;
            cachedFadeStart = fadeStartFrac;
            cachedVeilColor = veilColor;
            cachedVeilStart = veilStartFrac;
            cachedVeilAlpha = veilMaxAlpha;

            final int steps = 16;
            for (int t = 0; t < tierCount; t++) {
                float startNorm = tierStarts[t];
                float endNorm = (t + 1 < tierCount) ? Math.min(1f, tierStarts[t + 1] + 0.14f) : 1f;
                if (endNorm <= startNorm + 0.02f) {
                    endNorm = Math.min(1f, startNorm + 0.18f);
                }
                int[] colors = new int[steps];
                float[] positions = new float[steps];
                float y0 = (direction == DIR_TOP_DOWN) ? h : 0f;
                float y1 = (direction == DIR_TOP_DOWN) ? 0f : h;

                float bandStartFrac = remapBandFrac(startNorm);
                float bandFullFrac = remapBandFrac(endNorm);

                for (int s = 0; s < steps; s++) {
                    float pos = s / (float) (steps - 1);
                    positions[s] = pos;
                    float alpha;
                    if (pos <= bandStartFrac) {
                        alpha = 0f;
                    } else if (pos >= bandFullFrac) {
                        alpha = 1f;
                    } else {
                        float u = (pos - bandStartFrac) / Math.max(0.001f, bandFullFrac - bandStartFrac);
                        alpha = u * u * (3f - 2f * u);
                    }
                    int a = Math.max(0, Math.min(255, Math.round(alpha * 255f)));
                    colors[s] = Color.argb(a, 255, 255, 255);
                }
                maskPaints[t].setShader(new LinearGradient(
                        0f, y0, 0f, y1, colors, positions, Shader.TileMode.CLAMP));
            }

            if (direction == DIR_UNIFORM) {
                veilPaint.setShader(null);
                veilPaint.setColor(withAlpha(veilColor, Math.round(255f * veilMaxAlpha)));
                fallbackPaint.setShader(null);
                fallbackPaint.setColor(withAlpha(veilColor, 0xEC));
            } else {
                float y0 = (direction == DIR_TOP_DOWN) ? h : 0f;
                float y1 = (direction == DIR_TOP_DOWN) ? 0f : h;
                int[] vColors = new int[steps];
                int[] fbColors = new int[steps];
                float[] vPos = new float[steps];
                for (int s = 0; s < steps; s++) {
                    float pos = s / (float) (steps - 1);
                    vPos[s] = pos;
                    float u = clamp01((pos - veilStartFrac) / Math.max(0.001f, 1f - veilStartFrac));
                    float smooth = u * u * (3f - 2f * u);
                    vColors[s] = withAlpha(veilColor, Math.round(255f * veilMaxAlpha * smooth));
                    float fbSmooth = clamp01((pos - fadeStartFrac) / Math.max(0.001f, 1f - fadeStartFrac));
                    fbSmooth = fbSmooth * fbSmooth * (3f - 2f * fbSmooth);
                    fbColors[s] = withAlpha(veilColor, Math.round(238f * fbSmooth));
                }
                veilPaint.setShader(new LinearGradient(
                        0f, y0, 0f, y1, vColors, vPos, Shader.TileMode.CLAMP));
                fallbackPaint.setShader(new LinearGradient(
                        0f, y0, 0f, y1, fbColors, vPos, Shader.TileMode.CLAMP));
            }
        }

        public void release() {
            hasCapturedSource = false;
            if (recordingSource) {
                try {
                    sourceNode.endRecording();
                } catch (Throwable ignored) {
                } finally {
                    recordingSource = false;
                }
            }
            try {
                sourceNode.discardDisplayList();
            } catch (Throwable ignored) {
            }
            for (int i = 0; i < MAX_TIERS; i++) {
                try {
                    tierNodes[i].discardDisplayList();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    /**
     * Frosted glass live backdrop blur layer mounted behind collapsing sticky toolbars on
     * Playlists and Dynamic Media Pages. Accepts plain Views so no AndroidX RecyclerView import
     * enters the extension dex.
     */
    public static final class ExpressiveToolbarBlurView extends View {

        private final MultiTierProgressiveBlurRenderer renderer =
                new MultiTierProgressiveBlurRenderer("toolbarBlur");
        private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fallbackPaint = new Paint();
        private final float density;

        private ViewGroup backdropRoot;
        private View scrollTarget;
        private View toolbarTarget;
        private float collapseFraction = 0f;
        private int tintBaseColor;
        private boolean waitingForOwnDraw = false;
        private long lastInvalidateUptime = 0L;
        private boolean listenersAttached = false;

        private final ViewTreeObserver.OnPreDrawListener preDrawListener = () -> {
            try {
                if (!isAttachedToWindow() || backdropRoot == null || toolbarTarget == null) {
                    return true;
                }
                syncBoundsAndVisibility();
                if (collapseFraction <= 0.02f || getVisibility() != VISIBLE) {
                    waitingForOwnDraw = false;
                    return true;
                }
                if (!MaterialYouConfig.isExpressiveBlurEnabled()
                        || MaterialYouColorEngine.isEffectiveAmoledBlack()) {
                    return true;
                }
                long now = android.os.SystemClock.uptimeMillis();
                if (waitingForOwnDraw && (now - lastInvalidateUptime) < 120L) {
                    return true;
                }
                waitingForOwnDraw = true;
                lastInvalidateUptime = now;
                invalidate();
            } catch (Throwable ignored) {
            }
            return true;
        };

        private final ViewTreeObserver.OnScrollChangedListener scrollListener = () -> {
            try {
                if (isAttachedToWindow()
                        && collapseFraction > 0.02f
                        && getVisibility() == VISIBLE
                        && !waitingForOwnDraw) {
                    waitingForOwnDraw = true;
                    lastInvalidateUptime = android.os.SystemClock.uptimeMillis();
                    invalidate();
                }
            } catch (Throwable ignored) {
            }
        };

        public ExpressiveToolbarBlurView(Context context) {
            super(context);
            this.density = context.getResources().getDisplayMetrics().density;
            this.tintBaseColor = MaterialYouColorEngine.getSurfaceContainer();
            setWillNotDraw(false);
            setForceDarkAllowed(false);
            setClickable(false);
            setFocusable(false);
            setFocusableInTouchMode(false);
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            borderPaint.setStyle(Paint.Style.STROKE);
            borderPaint.setStrokeWidth(Math.max(1f, 0.8f * density));
        }

        public void attach(ViewGroup backdropRoot, View toolbarTarget, View scrollTarget) {
            detachListeners();
            this.backdropRoot = backdropRoot;
            this.toolbarTarget = toolbarTarget;
            this.scrollTarget = scrollTarget;
            configureRenderer();
            if (isAttachedToWindow()) {
                attachListeners();
            }
            syncBoundsAndVisibility();
        }

        public void updateAppearance(float collapseFraction, int tintColor) {
            float clamped = clamp01(collapseFraction);
            boolean changed = Math.abs(this.collapseFraction - clamped) > 0.01f
                    || this.tintBaseColor != tintColor;
            this.collapseFraction = clamped;
            this.tintBaseColor = tintColor;
            if (changed) {
                configureRenderer();
                syncBoundsAndVisibility();
                invalidate();
            }
        }

        private void configureRenderer() {
            float[] radii = new float[]{22f};
            float[] starts = new float[]{0f};
            renderer.configure(
                    MultiTierProgressiveBlurRenderer.DIR_UNIFORM,
                    0f,
                    radii,
                    starts,
                    tintBaseColor,
                    0f,
                    0.76f * collapseFraction);
        }

        private void syncBoundsAndVisibility() {
            if (toolbarTarget == null || backdropRoot == null) {
                return;
            }
            try {
                boolean show = collapseFraction > 0.02f
                        && MaterialYouConfig.isExpressiveBlurEnabled()
                        && !MaterialYouColorEngine.isEffectiveAmoledBlack()
                        && toolbarTarget.getVisibility() == VISIBLE
                        && toolbarTarget.getWidth() > 0
                        && toolbarTarget.getHeight() > 0;
                int targetVis = show ? VISIBLE : GONE;
                if (getVisibility() != targetVis) {
                    setVisibility(targetVis);
                }
                if (!show) {
                    return;
                }
                int tw = toolbarTarget.getWidth();
                int th = toolbarTarget.getHeight();
                int tx = Math.round(toolbarTarget.getLeft() + toolbarTarget.getTranslationX());
                int ty = Math.round(toolbarTarget.getTop() + toolbarTarget.getTranslationY());
                ViewGroup.LayoutParams lp = getLayoutParams();
                if (lp != null && getParent() != null && (lp.width != tw || lp.height != th)) {
                    lp.width = tw;
                    lp.height = th;
                    setLayoutParams(lp);
                }
                if (Math.abs(getTranslationX() - tx) > 0.5f) {
                    setTranslationX(tx);
                }
                if (Math.abs(getTranslationY() - ty) > 0.5f) {
                    setTranslationY(ty);
                }
            } catch (Throwable ignored) {
            }
        }

        @Override
        protected void onDraw(Canvas canvas) {
            waitingForOwnDraw = false;
            try {
                if (canvas == null
                        || collapseFraction <= 0.02f
                        || backdropRoot == null
                        || toolbarTarget == null) {
                    return;
                }
                int w = getWidth();
                int h = getHeight();
                if (w <= 0 || h <= 0) {
                    return;
                }
                if (!MaterialYouConfig.isExpressiveBlurEnabled()
                        || MaterialYouColorEngine.isEffectiveAmoledBlack()) {
                    return;
                }

                if (renderer.canUseHardwareBlur(canvas)
                        && !CAPTURING_BACKDROP
                        && backdropRoot.isAttachedToWindow()) {
                    float bleedPx = 16f * density;
                    RecordingCanvas rc = renderer.beginBackdropCapture(
                            w, h, bleedPx, 0.5f, MaterialYouColorEngine.getSurfaceBase());
                    if (rc != null) {
                        int myIdx = backdropRoot.indexOfChild(this);
                        int tx = Math.round(getLeft() + getTranslationX());
                        int ty = Math.round(getTop() + getTranslationY());
                        int outerSave = rc.save();
                        rc.clipRect(-bleedPx, -bleedPx, w + bleedPx, h + bleedPx);
                        rc.translate(-tx, -ty);
                        CAPTURING_BACKDROP = true;
                        try {
                            int count = backdropRoot.getChildCount();
                            int limit = myIdx >= 0 ? myIdx : count;
                            for (int i = 0; i < limit; i++) {
                                View child = backdropRoot.getChildAt(i);
                                if (child == null
                                        || child == this
                                        || child == toolbarTarget
                                        || child.getVisibility() != VISIBLE) {
                                    continue;
                                }
                                int cs = rc.save();
                                try {
                                    rc.translate(child.getLeft() + child.getTranslationX(),
                                            child.getTop() + child.getTranslationY());
                                    child.draw(rc);
                                } catch (Throwable ignored) {
                                } finally {
                                    rc.restoreToCount(cs);
                                }
                            }
                        } finally {
                            CAPTURING_BACKDROP = false;
                            rc.restoreToCount(outerSave);
                            renderer.endBackdropCapture(density);
                        }
                    }
                    int layerAlpha = Math.max(0, Math.min(255, Math.round(255f * collapseFraction)));
                    canvas.saveLayerAlpha(0f, 0f, w, h, layerAlpha);
                    renderer.draw(canvas, w, h, bleedPx);
                    canvas.restore();
                } else {
                    fallbackPaint.setColor(withAlpha(tintBaseColor, Math.round(224f * collapseFraction)));
                    canvas.drawRect(0f, 0f, w, h, fallbackPaint);
                }

                int hairAlpha = Math.round(32f * collapseFraction);
                if (hairAlpha > 2) {
                    borderPaint.setColor(withAlpha(MaterialYouColorEngine.getOutlineVariant(), hairAlpha));
                    float y = h - Math.max(0.5f, 0.5f * density);
                    canvas.drawLine(0f, y, w, y, borderPaint);
                }
            } catch (Throwable ignored) {
            }
        }

        private void attachListeners() {
            if (listenersAttached || backdropRoot == null) {
                return;
            }
            try {
                ViewTreeObserver vto = backdropRoot.getViewTreeObserver();
                if (vto != null && vto.isAlive()) {
                    vto.addOnPreDrawListener(preDrawListener);
                    vto.addOnScrollChangedListener(scrollListener);
                    listenersAttached = true;
                }
            } catch (Throwable ignored) {
            }
        }

        private void detachListeners() {
            if (!listenersAttached) {
                return;
            }
            try {
                if (backdropRoot != null) {
                    ViewTreeObserver vto = backdropRoot.getViewTreeObserver();
                    if (vto != null && vto.isAlive()) {
                        vto.removeOnPreDrawListener(preDrawListener);
                        vto.removeOnScrollChangedListener(scrollListener);
                    }
                }
            } catch (Throwable ignored) {
            }
            listenersAttached = false;
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            attachListeners();
        }

        @Override
        protected void onDetachedFromWindow() {
            detachListeners();
            renderer.release();
            super.onDetachedFromWindow();
        }

        public void release() {
            detachListeners();
            renderer.release();
            backdropRoot = null;
            scrollTarget = null;
            toolbarTarget = null;
        }
    }

    private static float clamp01(float v) {
        return Math.max(0f, Math.min(1f, v));
    }

    private static int withAlpha(int argb, int alpha) {
        return (argb & 0x00FFFFFF) | (Math.max(0, Math.min(255, alpha)) << 24);
    }
}
