package semicoloncolonel.mobilestream.extension.mlb;

import android.net.Uri;
import android.util.Log;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Rewrites HLS playlists fetched by Media3's OkHttpDataSource to strip live
 * DAI ad segments before ExoPlayer parses them.
 *
 * Ported from ajstrick81's MLB At Bat Android TV patch (GPL-3.0). The live ad
 * segments are stitched into the manifest server-side, so there is no
 * client-side ad request to block; the manifest text itself is the only point
 * of control. wrap() is spliced in where the data source stores its response
 * stream. The DataSpec is passed as Object (its real type is obfuscated); its
 * Uri is read by reflection.
 */
@SuppressWarnings("unused")
public final class MlbManifestRewriter {
    private static final String TAG = "MSP-MLB-MANIFEST";

    private static final String[] SEGMENT_AD_MARKERS = {
        "dclk_video_ads", "doubleclick.net", "googlesyndication.com",
    };
    private static final String TAG_DISCONTINUITY = "#EXT-X-DISCONTINUITY";

    private MlbManifestRewriter() {
    }

    public static InputStream wrap(Object dataSpec, InputStream stream) {
        try {
            Uri uri = extractUri(dataSpec);
            if (uri == null || !uri.toString().contains(".m3u8")) return stream;

            byte[] bytes = readAll(stream);
            String text = new String(bytes, StandardCharsets.UTF_8);
            if (!containsAdBreak(text)) {
                return new ByteArrayInputStream(bytes);
            }
            // Ground-truth ad-break signal: a live playlist carrying ad markers.
            AdBreakOverlayHelper.signalAdBreak();
            String rewritten = stripAdSegments(text);
            return new ByteArrayInputStream(rewritten.getBytes(StandardCharsets.UTF_8));
        } catch (Throwable t) {
            Log.w(TAG, "manifest rewrite failed", t);
            return stream;
        }
    }

    private static boolean containsAdBreak(String text) {
        for (String m : SEGMENT_AD_MARKERS) {
            if (text.contains(m)) return true;
        }
        if (text.contains("#EXT-X-CUE-OUT")) return true;
        // A DATERANGE row flagged as an ad.
        int i = text.indexOf("#EXT-X-DATERANGE:");
        while (i >= 0) {
            int end = text.indexOf('\n', i);
            String line = end < 0 ? text.substring(i) : text.substring(i, end);
            if (line.toLowerCase().contains("class=\"ad")) return true;
            i = text.indexOf("#EXT-X-DATERANGE:", i + 1);
        }
        return false;
    }

    /**
     * Tags that describe only the segment after them, so they go with an ad
     * segment when it is dropped. Every other tag queued before a segment is
     * kept: the playlist header (#EXTM3U, #EXT-X-TARGETDURATION,
     * #EXT-X-MEDIA-SEQUENCE) comes before the first segment, and #EXT-X-KEY
     * or #EXT-X-MAP before an ad also applies to the content after it.
     */
    private static final String[] SEGMENT_TAGS = {
        "#EXTINF", "#EXT-X-BYTERANGE", "#EXT-X-PROGRAM-DATE-TIME", "#EXT-X-CUE",
        "#EXT-X-DATERANGE", "#EXT-X-GAP", "#EXT-X-BITRATE",
    };

    /** Drops each ad segment line and the tags that describe only it. */
    private static String stripAdSegments(String playlist) {
        String[] lines = playlist.split("\n", -1);
        List<String> out = new ArrayList<>(lines.length);
        List<String> pending = new ArrayList<>();
        for (String line : lines) {
            String t = line.trim();
            if (t.isEmpty() || t.startsWith("#")) {
                pending.add(line);
            } else if (isAdSegment(t)) {
                for (String queued : pending) {
                    if (!isSegmentTag(queued.trim())) out.add(queued);
                }
                pending.clear();
            } else {
                out.addAll(pending);
                out.add(line);
                pending.clear();
            }
        }
        out.addAll(pending);
        return String.join("\n", collapseDiscontinuities(out));
    }

    private static boolean isSegmentTag(String line) {
        for (String tag : SEGMENT_TAGS) {
            if (line.startsWith(tag)) return true;
        }
        return false;
    }

    private static boolean isAdSegment(String line) {
        for (String m : SEGMENT_AD_MARKERS) {
            if (line.contains(m)) return true;
        }
        return false;
    }

    /**
     * Removes a discontinuity when no segment came after the previous one,
     * such as the pair left around a dropped break, even with a kept tag
     * (#EXT-X-KEY, #EXT-X-MAP) between them.
     */
    private static List<String> collapseDiscontinuities(List<String> lines) {
        List<String> result = new ArrayList<>(lines.size());
        boolean openDiscontinuity = false;
        for (String line : lines) {
            String t = line.trim();
            if (t.equals(TAG_DISCONTINUITY)) {
                if (openDiscontinuity) continue;
                openDiscontinuity = true;
            } else if (!t.isEmpty() && !t.startsWith("#")) {
                openDiscontinuity = false;
            }
            result.add(line);
        }
        return result;
    }

    private static Uri extractUri(Object dataSpec) {
        if (dataSpec == null) return null;
        try {
            for (Field f : dataSpec.getClass().getFields()) {
                if (f.getType() == Uri.class) {
                    f.setAccessible(true);
                    Object v = f.get(dataSpec);
                    if (v instanceof Uri) return (Uri) v;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static byte[] readAll(InputStream in) throws Exception {
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
        return out.toByteArray();
    }
}
