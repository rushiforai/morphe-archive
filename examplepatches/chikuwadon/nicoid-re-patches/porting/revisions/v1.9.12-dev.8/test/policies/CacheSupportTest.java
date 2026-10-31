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
    private static String last() throws Exception {
        java.lang.reflect.Field field=ModernDebug.class.getDeclaredField("entries");field.setAccessible(true);
        String log=field.get(null).toString().trim();String line=log.substring(log.lastIndexOf('\n')+1);return line.substring(line.indexOf("  ")+2);
    }
    public static void main(String[] args) throws Exception {
        String media = "https://delivery.domand.nicovideo.jp/secret/master.m3u8?token=private";
        equal("domand_bid=new", CacheSupport.mergeCookie(media,
            "user_session=login; domand_bid=old", "domand_bid=new; Path=/; Secure"));
        equal("domand_bid=new", CacheSupport.mergeCookie(media, null, "domand_bid=new"));
        equal("", CacheSupport.mergeCookie(media, "user_session=login", null));
        equal("", CacheSupport.mergeCookie("https://other.example/test.m3u8", "original", "domand_bid=new"));
        equal("", CacheSupport.mergeCookie("https://delivery.domand.nicovideo.jp.evil.example/a", "original", "domand_bid=new"));
        equal("", CacheSupport.mergeCookie("invalid", "original", "domand_bid=new"));
        ModernPlayback.domandCookie = "domand_bid=first";
        String snapshot = CacheSupport.cookieFor(media, "user_session=login");
        ModernPlayback.domandCookie = "domand_bid=second";
        equal("domand_bid=first", snapshot);
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
        equal("Cache HTTP 403 playlist", last());
        CacheSupport.failed(new java.io.IOException(media));
        equal("Cache failed: IOException", last());
        Path root = Files.createTempDirectory("nicoid-migration-test");
        try {
            File legacy = root.resolve("nicoid/history.json").toFile();
            legacy.getParentFile().mkdirs(); legacy.createNewFile();
            equal(true, CacheSupport.needsMigration(legacy));
            // The target is Android: model its '/' paths on Windows test hosts.
            File current = new File(root.resolve("Android/data/com.sauzask.nicoid.hls/files/nicoid/history.json").toString()) {
                @Override public String getAbsolutePath() { return super.getAbsolutePath().replace('\\', '/'); }
            };
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
