package org.ungoogled.waze;

import android.content.Context;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/** Observer assets never alter the APK's native ABI selection. */
final class NativeObserverAssets {
    private static final String[] NAMES = {"libshadowhook.so", "libshadowhook_nothing.so", "libwaze_tile_cameras.so"};
    interface Source { InputStream open(String name) throws IOException; }

    static File prepare(Context context) throws IOException {
        return prepare(new File(context.getCodeCacheDir(), "waze-native"),
                name -> context.getAssets().open("waze-native/arm64-v8a/" + name));
    }

    static File prepare(File root, Source source) throws IOException {
        byte[][] libraries = new byte[NAMES.length][];
        MessageDigest digest;
        try { digest = MessageDigest.getInstance("SHA-256"); }
        catch (NoSuchAlgorithmException impossible) { throw new IOException("SHA-256 unavailable", impossible); }
        for (int i = 0; i < NAMES.length; i++) {
            try (InputStream input = source.open(NAMES[i]); ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[16384]; int count;
                while ((count = input.read(buffer)) != -1) {
                    if (output.size() + count > 8 * 1024 * 1024) throw new IOException("Observer asset bound");
                    output.write(buffer, 0, count);
                }
                libraries[i] = output.toByteArray();
            }
            if (libraries[i].length == 0) throw new IOException("Empty observer asset");
            digest.update(NAMES[i].getBytes(java.nio.charset.StandardCharsets.US_ASCII));
            digest.update(hash(libraries[i]));
        }
        StringBuilder identity = new StringBuilder();
        for (byte value : digest.digest()) identity.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
        File directory = new File(root, identity.toString());
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Observer directory unavailable");
        for (int i = 0; i < NAMES.length; i++) {
            File target = new File(directory, NAMES[i]);
            if (target.exists()) {
                if (target.length() != libraries[i].length || !Arrays.equals(Files.readAllBytes(target.toPath()), libraries[i]))
                    throw new IOException("Conflicting observer asset");
                if (!target.setReadOnly()) throw new IOException("Observer asset permissions");
                continue;
            }
            File temporary = File.createTempFile("observer-", ".tmp", directory);
            try {
                try (FileOutputStream output = new FileOutputStream(temporary)) {
                    output.write(libraries[i]); output.getFD().sync();
                }
                if (!temporary.setReadOnly()) throw new IOException("Observer asset permissions");
                Files.move(temporary.toPath(), target.toPath(), java.nio.file.StandardCopyOption.ATOMIC_MOVE);
            } finally { if (temporary.exists() && !temporary.delete()) temporary.deleteOnExit(); }
        }
        return new File(directory, "libwaze_tile_cameras.so");
    }

    private static byte[] hash(byte[] bytes) throws IOException {
            try { return MessageDigest.getInstance("SHA-256").digest(bytes); }
            catch (NoSuchAlgorithmException impossible) { throw new IOException("SHA-256 unavailable", impossible); }
    }
}
