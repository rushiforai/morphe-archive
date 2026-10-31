package app.morphed.extension.twitch;

import java.time.Instant;

/**
 * Builds playlists shaped like the ones Twitch serves.
 */
public final class Playlists {
    public static final long START = Instant.parse("2026-10-28T12:00:00Z").toEpochMilli();
    public static final String AD_DATERANGE = "#EXT-X-DATERANGE:ID=\"stitched-ad-1\",CLASS=\"twitch-stitched-ad\","
            + "START-DATE=\"2026-10-28T12:00:00.000Z\",DURATION=30,X-TV-TWITCH-AD-POD-LENGTH=\"1\","
            + "X-TV-TWITCH-AD-RADS-TOKEN=\"abc\"";

    private Playlists() {
    }

    public static String master(String... urls) {
        String[] resolutions = {"1920x1080", "1280x720", "852x480"};
        StringBuilder out = new StringBuilder("#EXTM3U\n#EXT-X-SESSION-DATA:DATA-ID=\"SERVER-TIME\",VALUE=\"1.0\"\n");
        for (int i = 0; i < urls.length; i++) {
            out.append("#EXT-X-STREAM-INF:BANDWIDTH=6000000,RESOLUTION=").append(resolutions[i % resolutions.length])
                    .append(",CODECS=\"avc1.64002A,mp4a.40.2\",VIDEO=\"chunked\",FRAME-RATE=60.000\n")
                    .append(urls[i]).append('\n');
        }
        return out.toString();
    }

    /** A media playlist; {@code kinds} has one char per segment: 'l' live, 'a' ad. */
    public static String media(String prefix, long firstSequence, String kinds, boolean adTags) {
        StringBuilder out = new StringBuilder("#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-TARGETDURATION:6\n")
                .append("#EXT-X-MEDIA-SEQUENCE:").append(firstSequence).append('\n')
                .append("#EXT-X-TWITCH-ELAPSED-SECS:100.0\n");
        if (adTags) out.append(AD_DATERANGE).append('\n');
        char previous = 'l';
        for (int i = 0; i < kinds.length(); i++) {
            long sequence = firstSequence + i;
            char kind = kinds.charAt(i);
            if (kind != previous) out.append("#EXT-X-DISCONTINUITY\n");
            previous = kind;
            out.append("#EXT-X-PROGRAM-DATE-TIME:").append(Instant.ofEpochMilli(time(sequence))).append('\n');
            if (kind == 'a') {
                out.append("#EXTINF:2.000,Amazon|123\n").append("https://edge.example/ads/").append(prefix).append(sequence).append(".ts\n");
            } else {
                out.append("#EXTINF:2.000,live\n").append(segment(prefix, sequence)).append('\n');
            }
        }
        out.append("#EXT-X-TWITCH-PREFETCH:").append(segment(prefix, firstSequence + kinds.length())).append('\n');
        return out.toString();
    }

    /** The same playlist with fMP4 segments: an EXT-X-MAP init segment before the first segment. */
    public static String withInitSegment(String playlist, String prefix) {
        return playlist.replace("#EXT-X-TARGETDURATION:6\n", "#EXT-X-TARGETDURATION:6\n" + map(prefix) + "\n");
    }

    public static String map(String prefix) {
        return "#EXT-X-MAP:URI=\"https://edge.example/" + prefix + "/init.mp4\"";
    }

    public static String segment(String prefix, long sequence) {
        return "https://edge.example/" + prefix + "/" + sequence + ".ts";
    }

    public static long time(long sequence) {
        return START + sequence * 2000;
    }
}
