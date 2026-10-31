package app.bitchord.telegram;

import static org.junit.Assert.*;

import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.io.File;
import java.util.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class SqliteIndexStoreTest {
    static JSONObject row(long chat, long message, String title, String artist) throws Exception {
        return new JSONObject()
                .put("id", chat + "_" + message)
                .put("chat", chat)
                .put("message", message)
                .put("title", title)
                .put("artist", artist)
                .put("fileName", title + ".flac");
    }

    static List<String> titles(List<JSONObject> rows) {
        List<String> out = new ArrayList<>();
        for (JSONObject row : rows) out.add(row.optString("title"));
        return out;
    }

    SqliteIndexStore open() {
        return new SqliteIndexStore(
                new File(RuntimeEnvironment.getApplication().getFilesDir(), "test/index.db"));
    }

    @Test
    public void keepsWhatListeningFound() throws Exception {
        SqliteIndexStore store = open();
        JSONObject fake = row(-300, 1, "Song", "Artist").put("format", "flac");
        JSONObject untagged =
                row(-300, 2, "audio_2024", "").put("format", "mp3").put("tagged", false);
        store.put(-300, List.of(fake, untagged), 1);
        JSONObject check = new JSONObject().put("verdict", "lossy").put("kbps", 128);
        store.putFound(-300, 1, "check", "-300_1", check);
        store.putFound(
                -300,
                2,
                "names",
                "-300_2",
                new JSONObject().put("title", "Real Title").put("artist", "Real Artist"));
        assertEquals("lossy", store.row(-300, 1, 0).getJSONObject("check").getString("verdict"));
        assertEquals("Real Title", store.row(-300, 2, 0).getString("title"));
        assertEquals(
                "Searchable by the recognised name",
                1,
                store.search(List.of(-300L), TrackNames.words("real artist"), 10).size());
        // Read from Telegram again, as a rebuild does: what was found stays.
        store.put(
                -300,
                List.of(
                        row(-300, 1, "Song", "Artist").put("format", "flac"),
                        row(-300, 2, "audio_2024", "").put("format", "mp3").put("tagged", false)),
                2);
        store.prune(-300, 2);
        assertEquals(128, store.row(-300, 1, 0).getJSONObject("check").getInt("kbps"));
        assertEquals("Real Artist", store.row(-300, 2, 0).getString("artist"));
        assertEquals("lossy", store.found("check", "-300_1").getString("verdict"));
        assertNull(store.found("check", "-300_9"));
    }

    @Test
    public void storesSearchesAndPrunes() throws Exception {
        SqliteIndexStore store = open();
        store.put(
                -100,
                List.of(
                        row(-100, 1, "Nobody Knows You When You're Down and Out", "Nina Simone"),
                        row(-100, 2, "Nobody Home", "Pink Floyd"),
                        row(-100, 3, "Ain’t No Sunshine", "Bill Withers")),
                1);
        store.put(-200, List.of(row(-200, 9, "Nobody Home", "Cover Band")), 1);

        assertEquals(3, store.count(-100));
        assertTrue(store.has(-100, 2));
        assertFalse(store.has(-100, 4));
        assertEquals(
                List.of("Nobody Home", "Nobody Knows You When You're Down and Out"),
                titles(store.search(List.of(-100L), TrackNames.words("nobody"), 200)));
        assertEquals(
                "BitChord's run-together contraction",
                1,
                store.search(List.of(-100L), TrackNames.words("nobody knows youre down"), 200)
                        .size());
        assertEquals(
                "Curly apostrophe",
                1,
                store.search(List.of(-100L), TrackNames.words("aint no sunshine"), 200).size());
        assertEquals(
                "Words start words",
                2,
                store.search(List.of(-100L), TrackNames.words("nob"), 200).size());
        assertEquals(
                "Chats are kept apart",
                List.of("Nobody Home", "Nobody Home"),
                titles(store.search(List.of(-100L, -200L), TrackNames.words("home"), 200)));
        assertEquals(1, store.search(List.of(-100L, -200L), TrackNames.words("nobody"), 1).size());
        assertEquals(List.of("Ain’t No Sunshine", "Nobody Home"), titles(store.newest(-100, 2)));

        // Updating a file keeps one copy; a rebuild drops what it didn't see.
        store.put(-100, List.of(row(-100, 2, "Nobody Home (Remastered)", "Pink Floyd")), 2);
        store.put(-100, List.of(row(-100, 3, "Ain’t No Sunshine", "Bill Withers")), 2);
        store.prune(-100, 2);
        assertEquals(2, store.count(-100));
        assertEquals(
                List.of("Nobody Home (Remastered)"),
                titles(store.search(List.of(-100L), TrackNames.words("nobody"), 200)));
        assertTrue(
                "Its words went too",
                store.search(List.of(-100L), TrackNames.words("knows"), 200).isEmpty());
        assertEquals(1, store.count(-200));

        IndexStore.State state = store.state(-100);
        assertEquals(0, state.builtAt);
        state.cursor[0] = 77;
        state.total[0] = 223776;
        state.builtAt = 5;
        store.save(state);
        IndexStore.State again = open().state(-100);
        assertEquals(77, again.cursor[0]);
        assertEquals(223776, again.total[0]);
        assertEquals(5, again.builtAt);

        store.clear();
        assertEquals(0, store.count(-100));
        assertEquals(0, store.state(-100).builtAt);
    }

    @Test
    public void upgradesAndHoldsZipSongs() throws Exception {
        File file = new File(RuntimeEnvironment.getApplication().getFilesDir(), "old/index.db");
        file.getParentFile().mkdirs();
        // The layout 1.0.8 to 1.0.10 wrote: one file per message.
        android.database.sqlite.SQLiteDatabase old =
                android.database.sqlite.SQLiteDatabase.openOrCreateDatabase(file, null);
        old.execSQL(
                "CREATE TABLE files (id INTEGER PRIMARY KEY, chat INTEGER NOT NULL, message INTEGER"
                        + " NOT NULL, generation INTEGER NOT NULL, row TEXT NOT NULL, UNIQUE (chat,"
                        + " message))");
        old.execSQL("CREATE VIRTUAL TABLE words USING fts4(text)");
        old.execSQL(
                "INSERT INTO files VALUES (7, -100, 1, 1, '"
                        + row(-100, 1, "Comfortably Numb", "Pink Floyd")
                        + "')");
        old.execSQL("INSERT INTO words (docid, text) VALUES (7, 'comfortably numb pink floyd')");
        old.close();

        SqliteIndexStore store = new SqliteIndexStore(file);
        assertEquals("Kept through the upgrade", 1, store.count(-100));
        assertEquals(
                "Still searchable",
                List.of("Comfortably Numb"),
                titles(store.search(List.of(-100L), TrackNames.words("numb"), 200)));

        // A zip's songs share its message, each with its own entry.
        store.queueZips(-100, List.of(new JSONObject().put("chat", -100).put("message", 2)), 1);
        store.zipDone(-100, 2);
        List<JSONObject> songs = new ArrayList<>();
        for (int entry = 1; entry <= 3; entry++)
            songs.add(row(-100, 2, "Song " + entry, "Pink Floyd").put("entry", entry));
        store.put(-100, songs, 1);
        assertEquals(4, store.count(-100));
        assertEquals("Song 2", store.row(-100, 2, 2).getString("title"));
        assertNull(store.row(-100, 2, 9));
        assertEquals(
                "Newest message first, songs in zip order",
                List.of("Song 1", "Song 2", "Song 3", "Comfortably Numb"),
                titles(store.newest(-100, 10)));
        assertEquals(3, store.after(-100, 1, 10).size());

        // The queue of zips to open.
        JSONObject zip = new JSONObject().put("chat", -100).put("message", 5).put("file", 9);
        store.queueZips(-100, List.of(zip), 1);
        store.queueZips(-100, List.of(zip), 1);
        assertEquals(1, store.zipsWaiting(List.of(-100L)));
        assertEquals(5, store.nextZip(List.of(-100L)).getLong("message"));
        store.zipDone(-100, 5);
        assertNull(store.nextZip(List.of(-100L)));
        // Seen again in a rebuild: its songs join the new generation, so they aren't pruned.
        store.queueZips(-100, List.of(new JSONObject().put("chat", -100).put("message", 2)), 2);
        store.put(-100, List.of(row(-100, 1, "Comfortably Numb", "Pink Floyd")), 2);
        store.prune(-100, 2);
        assertEquals("Zip songs kept", 4, store.count(-100));
        store.clear();
    }

    @Test
    public void newestFirstAndCueSheetsSetAside() throws Exception {
        SqliteIndexStore store = open();
        List<JSONObject> rows = new java.util.ArrayList<>();
        for (int m = 1; m <= 5; m++) rows.add(row(-100, m, "Song " + m, "Artist"));
        rows.add(row(-100, 4, "Zip song", "Artist").put("entry", 2));
        store.put(-100, rows, 1);
        List<JSONObject> before = store.before(-100, 5, 10);
        assertEquals("Newest first, a post's songs in order", 4, before.get(0).getLong("message"));
        assertEquals(0, before.get(0).optInt("entry"));
        assertEquals(2, before.get(1).optInt("entry"));
        assertEquals(5, before.size());
        assertEquals(5, store.countBefore(-100, 5));

        JSONObject cue = new JSONObject().put("kind", "cue").put("chat", -100).put("message", 9);
        store.queueZips(-100, List.of(cue), 1);
        assertEquals(9, store.nextZip(List.of(-100L)).getLong("message"));
        store.deferZip(-100, 9);
        assertNull("Set aside", store.nextZip(List.of(-100L)));
        assertEquals(0, store.zipsWaiting(List.of(-100L)));
        store.wakeZips(-100);
        assertEquals(
                "Back once the chat is in", 9, store.nextZip(List.of(-100L)).getLong("message"));
        store.zipDone(-100, 9);
        assertNull(store.nextZip(List.of(-100L)));
        store.queueZips(-100, List.of(cue), 2);
        assertEquals(
                "A rebuild reads a cue sheet again",
                9,
                store.nextZip(List.of(-100L)).getLong("message"));
    }

    @Test
    public void largeChatSearchesQuickly() throws Exception {
        SqliteIndexStore store = open();
        Random random = new Random(1);
        String[] artists = {"Pink Floyd", "Nina Simone", "Dean Martin", "Ella Fitzgerald"};
        for (int page = 0; page < 500; page++) {
            List<JSONObject> rows = new ArrayList<>();
            for (int i = 0; i < 100; i++) {
                long message = page * 100L + i + 1;
                rows.add(
                        row(
                                -100,
                                message,
                                "Track " + random.nextInt(100000) + " Take " + message,
                                artists[random.nextInt(artists.length)]));
            }
            store.put(-100, rows, 1);
        }
        assertEquals(50000, store.count(-100));
        long start = System.nanoTime();
        List<JSONObject> found = store.search(List.of(-100L), TrackNames.words("take 4999"), 200);
        List<JSONObject> common = store.search(List.of(-100L), TrackNames.words("track"), 200);
        long millis = (System.nanoTime() - start) / 1_000_000;
        assertFalse(found.isEmpty());
        assertEquals(200, common.size());
        assertEquals("Newest first", 50000, common.get(0).getLong("message"));
        assertTrue("Searching 50,000 files took " + millis + " ms", millis < 1000);
        store.clear();
    }
}
