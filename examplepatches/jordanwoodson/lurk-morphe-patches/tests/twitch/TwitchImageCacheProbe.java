import io.github.jordanwoodson.extension.shared.twitch.TwitchImageCache;
import java.io.*;
import java.lang.reflect.*;
import java.nio.file.Files;
import java.util.*;
import java.util.function.LongSupplier;

/** Lurk's third-party image cache (issue 71) on the JVM: the production class over a temporary directory and a test clock. */
public final class TwitchImageCacheProbe {
    static final long DAY = 24 * 60 * 60_000L;
    static final String SEVENTV = "https://cdn.7tv.app/emote/01ABC/2x.gif";
    static long now = 1_800_000_000_000L;
    static File dir;

    static void check(boolean value, String why) { if (!value) throw new AssertionError(why); }
    static Object call(String name, Object... args) throws Exception {
        for (Method m : TwitchImageCache.class.getDeclaredMethods()) {
            if (!m.getName().equals(name) || m.getParameterCount() != args.length) continue;
            m.setAccessible(true);
            try { return m.invoke(null, args); } catch (InvocationTargetException e) { throw (Exception) e.getCause(); }
        }
        throw new AssertionError("no " + name);
    }
    static void set(String name, Object value) throws Exception {
        Field f = TwitchImageCache.class.getDeclaredField(name); f.setAccessible(true); f.set(null, value);
    }
    static long number(String name) throws Exception { return ((Number) call(name)).longValue(); }
    static byte[] get(String url) throws Exception { return (byte[]) call("get", url); }
    static void put(String url, byte[] data) throws Exception { call("put", url, data); }

    /** A GIF header followed by {@code size - 6} bytes that depend on {@code seed}. */
    static byte[] gif(int size, int seed) {
        byte[] data = new byte[size];
        new Random(seed).nextBytes(data);
        System.arraycopy("GIF89a".getBytes(), 0, data, 0, 6);
        return data;
    }
    static byte[] drain(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[777];
        for (int n; (n = in.read(buffer)) >= 0; ) out.write(buffer, 0, n);
        return out.toByteArray();
    }
    static String[] files() { String[] names = dir.list(); return names == null ? new String[0] : names; }
    static String emote(int i) { return "https://cdn.7tv.app/emote/E" + i + "/2x.gif"; }

    public static void main(String[] args) throws Exception {
        dir = Files.createTempDirectory("lurk-images").toFile();
        set("directory", dir);
        set("clock", (LongSupplier) () -> now);
        switch (args[0]) {
            case "passthrough": {
                // Twitch's own images, other hosts, http and junk never touch the cache.
                for (String url : new String[]{"https://static-cdn.jtvnw.net/emoticons/v2/25/default/dark/2.0",
                        "https://static-cdn.jtvnw.net/badges/v1/abc/2", "http://cdn.7tv.app/emote/01ABC/2x.gif",
                        "https://cdn.7tv.app.evil.example/emote/01ABC/2x.gif", "https://example.org/a.png", "", "data:image/png;base64,AAAA"}) {
                    InputStream body = new ByteArrayInputStream(gif(100, 1));
                    check(TwitchImageCache.store(url, body) == body, "untouched stream for " + url);
                    check(TwitchImageCache.cached(url) == null, "nothing served for " + url);
                    put(url, gif(100, 1));
                }
                check(TwitchImageCache.cached(null) == null && TwitchImageCache.store(null, null) == null, "null model");
                check(files().length == 0, "no file for other hosts");
                for (String url : new String[]{SEVENTV, "https://cdn.betterttv.net/emote/5e/2x.gif", "https://cdn.frankerfacez.com/emote/1/2",
                        "https://cdn.7tv.app/badge/01B/2x.png"}) {
                    check((Boolean) call("wants", url), "kept: " + url);
                }
                // A badge on a host named by a badge list: that exact URL only.
                String badge = "https://fourtf.com/chatterino/badges/supporter.png";
                check(!(Boolean) call("wants", badge), "unknown host");
                call("include", badge);
                check((Boolean) call("wants", badge) && !(Boolean) call("wants", badge + "2"), "listed badge only");
                call("include", "http://fourtf.com/insecure.png");
                check(!(Boolean) call("wants", "http://fourtf.com/insecure.png"), "https only");
                break;
            }
            case "store-hit": {
                byte[] image = gif(50_000, 2);
                check(TwitchImageCache.cached(SEVENTV) == null, "miss first");
                // Glide reads the response through the copy; the model is its URL object (toString is the URL).
                Object model = new Object() { @Override public String toString() { return SEVENTV; } };
                InputStream copy = TwitchImageCache.store(model, new ByteArrayInputStream(image));
                check(Arrays.equals(drain(copy), image), "Glide gets the body unchanged");
                copy.close();
                check(number("size") == 1 && files().length == 1, "stored once the body ended");
                check(!files()[0].contains("7tv") && files()[0].matches("[0-9a-f]{64}\\.\\d+"), "hashed name: " + files()[0]);
                check(Arrays.equals(drain(TwitchImageCache.cached(model)), image), "served from memory");
                check(number("hits") == 1, "counted");
                // A new process: nothing in memory, the file is still there.
                call("forget");
                check(number("memoryBytes") == 0, "memory forgotten");
                check(Arrays.equals(drain(TwitchImageCache.cached(SEVENTV)), image), "served from disk after a restart");
                check(number("diskBytes") == image.length, "disk size");
                // Another size or format of the same emote is another image.
                check(TwitchImageCache.cached("https://cdn.7tv.app/emote/01ABC/2x_static.png") == null, "exact URL");
                // Single-byte reads store too.
                String other = "https://cdn.betterttv.net/emote/5e/2x.gif";
                InputStream slow = TwitchImageCache.store(other, new ByteArrayInputStream(gif(300, 3)));
                while (slow.read() >= 0) { }
                check(Arrays.equals(get(other), gif(300, 3)), "byte reads stored");
                // A file damaged on disk is dropped, not served.
                call("forget");
                for (File file : dir.listFiles()) try (FileOutputStream out = new FileOutputStream(file)) { out.write("<html>oops</html>".getBytes()); }
                check(TwitchImageCache.cached(SEVENTV) == null && get(other) == null && files().length == 0, "damaged files removed");
                break;
            }
            case "incomplete": {
                byte[] image = gif(10_000, 4);
                // Closed before the end (a cancelled load).
                InputStream early = TwitchImageCache.store(SEVENTV, new ByteArrayInputStream(image));
                early.read(new byte[5_000]);
                early.close();
                check(number("size") == 0, "partial body not stored");
                // The connection fails halfway.
                InputStream failing = TwitchImageCache.store(SEVENTV, new InputStream() {
                    int at;
                    @Override public int read() throws IOException { if (at++ > 5_000) throw new IOException("reset"); return image[at - 1] & 0xff; }
                });
                try { drain(failing); check(false, "should fail"); } catch (IOException expected) { }
                check(number("size") == 0, "failed body not stored");
                // Skipped bytes leave a hole.
                InputStream skipped = TwitchImageCache.store(SEVENTV, new ByteArrayInputStream(image));
                skipped.skip(10); drain(skipped);
                check(number("size") == 0, "body with a hole not stored");
                // Not an image (an error page with status 200), empty, and too large.
                drain(TwitchImageCache.store(SEVENTV, new ByteArrayInputStream("<!doctype html><html>blocked</html>".getBytes())));
                drain(TwitchImageCache.store(SEVENTV, new ByteArrayInputStream(new byte[0])));
                int max = ((Number) field("MAX_ENTRY_BYTES")).intValue();
                byte[] huge = gif(max + 1, 5);
                check(Arrays.equals(drain(TwitchImageCache.store(SEVENTV, new ByteArrayInputStream(huge))), huge), "large body still passes through");
                check(number("size") == 0 && files().length == 0, "nothing stored");
                // And the largest allowed one is.
                drain(TwitchImageCache.store(SEVENTV, new ByteArrayInputStream(gif(max, 6))));
                check(number("size") == 1, "largest allowed stored");
                for (byte[] kind : new byte[][]{{(byte) 0x89, 'P', 'N', 'G', 13, 10, 26, 10, 0, 0, 0, 13}, {(byte) 0xff, (byte) 0xd8, (byte) 0xff, (byte) 0xe0, 0, 16, 'J', 'F', 'I', 'F', 0, 1},
                        {'R', 'I', 'F', 'F', 1, 2, 3, 4, 'W', 'E', 'B', 'P'}, {0, 0, 0, 28, 'f', 't', 'y', 'p', 'a', 'v', 'i', 'f'}}) {
                    check((Boolean) call("isImage", kind, kind.length), "image type " + (char) kind[1]);
                }
                break;
            }
            case "disk-bound": {
                set("maxDiskBytes", 1000L);
                for (int i = 0; i < 3; i++) { now += 1000; put(emote(i), gif(300, i)); }
                check(number("size") == 3 && number("diskBytes") == 900, "three fit");
                now += 1000;
                check(get(emote(0)) != null, "use the oldest");
                now += 1000;
                put(emote(3), gif(300, 3));
                check(number("diskBytes") <= 1000 && number("size") == 3 && files().length == 3, "bounded: " + number("diskBytes"));
                check(get(emote(1)) == null, "least recently used evicted");
                check(get(emote(0)) != null && get(emote(2)) != null && get(emote(3)) != null, "the rest kept");
                // Many more than fit: never over the limit, on disk as in the index.
                for (int i = 10; i < 200; i++) {
                    now += 1000; put(emote(i), gif(100 + i, i));
                    check(number("diskBytes") <= 1000, "over the limit at " + i);
                }
                long onDisk = 0;
                for (File file : dir.listFiles()) onDisk += file.length();
                check(onDisk == number("diskBytes") && onDisk <= 1000, "directory matches: " + onDisk);
                // Storing the same URL again replaces it.
                put(emote(199), gif(120, 7));
                check(Arrays.equals(get(emote(199)), gif(120, 7)), "replaced");
                check(Arrays.stream(files()).noneMatch(name -> name.endsWith(".tmp")), "no partial files left");
                break;
            }
            case "restart-order": {
                // Use order survives a restart through the files' times.
                put(emote(0), gif(300, 0));
                now += 60 * 60_000L; put(emote(1), gif(300, 1));
                now += 60 * 60_000L; put(emote(2), gif(300, 2));
                now += 10 * 60 * 60_000L;
                check(get(emote(0)) != null, "use the first again");
                call("forget");
                set("maxDiskBytes", 1000L);
                now += 1000;
                put(emote(3), gif(300, 3));
                check(get(emote(1)) == null && get(emote(0)) != null && get(emote(2)) != null, "oldest use evicted after a restart");
                // Files that aren't ours, and a partial file of a killed process, are cleaned up.
                new File(dir, "notes.txt").createNewFile();
                new File(dir, "ab".repeat(32) + ".tmp").createNewFile();
                call("forget");
                check(number("size") == 3 && files().length == 3, "strays removed: " + Arrays.toString(files()));
                break;
            }
            case "expiry": {
                put(SEVENTV, gif(300, 1));
                now += 13 * DAY;
                check(get(SEVENTV) != null, "used within two weeks");
                now += 14 * DAY - 1000;
                check(get(SEVENTV) != null, "the two weeks count from the last use");
                now += 14 * DAY + 1000;
                check(get(SEVENTV) == null && files().length == 0, "unused for two weeks: deleted");
                // Used every day, it is still downloaded again after a month.
                put(SEVENTV, gif(300, 1));
                for (int day = 0; day < 30; day++) { now += DAY; check(get(SEVENTV) != null, "day " + day); }
                now += 2 * DAY;
                check(get(SEVENTV) == null && files().length == 0, "older than a month: deleted");
                // The same after restarts, and maintenance alone deletes what expired (switches off, nothing asks).
                put(emote(1), gif(300, 1));
                now += 5 * DAY;
                put(emote(2), gif(300, 2));
                call("forget");
                now += 10 * DAY;
                call("maintain");
                check(number("size") == 1 && files().length == 1 && get(emote(2)) != null, "maintenance deletes idle files");
                call("forget");
                now += 15 * DAY;
                check(number("size") == 0 && files().length == 0, "start-up deletes idle files");
                break;
            }
            case "memory-bound": {
                set("maxMemoryBytes", 1000L);
                for (int i = 0; i < 20; i++) {
                    put(emote(i), gif(300, i));
                    check(number("memoryBytes") <= 1000, "memory over its limit at " + i);
                }
                check(number("memoryBytes") == 900 && number("size") == 20, "three in memory, all on disk");
                for (int i = 0; i < 20; i++) check(Arrays.equals(get(emote(i)), gif(300, i)), "served " + i);
                // Large images stay on disk only.
                int big = ((Number) field("MAX_MEMORY_ENTRY_BYTES")).intValue() + 1;
                set("maxMemoryBytes", 100L * 1024 * 1024);
                long before = number("memoryBytes");
                put(SEVENTV, gif(big, 9));
                check(number("memoryBytes") == before, "large image not held in memory");
                check(Arrays.equals(get(SEVENTV), gif(big, 9)), "but served from disk");
                break;
            }
            default:
                throw new AssertionError("unknown scenario " + args[0]);
        }
        for (File file : dir.listFiles()) file.delete();
        dir.delete();
    }

    static Object field(String name) throws Exception {
        Field f = TwitchImageCache.class.getDeclaredField(name); f.setAccessible(true); return f.get(null);
    }
}
