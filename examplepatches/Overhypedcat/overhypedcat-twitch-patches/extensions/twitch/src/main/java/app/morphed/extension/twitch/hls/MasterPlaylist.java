package app.morphed.extension.twitch.hls;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * The usher playlist that lists one media playlist per quality.
 */
public final class MasterPlaylist {
    public static final class Variant {
        public final String url;
        /** For example {@code 1920x1080}, or null for audio only. */
        public final String resolution;
        public final String frameRate;
        public final String codecs;

        Variant(String url, String resolution, String frameRate, String codecs) {
            this.url = url;
            this.resolution = resolution;
            this.frameRate = frameRate;
            this.codecs = codecs;
        }

        long area() {
            if (resolution == null) return -1;
            int x = resolution.indexOf('x');
            if (x < 0) return -1;
            try {
                return Long.parseLong(resolution.substring(0, x)) * Long.parseLong(resolution.substring(x + 1));
            } catch (NumberFormatException e) {
                return -1;
            }
        }
    }

    public final List<Variant> variants;

    private MasterPlaylist(List<Variant> variants) {
        this.variants = Collections.unmodifiableList(variants);
    }

    public static MasterPlaylist parse(String text) {
        String[] lines = text.split("\r?\n");
        List<Variant> variants = new ArrayList<>();
        for (int i = 0; i < lines.length - 1; i++) {
            if (!lines[i].startsWith("#EXT-X-STREAM-INF")) continue;
            String url = lines[i + 1].trim();
            if (url.isEmpty() || url.startsWith("#")) continue;

            Map<String, String> attributes = Attributes.parse(lines[i]);
            variants.add(new Variant(url, attributes.get("RESOLUTION"), attributes.get("FRAME-RATE"), attributes.get("CODECS")));
        }
        return new MasterPlaylist(variants);
    }

    public Variant byUrl(String url) {
        String key = UrlKey.of(url);
        for (Variant variant : variants) {
            if (UrlKey.of(variant.url).equals(key)) return variant;
        }
        return null;
    }

    /**
     * The variant that best matches the quality the player is on: same resolution and frame rate,
     * then same resolution, then the closest pixel count.
     */
    public Variant closestTo(Variant target) {
        if (target.resolution == null) {
            for (Variant variant : variants) {
                if (variant.resolution == null) return variant;
            }
            return null;
        }

        Variant sameResolution = null;
        Variant closest = null;
        long closestDifference = Long.MAX_VALUE;
        long targetArea = target.area();
        for (Variant variant : variants) {
            if (variant.resolution == null) continue;
            if (variant.resolution.equals(target.resolution)) {
                if (equalFrameRate(variant.frameRate, target.frameRate)) return variant;
                if (sameResolution == null) sameResolution = variant;
            }
            long difference = Math.abs(variant.area() - targetArea);
            if (difference < closestDifference) {
                closestDifference = difference;
                closest = variant;
            }
        }
        return sameResolution != null ? sameResolution : closest;
    }

    private static boolean equalFrameRate(String a, String b) {
        if (a == null || b == null) return a == null && b == null;
        try {
            return Math.round(Double.parseDouble(a)) == Math.round(Double.parseDouble(b));
        } catch (NumberFormatException e) {
            return a.equals(b);
        }
    }
}
