package androidx.media3.exoplayer.audio;

import androidx.media3.common.Format;

import com.google.common.primitives.ImmutableIntArray;

/** Compile-only host signature; never bundled in the extension. */
public interface AudioSink {
    /** Compile-only host signature. */
    final class AudioSinkConfig {
        public final Format format;
        public final ImmutableIntArray outputChannelMapping;

        private AudioSinkConfig() {
            format = null;
            outputChannelMapping = null;
        }
    }
}
