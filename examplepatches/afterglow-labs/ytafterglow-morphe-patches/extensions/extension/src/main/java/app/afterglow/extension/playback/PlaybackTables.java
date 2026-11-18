package app.afterglow.extension.playback;

import java.util.List;

/**
 * The option tables of the iOS playback settings and the pure rules around them, with no
 * Android dependency so they can be tested on a plain JVM. Stored values are the option
 * indexes iOS stores (tools/ios-settings-ui.json).
 */
public final class PlaybackTables {
    private PlaybackTables() {}

    /**
     * {@code autoSpeedIndex} ("Default playback rate", default 3 = 1.0x): iOS setAutoSpeed's
     * rate list (YTAfterglow.x). 3 is YouTube's own speed, so nothing is applied for it.
     */
    static final float[] DEFAULT_RATES = {0.25f, 0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 1.75f, 2.0f, 3.0f, 4.0f, 5.0f};
    public static final int DEFAULT_RATE_UNCHANGED = 3;

    /**
     * {@code speedIndex} ("Hold to speed", default 1): 0 Disabled, 1 YouTube's own speed, then
     * 1.25x to 5x in 0.25 steps (iOS ytagStockSpeedmasterRates).
     */
    static final float[] HOLD_RATES = {
            0f, 0f, 1.25f, 1.5f, 1.75f, 2.0f, 2.25f, 2.5f, 2.75f, 3.0f,
            3.25f, 3.5f, 3.75f, 4.0f, 4.25f, 4.5f, 4.75f, 5.0f};
    public static final int HOLD_DISABLED = 0;
    public static final int HOLD_STOCK = 1;

    /**
     * {@code wiFiQualityIndex} / {@code cellQualityIndex} (default 0): iOS autoQuality's labels.
     * 0 is YouTube's own choice and 1 is the best quality the video has.
     */
    static final String[] QUALITY_LABELS = {
            "Default", "Best", "2160p60", "2160p", "1440p60", "1440p", "1080p60", "1080p",
            "720p60", "720p", "480p", "360p"};
    public static final int QUALITY_DEFAULT = 0;
    public static final int QUALITY_BEST = 1;

    /** The rate to apply for a stored {@code autoSpeedIndex}, or -1 to leave the speed alone. */
    public static float defaultRate(int index) {
        if (index == DEFAULT_RATE_UNCHANGED || index < 0 || index >= DEFAULT_RATES.length) return -1f;
        return DEFAULT_RATES[index];
    }

    /** iOS ytagClampedStockSpeedmasterIndex: below 0 is 0, above the list is its last entry. */
    public static int clampHoldIndex(int index) {
        if (index < 0) return 0;
        return Math.min(index, HOLD_RATES.length - 1);
    }

    /** False when hold-to-speed is turned off. */
    public static boolean holdEnabled(int index) {
        return clampHoldIndex(index) != HOLD_DISABLED;
    }

    /** The rate while the player is held: YouTube's own for Disabled/Default, else the list's. */
    public static float holdRate(int index, float stock) {
        int clamped = clampHoldIndex(index);
        return clamped <= HOLD_STOCK ? stock : HOLD_RATES[clamped];
    }

    /**
     * iOS clampPlaybackRateModel: a speed ceiling of 2x or more (ordinary videos; YouTube's own
     * client limit is 4x) is raised to 5x so every Afterglow rate plays. Lower ceilings (live
     * streams and the like) are kept, and 0 or less already means "no ceiling".
     */
    public static float raiseCeiling(float maximum) {
        return maximum >= 2f && maximum < 5f ? 5f : maximum;
    }

    /** The label iOS looks for at a stored quality index, null for "Default" or out of range. */
    public static String qualityLabel(int index) {
        if (index <= QUALITY_DEFAULT || index >= QUALITY_LABELS.length) return null;
        return QUALITY_LABELS[index];
    }

    /** Resolution of a quality label such as "1080p60" or "1080p Premium", or -1. */
    public static int resolutionOf(String label) {
        if (label == null) return -1;
        int p = label.indexOf('p');
        if (p <= 0) return -1;
        try {
            return Integer.parseInt(label.substring(0, p).trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /**
     * iOS autoQuality's choice among the qualities a video offers (their labels, any order;
     * entries that are not "NNNp..." labels, such as "Auto", are ignored). Index 1 is the
     * highest resolution. Otherwise an exact label match wins, then the label whose resolution
     * is nearest to the wanted one (the first of equals, as iOS iterates). Returns the
     * position in {@code labels}, or -1 to leave YouTube's choice.
     */
    public static int pickQuality(List<String> labels, int index) {
        String wanted = qualityLabel(index);
        if (wanted == null || labels == null || labels.isEmpty()) return -1;
        if (index == QUALITY_BEST) {
            int best = -1;
            int bestResolution = 0;
            for (int i = 0; i < labels.size(); i++) {
                int resolution = resolutionOf(labels.get(i));
                if (resolution > bestResolution) {
                    bestResolution = resolution;
                    best = i;
                }
            }
            return best;
        }
        for (int i = 0; i < labels.size(); i++) {
            if (wanted.equals(labels.get(i))) return i;
        }
        int target = resolutionOf(wanted);
        int closest = -1;
        int closestDifference = Integer.MAX_VALUE;
        for (int i = 0; i < labels.size(); i++) {
            int resolution = resolutionOf(labels.get(i));
            if (resolution <= 0) continue;
            int difference = Math.abs(resolution - target);
            if (difference < closestDifference) {
                closestDifference = difference;
                closest = i;
            }
        }
        return closest;
    }

    /**
     * Remembers the one video a once-per-video default was used for, so it is applied once per
     * playback of a video: again after another video played, never twice in a row for the same
     * video (a mid-roll ad, the miniplayer or fullscreen do not apply it again).
     */
    public static final class OncePerVideo {
        private String claimed;

        /** True the first time for this video id since a different one was claimed. */
        public synchronized boolean claim(String videoId) {
            if (videoId == null || videoId.isEmpty() || videoId.equals(claimed)) return false;
            claimed = videoId;
            return true;
        }

        public synchronized boolean isClaimed(String videoId) {
            return videoId != null && videoId.equals(claimed);
        }

        public synchronized void reset() {
            claimed = null;
        }
    }
}
