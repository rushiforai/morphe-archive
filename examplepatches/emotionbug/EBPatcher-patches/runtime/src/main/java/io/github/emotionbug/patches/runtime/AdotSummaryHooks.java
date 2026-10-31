package io.github.emotionbug.patches.runtime;

import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.Executor;
import org.json.JSONObject;

/** Version-bound native events. The optional patch verifies every reflected descriptor. */
public final class AdotSummaryHooks {
    private AdotSummaryHooks() {}
    private static volatile Object callDatabase;
    private static final java.util.Set<Long> API_WRITES = java.util.concurrent.ConcurrentHashMap.newKeySet();
    private static final java.util.Map<Long, Long> MAPPINGS = new java.util.concurrent.ConcurrentHashMap<>();

    private static void enqueue(Object room, Runnable action) {
        try { ((Executor) Original.EXECUTOR.get(room)).execute(action); }
        catch (Throwable failure) { failed(failure); }
    }

    /** One owner per yx9.r coroutine, including every suspension and exceptional resumption. */
    public static void apiPublicationStart(Object continuation, Object repository, Object request) {
        AdotApiPublication.begin(continuation);
        try {
            SummaryStore store = SummaryStore.current();
            if (store == null) return;
            Object room = Original.DATABASE.get(Original.STORAGE.get(repository));
            callDatabase = room;
            Original.BEGIN.invoke(room);
            try {
                SQLiteDatabase db = connection(room);
                long briefing;
                if ("pv9".equals(request.getClass().getName())) {
                    briefing = request.getClass().getField("b").getLong(request);
                } else if ("o58".equals(request.getClass().getName())) {
                    briefing = AdotSummaryNativeStore.briefingForServer(db, request.getClass().getField("a").getLong(request));
                } else throw new IllegalStateException("Unexpected native API request");
                AdotSummaryNativeStore.preparePublication(db, store, briefing);
                Original.SUCCESS.invoke(room);
            } finally { Original.END.invoke(room); }
        } catch (Throwable failure) { failed(failure); }
    }

    public static void apiPublicationEnd(Object continuation) {
        try { if (AdotApiPublication.end(continuation)) reconcile(); }
        catch (Throwable failure) { failed(failure); }
    }

    /** Bound to iw9's verified constructor; captures no rows and performs no I/O. */
    public static void storage(Object repository) {
        try {
            callDatabase = Original.DATABASE.get(repository);
            reconcile();
        }
        catch (Throwable failure) { failed(failure); }
    }

    /** ly4 is the native exact file-to-communication-log mapping, not a phone/date heuristic. */
    public static void association(Object mapping) {
        try {
            Long recording = (Long) mapping.getClass().getField("d").get(mapping);
            long communication = mapping.getClass().getField("a").getLong(mapping);
            if (recording == null || recording <= 0 || communication <= 0) return;
            Long old = MAPPINGS.putIfAbsent(recording, communication);
            if (old != null && old != communication) MAPPINGS.put(recording, -1L);
            reconcile();
        } catch (Throwable failure) { failed(failure); }
    }


    public static void recording(Object persisted) {
        try {
            if (!SummaryScheduler.enabled()) return;
            long id = Recording.ID.getLong(persisted);
            Object event = Recording.EVENT.get(persisted);
            Object file = Recording.FILE.get(event);
            if (id > 0 && file != null) {
                Uri audio = (Uri) Recording.URI.invoke(file);
                if (audio != null) SummaryScheduler.recording(id, audio);
            }
        } catch (Throwable failure) {
            failed(failure);
        }
    }

    /** Called only in the two original, exact TICKET_ALL_USED equality branches. */
    public static void quota(Object upload) {
        try {
            if (!SummaryScheduler.enabled()) return;
            long id = Quota.ID.getLong(upload);
            Object files = Quota.FILES.get(upload);
            Object file = Quota.PRIMARY.invoke(files);
            if (id > 0 && file != null && Quota.LENGTH.getLong(file) > 0) {
                long recordingId = Quota.RECORDING_ID.getLong(file);
                Uri audio = (Uri) Quota.URI.get(file);
                if (recordingId > 0 && audio != null) SummaryScheduler.quota(recordingId, id, audio);
            }
        } catch (Throwable failure) {
            failed(failure);
        }
    }

    /** yx9.l's shared synchronous/resumed success join, after iw9.f has persisted all rows. */
    public static void original(Object repository, long briefingId, Object apiResult) {
        try {
            if (briefingId <= 0) return;
            Object storage = Original.STORAGE.get(repository);
            Object room = Original.DATABASE.get(storage);
            callDatabase = room;
            AdotApiSnapshot snapshot = AdotApiSnapshot.capture(apiResult);
            enqueue(room, () -> readOriginal(room, briefingId, snapshot));
        } catch (Throwable failure) {
            failed(failure);
        }
    }

    private static void readOriginal(Object room, long briefingId, AdotApiSnapshot snapshot) {
        try {
            SummaryStore store = SummaryStore.current();
            if (store == null) return;
            SQLiteDatabase database = connection(room);
            JSONObject raw;
            boolean owned = false;
            Original.BEGIN.invoke(room);
            try {
                long recording = AdotSummaryNativeStore.recording(database, briefingId);
                String audio = AdotSummaryNativeStore.audio(database, recording);
                raw = audio == null ? null : AdotSummaryNativeStore.snapshot(database, recording, audio);
                if (raw == null) return;
                JSONObject journal = store.nativeJournal(recording, audio);
                owned = AdotSummaryNativeStore.localRows(store, raw);
                if (owned) {
                    if ("1".equals(journal.optString("api_pending"))) {
                        AdotSummaryNativeStore.restore(database, new JSONObject(journal.getString("expected")), briefingId);
                        raw = AdotSummaryNativeStore.snapshot(database, recording, audio);
                    }
                    store.nativeRecoveredIntent(raw);
                }
                AdotSummaryNativeStore.captureOriginal(store, raw, snapshot);
                store.nativeApiPending(recording, false);
                API_WRITES.remove(recording);
                Original.SUCCESS.invoke(room);
            } finally { Original.END.invoke(room); }
            SummaryScheduler.schedule(store.context);
            if (owned) {
                acknowledge(room, store, raw);
                apply(briefingId);
                return;
            }
            apply(briefingId);
        } catch (Throwable failure) { failed(failure); }
    }

    private static SQLiteDatabase connection(Object room) throws ReflectiveOperationException {
        return (SQLiteDatabase) Original.SQLITE.get(Original.CONNECTION.invoke(Original.HELPER.invoke(room)));
    }

    /** Runs inside the ORIGINAL Room insert transaction, before its ABORT-on-sequence-conflict insert. */
    public static void beforeApiInsert(Object value) {
        try {
            SummaryStore store = SummaryStore.current();
            Object room = callDatabase;
            if (store == null || room == null || !(value instanceof Iterable<?>)) return;
            SQLiteDatabase db = connection(room);
            java.util.HashSet<Long> briefings = new java.util.HashSet<>();
            for (Object row : (Iterable<?>) value) {
                String type = row.getClass().getName();
                if (!(type.equals("am3") || type.equals("mq3"))) throw new IllegalStateException("Unexpected native API row");
                briefings.add(row.getClass().getField("b").getLong(row));
            }
            for (long briefing : briefings) {
                long recording = AdotSummaryNativeStore.recording(db, briefing);
                String audio = AdotSummaryNativeStore.audio(db, recording);
                if (audio == null) continue;
                JSONObject journal = store.nativeJournal(recording, audio);
                if (journal == null || journal.optString("expected").isEmpty()) continue;
                if (!db.inTransaction()) throw new IllegalStateException("Native API insertion is outside its Room transaction");
                if (!"1".equals(journal.optString("api_pending"))) {
                    JSONObject current = AdotSummaryNativeStore.snapshot(db, recording, audio);
                    if (current == null) throw new IllegalStateException("Native recording disappeared");
                    if (!store.nativeBeforeApi(current)) continue;
                    journal = store.nativeJournal(recording, audio);
                }
                API_WRITES.add(recording);
                if ("local".equals(journal.optString("source")))
                    AdotSummaryNativeStore.removeApplied(db, new JSONObject(journal.getString("expected")));
            }
        } catch (Throwable failure) {
            failed(failure);
            // The surrounding original DAO catches this and rolls its transaction back.
            throw new IllegalStateException("Cannot safely replace the locally selected native result", failure);
        }
    }

    /** Cancellation/failure retains the original exception and restores the last complete native result. */
    public static void apiFailed(Object continuation, long fallback) {
        try {
            long saved = continuation.getClass().getField("d").getLong(continuation);
            long briefing = saved > 0 ? saved : fallback;
            Object room = callDatabase;
            SummaryStore store = SummaryStore.current();
            if (room == null || store == null || briefing <= 0) return;
            enqueue(room, () -> {
                try { recoverApi(room, store, briefing); }
                catch (Throwable failure) { failed(failure); }
            });
        } catch (Throwable failure) { failed(failure); }
    }

    private static void recoverApi(Object room, SummaryStore store, long briefing) throws Exception {
        SQLiteDatabase db = connection(room);
        JSONObject restored = null;
        Original.BEGIN.invoke(room);
        try {
            long recording = AdotSummaryNativeStore.recording(db, briefing);
            restored = AdotSummaryNativeStore.recover(db, store, briefing);
            API_WRITES.remove(recording);
            Original.SUCCESS.invoke(room);
        } finally { Original.END.invoke(room); }
        if (restored != null) acknowledge(room, store, restored);
        SummaryScheduler.schedule(store.context);
        apply(briefing);
    }

    public static void apply(long briefingId) {
        SummaryStore store = SummaryStore.current();
        if (store == null || briefingId <= 0) return;
        SummaryStore.Job job = store.briefing(briefingId);
        if (job != null) applyJob(job.id);
    }

    static void applyJob(long jobId) {
        Object room = callDatabase;
        SummaryStore store = SummaryStore.current();
        if (room == null || store == null) return;
        enqueue(room, () -> {
            try {
                applyNative(room, store, jobId);
            } catch (Throwable failure) { failed(failure); }
        });
    }

    static void reconcile() {
        Object room = callDatabase;
        SummaryStore store = SummaryStore.current();
        if (room == null || store == null) return;
        enqueue(room, () -> {
            for (java.util.Map.Entry<Long, Long> mapping : MAPPINGS.entrySet()) {
                try { store.nativeMapping(mapping.getKey(), mapping.getValue()); MAPPINGS.remove(mapping.getKey(), mapping.getValue()); }
                catch (Throwable failure) { failed(failure); }
            }
            for (long briefing : store.nativePendingBriefings()) {
                try {
                    long recording = AdotSummaryNativeStore.recording(connection(room), briefing);
                    if (!API_WRITES.contains(recording)) recoverApi(room, store, briefing);
                } catch (Throwable failure) { failed(failure); }
            }
            for (SummaryStore.Job job : store.nativeJobs()) {
                try { applyNative(room, store, job.id); }
                catch (Throwable failure) { failed(failure); }
            }
        });
    }

    private static void applyNative(Object room, SummaryStore store, long jobId) throws Exception {
        SQLiteDatabase db = connection(room);
        JSONObject after;
        Original.BEGIN.invoke(room);
        try {
            after = AdotSummaryNativeStore.select(db, store, jobId);
            Original.SUCCESS.invoke(room);
        } finally { Original.END.invoke(room); }
        SummaryStore.Job current = store.job(jobId);
        if (current != null && "queued".equals(current.state)) SummaryScheduler.schedule(store.context);
        if (after != null && acknowledge(room, store, after)) {
            // Room endTransaction schedules its normal invalidation; commit precedes source notification.
            store.nativeAssociation(jobId, after.getLong("recordingId"), after.getString("audioUri"), after.getLong("briefingId"));
            SummaryNotifications.refresh(store.context, jobId);
            store.nativePrune();
        }
    }

    private static boolean acknowledge(Object room, SummaryStore store, JSONObject expected) throws Exception {
        Original.BEGIN.invoke(room);
        try {
            long recording = expected.getLong("recordingId");
            String audio = expected.getString("audioUri");
            JSONObject actual = AdotSummaryNativeStore.snapshot(connection(room), recording, audio);
            JSONObject journal = store.nativeJournal(recording, audio);
            String hash = SummaryStore.nativeHash(expected);
            if (actual == null || journal == null || "1".equals(journal.optString("api_pending"))
                    || !hash.equals(SummaryStore.nativeHash(actual))
                    || !hash.equals(journal.optString("expected_hash"))) return false;
            store.nativeCommitted(actual);
            Original.SUCCESS.invoke(room);
            return true;
        } finally { Original.END.invoke(room); }
    }


    private static final class Original {
        static final Field STORAGE;
        static final Field DATABASE;
        static final Field EXECUTOR;
        static final Method HELPER;
        static final Method CONNECTION;
        static final Field SQLITE;
        static final Method BEGIN, SUCCESS, END;
        static {
            try {
                STORAGE = Class.forName("yx9").getField("a");
                DATABASE = Class.forName("iw9").getField("a");
                EXECUTOR = Class.forName("xal").getField("c");
                HELPER = Class.forName("xal").getMethod("j");
                CONNECTION = Class.forName("v5o").getMethod("c0");
                SQLITE = Class.forName("ztb").getField("d");
                BEGIN = Class.forName("xal").getMethod("c");
                SUCCESS = Class.forName("xal").getMethod("u");
                END = Class.forName("xal").getMethod("o");
            } catch (ReflectiveOperationException failure) {
                throw new ExceptionInInitializerError(failure);
            }
        }
    }

    private static final class Recording {
        static final Field ID;
        static final Field EVENT;
        static final Field FILE;
        static final Method URI;
        static {
            try {
                ID = Class.forName("m9g").getField("a");
                EVENT = Class.forName("m9g").getField("b");
                FILE = Class.forName("khk").getField("c");
                URI = Class.forName("rrd").getMethod("a");
            } catch (ReflectiveOperationException failure) {
                throw new ExceptionInInitializerError(failure);
            }
        }
    }

    private static final class Quota {
        static final Field ID;
        static final Field RECORDING_ID;
        static final Field FILES;
        static final Method PRIMARY;
        static final Field URI;
        static final Field LENGTH;
        static {
            try {
                ID = Class.forName("jmq").getField("d");
                RECORDING_ID = Class.forName("pnq").getField("a");
                FILES = Class.forName("jmq").getField("q");
                PRIMARY = Class.forName("goq").getMethod("a");
                URI = Class.forName("pnq").getField("c");
                LENGTH = Class.forName("pnq").getField("e");
            } catch (ReflectiveOperationException failure) {
                throw new ExceptionInInitializerError(failure);
            }
        }
    }

    static void failed(Throwable failure) {
        // Never let logging or optional summary work alter the phone's original error flow.
        try { Log.w("AdotSummaryHooks", "Optional summary event was not accepted", failure); }
        catch (Throwable ignored) { }
    }
}
