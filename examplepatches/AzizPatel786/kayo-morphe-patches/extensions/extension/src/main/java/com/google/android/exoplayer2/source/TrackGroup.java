package com.google.android.exoplayer2.source;

import com.google.android.exoplayer2.Format;
import java.util.Arrays;

/**
 * Compile-time stub for ExoPlayer TrackGroup.
 */
public final class TrackGroup {
    public final int length;
    public final String id;
    public final int type;
    private final Format[] formats;

    public TrackGroup(Format... formats) {
        this("", formats);
    }

    public TrackGroup(String id, Format... formats) {
        this.length = formats != null ? formats.length : 0;
        this.id = id != null ? id : "";
        this.formats = formats != null ? formats : new Format[0];
        int inferredType = 2;
        if (this.formats.length > 0 && this.formats[0] != null && this.formats[0].sampleMimeType != null) {
            if (this.formats[0].sampleMimeType.startsWith("audio/")) {
                inferredType = 1;
            } else if (this.formats[0].sampleMimeType.startsWith("text/")) {
                inferredType = 3;
            }
        }
        this.type = inferredType;
    }

    public Format getFormat(int index) {
        return formats[index];
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TrackGroup)) return false;
        TrackGroup that = (TrackGroup) o;
        return id.equals(that.id) && Arrays.equals(formats, that.formats);
    }

    @Override
    public int hashCode() {
        return 31 * id.hashCode() + Arrays.hashCode(formats);
    }
}
