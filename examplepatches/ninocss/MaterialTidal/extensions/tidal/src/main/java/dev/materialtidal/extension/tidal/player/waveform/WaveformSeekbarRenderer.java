package dev.materialtidal.extension.tidal.player.waveform;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.SystemClock;

import java.util.Arrays;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Renders the Material 3 Expressive audio waveform seekbar with smooth per-bar spring
 * morph cascades, play/pause breathing, live PCM audio reactivity around the playhead,
 * Gaussian scrub lens magnification, and three configurable visual styles.
 */
public final class WaveformSeekbarRenderer {

    private static final int CANONICAL = SongWaveformAnalyzer.CANONICAL_BINS;

    private final float[] currentCanonical = new float[CANONICAL];
    private final float[] targetCanonical = new float[CANONICAL];
    private final float[] barVelocities = new float[CANONICAL];
    private final float[] morphDelays = new float[CANONICAL];

    private float[] resampledCache = new float[56];
    private int resampledBarCount = 0;
    private String currentTrackKey = "";
    private boolean targetIsRealAudio;

    private float energyMorph = 0.52f;
    private float energyVel = 0f;
    private float smoothedLiveLevel = 0f;
    private float scrubLensMorph = 0f;
    private float scrubLensVel = 0f;
    private float ripplePhase = 0f;

    private final Paint barPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint glowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint needlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path wavePath = new Path();
    private final RectF tempBarRect = new RectF();

    public WaveformSeekbarRenderer() {
        Arrays.fill(currentCanonical, 0.25f);
        Arrays.fill(targetCanonical, 0.25f);
        barPaint.setStyle(Paint.Style.FILL);
        glowPaint.setStyle(Paint.Style.STROKE);
        glowPaint.setStrokeCap(Paint.Cap.ROUND);
        needlePaint.setStyle(Paint.Style.FILL);
    }

    public String getCurrentTrackKey() {
        return currentTrackKey;
    }

    public boolean isShowingRealAudio() {
        return targetIsRealAudio;
    }

    public void setTrackWaveform(String trackKey, float[] canonical64, boolean isRealAudio, boolean animate) {
        if (canonical64 == null || canonical64.length != CANONICAL) {
            return;
        }
        String safeKey = trackKey != null ? trackKey : "";
        boolean sameTrack = safeKey.equals(currentTrackKey);
        if (sameTrack && targetIsRealAudio && !isRealAudio) {
            // Never downgrade a real waveform back to a placeholder
            return;
        }
        currentTrackKey = safeKey;
        targetIsRealAudio = isRealAudio;
        for (int i = 0; i < CANONICAL; i++) {
            targetCanonical[i] = Math.max(0.08f, Math.min(1.0f, canonical64[i]));
            if (!animate) {
                currentCanonical[i] = targetCanonical[i];
                barVelocities[i] = 0f;
                morphDelays[i] = 0f;
            } else {
                // Smooth left-to-right liquid cascade (~190ms total spread across bars)
                morphDelays[i] = (i / (float) (CANONICAL - 1)) * 0.19f;
            }
        }
    }

    public void copyStateFrom(WaveformSeekbarRenderer other) {
        if (other == null) {
            return;
        }
        System.arraycopy(other.currentCanonical, 0, this.currentCanonical, 0, CANONICAL);
        System.arraycopy(other.targetCanonical, 0, this.targetCanonical, 0, CANONICAL);
        System.arraycopy(other.barVelocities, 0, this.barVelocities, 0, CANONICAL);
        System.arraycopy(other.morphDelays, 0, this.morphDelays, 0, CANONICAL);
        this.currentTrackKey = other.currentTrackKey;
        this.targetIsRealAudio = other.targetIsRealAudio;
        this.energyMorph = other.energyMorph;
        this.energyVel = other.energyVel;
        this.smoothedLiveLevel = other.smoothedLiveLevel;
        this.ripplePhase = other.ripplePhase;
    }

    /**
     * Advances spring physics for all 64 bars, play/pause breathing, and live PCM follower.
     * Returns true if any visual state needs another animation frame.
     */
    public boolean step(float dt, boolean playing, boolean scrubbing, float liveAudioLevel) {
        float clampedDt = Math.max(0.001f, Math.min(0.045f, dt));
        boolean needsNextFrame = false;

        // 1. Live audio level attack/release envelope
        float targetLive = playing ? Math.max(0f, Math.min(1f, liveAudioLevel)) : 0f;
        float coeff = targetLive > smoothedLiveLevel
                ? 1f - (float) Math.exp(-clampedDt * 24f)
                : 1f - (float) Math.exp(-clampedDt * 11f);
        smoothedLiveLevel += (targetLive - smoothedLiveLevel) * coeff;
        if (Math.abs(smoothedLiveLevel - targetLive) > 0.004f) {
            needsNextFrame = true;
        }

        // 2. Play/pause overall bar energy spring
        float targetEnergy = playing ? 1.0f : 0.64f;
        float[] eRes = stepSpring(energyMorph, energyVel, targetEnergy, 260f, 0.74f, clampedDt);
        energyMorph = Math.max(0.45f, Math.min(1.08f, eRes[0]));
        energyVel = eRes[1];
        if (Math.abs(energyMorph - targetEnergy) > 0.002f || Math.abs(energyVel) > 0.002f) {
            needsNextFrame = true;
        }

        // 3. Scrub magnification lens spring
        float targetLens = scrubbing ? 1.0f : 0.0f;
        float[] lRes = stepSpring(scrubLensMorph, scrubLensVel, targetLens, 380f, 0.72f, clampedDt);
        scrubLensMorph = Math.max(0f, Math.min(1.12f, lRes[0]));
        scrubLensVel = lRes[1];
        if (Math.abs(scrubLensMorph - targetLens) > 0.002f || Math.abs(scrubLensVel) > 0.002f) {
            needsNextFrame = true;
        }

        // 4. Individual bar springs with staggered cascade delay
        for (int i = 0; i < CANONICAL; i++) {
            if (morphDelays[i] > 0f) {
                morphDelays[i] = Math.max(0f, morphDelays[i] - clampedDt);
                needsNextFrame = true;
                continue;
            }
            float cur = currentCanonical[i];
            float vel = barVelocities[i];
            float tgt = targetCanonical[i];
            if (Math.abs(cur - tgt) > 0.0015f || Math.abs(vel) > 0.002f) {
                float[] bRes = stepSpring(cur, vel, tgt, 310f, 0.76f, clampedDt);
                currentCanonical[i] = Math.max(0.06f, Math.min(1.10f, bRes[0]));
                barVelocities[i] = bRes[1];
                needsNextFrame = true;
            } else {
                currentCanonical[i] = tgt;
                barVelocities[i] = 0f;
            }
        }

        if (playing) {
            ripplePhase = (ripplePhase + clampedDt * 4.8f) % 6.2831855f;
            needsNextFrame = true;
        }

        return needsNextFrame;
    }

    /**
     * Draws the active waveform seekbar variant inside trackRect and returns shownProgress [0..1].
     */
    public void draw(
            Canvas canvas,
            RectF trackRect,
            float shownProgress,
            int primaryColor,
            float density,
            float thumbScale,
            boolean scrubbing,
            boolean playing) {
        if (canvas == null || trackRect == null || trackRect.width() <= 8f) {
            return;
        }
        float padH = 5f * density;
        float left = trackRect.left + padH;
        float right = trackRect.right - padH;
        float trackW = Math.max(4f, right - left);
        float cy = trackRect.centerY();
        float prog = Math.max(0f, Math.min(1f, shownProgress));
        float playheadX = left + trackW * prog;

        int barCount = MaterialYouConfig.getPlayerWaveformBarCount();
        int style = MaterialYouConfig.getPlayerWaveformStyle();
        boolean liveReactive = MaterialYouConfig.isPlayerWaveformLiveReactiveEnabled();

        if (resampledBarCount != barCount || resampledCache.length != barCount) {
            resampledCache = new float[barCount];
            resampledBarCount = barCount;
        }
        float[] bars = SongWaveformAnalyzer.resampleEnvelope(currentCanonical, barCount);

        // Live PCM reactivity or gentle fallback breath while playing remotely (e.g. Cast/Linn)
        float audioDrive = 0f;
        if (playing && liveReactive) {
            if (smoothedLiveLevel > 0.015f) {
                audioDrive = smoothedLiveLevel;
            } else {
                // Soft fallback pulse when ExoPlayer is not pumping local PCM
                audioDrive = 0.22f + 0.14f * (float) Math.sin(ripplePhase * 0.9f);
            }
        }

        float maxHalfAmp = Math.max(8f * density, Math.min(17.5f * density, trackRect.height() * 0.43f));
        float minAmp = 2.4f * density;
        int activeColor = primaryColor;
        int activePeakColor = MaterialYouColorEngine.withAlpha(primaryColor, 0xFF);
        int inactiveColor = MaterialYouColorEngine.withAlpha(primaryColor, 0x45);

        // Precompute modulated bar heights
        for (int i = 0; i < barCount; i++) {
            float u = barCount == 1 ? 0.5f : (float) i / (float) (barCount - 1);
            float dist = Math.abs(u - prog);

            // Live beat bloom focused subtly around the playhead (sigma ~0.11 of track width)
            float liveBoost = 0f;
            if (audioDrive > 0.005f && dist < 0.28f) {
                float gauss = (float) Math.exp(-(dist * dist) / 0.014f);
                float waveRipple = 0.85f + 0.15f * (float) Math.sin(i * 0.9f - ripplePhase * 1.4f);
                liveBoost = audioDrive * gauss * 0.34f * waveRipple;
            }

            // Expressive Gaussian scrub magnifying lens under user's finger
            float scrubBoost = 0f;
            if (scrubLensMorph > 0.01f && dist < 0.20f) {
                float lensGauss = (float) Math.exp(-(dist * dist) / 0.007f);
                scrubBoost = scrubLensMorph * lensGauss * 0.30f;
            }

            float raw = bars[i] * energyMorph + liveBoost + scrubBoost;
            resampledCache[i] = Math.max(0.10f, Math.min(1.18f, raw));
        }

        if (style == MaterialYouConfig.WAVEFORM_STYLE_FILLED_RIBBON) {
            drawFilledRibbon(canvas, left, right, cy, maxHalfAmp, minAmp, playheadX,
                    resampledCache, activePeakColor, inactiveColor, density);
        } else {
            boolean centered = (style != MaterialYouConfig.WAVEFORM_STYLE_BOTTOM_SPECTRUM);
            drawDiscreteBars(canvas, left, right, trackW, cy, maxHalfAmp, minAmp,
                    trackRect.bottom - 5f * density, playheadX, resampledCache,
                    activePeakColor, inactiveColor, density, centered);
        }

        // Crisp pill-shaped playhead needle dividing played vs upcoming audio
        float needleHalfH = maxHalfAmp * (1.06f + 0.14f * scrubLensMorph) * Math.min(1.18f, thumbScale);
        float needleHalfW = (1.55f + 0.65f * scrubLensMorph) * density * Math.min(1.15f, thumbScale);
        tempBarRect.set(playheadX - needleHalfW, cy - needleHalfH, playheadX + needleHalfW, cy + needleHalfH);

        needlePaint.setColor(MaterialYouColorEngine.withAlpha(activeColor, 0x32));
        canvas.drawRoundRect(
                tempBarRect.left - 1.5f * density,
                tempBarRect.top - 1.5f * density,
                tempBarRect.right + 1.5f * density,
                tempBarRect.bottom + 1.5f * density,
                (needleHalfW + 1.5f * density),
                (needleHalfW + 1.5f * density),
                needlePaint);

        needlePaint.setColor(0xFFFFFFFF);
        canvas.drawRoundRect(tempBarRect, needleHalfW, needleHalfW, needlePaint);
    }

    private void drawDiscreteBars(
            Canvas canvas,
            float left,
            float right,
            float trackW,
            float cy,
            float maxHalfAmp,
            float minAmp,
            float spectrumBaselineY,
            float playheadX,
            float[] heights,
            int activeColor,
            int inactiveColor,
            float density,
            boolean centered) {
        int n = heights.length;
        float slotW = trackW / Math.max(1, n);
        float barW = Math.max(1.8f * density, Math.min(6.4f * density, slotW * 0.62f));
        float halfBarW = barW * 0.5f;
        float fullHeight = maxHalfAmp * 1.85f;
        float baselineY = Math.min(spectrumBaselineY, cy + maxHalfAmp * 0.85f);

        // Two-pass clip at playheadX gives sub-bar 120fps pixel-smooth progress fill
        // Pass 1: Played portion [left .. playheadX]
        if (playheadX > left + 0.5f) {
            canvas.save();
            canvas.clipRect(left - 2f * density, cy - maxHalfAmp * 1.35f, playheadX, cy + maxHalfAmp * 1.35f);
            barPaint.setColor(activeColor);
            renderBarsGeometry(canvas, left, slotW, halfBarW, cy, maxHalfAmp, minAmp,
                    fullHeight, baselineY, heights, centered);
            canvas.restore();
        }

        // Pass 2: Remaining portion [playheadX .. right]
        if (playheadX < right - 0.5f) {
            canvas.save();
            canvas.clipRect(playheadX, cy - maxHalfAmp * 1.35f, right + 2f * density, cy + maxHalfAmp * 1.35f);
            barPaint.setColor(inactiveColor);
            renderBarsGeometry(canvas, left, slotW, halfBarW, cy, maxHalfAmp, minAmp,
                    fullHeight, baselineY, heights, centered);
            canvas.restore();
        }
    }

    private void renderBarsGeometry(
            Canvas canvas,
            float left,
            float slotW,
            float halfBarW,
            float cy,
            float maxHalfAmp,
            float minAmp,
            float fullHeight,
            float baselineY,
            float[] heights,
            boolean centered) {
        int n = heights.length;
        for (int i = 0; i < n; i++) {
            float cx = left + (i + 0.5f) * slotW;
            if (centered) {
                float halfH = Math.max(minAmp, heights[i] * maxHalfAmp);
                tempBarRect.set(cx - halfBarW, cy - halfH, cx + halfBarW, cy + halfH);
            } else {
                float h = Math.max(minAmp * 2.0f, heights[i] * fullHeight);
                tempBarRect.set(cx - halfBarW, baselineY - h, cx + halfBarW, baselineY);
            }
            canvas.drawRoundRect(tempBarRect, halfBarW, halfBarW, barPaint);
        }
    }

    private void drawFilledRibbon(
            Canvas canvas,
            float left,
            float right,
            float cy,
            float maxHalfAmp,
            float minAmp,
            float playheadX,
            float[] heights,
            int activeColor,
            int inactiveColor,
            float density) {
        int n = heights.length;
        if (n < 2) {
            return;
        }
        wavePath.reset();
        float stepX = (right - left) / (float) (n - 1);

        // Top silhouette left -> right
        float y0 = cy - Math.max(minAmp, heights[0] * maxHalfAmp);
        wavePath.moveTo(left, y0);
        for (int i = 0; i < n - 1; i++) {
            float x0 = left + i * stepX;
            float x1 = left + (i + 1) * stepX;
            float ya = cy - Math.max(minAmp, heights[i] * maxHalfAmp);
            float yb = cy - Math.max(minAmp, heights[i + 1] * maxHalfAmp);
            float midX = (x0 + x1) * 0.5f;
            wavePath.cubicTo(midX, ya, midX, yb, x1, yb);
        }

        // Bottom mirrored silhouette right -> left
        float yLastBot = cy + Math.max(minAmp, heights[n - 1] * maxHalfAmp);
        wavePath.lineTo(right, yLastBot);
        for (int i = n - 1; i > 0; i--) {
            float x0 = left + i * stepX;
            float x1 = left + (i - 1) * stepX;
            float ya = cy + Math.max(minAmp, heights[i] * maxHalfAmp);
            float yb = cy + Math.max(minAmp, heights[i - 1] * maxHalfAmp);
            float midX = (x0 + x1) * 0.5f;
            wavePath.cubicTo(midX, ya, midX, yb, x1, yb);
        }
        wavePath.close();

        // Active fill (left of playhead)
        if (playheadX > left + 0.5f) {
            canvas.save();
            canvas.clipRect(left - 2f * density, cy - maxHalfAmp * 1.35f, playheadX, cy + maxHalfAmp * 1.35f);
            barPaint.setColor(MaterialYouColorEngine.withAlpha(activeColor, 0xD8));
            canvas.drawPath(wavePath, barPaint);
            glowPaint.setColor(activeColor);
            glowPaint.setStrokeWidth(1.5f * density);
            canvas.drawPath(wavePath, glowPaint);
            canvas.restore();
        }

        // Inactive fill (right of playhead)
        if (playheadX < right - 0.5f) {
            canvas.save();
            canvas.clipRect(playheadX, cy - maxHalfAmp * 1.35f, right + 2f * density, cy + maxHalfAmp * 1.35f);
            barPaint.setColor(inactiveColor);
            canvas.drawPath(wavePath, barPaint);
            canvas.restore();
        }
    }

    private static float[] stepSpring(float val, float vel, float target, float stiffness, float dampingRatio, float dt) {
        float c = 2f * dampingRatio * (float) Math.sqrt(stiffness);
        float force = -stiffness * (val - target) - c * vel;
        float newVel = vel + force * dt;
        float newVal = val + newVel * dt;
        return new float[]{newVal, newVel};
    }
}
