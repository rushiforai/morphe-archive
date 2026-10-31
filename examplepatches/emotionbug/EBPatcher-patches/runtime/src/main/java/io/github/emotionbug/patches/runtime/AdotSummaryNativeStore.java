package io.github.emotionbug.patches.runtime;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Exact 14409 canonical tables. Uses the captured Room connection, never opens another database. */
final class AdotSummaryNativeStore {
    private AdotSummaryNativeStore() { }
    private static final String[] JOURNAL_ROWS = {"expected", "applied"};
    private static final String[] TABLES = {"briefing_converted_text", "briefing_summary_title", "briefing_summary"};
    private static final String[] COLUMNS = {
        "_id,briefing_info_id,sequence,message,talker_id,is_edited,talk_time,talk_duration",
        "_id,briefing_info_id,summary_title",
        "_id,briefing_info_id,message_sequence,summary,summary_title_id"
    };

    /** Caller holds a native transaction. Includes empty/API-unavailable calls and all original row IDs. */
    static JSONObject snapshot(SQLiteDatabase db, long recording, String audio) throws JSONException {
        JSONObject file;
        try (Cursor cursor = db.rawQuery("SELECT _id,briefing_info_id,content_uri,duration_in_ms,file_size_in_bytes,file_create_time_in_ms,cr_date "
                + "FROM call_record_file WHERE _id=? AND content_uri=?", new String[]{Long.toString(recording), audio})) {
            if (!cursor.moveToFirst()) return null;
            file = row(cursor);
            if (cursor.moveToNext() || file.optLong("file_size_in_bytes") <= 0) return null;
        }
        long briefing = file.optLong("briefing_info_id", 0);
        JSONObject result = new JSONObject().put("recordingId", recording).put("audioUri", audio)
                .put("briefingId", briefing).put("file", file);
        JSONArray info = rows(db, "SELECT * FROM briefing_info WHERE _id=? AND deleted=0", briefing);
        if (briefing > 0 && info.length() != 1) return null;
        result.put("briefing_info", info);
        for (int i = 0; i < TABLES.length; i++)
            result.put(TABLES[i], rows(db, "SELECT " + COLUMNS[i] + " FROM " + TABLES[i] + " WHERE briefing_info_id=? ORDER BY _id", briefing));
        return result;
    }

    static boolean localRows(SummaryStore store, JSONObject current) throws JSONException {
        JSONObject journal = store.nativeJournal(current.getLong("recordingId"), current.getString("audioUri"));
        if (journal == null) return false;
        for (String key : JOURNAL_ROWS) {
            String source = journal.optString(key.equals("expected") ? "source" : "applied_source");
            String rows = journal.optString(key);
            if (!"local".equals(source) || rows.isEmpty()) continue;
            boolean committedIdentity = key.equals("applied") || "1".equals(journal.optString("api_pending"))
                    || SummaryStore.nativeHash(current).equals(journal.optString("expected_hash"));
            if (committedIdentity && containsOnlyOwnedRows(current, new JSONObject(rows))) return true;
        }
        return false;
    }
    private static boolean containsLocalRows(SummaryStore store, JSONObject current) throws JSONException {
        if (localRows(store, current)) return true;
        JSONObject journal = store.nativeJournal(current.getLong("recordingId"), current.getString("audioUri"));
        if (journal == null) return false;
        for (String key : JOURNAL_ROWS) {
            if (!"local".equals(journal.optString(key.equals("expected") ? "source" : "applied_source"))
                    || journal.optString(key).isEmpty()) continue;
            if (!key.equals("applied") && !"1".equals(journal.optString("api_pending"))
                    && !SummaryStore.nativeHash(current).equals(journal.optString("expected_hash"))) continue;
            JSONObject owned = new JSONObject(journal.getString(key));
            if (owned.getLong("briefingId") != current.getLong("briefingId")) continue;
            for (String table : TABLES) {
                JSONArray old = owned.getJSONArray(table), rows = current.getJSONArray(table);
                int previous = 0;
                for (int i = 0; i < rows.length(); i++) {
                    long id = rows.getJSONObject(i).getLong("_id");
                    while (previous < old.length() && old.getJSONObject(previous).getLong("_id") < id) previous++;
                    if (previous < old.length() && old.getJSONObject(previous).getLong("_id") == id) return true;
                }
            }
        }
        return false;
    }


    private static boolean selectedApiRows(SummaryStore store, JSONObject current) throws JSONException {
        JSONObject journal = store.nativeJournal(current.getLong("recordingId"), current.getString("audioUri"));
        if (journal == null || !"api".equals(journal.optString("applied_source"))
                || journal.optString("applied").isEmpty()) return false;
        // Native user edits and our self-ID correction are not another server response.
        return containsOnlyOwnedRows(current, new JSONObject(journal.getString("applied")));
    }

    /** Capture canonical API evidence before a queued local apply can replace it. */
    static boolean captureApi(SummaryStore store, JSONObject raw) throws JSONException {
        return captureApi(store, raw, false);
    }

    private static boolean captureApi(SummaryStore store, JSONObject raw, boolean authenticated) throws JSONException {
        if (raw == null || raw.getJSONArray("briefing_info").length() != 1 || store.nativeOwned(raw)
                || containsLocalRows(store, raw) || !authenticated && selectedApiRows(store, raw)
                || raw.getJSONArray("briefing_converted_text").length() == 0 && raw.getJSONArray("briefing_summary").length() == 0) return false;
        JSONObject journal = store.nativeJournal(raw.getLong("recordingId"), raw.getString("audioUri"));
        if (journal != null && journal.optLong("briefing_id") != raw.getLong("briefingId")
                && !journal.optString("applied_hash").isEmpty()) return false;
        store.nativeBackup(raw);
        JSONObject document = document(raw);
        SummaryStore.Job recorded = store.briefing(raw.getLong("briefingId"));
        if (recorded != null && recorded.recordingId == raw.getLong("recordingId")
                && recorded.audio.equals(raw.getString("audioUri")) && document.toString().equals(recorded.apiDocument)) return true;
        store.event(raw.getLong("recordingId"), raw.getLong("briefingId"), Uri.parse(raw.getString("audioUri")),
                false, document.getString("summary"), document.toString());
        return true;
    }

    static void captureOriginal(SummaryStore store, JSONObject current, AdotApiSnapshot original) throws JSONException {
        JSONObject journal = store.nativeJournal(current.getLong("recordingId"), current.getString("audioUri"));
        JSONObject candidate = localRows(store, current)
                ? new JSONObject(journal.getString("backup")) : current;
        // A queued completion is not authority over another generation or a native user edit.
        // Keep the coherent persisted snapshot; never splice in a detached callback self ID.
        if (!original.matches(candidate)) return;
        captureApi(store, candidate, true);
    }

    /** Pending describes an interrupted callback, not proof that the original API transaction rolled back. */
    static JSONObject recover(SQLiteDatabase db, SummaryStore store, long briefing) throws JSONException {
        if (!db.inTransaction()) throw new IllegalStateException("Native recovery requires a transaction");
        if (AdotApiPublication.active()) return null;
        long recording = recording(db, briefing);
        String audio = audio(db, recording);
        if (audio == null) return null;
        JSONObject journal = store.nativeJournal(recording, audio);
        if (journal == null || journal.optString("expected").isEmpty()
                || !"1".equals(journal.optString("api_pending")) && !"0".equals(journal.optString("committed"))) return null;
        JSONObject current = snapshot(db, recording, audio);
        if (current == null) return null;
        if (captureApi(store, current)) {
            store.nativeApiObserved(recording);
            return null;
        }
        restore(db, new JSONObject(journal.getString("expected")), briefing);
        JSONObject restored = snapshot(db, recording, audio);
        store.nativeRecoveredIntent(restored);
        store.nativeApiPending(recording, false);
        return restored;
    }

    /** Caller owns the Room transaction. Read the latest selection only after acquiring its write lock. */
    static JSONObject select(SQLiteDatabase db, SummaryStore store, long jobId) throws JSONException {
        if (!db.inTransaction()) throw new IllegalStateException("Native selection requires a transaction");
        // Native yx9.r writes parent metadata before child rows in separate transactions.
        // Holding this write transaction makes admission atomic relative to that parent write.
        if (AdotApiPublication.active()) return null;
        SummaryStore.Job job = store.job(jobId);
        if (job == null) return null;
        JSONObject before = snapshot(db, job.recordingId, job.audio);
        if (before == null) return null;
        if (job.briefingId > 0 && job.briefingId != before.getLong("briefingId")) return null;
        JSONObject journal = store.nativeJournal(job.recordingId, job.audio);
        if (journal != null && "1".equals(journal.optString("api_pending"))) return null;
        if (journal != null && journal.optLong("briefing_id") != before.getLong("briefingId")
                && !journal.optString("applied_hash").isEmpty()) return null;
        captureApi(store, before);
        job = store.job(jobId);
        if (job == null) return null;
        JSONObject selection = store.presentation(job);
        if (selection == null) return null;
        journal = store.nativeJournal(job.recordingId, job.audio);
        long briefing = before.getLong("briefingId");
        if (briefing <= 0) {
            if (job.briefingId > 0 || journal != null && !journal.optString("applied_hash").isEmpty()) return null;
            briefing = associate(db, store, job, before);
            if (briefing <= 0) return null;
            before = snapshot(db, job.recordingId, job.audio);
            if (before == null) throw new IllegalStateException("Native association disappeared");
        }
        if (job.briefingId > 0 && briefing != job.briefingId) return null;
        if (journal != null && journal.optLong("briefing_id") != briefing) {
            if (!journal.optString("applied_hash").isEmpty()) return null;
            // A journal can outlive a rolled-back first association; never reuse its uncommitted ID.
            store.nativeBackup(before);
            journal = store.nativeJournal(job.recordingId, job.audio);
            selection = store.presentation(job);
        }
        if (journal == null) {
            store.nativeBackup(before);
            journal = store.nativeJournal(job.recordingId, job.audio);
            selection = store.presentation(job);
        }
        if (selection == null) return null;
        boolean sameSelection = SummaryStore.nativeToken(selection).equals(journal.optString("token"));
        boolean sameRows = SummaryStore.nativeHash(before).equals(journal.optString("expected_hash"));
        if (sameSelection && sameRows) return before;
        // Native user edits are preserved until the selected result itself changes.
        if (sameSelection && "1".equals(journal.optString("committed"))) return null;
        if ("local".equals(selection.getString("source"))) {
            JSONObject selected = selection.getJSONObject("selected");
            JSONObject previous = "local".equals(journal.optString("source")) && !journal.optString("expected").isEmpty()
                    ? new JSONObject(journal.getString("expected")) : null;
            String contentToken = SummaryStore.nativeContentToken(selection);
            boolean sameContent = !contentToken.isEmpty() && journal.optString("token").startsWith(contentToken + ":");
            if (previous != null && containsOnlyOwnedRows(before, previous)
                    && (sameContent || sameLocalContent(previous, selected))) {
                if (!remapSpeakers(db, store, before, previous, selected)) return null;
            } else {
                local(db, before, selected, 300);
                store.nativeSpeakerEdits(job.recordingId, job.audio, java.util.Collections.emptySet());
            }
        } else {
            JSONObject backup = new JSONObject(journal.getString("backup"));
            JSONObject previous = "api".equals(journal.optString("source")) && !journal.optString("expected").isEmpty()
                    ? new JSONObject(journal.getString("expected")) : null;
            String contentToken = SummaryStore.nativeContentToken(selection);
            boolean continuedApi = previous != null && (journal.optString("token").startsWith(contentToken + ":")
                    || SummaryStore.nativeHash(previous).equals(SummaryStore.nativeHash(backup)));
            if (!continuedApi && !SummaryStore.nativeHash(before).equals(SummaryStore.nativeHash(backup)))
                restore(db, backup, briefing);
            int self = selection.getJSONObject("selected").getInt("myTalkId");
            int currentSelf = before.getJSONArray("briefing_info").getJSONObject(0).getInt("my_talk_id");
            int previousSelf = previous == null ? currentSelf
                    : previous.getJSONArray("briefing_info").getJSONObject(0).getInt("my_talk_id");
            if (!continuedApi || currentSelf == previousSelf || self != previousSelf || job.selfTalker >= 0) {
                ContentValues identity = new ContentValues(); identity.put("my_talk_id", self);
                if (db.update("briefing_info", identity, "_id=? AND deleted=0", new String[]{Long.toString(briefing)}) != 1)
                    throw new IllegalStateException("Native call disappeared");
            }
            store.nativeSpeakerEdits(job.recordingId, job.audio, java.util.Collections.emptySet());
        }
        JSONObject after = snapshot(db, job.recordingId, job.audio);
        store.nativeIntent(after, selection); // Durable expected rows BEFORE the native commit.
        return after;
    }

    static long briefingForServer(SQLiteDatabase db, long serverId) {
        if (serverId <= 0) return 0;
        try (Cursor cursor = db.rawQuery("SELECT _id FROM briefing_info WHERE briefing_server_id=? AND deleted=0",
                new String[]{Long.toString(serverId)})) {
            if (!cursor.moveToFirst()) return 0;
            long briefing = cursor.getLong(0);
            return cursor.moveToNext() ? 0 : briefing;
        }
    }

    static void preparePublication(SQLiteDatabase db, SummaryStore store, long briefing) throws JSONException {
        if (!db.inTransaction()) throw new IllegalStateException("Native publication requires a transaction");
        if (briefing <= 0) return;
        long recording = recording(db, briefing);
        String audio = audio(db, recording);
        JSONObject current = audio == null ? null : snapshot(db, recording, audio);
        if (current != null) store.nativeBeforePublication(current);
    }

    static long recording(SQLiteDatabase db, long briefing) {
        try (Cursor c = db.rawQuery("SELECT _id FROM call_record_file WHERE briefing_info_id=?", new String[]{Long.toString(briefing)})) {
            if (!c.moveToFirst()) return 0;
            long result = c.getLong(0);
            return c.moveToNext() ? 0 : result;
        }
    }
    static String audio(SQLiteDatabase db, long recording) {
        try (Cursor c = db.rawQuery("SELECT content_uri FROM call_record_file WHERE _id=?", new String[]{Long.toString(recording)})) {
            return c.moveToFirst() ? c.getString(0) : null;
        }
    }

    /** Uses only the original mv4 mapping. Neither phone number nor timestamp is an association key. */
    static long associate(SQLiteDatabase db, SummaryStore store, SummaryStore.Job job, JSONObject before) throws JSONException {
        if (!db.inTransaction() || before.getLong("recordingId") != job.recordingId
                || !before.getString("audioUri").equals(job.audio)) throw new IllegalStateException("Unbound native association");
        long communication = store.nativeCommunication(job.recordingId);
        if (communication <= 0) return 0;
        long date;
        try (Cursor cursor = db.rawQuery("SELECT cl_date FROM communication_log WHERE cl_id=? AND cl_deleted=0",
                new String[]{Long.toString(communication)})) {
            if (!cursor.moveToFirst()) return 0;
            date = cursor.getLong(0);
        }
        long briefing = 0;
        try (Cursor cursor = db.rawQuery("SELECT _id FROM briefing_info WHERE communication_log_id=? AND deleted=0",
                new String[]{Long.toString(communication)})) {
            if (cursor.moveToFirst()) {
                briefing = cursor.getLong(0);
                if (cursor.moveToNext()) return 0;
            }
        }
        if (briefing > 0) {
            try (Cursor cursor = db.rawQuery("SELECT _id FROM call_record_file WHERE briefing_info_id=?",
                    new String[]{Long.toString(briefing)})) {
                if (cursor.moveToFirst() && (cursor.getLong(0) != job.recordingId || cursor.moveToNext())) return 0;
            }
        } else {
            long now = System.currentTimeMillis();
            ContentValues values = new ContentValues();
            values.put("communication_log_id", communication); values.put("call_create_time_in_millis", date);
            values.put("convert_state", 300); values.put("upload_type", 0); values.put("briefing_source_type", 3);
            values.put("my_talk_id", 0); values.put("deleted", 0); values.put("cr_date", now); values.put("modified_date", now);
            // COMPLETE + no upload/server/file keys: local completion cannot enqueue a native upload.
            briefing = db.insertOrThrow("briefing_info", null, values);
        }
        ContentValues link = new ContentValues(); link.put("briefing_info_id", briefing);
        if (db.update("call_record_file", link, "_id=? AND content_uri=? AND (briefing_info_id IS NULL OR briefing_info_id=0)",
                new String[]{Long.toString(job.recordingId), job.audio}) != 1)
            throw new IllegalStateException("Native file was associated concurrently");
        return briefing;
    }

    static boolean containsOnlyOwnedRows(JSONObject current, JSONObject applied) throws JSONException {
        if (current.getLong("recordingId") != applied.getLong("recordingId")
                || current.getLong("briefingId") != applied.getLong("briefingId")
                || !current.getString("audioUri").equals(applied.getString("audioUri"))) return false;
        for (String table : TABLES) {
            if (table.equals("briefing_summary_title")) continue;
            JSONArray old = applied.getJSONArray(table), rows = current.getJSONArray(table);
            int previous = 0; // Canonical snapshots order every table by its real primary key.
            for (int i = 0; i < rows.length(); i++) {
                long id = rows.getJSONObject(i).getLong("_id");
                while (previous < old.length() && old.getJSONObject(previous).getLong("_id") < id) previous++;
                if (previous == old.length() || old.getJSONObject(previous).getLong("_id") != id) return false;
            }
        }
        return true;
    }

    static boolean sameResultRows(JSONObject current, JSONObject expected) throws JSONException {
        for (String table : TABLES) {
            JSONArray rows = current.getJSONArray(table), wanted = expected.getJSONArray(table);
            if (!table.equals("briefing_summary_title") && rows.length() != wanted.length()) return false;
            int position = 0;
            for (int i = 0; i < wanted.length(); i++) {
                JSONObject row = wanted.getJSONObject(i);
                while (position < rows.length() && rows.getJSONObject(position).getLong("_id") < row.getLong("_id")) position++;
                if (position == rows.length() || !row.toString().equals(rows.getJSONObject(position).toString())) return false;
            }
        }
        return true;
    }

    static JSONObject ownedSnapshot(JSONObject current, JSONObject applied, boolean parentWritten) throws JSONException {
        JSONObject result = new JSONObject(current.toString());
        // API parent metadata precedes the child transaction. Rollback needs the
        // last local presentation, not fresh API identity joined to old local rows.
        if (parentWritten) {
            JSONObject parent = result.getJSONArray("briefing_info").getJSONObject(0);
            JSONObject localParent = applied.getJSONArray("briefing_info").getJSONObject(0);
            for (String key : new String[]{"call_title", "convert_state", "my_talk_id"})
                parent.put(key, localParent.get(key));
        }
        JSONArray titles = new JSONArray(), rows = current.getJSONArray("briefing_summary_title");
        JSONArray old = applied.getJSONArray("briefing_summary_title");
        int previous = 0;
        for (int i = 0; i < rows.length(); i++) {
            JSONObject row = rows.getJSONObject(i);
            while (previous < old.length() && old.getJSONObject(previous).getLong("_id") < row.getLong("_id")) previous++;
            if (previous < old.length() && row.getLong("_id") == old.getJSONObject(previous).getLong("_id")) titles.put(row);
        }
        result.put("briefing_summary_title", titles);
        return result;
    }

    static JSONObject document(JSONObject raw) throws JSONException {
        JSONObject info = raw.getJSONArray("briefing_info").optJSONObject(0);
        JSONObject file = raw.getJSONObject("file");
        long duration = file.optLong("duration_in_ms");
        JSONArray segments = new JSONArray(), summaries = raw.getJSONArray("briefing_summary"), titles = raw.getJSONArray("briefing_summary_title");
        JSONArray nativeRows = new JSONArray();
        StringBuilder text = new StringBuilder();
        long lastTitle = -1;
        // Native display order is message_sequence, then row ID; snapshots retain ID order for exact journals.
        java.util.ArrayList<JSONObject> ordered = new java.util.ArrayList<>();
        for (int i = 0; i < summaries.length(); i++) ordered.add(summaries.getJSONObject(i));
        ordered.sort((a, b) -> { int order = Long.compare(a.optLong("message_sequence"), b.optLong("message_sequence"));
            return order != 0 ? order : Long.compare(a.optLong("_id"), b.optLong("_id")); });
        for (JSONObject summary : ordered) {
            long titleId = summary.optLong("summary_title_id", -1); String title = null;
            for (int j = 0; j < titles.length(); j++) if (titles.getJSONObject(j).optLong("_id") == titleId)
                title = titles.getJSONObject(j).optString("summary_title");
            if (titleId != lastTitle) { append(text, title); lastTitle = titleId; }
            append(text, summary.isNull("summary") ? null : summary.getString("summary"));
            nativeRows.put(new JSONObject().put("id", summary.getLong("_id")).put("text", summary.opt("summary"))
                    .put("titleId", summary.opt("summary_title_id")).put("title", title == null ? JSONObject.NULL : title)
                    .put("sequence", summary.optLong("message_sequence")));
        }
        JSONArray rows = raw.getJSONArray("briefing_converted_text");
        ordered.clear();
        for (int i = 0; i < rows.length(); i++) ordered.add(rows.getJSONObject(i));
        ordered.sort((a, b) -> Long.compare(a.optLong("sequence"), b.optLong("sequence")));
        for (JSONObject row : ordered) {
            long start = row.optLong("talk_time"), length = row.optLong("talk_duration");
            boolean timed = start >= 0 && length > 0 && duration > 0 && start < duration;
            segments.put(new JSONObject().put("text", row.getString("message"))
                    .put("speaker", "API speaker " + row.optInt("talker_id"))
                    .put("startMs", timed ? start : JSONObject.NULL)
                    .put("endMs", timed ? start + Math.min(length, duration - start) : JSONObject.NULL)
                    .put("nativeId", row.getLong("_id")).put("sequence", row.optInt("sequence"))
                    .put("talkerId", row.optInt("talker_id")).put("talkTimeMs", start).put("talkDurationMs", length)
                    .put("edited", row.optInt("is_edited") != 0));
        }
        return new JSONObject().put("title", info == null || info.isNull("call_title") ? "" : info.getString("call_title"))
                .put("summary", text.toString()).put("segments", segments).put("nativeSummaryRows", nativeRows)
                .put("myTalkId", info == null ? JSONObject.NULL : info.getInt("my_talk_id"))
                .put("recordingId", raw.getLong("recordingId")).put("briefingId", raw.getLong("briefingId"))
                .put("audioUri", raw.getString("audioUri")).put("durationMs", duration);
    }

    /** Only presentation columns change; upload/server IDs, modified dates, tasks and sync queues stay untouched. */
    static void local(SQLiteDatabase db, JSONObject before, JSONObject selected, int completeState) throws JSONException {
        long briefing = before.getLong("briefingId");
        if (briefing <= 0) throw new IllegalStateException("Native briefing association is not ready");
        long duration = before.getJSONObject("file").getLong("duration_in_ms");
        clear(db, briefing);
        ContentValues values = new ContentValues();
        values.put("call_title", selected.getString("title")); values.put("convert_state", completeState);
        values.put("my_talk_id", selected.getInt("myTalkId"));
        JSONArray segments = selected.getJSONArray("segments");
        int sequence = 0;
        for (int i = 0; i < segments.length(); i++) {
            JSONObject segment = segments.getJSONObject(i);
            String message = segment.getString("text");
            if (message.trim().isEmpty()) continue;
            long start = segment.optLong("startMs", -1), end = segment.optLong("endMs", -1);
            boolean timed = !segment.isNull("startMs") && !segment.isNull("endMs")
                    && start >= 0 && end > start && duration > 0 && start < duration && end <= duration;
            ContentValues row = new ContentValues(); row.put("briefing_info_id", briefing); row.put("sequence", sequence++);
            row.put("message", message); row.put("talker_id", segment.getInt("talkerId")); row.put("is_edited", 0);
            row.put("talk_time", timed ? start : 0); row.put("talk_duration", timed ? end - start : 0);
            db.insertOrThrow("briefing_converted_text", null, row);
        }
        String title = selected.getString("title"), summary = selected.getString("summary");
        Long titleId = null;
        if (!title.isEmpty()) {
            ContentValues row = new ContentValues(); row.put("briefing_info_id", briefing); row.put("summary_title", title);
            titleId = db.insertOrThrow("briefing_summary_title", null, row);
        }
        if (!summary.isEmpty()) {
            ContentValues row = new ContentValues(); row.put("briefing_info_id", briefing);
            // No fabricated link to an utterance: a summary without a known source span has no seek target.
            row.put("message_sequence", -1); row.put("summary", summary);
            if (titleId == null) row.putNull("summary_title_id"); else row.put("summary_title_id", titleId);
            db.insertOrThrow("briefing_summary", null, row);
        }
        if (db.update("briefing_info", values, "_id=? AND deleted=0", new String[]{Long.toString(briefing)}) != 1)
            throw new IllegalStateException("Native call disappeared");
    }

    /** A mapping-only upgrade must not recreate rows, reset user edits, or change native seek targets. */
    private static boolean sameLocalContent(JSONObject previous, JSONObject selected) throws JSONException {
        JSONObject info = previous.getJSONArray("briefing_info").getJSONObject(0);
        if (!selected.getString("title").equals(info.optString("call_title"))) return false;
        JSONArray summaries = previous.getJSONArray("briefing_summary");
        String summary = selected.getString("summary");
        if (summaries.length() != (summary.isEmpty() ? 0 : 1)
                || !summary.isEmpty() && !summary.equals(summaries.getJSONObject(0).optString("summary"))) return false;
        JSONArray rows = previous.getJSONArray("briefing_converted_text"), segments = selected.getJSONArray("segments");
        long duration = previous.getJSONObject("file").getLong("duration_in_ms");
        int sequence = 0;
        for (int i = 0; i < segments.length(); i++) {
            JSONObject segment = segments.getJSONObject(i);
            String text = segment.getString("text");
            if (text.trim().isEmpty()) continue;
            if (sequence >= rows.length()) return false;
            JSONObject row = rows.getJSONObject(sequence);
            if (row.getInt("sequence") != sequence++ || !text.equals(row.getString("message"))) return false;
            long start = segment.optLong("startMs", -1), end = segment.optLong("endMs", -1);
            boolean timed = !segment.isNull("startMs") && !segment.isNull("endMs")
                    && start >= 0 && end > start && duration > 0 && start < duration && end <= duration;
            if (row.getLong("talk_time") != (timed ? start : 0)
                    || row.getLong("talk_duration") != (timed ? end - start : 0)) return false;
        }
        return sequence == rows.length();
    }

    private static boolean remapSpeakers(SQLiteDatabase db, SummaryStore store, JSONObject current,
            JSONObject previous, JSONObject selected) throws JSONException {
        JSONObject info = current.getJSONArray("briefing_info").getJSONObject(0);
        // A user-adjusted native self identity is not evidence that an automatic remapping is wanted.
        if (info.getInt("my_talk_id") != previous.getJSONArray("briefing_info").getJSONObject(0).getInt("my_talk_id"))
            return false;
        long briefing = current.getLong("briefingId");
        JSONArray rows = previous.getJSONArray("briefing_converted_text"), segments = selected.getJSONArray("segments");
        java.util.Set<Long> edited = store.nativeSpeakerEdits(current.getLong("recordingId"), current.getString("audioUri"));
        java.util.Map<Long, Integer> actualIds = new java.util.HashMap<>();
        JSONArray actualRows = current.getJSONArray("briefing_converted_text");
        for (int i = 0; i < actualRows.length(); i++) {
            JSONObject row = actualRows.getJSONObject(i);
            actualIds.put(row.getLong("_id"), row.getInt("talker_id"));
        }
        int sequence = 0, position = 0;
        for (int i = 0; i < segments.length(); i++) {
            JSONObject segment = segments.getJSONObject(i);
            if (segment.getString("text").trim().isEmpty()) continue;
            int selectedSequence = sequence++;
            while (position < rows.length() && rows.getJSONObject(position).getInt("sequence") < selectedSequence) position++;
            if (position == rows.length() || rows.getJSONObject(position).getInt("sequence") != selectedSequence) continue;
            JSONObject row = rows.getJSONObject(position++);
            long rowId = row.getLong("_id");
            Integer actualId = actualIds.get(rowId);
            if (actualId == null || edited.contains(rowId)) continue;
            if (actualId != row.getInt("talker_id")) {
                edited.add(rowId);
                continue;
            }
            ContentValues values = new ContentValues();
            values.put("talker_id", segment.getInt("talkerId"));
            // Missing rows and independently changed native speaker IDs are user edits; leave them alone.
            db.update("briefing_converted_text", values, "_id=? AND briefing_info_id=? AND talker_id=?",
                    new String[]{Long.toString(row.getLong("_id")), Long.toString(briefing), row.getString("talker_id")});
        }
        store.nativeSpeakerEdits(current.getLong("recordingId"), current.getString("audioUri"), edited);
        ContentValues values = new ContentValues(); values.put("my_talk_id", selected.getInt("myTalkId"));
        if (db.update("briefing_info", values, "_id=? AND deleted=0", new String[]{Long.toString(briefing)}) != 1)
            throw new IllegalStateException("Native call disappeared");
        return true;
    }

    static void restore(SQLiteDatabase db, JSONObject backup, long briefing) throws JSONException {
        if (backup.getLong("briefingId") != briefing) throw new IllegalStateException("Native restoration identity changed");
        JSONObject info = backup.getJSONArray("briefing_info").getJSONObject(0);
        clear(db, briefing);
        ContentValues values = new ContentValues();
        for (String key : new String[]{"call_title", "convert_state", "my_talk_id"}) put(values, key, info.get(key));
        if (db.update("briefing_info", values, "_id=? AND deleted=0", new String[]{Long.toString(briefing)}) != 1)
            throw new IllegalStateException("Native call disappeared");
        for (String table : TABLES) {
            JSONArray rows = backup.getJSONArray(table);
            for (int i = 0; i < rows.length(); i++) db.insertOrThrow(table, null, values(rows.getJSONObject(i)));
        }
    }

    /** API insert uses ABORT for transcript sequences; remove our exact generated rows before that native insert. */
    static void removeApplied(SQLiteDatabase db, JSONObject expected) throws JSONException {
        long briefing = expected.getLong("briefingId");
        for (int index = TABLES.length - 1; index >= 0; index--) {
            String table = TABLES[index]; JSONArray applied = expected.getJSONArray(table);
            for (int i = 0; i < applied.length(); i++) {
                JSONObject row = applied.getJSONObject(i);
                db.delete(table, "_id=? AND briefing_info_id=?", new String[]{Long.toString(row.getLong("_id")), Long.toString(briefing)});
            }
        }
    }
    private static void clear(SQLiteDatabase db, long briefing) {
        for (int i = TABLES.length - 1; i >= 0; i--)
            db.delete(TABLES[i], "briefing_info_id=?", new String[]{Long.toString(briefing)});
    }
    private static JSONArray rows(SQLiteDatabase db, String sql, long briefing) throws JSONException {
        JSONArray result = new JSONArray();
        try (Cursor cursor = db.rawQuery(sql, new String[]{Long.toString(briefing)})) {
            while (cursor.moveToNext()) result.put(row(cursor));
        }
        return result;
    }
    private static JSONObject row(Cursor cursor) throws JSONException {
        JSONObject result = new JSONObject();
        for (int i = 0; i < cursor.getColumnCount(); i++) {
            Object value = cursor.isNull(i) ? JSONObject.NULL : cursor.getType(i) == Cursor.FIELD_TYPE_INTEGER
                    ? cursor.getLong(i) : cursor.getString(i);
            result.put(cursor.getColumnName(i), value);
        }
        return result;
    }
    private static ContentValues values(JSONObject row) throws JSONException {
        ContentValues result = new ContentValues();
        for (Iterator<String> keys = row.keys(); keys.hasNext();) { String key = keys.next(); put(result, key, row.get(key)); }
        return result;
    }
    private static void put(ContentValues values, String key, Object value) {
        if (value == JSONObject.NULL) values.putNull(key);
        else if (value instanceof Number) values.put(key, ((Number) value).longValue());
        else values.put(key, value.toString());
    }
    private static void append(StringBuilder result, String text) {
        if (text == null || text.isEmpty()) return;
        if (result.length() != 0) result.append('\n'); result.append(text);
    }
}
