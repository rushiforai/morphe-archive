package e.e.a;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;

public final class CacheSupportTest {
    private static int checks;
    private static void equal(Object expected, Object actual) {
        checks++;
        if (!expected.equals(actual)) throw new AssertionError(expected + " != " + actual);
    }
    public static void main(String[] args) throws Exception {
        String media = "https://delivery.domand.nicovideo.jp/secret/master.m3u8?token=private";
        equal("user_session=login; domand_bid=new", CacheSupport.mergeCookie(media,
            "user_session=login; domand_bid=old", "domand_bid=new; Path=/; Secure"));
        equal("domand_bid=new", CacheSupport.mergeCookie(media, null, "domand_bid=new"));
        equal("user_session=login", CacheSupport.mergeCookie(media, "user_session=login", null));
        equal("original", CacheSupport.mergeCookie("https://other.example/test.m3u8", "original", "domand_bid=new"));
        equal("original", CacheSupport.mergeCookie("https://delivery.domand.nicovideo.jp.evil.example/a", "original", "domand_bid=new"));
        equal("original", CacheSupport.mergeCookie("invalid", "original", "domand_bid=new"));
        ModernPlayback.domandCookie = "domand_bid=first";
        String snapshot = CacheSupport.cookieFor(media, "user_session=login");
        ModernPlayback.domandCookie = "domand_bid=second";
        equal("user_session=login; domand_bid=first", snapshot);
        HttpURLConnection connection = new HttpURLConnection(new URL(media)) {
            public void disconnect() { }
            public boolean usingProxy() { return false; }
            public void connect() { }
        };
        connection.setRequestProperty("Cookie", snapshot);
        CacheSupport.beforeRequest(connection);
        equal("https://www.nicovideo.jp", connection.getRequestProperty("Origin"));
        equal(snapshot, connection.getRequestProperty("Cookie"));
        CacheSupport.http(connection, 403);
        equal("Cache HTTP 403 playlist", ModernDebug.last);
        CacheSupport.failed(new java.io.IOException(media));
        equal("Cache failed: IOException", ModernDebug.last);
        Path root = Files.createTempDirectory("nicoid-migration-test");
        try {
            File legacy = root.resolve("nicoid/history.json").toFile();
            legacy.getParentFile().mkdirs(); legacy.createNewFile();
            equal(true, CacheSupport.needsMigration(legacy));
            File current = root.resolve("Android/data/com.sauzask.nicoid.hls/files/nicoid/history.json").toFile();
            current.getParentFile().mkdirs(); current.createNewFile();
            equal(false, CacheSupport.needsMigration(current));
            equal(true, current.exists());
            equal(false, CacheSupport.needsMigration(root.resolve("absent.json").toFile()));
        } finally {
            try (java.util.stream.Stream<Path> paths = Files.walk(root)) {
                paths.sorted(java.util.Comparator.reverseOrder()).forEach(path -> path.toFile().delete());
            }
        }
        System.out.println("CacheSupport: " + checks + " checks passed");
    }
}

// Test substitutes only; never packaged into the extension.
final class ModernPlayback { public static volatile String domandCookie; }
final class ModernDebug {
    static String last;
    public static void record(String message) { last = message; }
}
