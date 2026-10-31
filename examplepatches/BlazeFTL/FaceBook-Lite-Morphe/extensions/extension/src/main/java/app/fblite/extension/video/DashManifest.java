/*
 * Adapted from Hushfacebook's DashManifest (https://github.com/SysAdminDoc/Hushfacebook), itself forked from
 * Andrew Liang's morphe-patches (https://github.com/andrewliang25/morphe-patches). GPL-3.0.
 */
package app.fblite.extension.video;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The tracks of a DASH manifest. Facebook writes each track as one Representation with one BaseURL, the
 * address of a whole MP4 file holding only that track, so one plain fetch gets a track and picture and sound
 * are two files. Reads only that shape and never throws.
 */
final class DashManifest {
    static final class Track {
        final String mime;
        final String codecs;
        final int width;
        final int height;
        final long bandwidth;
        final String url;
        /** The quality Facebook's own menu names the track by (720 for 720p), or 0. */
        final int label;

        Track(String mime, String codecs, int width, int height, long bandwidth, String url, int label) {
            this.mime = mime;
            this.codecs = codecs;
            this.width = width;
            this.height = height;
            this.bandwidth = bandwidth;
            this.url = url;
            this.label = label;
        }

        boolean isVideo() {
            return mime.startsWith("video/");
        }

        boolean isAudio() {
            return mime.startsWith("audio/");
        }

        /** Quality in the unit of 720p: the label when there is one, else the short side in pixels. */
        int quality() {
            return label > 0 ? label : Math.min(width, height);
        }

        /**
         * How widely the codec plays, to pick between tracks of the same quality: 4 for H.264, 3 for H.265, 2 for
         * VP9, 1 for AV1 and anything else. Every family is joined: MediaMuxer takes H.264 and H.265, and
         * {@link Mp4Remux} takes the rest.
         */
        int videoFamily() {
            if (codecs.startsWith("avc1") || codecs.startsWith("avc3")) return 4;
            if (codecs.startsWith("hvc1") || codecs.startsWith("hev1")) return 3;
            if (codecs.startsWith("vp09")) return 2;
            return 1;
        }

        /** True when MediaMuxer can write the video codec into an MP4 on every Android version. */
        boolean muxerCanWrite() {
            return videoFamily() >= 3;
        }

        /** The codec in short words for the quality list: H.264, H.265, VP9, AV1. */
        String codecName() {
            switch (videoFamily()) {
                case 4:
                    return "H.264";
                case 3:
                    return "H.265";
                case 2:
                    return "VP9";
                default:
                    return codecs.startsWith("av01") ? "AV1" : "";
            }
        }

        /** 3 for AAC-LC, 2 for HE-AAC, 1 for any other sound (xHE-AAC, which Facebook uses with AV1), 0 for not sound. */
        int audioRank() {
            if (!isAudio()) return 0;
            if (!codecs.startsWith("mp4a.40.")) return 1;
            try {
                int type = Integer.parseInt(codecs.substring("mp4a.40.".length()).trim());
                if (type == 2) return 3;
                if (type == 5 || type == 29) return 2;
            } catch (NumberFormatException ignored) {
            }
            return 1;
        }

        boolean isXheAac() {
            return codecs.startsWith("mp4a.40.42");
        }

        @Override
        public String toString() {
            return mime + " " + codecs + " " + width + "x" + height + " " + (bandwidth / 1000) + "kbps" + (label > 0 ? " " + label + "p" : "");
        }
    }

    private static final Pattern ADAPTATION_SET = Pattern.compile("<AdaptationSet\\b([^>]*)>(.*?)</AdaptationSet>", Pattern.DOTALL);
    private static final Pattern REPRESENTATION = Pattern.compile("<Representation\\b([^>]*?)(?:/>|>(.*?)</Representation>)", Pattern.DOTALL);
    private static final Pattern ATTRIBUTE = Pattern.compile("([\\w:]+)\\s*=\\s*\"([^\"]*)\"");
    private static final Pattern BASE_URL = Pattern.compile("<BaseURL[^>]*>(.*?)</BaseURL>", Pattern.DOTALL);
    private static final Pattern DURATION = Pattern.compile("PT(?:(\\d+)H)?(?:(\\d+)M)?(?:(\\d+(?:\\.\\d+)?)S)?");

    private static final int MAX_CHARS = 128 * 1024;
    private static final int MAX_TRACKS = 64;

    final List<Track> tracks = new ArrayList<>();
    double durationSeconds;

    private DashManifest() {
    }

    static DashManifest parse(String manifest) {
        DashManifest result = new DashManifest();
        if (manifest == null || manifest.length() > MAX_CHARS) return result;
        try {
            result.durationSeconds = duration(attribute(manifest, "mediaPresentationDuration"));
            Matcher sets = ADAPTATION_SET.matcher(manifest);
            while (sets.find() && result.tracks.size() < MAX_TRACKS) {
                Matcher representations = REPRESENTATION.matcher(sets.group(2));
                while (representations.find() && result.tracks.size() < MAX_TRACKS) {
                    Track track = track(sets.group(1), representations.group(1), representations.group(2));
                    if (track != null) result.tracks.add(track);
                }
            }
        } catch (Throwable ignored) {
            // An unexpected shape answers with what was read so far.
        }
        return result;
    }

    /** One video track per quality, highest first. H.264 wins over H.265 at the same quality, then the higher bitrate. */
    List<Track> videoChoices() {
        List<Track> best = new ArrayList<>();
        for (Track track : tracks) {
            if (!track.isVideo() || track.videoFamily() == 0 || track.quality() <= 0) continue;
            int same = -1;
            for (int i = 0; i < best.size(); i++) {
                if (best.get(i).quality() == track.quality()) {
                    same = i;
                    break;
                }
            }
            if (same < 0) {
                best.add(track);
                continue;
            }
            Track current = best.get(same);
            if (track.videoFamily() > current.videoFamily()
                    || (track.videoFamily() == current.videoFamily() && track.bandwidth > current.bandwidth)) {
                best.set(same, track);
            }
        }
        Collections.sort(best, (a, b) -> Integer.compare(b.quality(), a.quality()));
        return best;
    }

    /** The best AAC-LC track, else the best HE-AAC one, else null. */
    Track audio() {
        Track best = null;
        for (Track track : tracks) {
            int rank = track.audioRank();
            if (rank == 0) continue;
            if (best == null || rank > best.audioRank() || (rank == best.audioRank() && track.bandwidth > best.bandwidth)) {
                best = track;
            }
        }
        return best;
    }

    boolean hasAnyAudio() {
        for (Track track : tracks) {
            if (track.isAudio()) return true;
        }
        return false;
    }

    private static Track track(String setAttributes, String attributes, String body) {
        if (body == null) return null;
        Matcher base = BASE_URL.matcher(body);
        if (!base.find()) return null;
        String url = unescape(base.group(1).trim());
        if (!url.toLowerCase(Locale.US).startsWith("https://")) return null;

        String mime = given(attribute(attributes, "mimeType"));
        if (mime == null) mime = given(attribute(setAttributes, "mimeType"));
        if (mime == null) {
            String content = given(attribute(setAttributes, "contentType"));
            if (content != null) mime = content + "/mp4";
        }
        if (mime == null) return null;

        String codecs = attribute(attributes, "codecs");
        if (codecs == null) codecs = attribute(setAttributes, "codecs");
        return new Track(mime.toLowerCase(Locale.US), codecs == null ? "" : codecs.toLowerCase(Locale.US),
                (int) number(attribute(attributes, "width")), (int) number(attribute(attributes, "height")),
                number(attribute(attributes, "bandwidth")), url, label(attribute(attributes, "FBQualityLabel")));
    }

    private static String given(String value) {
        if (value == null) return null;
        String trimmed = value.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }

    /** The number in a label such as 720p, or 0. */
    private static int label(String label) {
        if (label == null) return 0;
        String text = label.trim().toLowerCase(Locale.US);
        int digits = text.length() - 1;
        if (digits < 3 || digits > 4 || text.charAt(digits) != 'p') return 0;
        return (int) number(text.substring(0, digits));
    }

    private static String attribute(String attributes, String name) {
        if (attributes == null) return null;
        Matcher matcher = ATTRIBUTE.matcher(attributes);
        while (matcher.find()) {
            if (matcher.group(1).equals(name)) return unescape(matcher.group(2));
        }
        return null;
    }

    private static long number(String text) {
        if (text == null) return 0;
        try {
            return Math.max(0, Long.parseLong(text.trim()));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static double duration(String iso) {
        if (iso == null) return 0;
        Matcher m = DURATION.matcher(iso.trim());
        if (!m.matches()) return 0;
        double seconds = 0;
        if (m.group(1) != null) seconds += Integer.parseInt(m.group(1)) * 3600;
        if (m.group(2) != null) seconds += Integer.parseInt(m.group(2)) * 60;
        if (m.group(3) != null) seconds += Double.parseDouble(m.group(3));
        return seconds;
    }

    private static String unescape(String text) {
        return text.replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", "\"").replace("&apos;", "'").replace("&amp;", "&");
    }
}
