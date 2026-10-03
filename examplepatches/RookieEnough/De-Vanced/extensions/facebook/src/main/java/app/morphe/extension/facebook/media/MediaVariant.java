/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

public final class MediaVariant {
    private static final int[] FACEBOOK_QUALITY_LABELS = {
            240,
            270,
            360,
            480,
            540,
            640,
            720,
            1080
    };

    public enum Kind {
        IMAGE,
        PROGRESSIVE_VIDEO,
        DASH_VIDEO,
        DASH_AUDIO
    }

    public final Kind kind;
    public final String url;
    public final int width;
    public final int height;
    public final long bitrate;
    public final String mimeType;
    public final String codecs;
    public final String representationId;
    public final String manifestId;
    public final String sourceRole;
    public final boolean hasAudio;

    public MediaVariant(
            Kind kind,
            String url,
            int width,
            int height,
            long bitrate,
            String mimeType,
            String codecs,
            String representationId,
            String manifestId,
            String sourceRole,
            boolean hasAudio
    ) {
        this.kind = kind;
        this.url = url;
        this.width = Math.max(width, 0);
        this.height = Math.max(height, 0);
        this.bitrate = Math.max(bitrate, 0);
        this.mimeType = emptyIfNull(mimeType);
        this.codecs = emptyIfNull(codecs);
        this.representationId = emptyIfNull(representationId);
        this.manifestId = emptyIfNull(manifestId);
        this.sourceRole = emptyIfNull(sourceRole);
        this.hasAudio = hasAudio;
    }

    public MediaVariant(
            Kind kind,
            String url,
            int width,
            int height,
            long bitrate,
            String mimeType,
            String codecs,
            String representationId,
            String sourceRole,
            boolean hasAudio
    ) {
        this(
                kind,
                url,
                width,
                height,
                bitrate,
                mimeType,
                codecs,
                representationId,
                "",
                sourceRole,
                hasAudio
        );
    }

    public long pixelCount() {
        return (long) width * height;
    }

    public int qualityEdge() {
        if (width <= 0) return height;
        if (height <= 0) return width;
        return Math.min(width, height);
    }

    public int qualityLabelEdge() {
        return normalizeQualityEdge(qualityEdge());
    }

    public static int normalizeQualityEdge(int qualityEdge) {
        if (qualityEdge <= 0) return 0;
        int best = FACEBOOK_QUALITY_LABELS[0];
        int bestDistance = Math.abs(qualityEdge - best);
        for (int index = 1;
             index < FACEBOOK_QUALITY_LABELS.length;
             index++) {
            int candidate = FACEBOOK_QUALITY_LABELS[index];
            int distance = Math.abs(qualityEdge - candidate);
            if (distance < bestDistance) {
                best = candidate;
                bestDistance = distance;
            }
        }
        return best;
    }

    public boolean isVideo() {
        return kind == Kind.PROGRESSIVE_VIDEO ||
                kind == Kind.DASH_VIDEO;
    }

    public boolean isAudio() {
        return kind == Kind.DASH_AUDIO;
    }

    private static String emptyIfNull(String value) {
        return value == null ? "" : value;
    }
}
