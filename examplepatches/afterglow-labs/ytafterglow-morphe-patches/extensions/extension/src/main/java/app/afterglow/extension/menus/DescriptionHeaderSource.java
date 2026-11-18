package app.afterglow.extension.menus;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.util.LinkedHashMap;
import java.util.Map;

/** Uses the pinned Morphe player-metadata transport; no streaming formats, account cookies or files. */
public final class DescriptionHeaderSource {
    private static final Map<String, DescriptionHeaderPolicy.Metadata> CACHE = new LinkedHashMap<>();
    private static final Map<String, String> TITLES = new LinkedHashMap<>();
    private DescriptionHeaderSource() {}

    /** Patched to ChannelIdRoutes.createBody, with the current installed YouTube client context. */
    public static byte[] nativeRequestBody(String id) { throw new IllegalStateException("Native metadata transport unavailable"); }
    /** Patched to ChannelIdRoutes.GET_CHANNEL_ID: all videoDetails, including identity and raw description. */
    public static HttpURLConnection nativeConnection() { throw new IllegalStateException("Native metadata transport unavailable"); }

    public static synchronized void rememberTitle(String id, String title) {
        if (!DescriptionHeaderPolicy.videoId(id)) return;
        TITLES.remove(id);
        if (title != null && !title.isEmpty() && title.length() <= DescriptionHeaderPolicy.MAX_TEXT) TITLES.put(id, title);
        while (TITLES.size() > 16) TITLES.remove(TITLES.keySet().iterator().next());
        // A fresh native response invalidates earlier metadata, even for the same video.
        CACHE.remove(id);
    }
    public static synchronized String title(String id) { return TITLES.get(id); }
    public static DescriptionHeaderPolicy.Metadata load(String id) throws Exception {
        if (!DescriptionHeaderPolicy.videoId(id)) throw new IllegalArgumentException("Open a video first.");
        synchronized (DescriptionHeaderSource.class) { if (CACHE.containsKey(id)) return CACHE.get(id); }
        byte[] body = nativeRequestBody(id);
        if (body == null || body.length == 0 || body.length > 65536) throw new IllegalStateException("Native metadata transport unavailable");
        HttpURLConnection connection = nativeConnection();
        if (connection == null) throw new IllegalStateException("Native metadata transport unavailable");
        try {
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(5000); connection.setReadTimeout(5000);
            connection.setFixedLengthStreamingMode(body.length);
            try (OutputStream output = connection.getOutputStream()) { output.write(body); }
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK)
                throw new java.io.IOException("The full description could not be loaded. Try again.");
            DescriptionHeaderPolicy.Metadata result;
            try (InputStream input = connection.getInputStream(); ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[8192]; int count;
                while ((count = input.read(buffer)) != -1) {
                    if (output.size() + count > DescriptionHeaderPolicy.MAX_RESPONSE) throw new java.io.IOException("The video details are too large.");
                    output.write(buffer, 0, count);
                }
                result = DescriptionHeaderPolicy.parse(id, output.toByteArray());
            }
            synchronized (DescriptionHeaderSource.class) {
                CACHE.put(id, result); while (CACHE.size() > 8) CACHE.remove(CACHE.keySet().iterator().next());
            }
            return result;
        } finally { connection.disconnect(); }
    }
}
