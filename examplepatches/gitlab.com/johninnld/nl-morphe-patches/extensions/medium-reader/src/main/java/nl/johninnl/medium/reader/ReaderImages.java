package nl.johninnl.medium.reader;

import java.io.File;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.LinkedHashMap;
import java.util.Map;

/** Only replacement-body images receive local identities; ordinary Medium images pass through. */
public final class ReaderImages {
    private static final String PREFIX = "mrimg_";
    private static final Map<String, URI> SOURCES = new LinkedHashMap<String, URI>(128, .75f, true) {
        protected boolean removeEldestEntry(Map.Entry<String, URI> entry) { return size() > 4096; }
    };
    private static volatile ImageCache cache;
    private ReaderImages() {}
    public static void configure(File directory) { cache = new ImageCache(directory); }
    public static synchronized String register(ArticleBody.Image image) throws ArticleException {
        URI uri = image == null ? null : image.url;
        if (uri == null || !"https".equalsIgnoreCase(uri.getScheme()) || uri.getHost() == null || uri.getUserInfo() != null || uri.getFragment() != null) {
            throw new ArticleException("BAD_IMAGE", "Image requires a public HTTPS source");
        }
        String id = PREFIX + digest(uri.toASCIIString());
        SOURCES.put(id, uri);
        return id;
    }
    public static synchronized String resolve(String id) {
        return id != null && id.startsWith(PREFIX) && SOURCES.containsKey(id) ?
            "content://com.medium.reader.native-reader.images/" + id : null;
    }
    static synchronized URI source(String id) { return SOURCES.get(id); }
    public static synchronized URI sourceUri(String id) { return SOURCES.get(id); }
    static ImageCache cache() { return cache; }
    public static int[] completion(ArticleBody body) throws ArticleException {
        java.util.Set<String> images = new java.util.HashSet<>();
        for (ArticleBody.Block block : body.blocks) if (block.image != null) images.add(register(block.image));
        ImageCache current = cache; int completed = 0;
        if (current != null) for (String id : images) if (current.contains(id)) completed++;
        return new int[] {completed, images.size()};
    }
    public static void clear() throws java.io.IOException { ImageCache current = cache; if (current != null) current.clear(); }
    public static File cachedFile(ArticleBody.Image image) throws ArticleException {
        String id = register(image); ImageCache current = cache;
        return current == null ? null : current.cached(id);
    }
    public static int[] saveOffline(ArticleBody body, Cancellation cancellation) throws ArticleException {
        ImageCache current = cache; if (current == null) return new int[] {0,0};
        ArticleLoader source = ReaderRuntime.loader(); long epoch = source.cacheEpoch();
        long deadline = System.nanoTime() + java.util.concurrent.TimeUnit.SECONDS.toNanos(90);
        java.util.Set<String> seen = new java.util.HashSet<>();
        for (ArticleBody.Block block : body.blocks) if (block.image != null) {
            cancellation.check();
            if (source.cacheEpoch() != epoch) throw new ArticleException("CANCELLED", "Offline cache was cleared");
            if (System.nanoTime() >= deadline) break;
            String id = register(block.image);
            if (seen.add(id)) try { current.get(id, block.image.url, cancellation); } catch (java.io.IOException unavailable) { }
        }
        return completion(body);
    }
    private static String digest(String value) {
        try {
            byte[] bytes = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder(64);
            for (byte b : bytes) result.append(String.format(java.util.Locale.ROOT, "%02x", b & 255));
            return result.toString();
        } catch (java.security.NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }
}
