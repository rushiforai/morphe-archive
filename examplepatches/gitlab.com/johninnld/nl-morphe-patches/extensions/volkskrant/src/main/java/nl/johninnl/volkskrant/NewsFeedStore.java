package nl.johninnl.volkskrant;

import android.content.Context;
import android.util.Log;
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
import java.util.Set;

/** Private feed snapshots keep a compact browse reference valid across process recreation. */
final class NewsFeedStore {
    private static final int RECENT_FEEDS = 32;

    private NewsFeedStore() {}

    static String save(Context context, String json, Set<String> pinned) {
        if (json == null) return null;
        byte[] bytes = json.getBytes(StandardCharsets.UTF_8);
        String token = digest(bytes);
        if (context == null) return token;
        File temporary = null;
        try {
            File directory = new File(context.getFilesDir(), "morphe-news-queues");
            if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot create feed storage");
            File target = new File(directory, token + ".json");
            if (!target.isFile()) {
                temporary = File.createTempFile("queue-", ".tmp", directory);
                try (FileOutputStream output = new FileOutputStream(temporary)) {
                    output.write(bytes);
                    output.getFD().sync();
                }
                Files.move(temporary.toPath(), target.toPath(),
                    StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
                temporary = null;
            }
            target.setLastModified(System.currentTimeMillis());
            File[] feeds = directory.listFiles(file -> file.isFile() && file.getName().matches("[a-f0-9]{64}\\.json"));
            if (feeds != null) {
                Arrays.sort(feeds, Comparator.comparingLong(File::lastModified).reversed());
                for (int i = RECENT_FEEDS; i < feeds.length; i++) {
                    String id = feeds[i].getName().substring(0, 64);
                    if (!pinned.contains(id) && !id.equals(token)) Files.deleteIfExists(feeds[i].toPath());
                }
            }
        } catch (IOException | RuntimeException e) {
            // The in-memory full queue remains usable. A later unavailable
            // reference fails with a refresh message, never single playback.
            Log.w("CarNieuws", "Cannot retain the feed snapshot", e);
        } finally {
            if (temporary != null) temporary.delete();
        }
        return token;
    }

    static String load(Context context, String token) {
        if (context == null || token == null || !token.matches("[a-f0-9]{64}")) return null;
        File file = new File(new File(context.getFilesDir(), "morphe-news-queues"), token + ".json");
        try {
            if (!file.isFile() || Files.isSymbolicLink(file.toPath())) return null;
            byte[] bytes = Files.readAllBytes(file.toPath());
            if (!token.equals(digest(bytes))) return null;
            return new String(bytes, StandardCharsets.UTF_8);
        } catch (IOException | RuntimeException e) {
            Log.w("CarNieuws", "Cannot restore the feed snapshot", e);
            return null;
        }
    }

    private static String digest(byte[] bytes) {
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(bytes);
            StringBuilder text = new StringBuilder(hash.length * 2);
            for (byte value : hash) text.append(String.format(java.util.Locale.ROOT, "%02x", value & 0xff));
            return text.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 is unavailable", e);
        }
    }
}
