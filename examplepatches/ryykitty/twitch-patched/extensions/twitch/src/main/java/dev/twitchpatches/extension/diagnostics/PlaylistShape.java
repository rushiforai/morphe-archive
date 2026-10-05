package dev.twitchpatches.extension.diagnostics;

public final class PlaylistShape {
    private PlaylistShape() { }

    public static String summarize(String text) {
        if (text.length() > 512 * 1024 || !text.startsWith("#EXTM3U")) return "unsupported body";
        long media = -1, discontinuities = -1, cursor = -1, first = -1, last = -1;
        int version = -1, target = -1, segments = 0, live = 0, hints = 0, variants = 0, boundaries = 0;
        boolean ads = false, partial = false, mapped = false, dated = false, pending = false;
        try {
            for (String raw : text.split("\n")) {
                String line = raw.trim();
                if (line.startsWith("#EXT-X-MEDIA-SEQUENCE:")) media = number(line);
                else if (line.startsWith("#EXT-X-DISCONTINUITY-SEQUENCE:")) discontinuities = number(line);
                else if (line.startsWith("#EXT-X-VERSION:")) version = Math.toIntExact(number(line));
                else if (line.startsWith("#EXT-X-TARGETDURATION:")) target = Math.toIntExact(number(line));
                else if (line.startsWith("#EXT-X-TWITCH-LIVE-SEQUENCE:")) cursor = number(line);
                else if (line.equals("#EXT-X-DISCONTINUITY")) { cursor = -1; boundaries++; }
                else if (line.startsWith("#EXT-X-STREAM-INF:")) variants++;
                else if (line.startsWith("#EXT-X-MAP:")) mapped = true;
                else if (line.startsWith("#EXT-X-PROGRAM-DATE-TIME:")) dated = true;
                else if (line.startsWith("#EXT-X-PART:") || line.startsWith("#EXT-X-SKIP:")) partial = true;
                else if (line.startsWith("#EXT-X-DATERANGE:")) ads |= line.contains("stitched-ad") || line.contains("X-TV-TWITCH-AD");
                else if (line.startsWith("#EXTINF:")) pending = true;
                else if (line.startsWith("#EXT-X-TWITCH-PREFETCH:")) { hints++; if (cursor >= 0) cursor++; }
                else if (!line.isEmpty() && !line.startsWith("#") && pending) {
                    segments++;
                    if (cursor >= 0) { live++; if (first < 0) first = cursor; last = cursor++; }
                    pending = false;
                }
            }
        } catch (IllegalArgumentException | ArithmeticException exception) { return "malformed structure"; }
        return "variants=" + variants + " segments=" + segments + " live=" + live + " hints=" + hints +
                " media=" + media + " first=" + first + " last=" + last + " version=" + version +
                " target=" + target + " discontinuitySequence=" + discontinuities + " boundaries=" + boundaries +
                " ads=" + ads + " partial=" + partial + " map=" + mapped + " dated=" + dated;
    }

    private static long number(String line) {
        long value = Long.parseLong(line.substring(line.indexOf(':') + 1));
        if (value < 0 || value > Long.MAX_VALUE - 256) throw new IllegalArgumentException("Invalid sequence");
        return value;
    }
}
