package io.github.emotionbug.patches.runtime;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.SQLiteMode;
import static org.junit.Assert.*;

/** Production extraction SQL against SQLite; fixture text is synthetic, never user audio. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
@SQLiteMode(SQLiteMode.Mode.NATIVE)
public final class AdotSummaryHooksTest {
    private SQLiteDatabase database;
    @Before public void open() {
        database = SQLiteDatabase.create(null);
        database.execSQL("CREATE TABLE briefing_info (_id INTEGER PRIMARY KEY, deleted INTEGER, call_title TEXT, convert_state INTEGER DEFAULT 300, my_talk_id INTEGER DEFAULT 0)");
        database.execSQL("CREATE TABLE call_record_file (_id INTEGER PRIMARY KEY, briefing_info_id INTEGER, content_uri TEXT, duration_in_ms INTEGER, file_size_in_bytes INTEGER, file_create_time_in_ms INTEGER DEFAULT 0, cr_date INTEGER DEFAULT 0)");
        database.execSQL("CREATE TABLE briefing_summary (_id INTEGER PRIMARY KEY, briefing_info_id INTEGER, summary TEXT, summary_title_id INTEGER, message_sequence INTEGER)");
        database.execSQL("CREATE TABLE briefing_summary_title (_id INTEGER PRIMARY KEY, briefing_info_id INTEGER, summary_title TEXT)");
        database.execSQL("CREATE TABLE briefing_converted_text (_id INTEGER PRIMARY KEY, briefing_info_id INTEGER, sequence INTEGER, message TEXT, talker_id INTEGER, talk_time INTEGER, talk_duration INTEGER, is_edited INTEGER)");
        database.execSQL("INSERT INTO briefing_info(_id,deleted,call_title) VALUES(41,0,'Original title'),(42,0,'Other title')");
        database.execSQL("INSERT INTO call_record_file(_id,briefing_info_id,content_uri,duration_in_ms,file_size_in_bytes) VALUES(7,41,'content://fixture/7',10000,120),(8,42,'content://fixture/8',10000,120)");
    }
    @After public void close() { database.close(); }

    @Test public void sttOnlyIsCapturedWithoutSummaryAndNeverCrossesRecordingIdentity() throws Exception {
        database.execSQL("INSERT INTO briefing_converted_text VALUES(15,41,1,'First words',3,1200,400,0),(16,42,1,'Other call',9,100,500,0)");
        JSONObject result = snapshot(41);
        assertNotNull(result);
        assertEquals(7, result.getLong("recordingId"));
        assertEquals(41, result.getLong("briefingId"));
        assertEquals("content://fixture/7", result.getString("audioUri"));
        assertEquals("", result.getString("summary"));
        assertEquals(1, result.getJSONArray("segments").length());
        JSONObject segment = result.getJSONArray("segments").getJSONObject(0);
        assertEquals("First words", segment.getString("text"));
        assertEquals(1200, segment.getLong("startMs"));
        assertEquals(1600, segment.getLong("endMs"));
        assertEquals(15, segment.getLong("nativeId"));
        assertEquals(3, segment.getInt("talkerId"));
        assertFalse(database.inTransaction());
    }

    @Test public void existingAndLateSummarySnapshotsKeepTranscriptAndRawOriginalRows() throws Exception {
        database.execSQL("INSERT INTO briefing_converted_text VALUES(15,41,2,'Second',0,2500,300,1),(14,41,1,'First',1,1000,500,0)");
        JSONObject initial = snapshot(41);
        assertEquals("", initial.getString("summary"));
        database.execSQL("INSERT INTO briefing_summary_title VALUES(21,41,'Topic'),(22,42,'Wrong association')");
        database.execSQL("INSERT INTO briefing_summary VALUES(31,41,'Second summary',21,2),(30,41,'First summary',21,1)");
        JSONObject late = snapshot(41);
        assertEquals("Topic\nFirst summary\nSecond summary", late.getString("summary"));
        assertEquals(initial.getJSONArray("segments").toString(), late.getJSONArray("segments").toString());
        assertEquals(2, late.getJSONArray("nativeSummaryRows").length());
        assertEquals("First", late.getJSONArray("segments").getJSONObject(0).getString("text"));
        // Extracting does not overwrite any of the original persisted data.
        try (Cursor cursor = database.rawQuery("SELECT count(*),sum(is_edited) FROM briefing_converted_text", null)) {
            assertTrue(cursor.moveToFirst()); assertEquals(2, cursor.getInt(0)); assertEquals(1, cursor.getInt(1));
        }
    }

    @Test public void invalidTimingRemainsUnknownWhileRawEvidenceIsPreserved() throws Exception {
        database.execSQL("INSERT INTO briefing_converted_text VALUES(1,41,1,'Unknown',0,0,0,0),(2,41,2,'Overflow',1,9999,9223372036854775807,0)");
        JSONArray segments = snapshot(41).getJSONArray("segments");
        assertTrue(segments.getJSONObject(0).isNull("startMs"));
        assertTrue(segments.getJSONObject(0).isNull("endMs"));
        assertEquals(0, segments.getJSONObject(0).getLong("talkDurationMs"));
        assertEquals(10000, segments.getJSONObject(1).getLong("endMs"));
        assertEquals(Long.MAX_VALUE, segments.getJSONObject(1).getLong("talkDurationMs"));
    }

    @Test public void deletedMissingOrAmbiguousNativeAssociationsFailClosed() throws Exception {
        database.execSQL("INSERT INTO briefing_converted_text VALUES(1,41,1,'Words',0,100,300,0)");
        assertNull(snapshot(999));
        database.execSQL("UPDATE briefing_info SET deleted=1 WHERE _id=41");
        assertNull(snapshot(41));
        database.execSQL("UPDATE briefing_info SET deleted=0 WHERE _id=41");
        database.execSQL("INSERT INTO call_record_file(_id,briefing_info_id,content_uri,duration_in_ms,file_size_in_bytes) VALUES(9,41,'content://fixture/9',10000,120)");
        assertNull(snapshot(41));
        assertFalse(database.inTransaction());
    }

    @Test public void canonicalSnapshotRequiresExactRecordingAndAudioIdentity() throws Exception {
        assertNotNull(AdotSummaryNativeStore.snapshot(database, 7, "content://fixture/7"));
        assertNull(AdotSummaryNativeStore.snapshot(database, 7, "content://fixture/8"));
        assertNull(AdotSummaryNativeStore.snapshot(database, 8, "content://fixture/7"));
        assertNull(AdotSummaryNativeStore.snapshot(database, 99, "content://fixture/7"));
    }

    private JSONObject snapshot(long briefing) throws Exception {
        database.beginTransaction();
        try {
            long recording = AdotSummaryNativeStore.recording(database, briefing);
            String audio = AdotSummaryNativeStore.audio(database, recording);
            JSONObject raw = audio == null ? null : AdotSummaryNativeStore.snapshot(database, recording, audio);
            return raw == null ? null : AdotSummaryNativeStore.document(raw);
        } finally { database.endTransaction(); }
    }
}
