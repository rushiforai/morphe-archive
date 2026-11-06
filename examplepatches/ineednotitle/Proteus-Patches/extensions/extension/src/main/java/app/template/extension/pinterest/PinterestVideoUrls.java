package app.template.extension.pinterest;

import java.net.URI;
import java.util.Locale;
import java.util.Map;

/** Pure selection logic, kept independent of Android for local testing. */
public final class PinterestVideoUrls {
    private static final String[] PREFERRED = {
            "V_HEVC_MP4_T5_V2", "V_HEVC_MP4_T4_V2", "V_HEVC_MP4_T3_V2",
            "V_HEVC_MP4_T2_V2", "V_HEVC_MP4_T1_V2", "V_AV1_MP4_T5", "V_AV1_MP4_T4",
            "V_AV1_MP4_T3", "V_AV1_MP4_T2", "V_AV1_MP4_T1", "V_AV1_MP4", "V_720P"
    };

    private PinterestVideoUrls() {}

    private static URI pinterestUri(String value) {
        if (value == null) return null;
        try {
            URI uri = URI.create(value);
            String host = uri.getHost();
            if (!"https".equalsIgnoreCase(uri.getScheme()) || host == null || uri.getUserInfo() != null ||
                    uri.getPort() != -1) return null;
            host = host.toLowerCase(Locale.ROOT);
            return host.equals("pinimg.com") || host.endsWith(".pinimg.com") ? uri : null;
        } catch (IllegalArgumentException ignored) {
            return null;
        }
    }

    public static boolean isTrustedMp4(String value) {
        URI uri = pinterestUri(value);
        return uri != null && uri.getPath() != null && uri.getPath().toLowerCase(Locale.ROOT).endsWith(".mp4");
    }

    /** Prefer known progressive encodings, then any direct MP4; never enqueue an HLS playlist. */
    public static String findMp4(Map<String, String> urls) {
        if (urls == null) return null;
        for (String key : PREFERRED) {
            String value = urls.get(key);
            if (isTrustedMp4(value)) return value;
        }
        for (String value : urls.values()) if (isTrustedMp4(value)) return value;
        return null;
    }

    /** Candidate only: availability must be checked before downloading. */
    public static String hlsCandidate(String value) {
        URI uri = pinterestUri(value);
        if (uri == null) return null;
        String path = uri.getRawPath();
        if (path == null || !path.endsWith(".m3u8")) return null;
        int hls = path.indexOf("/hls/");
        if (hls < 0) return null;
        String candidatePath = path.substring(0, hls) + "/720p/" + path.substring(hls + 5, path.length() - 5) + ".mp4";
        return "https://" + uri.getHost() + candidatePath + (uri.getRawQuery() == null ? "" : "?" + uri.getRawQuery());
    }
}
