package com.google.android.exoplayer2.trackselection;

import com.google.android.exoplayer2.source.TrackGroup;
import com.google.common.collect.ImmutableList;
import java.util.Collections;
import java.util.List;

/**
 * Compile-time stub for ExoPlayer TrackSelectionOverride.
 */
public final class TrackSelectionOverride {
    public final TrackGroup mediaTrackGroup;
    public final ImmutableList<Integer> trackIndices;

    public TrackSelectionOverride(TrackGroup mediaTrackGroup, int trackIndex) {
        this.mediaTrackGroup = mediaTrackGroup;
        this.trackIndices = ImmutableList.of(trackIndex);
    }

    public TrackSelectionOverride(TrackGroup mediaTrackGroup, List<Integer> trackIndices) {
        this.mediaTrackGroup = mediaTrackGroup;
        this.trackIndices = ImmutableList.copyOf(trackIndices != null ? trackIndices : Collections.<Integer>emptyList());
    }

    public int getType() {
        return mediaTrackGroup.type;
    }
}
