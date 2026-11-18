package app.afterglow.extension.diagnostics;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;

/** All disk calls run on DebugLog's serial worker. Readers receive copies of the ring. */
public final class LogStore {
    public static final int MAX_ENTRIES = 200;
    public static final long ROLL_BYTES = 1024 * 1024;
    private final File file, backup;
    private final ArrayDeque<String> ring = new ArrayDeque<>();

    public LogStore(File directory) {
        file = new File(directory, "ytag-debug.log");
        backup = new File(directory, "ytag-debug.log.1");
    }

    public synchronized String append(String timestamp, String category, String message) throws IOException {
        String line = timestamp + " [" + LogPolicy.categoryName(category) + "] " + LogPolicy.redact(message);
        ring.addLast(line);
        while (ring.size() > MAX_ENTRIES) ring.removeFirst();
        File directory = file.getParentFile();
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot create log directory");
        if (file.length() >= ROLL_BYTES) {
            Files.deleteIfExists(backup.toPath());
            Files.move(file.toPath(), backup.toPath());
        }
        try (FileOutputStream output = new FileOutputStream(file, true)) {
            output.write((line + "\n").getBytes(StandardCharsets.UTF_8));
        }
        return line;
    }

    public synchronized List<String> recent() { return new ArrayList<>(ring); }

    public synchronized String body() throws IOException {
        if (file.isFile() && file.length() > 0) return new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
        return String.join("\n", ring);
    }

    public synchronized void clear() throws IOException {
        ring.clear();
        IOException failure = null;
        for (File path : new File[] { file, backup }) {
            try { Files.deleteIfExists(path.toPath()); }
            catch (IOException error) { failure = error; }
        }
        if (failure != null) throw failure;
    }
}
