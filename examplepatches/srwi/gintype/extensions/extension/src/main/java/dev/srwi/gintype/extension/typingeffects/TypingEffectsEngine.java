package dev.srwi.gintype.extension.typingeffects;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Pure-Java simulation engine for Typing Effects: multi-pointer swipe trails, swipe glitter
 * emitters, tap/release particle explosions, and expanding shockwave rings.
 *
 * <p>Designed to be independent of Android {@link android.graphics.Canvas} and
 * {@link android.view.MotionEvent} so every behavior is deterministically unit-testable on JVM.
 */
public final class TypingEffectsEngine {

    public static final int SHAPE_SPARK = 0;
    public static final int SHAPE_STAR = 1;
    public static final int SHAPE_CONFETTI = 2;

    static final float SWIPE_THRESHOLD_DP = 14f;
    static final int MAX_PARTICLES = 360;
    static final int MAX_RINGS = 24;
    static final int MAX_TRAIL_POINTS = 160;
    static final int MAX_FADING_TRAILS = 12;
    static final int MAX_KEY_HIGHLIGHTS = 36;
    static final int MAX_WARP_WELLS = 12;
    static final long WARP_SPRING_DURATION_MS = 340L;
    static final int MAX_WIND_STREAMS = 34;
    static final int MAX_WIND_POINTS = 18;

    public static final class TrailPoint {
        public float x;
        public float y;
        public long timeMs;
        public float colorPhase;

        TrailPoint(float x, float y, long timeMs, float colorPhase) {
            this.x = x;
            this.y = y;
            this.timeMs = timeMs;
            this.colorPhase = colorPhase;
        }
    }

    public static final class TrailStroke {
        public final List<TrailPoint> points = new ArrayList<TrailPoint>(32);
        public boolean active;
        public long releaseTimeMs;
    }

    public static final class Particle {
        public float x;
        public float y;
        public float prevX;
        public float prevY;
        public float vx;
        public float vy;
        public float gravity;
        public float drag;
        public float sizePx;
        public float rotationDeg;
        public float angularVelocityDeg;
        public float flipPhase;
        public float flipSpeed;
        public float twinklePhase;
        public int colorArgb;
        public int shape;
        public long bornMs;
        public long lifetimeMs;
    }

    public static final class ShockwaveRing {
        public float x;
        public float y;
        public float startRadiusPx;
        public float maxRadiusPx;
        public float strokeWidthPx;
        public int colorArgb;
        public long bornMs;
        public long durationMs;
    }

    public static final class KeyHighlight {
        public int keyId;
        public float left;
        public float top;
        public float right;
        public float bottom;
        public float cornerRadiusPx;
        public int colorArgb;
        public long firstTouchedMs;
        public long lastTouchedMs;
        public long durationMs;
    }

    private static final class FadingWarpWell {
        float x;
        float y;
        long releaseMs;
        long durationMs;
    }

    public static final class WindStream {
        public final float[] xs = new float[MAX_WIND_POINTS];
        public final float[] ys = new float[MAX_WIND_POINTS];
        public int pointCount;
        public float headX;
        public float headY;
        public float vx;
        public float vy;
        public float wavePhase;
        public float waveFreq;
        public float waveAmpPx;
        public float strokeWidthPx;
        public int colorArgb;
        public long bornMs;
        public long lifetimeMs;
        public int sourcePointerId;
    }

    private static final class PointerState {
        final int pointerId;
        float downX;
        float downY;
        float lastX;
        float lastY;
        long lastMoveMs;
        float smoothDirX;
        float smoothDirY;
        float totalDistancePx;
        float glitterDistanceCarryPx;
        float windDistanceCarryPx;
        float colorPhaseOffset;
        boolean isSwipe;
        final TrailStroke stroke;

        PointerState(int pointerId, float x, float y, long nowMs, float colorPhaseOffset) {
            this.pointerId = pointerId;
            this.downX = x;
            this.downY = y;
            this.lastX = x;
            this.lastY = y;
            this.lastMoveMs = nowMs;
            this.colorPhaseOffset = colorPhaseOffset;
            this.stroke = new TrailStroke();
            this.stroke.active = true;
        }
    }

    private final float density;
    private final Random random;
    private final Map<Integer, PointerState> activePointers = new HashMap<Integer, PointerState>();
    private final List<TrailStroke> fadingTrails = new ArrayList<TrailStroke>();
    private final List<Particle> particles = new ArrayList<Particle>(64);
    private final List<ShockwaveRing> rings = new ArrayList<ShockwaveRing>(8);
    private final List<KeyHighlight> keyHighlights = new ArrayList<KeyHighlight>(16);
    private final List<FadingWarpWell> fadingWarpWells = new ArrayList<FadingWarpWell>(8);
    private final List<WindStream> windStreams = new ArrayList<WindStream>(24);

    private TypingEffectsConfig config = TypingEffectsConfig.defaults();
    private long lastStepMs = -1L;
    private float pointerPhaseCounter = 0f;
    private float keyPhaseCounter = 0f;

    public TypingEffectsEngine(float density) {
        this(density, new Random());
    }

    public TypingEffectsEngine(float density, Random random) {
        this.density = density > 0f ? density : 1f;
        this.random = random != null ? random : new Random();
    }

    public void setConfig(TypingEffectsConfig config) {
        this.config = config != null ? config : TypingEffectsConfig.defaults();
    }

    public TypingEffectsConfig getConfig() {
        return config;
    }

    public float getDensity() {
        return density;
    }

    public void onPointerDown(int pointerId, float x, float y, long nowMs) {
        if (!config.hasAnyVisualEffectEnabled()) {
            return;
        }
        // Offset each simultaneous pointer's color phase so two-finger MultiGlide trails look
        // visually distinct and harmonious.
        float phaseOffset = pointerPhaseCounter;
        pointerPhaseCounter = (pointerPhaseCounter + 0.37f) % 1.0f;

        PointerState state = new PointerState(pointerId, x, y, nowMs, phaseOffset);
        state.stroke.points.add(new TrailPoint(x, y, nowMs, computeColorPhase(nowMs, phaseOffset)));
        activePointers.put(pointerId, state);
    }

    public void onPointerMove(int pointerId, float x, float y, long nowMs) {
        if (!config.hasAnyVisualEffectEnabled()) {
            return;
        }
        PointerState state = activePointers.get(pointerId);
        if (state == null) {
            onPointerDown(pointerId, x, y, nowMs);
            return;
        }

        float dx = x - state.lastX;
        float dy = y - state.lastY;
        float segDist = (float) Math.hypot(dx, dy);
        if (segDist < 0.75f * density) {
            return;
        }

        state.totalDistancePx += segDist;
        float swipeThresholdPx = SWIPE_THRESHOLD_DP * density;
        if (!state.isSwipe && state.totalDistancePx >= swipeThresholdPx) {
            state.isSwipe = true;
        }

        // Update smoothed coarse swipe direction for ambient wind currents.
        float dirX = dx / segDist;
        float dirY = dy / segDist;
        if (state.smoothDirX == 0f && state.smoothDirY == 0f) {
            state.smoothDirX = dirX;
            state.smoothDirY = dirY;
        } else {
            state.smoothDirX = state.smoothDirX * 0.72f + dirX * 0.28f;
            state.smoothDirY = state.smoothDirY * 0.72f + dirY * 0.28f;
            float norm = (float) Math.hypot(state.smoothDirX, state.smoothDirY);
            if (norm > 0.001f) {
                state.smoothDirX /= norm;
                state.smoothDirY /= norm;
            }
        }
        state.lastMoveMs = nowMs;

        float phase = computeColorPhase(nowMs, state.colorPhaseOffset + state.totalDistancePx / (360f * density));

        if (config.rainbowTrailEnabled) {
            List<TrailPoint> pts = state.stroke.points;
            float minTrailStepPx = 2.5f * density;
            boolean shouldAppend = pts.isEmpty();
            if (!shouldAppend) {
                TrailPoint lastPt = pts.get(pts.size() - 1);
                float tdx = x - lastPt.x;
                float tdy = y - lastPt.y;
                shouldAppend = (tdx * tdx + tdy * tdy) >= (minTrailStepPx * minTrailStepPx);
            }
            if (shouldAppend) {
                pts.add(new TrailPoint(x, y, nowMs, phase));
                if (pts.size() > MAX_TRAIL_POINTS) {
                    pts.remove(0);
                }
            }
        }

        if (config.glitterEnabled && state.isSwipe) {
            emitGlitterAlongSegment(state, state.lastX, state.lastY, x, y, segDist, nowMs, phase);
        }

        if (config.windEnabled && state.isSwipe) {
            emitWindAlongSegment(state, x, y, segDist, nowMs, phase);
        }

        state.lastX = x;
        state.lastY = y;
    }

    public void onPointerUp(int pointerId, float x, float y, long nowMs) {
        PointerState state = activePointers.remove(pointerId);
        if (state == null) {
            return;
        }

        if (config.rainbowTrailEnabled && state.isSwipe && state.stroke.points.size() >= 2) {
            state.stroke.active = false;
            state.stroke.releaseTimeMs = nowMs;
            fadingTrails.add(state.stroke);
            while (fadingTrails.size() > MAX_FADING_TRAILS) {
                fadingTrails.remove(0);
            }
        }

        if (config.enabled && config.keyboardWarpEnabled) {
            addFadingWarpWell(x, y, nowMs);
        }

        if (!config.enabled) {
            return;
        }

        float phase = computeColorPhase(nowMs, state.colorPhaseOffset);
        if (state.isSwipe) {
            if (config.releaseExplosionEnabled) {
                spawnExplosion(x, y, nowMs, phase, true);
            }
        } else {
            if (config.tapExplosionEnabled) {
                spawnExplosion(x, y, nowMs, phase, false);
            }
        }
    }

    public void onCancel(long nowMs) {
        for (PointerState state : activePointers.values()) {
            if (config.rainbowTrailEnabled && state.isSwipe && state.stroke.points.size() >= 2) {
                state.stroke.active = false;
                state.stroke.releaseTimeMs = nowMs;
                fadingTrails.add(state.stroke);
            }
            if (config.enabled && config.keyboardWarpEnabled) {
                addFadingWarpWell(state.lastX, state.lastY, nowMs);
            }
        }
        activePointers.clear();
    }

    public void onKeyTouched(
            int keyId,
            float left,
            float top,
            float right,
            float bottom,
            long nowMs) {
        onKeyTouched(keyId, left, top, right, bottom, -1f, nowMs);
    }

    public void onKeyTouched(
            int keyId,
            float left,
            float top,
            float right,
            float bottom,
            float cornerRadiusPx,
            long nowMs) {
        if (!config.enabled || !config.keyHighlightEnabled) {
            return;
        }
        if (right <= left || bottom <= top) {
            return;
        }
        long durationMs = Math.max(80L, config.keyHighlightDurationMs);
        // Refresh existing highlight for the same key so holding/sliding across it stays smooth.
        for (int i = 0; i < keyHighlights.size(); i++) {
            KeyHighlight existing = keyHighlights.get(i);
            if (existing.keyId == keyId) {
                existing.left = left;
                existing.top = top;
                existing.right = right;
                existing.bottom = bottom;
                existing.cornerRadiusPx = cornerRadiusPx;
                existing.lastTouchedMs = nowMs;
                existing.durationMs = durationMs;
                return;
            }
        }
        KeyHighlight highlight;
        if (keyHighlights.size() >= MAX_KEY_HIGHLIGHTS) {
            highlight = keyHighlights.remove(0);
        } else {
            highlight = new KeyHighlight();
        }
        float phase = computeColorPhase(nowMs, keyPhaseCounter);
        keyPhaseCounter = (keyPhaseCounter + 0.09f) % 1.0f;

        highlight.keyId = keyId;
        highlight.left = left;
        highlight.top = top;
        highlight.right = right;
        highlight.bottom = bottom;
        highlight.cornerRadiusPx = cornerRadiusPx;
        highlight.colorArgb = config.sampleColor(phase);
        highlight.firstTouchedMs = nowMs;
        highlight.lastTouchedMs = nowMs;
        highlight.durationMs = durationMs;
        keyHighlights.add(highlight);
    }

    public void clearAll() {
        activePointers.clear();
        fadingTrails.clear();
        particles.clear();
        rings.clear();
        keyHighlights.clear();
        fadingWarpWells.clear();
        windStreams.clear();
        lastStepMs = -1L;
    }

    /**
     * Advances simulation physics and prunes expired trails, particles, and rings.
     *
     * @return {@code true} if at least one visual element still needs rendering/animation.
     */
    public boolean step(long nowMs) {
        float dtSec;
        if (lastStepMs < 0L || nowMs <= lastStepMs) {
            dtSec = 1f / 60f;
        } else {
            long deltaMs = Math.min(50L, nowMs - lastStepMs);
            dtSec = deltaMs / 1000f;
        }
        lastStepMs = nowMs;

        long fadeMs = Math.max(80L, config.trailFadeMs);

        // Trim expired points from active pointer trails so trails stay crisp and tail-faded.
        for (PointerState state : activePointers.values()) {
            trimTrailPoints(state.stroke.points, nowMs - fadeMs);
        }

        // Trim and prune fading trails.
        Iterator<TrailStroke> trailIt = fadingTrails.iterator();
        while (trailIt.hasNext()) {
            TrailStroke stroke = trailIt.next();
            trimTrailPoints(stroke.points, nowMs - fadeMs);
            if (stroke.points.size() < 2 || (nowMs - stroke.releaseTimeMs) > fadeMs) {
                trailIt.remove();
            }
        }

        // Advance particles.
        Iterator<Particle> particleIt = particles.iterator();
        while (particleIt.hasNext()) {
            Particle p = particleIt.next();
            if (nowMs - p.bornMs >= p.lifetimeMs) {
                particleIt.remove();
                continue;
            }
            p.prevX = p.x;
            p.prevY = p.y;
            float dragFactor = (float) Math.pow(p.drag, dtSec * 60f);
            p.vx *= dragFactor;
            p.vy = p.vy * dragFactor + p.gravity * dtSec;
            p.x += p.vx * dtSec;
            p.y += p.vy * dtSec;
            p.rotationDeg += p.angularVelocityDeg * dtSec;
            p.flipPhase += p.flipSpeed * dtSec;
        }

        // Prune expired shockwave rings.
        Iterator<ShockwaveRing> ringIt = rings.iterator();
        while (ringIt.hasNext()) {
            ShockwaveRing ring = ringIt.next();
            if (nowMs - ring.bornMs >= ring.durationMs) {
                ringIt.remove();
            }
        }

        // Prune expired key highlights.
        Iterator<KeyHighlight> keyIt = keyHighlights.iterator();
        while (keyIt.hasNext()) {
            KeyHighlight kh = keyIt.next();
            if (nowMs - kh.lastTouchedMs >= kh.durationMs) {
                keyIt.remove();
            }
        }

        // Prune expired trampoline warp springs.
        Iterator<FadingWarpWell> warpIt = fadingWarpWells.iterator();
        while (warpIt.hasNext()) {
            FadingWarpWell well = warpIt.next();
            if (nowMs - well.releaseMs >= well.durationMs) {
                warpIt.remove();
            }
        }

        // Advance and prune ambient wind streams.
        Iterator<WindStream> windIt = windStreams.iterator();
        while (windIt.hasNext()) {
            WindStream ws = windIt.next();
            if (nowMs - ws.bornMs >= ws.lifetimeMs) {
                windIt.remove();
                continue;
            }
            // Gently steer toward the source finger's coarse swipe direction (loose, breezy follow —
            // never orbiting or tightly locked to the fingertip).
            PointerState src = activePointers.get(ws.sourcePointerId);
            if (src != null && (src.smoothDirX != 0f || src.smoothDirY != 0f)) {
                float speed = (float) Math.hypot(ws.vx, ws.vy);
                if (speed > 1f) {
                    float steer = Math.min(0.18f, 2.8f * dtSec);
                    float targetVx = src.smoothDirX * speed;
                    float targetVy = src.smoothDirY * speed;
                    ws.vx += (targetVx - ws.vx) * steer;
                    ws.vy += (targetVy - ws.vy) * steer;
                }
            }
            // Soft aerodynamic drag so wind gusts glide out gracefully after lift.
            float drag = (float) Math.pow(0.968f, dtSec * 60f);
            ws.vx *= drag;
            ws.vy *= drag;
            ws.wavePhase += ws.waveFreq * dtSec;

            // Add gentle organic wave perpendicular to flow direction.
            float speed = (float) Math.hypot(ws.vx, ws.vy);
            float perpX = speed > 1f ? (-ws.vy / speed) : 0f;
            float perpY = speed > 1f ? (ws.vx / speed) : 1f;
            float waveVel = (float) Math.cos(ws.wavePhase) * ws.waveAmpPx * ws.waveFreq;

            ws.headX += (ws.vx + perpX * waveVel) * dtSec;
            ws.headY += (ws.vy + perpY * waveVel) * dtSec;

            if (ws.pointCount < MAX_WIND_POINTS) {
                ws.xs[ws.pointCount] = ws.headX;
                ws.ys[ws.pointCount] = ws.headY;
                ws.pointCount++;
            } else {
                System.arraycopy(ws.xs, 1, ws.xs, 0, MAX_WIND_POINTS - 1);
                System.arraycopy(ws.ys, 1, ws.ys, 0, MAX_WIND_POINTS - 1);
                ws.xs[MAX_WIND_POINTS - 1] = ws.headX;
                ws.ys[MAX_WIND_POINTS - 1] = ws.headY;
            }
        }

        return hasActiveEffects();
    }

    public boolean hasActiveWarp() {
        if (!config.enabled || !config.keyboardWarpEnabled) {
            return false;
        }
        return !activePointers.isEmpty() || !fadingWarpWells.isEmpty();
    }

    public boolean hasActiveEffects() {
        if (!particles.isEmpty()
                || !rings.isEmpty()
                || !fadingTrails.isEmpty()
                || !keyHighlights.isEmpty()
                || !windStreams.isEmpty()
                || hasActiveWarp()) {
            return true;
        }
        if (config.rainbowTrailEnabled) {
            for (PointerState state : activePointers.values()) {
                if (state.isSwipe && state.stroke.points.size() >= 2) {
                    return true;
                }
            }
        }
        return false;
    }

    public List<TrailStroke> collectRenderableTrails() {
        List<TrailStroke> result = new ArrayList<TrailStroke>(fadingTrails.size() + activePointers.size());
        collectRenderableTrails(result);
        return result;
    }

    public void collectRenderableTrails(List<TrailStroke> out) {
        out.clear();
        if (!config.enabled || !config.rainbowTrailEnabled) {
            return;
        }
        out.addAll(fadingTrails);
        for (PointerState state : activePointers.values()) {
            if (state.isSwipe && state.stroke.points.size() >= 2) {
                out.add(state.stroke);
            }
        }
    }

    public List<Particle> getParticles() {
        return particles;
    }

    public List<ShockwaveRing> getRings() {
        return rings;
    }

    public List<KeyHighlight> getKeyHighlights() {
        return keyHighlights;
    }

    public List<WindStream> getWindStreams() {
        return windStreams;
    }

    public boolean hasActivePointers() {
        return !activePointers.isEmpty();
    }

    /**
     * Fills a continuous 2D trampoline mesh ({@code (cols + 1) * (rows + 1)} vertices) for
     * {@link android.graphics.Canvas#drawBitmapMesh} so the entire keyboard warps together like
     * a single elastic rubber mat pinned at its outer edges.
     *
     * @param outVerts  length {@code >= (cols + 1) * (rows + 1) * 2}
     * @param outColors optional length {@code >= (cols + 1) * (rows + 1)} ARGB shade multipliers
     * @return {@code true} if any vertex was displaced, {@code false} if the keyboard is at rest.
     */
    public boolean fillTrampolineMesh(
            int width,
            int height,
            int cols,
            int rows,
            long nowMs,
            float[] outVerts,
            int[] outColors) {
        if (!hasActiveWarp() || width <= 0 || height <= 0 || cols <= 0 || rows <= 0) {
            return false;
        }

        float radiusPx = Math.max(24f * density, config.warpRadiusDp * density);
        float strength = config.warpStrengthPercent / 100f;
        float edgeMarginPx = 18f * density;
        float maxOffsetX = (width / (float) cols) * 0.45f;
        float maxOffsetY = (height / (float) rows) * 0.45f;
        boolean anyMoved = false;

        // Pre-extract active pointer coordinates and damped well amplitudes once per frame
        // instead of allocating iterators and recomputing exp/cos for every mesh vertex.
        int activeCount = activePointers.size();
        float[] activeX = activeCount > 0 ? new float[activeCount] : null;
        float[] activeY = activeCount > 0 ? new float[activeCount] : null;
        int aIdx = 0;
        if (activeCount > 0) {
            for (PointerState state : activePointers.values()) {
                activeX[aIdx] = state.lastX;
                activeY[aIdx] = state.lastY;
                aIdx++;
            }
        }

        int wellCap = fadingWarpWells.size();
        float[] wellX = wellCap > 0 ? new float[wellCap] : null;
        float[] wellY = wellCap > 0 ? new float[wellCap] : null;
        float[] wellAmp = wellCap > 0 ? new float[wellCap] : null;
        int wellCount = 0;
        for (int i = 0; i < wellCap; i++) {
            FadingWarpWell well = fadingWarpWells.get(i);
            float t = (nowMs - well.releaseMs) / (float) Math.max(1L, well.durationMs);
            if (t < 0f || t >= 1f) continue;
            float amp = (float) (Math.exp(-5.0 * t) * Math.cos(2.5 * Math.PI * t));
            if (Math.abs(amp) < 0.008f) continue;
            wellX[wellCount] = well.x;
            wellY[wellCount] = well.y;
            wellAmp[wellCount] = amp;
            wellCount++;
        }

        int vIdx = 0;
        int cIdx = 0;
        for (int r = 0; r <= rows; r++) {
            float baseY = (height * (float) r) / rows;
            boolean pinY = (r == 0 || r == rows);
            float edgeY = pinY ? 0f : Math.min(1f, Math.min(baseY, height - baseY) / edgeMarginPx);

            for (int c = 0; c <= cols; c++) {
                float baseX = (width * (float) c) / cols;
                boolean pinX = (c == 0 || c == cols);
                float edgeX = pinX ? 0f : Math.min(1f, Math.min(baseX, width - baseX) / edgeMarginPx);
                float edgeFactor = Math.min(edgeX, edgeY);

                float offsetX = 0f;
                float offsetY = 0f;
                float depthSum = 0f;

                if (edgeFactor > 0.001f) {
                    // Active finger presses create a smooth depression funnel.
                    for (int i = 0; i < aIdx; i++) {
                        float dx = activeX[i] - baseX;
                        float dy = activeY[i] - baseY;
                        float dist = (float) Math.hypot(dx, dy);
                        if (dist < radiusPx) {
                            float u = 1f - (dist / radiusPx);
                            float bell = u * u * (3f - 2f * u);
                            float pull = Math.min(0.42f, 0.24f * strength * bell);
                            offsetX += dx * pull;
                            offsetY += dy * pull + 7.5f * density * strength * bell;
                            depthSum += strength * bell;
                        }
                    }

                    // Released fingers ripple back with a damped trampoline spring.
                    for (int i = 0; i < wellCount; i++) {
                        float amp = wellAmp[i];
                        float dx = wellX[i] - baseX;
                        float dy = wellY[i] - baseY;
                        float dist = (float) Math.hypot(dx, dy);
                        if (dist < radiusPx) {
                            float u = 1f - (dist / radiusPx);
                            float bell = u * u * (3f - 2f * u);
                            float pull = Math.max(-0.22f, Math.min(0.42f, 0.24f * strength * amp * bell));
                            offsetX += dx * pull;
                            offsetY += dy * pull + 7.5f * density * strength * amp * bell;
                            depthSum += strength * amp * bell;
                        }
                    }

                    offsetX *= edgeFactor;
                    offsetY *= edgeFactor;
                    depthSum *= edgeFactor;
                    if (offsetX > maxOffsetX) offsetX = maxOffsetX;
                    else if (offsetX < -maxOffsetX) offsetX = -maxOffsetX;
                    if (offsetY > maxOffsetY) offsetY = maxOffsetY;
                    else if (offsetY < -maxOffsetY) offsetY = -maxOffsetY;
                }

                float finalX = pinX ? baseX : Math.max(0f, Math.min(width, baseX + offsetX));
                float finalY = pinY ? baseY : Math.max(0f, Math.min(height, baseY + offsetY));
                if (Math.abs(finalX - baseX) > 0.15f || Math.abs(finalY - baseY) > 0.15f) {
                    anyMoved = true;
                }

                outVerts[vIdx++] = finalX;
                outVerts[vIdx++] = finalY;

                if (outColors != null) {
                    // Subtle 3D dimple shading: slight darkening inside the pressed funnel.
                    float shade = 1f - Math.max(-0.04f, Math.min(0.24f, depthSum * 0.14f));
                    int ch = Math.max(185, Math.min(255, Math.round(255f * shade)));
                    outColors[cIdx++] = 0xFF000000 | (ch << 16) | (ch << 8) | ch;
                }
            }
        }
        return anyMoved;
    }

    private void emitWindAlongSegment(
            PointerState state,
            float fingerX,
            float fingerY,
            float segDist,
            long nowMs,
            float basePhase) {
        if (state.smoothDirX == 0f && state.smoothDirY == 0f) {
            return;
        }
        // Higher windIntensity -> spawn wind ribbons more frequently.
        float spacingDp = Math.max(12f, 46f - config.windIntensity * 3.4f);
        float spacingPx = spacingDp * density;
        state.windDistanceCarryPx += segDist;

        int spawned = 0;
        float spreadPx = config.windSpreadDp * density;
        float dirX = state.smoothDirX;
        float dirY = state.smoothDirY;
        float perpX = -dirY;
        float perpY = dirX;

        while (state.windDistanceCarryPx >= spacingPx && spawned < 3) {
            state.windDistanceCarryPx -= spacingPx;
            spawned++;

            // Spawn in a wide corridor around (not directly on) the swipe path.
            float sideSign = random.nextBoolean() ? 1f : -1f;
            float lateralDist = spreadPx * (0.32f + random.nextFloat() * 0.88f) * sideSign;
            float alongDist = spreadPx * (-0.45f + random.nextFloat() * 0.85f);
            float startX = fingerX + perpX * lateralDist + dirX * alongDist;
            float startY = fingerY + perpY * lateralDist + dirY * alongDist;

            // Coarse flow roughly aligned with finger swipe direction (±18 deg organic breeze).
            float baseAngle = (float) Math.atan2(dirY, dirX);
            float angleJitter = (random.nextFloat() - 0.5f) * 0.62f;
            float flowAngle = baseAngle + angleJitter;
            float speedPx = (185f + random.nextFloat() * 195f) * density;

            WindStream ws;
            if (windStreams.size() >= MAX_WIND_STREAMS) {
                ws = windStreams.remove(0);
            } else {
                ws = new WindStream();
            }
            ws.headX = startX;
            ws.headY = startY;
            ws.xs[0] = startX;
            ws.ys[0] = startY;
            ws.pointCount = 1;
            ws.vx = (float) Math.cos(flowAngle) * speedPx;
            ws.vy = (float) Math.sin(flowAngle) * speedPx;
            ws.wavePhase = random.nextFloat() * 6.283f;
            ws.waveFreq = 5.5f + random.nextFloat() * 5.0f;
            ws.waveAmpPx = (5f + random.nextFloat() * 9f) * density;
            ws.strokeWidthPx = (1.6f + random.nextFloat() * 2.0f) * density;
            ws.colorArgb = config.sampleColor(basePhase + (random.nextFloat() - 0.5f) * 0.25f);
            ws.bornMs = nowMs;
            ws.lifetimeMs = 380L + Math.round(random.nextFloat() * 340f);
            ws.sourcePointerId = state.pointerId;
            windStreams.add(ws);
        }
    }

    private void addFadingWarpWell(float x, float y, long nowMs) {
        FadingWarpWell well;
        if (fadingWarpWells.size() >= MAX_WARP_WELLS) {
            well = fadingWarpWells.remove(0);
        } else {
            well = new FadingWarpWell();
        }
        well.x = x;
        well.y = y;
        well.releaseMs = nowMs;
        well.durationMs = WARP_SPRING_DURATION_MS;
        fadingWarpWells.add(well);
    }

    public int getActivePointerCount() {
        return activePointers.size();
    }

    private float computeColorPhase(long nowMs, float offset) {
        double speedFactor = config.rainbowSpeedPercent / 100.0;
        double cycles = nowMs * 0.00045 * speedFactor;
        float timeCycles = (float) (cycles - Math.floor(cycles));
        return timeCycles + offset;
    }

    private void emitGlitterAlongSegment(
            PointerState state,
            float x0,
            float y0,
            float x1,
            float y1,
            float segDist,
            long nowMs,
            float basePhase) {
        // Higher glitterDensity -> shorter spacing between emitted sparkles.
        float spacingDp = Math.max(3.5f, 22f - config.glitterDensity * 1.85f);
        float spacingPx = spacingDp * density;
        state.glitterDistanceCarryPx += segDist;

        int emitted = 0;
        int maxPerMove = 10;
        float sizeScale = config.particleSizePercent / 100f;
        float speedScale = config.particleSpeedPercent / 100f;
        float spreadPx = Math.max(4f, config.trailWidthDp * 0.6f) * density;

        while (state.glitterDistanceCarryPx >= spacingPx && emitted < maxPerMove) {
            state.glitterDistanceCarryPx -= spacingPx;
            float frac = 1f - (state.glitterDistanceCarryPx / Math.max(1f, segDist));
            if (frac < 0f) frac = 0f;
            if (frac > 1f) frac = 1f;

            float spawnX = x0 + (x1 - x0) * frac + (random.nextFloat() - 0.5f) * 2f * spreadPx;
            float spawnY = y0 + (y1 - y0) * frac + (random.nextFloat() - 0.5f) * 2f * spreadPx;

            int shape = pickGlitterShape();
            float angle = random.nextFloat() * (float) (Math.PI * 2.0);
            float speedPx = (18f + random.nextFloat() * 54f) * density * speedScale;
            float baseSizeDp = shape == SHAPE_STAR ? (3.5f + random.nextFloat() * 4.2f)
                    : (shape == SHAPE_CONFETTI ? (3.2f + random.nextFloat() * 3.5f)
                    : (2.2f + random.nextFloat() * 2.8f));
            long life = Math.round(config.particleLifetimeMs * (0.55f + random.nextFloat() * 0.55f));
            int color = config.sampleColor(basePhase + (random.nextFloat() - 0.5f) * 0.25f);

            addParticle(
                    spawnX,
                    spawnY,
                    (float) Math.cos(angle) * speedPx,
                    (float) Math.sin(angle) * speedPx - 12f * density,
                    (shape == SHAPE_CONFETTI ? 140f : 42f) * density,
                    0.94f,
                    baseSizeDp * density * sizeScale,
                    random.nextFloat() * 360f,
                    (random.nextFloat() - 0.5f) * 320f,
                    random.nextFloat() * 6.28f,
                    5f + random.nextFloat() * 7f,
                    random.nextFloat() * 6.28f,
                    color,
                    shape,
                    nowMs,
                    Math.max(120L, life));
            emitted++;
        }
    }

    private void spawnExplosion(
            float x,
            float y,
            long nowMs,
            float basePhase,
            boolean isSwipeRelease) {
        float intensityBoost = isSwipeRelease ? 1.25f : 1.0f;
        int count = Math.max(4, Math.round(config.particleCount * intensityBoost));
        float sizeScale = config.particleSizePercent / 100f;
        float speedScale = config.particleSpeedPercent / 100f;
        boolean allOut = TypingEffectsConfig.EXPLOSION_STYLE_ALL_OUT.equals(config.explosionStyle);

        for (int i = 0; i < count; i++) {
            int shape = pickExplosionShape(i);
            // Distribute angles evenly around the circle with organic jitter so bursts look full.
            float baseAngle = (float) (2.0 * Math.PI * i / count);
            float jitter = (random.nextFloat() - 0.5f) * (float) (2.0 * Math.PI / Math.max(6, count));
            float angle = baseAngle + jitter;

            float speedBaseDp = isSwipeRelease ? 140f : 115f;
            float speedPx = (speedBaseDp * (0.45f + random.nextFloat() * 0.95f)) * density * speedScale;
            float vx = (float) Math.cos(angle) * speedPx;
            float vy = (float) Math.sin(angle) * speedPx;

            float gravityDp;
            float drag;
            float sizeDp;
            if (shape == SHAPE_CONFETTI) {
                gravityDp = 240f;
                drag = 0.92f;
                sizeDp = 4.2f + random.nextFloat() * 4.2f;
                vy -= 45f * density; // Pop upward before fluttering down.
            } else if (shape == SHAPE_STAR) {
                gravityDp = 55f;
                drag = 0.93f;
                sizeDp = 4.5f + random.nextFloat() * 4.8f;
            } else {
                gravityDp = 120f;
                drag = 0.91f;
                sizeDp = 3.0f + random.nextFloat() * 3.5f;
            }

            float colorPhase = basePhase + (float) i / Math.max(1, count) * (allOut ? 1.0f : 0.65f);
            int color = config.sampleColor(colorPhase);
            long life = Math.round(config.particleLifetimeMs * (0.72f + random.nextFloat() * 0.56f));

            addParticle(
                    x,
                    y,
                    vx,
                    vy,
                    gravityDp * density,
                    drag,
                    sizeDp * density * sizeScale,
                    random.nextFloat() * 360f,
                    (random.nextFloat() - 0.5f) * 520f,
                    random.nextFloat() * 6.28f,
                    7f + random.nextFloat() * 10f,
                    random.nextFloat() * 6.28f,
                    color,
                    shape,
                    nowMs,
                    Math.max(150L, life));
        }

        if (config.shockwaveRingEnabled) {
            ShockwaveRing ring = new ShockwaveRing();
            ring.x = x;
            ring.y = y;
            ring.startRadiusPx = 6f * density * sizeScale;
            ring.maxRadiusPx = (isSwipeRelease ? 58f : 44f) * density * Math.min(1.5f, 0.7f + 0.3f * sizeScale);
            ring.strokeWidthPx = (isSwipeRelease ? 4.2f : 3.2f) * density;
            ring.colorArgb = config.sampleColor(basePhase + 0.1f);
            ring.bornMs = nowMs;
            ring.durationMs = Math.max(180L, Math.round(config.particleLifetimeMs * 0.62f));
            rings.add(ring);
            while (rings.size() > MAX_RINGS) {
                rings.remove(0);
            }
        }
    }

    private int pickExplosionShape(int index) {
        if (TypingEffectsConfig.EXPLOSION_STYLE_SPARKLES.equals(config.explosionStyle)) {
            return SHAPE_STAR;
        }
        if (TypingEffectsConfig.EXPLOSION_STYLE_CONFETTI.equals(config.explosionStyle)) {
            return SHAPE_CONFETTI;
        }
        if (TypingEffectsConfig.EXPLOSION_STYLE_ALL_OUT.equals(config.explosionStyle)) {
            int mod = index % 3;
            if (mod == 0) return SHAPE_SPARK;
            if (mod == 1) return SHAPE_STAR;
            return SHAPE_CONFETTI;
        }
        // Default: sparks_ring — mostly crisp sparks with occasional stars for show polish.
        return (index % 5 == 0) ? SHAPE_STAR : SHAPE_SPARK;
    }

    private int pickGlitterShape() {
        if (TypingEffectsConfig.GLITTER_STYLE_SPARKS.equals(config.glitterStyle)) {
            return SHAPE_SPARK;
        }
        if (TypingEffectsConfig.GLITTER_STYLE_CONFETTI.equals(config.glitterStyle)) {
            return SHAPE_CONFETTI;
        }
        if (TypingEffectsConfig.GLITTER_STYLE_MIXED.equals(config.glitterStyle)) {
            int r = random.nextInt(3);
            return r == 0 ? SHAPE_STAR : (r == 1 ? SHAPE_SPARK : SHAPE_CONFETTI);
        }
        return SHAPE_STAR;
    }

    private void addParticle(
            float x,
            float y,
            float vx,
            float vy,
            float gravity,
            float drag,
            float sizePx,
            float rotationDeg,
            float angularVelocityDeg,
            float flipPhase,
            float flipSpeed,
            float twinklePhase,
            int colorArgb,
            int shape,
            long bornMs,
            long lifetimeMs) {
        Particle p;
        if (particles.size() >= MAX_PARTICLES) {
            p = particles.remove(0);
        } else {
            p = new Particle();
        }
        p.x = x;
        p.y = y;
        p.prevX = x;
        p.prevY = y;
        p.vx = vx;
        p.vy = vy;
        p.gravity = gravity;
        p.drag = drag;
        p.sizePx = sizePx;
        p.rotationDeg = rotationDeg;
        p.angularVelocityDeg = angularVelocityDeg;
        p.flipPhase = flipPhase;
        p.flipSpeed = flipSpeed;
        p.twinklePhase = twinklePhase;
        p.colorArgb = colorArgb;
        p.shape = shape;
        p.bornMs = bornMs;
        p.lifetimeMs = lifetimeMs;
        particles.add(p);
    }

    private static void trimTrailPoints(List<TrailPoint> points, long cutoffMs) {
        int removeCount = 0;
        int limit = Math.max(0, points.size() - 2);
        while (removeCount < limit && points.get(removeCount).timeMs < cutoffMs) {
            removeCount++;
        }
        if (removeCount > 0) {
            points.subList(0, removeCount).clear();
        }
    }
}
