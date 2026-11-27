package dev.srwi.gintype.extension.multiglide;

/**
 * Constants and mathematical scoring functions ported 1:1 from KineticaConstants.kt.
 */
public final class KineticaConstants {

    private KineticaConstants() {}

    public static final int RESAMPLE_N = 32;
    public static final int DTW_BAND_R = 4;
    public static final float DTW_ENDPOINT_WEIGHT = 2.0f;

    public static final float R_ENDPOINT_KW = 1.4f;
    public static final float R_INNER_KW = 1.8f;
    public static final float PASS_SPLIT_PROMINENCE_KW = 0.7f;
    public static final int MONOTONE_SLACK = 18;

    public static final float LEN_BAND_LO = 0.5f;
    public static final float LEN_BAND_HI = 1.5f;
    public static final float LEN_BAND_MARGIN_KW = 1.0f;

    public static final float SHORT_READING_ARC_KW = 18f;
    public static final float SHORT_READING_RATIO = 0.9f;
    public static final float SHORT_READING_POWER = 2f;

    public static float shortReadingKeep(float idealKw, float arcKw) {
        if (arcKw < SHORT_READING_ARC_KW) return 1f;
        float r = idealKw / arcKw / SHORT_READING_RATIO;
        return (r >= 1f) ? 1f : (float) Math.pow(r, SHORT_READING_POWER);
    }

    public static final float FUZZY_TAP_RADIUS_KW = 1.1f;
    public static final float FUZZY_TAP_LAMBDA = 0.15f;
    public static final float DOUBLE_TAP_PEN_KW = 0.1f;
    public static final long HANDOVER_ALLOWANCE_MS = 200L;
    public static final long HANDOVER_CHARGE_MAX_MS = 800L;
    public static final float HANDOVER_CHARGE_KW = 0.9f;
    public static final float HANDOVER_CHARGE_KEEP = 0.6f;
    public static final float HANDOVER_KEEP_FLOOR = 0.5f;
    public static final float HANDOVER_CHARGE_CAP_KW = 2.5f;

    public static float handoverExcess(long backMs) {
        return (backMs <= HANDOVER_ALLOWANCE_MS) ? 0f : (backMs - HANDOVER_ALLOWANCE_MS) / 100f;
    }

    public static float handoverKeep(long backMs) {
        float x = handoverExcess(backMs);
        return (x == 0f) ? 1f : (float) Math.pow(HANDOVER_CHARGE_KEEP, x);
    }

    public static final float UNCONTACTED_LETTER_KEEP = 0.85f;

    private static final int BASELINE_BEAM_WIDTH = 128;
    private static final int BASELINE_BEAM_MAX_ATTEMPTS = 300;
    public static volatile int BEAM_WIDTH = BASELINE_BEAM_WIDTH;
    public static volatile int BEAM_MAX_ATTEMPTS = BASELINE_BEAM_MAX_ATTEMPTS;
    public static volatile float BEAM_FREQ_WEIGHT = 0.5f;
    public static final float BEAM_GATE_COST = 0.5f;
    public static final float BEAM_GATE_KEEP = 0.6f;
    public static final boolean BEAM_UNSATURATED = true;
    public static final boolean BEAM_PASS_IN_TIME = true;
    public static final float DROPPED_TAP_COST_KW = 2.0f;
    public static final float DROPPED_TAP_KEEP = 0.25f;

    public static volatile float GEO_EXPONENT = 3.75f;
    public static final float GEO_SATURATION_KW = 0.5f;
    public static final float GEO_SATURATION_LONG_KW = 0.9f;
    public static final float LONG_STROKE_KW = 22f;

    public static float saturationFor(float arcKw) {
        return (arcKw >= LONG_STROKE_KW) ? GEO_SATURATION_LONG_KW : GEO_SATURATION_KW;
    }

    public static volatile float FREQ_WEIGHT_FLOOR = 0.25f;

    public static final int TOP_K = 10;
    public static final int MAX_WORD_LEN = 40;
    public static final int MAX_CANDIDATES = 800;
    public static final int MAX_EMIT_ATTEMPTS = 4000;
    public static final int STREAM_SEARCH_STEP_BUDGET = 100_000;
    public static final int RESCUE_STEP_BUDGET = 15_000;

    public static final float TRANSPOSE_PENALTY = 0.15f;
    public static final long ORDER_AMBIG_MS = 100L;
    public static final long SPLIT_MARGIN_MS = 80L;
    public static final float MIN_SPLIT_HALF_ARC_KW = 0.5f;
    public static final float SPLIT_HEAD_TRIM_KW = 0.6f;
    public static final float SPLIT_RESUME_TAIL_KW = 1.2f;
    public static final int MAX_ALT_SEQUENCES = 14;
    public static final int MAX_SPLIT_ANCHORS = 3;
    public static final float HANDOVER_CONTACT_FRACTION = 1.0f;

    public static final float RESCUE_MIN_LEAD_D = 1.0f;
    public static final float RESCUE_COMMIT_D = 0.65f;
    public static final float RESCUE_COMMIT_CLEAR = 2f;
    public static final float RESCUE_GATE_KEEP = 0.6f;
    public static final int RESCUE_MAX_ATTEMPTS = 200;
    public static final int BEAM_MAX_NEW = 2;

    public static final int MAX_SEARCH_CUTS = 2;
    public static final int STREAM_SEARCH_GATE = 1;
    public static final int STREAM_SEARCH_MAX_CUTS = 3;
    public static final int MAX_SEARCH_CUT_TIMES = 8;
    public static final boolean STREAM_SEARCH_OWN_CUTS = true;
    public static final boolean STREAM_SEARCH_OWN_CUT_CLOSES_ON_KEY = true;
    public static final boolean STREAM_SEARCH_CLOSE_INSIDE_LAST_KEY = true;

    public static final long RESTING_FINGER_MIN_MS = 400L;
    public static final int PERSONAL_MERGE_MIN_COUNT = 2;

    public static final float STICKY_INFLATE_KW = 0.2f;
    public static final long DWELL_MIN_MS = 150L;
    public static final float DWELL_RADIUS_KW = 0.3f;
    public static final int MAX_DWELL_SEGMENTS = 4;

    public static final float MIN_SWIPE_ARC_KW = 1.8f;
    public static final float KW_PER_LETTER = 1.5f;

    public static final class RuntimeTuning {
        public final int beamWidth;
        public final int beamMaxAttempts;
        public final float freqWeightFloor;
        public final float geoExponent;
        public final float saturatedTerm;
        public final float beamFreqWeight;

        RuntimeTuning(
                int beamWidth,
                int beamMaxAttempts,
                float freqWeightFloor,
                float geoExponent,
                float beamFreqWeight
        ) {
            this.beamWidth = beamWidth;
            this.beamMaxAttempts = beamMaxAttempts;
            this.freqWeightFloor = freqWeightFloor;
            this.geoExponent = geoExponent;
            this.saturatedTerm = computeSaturatedTerm(geoExponent);
            this.beamFreqWeight = beamFreqWeight;
        }
    }

    private static volatile RuntimeTuning runtimeTuning = new RuntimeTuning(
            BASELINE_BEAM_WIDTH,
            BASELINE_BEAM_MAX_ATTEMPTS,
            FREQ_WEIGHT_FLOOR,
            GEO_EXPONENT,
            BEAM_FREQ_WEIGHT);

    public static RuntimeTuning runtimeTuning() {
        return runtimeTuning;
    }

    private static float computeSaturatedTerm(float geoExponent) {
        return (float) (1.0 / Math.pow(1.0 + GEO_SATURATION_KW, geoExponent));
    }

    /**
     * Scales {@link #BEAM_MAX_ATTEMPTS} linearly with {@code beamWidth} to preserve upstream's
     * {@code 300 / 128} (~2.34) emission-attempts-per-slot ratio once the frontier saturates,
     * floored at upstream's 300 attempts and capped at {@link #MAX_EMIT_ATTEMPTS}.
     */
    public static int beamMaxAttemptsForWidth(int beamWidth) {
        int scaled = Math.round(
                BASELINE_BEAM_MAX_ATTEMPTS * (beamWidth / (float) BASELINE_BEAM_WIDTH));
        return Math.min(MAX_EMIT_ATTEMPTS, Math.max(BASELINE_BEAM_MAX_ATTEMPTS, scaled));
    }

    /**
     * Applies user-configured runtime tuning values without altering upstream algorithm logic.
     */
    public static void applyRuntimeTuning(
            int beamWidth,
            float freqWeightFloor,
            float geoExponent,
            float beamFreqWeight
    ) {
        int maxAttempts = beamMaxAttemptsForWidth(beamWidth);
        RuntimeTuning next = new RuntimeTuning(
                beamWidth, maxAttempts, freqWeightFloor, geoExponent, beamFreqWeight);
        runtimeTuning = next;
        BEAM_WIDTH = beamWidth;
        BEAM_MAX_ATTEMPTS = maxAttempts;
        FREQ_WEIGHT_FLOOR = freqWeightFloor;
        GEO_EXPONENT = geoExponent;
        BEAM_FREQ_WEIGHT = beamFreqWeight;
    }

    /**
     * Geometric factor of the score; 1.0 at a perfect fit, floored past saturation.
     */
    public static float geometricTerm(float dTotal) {
        return geometricTerm(dTotal, GEO_SATURATION_KW);
    }

    /**
     * Geometric factor of the score; 1.0 at a perfect fit, floored past saturation at cap.
     */
    public static float geometricTerm(float dTotal, float cap) {
        float d = (dTotal < cap) ? dTotal : cap;
        return (float) (1.0 / Math.pow(1.0 + d, runtimeTuning.geoExponent));
    }

    public static float geometricTermUnsaturated(float dTotal) {
        return (float) (1.0 / Math.pow(1.0 + dTotal, runtimeTuning.geoExponent));
    }

    /**
     * Exact inverse of geometricTerm for DTW early-abandon.
     */
    public static float maxDTotalForScore(float numerator, float minScore) {
        return maxDTotalForScore(numerator, minScore, GEO_SATURATION_KW);
    }

    /**
     * Exact inverse of geometricTerm(dTotal, cap) for DTW early-abandon.
     */
    public static float maxDTotalForScore(float numerator, float minScore, float cap) {
        if (minScore <= 0f) return Float.POSITIVE_INFINITY;
        float ratio = numerator / minScore;
        if (ratio <= 1f) return 0f;
        float d = (float) Math.pow(ratio, 1.0 / runtimeTuning.geoExponent) - 1.0f;
        return (d >= cap) ? Float.POSITIVE_INFINITY : d;
    }

    public static float boostWeight(float dGeometric) {
        float excess = dGeometric - GEO_SATURATION_KW;
        if (excess <= 0f) return 1.0f;
        RuntimeTuning t = runtimeTuning;
        float exp = t.geoExponent;
        float sat = t.saturatedTerm;
        float cur = (float) (1.0 / Math.pow(1.0 + Math.min(excess, GEO_SATURATION_KW), exp));
        return (cur - sat) / (1.0f - sat);
    }

    public static float appliedBoost(float rawBoost, float dGeometric) {
        return 1.0f + (rawBoost - 1.0f) * boostWeight(dGeometric);
    }
}
