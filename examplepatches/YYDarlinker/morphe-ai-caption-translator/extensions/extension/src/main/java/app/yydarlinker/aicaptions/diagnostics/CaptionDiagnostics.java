package app.yydarlinker.aicaptions.diagnostics;

import app.yydarlinker.aicaptions.CaptionCredentialRef;
import app.yydarlinker.aicaptions.settings.SecureApiKey;

import android.content.Context;

import org.json.JSONObject;

import java.util.ArrayDeque;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;
import java.util.regex.Pattern;

/** Recent, process-local diagnostics. Only redacted lines enter the export buffer. */
public final class CaptionDiagnostics {
    private static final int CAPACITY = 128;
    private static final int MAX_DETAIL = 768;
    private static final Object LOCK = new Object();
    private static final ArrayDeque<Entry> pending = new ArrayDeque<>();
    private static final ArrayDeque<String> lines = new ArrayDeque<>();
    private static final ExecutorService worker = Executors.newSingleThreadExecutor(
            task -> new Thread(task, "caption-diagnostics"));
    private static final Pattern URL = Pattern.compile("(?i)https?://[^\\s\"<>]+");
    private static final Pattern SECRET = Pattern.compile(
            "(?i)(?:bearer\\s+|sk-)[^\\s;\"<>]{4,}"
                    + "|(?:authorization|cookie|api[_-]?key|token|signature)\\s*[:=]\\s*[^\\r\\n;]+");
    private static boolean draining;
    private static long generation;

    private static final class Entry {
        final long time = System.currentTimeMillis();
        final String stage, detail;
        final CaptionCredentialRef credential;
        final SecureApiKey.StoredCredential stored;

        Entry(String stage, String detail, CaptionCredentialRef credential,
              SecureApiKey.StoredCredential stored) {
            this.stage = stage;
            this.detail = detail == null || detail.length() <= 4096 ? detail : "[detail omitted]";
            this.credential = credential;
            this.stored = stored;
        }
    }

    private CaptionDiagnostics() {}

    public static void mark(Context context, String stage, String detail) {
        mark(context, stage, detail, CaptionCredentialRef.NONE);
    }

    public static void mark(Context context, String stage, String detail, CaptionCredentialRef credential) {
        if (context == null) return;
        Entry entry = new Entry(stage, detail, credential, SecureApiKey.captureCredential(context));
        synchronized (LOCK) {
            if (pending.size() == CAPACITY) pending.removeFirst();
            pending.addLast(entry);
            if (!draining) {
                draining = true;
                worker.execute(CaptionDiagnostics::drain);
            }
        }
    }

    private static void drain() {
        String identity = null, key = "";
        for (;;) {
            Entry entry;
            long epoch;
            synchronized (LOCK) {
                entry = pending.pollFirst();
                if (entry == null) {
                    draining = false;
                    return;
                }
                epoch = generation;
            }

            String captured = entry.stored.identity();
            if (!captured.equals(identity)) {
                identity = captured;
                key = entry.stored.resolve();
            }
            boolean unavailable = entry.credential.known()
                    ? !CaptionCredentialRef.of(key).fingerprint.equals(entry.credential.fingerprint)
                    : entry.stored.present() && key.isEmpty();
            String detail = unavailable ? "[credential unavailable]" : redact(entry.detail, key, MAX_DETAIL);
            String line = entry.time + " " + entry.stage + " " + detail;
            synchronized (LOCK) {
                if (epoch != generation) continue;
                if (lines.size() == CAPACITY) lines.removeFirst();
                lines.addLast(line);
            }
        }
    }

    public static String redact(String value, String key, int limit) {
        String text = value == null ? "" : value;
        if (key != null && !key.isEmpty()) {
            String quoted = JSONObject.quote(key);
            text = text.replace(quoted.substring(1, quoted.length() - 1), "[redacted]")
                    .replace(key, "[redacted]");
        }
        text = URL.matcher(text.replace("\\/", "/")).replaceAll("[URL redacted]");
        text = SECRET.matcher(text).replaceAll("[credential redacted]")
                .replace('\r', ' ').replace('\n', ' ').trim();
        return text.length() <= limit ? text : text.substring(0, limit) + " [truncated]";
    }

    public static String errorDetail(Throwable error) {
        return error == null ? "unknown" : error.getClass().getSimpleName();
    }

    public static void clear(Context context) {
        synchronized (LOCK) {
            generation++;
            pending.clear();
            lines.clear();
        }
    }

    private static String snapshot() {
        synchronized (LOCK) {
            return String.join("\n", lines);
        }
    }

    /** Queued behind redaction. The callback runs off the main thread. */
    static void export(Consumer<String> ready) {
        worker.execute(() -> ready.accept(snapshot()));
    }

    /** Synchronous read for offline assertions. The settings page uses export(). */
    public static String history(Context context) {
        try {
            return worker.submit(CaptionDiagnostics::snapshot).get();
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new IllegalStateException(interrupted);
        } catch (ExecutionException failed) {
            throw new IllegalStateException(failed.getCause());
        }
    }
}
