package app.richyss.extension;

import android.content.Context;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * Persists the last presence handed over by Richyss inside Discord's private files
 * directory. Nothing is sent anywhere: the payload stays on the device.
 */
public final class BridgeStore {
    private static final String DIRECTORY = "richyss-bridge";
    private static final String PRESENCE_FILE = "presence.json";
    private static final String META_FILE = "meta.json";
    private static final long MAX_AGE_MS = 24L * 60L * 60L * 1000L;

    private final File directory;

    public BridgeStore(File filesDirectory) {
        this.directory = new File(filesDirectory, DIRECTORY);
    }

    public static BridgeStore forContext(Context context) {
        return new BridgeStore(context.getFilesDir());
    }

    private File presenceFile() {
        return new File(directory, PRESENCE_FILE);
    }

    private File metaFile() {
        return new File(directory, META_FILE);
    }

    private void ensureDirectory() {
        if (!directory.exists() && !directory.mkdirs()) {
            throw new IllegalStateException("Cannot create " + directory);
        }
    }

    /** Stores a validated payload, replacing the previous one. */
    public synchronized void writePresence(JSONObject payload) throws IOException {
        ensureDirectory();
        writeAtomically(presenceFile(), payload.toString());
    }

    /**
     * Reads the stored payload, or null when none exists or it is older than
     * 24 hours, in which case the stale file is removed.
     */
    public synchronized JSONObject readPresence() {
        String raw = read(presenceFile());
        if (raw == null) {
            return null;
        }
        try {
            JSONObject object = new JSONObject(raw);
            long updatedAt = object.optLong("updatedAt", 0L);
            if (updatedAt <= 0 || System.currentTimeMillis() - updatedAt > MAX_AGE_MS) {
                deletePresence();
                return null;
            }
            return object;
        } catch (Exception e) {
            deletePresence();
            return null;
        }
    }

    public synchronized void deletePresence() {
        File file = presenceFile();
        if (file.exists() && !file.delete()) {
            // The file stays readable but is already expired, so the next read drops it.
            return;
        }
    }

    /** Number of milliseconds since the last payload was written, or 0. */
    public synchronized long updatedAt() {
        JSONObject presence = readPresence();
        return presence == null ? 0L : presence.optLong("updatedAt", 0L);
    }

    /** Records metadata about the patched client (version name, bridge version). */
    public synchronized void writeMeta(JSONObject meta) throws IOException {
        ensureDirectory();
        writeAtomically(metaFile(), meta.toString());
    }

    public synchronized JSONObject readMeta() {
        String raw = read(metaFile());
        if (raw == null) {
            return new JSONObject();
        }
        try {
            return new JSONObject(raw);
        } catch (Exception e) {
            return new JSONObject();
        }
    }

    /** Drops a presence document that is older than the supported age. */
    public synchronized void purgeExpired() {
        JSONObject presence = readPresence();
        if (presence == null) {
            deletePresence();
        }
    }

    private static String read(File file) {
        if (!file.exists()) {
            return null;
        }
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[(int) file.length()];
            int read = in.read(buffer);
            if (read <= 0) {
                return null;
            }
            return new String(buffer, 0, read, StandardCharsets.UTF_8);
        } catch (IOException e) {
            return null;
        }
    }

    private void writeAtomically(File target, String content) throws IOException {
        File temp = new File(target.getParentFile(), target.getName() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(temp)) {
            out.write(content.getBytes(StandardCharsets.UTF_8));
            out.flush();
            out.getFD().sync();
        }
        if (!temp.renameTo(target)) {
            // Fall back to a direct write: the bridge is a best effort transport.
            try (FileOutputStream out = new FileOutputStream(target)) {
                out.write(content.getBytes(StandardCharsets.UTF_8));
            } finally {
                //noinspection ResultOfMethodCallIgnored
                temp.delete();
            }
        }
    }
}
