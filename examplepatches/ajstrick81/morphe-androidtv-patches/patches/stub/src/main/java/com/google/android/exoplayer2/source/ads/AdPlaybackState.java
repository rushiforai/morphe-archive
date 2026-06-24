package com.google.android.exoplayer2.source.ads;

/**
 * Compile-time stub for com.google.android.exoplayer2.source.ads.AdPlaybackState.
 *
 * This class is present in the patched app's DEX (classes3.dex, inside the
 * bundled GMS Ads SDK) and is referenced by SkipAdsPatch.java. The stub
 * provides just enough surface for javac to resolve the types and method
 * signatures used in the extension.
 *
 * The ExoPlayer2 AdPlaybackState API is structurally identical to the media3
 * version — same public fields and withSkippedAdGroup contract — but lives
 * in a separate package and separate DEX file.
 *
 * DO NOT add implementation logic — this class is never shipped to the device.
 * The real class in the patched APK's DEX is used at runtime.
 */
@SuppressWarnings("unused")
public final class AdPlaybackState {

    /** Total number of ad groups, including those already removed (live streams). */
    public final int adGroupCount;

    /**
     * Number of ad groups that have been removed from the start of the timeline.
     * Used in live streams where earlier groups are pruned as playback advances.
     * Active group indices start at this value.
     */
    public final int removedAdGroupCount;

    /**
     * Returns a copy of this state with all ads in the specified ad group
     * marked as AD_STATE_SKIPPED.
     *
     * Internally computes arrayIndex = adGroupIndex - removedAdGroupCount,
     * then calls AdGroup.withAllAdsSkipped() on that entry.
     * Does not modify isServerSideInserted, so SSAI validation in
     * ServerSideAdInsertionMediaSource.setAdPlaybackStates() continues to pass.
     *
     * @param adGroupIndex Absolute ad group index (not array-relative).
     * @return A new AdPlaybackState with the specified group fully skipped.
     */
    public AdPlaybackState withSkippedAdGroup(int adGroupIndex) {
        throw new UnsupportedOperationException("stub");
    }
}
