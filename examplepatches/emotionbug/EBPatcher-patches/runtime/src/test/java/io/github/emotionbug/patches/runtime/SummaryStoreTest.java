package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.content.ContextWrapper;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.SQLiteMode;
import static org.junit.Assert.*;

/** Executes production storage against Android SQLite, not an in-memory imitation of its SQL. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
@SQLiteMode(SQLiteMode.Mode.NATIVE)
public final class SummaryStoreTest {
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    private Context context;
    private SummaryStore store;

    @Before public void open() throws Exception {
        final File root = temporary.newFolder("private");
        context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getNoBackupFilesDir() { return root; }
        };
        store = new SummaryStore(context);
        store.mode(SummaryStore.ALWAYS);
    }
    @After public void close() { if (store != null) store.close(); }

    private static Uri audio(long id) { return Uri.parse("content://fixture/recordings/" + id); }
    private static JSONObject candidate(String summary, String transcript) throws Exception {
        JSONArray segments = new JSONArray();
        if (!transcript.isEmpty()) segments.put(new JSONObject().put("startMs", 120).put("endMs", 940)
                .put("speaker", "Channel 1").put("text", transcript));
        return new JSONObject().put("title", "Fixture title").put("summary", summary).put("segments", segments);
    }
    private static JSONObject selection(String source) throws Exception {
        return new JSONObject().put("source", source).put("reason", "Fixture evidence comparison");
    }
    private void event(long id, JSONObject api) {
        store.event(id, id + 100, audio(id), false, api == null ? null : api.optString("summary"), api == null ? null : api.toString());
    }
    private SummaryStore.Job claim(long id, JSONObject api) {
        event(id, api);
        SummaryStore.Job job = store.next(true);
        assertNotNull(job);
        assertEquals(id, job.recordingId);
        return job;
    }
    private void complete(SummaryStore.Job job, String source) throws Exception {
        store.complete(job, "Local words", "Local summary", candidate("Local summary", "Local words"), selection(source));
    }
    private SummaryStore.Job ready(long id) throws Exception {
        SummaryStore.Job job = claim(id, candidate("API summary", "API words"));
        complete(job, "local");
        store.release(job);
        return job;
    }
    private void acknowledge(SummaryStore.Job job) throws Exception {
        JSONObject backup = new JSONObject().put("recordingId",job.recordingId).put("briefingId",job.briefingId)
                .put("audioUri",job.audio).put("fixtureRows","API");
        store.nativeBackup(backup);
        JSONObject applied = new JSONObject(backup.toString()).put("fixtureRows","Local");
        store.nativeIntent(applied,store.presentation(store.job(job.id)));
        store.nativeCommitted(applied);
        store.nativePrune();
    }
    private SummaryStore.Job persisted(long id) throws Exception {
        SummaryStore.Job job = ready(id);
        acknowledge(job);
        return job;
    }
    private SummaryStore.Job job(long recordingId) {
        for (SummaryStore.Job job : store.list()) if (job.recordingId == recordingId) return job;
        return null;
    }
    private long count(String where) {
        try (Cursor cursor = store.getReadableDatabase().rawQuery("SELECT count(*) FROM jobs WHERE " + where, null)) {
            assertTrue(cursor.moveToFirst()); return cursor.getLong(0);
        }
    }
    private static void file(File file, String value) throws Exception {
        assertTrue(file.getParentFile().isDirectory() || file.getParentFile().mkdirs());
        Files.write(file.toPath(), value.getBytes(StandardCharsets.UTF_8));
    }

    private static void restorePreSpeakerJobs(SQLiteDatabase db) {
        restorePreSpeakerJobs(db, false);
    }

    private static void restorePreSpeakerJobs(SQLiteDatabase db, boolean preserveSelfChannel) {
        db.execSQL("CREATE TABLE jobs_previous (id INTEGER PRIMARY KEY AUTOINCREMENT,audio TEXT UNIQUE NOT NULL,"
                + "recording_id INTEGER NOT NULL DEFAULT 0,briefing_id INTEGER NOT NULL DEFAULT 0,quota INTEGER NOT NULL DEFAULT 0,"
                + "original TEXT NOT NULL DEFAULT '',revision INTEGER NOT NULL DEFAULT 1,state TEXT NOT NULL,"
                + "reason TEXT NOT NULL DEFAULT '',created INTEGER NOT NULL,transcript TEXT NOT NULL DEFAULT '',summary TEXT NOT NULL DEFAULT '',"
                + "api_document TEXT NOT NULL DEFAULT '',local_document TEXT NOT NULL DEFAULT '',selected_source TEXT NOT NULL DEFAULT 'uncertain',"
                + "selection_reason TEXT NOT NULL DEFAULT '',selection_revision INTEGER NOT NULL DEFAULT 0,choice TEXT NOT NULL DEFAULT 'recommended'"
                + (preserveSelfChannel ? ",self_channel TEXT NOT NULL DEFAULT 'auto'" : "") + ")");
        db.execSQL("INSERT INTO jobs_previous SELECT id,audio,recording_id,briefing_id,quota,original,revision,state,reason,created,"
                + "transcript,summary,api_document,local_document,selected_source,selection_reason,selection_revision,choice"
                + (preserveSelfChannel ? ",self_channel" : "") + " FROM jobs");
        db.execSQL("DROP TABLE jobs");
        db.execSQL("ALTER TABLE jobs_previous RENAME TO jobs");
        db.execSQL("CREATE UNIQUE INDEX jobs_recording ON jobs(recording_id) WHERE recording_id>0");
        db.execSQL("CREATE INDEX jobs_briefing ON jobs(briefing_id) WHERE briefing_id>0");
        db.execSQL("CREATE INDEX jobs_state ON jobs(state,id)");
    }

    private static void restorePreSpeakerEditJournal(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE native_journal_previous (recording_id INTEGER PRIMARY KEY, audio TEXT NOT NULL,"
                + "briefing_id INTEGER NOT NULL, backup TEXT NOT NULL, expected TEXT NOT NULL DEFAULT '',"
                + "expected_hash TEXT NOT NULL DEFAULT '', applied_hash TEXT NOT NULL DEFAULT '', applied TEXT NOT NULL DEFAULT '',"
                + "applied_source TEXT NOT NULL DEFAULT '', applied_token TEXT NOT NULL DEFAULT '',"
                + "token TEXT NOT NULL DEFAULT '', source TEXT NOT NULL DEFAULT '', committed INTEGER NOT NULL DEFAULT 0,"
                + "api_pending INTEGER NOT NULL DEFAULT 0)");
        db.execSQL("INSERT INTO native_journal_previous SELECT recording_id,audio,briefing_id,backup,expected,expected_hash,"
                + "applied_hash,applied,applied_source,applied_token,token,source,committed,api_pending FROM native_journal");
        db.execSQL("DROP TABLE native_journal");
        db.execSQL("ALTER TABLE native_journal_previous RENAME TO native_journal");
    }

    private static JSONObject nativeBackup(long id) throws Exception {
        return new JSONObject().put("recordingId", id).put("briefingId", id + 100).put("audioUri", audio(id).toString())
                .put("file", new JSONObject().put("_id", id).put("content_uri", audio(id).toString()).put("duration_in_ms", 2000))
                .put("briefing_info", new JSONArray().put(new JSONObject().put("_id", id + 100).put("my_talk_id", 7)))
                .put("briefing_summary", new JSONArray()).put("briefing_summary_title", new JSONArray())
                .put("briefing_converted_text", new JSONArray().put(new JSONObject().put("_id", 11).put("sequence", 0)
                        .put("message", "Local words").put("talker_id", 7).put("talk_time", 120).put("talk_duration", 820)));
    }

    @Test public void migrationPreservesOriginalsAndLegacyViewsButPrunesActualRowsAndFiles() throws Exception {
        store.close();
        File database = new File(context.getNoBackupFilesDir(), "ebpatcher-summary.db");
        assertTrue(SQLiteDatabase.deleteDatabase(database));
        try (SQLiteDatabase legacy = SQLiteDatabase.openOrCreateDatabase(database, null)) {
            legacy.execSQL("CREATE TABLE settings (name TEXT PRIMARY KEY, value TEXT NOT NULL)");
            legacy.execSQL("INSERT INTO settings VALUES ('mode','always')");
            legacy.execSQL("CREATE TABLE jobs (id INTEGER PRIMARY KEY AUTOINCREMENT,audio TEXT UNIQUE NOT NULL,"
                    + "recording_id INTEGER NOT NULL DEFAULT 0,briefing_id INTEGER NOT NULL DEFAULT 0,quota INTEGER NOT NULL DEFAULT 0,"
                    + "original TEXT NOT NULL DEFAULT '',revision INTEGER NOT NULL DEFAULT 1,state TEXT NOT NULL,"
                    + "reason TEXT NOT NULL DEFAULT '',created INTEGER NOT NULL,transcript TEXT NOT NULL DEFAULT '',summary TEXT NOT NULL DEFAULT '')");
            for (int i = 1; i <= 8; i++) {
                legacy.execSQL("INSERT INTO jobs(id,audio,recording_id,briefing_id,original,state,created,transcript,summary) VALUES(?,?,?,?,?,?,?,?,?)",
                        new Object[]{i, audio(i).toString(), i, i + 100, "Legacy API", i == 8 ? "queued" : "ready", i,
                                i + "/transcript.txt", i + "/summary-1.txt"});
                file(new File(store.directory, i + "/transcript.txt"), "Legacy local words");
                file(new File(store.directory, i + "/summary-1.txt"), "Legacy local summary");
                file(new File(store.directory, i + "/checkpoint.bin"), "checkpoint");
            }
            legacy.setVersion(1);
        }
        store = new SummaryStore(context);
        assertEquals(6, store.list().size());
        assertTrue(store.nativeSpeakerEdits(3, audio(3).toString()).isEmpty());
        assertEquals(5, count("state='ready'"));
        assertFalse(new File(store.directory, "1").exists());
        assertFalse(new File(store.directory, "2").exists());
        assertTrue(new File(store.directory, "3/checkpoint.bin").isFile());
        JSONObject view = store.presentation(103);
        assertEquals("Legacy API", view.getJSONObject("api").getString("summary"));
        assertEquals("Legacy local summary", view.getJSONObject("local").getString("summary"));
        assertEquals("recommended", view.getString("choice"));
        assertEquals("auto", job(3).selfChannel);
        assertEquals("api", view.getString("source"));
        assertFalse(store.pending(false)); // Legacy flattened text cannot bypass improved ASR.
        assertTrue(store.pending(true));
        assertTrue(job(8).localDocument.isEmpty());
        store.choose(103, "local");
        assertEquals("local", store.presentation(103).getString("source"));
        event(1, candidate("Late original", "Late words"));
        assertNull(job(1));
        store.nativeBackup(nativeBackup(3));
        store.nativeSpeakerEdits(3, audio(3).toString(), Collections.singleton(11L));
        assertEquals(Collections.singleton(11L), store.nativeSpeakerEdits(3, audio(3).toString()));
    }

    @Test public void versionTwoUpgradePreservesCandidatesAndAddsIndependentNativeJournal() throws Exception {
        SummaryStore.Job original = ready(1);
        String api = job(1).apiDocument, local = job(1).localDocument;
        SQLiteDatabase db = store.getWritableDatabase();
        restorePreSpeakerJobs(db);
        db.execSQL("DROP TABLE native_journal");
        db.execSQL("DROP TABLE native_associations");
        db.setVersion(2);
        store.close(); store = new SummaryStore(context);
        assertEquals(api, job(1).apiDocument); assertEquals(local, job(1).localDocument);
        assertEquals(original.id, job(1).id);
        assertEquals("auto", job(1).selfChannel);
        assertEquals("pending", store.nativeOutcome(job(1)));
        assertNull(store.nativeJournal(1, audio(1).toString()));
        store.nativeBackup(nativeBackup(1));
        assertTrue(store.nativeSpeakerEdits(1, audio(1).toString()).isEmpty());
        store.nativeSpeakerEdits(1, audio(1).toString(), Collections.singleton(11L));
        assertEquals(Collections.singleton(11L), store.nativeSpeakerEdits(1, audio(1).toString()));
    }

    @Test public void versionThreeUpgradePreservesJournalHistorySettingsAndLeases() throws Exception {
        SummaryStore.Job first = persisted(1);
        store.chooseJob(first.id, "api");
        SummaryStore.Job active = claim(2, null);
        JSONObject journal = store.nativeJournal(1, audio(1).toString());
        String api = job(1).apiDocument, local = job(1).localDocument;
        SQLiteDatabase db = store.getWritableDatabase();
        db.execSQL("INSERT INTO retired(identity) VALUES('retained-tombstone')");
        restorePreSpeakerJobs(db);
        restorePreSpeakerEditJournal(db);
        db.setVersion(3);
        store.close(); store = new SummaryStore(context);
        assertEquals(2, count("1=1"));
        assertEquals(api, job(1).apiDocument);
        assertEquals(local, job(1).localDocument);
        assertEquals("api", job(1).choice);
        assertEquals("auto", job(1).selfChannel);
        assertEquals("auto", job(2).selfChannel);
        assertEquals(SummaryStore.ALWAYS, store.mode());
        assertEquals(journal.toString(), store.nativeJournal(1, audio(1).toString()).toString());
        assertTrue(store.nativeSpeakerEdits(1, audio(1).toString()).isEmpty());
        store.nativeSpeakerEdits(1, audio(1).toString(), Collections.singleton(11L));
        assertEquals(Collections.singleton(11L), store.nativeSpeakerEdits(1, audio(1).toString()));
        try (Cursor cursor = store.getReadableDatabase().rawQuery("SELECT job_id FROM leases", null)) {
            assertTrue(cursor.moveToFirst()); assertEquals(active.id, cursor.getLong(0));
        }
        try (Cursor cursor = store.getReadableDatabase().rawQuery("SELECT identity FROM retired", null)) {
            assertTrue(cursor.moveToFirst()); assertEquals("retained-tombstone", cursor.getString(0));
        }
    }

    @Test public void versionFourUpgradePreservesChoicesAndSpeakerEditsSurviveCorrectionsAndRestart() throws Exception {
        SummaryStore.Job first = persisted(1);
        store.chooseJob(first.id, "local");
        store.selfChannel(first.id, "Channel 1");
        store.setSetting("retained-setting", "retained-value");
        SummaryStore.Job active = claim(2, null);
        JSONObject journal = store.nativeJournal(1, audio(1).toString());
        String api = job(1).apiDocument, local = job(1).localDocument;
        SQLiteDatabase db = store.getWritableDatabase();
        db.execSQL("INSERT INTO retired(identity) VALUES('retained-tombstone')");
        db.execSQL("INSERT INTO native_associations(recording_id,communication_id) VALUES(1,901)");
        restorePreSpeakerEditJournal(db);
        restorePreSpeakerJobs(db, true);
        db.setVersion(4);
        store.close(); store = new SummaryStore(context);

        assertEquals(2, count("1=1"));
        assertEquals(api, job(1).apiDocument);
        assertEquals(local, job(1).localDocument);
        assertEquals("local", job(1).choice);
        assertEquals("Channel 1", job(1).selfChannel);
        assertEquals("auto", job(2).selfChannel);
        assertEquals(-1, job(1).selfTalker);
        assertEquals(-1, job(2).selfTalker);
        assertEquals(SummaryStore.ALWAYS, store.mode());
        assertEquals("retained-value", store.setting("retained-setting", ""));
        assertEquals(901, store.nativeCommunication(1));
        assertEquals(journal.toString(), store.nativeJournal(1, audio(1).toString()).toString());
        assertTrue(store.nativeSpeakerEdits(1, audio(1).toString()).isEmpty());
        try (Cursor cursor = store.getReadableDatabase().rawQuery("SELECT job_id FROM leases", null)) {
            assertTrue(cursor.moveToFirst()); assertEquals(active.id, cursor.getLong(0));
        }
        try (Cursor cursor = store.getReadableDatabase().rawQuery("SELECT identity FROM retired", null)) {
            assertTrue(cursor.moveToFirst()); assertEquals("retained-tombstone", cursor.getString(0));
        }

        Set<Long> edits = new HashSet<>(Arrays.asList(99L, 11L, 9007199254740993L));
        store.nativeSpeakerEdits(1, audio(1).toString(), edits);
        assertEquals("[11,99,9007199254740993]", store.nativeJournal(1, audio(1).toString()).getString("speaker_edits"));
        JSONObject applied = new JSONObject(journal.getString("applied"));
        for (int correction = 1; correction <= 2; correction++) {
            applied.put("fixtureRows", "Local correction " + correction);
            store.nativeIntent(applied, store.presentation(job(1)));
            assertEquals(edits, store.nativeSpeakerEdits(1, audio(1).toString()));
            store.nativeCommitted(applied);
            store.close(); store = new SummaryStore(context);
            assertEquals(edits, store.nativeSpeakerEdits(1, audio(1).toString()));
            assertEquals(journal.getString("backup"), store.nativeJournal(1, audio(1).toString()).getString("backup"));
        }
        store.nativeSpeakerEdits(1, audio(1).toString(), Collections.emptySet());
        store.close(); store = new SummaryStore(context);
        assertTrue(store.nativeSpeakerEdits(1, audio(1).toString()).isEmpty());
        assertEquals(journal.getString("backup"), store.nativeJournal(1, audio(1).toString()).getString("backup"));
    }

    @Test public void nativeSpeakerEditsRequireMatchingExistingJournalForWrites() throws Exception {
        assertTrue(store.nativeSpeakerEdits(1, audio(1).toString()).isEmpty());
        assertThrows(IllegalStateException.class,
                () -> store.nativeSpeakerEdits(1, audio(1).toString(), Collections.singleton(11L)));
        assertNull(store.nativeJournal(1, audio(1).toString()));
        store.nativeBackup(nativeBackup(1));
        store.nativeSpeakerEdits(1, audio(1).toString(), Collections.singleton(11L));
        assertThrows(IllegalStateException.class, () -> store.nativeSpeakerEdits(1, audio(2).toString()));
        assertThrows(IllegalStateException.class,
                () -> store.nativeSpeakerEdits(1, audio(2).toString(), Collections.emptySet()));
        assertEquals(Collections.singleton(11L), store.nativeSpeakerEdits(1, audio(1).toString()));
        Set<Long> detached = store.nativeSpeakerEdits(1, audio(1).toString());
        detached.clear();
        assertEquals(Collections.singleton(11L), store.nativeSpeakerEdits(1, audio(1).toString()));
    }

    @Test public void manualSelfChannelIsPerJobDurableAndDoesNotChangeOriginalsOrSourceChoice() throws Exception {
        SummaryStore.Job first = ready(1), second = ready(2);
        String api = job(1).apiDocument, local = job(1).localDocument;
        String originalToken = SummaryStore.nativeToken(store.presentation(first));
        store.selfChannel(first.id, "Channel 1");
        assertEquals("auto", job(2).selfChannel);
        assertEquals("recommended", job(1).choice);
        JSONObject selected = store.presentation(first).getJSONObject("selected");
        assertEquals(selected.getInt("myTalkId"), selected.getJSONArray("segments").getJSONObject(0).getInt("talkerId"));
        assertFalse(originalToken.equals(SummaryStore.nativeToken(store.presentation(first))));
        assertEquals(api, job(1).apiDocument);
        assertEquals(local, job(1).localDocument);
        assertEquals(local, store.presentation(first).getJSONObject("local").toString());
        store.close(); store = new SummaryStore(context);
        assertEquals("Channel 1", job(1).selfChannel);
        assertEquals("auto", job(2).selfChannel);
        store.chooseJob(first.id, "api");
        assertEquals(api, store.presentation(first).getJSONObject("selected").toString());
        store.selfChannel(first.id, "auto");
        assertEquals("api", job(1).choice);
        assertEquals(api, store.presentation(first).getJSONObject("selected").toString());
        assertEquals("auto", job(1).selfChannel);
        assertNotNull(store.job(second.id));
    }

    @Test public void apiSelfTalkerOverridesOnlySelectedCopyAndPersistsAcrossSourcesAndRestart() throws Exception {
        JSONObject backup = nativeBackup(1);
        backup.getJSONArray("briefing_converted_text").getJSONObject(0).put("talker_id", 1);
        JSONObject api = AdotSummaryNativeStore.document(backup);
        SummaryStore.Job first = claim(1, api);
        complete(first, "local"); store.release(first);
        SummaryStore.Job second = ready(2);
        store.nativeBackup(backup);
        store.selfChannel(first.id, "Channel 1");
        store.chooseJob(first.id, "api");
        JSONObject before = store.presentation(first);
        String originalApi = before.getJSONObject("api").toString();
        String originalSpeakerApi = before.getJSONObject("speakerApi").toString();
        String originalLocal = before.getJSONObject("local").toString();
        String contentToken = SummaryStore.nativeContentToken(before);
        assertFalse(contentToken.isEmpty());

        store.selfTalker(first.id, 1);
        JSONObject corrected = store.presentation(first);
        assertEquals(1, corrected.getInt("selfTalker"));
        assertEquals("auto", job(1).selfChannel);
        assertEquals(-1, store.job(second.id).selfTalker);
        assertEquals("api", corrected.getString("source"));
        assertEquals(1, corrected.getJSONObject("selected").getInt("myTalkId"));
        assertEquals(originalApi, corrected.getJSONObject("api").toString());
        assertEquals(originalSpeakerApi, corrected.getJSONObject("speakerApi").toString());
        assertEquals(originalLocal, corrected.getJSONObject("local").toString());
        assertEquals(contentToken, SummaryStore.nativeContentToken(corrected));
        assertNotEquals(SummaryStore.nativeToken(before), SummaryStore.nativeToken(corrected));
        assertEquals(backup.toString(), store.nativeJournal(1, audio(1).toString()).getString("backup"));
        store.close(); store = new SummaryStore(context);
        assertEquals(1, job(1).selfTalker);
        assertEquals(1, store.presentation(first).getJSONObject("selected").getInt("myTalkId"));

        store.chooseJob(first.id, "local");
        JSONObject local = store.presentation(first);
        assertEquals(1, local.getJSONObject("selected").getInt("myTalkId"));
        assertEquals(1, local.getJSONObject("selected").getJSONArray("segments").getJSONObject(0).getInt("talkerId"));
        assertEquals(originalLocal, local.getJSONObject("local").toString());
        String localContent = SummaryStore.nativeContentToken(local);
        store.selfTalker(first.id, -1);
        assertEquals(-1, job(1).selfTalker);
        assertEquals(7, store.presentation(first).getJSONObject("selected").getInt("myTalkId"));
        assertEquals(localContent, SummaryStore.nativeContentToken(store.presentation(first)));
        store.chooseJob(first.id, "api");
        assertEquals(originalApi, store.presentation(first).getJSONObject("selected").toString());
        assertEquals(backup.toString(), store.nativeJournal(1, audio(1).toString()).getString("backup"));
    }

    @Test public void queuedApiSelfTalkerUsesAuthenticatedNativeIdsAndStaleChoiceFallsBack() throws Exception {
        JSONObject backup = nativeBackup(1);
        backup.getJSONArray("briefing_converted_text").getJSONObject(0).put("talker_id", 1);
        event(1, AdotSummaryNativeStore.document(backup));
        SummaryStore.Job first = job(1);
        assertEquals("queued", first.state);
        assertTrue(store.presentation(first).isNull("speakerApi"));
        assertThrows(IllegalArgumentException.class, () -> store.selfTalker(first.id, 1));
        store.nativeBackup(backup);
        store.selfTalker(first.id, 1);
        JSONObject selected = store.presentation(first);
        assertEquals("recommended", selected.getString("choice"));
        assertEquals("api", selected.getString("source"));
        assertEquals(1, selected.getJSONObject("selected").getInt("myTalkId"));
        assertThrows(IllegalArgumentException.class, () -> store.selfTalker(first.id, -2));
        assertThrows(IllegalArgumentException.class, () -> store.selfTalker(first.id, 7));
        assertThrows(IllegalArgumentException.class, () -> store.selfTalker(999, -1));

        backup.getJSONArray("briefing_converted_text").getJSONObject(0).put("talker_id", 9).put("message", "Changed API words");
        store.nativeBackup(backup);
        event(1, AdotSummaryNativeStore.document(backup));
        JSONObject stale = store.presentation(first);
        assertEquals(1, stale.getInt("selfTalker"));
        assertEquals(7, stale.getJSONObject("selected").getInt("myTalkId"));
        assertTrue(stale.getString("reason").contains("no longer available"));
        assertNotEquals(SummaryStore.nativeContentToken(selected), SummaryStore.nativeContentToken(stale));
        assertThrows(IllegalArgumentException.class, () -> store.selfTalker(first.id, 1));
        store.selfTalker(first.id, -1);
        assertFalse(store.presentation(first).getString("reason").contains("no longer available"));
    }

    @Test public void nativeContentTokensSeparateApiAndLocalNamespacesAndIgnoreApiSelfOverrides() throws Exception {
        JSONObject document = candidate("Summary", "Words").put("myTalkId", 7);
        JSONObject api = new JSONObject().put("source", "api").put("api", document)
                .put("selected", new JSONObject(document.toString()).put("myTalkId", 1));
        JSONObject local = new JSONObject().put("source", "local").put("local", document).put("selected", document);
        assertNotEquals(SummaryStore.nativeContentToken(api), SummaryStore.nativeContentToken(local));
        String content = SummaryStore.nativeContentToken(api);
        api.getJSONObject("selected").put("myTalkId", 2);
        assertEquals(content, SummaryStore.nativeContentToken(api));
        assertEquals("", SummaryStore.nativeContentToken(new JSONObject().put("source", "api")));
    }

    @Test public void selfChannelRejectsMissingChannelsInvalidValuesAndMissingJobs() throws Exception {
        SummaryStore.Job first = ready(1);
        assertThrows(IllegalArgumentException.class, () -> store.selfChannel(first.id, "Channel 2"));
        assertThrows(IllegalArgumentException.class, () -> store.selfChannel(first.id, "Channel1"));
        assertThrows(IllegalArgumentException.class, () -> store.selfChannel(first.id, null));
        assertThrows(IllegalArgumentException.class, () -> store.selfChannel(999, "auto"));
        assertEquals("auto", job(1).selfChannel);
    }

    @Test public void mappingUsesExactNativeBackupRatherThanUntrustedStoredSpeakerIds() throws Exception {
        SummaryStore.Job first = ready(1), second = ready(2);
        JSONObject untrusted = candidate("API summary", "Local words").put("myTalkId", 99);
        untrusted.getJSONArray("segments").getJSONObject(0).put("talkerId", 99);
        store.getWritableDatabase().execSQL("UPDATE jobs SET api_document=? WHERE id=?", new Object[]{untrusted.toString(), first.id});
        JSONObject unresolved = store.presentation(first).getJSONObject("selected");
        assertNotEquals(99, unresolved.getInt("myTalkId"));
        assertNotEquals(unresolved.getInt("myTalkId"), unresolved.getJSONArray("segments").getJSONObject(0).getInt("talkerId"));
        store.nativeBackup(nativeBackup(1));
        JSONObject selected = store.presentation(first).getJSONObject("selected");
        assertEquals(7, selected.getInt("myTalkId"));
        assertEquals(7, selected.getJSONArray("segments").getJSONObject(0).getInt("talkerId"));
        assertEquals(1, selected.getInt("speakerMappingVersion"));
        assertFalse(selected.getString("speakerMapping").isEmpty());
        JSONObject isolated = store.presentation(second).getJSONObject("selected");
        assertNotEquals(7, isolated.getInt("myTalkId"));
        assertFalse(store.presentation(first).getJSONObject("local").has("myTalkId"));
        JSONObject wrongIdentity = nativeBackup(2);
        store.getWritableDatabase().execSQL("UPDATE native_journal SET backup=? WHERE recording_id=1",
                new Object[]{wrongIdentity.toString()});
        assertNotEquals(7, store.presentation(first).getJSONObject("selected").getInt("myTalkId"));
    }

    @Test public void manualSecondChannelMapsOnlyThatChannelToSelf() throws Exception {
        SummaryStore.Job first = claim(1, null);
        JSONObject local = candidate("Local summary", "Remote words");
        local.getJSONArray("segments").put(new JSONObject().put("startMs", 1000).put("endMs", 1400)
                .put("speaker", "Channel 2").put("text", "My words"));
        store.complete(first, "Remote words\nMy words", "Local summary", local, selection("local"));
        store.release(first);
        store.selfChannel(first.id, "Channel 2");
        JSONObject selected = store.presentation(first).getJSONObject("selected");
        assertNotEquals(selected.getInt("myTalkId"), selected.getJSONArray("segments").getJSONObject(0).getInt("talkerId"));
        assertEquals(selected.getInt("myTalkId"), selected.getJSONArray("segments").getJSONObject(1).getInt("talkerId"));
        assertEquals("Channel 2", store.job(first.id).selfChannel);
        assertEquals(local.toString(), store.job(first.id).localDocument);
    }

    @Test public void nativeBackupsOutlivePruningAndRequireACommittedCurrentSelection() throws Exception {
        SummaryStore.Job first = ready(1);
        JSONObject backup = new JSONObject().put("recordingId", 1).put("briefingId", 101)
                .put("audioUri", audio(1).toString()).put("originalRows", "API raw IDs and fields");
        store.nativeBackup(backup);
        JSONObject applied = new JSONObject(backup.toString()).put("originalRows", "Selected local rows");
        store.nativeIntent(applied, store.presentation(first));
        assertEquals("pending", store.nativeOutcome(first));
        store.nativeBackup(applied); // Own expected native rows are never promoted to API evidence.
        assertEquals(backup.toString(), new JSONObject(store.nativeJournal(1, audio(1).toString()).getString("backup")).toString());
        store.nativeCommitted(applied);
        assertEquals("local", store.nativeOutcome(first));
        store.chooseJob(first.id, "api");
        assertEquals("pending", store.nativeOutcome(first));
        store.nativeIntent(backup,store.presentation(store.job(first.id)));
        store.nativeCommitted(backup);
        for (int i = 2; i <= 7; i++) ready(i);
        assertNull(job(1));
        assertNotNull(store.nativeJournal(1, audio(1).toString()));
        store.mode(SummaryStore.OFF); store.clear();
        assertNotNull(store.nativeJournal(1, audio(1).toString()));
        assertThrows(IllegalStateException.class, () -> store.nativeJournal(1, audio(2).toString()));
    }

    @Test public void retainsExactlyFiveTerminalHistoriesAndAllActiveWorkWithoutTouchingOriginals() throws Exception {
        File original = temporary.newFile("original-audio.m4a"), model = temporary.newFile("model.gguf");
        file(original, "original bytes"); file(model, "model bytes");
        SummaryStore.Job active = claim(1, null);
        File workspace = store.work(active);
        file(new File(workspace, "checkpoint.bin"), "active checkpoint");
        for (int i = 2; i <= 8; i++) persisted(i);
        event(9, null); event(10, null);
        store.state(job(10).id, "waiting", "Waiting for model");
        assertEquals(5, count("state NOT IN ('queued','running','waiting')"));
        assertEquals(8, store.list().size());
        assertNotNull(job(1)); assertNotNull(job(9)); assertNotNull(job(10));
        assertNull(job(2)); assertNull(job(3));
        assertFalse(new File(store.directory, "2").exists());
        assertFalse(new File(store.directory, "3").exists());
        assertTrue(new File(workspace, "checkpoint.bin").isFile());
        assertEquals("original bytes", new String(Files.readAllBytes(original.toPath()), StandardCharsets.UTF_8));
        assertEquals("model bytes", new String(Files.readAllBytes(model.toPath()), StandardCharsets.UTF_8));
        assertNull(store.presentation(102));
        complete(active, "local"); // Finishing an older recording last does not evict a newer history.
        store.release(active);
        assertNull(job(1));
        assertNotNull(store.job(active.id)); // Hidden pending candidate is not disposable processing history.
        assertTrue(workspace.exists());
        acknowledge(active);
        for (int i = 4; i <= 8; i++) assertNotNull(job(i));
        assertEquals(5, count("state NOT IN ('queued','running','waiting')"));
        assertFalse(workspace.exists());
    }

    @Test public void staleCompletionCannotResurrectPrunedRowsOrRecreatePayloads() throws Exception {
        SummaryStore.Job obsolete = claim(1, null);
        File workspace = store.work(obsolete);
        file(new File(workspace, "checkpoint.bin"), "live engine checkpoint");
        store.state(obsolete, "cancelled", "Cancelled");
        for (int i = 2; i <= 7; i++) ready(i);
        assertNull(job(1));
        assertTrue(workspace.exists()); // A live lease owns the files until engine close.
        complete(obsolete, "local");
        assertFalse(new File(workspace, "summary.txt").exists());
        store.release(obsolete);
        assertFalse(workspace.exists());
        complete(obsolete, "local");
        store.state(obsolete, "ready", "Late callback");
        event(1, candidate("Late API", "Late STT"));
        store.event(1, 101, Uri.parse("content://fixture/moved-audio"), false, "Late", candidate("Late", "").toString());
        assertNull(job(1)); assertFalse(workspace.exists());
        assertEquals(5, store.list().size());
    }

    @Test public void recoveryRemovesOrphansFromDeadLeasesWithoutRemovingActiveJobFiles() throws Exception {
        SummaryStore.Job obsolete = claim(1, null);
        File expired = store.work(obsolete);
        file(new File(expired, "checkpoint.bin"), "old");
        store.state(obsolete, "cancelled", "Cancelled");
        for (int i = 2; i <= 7; i++) persisted(i);
        SummaryStore.Job active = claim(8, null);
        File retained = store.work(active);
        file(new File(retained, "checkpoint.bin"), "retained");
        store.interrupted(false); // Production calls this only while holding SummaryLock.
        assertFalse(expired.exists());
        assertTrue(new File(retained, "checkpoint.bin").isFile());
        assertEquals("failed", job(8).state);
        assertEquals(5, count("state NOT IN ('queued','running','waiting')"));
        store.retry(job(8).id);
        assertNotNull(store.next(true));
    }

    @Test public void stoppedQuotaWorkRecoversDeadLeaseBeforeSchedulingWithoutRestart() throws Exception {
        SummaryStore.Job paused;
        try (SummaryLock worker = SummaryLock.acquire(context)) {
            store.event(1, 101, audio(1), true, null, null);
            paused = store.next(true);
            assertNotNull(paused);
            file(new File(store.work(paused), "checkpoint.bin"), "resume checkpoint");
            store.interrupted(true);
            store.mode(SummaryStore.QUOTA);
            store.recoverForScheduling(context);
            assertEquals("waiting", job(1).state);
            assertTrue(store.pending(true)); // Keep the wakeup even while the old process is stopping.
            assertNull(store.next(true)); // Recovery must never steal a live worker's lease.
        } // Models the OS releasing the killed worker's process lock, with no finally/release callback.
        store.recoverForScheduling(context);
        assertTrue(store.pending(true));
        SummaryStore.Job resumed = store.next(true);
        assertNotNull(resumed);
        assertEquals(paused.id, resumed.id);
        assertEquals(paused.revision, resumed.revision);
        assertTrue(new File(store.work(resumed), "checkpoint.bin").isFile());
        store.release(resumed);
    }

    @Test public void lateApiRevisionRecoversLeaseAfterStopAndModeSwitchWithoutUnrelatedWork() throws Exception {
        ready(1);
        event(1, candidate("Second API", "second"));
        SummaryStore.Job paused;
        try (SummaryLock worker = SummaryLock.acquire(context)) {
            paused = store.next(false);
            assertNotNull(paused);
            store.interrupted(true);
            store.mode(SummaryStore.OFF);
            store.mode(SummaryStore.ALWAYS);
            event(1, candidate("Third API", "third"));
            store.recoverForScheduling(context);
            assertTrue(store.pending(false));
            assertNull(store.next(false));
            assertEquals("queued", job(1).state);
        }
        store.recoverForScheduling(context);
        SummaryStore.Job resumed = store.next(false);
        assertNotNull(resumed);
        assertEquals(paused.id, resumed.id);
        assertTrue(resumed.revision > paused.revision);
        assertEquals("Third API", new JSONObject(resumed.apiDocument).getString("summary"));
        complete(resumed, "api"); store.release(resumed);
        assertEquals("ready", job(1).state);
        assertEquals("Third API", store.presentation(101).getJSONObject("selected").getString("summary"));
    }

    @Test public void manualChoiceAndBothOriginalsSurviveReopenAndNewApiRevision() throws Exception {
        SummaryStore.Job first = ready(1);
        assertEquals("local", store.presentation(101).getString("source"));
        store.choose(101, "api");
        String originalApi = store.presentation(101).getJSONObject("api").toString();
        store.close(); store = new SummaryStore(context);
        assertEquals("api", store.presentation(101).getString("choice"));
        assertEquals(originalApi, store.presentation(101).getJSONObject("selected").toString());
        event(1, candidate("New API summary", "New API words"));
        assertEquals(first.revision + 1, job(1).revision);
        assertEquals("api", job(1).choice);
        assertEquals("New API summary", store.presentation(101).getJSONObject("selected").getString("summary"));
        assertEquals("Local summary", store.presentation(101).getJSONObject("local").getString("summary"));
        SummaryStore.Job refined = store.next(false);
        assertNotNull(refined);
        assertEquals(120, new JSONObject(refined.localDocument).getJSONArray("segments").getJSONObject(0).getLong("startMs"));
        complete(refined, "local"); store.release(refined);
        assertEquals("api", store.presentation(101).getString("source"));
        store.choose(101, "recommended");
        assertEquals("local", store.presentation(101).getString("source"));
        store.choose(101, "api");
        assertEquals("New API summary", job(1).original);
        assertEquals("New API summary", new JSONObject(job(1).apiDocument).getString("summary"));
    }

    @Test public void transcriptOnlyApiUpdateInvalidatesRecommendationEvenWithUnchangedSummary() throws Exception {
        ready(1);
        event(1, candidate("API summary", "New transcript only"));
        assertEquals("queued", job(1).state);
        assertEquals("api", store.presentation(101).getString("source"));
        assertTrue(store.presentation(101).getString("reason").contains("pending"));
        int revision = job(1).revision;
        event(1, candidate("API summary", "New transcript only"));
        assertEquals(revision, job(1).revision);
        assertTrue(store.pending(false));
    }

    @Test public void apiArrivingDuringFirstRunKeepsTimedAsrButRejectsStaleSelection() throws Exception {
        SummaryStore.Job first = claim(1, null);
        store.work(first);
        event(1, candidate("", "Late API STT without summary"));
        assertNull(store.next(true)); // The old revision still owns a lease.
        complete(first, "local");
        assertEquals("queued", job(1).state);
        assertEquals(0, job(1).selectionRevision);
        assertEquals("api", store.presentation(101).getString("source"));
        assertTrue(job(1).summary.isEmpty());
        assertFalse(job(1).localDocument.isEmpty());
        store.release(first);
        SummaryStore.Job next = store.next(false);
        assertNotNull(next);
        assertEquals(first.revision + 1, next.revision);
        assertEquals(940, new JSONObject(next.localDocument).getJSONArray("segments").getJSONObject(0).getLong("endMs"));
        complete(next, "uncertain"); store.release(next);
        assertEquals("api", store.presentation(101).getString("source"));
        assertEquals("Fixture evidence comparison", store.presentation(101).getString("reason"));
    }

    @Test public void supersededRefinementCannotOverwriteNewRevisionOrManualChoice() throws Exception {
        ready(1);
        event(1, candidate("Second API", "second"));
        SummaryStore.Job second = store.next(false);
        store.choose(101, "local");
        event(1, candidate("Third API", "third"));
        complete(second, "api"); store.release(second);
        assertEquals("queued", job(1).state);
        assertEquals("local", job(1).choice);
        assertNotEquals(job(1).revision, job(1).selectionRevision);
        assertEquals("Third API", store.presentation(101).getJSONObject("api").getString("summary"));
        assertEquals("local", store.presentation(101).getString("source"));
        SummaryStore.Job third = store.next(false);
        complete(third, "api"); store.release(third);
        assertEquals("local", store.presentation(101).getString("source"));
        store.choose(101, "recommended");
        assertEquals("api", store.presentation(101).getString("source"));
    }

    @Test public void associationNeverMatchesApproximateMetadataOrCrossesExactIdentities() throws Exception {
        event(1, candidate("First", "First words"));
        event(2, candidate("Second", "Second words"));
        store.event(1, 102, audio(1), false, "Wrong", candidate("Wrong", "Wrong").toString());
        assertEquals(2, store.list().size());
        assertEquals(101, job(1).briefingId);
        assertEquals("First", new JSONObject(job(1).apiDocument).getString("summary"));
        assertEquals("Second", new JSONObject(job(2).apiDocument).getString("summary"));
        JSONObject identity = store.presentation(101);
        assertEquals(1, identity.getLong("recordingId"));
        assertEquals(101, identity.getLong("briefingId"));
        assertEquals(audio(1).toString(), identity.getString("audioUri"));
        assertNull(store.presentation(999));
        assertNull(store.presentation(0));
        store.event(3, 103, audio(1), false, "Wrong", candidate("Wrong", "Wrong").toString());
        assertNull(job(3));
        assertNull(store.presentation(103));
    }

    @Test public void unknownOrUnavailableChoicesNeverMutateExistingSelection() throws Exception {
        event(1, candidate("API only", ""));
        assertThrows(IllegalArgumentException.class, () -> store.choose(101, "local"));
        assertThrows(IllegalArgumentException.class, () -> store.choose(101, "anything"));
        assertThrows(IllegalArgumentException.class, () -> store.choose(999, "api"));
        assertEquals("recommended", job(1).choice);
        assertEquals("api", store.presentation(101).getString("source"));
    }

    @Test public void uncertainWithoutApiUsesLocalWithReviewWarningAndTitleAloneIsNotEvidence() throws Exception {
        SummaryStore.Job first = claim(1, candidate("", ""));
        assertNull(store.presentation(101));
        complete(first, "uncertain"); store.release(first);
        JSONObject view = store.presentation(101);
        assertEquals("local", view.getString("source"));
        assertTrue(view.getString("reason").startsWith("Review needed."));
        assertTrue(view.isNull("api"));
        assertThrows(IllegalArgumentException.class, () -> store.choose(101, "api"));
    }

    @Test public void punctuationOnlyGenerationCannotPublishSuccessOrWriteResultFiles() throws Exception {
        SummaryStore.Job first = claim(1, null);
        assertThrows(java.io.IOException.class, () -> store.complete(first, "Real transcript", ": ",
                candidate(": ", "Real transcript"), selection("local")));
        assertThrows(java.io.IOException.class, () -> store.complete(first, "Real transcript", "Useful summary",
                candidate(": ", "Real transcript"), selection("local")));
        JSONObject badTitle = candidate("Useful summary", "Real transcript").put("title", ": ");
        assertThrows(java.io.IOException.class, () -> store.complete(first, "Real transcript", "Useful summary",
                badTitle, selection("local")));
        assertEquals("running", job(1).state);
        assertTrue(job(1).localDocument.isEmpty());
        assertFalse(new File(store.directory, Long.toString(first.id)).exists());
        store.complete(first, "통화 내용", "통화 요약", candidate("통화 요약", "통화 내용"), selection("local"));
        store.release(first);
        assertEquals("ready", job(1).state);
        assertEquals("통화 요약", store.presentation(101).getJSONObject("local").getString("summary"));
    }

    @Test public void modeOffAndQuotaOnlyDoNotStartOrdinaryCallWork() throws Exception {
        store.mode(SummaryStore.OFF);
        event(1, candidate("API", "words"));
        assertTrue(store.list().isEmpty()); assertNull(store.next(true));
        store.mode(SummaryStore.QUOTA);
        event(2, candidate("API", "words"));
        assertTrue(store.list().isEmpty());
        store.event(2, 102, audio(2), true, null, null);
        SummaryStore.Job quota = store.next(true);
        assertNotNull(quota); assertTrue(quota.quota);
        store.work(quota);
        store.mode(SummaryStore.OFF);
        complete(quota, "local");
        assertEquals("cancelled", job(2).state);
        assertTrue(job(2).summary.isEmpty());
        assertTrue(job(2).localDocument.isEmpty());
        store.release(quota);
    }

    @Test public void clearRequiresOffAndLateEventsCannotRestoreDeletedPrivateResults() throws Exception {
        SummaryStore.Job first = ready(1);
        assertThrows(java.io.IOException.class, () -> store.clear());
        store.mode(SummaryStore.OFF); store.clear();
        assertTrue(store.list().isEmpty()); assertFalse(store.directory.exists());
        complete(first, "local");
        assertFalse(store.directory.exists());
        store.mode(SummaryStore.ALWAYS);
        event(1, candidate("Late", "Late"));
        assertTrue(store.list().isEmpty());
        event(2, null);
        assertEquals(1, store.list().size());
    }

    @Test public void pruningDoesNotFollowSymlinksOutsideOwnedJobDirectory() throws Exception {
        File original = temporary.newFolder("native-data");
        file(new File(original, "recording.m4a"), "untouched");
        SummaryStore.Job first = persisted(1);
        Files.createSymbolicLink(new File(store.directory, first.id + "/external").toPath(), original.toPath());
        for (int i = 2; i <= 6; i++) persisted(i);
        assertFalse(new File(store.directory, Long.toString(first.id)).exists());
        assertEquals("untouched", new String(Files.readAllBytes(new File(original, "recording.m4a").toPath()), StandardCharsets.UTF_8));
    }
}
