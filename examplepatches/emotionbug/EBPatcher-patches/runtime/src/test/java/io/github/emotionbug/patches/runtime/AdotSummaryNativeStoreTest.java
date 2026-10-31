package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.content.ContextWrapper;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import java.io.File;
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

/** Real production selection/write/journal paths against two SQLite databases; all text is synthetic. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
@SQLiteMode(SQLiteMode.Mode.NATIVE)
public final class AdotSummaryNativeStoreTest {
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    private SQLiteDatabase nativeDb;
    private SummaryStore store;
    private Context context;
    private static final String AUDIO = "content://fixture/7";

    @Before public void open() throws Exception {
        File root = temporary.newFolder("private");
        context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getNoBackupFilesDir() { return root; }
        };
        store = new SummaryStore(context); store.mode(SummaryStore.ALWAYS);
        nativeDb = SQLiteDatabase.create(null);
        nativeDb.execSQL("CREATE TABLE communication_log(cl_id INTEGER PRIMARY KEY,cl_date INTEGER NOT NULL,cl_deleted INTEGER NOT NULL DEFAULT 0)");
        nativeDb.execSQL("CREATE TABLE briefing_info(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,communication_log_id INTEGER NOT NULL DEFAULT 0,"
                + "upload_key TEXT,briefing_server_id INTEGER,call_create_time_in_millis INTEGER NOT NULL,file_key TEXT,additional_file_key TEXT,"
                + "convert_state INTEGER NOT NULL DEFAULT 100,upload_type INTEGER NOT NULL DEFAULT 0,briefing_source_type INTEGER NOT NULL DEFAULT 0,"
                + "my_talk_id INTEGER NOT NULL DEFAULT 0,call_title TEXT,deleted INTEGER NOT NULL DEFAULT 0,cr_date INTEGER NOT NULL,modified_date INTEGER NOT NULL)");
        nativeDb.execSQL("CREATE TABLE call_record_file(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,briefing_info_id INTEGER,content_uri TEXT,"
                + "duration_in_ms INTEGER NOT NULL,file_size_in_bytes INTEGER NOT NULL,file_create_time_in_ms INTEGER NOT NULL,cr_date INTEGER NOT NULL)");
        nativeDb.execSQL("CREATE UNIQUE INDEX file_briefing ON call_record_file(briefing_info_id)");
        nativeDb.execSQL("CREATE TABLE briefing_converted_text(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,briefing_info_id INTEGER NOT NULL,"
                + "sequence INTEGER NOT NULL,message TEXT NOT NULL,talker_id INTEGER NOT NULL DEFAULT 0,is_edited INTEGER NOT NULL DEFAULT 0,talk_time INTEGER NOT NULL DEFAULT 0,talk_duration INTEGER NOT NULL DEFAULT 0)");
        nativeDb.execSQL("CREATE UNIQUE INDEX message_sequence ON briefing_converted_text(briefing_info_id,sequence)");
        nativeDb.execSQL("CREATE TABLE briefing_summary_title(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,briefing_info_id INTEGER NOT NULL,summary_title TEXT NOT NULL)");
        nativeDb.execSQL("CREATE TABLE briefing_summary(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,briefing_info_id INTEGER NOT NULL,message_sequence INTEGER NOT NULL,summary TEXT,summary_title_id INTEGER)");
        nativeDb.execSQL("CREATE TABLE briefing_task(_id INTEGER PRIMARY KEY,briefing_info_id INTEGER,task_title TEXT)");
        nativeDb.execSQL("INSERT INTO communication_log VALUES(17,123456,0),(18,123456,0)");
        nativeDb.execSQL("INSERT INTO briefing_info(_id,communication_log_id,call_create_time_in_millis,convert_state,call_title,cr_date,modified_date,upload_key,briefing_server_id,file_key,my_talk_id) VALUES(41,17,123456,300,'API title',10,20,'existing-key',99,'file-key',3)");
        nativeDb.execSQL("INSERT INTO call_record_file VALUES(7,41,'content://fixture/7',10000,120,123456,10),(8,NULL,'content://fixture/8',10000,120,123456,10)");
        nativeDb.execSQL("INSERT INTO briefing_converted_text VALUES(11,41,0,'API words',3,1,1000,500)");
        nativeDb.execSQL("INSERT INTO briefing_summary_title VALUES(21,41,'API topic')");
        nativeDb.execSQL("INSERT INTO briefing_summary VALUES(31,41,0,'API summary',21)");
        nativeDb.execSQL("INSERT INTO briefing_task VALUES(51,41,'Native task untouched')");
    }
    @After public void close() { nativeDb.close(); store.close(); }
    private JSONObject raw() throws Exception { return AdotSummaryNativeStore.snapshot(nativeDb, 7, AUDIO); }
    private static AdotApiSnapshot original(JSONObject snapshot) throws Exception {
        return AdotApiSnapshot.capture(new OriginalResult(snapshot));
    }
    public static final class OriginalResult {
        public final int a;
        public final String b;
        public final java.util.List<OriginalUtterance> d = new java.util.ArrayList<>();
        OriginalResult(JSONObject snapshot) throws Exception {
            JSONObject info = snapshot.getJSONArray("briefing_info").getJSONObject(0);
            a = info.getInt("my_talk_id");
            b = info.isNull("call_title") ? null : info.getString("call_title");
            JSONArray rows = snapshot.getJSONArray("briefing_converted_text");
            for (int i = 0; i < rows.length(); i++) d.add(new OriginalUtterance(rows.getJSONObject(i)));
        }
    }
    public static final class OriginalUtterance {
        public final int a, c;
        public final String b;
        public final long d, e;
        OriginalUtterance(JSONObject row) throws Exception {
            a = row.getInt("sequence"); b = row.getString("message"); c = row.getInt("talker_id");
            d = row.getLong("talk_time"); e = row.getLong("talk_duration");
        }
    }
    private JSONObject local() throws Exception {
        return new JSONObject().put("title", "Local title").put("summary", "Local summary")
                .put("segments", new JSONArray().put(new JSONObject().put("text", "Local words").put("speaker", "Channel 1").put("startMs", 1200).put("endMs", 1700)));
    }
    private long ready(boolean api) throws Exception {
        JSONObject document = api ? AdotSummaryNativeStore.document(raw()) : null;
        store.event(7,41,Uri.parse(AUDIO),false,document == null ? null : document.getString("summary"),document == null ? null : document.toString());
        SummaryStore.Job job = store.next(true); assertNotNull(job);
        store.complete(job,"Local words","Local summary",local(),new JSONObject().put("source","local").put("reason","Fixture comparison"));
        store.release(job); return job.id;
    }
    private JSONObject apply(long id, boolean commitNative, boolean markCommitted) throws Exception {
        JSONObject after;
        nativeDb.beginTransaction();
        try {
            after = AdotSummaryNativeStore.select(nativeDb,store,id);
            if (commitNative) nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
        if (commitNative && markCommitted && after != null) {
            store.nativeAssociation(id,after.getLong("recordingId"),after.getString("audioUri"),after.getLong("briefingId"));
            store.nativeCommitted(after);
            store.nativePrune();
        }
        return after;
    }
    private long scalar(String sql) {
        try (Cursor c = nativeDb.rawQuery(sql,null)) { assertTrue(c.moveToFirst()); return c.getLong(0); }
    }

    @Test public void selectedResultUsesCanonicalRowsAndApiRestorationPreservesOriginalIds() throws Exception {
        JSONObject original = raw(); long id = ready(true);
        JSONObject after = apply(id,true,true);
        assertEquals("local",store.nativeOutcome(store.job(id)));
        assertEquals("Local title",after.getJSONArray("briefing_info").getJSONObject(0).getString("call_title"));
        assertEquals("Local words",after.getJSONArray("briefing_converted_text").getJSONObject(0).getString("message"));
        assertTrue(after.getJSONArray("briefing_converted_text").getJSONObject(0).getLong("_id") > 11);
        assertEquals(1,scalar("SELECT count(*) FROM briefing_summary WHERE briefing_info_id=41"));
        assertEquals(-1,scalar("SELECT message_sequence FROM briefing_summary WHERE briefing_info_id=41"));
        assertEquals(500,scalar("SELECT talk_duration FROM briefing_converted_text WHERE briefing_info_id=41"));
        assertEquals(99,scalar("SELECT briefing_server_id FROM briefing_info WHERE _id=41"));
        assertEquals(20,scalar("SELECT modified_date FROM briefing_info WHERE _id=41"));
        assertEquals(1,scalar("SELECT count(*) FROM briefing_task WHERE _id=51"));
        assertEquals(original.toString(),new JSONObject(store.nativeJournal(7,AUDIO).getString("backup")).toString());
        assertEquals(after.toString(),apply(id,true,true).toString()); // no generated-ID churn
        store.chooseJob(id,"api"); apply(id,true,true);
        assertEquals("api",store.nativeOutcome(store.job(id)));
        assertEquals(original.toString(),raw().toString());
    }

    @Test public void journalDistinguishesRollbackAndCommitBeforeAcknowledgement() throws Exception {
        JSONObject original = raw(); long id = ready(true);
        JSONObject rolledBack = apply(id,false,false);
        assertEquals(original.toString(),raw().toString());
        assertFalse(store.nativeOwned(original));
        assertEquals("pending",store.nativeOutcome(store.job(id)));
        assertTrue(store.nativePendingBriefings().contains(41L));
        assertFalse(store.nativeBeforeApi(original)); // rolled-back local IDs must never delete API rows
        JSONObject committed = apply(id,true,false);
        assertTrue(store.nativeOwned(committed));
        assertEquals("pending",store.nativeOutcome(store.job(id)));
        assertEquals(committed.toString(),apply(id,true,true).toString());
        assertEquals("local",store.nativeOutcome(store.job(id)));
        assertFalse(store.nativePendingBriefings().contains(41L));
        assertNotNull(rolledBack);
    }

    @Test public void lateApiInsertReplacesLocalSequencesInsideTheSameTransaction() throws Exception {
        long id = ready(true); JSONObject applied = apply(id,true,true);
        nativeDb.beginTransaction();
        try {
            assertTrue(store.nativeBeforeApi(raw()));
            AdotSummaryNativeStore.removeApplied(nativeDb,new JSONObject(store.nativeJournal(7,AUDIO).getString("expected")));
            nativeDb.execSQL("INSERT OR ABORT INTO briefing_converted_text(briefing_info_id,sequence,message,talker_id,is_edited,talk_time,talk_duration) VALUES(41,0,'Late API words',3,0,1500,500)");
            // No success mark: original DAO failure rolls BOTH cleanup and insert back.
        } finally { nativeDb.endTransaction(); }
        assertEquals(applied.toString(),raw().toString());
        store.nativeApiPending(7,false); store.nativeCommitted(applied);
        nativeDb.beginTransaction();
        try {
            assertTrue(store.nativeBeforeApi(raw()));
            AdotSummaryNativeStore.removeApplied(nativeDb,new JSONObject(store.nativeJournal(7,AUDIO).getString("expected")));
            nativeDb.execSQL("INSERT OR ABORT INTO briefing_converted_text(briefing_info_id,sequence,message,talker_id,is_edited,talk_time,talk_duration) VALUES(41,0,'Late API words',3,0,1500,500)");
            nativeDb.execSQL("INSERT INTO briefing_summary(briefing_info_id,message_sequence,summary) VALUES(41,0,'Late API summary')");
            nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
        JSONObject api = raw(); assertFalse(store.nativeOwned(api)); store.nativeBackup(api);
        JSONObject document = AdotSummaryNativeStore.document(api);
        store.event(7,41,Uri.parse(AUDIO),false,document.getString("summary"),document.toString());
        store.nativeApiPending(7,false); apply(id,true,true);
        assertEquals("api",store.nativeOutcome(store.job(id))); // latest comparison is pending; API wins meanwhile
        assertEquals(1,scalar("SELECT count(*) FROM briefing_converted_text WHERE briefing_info_id=41"));
        assertEquals(1,scalar("SELECT count(*) FROM briefing_summary WHERE briefing_info_id=41"));
        assertEquals(api.toString(),raw().toString());
    }

    @Test public void summaryOnlyApiKeepsItsNewTitleWhileRemovingOnlyOwnedRows() throws Exception {
        long id = ready(true); apply(id,true,true);
        nativeDb.beginTransaction();
        try {
            nativeDb.execSQL("INSERT INTO briefing_summary_title(briefing_info_id,summary_title) VALUES(41,'Late API topic')");
            long title = scalar("SELECT max(_id) FROM briefing_summary_title");
            assertTrue(store.nativeBeforeApi(raw()));
            AdotSummaryNativeStore.removeApplied(nativeDb,new JSONObject(store.nativeJournal(7,AUDIO).getString("expected")));
            assertEquals(1,scalar("SELECT count(*) FROM briefing_summary_title WHERE _id=" + title));
            nativeDb.execSQL("INSERT INTO briefing_summary(briefing_info_id,message_sequence,summary,summary_title_id) VALUES(41,-1,'API summary only'," + title + ")");
            nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
        assertEquals(0,scalar("SELECT count(*) FROM briefing_converted_text WHERE briefing_info_id=41"));
        assertEquals(1,scalar("SELECT count(*) FROM briefing_summary_title WHERE briefing_info_id=41"));
    }

    @Test public void nativeEditsSurviveAnUnchangedSelectionAndUnknownTimesStayBounded() throws Exception {
        long id = ready(true); apply(id,true,true);
        nativeDb.execSQL("UPDATE briefing_converted_text SET message='Native edit',is_edited=1 WHERE briefing_info_id=41");
        assertNull(apply(id,true,true));
        assertEquals("Native edit",raw().getJSONArray("briefing_converted_text").getJSONObject(0).getString("message"));
        JSONObject candidate = local(); candidate.getJSONArray("segments").getJSONObject(0).put("startMs",JSONObject.NULL).put("endMs",JSONObject.NULL);
        nativeDb.beginTransaction();
        try { AdotSummaryNativeStore.local(nativeDb,raw(),AdotSpeakerMapping.resolve(candidate,AdotSummaryNativeStore.document(raw()),"auto"),300); nativeDb.setTransactionSuccessful(); }
        finally { nativeDb.endTransaction(); }
        assertEquals(0,scalar("SELECT talk_time FROM briefing_converted_text WHERE briefing_info_id=41"));
        assertEquals(0,scalar("SELECT talk_duration FROM briefing_converted_text WHERE briefing_info_id=41"));
    }

    private JSONObject stereo() throws Exception {
        return new JSONObject().put("title","Local title").put("summary","Local summary").put("segments",new JSONArray()
                .put(utterance("Channel 2","다음 주 회의 자료를 보내 드리겠습니다",500,1500))
                .put(utterance("Channel 1","보내 주시면 확인하고 연락드리겠습니다",2000,3000))
                .put(utterance("Channel 2","네",3500,4000)));
    }
    private JSONObject utterance(String speaker,String text,long start,long end) throws Exception {
        return new JSONObject().put("speaker",speaker).put("text",text).put("startMs",start).put("endMs",end);
    }
    private long stereoReady() throws Exception {
        nativeDb.execSQL("DELETE FROM briefing_converted_text");
        nativeDb.execSQL("INSERT INTO briefing_converted_text VALUES(11,41,0,'다음 주 회의 자료를 보내 드리겠습니다',3,0,500,1000)");
        nativeDb.execSQL("INSERT INTO briefing_converted_text VALUES(12,41,1,'보내 주시면 확인하고 연락드리겠습니다',7,0,2000,1000)");
        JSONObject api=AdotSummaryNativeStore.document(raw());
        store.event(7,41,Uri.parse(AUDIO),false,api.getString("summary"),api.toString());
        SummaryStore.Job job=store.next(true); assertNotNull(job);
        store.complete(job,"Stereo words","Local summary",stereo(),new JSONObject().put("source","local").put("reason","Fixture comparison"));
        store.release(job); return job.id;
    }
    private JSONObject installLegacySpeakerRows(long id) throws Exception {
        apply(id,true,true);
        nativeDb.execSQL("UPDATE briefing_converted_text SET talker_id=CASE sequence WHEN 1 THEN 2 ELSE 1 END WHERE briefing_info_id=41");
        JSONObject legacy=raw();
        store.nativeIntent(legacy,new JSONObject().put("source","local").put("selected",stereo()));
        store.nativeCommitted(legacy);
        return legacy;
    }

    @Test public void nativeSelfAndRemoteRowsFollowApiIdentityNotChannelOrder() throws Exception {
        long id=stereoReady(); JSONObject api=raw();
        JSONObject result=apply(id,true,true);
        assertEquals(3,scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"));
        assertEquals(3,scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=0"));
        assertEquals(7,scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=1"));
        assertEquals(3,scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=2"));
        assertEquals(2,scalar("SELECT count(*) FROM briefing_converted_text t JOIN briefing_info b ON b._id=t.briefing_info_id WHERE t.talker_id=b.my_talk_id"));
        assertEquals(500,scalar("SELECT talk_time FROM briefing_converted_text WHERE sequence=0"));
        assertEquals(result.toString(),apply(id,true,true).toString());
        store.chooseJob(id,"api"); apply(id,true,true);
        assertEquals(api.toString(),raw().toString());
    }

    @Test public void legacyMappingUpgradePreservesNativeRowIdsAndUserTextEdits() throws Exception {
        long id=stereoReady(); JSONObject legacy=installLegacySpeakerRows(id);
        nativeDb.execSQL("UPDATE briefing_converted_text SET message='User corrected transcript',is_edited=1 WHERE sequence=0");
        nativeDb.execSQL("UPDATE briefing_info SET call_title='User title' WHERE _id=41");
        nativeDb.execSQL("UPDATE briefing_summary SET summary='User summary' WHERE briefing_info_id=41");
        JSONObject result=apply(id,true,true);
        JSONArray before=legacy.getJSONArray("briefing_converted_text"), after=result.getJSONArray("briefing_converted_text");
        for(int i=0;i<before.length();i++) assertEquals(before.getJSONObject(i).getLong("_id"),after.getJSONObject(i).getLong("_id"));
        assertEquals("User corrected transcript",after.getJSONObject(0).getString("message"));
        assertEquals(1,after.getJSONObject(0).getInt("is_edited"));
        assertEquals(3,after.getJSONObject(0).getInt("talker_id"));
        assertEquals(7,after.getJSONObject(1).getInt("talker_id"));
        assertEquals("User title",result.getJSONArray("briefing_info").getJSONObject(0).getString("call_title"));
        assertEquals("User summary",result.getJSONArray("briefing_summary").getJSONObject(0).getString("summary"));
        assertEquals(result.toString(),apply(id,true,true).toString());
        assertEquals("local",store.nativeOutcome(store.job(id)));
        for (String channel : new String[]{"Channel 1","Channel 2","auto"}) {
            store.selfChannel(id,channel);
            JSONObject changed=apply(id,true,true);
            assertEquals("User corrected transcript",changed.getJSONArray("briefing_converted_text").getJSONObject(0).getString("message"));
            assertEquals(before.getJSONObject(0).getLong("_id"),changed.getJSONArray("briefing_converted_text").getJSONObject(0).getLong("_id"));
            assertEquals("User title",changed.getJSONArray("briefing_info").getJSONObject(0).getString("call_title"));
            assertEquals("User summary",changed.getJSONArray("briefing_summary").getJSONObject(0).getString("summary"));
        }
    }

    @Test public void speakerRepairDoesNotResurrectDeletedUtterancesOrOverwriteEditedSpeakerIds() throws Exception {
        long id=stereoReady(); installLegacySpeakerRows(id);
        nativeDb.execSQL("DELETE FROM briefing_converted_text WHERE sequence=2");
        nativeDb.execSQL("UPDATE briefing_converted_text SET talker_id=8 WHERE sequence=1");
        apply(id,true,true);
        assertEquals(2,scalar("SELECT count(*) FROM briefing_converted_text WHERE briefing_info_id=41"));
        assertEquals(3,scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=0"));
        assertEquals(8,scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=1"));
        store.close(); store = new SummaryStore(context);
        for (String channel : new String[]{"Channel 1","Channel 2","auto"}) {
            store.selfChannel(id,channel); apply(id,true,true);
            assertEquals(2,scalar("SELECT count(*) FROM briefing_converted_text WHERE briefing_info_id=41"));
            assertEquals(8,scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=1"));
        }
    }

    @Test public void explicitSelfChannelWorksWithoutApiAndCanBeCorrectedWithoutReplacingText() throws Exception {
        nativeDb.execSQL("DELETE FROM briefing_converted_text");
        nativeDb.execSQL("DELETE FROM briefing_summary");
        nativeDb.execSQL("DELETE FROM briefing_summary_title");
        store.event(7,41,Uri.parse(AUDIO),false,null,null);
        SummaryStore.Job job=store.next(true); assertNotNull(job);
        store.complete(job,"Stereo words","Local summary",stereo(),new JSONObject().put("source","local").put("reason","No API"));
        store.release(job);
        store.selfChannel(job.id,"Channel 2");
        JSONObject first=apply(job.id,true,true);
        assertEquals(scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"),
                scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=0"));
        assertNotEquals(scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"),
                scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=1"));
        store.selfChannel(job.id,"Channel 1");
        JSONObject second=apply(job.id,true,true);
        assertEquals(first.getJSONArray("briefing_converted_text").getJSONObject(0).getLong("_id"),
                second.getJSONArray("briefing_converted_text").getJSONObject(0).getLong("_id"));
        assertEquals(scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"),
                scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=1"));
        assertNotEquals(scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"),
                scalar("SELECT talker_id FROM briefing_converted_text WHERE sequence=0"));
    }

    @Test public void recoveryAfterApiCommitPreservesRowsAndQueuesTheirComparison() throws Exception {
        long id = ready(true); apply(id,true,true);
        nativeDb.beginTransaction();
        try {
            assertTrue(store.nativeBeforeApi(raw()));
            AdotSummaryNativeStore.removeApplied(nativeDb,new JSONObject(store.nativeJournal(7,AUDIO).getString("expected")));
            nativeDb.execSQL("INSERT INTO briefing_converted_text(briefing_info_id,sequence,message,talker_id) VALUES(41,0,'Committed late API',3)");
            nativeDb.execSQL("INSERT INTO briefing_summary(briefing_info_id,message_sequence,summary) VALUES(41,0,'Committed late summary')");
            nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
        JSONObject committedApi = raw();
        store.close(); store = new SummaryStore(context);
        nativeDb.beginTransaction();
        try {
            assertNull(AdotSummaryNativeStore.recover(nativeDb,store,41));
            nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
        assertEquals(committedApi.toString(),raw().toString());
        assertEquals(committedApi.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
        assertEquals("queued",store.job(id).state);
        assertTrue(store.job(id).apiDocument.contains("Committed late API"));
        assertFalse(store.job(id).localDocument.isEmpty());
        assertFalse(store.nativePendingBriefings().contains(41L));
    }

    @Test public void localApplyCapturesApiBeforeItsQueuedSuccessCallback() throws Exception {
        nativeDb.execSQL("UPDATE briefing_converted_text SET is_edited=0");
        JSONObject original = raw(); long id = ready(false);
        apply(id,true,true);
        assertEquals(original.toString(),raw().toString()); // Until comparison, retain the newly discovered API.
        assertEquals("queued",store.job(id).state);
        assertTrue(store.job(id).apiDocument.contains("API words"));
        assertFalse(store.job(id).localDocument.isEmpty());
        int revision = store.job(id).revision;
        AdotSummaryNativeStore.captureOriginal(store,raw(),original(original));
        assertEquals(revision,store.job(id).revision); // Delayed duplicate callback does not queue another revision.
    }

    @Test public void ownedCallbackConsumesUnrecordedApiBackupWithoutPromotingLocalRows() throws Exception {
        nativeDb.execSQL("UPDATE briefing_converted_text SET is_edited=0");
        long id = ready(false);
        JSONObject original = raw(); store.nativeBackup(original);
        nativeDb.beginTransaction();
        try {
            AdotSummaryNativeStore.local(nativeDb,original,store.presentation(store.job(id)).getJSONObject("selected"),300);
            store.nativeIntent(raw(),store.presentation(store.job(id)));
            nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
        JSONObject applied = raw(); store.nativeCommitted(applied);
        AdotSummaryNativeStore.captureOriginal(store,applied,original(original));
        assertEquals(applied.toString(),raw().toString());
        assertEquals("queued",store.job(id).state);
        assertTrue(store.job(id).apiDocument.contains("API words"));
        assertFalse(store.job(id).apiDocument.contains("Local words"));
    }

    @Test public void delayedCallbackCannotMixOldSelfWithNewTranscriptGeneration() throws Exception {
        stereoReady();
        AdotApiSnapshot old = original(raw());
        nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=7 WHERE _id=41");
        nativeDb.execSQL("UPDATE briefing_converted_text SET talker_id=CASE talker_id WHEN 3 THEN 7 ELSE 3 END");
        JSONObject current = raw();
        assertTrue(AdotSummaryNativeStore.captureApi(store,current));
        String backup = store.nativeJournal(7,AUDIO).getString("backup");
        int revision = store.briefing(41).revision;
        AdotSummaryNativeStore.captureOriginal(store,current,old);
        assertEquals(backup,store.nativeJournal(7,AUDIO).getString("backup"));
        assertEquals(revision,store.briefing(41).revision);
        JSONObject mapped = store.presentation(store.briefing(41)).getJSONObject("selected");
        assertEquals(7,mapped.getInt("myTalkId"));
        assertEquals(7,mapped.getJSONArray("segments").getJSONObject(0).getInt("talkerId"));
        assertEquals(3,mapped.getJSONArray("segments").getJSONObject(1).getInt("talkerId"));
    }

    @Test public void delayedCallbackDoesNotUndoNativeSelfCorrection() throws Exception {
        stereoReady();
        AdotApiSnapshot old = original(raw());
        nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=7 WHERE _id=41");
        JSONObject corrected = raw();
        assertTrue(AdotSummaryNativeStore.captureApi(store,corrected));
        AdotSummaryNativeStore.captureOriginal(store,corrected,old);
        assertEquals(corrected.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
        JSONObject api = new JSONObject(store.briefing(41).apiDocument);
        assertEquals(7,api.getInt("myTalkId"));
        assertEquals(3,api.getJSONArray("segments").getJSONObject(0).getInt("talkerId"));
    }

    @Test public void ownedCallbackCannotRelabelRetainedOriginalWithAnotherSelf() throws Exception {
        long id = stereoReady();
        JSONObject old = raw();
        JSONObject detached = new JSONObject(old.toString());
        detached.getJSONArray("briefing_info").getJSONObject(0).put("my_talk_id",7);
        JSONObject applied = apply(id,true,true);
        AdotSummaryNativeStore.captureOriginal(store,applied,original(detached));
        assertEquals(old.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
        assertEquals(applied.toString(),raw().toString());
        JSONObject selected = store.presentation(store.job(id)).getJSONObject("selected");
        assertEquals(3,selected.getInt("myTalkId"));
        assertEquals(3,selected.getJSONArray("segments").getJSONObject(0).getInt("talkerId"));
        assertEquals(7,selected.getJSONArray("segments").getJSONObject(1).getInt("talkerId"));
    }

    @Test public void mixedOwnedAndNewRowsCannotBecomeIndependentApiEvidence() throws Exception {
        long id = stereoReady();
        JSONObject original = raw();
        apply(id,true,true);
        nativeDb.execSQL("INSERT INTO briefing_converted_text(briefing_info_id,sequence,message,talker_id) VALUES(41,99,'New external words',3)");
        assertFalse(AdotSummaryNativeStore.captureApi(store,raw()));
        assertEquals(original.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
        assertFalse(store.job(id).apiDocument.contains("New external words"));
        assertFalse(store.job(id).apiDocument.contains("Local words"));
    }

    @Test public void queuedApiSelfCorrectionMovesOwnSpeechWithoutReplacingNativeContent() throws Exception {
        nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=0 WHERE _id=41");
        nativeDb.execSQL("DELETE FROM briefing_converted_text");
        nativeDb.execSQL("INSERT INTO briefing_converted_text VALUES(11,41,0,'Remote greeting',0,0,100,400)");
        nativeDb.execSQL("INSERT INTO briefing_converted_text VALUES(12,41,1,'My answer',1,0,600,400)");
        JSONObject original = raw();
        assertTrue(AdotSummaryNativeStore.captureApi(store,original));
        long id = store.briefing(41).id;
        int revision = store.job(id).revision;
        assertEquals("queued",store.job(id).state);
        store.selfTalker(id,1);
        JSONObject corrected = apply(id,true,true);
        assertEquals(1,scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"));
        assertEquals(1,scalar("SELECT t.sequence FROM briefing_converted_text t JOIN briefing_info b ON b._id=t.briefing_info_id WHERE t.talker_id=b.my_talk_id"));
        assertEquals(original.getJSONArray("briefing_converted_text").toString(),corrected.getJSONArray("briefing_converted_text").toString());
        assertEquals(original.getJSONArray("briefing_summary").toString(),corrected.getJSONArray("briefing_summary").toString());
        assertEquals(original.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
        assertEquals(0,new JSONObject(store.job(id).apiDocument).getInt("myTalkId"));
        assertEquals(revision,store.job(id).revision);
        assertEquals("queued",store.job(id).state);
        assertFalse(AdotSummaryNativeStore.captureApi(store,corrected));

        nativeDb.execSQL("UPDATE briefing_converted_text SET message='User corrected words',is_edited=1 WHERE _id=11");
        nativeDb.execSQL("UPDATE briefing_info SET call_title='User corrected title' WHERE _id=41");
        nativeDb.execSQL("UPDATE briefing_summary SET summary='User corrected summary' WHERE _id=31");
        for (int speaker : new int[]{0,1,-1}) {
            store.selfTalker(id,speaker);
            JSONObject changed = apply(id,true,true);
            assertEquals(speaker < 0 ? 0 : speaker,scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"));
            assertEquals("User corrected words",changed.getJSONArray("briefing_converted_text").getJSONObject(0).getString("message"));
            assertEquals(11,changed.getJSONArray("briefing_converted_text").getJSONObject(0).getLong("_id"));
            assertEquals("User corrected title",changed.getJSONArray("briefing_info").getJSONObject(0).getString("call_title"));
            assertEquals("User corrected summary",changed.getJSONArray("briefing_summary").getJSONObject(0).getString("summary"));
            assertEquals(original.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
            assertEquals(revision,store.job(id).revision);
        }
    }

    @Test public void explicitApiIdentityAlsoControlsLocalAnchorMapping() throws Exception {
        long id = stereoReady();
        JSONObject original = raw();
        store.nativeBackup(original);
        store.selfTalker(id,7);
        JSONObject mapped = apply(id,true,true);
        assertEquals(7,mapped.getJSONArray("briefing_info").getJSONObject(0).getInt("my_talk_id"));
        assertEquals(7,mapped.getJSONArray("briefing_converted_text").getJSONObject(1).getInt("talker_id"));
        assertEquals(3,mapped.getJSONArray("briefing_converted_text").getJSONObject(0).getInt("talker_id"));
        assertEquals(original.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
        store.chooseJob(id,"api");
        JSONObject api = apply(id,true,true);
        assertEquals(7,api.getJSONArray("briefing_info").getJSONObject(0).getInt("my_talk_id"));
        assertEquals(original.getJSONArray("briefing_converted_text").toString(),api.getJSONArray("briefing_converted_text").toString());
    }

    @Test public void olderRetrySurvivesFiveNewerResultsAndRestartUntilNativeCommit() throws Exception {
        JSONObject api = AdotSummaryNativeStore.document(raw());
        store.event(7,41,Uri.parse(AUDIO),false,api.getString("summary"),api.toString());
        SummaryStore.Job older = store.next(true); assertNotNull(older);
        store.state(older,"failed","Retry fixture"); store.release(older);
        for (int i = 100; i < 105; i++) {
            store.event(i,i,Uri.parse("content://fixture/" + i),false,null,null);
            SummaryStore.Job newer = store.next(true); assertNotNull(newer);
            if (i == 104) store.retry(older.id); // Retry queues behind the fifth newer call already running.
            store.complete(newer,"Local words","Local summary",local(),new JSONObject().put("source","local").put("reason","Only result"));
            store.release(newer);
        }
        older = store.next(true); assertNotNull(older); assertEquals(7,older.recordingId);
        store.complete(older,"Local words","Local summary",local(),new JSONObject().put("source","local").put("reason","Selected"));
        store.release(older);
        assertEquals(5,store.list().size());
        assertNotNull(store.job(older.id));
        store.close(); store = new SummaryStore(context);
        assertNotNull(store.job(older.id));
        apply(older.id,true,true);
        assertEquals("Local title",raw().getJSONArray("briefing_info").getJSONObject(0).getString("call_title"));
        assertNull(store.job(older.id));
        assertEquals(5,store.list().size());
    }

    @Test public void staleBriefingIdentityDoesNotCommitAnEmptyAssociation() throws Exception {
        store.event(8,41,Uri.parse("content://fixture/8"),false,null,null);
        SummaryStore.Job job = store.next(true); assertNotNull(job);
        store.complete(job,"Local words","Local summary",local(),new JSONObject().put("source","local").put("reason","Only result"));
        store.release(job);
        store.nativeMapping(8,18);
        assertNull(apply(job.id,true,true));
        assertEquals(1,scalar("SELECT count(*) FROM briefing_info"));
        assertEquals(0,scalar("SELECT count(*) FROM call_record_file WHERE _id=8 AND briefing_info_id>0"));
    }

    @Test public void missingBriefingUsesExactNativeMappingAndNeverPhoneOrTimestamp() throws Exception {
        store.event(8,0,Uri.parse("content://fixture/8"),false,null,null);
        SummaryStore.Job job = store.next(true); assertNotNull(job);
        store.complete(job,"Local words","Local summary",local(),new JSONObject().put("source","local").put("reason","Only result"));
        store.release(job);
        assertNull(apply(job.id,true,true));
        store.nativeMapping(8,18);
        JSONObject result = apply(job.id,true,true);
        long briefing = result.getLong("briefingId"); assertTrue(briefing > 41);
        assertEquals(18,scalar("SELECT communication_log_id FROM briefing_info WHERE _id=" + briefing));
        assertEquals(300,scalar("SELECT convert_state FROM briefing_info WHERE _id=" + briefing));
        assertEquals(3,scalar("SELECT briefing_source_type FROM briefing_info WHERE _id=" + briefing));
        assertEquals(0,scalar("SELECT count(*) FROM briefing_info WHERE _id=" + briefing + " AND (upload_key IS NOT NULL OR briefing_server_id IS NOT NULL OR file_key IS NOT NULL)"));
        assertEquals(2,scalar("SELECT count(*) FROM briefing_info"));
        assertEquals(result.toString(),apply(job.id,true,true).toString());
        assertThrows(IllegalStateException.class,() -> store.nativeMapping(8,17));
        assertEquals(-1,store.nativeCommunication(8));
    }

    @Test public void nativePublicationPreventsApiParentAndLocalIdentityFromMixing() throws Exception {
        nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=0 WHERE _id=41");
        nativeDb.execSQL("DELETE FROM briefing_converted_text"); // Earlier API summary without STT.
        assertTrue(AdotSummaryNativeStore.captureApi(store,raw()));
        apply(store.briefing(41).id,true,true);
        long id = ready(true);
        Object publication = new Object();
        AdotApiPublication.begin(publication);
        JSONObject api;
        try {
            preparePublication();
            // Exact native order: yx9.v/u/j parent transaction, then yx9.l/iw9.f children.
            nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=1,call_title='Server title' WHERE _id=41");
            assertNull(apply(id,true,true));
            assertEquals(1,scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"));
            assertEquals(0,scalar("SELECT count(*) FROM briefing_converted_text"));
            nativeDb.execSQL("INSERT INTO briefing_converted_text(briefing_info_id,sequence,message,talker_id,is_edited,talk_time,talk_duration) VALUES"
                    + "(41,0,'Remote greeting',0,0,100,400),(41,1,'My answer',1,0,600,400)");
            api = raw();
            AdotSummaryNativeStore.captureOriginal(store,api,original(api));
            store.nativeApiPending(7,false);
            assertNull(apply(id,true,true)); // Completion callback can precede the outer coroutine's end.
        } finally { AdotApiPublication.end(publication); }
        JSONObject selected = apply(id,true,true);
        assertEquals(api.toString(),selected.toString());
        assertEquals(1,new JSONObject(store.job(id).apiDocument).getInt("myTalkId"));
        assertEquals(1,scalar("SELECT sequence FROM briefing_converted_text t JOIN briefing_info b ON b._id=t.briefing_info_id WHERE t.talker_id=b.my_talk_id"));
        assertEquals(api.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
    }

    @Test public void failedApiChildrenRestoreLocalIdentityNotAlreadyUpdatedApiParent() throws Exception {
        long id = ready(true);
        JSONObject local = apply(id,true,true);
        Object publication = new Object();
        AdotApiPublication.begin(publication);
        try {
            nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=99,call_title='New API title' WHERE _id=41");
            nativeDb.beginTransaction();
            try {
                assertTrue(store.nativeBeforeApi(raw()));
                AdotSummaryNativeStore.removeApplied(nativeDb,new JSONObject(store.nativeJournal(7,AUDIO).getString("expected")));
                // Native child insertion fails: its transaction rolls back.
            } finally { nativeDb.endTransaction(); }
            nativeDb.beginTransaction();
            try {
                assertNull(AdotSummaryNativeStore.recover(nativeDb,store,41));
                nativeDb.setTransactionSuccessful();
            } finally { nativeDb.endTransaction(); }
            assertEquals(99,scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"));
        } finally { AdotApiPublication.end(publication); }
        nativeDb.beginTransaction();
        JSONObject restored;
        try {
            restored = AdotSummaryNativeStore.recover(nativeDb,store,41);
            nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
        assertEquals(local.toString(),restored.toString());
    }

    private void preparePublication() throws Exception {
        nativeDb.beginTransaction();
        try {
            AdotSummaryNativeStore.preparePublication(nativeDb,store,41);
            nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
    }

    @Test public void publicationJournalSurvivesDeathBetweenParentAndChildrenIncludingNativeEdits() throws Exception {
        long id = ready(true); apply(id,true,true);
        nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=7,call_title='User title' WHERE _id=41");
        nativeDb.execSQL("UPDATE briefing_converted_text SET message='User words',is_edited=1");
        JSONObject before = raw();
        preparePublication();
        nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=1,call_title='New API title' WHERE _id=41");
        store.close(); store = new SummaryStore(context);
        assertTrue(store.nativePendingBriefings().contains(41L));
        nativeDb.beginTransaction();
        JSONObject recovered;
        try {
            recovered = AdotSummaryNativeStore.recover(nativeDb,store,41);
            nativeDb.setTransactionSuccessful();
        } finally { nativeDb.endTransaction(); }
        assertEquals(before.toString(),recovered.toString());
    }

    @Test public void authenticatedParentOnlyApiRevisionReplacesOldSpeakerAuthority() throws Exception {
        nativeDb.execSQL("UPDATE briefing_converted_text SET is_edited=0");
        assertTrue(AdotSummaryNativeStore.captureApi(store,raw()));
        long id = store.briefing(41).id; apply(id,true,true);
        preparePublication();
        nativeDb.execSQL("UPDATE briefing_info SET my_talk_id=7 WHERE _id=41");
        JSONObject latest = raw();
        AdotSummaryNativeStore.captureOriginal(store,latest,original(latest));
        store.nativeApiPending(7,false); apply(id,true,true);
        assertEquals(7,new JSONObject(store.job(id).apiDocument).getInt("myTalkId"));
        assertEquals(latest.toString(),store.nativeJournal(7,AUDIO).getString("backup"));
        assertEquals(7,scalar("SELECT my_talk_id FROM briefing_info WHERE _id=41"));
    }

    @Test public void continuedRequestRequiresUniqueLiveServerBinding() {
        assertEquals(41,AdotSummaryNativeStore.briefingForServer(nativeDb,99));
        nativeDb.execSQL("INSERT INTO briefing_info(_id,call_create_time_in_millis,cr_date,modified_date,briefing_server_id) VALUES(42,123,0,0,99)");
        assertEquals(0,AdotSummaryNativeStore.briefingForServer(nativeDb,99));
        nativeDb.execSQL("UPDATE briefing_info SET deleted=1 WHERE _id=42");
        assertEquals(41,AdotSummaryNativeStore.briefingForServer(nativeDb,99));
        assertEquals(0,AdotSummaryNativeStore.briefingForServer(nativeDb,0));
    }
}
