package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Cache of the raw caption tracks of YouTube. A track is queued for writing as soon as it is
 * fetched, so the first translation does not wait for the file system.
 */
final class SourceCaptionCache {
    private static final String VERSION = "source-caption-v3-layout-identity";
    private static final String OCTET_STREAM = "application/octet-stream";
    private static final long MAX_ENTRY_BYTES = 16L * 1024L * 1024L;
    private static final long MAX_BYTES = 80L * 1024L * 1024L;
    private static final int MAX_FILES = 180;
    private static final long MAX_AGE_MS = 24L * 60L * 60L * 1000L;

    private static final Object COMMIT_LOCK = new Object();

    /** A write queued before a clear is dropped: it belongs to an older epoch. */
    private static final AtomicLong EPOCH = new AtomicLong();

    private static final ExecutorService WRITES =
            Executors.newSingleThreadExecutor(
                    runnable -> {
                        Thread thread = new Thread(runnable, "DeepSeekCaptionSourceCache");
                        thread.setDaemon(true);
                        return thread;
                    });

    private SourceCaptionCache() {}

    static final class Entry {
        final byte[] body;
        final String contentType;

        Entry(byte[] body, String contentType) {
            this.body = body;
            this.contentType = contentType;
        }
    }

    static String referenceKey(String url) {
        return "reference-" + key(url);
    }

    static String key(String sourceUrl) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.update(VERSION.getBytes(StandardCharsets.UTF_8));
            digest.update((byte) 0);
            digest.update(identity(sourceUrl).getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (byte b : digest.digest()) hex.append(String.format(Locale.ROOT, "%02x", b & 0xff));
            return hex.toString();
        } catch (NoSuchAlgorithmException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    /**
     * What makes two urls the same track: video, track, language, kind, name, format and variant;
     * never the signature or expiry of the url.
     */
    private static String identity(String sourceUrl) {
        try {
            Uri uri = Uri.parse(sourceUrl);
            String video = first(uri, "v", "video_id"), track = first(uri, "id", "track_id");
            if (!video.isEmpty() || !track.isEmpty())
                return "v="
                        + video
                        + "|id="
                        + track
                        + "|lang="
                        + param(uri, "lang")
                        + "|kind="
                        + param(uri, "kind")
                        + "|name="
                        + param(uri, "name")
                        + "|fmt="
                        + uri.getQueryParameters("fmt")
                        + "|xosf="
                        + uri.getQueryParameters("xosf")
                        + "|variant="
                        + param(uri, "variant")
                        + "|exp="
                        + param(uri, "exp");
        } catch (RuntimeException unparsable) {
            // The url itself is the identity.
        }
        return sourceUrl == null ? "" : sourceUrl;
    }

    private static String param(Uri uri, String name) {
        String value = uri.getQueryParameter(name);
        return value == null ? "" : value;
    }

    private static String first(Uri uri, String name, String alternative) {
        String value = param(uri, name);
        return value.isEmpty() ? param(uri, alternative) : value;
    }

    private static File directory(Context context) {
        File dir = new File(context.getCacheDir(), "deepseek-source-captions");
        dir.mkdirs();
        return dir;
    }

    private static File bodyFile(File dir, String key) {
        return new File(dir, key + ".source");
    }

    private static File typeFile(File dir, String key) {
        return new File(dir, key + ".type");
    }

    /** The cached track, or null. A hit keeps the track alive; an old one is deleted. */
    static Entry get(Context context, String key) {
        synchronized (COMMIT_LOCK) {
            return getLocked(context, key);
        }
    }

    private static Entry getLocked(Context context, String key) {
        File dir = directory(context);
        File body = bodyFile(dir, key), type = typeFile(dir, key);
        if (!body.isFile()) return null;
        try {
            long now = System.currentTimeMillis();
            if (now - body.lastModified() > MAX_AGE_MS
                    || body.length() <= 0
                    || body.length() > MAX_ENTRY_BYTES) {
                remove(context, key);
                return null;
            }
            byte[] bytes = Files.readAllBytes(body.toPath());
            String contentType =
                    type.isFile()
                            ? new String(Files.readAllBytes(type.toPath()), StandardCharsets.UTF_8)
                                    .trim()
                            : "";
            body.setLastModified(now);
            type.setLastModified(now);
            return new Entry(bytes, contentType.isEmpty() ? OCTET_STREAM : contentType);
        } catch (IOException | RuntimeException unreadable) {
            return null;
        }
    }

    static void put(Context context, String key, byte[] body, String contentType) {
        if (body == null || body.length == 0 || body.length > MAX_ENTRY_BYTES) return;
        Context app = context.getApplicationContext();
        Context target = app == null ? context : app;
        long epoch = EPOCH.get();
        WRITES.execute(
                () -> {
                    if (epoch == EPOCH.get()) write(target, key, body, contentType, epoch);
                });
    }

    private static void write(
            Context context, String key, byte[] body, String contentType, long epoch) {
        File dir = directory(context);
        String suffix = ".tmp-" + Thread.currentThread().getId();
        File bodyTemp = new File(bodyFile(dir, key) + suffix);
        File typeTemp = new File(typeFile(dir, key) + suffix);
        try {
            save(bodyTemp, body);
            save(
                    typeTemp,
                    (contentType == null ? OCTET_STREAM : contentType)
                            .getBytes(StandardCharsets.UTF_8));
            synchronized (COMMIT_LOCK) {
                if (epoch == EPOCH.get() && !weakerThanCached(context, key, body, contentType)) {
                    publish(bodyTemp, typeTemp, bodyFile(dir, key), typeFile(dir, key));
                    trim(dir);
                }
            }
        } catch (IOException | RuntimeException failed) {
            // The cache is an optimisation.
        } finally {
            bodyTemp.delete();
            typeTemp.delete();
        }
    }

    /** Is the cached copy of the same text, with more of its timing known than the new one? */
    private static boolean weakerThanCached(
            Context context, String key, byte[] body, String contentType) {
        Entry cached = get(context, key);
        if (cached == null) return false;
        CaptionDocument.Parsed old = parse(cached.body, cached.contentType);
        CaptionDocument.Parsed fresh = parse(body, contentType);
        return old != null
                && fresh != null
                && sameRaw(old, fresh)
                && nativeTiming(old) > nativeTiming(fresh);
    }

    private static CaptionDocument.Parsed parse(byte[] body, String contentType) {
        try {
            return CaptionDocument.parse(body, contentType);
        } catch (Exception unreadable) {
            return null;
        }
    }

    /** How many parts of the track carry a timing of the platform itself. */
    private static int nativeTiming(CaptionDocument.Parsed parsed) {
        int count = 0;
        for (CaptionDocument.RawFragment fragment : parsed.rawFragments())
            if (fragment.nativeOffset) count++;
        if (parsed.vtt() != null)
            for (WebVttSourceReader.Range range : parsed.vtt().ranges)
                if (range.nativeStart) count++;
        return count;
    }

    private static boolean sameRaw(CaptionDocument.Parsed a, CaptionDocument.Parsed b) {
        String left = raw(a);
        return !left.isEmpty() && left.equals(raw(b));
    }

    private static String raw(CaptionDocument.Parsed parsed) {
        StringBuilder text = new StringBuilder();
        for (CaptionDocument.RawFragment fragment : parsed.rawFragments())
            text.append(fragment.raw);
        return text.toString();
    }

    static void remove(Context context, String key) {
        synchronized (COMMIT_LOCK) {
            File dir = directory(context);
            bodyFile(dir, key).delete();
            typeFile(dir, key).delete();
        }
    }

    static void clear(Context context) {
        synchronized (COMMIT_LOCK) {
            EPOCH.incrementAndGet();
            File[] files = directory(context).listFiles();
            if (files != null) for (File file : files) file.delete();
        }
    }

    /** Writes the bytes and forces them to disk. */
    private static void save(File file, byte[] data) throws IOException {
        try (FileOutputStream output = new FileOutputStream(file)) {
            output.write(data);
            output.flush();
            try {
                output.getFD().sync();
            } catch (IOException unsynced) {
                // Written, though not forced.
            }
        }
    }

    /** Readers share COMMIT_LOCK: a process-local hit sees the complete pair. Body publishes last. */
    private static void publish(File bodyTemp, File typeTemp, File body, File type)
            throws IOException {
        byte[] previousType = type.isFile() ? Files.readAllBytes(type.toPath()) : null;
        replace(typeTemp, type);
        try {
            replace(bodyTemp, body);
        } catch (IOException | RuntimeException failed) {
            try {
                if (previousType == null) {
                    if (type.exists() && !type.delete()) throw new IOException("type_restore");
                } else {
                    save(typeTemp, previousType);
                    replace(typeTemp, type);
                }
            } catch (IOException | RuntimeException restoreFailed) {
                // A second IO failure cannot leave the old body paired with new metadata.
                body.delete();
                type.delete();
                failed.addSuppressed(restoreFailed);
            }
            throw failed;
        }
    }

    private static void replace(File temporary, File target) throws IOException {
        Files.move(
                temporary.toPath(),
                target.toPath(),
                StandardCopyOption.REPLACE_EXISTING,
                StandardCopyOption.ATOMIC_MOVE);
    }

    /** Deletes the least recently used tracks while there are too many or too many bytes. */
    private static void trim(File dir) {
        File[] bodies = dir.listFiles((ignored, name) -> name.endsWith(".source"));
        if (bodies == null) return;
        Arrays.sort(bodies, Comparator.comparingLong(File::lastModified));
        long total = 0;
        for (File body : bodies) total += body.length();
        int count = bodies.length;
        for (File body : bodies) {
            if (total <= MAX_BYTES && count <= MAX_FILES) break;
            long length = body.length();
            String name = body.getName();
            if (body.delete()) {
                new File(dir, name.substring(0, name.length() - ".source".length()) + ".type")
                        .delete();
                total -= length;
                count--;
            }
        }
    }
}
