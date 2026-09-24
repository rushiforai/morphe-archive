package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Cache for raw YouTube source captions. Successful source bytes are queued for durable storage
 * before the AI call, without making the first visible translation wait for a filesystem sync.
 */
final class SourceCaptionCache {
    private static final String VERSION = "source-caption-v2-word-provenance";
    private static final long MAX_BYTES = 80L * 1024L * 1024L;
    private static final int MAX_FILES = 180;
    private static final long MAX_AGE_MS = 24L * 60L * 60L * 1000L;
    private static final ExecutorService WRITES = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "DeepSeekCaptionSourceCache");
        thread.setDaemon(true);
        return thread;
    });

    private SourceCaptionCache() {}

    static String key(String sourceUrl) throws Exception {
        String identity = stableIdentity(sourceUrl);
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.update(VERSION.getBytes(StandardCharsets.UTF_8));
        digest.update((byte) 0);
        digest.update(identity.getBytes(StandardCharsets.UTF_8));
        return hex(digest.digest());
    }

    // Reference provenance must not alias a coarse app response with a differently signed web track.
    // Only the digest is persisted; the URL/signature is never written to diagnostics or cache metadata.
    static String referenceKey(String url) throws Exception {
        MessageDigest digest=MessageDigest.getInstance("SHA-256");
        digest.update("asr-reference-v1\0".getBytes(StandardCharsets.UTF_8));
        digest.update(url.getBytes(StandardCharsets.UTF_8));return "ref-"+hex(digest.digest());
    }

    static Entry get(Context context, String key) {
        File bodyFile = new File(directory(context), key + ".source");
        File typeFile = new File(directory(context), key + ".type");
        if (!bodyFile.isFile()) return null;
        try {
            long age = Math.max(0L, System.currentTimeMillis() - bodyFile.lastModified());
            if (age > MAX_AGE_MS || bodyFile.length() <= 0 || bodyFile.length() > 16L * 1024L * 1024L) {
                //noinspection ResultOfMethodCallIgnored
                bodyFile.delete();
                //noinspection ResultOfMethodCallIgnored
                typeFile.delete();
                return null;
            }
            byte[] body = read(bodyFile);
            String type = typeFile.isFile()
                    ? new String(read(typeFile), StandardCharsets.UTF_8).trim()
                    : "application/octet-stream";
            if (type.isEmpty()) type = "application/octet-stream";
            //noinspection ResultOfMethodCallIgnored
            bodyFile.setLastModified(System.currentTimeMillis());
            //noinspection ResultOfMethodCallIgnored
            typeFile.setLastModified(System.currentTimeMillis());
            return new Entry(body, type, age);
        } catch (Throwable ignored) {
            return null;
        }
    }

    static void put(Context context, String key, byte[] body, String contentType) {
        if (body == null || body.length == 0 || body.length > 16 * 1024 * 1024) return;
        Context application = context.getApplicationContext();
        Context cacheContext = application == null ? context : application;
        WRITES.execute(() -> putNow(cacheContext, key, body, contentType));
    }

    private static void putNow(Context context, String key, byte[] body, String contentType) {
        File dir = directory(context);
        File bodyFile = new File(dir, key + ".source");
        File typeFile = new File(dir, key + ".type");
        File bodyTmp = new File(dir, key + ".source.tmp-" + Thread.currentThread().getId());
        File typeTmp = new File(dir, key + ".type.tmp-" + Thread.currentThread().getId());
        try {
            write(bodyTmp, body);
            write(typeTmp, (contentType == null ? "application/octet-stream" : contentType)
                    .getBytes(StandardCharsets.UTF_8));
            replace(bodyTmp, bodyFile);
            replace(typeTmp, typeFile);
            trim(dir);
        } catch (Throwable ignored) {
            //noinspection ResultOfMethodCallIgnored
            bodyTmp.delete();
            //noinspection ResultOfMethodCallIgnored
            typeTmp.delete();
        }
    }

    static void remove(Context context,String key) {
        new File(directory(context),key+".source").delete();
        new File(directory(context),key+".type").delete();
    }

    static void clear(Context context) {
        File[] files = directory(context).listFiles();
        if (files == null) return;
        for (File file : files) {
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    private static String stableIdentity(String sourceUrl) {
        try {
            Uri uri = Uri.parse(sourceUrl);
            String video = first(uri, "v", "video_id");
            String trackId = first(uri, "id", "track_id");
            if (!video.isEmpty() || !trackId.isEmpty()) {
                return "v=" + video +
                        "|id=" + trackId +
                        "|lang=" + safe(uri.getQueryParameter("lang")) +
                        "|kind=" + safe(uri.getQueryParameter("kind")) +
                        "|name=" + safe(uri.getQueryParameter("name")) +
                        "|fmt=" + safe(uri.getQueryParameter("fmt")) +
                        "|variant="+safe(uri.getQueryParameter("variant"))+"|exp="+safe(uri.getQueryParameter("exp"));
            }
        } catch (Throwable ignored) {
        }
        return sourceUrl == null ? "" : sourceUrl;
    }

    private static String first(Uri uri, String first, String second) {
        String value = safe(uri.getQueryParameter(first));
        return value.isEmpty() ? safe(uri.getQueryParameter(second)) : value;
    }

    private static String safe(String value) {
        return value == null ? "" : value;
    }

    private static byte[] read(File file) throws Exception {
        byte[] data = new byte[(int) file.length()];
        try (FileInputStream input = new FileInputStream(file)) {
            int offset = 0;
            while (offset < data.length) {
                int count = input.read(data, offset, data.length - offset);
                if (count < 0) break;
                offset += count;
            }
            if (offset != data.length) throw new IllegalStateException("short cache read");
        }
        return data;
    }

    private static void write(File file, byte[] data) throws Exception {
        try (FileOutputStream output = new FileOutputStream(file)) {
            output.write(data);
            output.flush();
            try { output.getFD().sync(); } catch (Throwable ignored) {}
        }
    }

    private static void replace(File temporary, File target) {
        if (target.exists() && !target.delete()) {
            //noinspection ResultOfMethodCallIgnored
            temporary.delete();
            return;
        }
        if (!temporary.renameTo(target)) {
            //noinspection ResultOfMethodCallIgnored
            temporary.delete();
        }
    }

    private static File directory(Context context) {
        File dir = new File(context.getCacheDir(), "deepseek-source-captions");
        if (!dir.isDirectory()) {
            //noinspection ResultOfMethodCallIgnored
            dir.mkdirs();
        }
        return dir;
    }

    private static void trim(File dir) {
        File[] all = dir.listFiles((ignored, name) -> name.endsWith(".source"));
        if (all == null || all.length == 0) return;
        List<File> bodies = new ArrayList<>(Arrays.asList(all));
        bodies.sort(Comparator.comparingLong(File::lastModified));
        long total = 0;
        for (File body : bodies) total += Math.max(0L, body.length());
        int count = bodies.size();
        for (File body : bodies) {
            if (total <= MAX_BYTES && count <= MAX_FILES) break;
            long length = Math.max(0L, body.length());
            String base = body.getName().substring(0, body.getName().length() - ".source".length());
            if (body.delete()) {
                //noinspection ResultOfMethodCallIgnored
                new File(dir, base + ".type").delete();
                total -= length;
                count--;
            }
        }
    }

    private static String hex(byte[] bytes) {
        StringBuilder out = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) out.append(String.format(java.util.Locale.ROOT, "%02x", b & 0xff));
        return out.toString();
    }

    static final class Entry {
        final byte[] body;
        final String contentType;
        final long ageMs;
        Entry(byte[] body, String contentType, long ageMs) {
            this.body = body;
            this.contentType = contentType;
            this.ageMs = ageMs;
        }
    }
}
