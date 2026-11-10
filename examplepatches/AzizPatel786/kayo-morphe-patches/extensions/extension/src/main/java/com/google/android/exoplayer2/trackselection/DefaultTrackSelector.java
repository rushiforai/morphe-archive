package com.google.android.exoplayer2.trackselection;

import com.google.android.exoplayer2.source.TrackGroup;

/**
 * Compile-time stub for ExoPlayer DefaultTrackSelector.
 */
public class DefaultTrackSelector {
    private Parameters parameters = new Parameters.Builder().build();

    public Parameters getParameters() {
        return parameters;
    }

    public void setParameters(TrackSelectionParameters parameters) {
        if (parameters instanceof Parameters) {
            this.parameters = (Parameters) parameters;
        }
    }

    public void setParameters(Parameters.Builder parametersBuilder) {
        this.parameters = parametersBuilder.build();
    }

    public Parameters.Builder buildUponParameters() {
        return parameters.buildUpon();
    }

    public static final class Parameters extends TrackSelectionParameters {
        public final boolean forceHighestSupportedBitrate;
        public final boolean exceedVideoConstraintsIfNecessary;
        public final boolean exceedAudioConstraintsIfNecessary;
        public final boolean exceedRendererCapabilitiesIfNecessary;

        private Parameters(Builder builder) {
            super(builder);
            this.forceHighestSupportedBitrate = builder.forceHighestSupportedBitrate;
            this.exceedVideoConstraintsIfNecessary = builder.exceedVideoConstraintsIfNecessary;
            this.exceedAudioConstraintsIfNecessary = builder.exceedAudioConstraintsIfNecessary;
            this.exceedRendererCapabilitiesIfNecessary = builder.exceedRendererCapabilitiesIfNecessary;
        }

        public Builder buildUpon() {
            return new Builder(this);
        }

        public static final class Builder extends TrackSelectionParameters.Builder {
            boolean forceHighestSupportedBitrate;
            boolean exceedVideoConstraintsIfNecessary = true;
            boolean exceedAudioConstraintsIfNecessary = true;
            boolean exceedRendererCapabilitiesIfNecessary = true;

            public Builder() {
                super();
            }

            private Builder(Parameters initialValues) {
                super(initialValues);
                this.forceHighestSupportedBitrate = initialValues.forceHighestSupportedBitrate;
                this.exceedVideoConstraintsIfNecessary = initialValues.exceedVideoConstraintsIfNecessary;
                this.exceedAudioConstraintsIfNecessary = initialValues.exceedAudioConstraintsIfNecessary;
                this.exceedRendererCapabilitiesIfNecessary = initialValues.exceedRendererCapabilitiesIfNecessary;
            }

            @Override
            public Builder setMaxVideoSize(int maxVideoWidth, int maxVideoHeight) {
                super.setMaxVideoSize(maxVideoWidth, maxVideoHeight);
                return this;
            }

            @Override
            public Builder setMinVideoSize(int minVideoWidth, int minVideoHeight) {
                super.setMinVideoSize(minVideoWidth, minVideoHeight);
                return this;
            }

            @Override
            public Builder setMaxVideoBitrate(int maxVideoBitrate) {
                super.setMaxVideoBitrate(maxVideoBitrate);
                return this;
            }

            @Override
            public Builder setMinVideoBitrate(int minVideoBitrate) {
                super.setMinVideoBitrate(minVideoBitrate);
                return this;
            }

            @Override
            public Builder clearVideoSizeConstraints() {
                super.clearVideoSizeConstraints();
                return this;
            }

            @Override
            public Builder clearViewportSizeConstraints() {
                super.clearViewportSizeConstraints();
                return this;
            }

            public Builder setForceHighestSupportedBitrate(boolean forceHighestSupportedBitrate) {
                this.forceHighestSupportedBitrate = forceHighestSupportedBitrate;
                return this;
            }

            public Builder setExceedVideoConstraintsIfNecessary(boolean exceedVideoConstraintsIfNecessary) {
                this.exceedVideoConstraintsIfNecessary = exceedVideoConstraintsIfNecessary;
                return this;
            }

            public Builder setExceedAudioConstraintsIfNecessary(boolean exceedAudioConstraintsIfNecessary) {
                this.exceedAudioConstraintsIfNecessary = exceedAudioConstraintsIfNecessary;
                return this;
            }

            public Builder setAllowAudioMixedMimeTypeAdaptiveness(boolean allowAudioMixedMimeTypeAdaptiveness) {
                return this;
            }

            public Builder setAllowAudioMixedSampleRateAdaptiveness(boolean allowAudioMixedSampleRateAdaptiveness) {
                return this;
            }

            public Builder setAllowAudioMixedChannelCountAdaptiveness(boolean allowAudioMixedChannelCountAdaptiveness) {
                return this;
            }

            public Builder setExceedRendererCapabilitiesIfNecessary(boolean exceedRendererCapabilitiesIfNecessary) {
                this.exceedRendererCapabilitiesIfNecessary = exceedRendererCapabilitiesIfNecessary;
                return this;
            }

            public Builder clearSelectionOverrides() {
                return this;
            }

            @Override
            public Builder setPreferredAudioLanguage(String preferredAudioLanguage) {
                super.setPreferredAudioLanguage(preferredAudioLanguage);
                return this;
            }

            @Override
            public Builder addOverride(TrackSelectionOverride override) {
                super.addOverride(override);
                return this;
            }

            @Override
            public Builder setOverrideForType(TrackSelectionOverride override) {
                super.setOverrideForType(override);
                return this;
            }

            @Override
            public Builder clearOverride(TrackGroup mediaTrackGroup) {
                super.clearOverride(mediaTrackGroup);
                return this;
            }

            @Override
            public Builder clearOverridesOfType(int trackType) {
                super.clearOverridesOfType(trackType);
                return this;
            }

            @Override
            public Builder clearOverrides() {
                super.clearOverrides();
                return this;
            }

            @Override
            public Parameters build() {
                return new Parameters(this);
            }
        }
    }
}
