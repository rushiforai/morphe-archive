package io.github.emotionbug.patches.runtime;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.util.AtomicFile;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Extension-owned, no-backup state. Never opens or modifies the dialer's databases. */
final class SummaryStore extends SQLiteOpenHelper {
    static final String OFF = "off", ALWAYS = "always", QUOTA = "quota";
    private static volatile SummaryStore instance;
    final File directory;
    final Context context;
    static SummaryStore current() { return instance; }

    static synchronized SummaryStore get(Context context) {
        if (instance == null) instance = new SummaryStore(context.getApplicationContext());
        return instance;
    }

    SummaryStore(Context context) {
        super(context, new File(context.getNoBackupFilesDir(), "ebpatcher-summary.db").getPath(), null, 5);
        this.context = context.getApplicationContext();
        directory = new File(context.getNoBackupFilesDir(), "ebpatcher-summaries");
        setWriteAheadLoggingEnabled(true);
    }

    @Override public void onCreate(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE settings (name TEXT PRIMARY KEY, value TEXT NOT NULL)");
        db.execSQL("CREATE TABLE jobs (id INTEGER PRIMARY KEY AUTOINCREMENT, audio TEXT UNIQUE NOT NULL, "
                + "recording_id INTEGER NOT NULL DEFAULT 0, briefing_id INTEGER NOT NULL DEFAULT 0, "
                + "quota INTEGER NOT NULL DEFAULT 0, original TEXT NOT NULL DEFAULT '', revision INTEGER NOT NULL DEFAULT 1, "
                + "state TEXT NOT NULL, reason TEXT NOT NULL DEFAULT '', created INTEGER NOT NULL, "
                + "transcript TEXT NOT NULL DEFAULT '', summary TEXT NOT NULL DEFAULT '', "
                + "api_document TEXT NOT NULL DEFAULT '', local_document TEXT NOT NULL DEFAULT '', "
                + "selected_source TEXT NOT NULL DEFAULT 'uncertain', selection_reason TEXT NOT NULL DEFAULT '', "
                + "selection_revision INTEGER NOT NULL DEFAULT 0, choice TEXT NOT NULL DEFAULT 'recommended', "
                + "self_channel TEXT NOT NULL DEFAULT 'auto', self_talker_id INTEGER NOT NULL DEFAULT -1)");
        db.execSQL("CREATE UNIQUE INDEX jobs_recording ON jobs(recording_id) WHERE recording_id>0");
        db.execSQL("CREATE INDEX jobs_briefing ON jobs(briefing_id) WHERE briefing_id>0");
        db.execSQL("CREATE INDEX jobs_state ON jobs(state,id)");
        createRetentionTables(db);
        createNativeJournal(db);
    }
    @Override public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        if (oldVersion < 1 || oldVersion > 4 || newVersion != 5)
            throw new IllegalStateException("Unsupported summary database version");
        if (oldVersion == 1) {
            db.execSQL("ALTER TABLE jobs ADD COLUMN api_document TEXT NOT NULL DEFAULT ''");
            db.execSQL("ALTER TABLE jobs ADD COLUMN local_document TEXT NOT NULL DEFAULT ''");
            db.execSQL("ALTER TABLE jobs ADD COLUMN selected_source TEXT NOT NULL DEFAULT 'uncertain'");
            db.execSQL("ALTER TABLE jobs ADD COLUMN selection_reason TEXT NOT NULL DEFAULT ''");
            db.execSQL("ALTER TABLE jobs ADD COLUMN selection_revision INTEGER NOT NULL DEFAULT 0");
            db.execSQL("ALTER TABLE jobs ADD COLUMN choice TEXT NOT NULL DEFAULT 'recommended'");
            createRetentionTables(db);
        }
        if (oldVersion < 3) createNativeJournal(db);
        else db.execSQL("ALTER TABLE native_journal ADD COLUMN speaker_edits TEXT NOT NULL DEFAULT '[]'");
        if (oldVersion < 4) db.execSQL("ALTER TABLE jobs ADD COLUMN self_channel TEXT NOT NULL DEFAULT 'auto'");
        db.execSQL("ALTER TABLE jobs ADD COLUMN self_talker_id INTEGER NOT NULL DEFAULT -1");
        if (oldVersion < 3) prune(db);
    }
    private static void createRetentionTables(SQLiteDatabase db) {
        // Hash-only retirement keys prevent delayed native callbacks from resurrecting deleted histories.
        db.execSQL("CREATE TABLE retired (identity TEXT PRIMARY KEY)");
        // A live engine may still own checkpoints after its revision is cancelled or superseded.
        db.execSQL("CREATE TABLE leases (job_id INTEGER PRIMARY KEY)");
    }

    private static void createNativeJournal(SQLiteDatabase db) {
        // Restoration is not processing history: never cascade/prune these with jobs.
        db.execSQL("CREATE TABLE native_journal (recording_id INTEGER PRIMARY KEY, audio TEXT NOT NULL, "
                + "briefing_id INTEGER NOT NULL, backup TEXT NOT NULL, expected TEXT NOT NULL DEFAULT '', "
                + "expected_hash TEXT NOT NULL DEFAULT '', applied_hash TEXT NOT NULL DEFAULT '', applied TEXT NOT NULL DEFAULT '', "
                + "applied_source TEXT NOT NULL DEFAULT '', applied_token TEXT NOT NULL DEFAULT '', "
                + "token TEXT NOT NULL DEFAULT '', source TEXT NOT NULL DEFAULT '', committed INTEGER NOT NULL DEFAULT 0, "
                + "api_pending INTEGER NOT NULL DEFAULT 0, speaker_edits TEXT NOT NULL DEFAULT '[]')");
        db.execSQL("CREATE TABLE native_associations (recording_id INTEGER PRIMARY KEY, communication_id INTEGER NOT NULL)");
    }

    String setting(String key, String fallback) {
        try (Cursor cursor = getReadableDatabase().rawQuery("SELECT value FROM settings WHERE name=?", new String[]{key})) {
            return cursor.moveToFirst() ? cursor.getString(0) : fallback;
        }
    }
    void setSetting(String key, String value) {
        ContentValues values = new ContentValues(); values.put("name", key); values.put("value", value);
        getWritableDatabase().insertWithOnConflict("settings", null, values, SQLiteDatabase.CONFLICT_REPLACE);
    }
    String mode() { return setting("mode", OFF); }
    static boolean accepts(String mode, boolean exhausted) {
        return ALWAYS.equals(mode) || QUOTA.equals(mode) && exhausted;
    }
    void mode(String mode) {
        if (!OFF.equals(mode) && !ALWAYS.equals(mode) && !QUOTA.equals(mode))
            throw new IllegalArgumentException("Unknown summary mode");
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            setSetting("mode", mode);
            if (OFF.equals(mode)) db.execSQL("UPDATE jobs SET state='cancelled',reason='Disabled in settings',revision=revision+1 WHERE state IN ('queued','running','waiting')");
            else if (QUOTA.equals(mode)) db.execSQL("UPDATE jobs SET state='cancelled',reason='Quota-only mode selected',revision=revision+1 WHERE quota=0 AND state IN ('queued','running','waiting')");
            prune(db);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
        SummaryScheduler.configurationChanged(mode);
    }

    void event(long recordingId, long briefingId, Uri audio, boolean exhausted, String original, String apiDocument) {
        if (audio == null || !("content".equals(audio.getScheme()) || "file".equals(audio.getScheme()))) return;
        if (original != null && original.length() > 65536) throw new IllegalArgumentException("Original summary exceeds supported size");
        if (apiDocument != null && apiDocument.length() > 4 * 1024 * 1024) throw new IllegalArgumentException("API document exceeds supported size");
        if (apiDocument != null && !apiDocument.isEmpty()) document(apiDocument);
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            String mode = mode();
            if (OFF.equals(mode)) return;
            if (retired(db, recordingId, briefingId, audio.toString())) return;
            Job byRecording = recordingId > 0 ? find("recording_id=?", new String[]{Long.toString(recordingId)}) : null;
            Job byBriefing = briefingId > 0 ? find("briefing_id=?", new String[]{Long.toString(briefingId)}) : null;
            Job byAudio = find("audio=?", new String[]{audio.toString()});
            Job old = byRecording != null ? byRecording : byBriefing != null ? byBriefing : byAudio;
            if (old != null && ((byRecording != null && byRecording.id != old.id)
                    || (byBriefing != null && byBriefing.id != old.id) || (byAudio != null && byAudio.id != old.id))) {
                state(old.id, "failed", "Ambiguous recording association; no summary was attached");
                db.setTransactionSuccessful(); return;
            }
            if (old == null && !accepts(mode, exhausted)) return;
            if (old != null && ((recordingId > 0 && old.recordingId > 0 && recordingId != old.recordingId)
                    || (briefingId > 0 && old.briefingId > 0 && briefingId != old.briefingId))) {
                state(old.id, "failed", "Recording association changed; no summary was attached");
                db.setTransactionSuccessful(); return;
            }
            ContentValues values = new ContentValues();
            if (recordingId > 0) values.put("recording_id", recordingId);
            if (briefingId > 0) values.put("briefing_id", briefingId);
            if (exhausted) values.put("quota", 1);
            boolean summaryChanged = original != null && !original.isEmpty() && (old == null || !original.equals(old.original));
            boolean documentChanged = apiDocument != null && !apiDocument.isEmpty()
                    && (old == null || !apiDocument.equals(old.apiDocument));
            boolean changed = summaryChanged || documentChanged;
            if (summaryChanged) values.put("original", original);
            if (documentChanged) values.put("api_document", apiDocument);
            if (old == null) {
                values.put("audio", audio.toString()); values.put("created", System.currentTimeMillis());
                values.put("state", "queued");
                db.insertOrThrow("jobs", null, values);
            } else {
                if ((changed || exhausted && !old.quota) && accepts(mode, exhausted || old.quota)) {
                    values.put("revision", old.revision + 1); values.put("state", "queued"); values.put("reason", "");
                }
                if (values.size() > 0) db.update("jobs", values, "id=?", new String[]{Long.toString(old.id)});
            }
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
        Job changed = find("recording_id=? AND audio=?", new String[]{Long.toString(recordingId), audio.toString()});
        if (changed != null) SummaryScheduler.applyNative(changed.id);
    }

    Job next(boolean transcriptionReady) {
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            String mode = mode();
            if (OFF.equals(mode)) return null;
            Job job = find(pendingSelection(mode, transcriptionReady) + " AND id NOT IN (SELECT job_id FROM leases)", null);
            if (job != null) {
                state(job.id, "running", "");
                ContentValues lease = new ContentValues(); lease.put("job_id", job.id);
                db.insertOrThrow("leases", null, lease);
            }
            db.setTransactionSuccessful(); return job;
        } finally { db.endTransaction(); }
    }
    /** Scheduling must not lose a wakeup while a stopping worker still owns the old lease. */
    boolean pending(boolean transcriptionReady) {
        String mode = mode();
        return !OFF.equals(mode) && find(pendingSelection(mode, transcriptionReady), null) != null;
    }
    void recoverForScheduling(Context context) {
        try (SummaryLock ignored = SummaryLock.acquire(context)) {
            interrupted(false);
        } catch (IOException activeWorker) {
            // Keep live leases. The scheduler still enqueues eligible leased work for after stop.
        }
    }
    private static String pendingSelection(String mode, boolean transcriptionReady) {
        return "state IN ('queued','waiting')" + (QUOTA.equals(mode) ? " AND quota=1" : "")
                + (transcriptionReady ? "" : " AND local_document<>''");
    }
    void interrupted(boolean resumable) {
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            ContentValues values = new ContentValues();
            values.put("state", resumable ? "waiting" : "failed");
            values.put("reason", resumable ? "Processing paused; waiting to resume" : "The worker stopped unexpectedly. Retry from settings.");
            db.update("jobs", values, "state='running'", null);
            // Only callers holding SummaryLock may recover dead leases. A live paused worker releases in finally.
            if (!resumable) {
                db.delete("leases", null, null);
                cleanOrphans(db);
            }
            prune(db);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }
    void state(long id, String state, String reason) {
        transition(id, 0, state, reason);
    }
    void state(Job job, String state, String reason) {
        transition(job.id, job.revision, state, reason);
    }
    private void transition(long id, int revision, String state, String reason) {
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            ContentValues values = new ContentValues(); values.put("state", state); values.put("reason", reason);
            db.update("jobs", values, revision == 0 ? "id=?" : "id=? AND revision=? AND state='running'",
                    revision == 0 ? new String[]{Long.toString(id)} : new String[]{Long.toString(id), Integer.toString(revision)});
            prune(db);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }
    void retry(long id) {
        Job job = find("id=?", new String[]{Long.toString(id)});
        if (job != null && accepts(mode(), job.quota) && !"running".equals(job.state)) state(id, "queued", "");
    }
    List<Job> list() {
        List<Job> result = new ArrayList<>();
        try (Cursor cursor = getReadableDatabase().rawQuery("SELECT * FROM jobs WHERE state IN ('queued','running','waiting') "
                + "OR id IN (SELECT id FROM jobs WHERE state NOT IN ('queued','running','waiting') ORDER BY id DESC LIMIT 5) ORDER BY id DESC", null)) {
            while (cursor.moveToNext()) result.add(new Job(cursor));
        }
        return result;
    }
    List<Job> nativeJobs() {
        List<Job> result = new ArrayList<>();
        try (Cursor cursor = getReadableDatabase().rawQuery("SELECT * FROM jobs ORDER BY id", null)) {
            while (cursor.moveToNext()) result.add(new Job(cursor));
        }
        return result;
    }
    private Job find(String where, String[] args) {
        try (Cursor cursor = getReadableDatabase().rawQuery("SELECT * FROM jobs WHERE " + where + " ORDER BY id LIMIT 1", args)) {
            return cursor.moveToFirst() ? new Job(cursor) : null;
        }
    }
    File work(Job job) throws IOException {
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            Job current = find("id=?", new String[]{Long.toString(job.id)});
            if (current == null || current.revision != job.revision || !"running".equals(current.state))
                throw new IOException("Summary job is no longer active");
            File work = new File(directory, Long.toString(job.id));
            if (!work.isDirectory() && !work.mkdirs()) throw new IOException("Unable to create private summary storage");
            db.setTransactionSuccessful();
            return work;
        } finally { db.endTransaction(); }
    }
    String text(String path) throws IOException {
        if (path.isEmpty()) return "";
        File file = new File(directory, path);
        if (!file.getCanonicalPath().startsWith(directory.getCanonicalPath() + File.separator)) throw new IOException("Invalid result path");
        return new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
    }
    void complete(Job job, String transcript, String summary, JSONObject local, JSONObject selection) throws IOException {
        if (!hasTextContent(transcript) || !hasTextContent(summary) || local == null
                || !hasTextContent(local.optString("summary"))
                || !local.optString("title").isEmpty() && !hasTextContent(local.optString("title")))
            throw new IOException("Model returned a result without meaningful generated text");
        document(local.toString());
        String source = selection.optString("source"), reason = selection.optString("reason");
        if (!("api".equals(source) || "local".equals(source) || "uncertain".equals(source)) || reason.isEmpty())
            throw new IOException("Model returned an invalid selection");
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            Job current = find("id=?", new String[]{Long.toString(job.id)});
            if (current == null) return;
            if (current.revision != job.revision || !"running".equals(current.state)) {
                // An API update can arrive during first-pass ASR. Retain its timed local candidate,
                // never its obsolete recommendation/ready state, so the queued revision can refine it.
                File workspace = new File(directory, Long.toString(job.id));
                if (current.revision > job.revision && "queued".equals(current.state)
                        && current.localDocument.isEmpty() && leased(db, job.id) && workspace.isDirectory()) {
                    write(new File(workspace, "transcript.txt"), transcript);
                    ContentValues values = new ContentValues(); values.put("transcript", job.id + "/transcript.txt");
                    values.put("local_document", local.toString());
                    db.update("jobs", values, "id=?", new String[]{Long.toString(job.id)});
                    db.setTransactionSuccessful();
                }
                return;
            }
            String transcriptPath = job.id + "/transcript.txt", summaryPath = job.id + "/summary.txt";
            File workspace = work(job);
            write(new File(workspace, "transcript.txt"), transcript);
            write(new File(workspace, "summary.txt"), summary);
            ContentValues values = new ContentValues();
            values.put("transcript", transcriptPath); values.put("summary", summaryPath);
            values.put("local_document", local.toString()); values.put("selected_source", source);
            values.put("selection_reason", reason); values.put("selection_revision", job.revision);
            values.put("state", "ready"); values.put("reason", "");
            db.update("jobs", values, "id=?", new String[]{Long.toString(job.id)});
            prune(db);
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
            SummaryScheduler.applyNative(job.id);
        }
    }
    void release(Job job) {
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            db.delete("leases", "job_id=?", new String[]{Long.toString(job.id)});
            if (find("id=?", new String[]{Long.toString(job.id)}) == null) removeOwned(job.id);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }

    JSONObject presentation(long briefingId) {
        if (briefingId <= 0) return null;
        Job job = find("briefing_id=?", new String[]{Long.toString(briefingId)});
        return job == null ? null : presentation(job);
    }
    JSONObject presentation(Job job) {
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            Job current = find("id=?", new String[]{Long.toString(job.id)});
            JSONObject result = current == null ? null : presentationSnapshot(current);
            db.setTransactionSuccessful();
            return result;
        } finally { db.endTransaction(); }
    }
    private JSONObject presentationSnapshot(Job job) {
        try {
            JSONObject api = job.apiDocument.isEmpty() ? legacyDocument(job.original, "") : document(job.apiDocument);
            JSONObject local = job.localDocument.isEmpty()
                    ? legacyDocument(text(job.summary), text(job.transcript)) : document(job.localDocument);
            boolean hasApi = usable(api), hasLocal = usable(local);
            if (!hasApi && !hasLocal) return null;
            boolean current = job.selectionRevision == job.revision;
            String source, reason;
            if ("api".equals(job.choice) && hasApi) {
                source = "api"; reason = "Original API result selected manually.";
            } else if ("local".equals(job.choice) && hasLocal) {
                source = "local"; reason = "Local result selected manually.";
            } else {
                source = current && "local".equals(job.selectedSource) && hasLocal ? "local" : hasApi ? "api" : "local";
                reason = current ? job.selectionReason : hasApi
                        ? "Comparison pending for the current API revision; retaining available original evidence."
                        : "Comparison pending; showing the retained local result. Review against the recording.";
                if (current && "uncertain".equals(job.selectedSource) && !hasApi) reason = "Review needed. " + reason;
                if (!"recommended".equals(job.choice)) reason = "Chosen source is unavailable. " + reason;
            }
            JSONObject speakerApi = speakerApi(job);
            boolean explicitSelf = job.selfTalker >= 0 && hasTalker(speakerApi, job.selfTalker);
            if (job.selfTalker >= 0 && !explicitSelf)
                reason += " Selected API self speaker is no longer available; using original identity. Review the speaker selection.";
            JSONObject selected;
            if ("api".equals(source)) {
                selected = explicitSelf ? new JSONObject(api.toString()).put("myTalkId", job.selfTalker) : api;
            } else {
                JSONObject mappingApi = explicitSelf
                        ? new JSONObject(speakerApi.toString()).put("myTalkId", job.selfTalker) : speakerApi;
                selected = AdotSpeakerMapping.resolve(local, mappingApi, job.selfChannel);
            }
            return new JSONObject().put("selected", selected)
                    .put("source", source).put("reason", reason).put("choice", job.choice).put("selfChannel", job.selfChannel)
                    .put("selfTalker", job.selfTalker).put("speakerApi", speakerApi == null ? JSONObject.NULL : speakerApi)
                    .put("recordingId", job.recordingId).put("briefingId", job.briefingId).put("audioUri", job.audio)
                    .put("api", hasApi ? api : JSONObject.NULL).put("local", hasLocal ? local : JSONObject.NULL);
        } catch (IOException | JSONException error) {
            throw new IllegalStateException("Unable to read retained summary result", error);
        }
    }
    private JSONObject speakerApi(Job job) throws JSONException {
        JSONObject journal = nativeJournal(job.recordingId, job.audio);
        if (journal == null) return null;
        JSONObject backup = new JSONObject(journal.getString("backup"));
        if (backup.optLong("recordingId", -1) != job.recordingId
                || !job.audio.equals(backup.optString("audioUri"))
                || job.briefingId > 0 && backup.optLong("briefingId") != job.briefingId
                || backup.optJSONObject("file") == null || backup.optJSONArray("briefing_info") == null
                || backup.optJSONArray("briefing_converted_text") == null
                || backup.optJSONArray("briefing_summary") == null
                || backup.optJSONArray("briefing_summary_title") == null) return null;
        // Only native recovery evidence authenticates speaker IDs; retained model/API JSON alone does not.
        return AdotSummaryNativeStore.document(backup);
    }

    static boolean hasChannel(JSONObject local, String channel) {
        JSONArray segments = local == null ? null : local.optJSONArray("segments");
        if (segments != null) for (int i = 0; i < segments.length(); i++) {
            JSONObject segment = segments.optJSONObject(i);
            if (segment != null && channel.equals(segment.optString("speaker"))) return true;
        }
        return false;
    }

    private static boolean hasTalker(JSONObject api, int talker) {
        JSONArray segments = api == null ? null : api.optJSONArray("segments");
        if (segments != null) for (int i = 0; i < segments.length(); i++) {
            JSONObject segment = segments.optJSONObject(i);
            if (segment != null && segment.optInt("talkerId", -1) == talker) return true;
        }
        return false;
    }

    void selfTalker(long id, int talker) {
        if (talker < -1) throw new IllegalArgumentException("Unknown self speaker");
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            Job job = find("id=?", new String[]{Long.toString(id)});
            if (job == null || talker >= 0 && !hasTalker(speakerApi(job), talker))
                throw new IllegalArgumentException("Selected API speaker is unavailable for this job");
            ContentValues values = new ContentValues(); values.put("self_talker_id", talker);
            if (talker >= 0) values.put("self_channel", "auto");
            db.update("jobs", values, "id=?", new String[]{Long.toString(id)});
            db.setTransactionSuccessful();
        } catch (JSONException error) {
            throw new IllegalStateException("Unable to read original API speakers", error);
        } finally { db.endTransaction(); }
        SummaryScheduler.applyNative(id);
    }

    void selfChannel(long id, String channel) {
        if (!("auto".equals(channel) || "Channel 1".equals(channel) || "Channel 2".equals(channel)))
            throw new IllegalArgumentException("Unknown self channel");
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            Job job = find("id=?", new String[]{Long.toString(id)});
            JSONObject local = job == null || job.localDocument.isEmpty() ? null : document(job.localDocument);
            if (job == null || !"auto".equals(channel) && !hasChannel(local, channel))
                throw new IllegalArgumentException("Selected channel is unavailable for this job");
            ContentValues values = new ContentValues(); values.put("self_channel", channel);
            db.update("jobs", values, "id=?", new String[]{Long.toString(id)});
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
        SummaryScheduler.applyNative(id);
    }

    void choose(long briefingId, String choice) {
        if (briefingId <= 0) throw new IllegalArgumentException("A valid briefing is required");
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            choose(db, find("briefing_id=?", new String[]{Long.toString(briefingId)}), choice);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
        Job job = briefing(briefingId);
        if (job != null) SummaryScheduler.applyNative(job.id);
    }
    void chooseJob(long id, String choice) {
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            choose(db, find("id=?", new String[]{Long.toString(id)}), choice);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
        SummaryScheduler.applyNative(id);
    }
    private void choose(SQLiteDatabase db, Job job, String choice) {
        if (!("recommended".equals(choice) || "api".equals(choice) || "local".equals(choice)))
            throw new IllegalArgumentException("Unknown result choice");
        JSONObject result = job == null ? null : presentation(job);
        if (result == null || !"recommended".equals(choice) && result.isNull(choice))
            throw new IllegalArgumentException("Selected result is unavailable");
        ContentValues values = new ContentValues(); values.put("choice", choice);
        db.update("jobs", values, "id=?", new String[]{Long.toString(job.id)});
    }

    Job job(long id) { return find("id=?", new String[]{Long.toString(id)}); }
    Job briefing(long id) { return find("briefing_id=?", new String[]{Long.toString(id)}); }

    JSONObject nativeJournal(long recordingId, String audio) {
        try (Cursor cursor = getReadableDatabase().rawQuery("SELECT * FROM native_journal WHERE recording_id=?",
                new String[]{Long.toString(recordingId)})) {
            if (!cursor.moveToFirst()) return null;
            if (!audio.equals(cursor.getString(cursor.getColumnIndexOrThrow("audio"))))
                throw new IllegalStateException("Native recording identity changed");
            JSONObject result = new JSONObject();
            for (String column : cursor.getColumnNames()) result.put(column, cursor.getString(cursor.getColumnIndexOrThrow(column)));
            return result;
        } catch (JSONException error) { throw new IllegalStateException(error); }
    }

    Set<Long> nativeSpeakerEdits(long recordingId, String audio) {
        Set<Long> result = new TreeSet<>();
        try (Cursor cursor = getReadableDatabase().rawQuery("SELECT audio,speaker_edits FROM native_journal WHERE recording_id=?",
                new String[]{Long.toString(recordingId)})) {
            if (!cursor.moveToFirst()) return result;
            if (!audio.equals(cursor.getString(0)))
                throw new IllegalStateException("Native recording identity changed");
            JSONArray edits = new JSONArray(cursor.getString(1));
            for (int i = 0; i < edits.length(); i++) result.add(edits.getLong(i));
            return result;
        } catch (JSONException error) { throw new IllegalStateException(error); }
    }

    void nativeSpeakerEdits(long recordingId, String audio, Set<Long> edits) {
        // Native row ownership survives observed snapshots; only replacement/restoration clears it.
        JSONArray sorted = new JSONArray();
        for (long id : new TreeSet<>(edits)) sorted.put(id);
        ContentValues values = new ContentValues(); values.put("speaker_edits", sorted.toString());
        if (getWritableDatabase().update("native_journal", values, "recording_id=? AND audio=?",
                new String[]{Long.toString(recordingId), audio}) != 1)
            throw new IllegalStateException("Native speaker edit journal is missing or its identity changed");
    }

    boolean nativeOwned(JSONObject snapshot) {
        JSONObject journal = nativeJournal(snapshot.optLong("recordingId"), snapshot.optString("audioUri"));
        if (journal == null) return false;
        String hash = nativeHash(snapshot);
        return hash.equals(journal.optString("expected_hash")) || hash.equals(journal.optString("applied_hash"));
    }

    void nativeBackup(JSONObject snapshot) {
        long recording = snapshot.optLong("recordingId");
        JSONObject old = nativeJournal(recording, snapshot.optString("audioUri"));
        if (nativeOwned(snapshot)) return;
        ContentValues values = new ContentValues();
        values.put("recording_id", recording); values.put("audio", snapshot.optString("audioUri"));
        values.put("briefing_id", snapshot.optLong("briefingId")); values.put("backup", snapshot.toString());
        if (old == null) getWritableDatabase().insertOrThrow("native_journal", null, values);
        else getWritableDatabase().update("native_journal", values, "recording_id=?", new String[]{Long.toString(recording)});
    }

    static String nativeHash(JSONObject snapshot) { return identity("native", snapshot.toString()); }
    static String nativeToken(JSONObject selection) {
        String token = identity("selection", selection.optString("source") + ":" + selection.optJSONObject("selected"));
        String content = nativeContentToken(selection);
        return content.isEmpty() ? token : content + ":" + token;
    }
    static String nativeContentToken(JSONObject selection) {
        String source = selection.optString("source");
        if ("api".equals(source)) {
            JSONObject api = selection.optJSONObject("api");
            return api == null ? "" : identity("selection-api-content", api.toString());
        }
        JSONObject local = selection.optJSONObject("local");
        return !"local".equals(source) || local == null ? "" : identity("selection-content", local.toString());
    }

    void nativeIntent(JSONObject after, JSONObject selection) {
        ContentValues values = new ContentValues();
        values.put("briefing_id", after.optLong("briefingId")); values.put("expected", after.toString());
        values.put("expected_hash", nativeHash(after)); values.put("token", nativeToken(selection));
        values.put("source", selection.optString("source")); values.put("committed", 0);
        if (getWritableDatabase().update("native_journal", values, "recording_id=? AND audio=?",
                new String[]{Long.toString(after.optLong("recordingId")), after.optString("audioUri")}) != 1)
            throw new IllegalStateException("Native backup is missing");
    }

    void nativeCommitted(JSONObject actual) {
        ContentValues values = new ContentValues(); values.put("applied_hash", nativeHash(actual)); values.put("committed", 1);
        JSONObject journal = nativeJournal(actual.optLong("recordingId"), actual.optString("audioUri"));
        if (journal == null) throw new IllegalStateException("Native commit journal is missing");
        values.put("applied", actual.toString()); values.put("applied_source", journal.optString("source"));
        values.put("applied_token", journal.optString("token"));
        if (getWritableDatabase().update("native_journal", values, "recording_id=? AND audio=? AND expected_hash=?",
                new String[]{Long.toString(actual.optLong("recordingId")), actual.optString("audioUri"), nativeHash(actual)}) != 1)
            throw new IllegalStateException("Native commit did not match its journal");
    }

    void nativeApiObserved(long recordingId) {
        ContentValues values = new ContentValues();
        values.put("expected", ""); values.put("expected_hash", "");
        values.put("token", ""); values.put("source", "");
        values.put("committed", 0); values.put("api_pending", 0);
        getWritableDatabase().update("native_journal", values, "recording_id=?", new String[]{Long.toString(recordingId)});
    }

    void nativePrune() {
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try { prune(db); db.setTransactionSuccessful(); }
        finally { db.endTransaction(); }
    }

    void nativeApiPending(long recordingId, boolean pending) {
        ContentValues values = new ContentValues(); values.put("api_pending", pending ? 1 : 0);
        if (pending) values.put("committed", 0);
        getWritableDatabase().update("native_journal", values, "recording_id=?", new String[]{Long.toString(recordingId)});
    }

    boolean nativeBeforeApi(JSONObject current) throws JSONException {
        return prepareNativeApi(current, true);
    }

    boolean nativeBeforePublication(JSONObject current) throws JSONException {
        return prepareNativeApi(current, false);
    }

    private boolean prepareNativeApi(JSONObject current, boolean parentWritten) throws JSONException {
        JSONObject journal = nativeJournal(current.getLong("recordingId"), current.getString("audioUri"));
        if (journal == null) return false;
        boolean expected = !journal.optString("expected").isEmpty()
                && AdotSummaryNativeStore.sameResultRows(current, new JSONObject(journal.getString("expected")));
        String source = journal.optString(expected ? "source" : "applied_source");
        if (!"local".equals(source) && (parentWritten || !"api".equals(source))) return false;
        String previous = journal.optString(expected ? "expected" : "applied");
        if (previous.isEmpty()) return false;
        JSONObject applied = new JSONObject(previous);
        if (!AdotSummaryNativeStore.containsOnlyOwnedRows(current, applied)) return false;
        JSONObject owned = AdotSummaryNativeStore.ownedSnapshot(current, applied, parentWritten);
        ContentValues values = new ContentValues();
        values.put("source", source); values.put("token", journal.optString(expected ? "token" : "applied_token"));
        values.put("expected", owned.toString()); values.put("expected_hash", nativeHash(owned));
        values.put("api_pending", 1); values.put("committed", 0);
        getWritableDatabase().update("native_journal", values, "recording_id=? AND audio=?",
                new String[]{Long.toString(current.optLong("recordingId")), current.optString("audioUri")});
        return true;
    }

    void nativeRecoveredIntent(JSONObject restored) {
        ContentValues values = new ContentValues();
        JSONObject journal = nativeJournal(restored.optLong("recordingId"), restored.optString("audioUri"));
        if (journal != null && nativeHash(restored).equals(journal.optString("applied_hash"))
                && !nativeHash(restored).equals(journal.optString("expected_hash"))) {
            values.put("source", journal.optString("applied_source"));
            values.put("token", journal.optString("applied_token"));
        }
        values.put("expected", restored.toString()); values.put("expected_hash", nativeHash(restored));
        values.put("committed", 0);
        getWritableDatabase().update("native_journal", values, "recording_id=? AND audio=?",
                new String[]{Long.toString(restored.optLong("recordingId")), restored.optString("audioUri")});
    }

    List<Long> nativePendingBriefings() {
        List<Long> result = new ArrayList<>();
        try (Cursor cursor = getReadableDatabase().rawQuery(
                "SELECT briefing_id FROM native_journal WHERE api_pending=1 OR (committed=0 AND expected<>'')", null)) {
            while (cursor.moveToNext()) result.add(cursor.getLong(0));
        }
        return result;
    }

    void nativeMapping(long recordingId, long communicationId) {
        if (recordingId <= 0 || communicationId == 0 || communicationId < -1) return;
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            long previous = nativeCommunication(recordingId);
            if (communicationId == -1 || previous != 0 && previous != communicationId) {
                ContentValues invalid = new ContentValues();
                invalid.put("recording_id", recordingId); invalid.put("communication_id", -1);
                db.insertWithOnConflict("native_associations", null, invalid, SQLiteDatabase.CONFLICT_REPLACE);
                db.setTransactionSuccessful();
                throw new IllegalStateException("Ambiguous native call mapping");
            }
            ContentValues values = new ContentValues();
            values.put("recording_id", recordingId); values.put("communication_id", communicationId);
            db.insertWithOnConflict("native_associations", null, values, SQLiteDatabase.CONFLICT_IGNORE);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
        Job job = find("recording_id=?", new String[]{Long.toString(recordingId)});
        if (job != null) SummaryScheduler.applyNative(job.id);
    }

    long nativeCommunication(long recordingId) {
        try (Cursor cursor = getReadableDatabase().rawQuery("SELECT communication_id FROM native_associations WHERE recording_id=?",
                new String[]{Long.toString(recordingId)})) {
            return cursor.moveToFirst() ? cursor.getLong(0) : 0;
        }
    }

    void nativeAssociation(long jobId, long recordingId, String audio, long briefingId) {
        ContentValues values = new ContentValues(); values.put("briefing_id", briefingId);
        int updated = getWritableDatabase().update("jobs", values, "id=? AND recording_id=? AND audio=? AND (briefing_id=0 OR briefing_id=?)",
                new String[]{Long.toString(jobId), Long.toString(recordingId), audio, Long.toString(briefingId)});
        if (updated != 1 && job(jobId) != null) throw new IllegalStateException("Native briefing association changed");
    }

    String nativeOutcome(Job job) {
        JSONObject selection = presentation(job);
        if (selection == null) return "pending";
        JSONObject journal = nativeJournal(job.recordingId, job.audio);
        if (journal == null || !"1".equals(journal.optString("committed")) || "1".equals(journal.optString("api_pending"))
                || !nativeToken(selection).equals(journal.optString("token"))) return "pending";
        return journal.optString("source", "pending");
    }
    private static JSONObject document(String json) {
        try {
            JSONObject result = new JSONObject(json);
            if (!(result.opt("title") instanceof String) || !(result.opt("summary") instanceof String)
                    || !(result.opt("segments") instanceof JSONArray)) throw new JSONException("Invalid candidate shape");
            return result;
        } catch (JSONException error) { throw new IllegalArgumentException("Invalid summary document", error); }
    }
    private static boolean hasTextContent(String value) {
        for (int offset = 0; offset < value.length();) {
            int codePoint = value.codePointAt(offset);
            if (Character.isLetterOrDigit(codePoint)) return true;
            offset += Character.charCount(codePoint);
        }
        return false;
    }
    private static boolean usable(JSONObject candidate) {
        if (candidate == null) return false;
        if (!candidate.optString("summary").trim().isEmpty()) return true;
        JSONArray segments = candidate.optJSONArray("segments");
        if (segments != null) for (int i = 0; i < segments.length(); i++) {
            JSONObject segment = segments.optJSONObject(i);
            if (segment != null && !segment.optString("text").trim().isEmpty()) return true;
        }
        return false;
    }
    private static JSONObject legacyDocument(String summary, String transcript) throws JSONException {
        JSONArray segments = new JSONArray();
        if (!transcript.isEmpty()) segments.put(new JSONObject().put("startMs", JSONObject.NULL)
                .put("endMs", JSONObject.NULL).put("speaker", "").put("text", transcript));
        return new JSONObject().put("title", "").put("summary", summary).put("segments", segments);
    }
    private void prune(SQLiteDatabase db) {
        List<Job> expired = new ArrayList<>();
        try (Cursor cursor = db.rawQuery("SELECT * FROM jobs WHERE state NOT IN ('queued','running','waiting') ORDER BY id DESC LIMIT -1 OFFSET 5", null)) {
            while (cursor.moveToNext()) expired.add(new Job(cursor));
        }
        for (Job job : expired) {
            // Hidden completed candidates remain durable until the exact current selection reaches native storage.
            if ("ready".equals(job.state) && !job.localDocument.isEmpty() && "pending".equals(nativeOutcome(job))) continue;
            retire(db, job);
            if (!leased(db, job.id)) removeOwned(job.id);
            db.delete("jobs", "id=?", new String[]{Long.toString(job.id)});
        }
    }
    private static boolean leased(SQLiteDatabase db, long id) {
        try (Cursor cursor = db.rawQuery("SELECT 1 FROM leases WHERE job_id=?", new String[]{Long.toString(id)})) {
            return cursor.moveToFirst();
        }
    }
    private void cleanOrphans(SQLiteDatabase db) {
        File[] files = directory.listFiles();
        if (files == null) return;
        for (File file : files) {
            long id;
            try { id = Long.parseLong(file.getName()); }
            catch (NumberFormatException unrelated) { continue; }
            if (find("id=?", new String[]{Long.toString(id)}) == null && !leased(db, id)) removeOwned(id);
        }
    }
    private void removeOwned(long id) {
        try { remove(new File(directory, Long.toString(id))); }
        catch (IOException error) { throw new IllegalStateException("Unable to prune private result files", error); }
    }
    private static String identity(String kind, String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest((kind + ":" + value).getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder(64);
            for (byte b : digest) hex.append(Character.forDigit((b & 255) >>> 4, 16)).append(Character.forDigit(b & 15, 16));
            return hex.toString();
        } catch (NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }
    private static String[] identities(long recordingId, long briefingId, String audio) {
        return new String[]{identity("audio", audio), identity("recording", Long.toString(recordingId)),
                identity("briefing", Long.toString(briefingId))};
    }
    private static boolean retired(SQLiteDatabase db, long recordingId, long briefingId, String audio) {
        String[] keys = identities(recordingId, briefingId, audio);
        try (Cursor cursor = db.rawQuery("SELECT 1 FROM retired WHERE identity=?"
                + (recordingId > 0 ? " OR identity=?" : "") + (briefingId > 0 ? " OR identity=?" : "") + " LIMIT 1",
                recordingId > 0 && briefingId > 0 ? keys : recordingId > 0 ? new String[]{keys[0], keys[1]}
                        : briefingId > 0 ? new String[]{keys[0], keys[2]} : new String[]{keys[0]})) {
            return cursor.moveToFirst();
        }
    }
    private static void retire(SQLiteDatabase db, Job job) {
        String[] keys = identities(job.recordingId, job.briefingId, job.audio);
        for (int i = 0; i < keys.length; i++) {
            if (i == 1 && job.recordingId <= 0 || i == 2 && job.briefingId <= 0) continue;
            ContentValues values = new ContentValues(); values.put("identity", keys[i]);
            db.insertWithOnConflict("retired", null, values, SQLiteDatabase.CONFLICT_IGNORE);
        }
    }
    private static void write(File file, String text) throws IOException {
        AtomicFile atomic = new AtomicFile(file); FileOutputStream output = atomic.startWrite();
        try { output.write(text.getBytes(StandardCharsets.UTF_8)); atomic.finishWrite(output); }
        catch (IOException | RuntimeException error) { atomic.failWrite(output); throw error; }
    }
    void clear() throws IOException {
        if (!OFF.equals(mode())) throw new IOException("Turn off local summaries before deleting their data");
        SQLiteDatabase db = getWritableDatabase(); db.beginTransaction();
        try {
            for (Job job : list()) retire(db, job);
            db.delete("jobs", null, null);
            db.delete("leases", null, null);
            remove(directory);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }
    static void remove(File file) throws IOException {
        if (Files.isSymbolicLink(file.toPath())) {
            if (!file.delete()) throw new IOException("Unable to delete private summary link");
            return;
        }
        if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children == null) throw new IOException("Unable to list private summary files");
            for (File child : children) remove(child);
        }
        if (file.exists() && !file.delete()) throw new IOException("Unable to delete private summary data");
    }
    static final class Job {
        final long id, recordingId, briefingId, created;
        final int revision, selectionRevision, selfTalker;
        final boolean quota;
        final String audio, original, state, reason, transcript, summary;
        final String apiDocument, localDocument, selectedSource, selectionReason, choice, selfChannel;
        Job(Cursor cursor) {
            id = number(cursor, "id"); recordingId = number(cursor, "recording_id"); briefingId = number(cursor, "briefing_id");
            created = number(cursor, "created"); revision = (int) number(cursor, "revision"); quota = number(cursor, "quota") != 0;
            audio = value(cursor, "audio"); original = value(cursor, "original"); state = value(cursor, "state");
            reason = value(cursor, "reason"); transcript = value(cursor, "transcript"); summary = value(cursor, "summary");
            apiDocument = value(cursor, "api_document"); localDocument = value(cursor, "local_document");
            selectedSource = value(cursor, "selected_source"); selectionReason = value(cursor, "selection_reason");
            selectionRevision = (int) number(cursor, "selection_revision"); choice = value(cursor, "choice");
            selfChannel = value(cursor, "self_channel");
            selfTalker = (int) number(cursor, "self_talker_id");
        }
        private static long number(Cursor cursor, String name) { return cursor.getLong(cursor.getColumnIndexOrThrow(name)); }
        private static String value(Cursor cursor, String name) { return cursor.getString(cursor.getColumnIndexOrThrow(name)); }
    }
}
