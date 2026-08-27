package app.morphe.extension.discord.bunny.recovery;

import android.content.Context;
import android.util.Log;

import org.json.JSONObject;
import org.json.JSONArray;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Set;

/** Atomic persistence for the tiny pre-plugin recovery transaction. */
final class RecoveryStore {
    private static final String TAG = "BunnyRecovery";
    private final File directory;
    private final File stateFile;
    private final File eventFile;
    private static final long MAX_EVENT_LOG_BYTES = 256L * 1024L;

    RecoveryStore(Context context) {
        this(new File(context.getFilesDir(), "pyoncord"));
    }

    RecoveryStore(File bunnyRoot) {
        directory = new File(bunnyRoot, "recovery");
        stateFile = new File(directory, "state.json");
        eventFile = new File(directory, "events.jsonl");
    }

    synchronized RecoveryState read() {
        if (!stateFile.isFile()) return new RecoveryState();
        try {
            byte[] data = new byte[(int) Math.min(stateFile.length(), 256 * 1024L)];
            try (FileInputStream input = new FileInputStream(stateFile)) {
                int offset = 0;
                while (offset < data.length) {
                    int count = input.read(data, offset, data.length - offset);
                    if (count < 0) break;
                    offset += count;
                }
                if (offset != data.length || input.read() != -1) throw new IOException("Recovery state is too large");
            }
            return RecoveryState.fromJson(new JSONObject(new String(data, StandardCharsets.UTF_8)));
        } catch (Throwable error) {
            Log.e(TAG, "Could not read recovery state; using safe defaults", error);
            RecoveryState state = new RecoveryState();
            state.recoveryLatch = true;
            return state;
        }
    }

    synchronized void write(RecoveryState state) {
        try {
            if (!directory.isDirectory() && !directory.mkdirs()) {
                throw new IOException("Could not create recovery directory");
            }
            byte[] data = state.toJson().toString(2).getBytes(StandardCharsets.UTF_8);
            File temporary = new File(directory, "state.json.tmp");
            try (FileOutputStream output = new FileOutputStream(temporary)) {
                output.write(data);
                output.getFD().sync();
            }
            atomicReplace(temporary, stateFile);
        } catch (Throwable error) {
            Log.e(TAG, "Could not persist recovery state", error);
        }
    }

    File file(String name) {
        return new File(directory, name);
    }

    synchronized void appendEvent(String type, JSONObject details) {
        try {
            if (!directory.isDirectory() && !directory.mkdirs()) {
                throw new IOException("Could not create recovery directory");
            }
            if (eventFile.isFile() && eventFile.length() >= MAX_EVENT_LOG_BYTES) {
                File previous = new File(directory, "events.previous.jsonl");
                if (previous.exists() && !previous.delete()) throw new IOException("Could not rotate recovery events");
                if (!eventFile.renameTo(previous)) throw new IOException("Could not rotate recovery events");
            }
            JSONObject event = new JSONObject()
                    .put("timestamp", System.currentTimeMillis())
                    .put("type", type == null ? "unknown" : type)
                    .put("details", details == null ? new JSONObject() : details);
            try (FileOutputStream output = new FileOutputStream(eventFile, true)) {
                output.write(event.toString().getBytes(StandardCharsets.UTF_8));
                output.write('\n');
                output.getFD().sync();
            }
        } catch (Throwable error) {
            Log.e(TAG, "Could not append recovery event", error);
        }
    }

    synchronized JSONObject diagnostics(RecoveryState state, String kind, Set<String> selectedIds) throws Exception {
        JSONObject root = new JSONObject();
        root.put("format", "bunny-recovery-log");
        root.put("schemaVersion", 1);
        root.put("exportedAt", System.currentTimeMillis());
        root.put("kind", kind);
        JSONArray records = new JSONArray();
        if ("failed-starts".equals(kind)) {
            for (RecoveryState.FailedStartRecord failure : state.failedStarts) {
                if (selectedIds.contains(failure.id)) records.put(failure.toJson());
            }
        } else {
            for (RecoveryState.CrashRecord crash : state.recentCrashes) {
                if (selectedIds.contains(crash.id)) records.put(crash.toJson());
            }
        }
        root.put("records", records);
        root.put("events", new JSONArray());
        return root;
    }

    private static void appendEvents(File file, JSONArray output, String kind) throws Exception {
        if (!file.isFile()) return;
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                new FileInputStream(file), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.length() > 32 * 1024) continue;
                try {
                    JSONObject event = new JSONObject(line);
                    String type = event.optString("type", "");
                    boolean include = "failed-starts".equals(kind)
                            ? type.startsWith("startup-") || type.equals("session-start")
                            : type.equals("crash");
                    if (include) output.put(event);
                } catch (Throwable ignored) {}
            }
        }
    }

    static void atomicReplace(File source, File destination) throws IOException {
        File parent = destination.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
            throw new IOException("Could not create " + parent);
        }
        if (destination.exists() && !destination.delete()) {
            throw new IOException("Could not replace " + destination);
        }
        if (!source.renameTo(destination)) {
            throw new IOException("Could not move " + source + " to " + destination);
        }
    }
}
