package dev.twitchpatches.extension.ads.hls;

import java.util.List;
import java.util.Locale;
import java.util.Map;

public final class Variant {
    public final String uri;
    public final String codec;
    public final int width;
    public final int height;
    public final double frameRate;
    public final long bandwidth;

    private Variant(String uri, String codec, int width, int height, double frameRate, long bandwidth) {
        this.uri = uri; this.codec = codec; this.width = width; this.height = height;
        this.frameRate = frameRate; this.bandwidth = bandwidth;
    }

    static Variant from(String uri, Map<String, String> attributes) {
        String[] resolution = attributes.getOrDefault("RESOLUTION", "0x0").split("x");
        if (resolution.length != 2) throw new IllegalArgumentException("Malformed resolution");
        String codecs = attributes.getOrDefault("CODECS", "").toLowerCase(Locale.ROOT);
        String video = "";
        for (String part : codecs.split(",")) {
            part = part.trim();
            if (part.startsWith("avc1") || part.startsWith("hvc1") || part.startsWith("hev1") || part.startsWith("av01"))
                video = part.substring(0, 4);
        }
        int width = Integer.parseInt(resolution[0]), height = Integer.parseInt(resolution[1]);
        double frameRate = Double.parseDouble(attributes.getOrDefault("FRAME-RATE", "0"));
        long bandwidth = Long.parseLong(attributes.getOrDefault("BANDWIDTH", "0"));
        if (width < 0 || width > 8192 || height < 0 || height > 8192 ||
                !Double.isFinite(frameRate) || frameRate < 0 || frameRate > 240 || bandwidth < 0 ||
                (height > 0 && video.isEmpty()) || (height == 0 && !codecs.startsWith("mp4a.")))
            throw new IllegalArgumentException("Unsupported rendition metadata");
        return new Variant(uri, video.isEmpty() ? codecs : video, width, height, frameRate, bandwidth);
    }

    public static Variant match(List<Variant> variants, Variant original, boolean allowLower) {
        Variant best = null;
        for (Variant candidate : variants) {
            if (!candidate.codec.equals(original.codec) || candidate.height > original.height ||
                    (original.height == 0) != (candidate.height == 0)) continue;
            if (!allowLower && (candidate.width != original.width || candidate.height != original.height ||
                    Math.abs(candidate.frameRate - original.frameRate) > 1)) continue;
            if (best == null || candidate.height > best.height || (candidate.height == best.height &&
                    (candidate.frameRate > best.frameRate || (candidate.frameRate == best.frameRate &&
                    candidate.bandwidth > best.bandwidth)))) best = candidate;
        }
        return best;
    }
}
