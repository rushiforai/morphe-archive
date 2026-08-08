package io.github.liongalahad.nuviotv.extension.playback.bingenextepisode;

/** Runtime boundary for the Binge Group Manual Fallback patch. */
public final class Extension {
    private Extension() {}

    /**
     * Preserves Nuvio's existing strict-selection decision unless the Morphe
     * switch requests a manual picker whenever its preferred binge group is
     * unavailable.
     */
    public static boolean forceBingeGroupOnly(boolean originalBingeGroupOnly) {
        return originalBingeGroupOnly ||
                BingeGroupManualFallbackSettings.isEnabled();
    }
}
