package dev.abotmaker.ramblerenhancements;

import java.util.Arrays;

/**
 * Faithful port of Hex by Anomaly's Android keyboard recording waveform
 * ({@code android/app/src/main/java/ly/anoma/hex/keyboard/DotScopeView.kt}):
 * a 66-sample scrolling right-to-left history driving a 7-row dot sine wave.
 */
public final class HexAndroidWaveSimulation {
    static final int SAMPLE_COUNT = 66;
    private static final float STEP_SECONDS = 1.0f / 30.0f;

    private final float[] levels = new float[SAMPLE_COUNT];
    private int tick = 0;
    private float pendingSeconds = 0.0f;
    private float smoothedLevel = 0.0f;
    private float opacity = 0.0f;

    public HexAndroidWaveSimulation() {
    }

    public void reset() {
        Arrays.fill(levels, 0.0f);
        tick = 0;
        pendingSeconds = 0.0f;
        smoothedLevel = 0.0f;
        opacity = 0.0f;
    }

    public void advance(
            float dtSeconds,
            float normalizedInput01,
            float voiceResponse,
            boolean reduceMotion) {
        float clampedDt = HexDotScopeSimulation.clamp(dtSeconds, 0.0f, 0.06f);
        float response = HexDotScopeSimulation.clamp(voiceResponse, 0.5f, 2.0f);
        float raw = HexDotScopeSimulation.clamp(normalizedInput01, 0.0f, 1.0f);

        float gated = raw < 0.05f ? 0.0f : (raw - 0.05f) / 0.95f;
        float targetLevel = HexDotScopeSimulation.clamp(
                (float) Math.sqrt(gated) * 1.05f * response, 0.0f, 1.0f);

        float attackS = 0.035f / response;
        float releaseS = 0.14f / Math.max(0.7f, response);
        float tau = targetLevel > smoothedLevel ? attackS : releaseS;
        smoothedLevel += (targetLevel - smoothedLevel)
                * (1.0f - (float) Math.exp(-clampedDt / Math.max(tau, 1e-3f)));

        opacity += (1.0f - opacity) * (1.0f - (float) Math.exp(-clampedDt / 0.12f));

        if (reduceMotion) {
            Arrays.fill(levels, smoothedLevel * 0.65f);
            return;
        }

        pendingSeconds += clampedDt;
        while (pendingSeconds >= STEP_SECONDS) {
            pendingSeconds -= STEP_SECONDS;
            pushSample(smoothedLevel);
        }
    }

    void pushSample(float level01) {
        System.arraycopy(levels, 1, levels, 0, SAMPLE_COUNT - 1);
        levels[SAMPLE_COUNT - 1] = HexDotScopeSimulation.clamp(level01, 0.0f, 1.0f);
        tick++;
    }

    public float[] getLevels() {
        return levels;
    }

    public int getTick() {
        return tick;
    }

    public float getOpacity() {
        return HexDotScopeSimulation.clamp(opacity, 0.0f, 1.0f);
    }

    public float getCurrentLevel() {
        return smoothedLevel;
    }
}
