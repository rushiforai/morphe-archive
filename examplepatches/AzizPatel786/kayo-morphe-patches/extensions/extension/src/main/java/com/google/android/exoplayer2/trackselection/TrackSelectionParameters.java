package com.google.android.exoplayer2.trackselection;

import com.google.android.exoplayer2.source.TrackGroup;
import com.google.common.collect.ImmutableList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Compile-time stub for ExoPlayer TrackSelectionParameters.
 */
public class TrackSelectionParameters {
    public final int maxVideoWidth;
    public final int maxVideoHeight;
    public final int maxVideoFrameRate;
    public final int maxVideoBitrate;
    public final int minVideoWidth;
    public final int minVideoHeight;
    public final int minVideoFrameRate;
    public final int minVideoBitrate;
    public final ImmutableList<String> preferredAudioLanguages;
    public final Map<TrackGroup, TrackSelectionOverride> overrides;

    protected TrackSelectionParameters() {
        this(new Builder());
    }

    protected TrackSelectionParameters(Builder builder) {
        this.maxVideoWidth = builder.maxVideoWidth;
        this.maxVideoHeight = builder.maxVideoHeight;
        this.maxVideoFrameRate = builder.maxVideoFrameRate;
        this.maxVideoBitrate = builder.maxVideoBitrate;
        this.minVideoWidth = builder.minVideoWidth;
        this.minVideoHeight = builder.minVideoHeight;
        this.minVideoFrameRate = builder.minVideoFrameRate;
        this.minVideoBitrate = builder.minVideoBitrate;
        this.preferredAudioLanguages = builder.preferredAudioLanguages;
        this.overrides = Collections.unmodifiableMap(new LinkedHashMap<>(builder.overrides));
    }

    public static class Builder {
        int maxVideoWidth = Integer.MAX_VALUE;
        int maxVideoHeight = Integer.MAX_VALUE;
        int maxVideoFrameRate = Integer.MAX_VALUE;
        int maxVideoBitrate = Integer.MAX_VALUE;
        int minVideoWidth = 0;
        int minVideoHeight = 0;
        int minVideoFrameRate = 0;
        int minVideoBitrate = 0;
        ImmutableList<String> preferredAudioLanguages = ImmutableList.of();
        final Map<TrackGroup, TrackSelectionOverride> overrides = new LinkedHashMap<>();

        public Builder() {}

        protected Builder(TrackSelectionParameters initialValues) {
            this.maxVideoWidth = initialValues.maxVideoWidth;
            this.maxVideoHeight = initialValues.maxVideoHeight;
            this.maxVideoFrameRate = initialValues.maxVideoFrameRate;
            this.maxVideoBitrate = initialValues.maxVideoBitrate;
            this.minVideoWidth = initialValues.minVideoWidth;
            this.minVideoHeight = initialValues.minVideoHeight;
            this.minVideoFrameRate = initialValues.minVideoFrameRate;
            this.minVideoBitrate = initialValues.minVideoBitrate;
            this.preferredAudioLanguages = initialValues.preferredAudioLanguages;
            this.overrides.putAll(initialValues.overrides);
        }

        public Builder setMaxVideoSize(int maxVideoWidth, int maxVideoHeight) {
            this.maxVideoWidth = maxVideoWidth;
            this.maxVideoHeight = maxVideoHeight;
            return this;
        }

        public Builder setMinVideoSize(int minVideoWidth, int minVideoHeight) {
            this.minVideoWidth = minVideoWidth;
            this.minVideoHeight = minVideoHeight;
            return this;
        }

        public Builder setMaxVideoBitrate(int maxVideoBitrate) {
            this.maxVideoBitrate = maxVideoBitrate;
            return this;
        }

        public Builder setMinVideoBitrate(int minVideoBitrate) {
            this.minVideoBitrate = minVideoBitrate;
            return this;
        }

        public Builder clearVideoSizeConstraints() {
            this.maxVideoWidth = Integer.MAX_VALUE;
            this.maxVideoHeight = Integer.MAX_VALUE;
            this.minVideoWidth = 0;
            this.minVideoHeight = 0;
            return this;
        }

        public Builder clearViewportSizeConstraints() {
            return this;
        }

        public Builder setPreferredAudioLanguage(String preferredAudioLanguage) {
            if (preferredAudioLanguage == null) {
                this.preferredAudioLanguages = ImmutableList.of();
            } else {
                this.preferredAudioLanguages = ImmutableList.of(preferredAudioLanguage);
            }
            return this;
        }

        public Builder addOverride(TrackSelectionOverride override) {
            this.overrides.put(override.mediaTrackGroup, override);
            return this;
        }

        public Builder setOverrideForType(TrackSelectionOverride override) {
            clearOverridesOfType(override.getType());
            this.overrides.put(override.mediaTrackGroup, override);
            return this;
        }

        public Builder clearOverride(TrackGroup mediaTrackGroup) {
            this.overrides.remove(mediaTrackGroup);
            return this;
        }

        public Builder clearOverridesOfType(int trackType) {
            Iterator<TrackSelectionOverride> it = this.overrides.values().iterator();
            while (it.hasNext()) {
                if (it.next().getType() == trackType) {
                    it.remove();
                }
            }
            return this;
        }

        public Builder clearOverrides() {
            this.overrides.clear();
            return this;
        }

        public TrackSelectionParameters build() {
            return new TrackSelectionParameters(this);
        }
    }
}
