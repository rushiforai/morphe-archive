package app.yydarlinker.deepseekcaptions;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/** Small disk cache keyed by source-caption bytes and translation configuration. */
final class DiskCaptionCache {
    // v10 invalidates the dev6 source-atom cache. dev6 could persist good pages around failed
    // windows, leaving small READY islands that made the remaining hole impossible to replan with
    // enough context. dev7 rebuilds those seams using prefix salvage instead of inheriting them.
    private static final String VERSION = "deepseek-caption-v10-source-atom-salvage";
    private static final long MAX_BYTES = 150L * 1024L * 1024L;
    private static final int MAX_FILES = 300;

    private DiskCaptionCache() {}

    static String key(
            byte[] source,
            DeepSeekConfig.Snapshot config,
            String targetLanguage
    ) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.update(VERSION.getBytes(StandardCharsets.UTF_8));
        digest.update((byte) 0);
        digest.update(config.fingerprint().getBytes(StandardCharsets.UTF_8));
        digest.update((byte) 0);
        digest.update((targetLanguage == null ? "" : targetLanguage)
                .getBytes(StandardCharsets.UTF_8));
        digest.update((byte) 0);
        digest.update(source);
        return hex(digest.digest());
    }

    static byte[] get(Context context, String key) {
        File file = new File(directory(context), key + ".caption");
        if (!file.isFile()) return null;
        try {
            if (file.length() <= 0 || file.length() > 16L * 1024L * 1024L) {
                //noinspection ResultOfMethodCallIgnored
                file.delete();
                return null;
            }
            byte[] data = new byte[(int) file.length()];
            try (FileInputStream input = new FileInputStream(file)) {
                int offset = 0;
                while (offset < data.length) {
                    int read = input.read(data, offset, data.length - offset);
                    if (read < 0) break;
                    offset += read;
                }
                if (offset != data.length) return null;
            }
            //noinspection ResultOfMethodCallIgnored
            file.setLastModified(System.currentTimeMillis());
            return data;
        } catch (Throwable ignored) {
            return null;
        }
    }

    static void put(Context context, String key, byte[] data) {
        if (data == null || data.length == 0 || data.length > 16 * 1024 * 1024) return;
        File dir = directory(context);
        File target = new File(dir, key + ".caption");
        File temporary = new File(dir, key + ".tmp-" + Thread.currentThread().getId());
        try {
            try (FileOutputStream output = new FileOutputStream(temporary)) {
                output.write(data);
                output.flush();
                try { output.getFD().sync(); } catch (Throwable ignored) {}
            }
            if (target.exists() && !target.delete()) {
                // A racing writer already won. Reuse it rather than failing the translation path.
                //noinspection ResultOfMethodCallIgnored
                temporary.delete();
            } else if (!temporary.renameTo(target)) {
                //noinspection ResultOfMethodCallIgnored
                temporary.delete();
            }
            trim(dir);
        } catch (Throwable ignored) {
            //noinspection ResultOfMethodCallIgnored
            temporary.delete();
        }
    }

    static void clear(Context context) {
        File[] files = directory(context).listFiles();
        if (files == null) return;
        for (File file : files) {
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    private static File directory(Context context) {
        File dir = new File(context.getCacheDir(), "deepseek-captions");
        if (!dir.isDirectory()) {
            //noinspection ResultOfMethodCallIgnored
            dir.mkdirs();
        }
        return dir;
    }

    private static void trim(File dir) {
        File[] all = dir.listFiles((ignored, name) -> name.endsWith(".caption"));
        if (all == null || all.length == 0) return;
        List<File> files = new ArrayList<>(Arrays.asList(all));
        files.sort(Comparator.comparingLong(File::lastModified));

        long total = 0;
        for (File file : files) total += Math.max(0, file.length());
        int count = files.size();
        for (File file : files) {
            if (total <= MAX_BYTES && count <= MAX_FILES) break;
            long length = Math.max(0, file.length());
            if (file.delete()) {
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
}
