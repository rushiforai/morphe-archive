package app.yydarlinker.deepseekcaptions;

import android.content.Context;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * The queue between the code that marks a diagnostic record and the journal on disk.
 *
 * <p>A caller on the playback, animation or preview path only hands over the record with the
 * reference of its credential; nothing else happens there. Redaction, keystore access and file
 * appends run later on the writer thread. A record is redacted with the key of its own credential
 * (a snapshot of at most two keys is kept for that), and when that key cannot be resolved it still
 * goes through the pattern redactor, so no raw secret is ever written.
 */
final class CaptionDiagnosticsWriter {
    private static final int MAX_SNAPSHOTS = 2;
    private static final long SNAPSHOT_MAX_AGE_MS = 5 * 60_000L;
    private static final int MAX_BATCH = 64;
    private static final int MAX_QUEUE = 512;
    private static final int MAX_DECISION_TAIL = 12_000;
    private static final int MAX_BATCH_CHARS = 60_000;

    private static final Object LOCK = new Object();
    private static final Object DRAIN_LOCK = new Object();
    private static final ArrayDeque<Record> QUEUE = new ArrayDeque<>();

    /** Records of real lifecycle evidence; a burst of display noise never evicts them. */
    private static final ArrayDeque<Record> DECISIONS_QUEUE = new ArrayDeque<>();

    private static final Map<String, String> SNAPSHOTS =
            new LinkedHashMap<String, String>(4, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > MAX_SNAPSHOTS;
                }
            };

    private static volatile Thread worker;
    private static final ThreadPoolExecutor WRITER =
            new ThreadPoolExecutor(
                    1,
                    1,
                    30,
                    TimeUnit.SECONDS,
                    new ArrayBlockingQueue<>(64),
                    runnable -> {
                        Thread thread = new Thread(runnable, "caption-diagnostics-writer");
                        thread.setDaemon(true);
                        worker = thread;
                        return thread;
                    });

    private static boolean drainPosted;
    private static long dropped, merged, written, seedOnlyRedactions;
    private static long epoch, lastResolvedAt;
    private static String decisionTail = "";
    private static boolean decisionsLoaded;

    private CaptionDiagnosticsWriter() {}

    private static final class Record {
        final String stage, detail, mergeKey;
        final CaptionCredentialRef credential;
        final SecureApiKey.StoredCredential stored;
        final long at = System.currentTimeMillis();
        int repeats;

        Record(String stage, String detail, CaptionCredentialRef credential, String mergeKey) {
            this.stage = stage;
            this.detail = detail;
            this.credential = credential == null ? CaptionCredentialRef.NONE : credential;
            this.stored = null;
            this.mergeKey = mergeKey == null ? "" : mergeKey;
        }

        Record(String stage, String detail, SecureApiKey.StoredCredential stored) {
            this.stage = stage;
            this.detail = detail;
            this.credential = CaptionCredentialRef.NONE;
            this.stored = stored;
            this.mergeKey = "";
        }
    }

    /**
     * Queues a record. Records with the same stage and merge key that follow each other are merged
     * into one that counts its repeats.
     */
    static void enqueue(
            Context context,
            String stage,
            String detail,
            CaptionCredentialRef credential,
            String mergeKey) {
        if (context == null || stage == null || stage.isEmpty()) return;
        enqueueRecord(context, new Record(stage, detail, credential, mergeKey));
    }

    static void enqueueStored(Context context, String stage, String detail,
            SecureApiKey.StoredCredential stored) {
        if (context == null || stage == null || stage.isEmpty()) return;
        enqueueRecord(context, new Record(stage, detail, stored));
    }

    private static void enqueueRecord(Context context, Record record) {
        Context app = context.getApplicationContext();
        synchronized (LOCK) {
            ArrayDeque<Record> lane =
                    CaptionDiagnostics.isDecision(record.stage) ? DECISIONS_QUEUE : QUEUE;
            Record last = lane.peekLast();
            if (!record.mergeKey.isEmpty()
                    && last != null
                    && last.mergeKey.equals(record.mergeKey)
                    && last.stage.equals(record.stage)) {
                last.repeats++;
                merged++;
                return;
            }
            if (lane.size() >= MAX_QUEUE) {
                dropped++;
                return;
            }
            lane.addLast(record);
            if (drainPosted) return;
            drainPosted = true;
        }
        WRITER.execute(() -> drain(app));
    }

    private static boolean idle() {
        synchronized (LOCK) {
            return QUEUE.isEmpty() && DECISIONS_QUEUE.isEmpty();
        }
    }

    /** Writes the queued records to the journal, a batch at a time. */
    private static void drain(Context context) {
        synchronized (DRAIN_LOCK) {
            for (int n = 0; n < 16 && !idle(); n++) drainBatch(context);
            synchronized (LOCK) {
                drainPosted = !idle();
                if (drainPosted) WRITER.execute(() -> drain(context));
            }
        }
    }

    private static void drainBatch(Context context) {
        ArrayList<Record> batch = new ArrayList<>(MAX_BATCH);
        long batchEpoch;
        synchronized (LOCK) {
            batchEpoch = epoch;
            // Both lanes are in every batch, decisions first, so a flood of display observations
            // cannot starve the request, cancellation, repair and first-display evidence.
            for (int i = 0; i < MAX_BATCH / 2 && !DECISIONS_QUEUE.isEmpty(); i++)
                batch.add(DECISIONS_QUEUE.pollFirst());
            while (batch.size() < MAX_BATCH && !QUEUE.isEmpty()) batch.add(QUEUE.pollFirst());
            while (batch.size() < MAX_BATCH && !DECISIONS_QUEUE.isEmpty())
                batch.add(DECISIONS_QUEUE.pollFirst());
        }
        StringBuilder archive = new StringBuilder(), decisions = new StringBuilder();
        String latestStage = "", latestDetail = "";
        long latestAt = 0;
        for (Record record : batch) {
            String stage = CaptionDiagnostics.sanitize(record.stage, 80);
            String detail = redact(context, record);
            String line = record.at + " | " + stage + (detail.isEmpty() ? "" : " | " + detail);
            archive.append(line).append('\n');
            if (record.repeats > 0)
                archive.append("  (repeated ")
                        .append(record.repeats)
                        .append(" times; repeated observation merged; total_count=")
                        .append(record.repeats + 1)
                        .append(")\n");
            if (CaptionDiagnostics.isDecision(record.stage)) decisions.append(line).append('\n');
            latestStage = stage;
            latestDetail = detail;
            latestAt = record.at;
        }
        restoreDecisionTail(context, batchEpoch);
        synchronized (LOCK) {
            if (batchEpoch != epoch) return;
            addDecisions(decisions.toString(), false);
            if (archive.length() > 0) {
                String text = archive.toString();
                if (text.length() > MAX_BATCH_CHARS)
                    text = text.substring(0, MAX_BATCH_CHARS) + " [batch truncated]";
                CaptionDiagnosticArchive.append(context, "history", text);
                written += batch.size();
            }
            if (latestAt > 0)
                CaptionDiagnosticArchive.appendSummary(
                        context,
                        latestStage,
                        latestDetail,
                        latestAt,
                        () -> {
                            synchronized (LOCK) {
                                return batchEpoch == epoch ? decisionTail : "";
                            }
                        },
                        batchEpoch);
        }
    }

    /** Adds decision lines to the tail kept for the report, at its end or at its start. */
    private static void addDecisions(String lines, boolean before) {
        if (lines.isEmpty()) return;
        String tail = before ? lines + decisionTail : decisionTail + lines;
        decisionTail =
                tail.length() > MAX_DECISION_TAIL
                        ? tail.substring(tail.length() - MAX_DECISION_TAIL)
                        : tail;
    }

    /** After a restart, the decisions the previous run kept come back in front of the new ones. */
    private static void restoreDecisionTail(Context context, long batchEpoch) {
        synchronized (LOCK) {
            if (decisionsLoaded) return;
            decisionsLoaded = true;
        }
        CaptionDiagnosticArchive.readSummaryAsync(
                context,
                batchEpoch,
                previous -> {
                    if (previous == null) return;
                    String[] parts = previous.split("\u0001", -1);
                    if (parts.length < 5) return;
                    synchronized (LOCK) {
                        if (batchEpoch == epoch) addDecisions(parts[4], true);
                    }
                });
    }

    /** The detail of a record, redacted with the key of the credential it was made under. */
    private static String redact(Context context, Record record) {
        boolean known = record.stored == null ? record.credential.known() : record.stored.present();
        String key = !known ? "" : record.stored == null
                ? snapshotFor(context, record.credential) : snapshotFor(record.stored);
        String clean =
                CaptionDiagnostics.sanitize(
                        CaptionQualityTrace.redact(record.detail, key, 1600), 1700);
        if (known && key.isEmpty()) {
            synchronized (LOCK) {
                seedOnlyRedactions++;
            }
            return clean + ";redaction=credential_unavailable";
        }
        return clean;
    }

    /**
     * The plaintext key of a credential reference, resolved at most once per five minutes. The
     * extension holds no more than two keys, for no longer than that.
     */
    private static String snapshotFor(Context context, CaptionCredentialRef reference) {
        long now = System.currentTimeMillis();
        synchronized (LOCK) {
            String cached = SNAPSHOTS.get(reference.fingerprint);
            if (cached != null && now - lastResolvedAt <= SNAPSHOT_MAX_AGE_MS) return cached;
        }
        String plaintext = SecureApiKey.load(context);
        boolean same = CaptionCredentialRef.of(plaintext).fingerprint.equals(reference.fingerprint);
        synchronized (LOCK) {
            lastResolvedAt = now;
            if (!same) return "";
            SNAPSHOTS.put(reference.fingerprint, plaintext);
            return plaintext;
        }
    }

    /** A captured encrypted binding stays valid across profile changes; decryption is writer-only. */
    private static String snapshotFor(SecureApiKey.StoredCredential source) {
        String identity = source.identity();
        long now = System.currentTimeMillis();
        synchronized (LOCK) {
            String cached = SNAPSHOTS.get(identity);
            if (cached != null && now - lastResolvedAt <= SNAPSHOT_MAX_AGE_MS) return cached;
        }
        String plaintext = source.resolve();
        synchronized (LOCK) {
            lastResolvedAt = now;
            if (!plaintext.isEmpty()) SNAPSHOTS.put(identity, plaintext);
        }
        return plaintext;
    }

    /** Waits, at most 400 ms, for the records queued before the call to be written. */
    static void flush(Context context) {
        if (context == null) return;
        for (int attempt = 0; attempt < 40; attempt++) {
            synchronized (LOCK) {
                if (idle() && !drainPosted) return;
            }
            try {
                Thread.sleep(10L);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                return;
            }
        }
    }

    static void background(Runnable task) {
        WRITER.execute(task);
    }

    /** Writes every queued record on the writer thread and waits for it. */
    static void drainNow(Context context) {
        if (context == null) return;
        Runnable task =
                () -> {
                    for (int n = 0; n < 64 && !idle(); n++) drain(context);
                };
        if (Thread.currentThread() == worker) {
            task.run();
            return;
        }
        try {
            WRITER.submit(task).get(5, TimeUnit.SECONDS);
        } catch (Exception failed) {
            throw new IllegalStateException("diagnostics writer barrier", failed);
        }
    }

    static void clear(Context context) {
        synchronized (LOCK) {
            QUEUE.clear();
            DECISIONS_QUEUE.clear();
            SNAPSHOTS.clear();
            lastResolvedAt = 0;
            decisionTail = "";
            decisionsLoaded = false;
            epoch++;
        }
    }

    /** The clearing generation: a record of an older one is never revived. */
    static long epoch() {
        synchronized (LOCK) {
            return epoch;
        }
    }


    static long droppedCount() {
        synchronized (LOCK) {
            return dropped;
        }
    }

    static long mergedCount() {
        synchronized (LOCK) {
            return merged;
        }
    }

    /** One line of queue accounting for the report, so that drops and merges can be audited. */
    static String stats(String label) {
        synchronized (LOCK) {
            if (written == 0 && dropped == 0 && merged == 0) return "";
            return "\n\n["
                    + label
                    + ": written="
                    + written
                    + "; merged_repeats="
                    + merged
                    + "; dropped="
                    + dropped
                    + "; pending="
                    + QUEUE.size()
                    + "; pending_decisions="
                    + DECISIONS_QUEUE.size()
                    + "; pending_total="
                    + (QUEUE.size() + DECISIONS_QUEUE.size())
                    + "; credential_unavailable="
                    + seedOnlyRedactions
                    + "]\n";
        }
    }
}
