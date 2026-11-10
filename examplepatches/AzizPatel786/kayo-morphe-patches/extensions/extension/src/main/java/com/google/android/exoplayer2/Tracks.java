package com.google.android.exoplayer2;

import com.google.android.exoplayer2.source.TrackGroup;
import com.google.common.collect.ImmutableList;
import java.util.List;

/**
 * Compile-time stub for ExoPlayer Tracks and Tracks.Group.
 */
public final class Tracks {
    private final ImmutableList<Group> groups;

    public Tracks() {
        this.groups = ImmutableList.of();
    }

    public Tracks(List<Group> groups) {
        this.groups = ImmutableList.copyOf(groups);
    }

    public ImmutableList<Group> getGroups() {
        return groups;
    }

    public static final class Group {
        public final int length;
        private final TrackGroup mediaTrackGroup;
        private final int[] trackSupport;
        private final boolean[] trackSelected;

        public Group() {
            this.length = 0;
            this.mediaTrackGroup = new TrackGroup();
            this.trackSupport = new int[0];
            this.trackSelected = new boolean[0];
        }

        public Group(TrackGroup mediaTrackGroup, boolean adaptiveSupported, int[] trackSupport, boolean[] trackSelected) {
            this.length = mediaTrackGroup.length;
            this.mediaTrackGroup = mediaTrackGroup;
            this.trackSupport = trackSupport != null ? trackSupport : new int[this.length];
            this.trackSelected = trackSelected != null ? trackSelected : new boolean[this.length];
        }

        public TrackGroup getMediaTrackGroup() {
            return mediaTrackGroup;
        }

        public Format getTrackFormat(int trackIndex) {
            return mediaTrackGroup.getFormat(trackIndex);
        }

        public int getTrackSupport(int trackIndex) {
            return trackSupport[trackIndex];
        }

        public int getType() {
            return mediaTrackGroup.type;
        }

        public boolean isSelected() {
            for (boolean s : trackSelected) {
                if (s) return true;
            }
            return false;
        }

        public boolean isTrackSelected(int trackIndex) {
            return trackSelected[trackIndex];
        }

        public boolean isTrackSupported(int trackIndex) {
            return trackSupport[trackIndex] == 4;
        }
    }
}
