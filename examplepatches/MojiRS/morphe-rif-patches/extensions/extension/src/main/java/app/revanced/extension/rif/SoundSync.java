package app.revanced.extension.rif;

/**
 * The decision part of keeping an inline video's separate sound player in step with the picture
 * ({@code InlineVideos.syncAudio}); pure, so it is unit-tested.
 *
 * Drift = sound position minus video position in ms (negative: the sound is behind). The sound
 * normally runs 75-146 ms behind. A re-seek makes the sound player refill and stall for a moment,
 * so it only happens for a really large drift and then not again for {@link #COOLDOWN_MS}; smaller
 * drift is nudged away by playing the sound slightly faster or slower.
 */
final class SoundSync {
    private SoundSync() {}

    static final int NONE = 0;
    static final int RESEEK = 1;
    static final int SPEED_UP = 2;
    static final int SLOW_DOWN = 3;
    static final int RESET_SPEED = 4;

    /** Drift beyond this (either way) is fixed by seeking the sound. */
    static final int RESEEK_DRIFT_MS = 500;
    /**
     * Same, for a sound player whose position is reported coarsely or jumpily (seen on some
     * output paths, e.g. offload): a single reading can be hundreds of ms stale, so only a
     * much bigger median drift counts and no speed nudging is tried.
     */
    static final int RESEEK_DRIFT_COARSE_MS = 800;
    /** Drift is judged on the median of the last {@link #WINDOW} readings since the last seek, once there are {@link #MIN_SAMPLES}. */
    static final int WINDOW = 5;
    static final int MIN_SAMPLES = 3;
    /** A position that advances this far from the elapsed time between two ticks marks the player as coarse. */
    static final int COARSE_MS = 150;
    /** A nudge that hasn't brought the drift down by {@link #NUDGE_PROGRESS_MS} after this long is given up on. */
    static final long NUDGE_TRIAL_MS = 4000;
    static final int NUDGE_PROGRESS_MS = 15;
    /** No second re-seek this soon after a sound seek (the stall right after one is not drift). */
    static final long COOLDOWN_MS = 2000;
    /** Drift beyond this starts a speed nudge; it ends when drift is back within {@link #NUDGE_END_MS}. */
    static final int NUDGE_START_MS = 120;
    static final int NUDGE_END_MS = 60;
    /** The sound is trusted once it has advanced this far since its last seek or start. */
    static final int SETTLED_ADVANCE_MS = 40;
    /** After this long since a seek or start the sound is judged even if it never moved. */
    static final long SETTLE_MAX_MS = 3000;
    /** A sound seek that still hasn't reported completion after this long is treated as done. */
    static final long SEEK_PENDING_MAX_MS = 5000;

    /** Cap on the measured seek latency used as a lead (and to stretch the cool-down). */
    static final long LATENCY_MAX_MS = 1000;
    /** A sound position frozen this long gets one re-seek. */
    static final long FROZEN_MS = 4000;

    static final float FAST = 1.03f;
    static final float SLOW = 0.97f;

    /**
     * @param drift       sound minus video position, ms
     * @param nudge       current speed state: 1 = playing faster, -1 = slower, 0 = normal
     * @param canNudge    playback speed can be changed (API 23+, not failed before)
     * @param coolingDown a sound seek happened less than {@link #COOLDOWN_MS} ago
     * @param reseekMs    {@link #RESEEK_DRIFT_MS} or {@link #RESEEK_DRIFT_COARSE_MS}
     */
    static int decide(int drift, int nudge, boolean canNudge, boolean coolingDown, int reseekMs) {
        if (Math.abs(drift) > reseekMs) return coolingDown ? NONE : RESEEK;
        if (!canNudge) return nudge != 0 ? RESET_SPEED : NONE;
        if (nudge > 0) return drift >= -NUDGE_END_MS ? RESET_SPEED : NONE;
        if (nudge < 0) return drift <= NUDGE_END_MS ? RESET_SPEED : NONE;
        if (drift < -NUDGE_START_MS) return SPEED_UP;
        if (drift > NUDGE_START_MS) return SLOW_DOWN;
        return NONE;
    }

    /** Median of the first [n] values of [a] (not modified); the upper middle for an even count. */
    static int median(int[] a, int n) {
        int[] c = java.util.Arrays.copyOf(a, n);
        java.util.Arrays.sort(c);
        return c[n / 2];
    }
}
