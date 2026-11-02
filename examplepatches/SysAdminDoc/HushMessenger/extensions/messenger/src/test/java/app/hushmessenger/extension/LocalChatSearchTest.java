package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class LocalChatSearchTest {
    private static final long CHAT = 111, OTHER_CHAT = 222;
    private File folder;
    private SQLiteDatabase database;

    @Before public void reset() throws Exception {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        folder = Files.createTempDirectory("databases").toFile();
        database = SQLiteDatabase.openOrCreateDatabase(new File(folder, "msys_database_42"), null);
        database.execSQL("CREATE TABLE messages(thread_key LONG_INT NOT NULL, timestamp_ms LONG_INT NOT NULL DEFAULT 0, message_id TEXT NOT NULL,"
            + " text TEXT, sender_id LONG_INT NOT NULL, is_admin_message BOOL NOT NULL DEFAULT 0, is_unsent BOOL NOT NULL DEFAULT 0)");
    }

    @After public void close() {
        database.close();
    }

    private void message(long chat, long time, String id, String text, long sender, int admin, int unsent) {
        ContentValues row = new ContentValues();
        row.put("thread_key", chat);
        row.put("timestamp_ms", time);
        row.put("message_id", id);
        row.put("text", text);
        row.put("sender_id", sender);
        row.put("is_admin_message", admin);
        row.put("is_unsent", unsent);
        database.insertOrThrow("messages", null, row);
    }

    private LocalSearchStore.Result search(String words) {
        return LocalSearchStore.search(database, CHAT, words, new AtomicBoolean());
    }

    @Test public void findsOnlyThisChatsPlainMessagesNewestFirst() {
        message(CHAT, 100, "old", "dinner on Friday", 7, 0, 0);
        message(CHAT, 300, "new", "Friday dinner again", 8, 0, 0);
        message(CHAT, 200, "miss", "lunch on Monday", 7, 0, 0);
        message(CHAT, 250, "gone", "dinner they unsent", 7, 0, 1);
        message(CHAT, 260, "admin", "dinner was named", 7, 1, 0);
        message(CHAT, 270, "photo", null, 7, 0, 0);
        message(OTHER_CHAT, 400, "elsewhere", "dinner elsewhere", 7, 0, 0);
        LocalSearchStore.Result result = search("DINNER friday");
        assertEquals(2, result.hits.size());
        assertEquals("new", result.hits.get(0).messageId);
        assertEquals("old", result.hits.get(1).messageId);
        assertEquals(3, result.searched);
        assertEquals(100, result.oldest);
        assertFalse(result.full);
        assertFalse(result.stopped);
    }

    @Test public void accentsAndCaseDoNotMatter() {
        message(CHAT, 100, "a", "HẸN GẶP LẠI Ở QUÁN CÀ PHÊ", 7, 0, 0);
        assertEquals(1, search("quan ca phe").hits.size());
    }

    @Test public void readsPastAPageWithoutLosingMessagesThatShareATime() {
        database.beginTransaction();
        for (int i = 0; i < LocalSearchStore.PAGE + 50; i++) message(CHAT, 5000, String.format("m%05d", i), "same moment " + i, 7, 0, 0);
        database.setTransactionSuccessful();
        database.endTransaction();
        LocalSearchStore.Result result = search("same");
        assertEquals("a full list stops reading", LocalSearchStore.MAX_HITS, result.searched);
        assertEquals(LocalSearchStore.MAX_HITS, result.hits.size());
        assertTrue(result.full);
        result = search("moment 1049");
        assertEquals(1, result.hits.size());
        assertEquals(LocalSearchStore.PAGE + 50, result.searched);
    }

    @Test public void aStopEndsTheSearchAndKeepsWhatItFound() {
        message(CHAT, 100, "a", "dinner", 7, 0, 0);
        LocalSearchStore.Result result = LocalSearchStore.search(database, CHAT, "dinner", new AtomicBoolean(true));
        assertTrue(result.stopped);
        assertEquals(0, result.searched);
    }

    @Test public void noWordsFindNothing() {
        message(CHAT, 100, "a", "dinner", 7, 0, 0);
        assertEquals(0, search("   ").searched);
        assertEquals(0, search(null).searched);
    }

    @Test public void aHitHasItsSendersNameWhenMessengerKnowsIt() {
        message(CHAT, 100, "a", "dinner", 7, 0, 0);
        assertNull(search("dinner").hits.get(0).sender);
        database.execSQL("CREATE TABLE contacts(id LONG_INT, name TEXT)");
        database.execSQL("INSERT INTO contacts VALUES (7, 'Sam')");
        assertEquals("Sam", search("dinner").hits.get(0).sender);
    }

    @Test public void theCurrentAccountPicksTheDatabase() throws Exception {
        new File(folder, "msys_database_43").createNewFile();
        new File(folder, "msys_database_42-wal").createNewFile();
        assertNull("two accounts and no way to tell", LocalSearchStore.database(folder));
        Files.write(new File(folder, "threads_db2-uid").toPath(), "43".getBytes(StandardCharsets.UTF_8));
        assertEquals("msys_database_43", LocalSearchStore.database(folder).getName());
        Files.write(new File(folder, "threads_db2-uid").toPath(), "../42".getBytes(StandardCharsets.UTF_8));
        assertNull("only a plain id names a file", LocalSearchStore.database(folder));
        new File(folder, "msys_database_43").delete();
        assertEquals("msys_database_42", LocalSearchStore.database(folder).getName());
    }

    @Test public void theChatsNumberComesFromItsKeyText() {
        assertEquals(123, LocalSearchStore.chatNumber("ONE_TO_ONE:123:456"));
        assertEquals(789, LocalSearchStore.chatNumber("GROUP:789"));
        assertEquals(-1, LocalSearchStore.chatNumber("GROUP"));
        assertEquals(-1, LocalSearchStore.chatNumber("GROUP:name"));
        assertEquals(-1, LocalSearchStore.chatNumber(null));
    }

    /** A chat key stand-in: Parcelable, with the text Messenger's key has. */
    static final class Chat implements Parcelable {
        @Override public int describeContents() { return 0; }
        @Override public void writeToParcel(Parcel out, int flags) {}
        @Override public String toString() { return "ONE_TO_ONE:" + CHAT + ":42"; }
    }

    private static View bar(Activity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        return content.getChildCount() > 1 ? content.getChildAt(1) : null;
    }

    @Test public void theButtonComesAndGoesWithTheListAndOpensTheScreen() {
        Settings.preferences.edit().putBoolean(LocalChatSearch.KEY, true).commit();
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        View list = new View(activity);
        LocalChatSearch.query(new Chat(), "dinner");
        LocalChatSearch.attach(list);
        assertNull("nothing until the list is on screen", bar(activity));
        ((ViewGroup) activity.findViewById(android.R.id.content)).addView(list);
        assertNotNull(bar(activity));
        Intent screen = LocalChatSearch.screen(activity);
        assertEquals(LocalSearchActivity.class.getName(), screen.getComponent().getClassName());
        assertEquals("dinner", screen.getStringExtra(LocalSearchActivity.EXTRA_WORDS));
        assertEquals("ONE_TO_ONE:" + CHAT + ":42", screen.getStringExtra(LocalSearchActivity.EXTRA_CHAT_KEY));
        ((ViewGroup) activity.findViewById(android.R.id.content)).removeView(list);
        assertNull(bar(activity));
    }

    @Test public void offPauseAndSafeModeAddNoButton() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        ViewGroup content = activity.findViewById(android.R.id.content);
        View list = new View(activity);
        LocalChatSearch.attach(list);
        content.addView(list);
        assertEquals(1, content.getChildCount());
        content.removeView(list);
        Settings.preferences.edit().putBoolean(LocalChatSearch.KEY, true).putBoolean("paused", true).commit();
        list = new View(activity);
        LocalChatSearch.attach(list);
        content.addView(list);
        assertEquals(1, content.getChildCount());
    }

    @Test public void theSettingsRowIsListedAndOffByDefault() {
        boolean listed = false;
        for (String[] control : SettingsActivity.CONTROLS) listed |= LocalChatSearch.KEY.equals(control[0]);
        assertTrue(listed);
        assertTrue(Settings.installed.contains(LocalChatSearch.KEY));
        assertFalse(Settings.preferences.getBoolean(LocalChatSearch.KEY, false));
    }
}
