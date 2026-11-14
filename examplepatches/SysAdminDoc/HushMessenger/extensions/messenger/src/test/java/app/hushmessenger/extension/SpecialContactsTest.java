package app.hushmessenger.extension;

import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import app.hushmessenger.extension.ChatHidingTest.Built;
import app.hushmessenger.extension.ChatHidingTest.Icons;
import app.hushmessenger.extension.ChatHidingTest.Menu;
import app.hushmessenger.extension.ChatHidingTest.Participant;
import app.hushmessenger.extension.ChatHidingTest.Rows;
import app.hushmessenger.extension.ChatHidingTest.Summary;
import app.hushmessenger.extension.ChatHidingTest.Supplier;
import com.facebook.user.model.UserKey;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class SpecialContactsTest {
    private static final long NOW = 1_763_000_000_000L;
    private Context context;
    private final Object mute = new Object();
    private long now = NOW;

    @Before public void reset() throws Exception {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().putBoolean(SpecialContacts.KEY, true).commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        ShadowToast.reset();
        File folder = context.getDatabasePath(SpecialContacts.KEY).getParentFile();
        folder.mkdirs();
        for (File old : folder.listFiles()) old.delete();
        delete(new File(context.getNoBackupFilesDir(), "hush_special_contacts"));
        account("100");
        ChatHiding.resetForTests();
        ChatHiding.route = ChatHiding.Route.of(ChatHidingTest.ROUTE, ChatHidingTest.class.getClassLoader());
        SpecialContacts.resetForTests();
        SpecialContacts.work = Runnable::run;
        SpecialContacts.clock = () -> now;
    }

    private static void delete(File file) {
        File[] inside = file.listFiles();
        if (inside != null) for (File each : inside) delete(each);
        file.delete();
    }

    private void account(String id) throws IOException {
        assertTrue(new File(context.getDatabasePath(SpecialContacts.KEY).getParentFile(), "msys_database_" + id).createNewFile());
    }

    private void signOut(String id) {
        assertTrue(new File(context.getDatabasePath(SpecialContacts.KEY).getParentFile(), "msys_database_" + id).delete());
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private String text(String key) {
        return new SettingsText(context).get(key);
    }

    /** A chat with these people in it, each given as id=name. */
    private static Summary chat(String id, String... people) {
        Summary chat = new Summary(id);
        for (String person : people) {
            String[] parts = person.split("=", 2);
            chat.people.add(new Participant(parts[0], parts.length > 1 ? parts[1] : null));
        }
        return chat;
    }

    private ArrayList<Object> menuRows(Summary chat) {
        ArrayList<Object> rows = new ArrayList<>(Arrays.asList(mute, null, null));
        ChatHiding.menuRows(new Menu(chat), rows);
        return rows;
    }

    private void tap(Summary chat) {
        assertTrue(ChatHiding.menuTapped(new Menu(chat), SpecialContacts.ROW_ID));
        idle();
    }

    /** One person's history as kind=detail, newest first. */
    private static List<String> kinds(String id) {
        List<String> kinds = new ArrayList<>();
        for (SpecialContactsStore.Event event : SpecialContacts.history(id)) kinds.add(event.detail.isEmpty() ? event.kind : event.kind + "=" + event.detail);
        return kinds;
    }

    private static Intent typing(String key, Object user, int state) {
        Intent intent = new Intent("com.facebook.presence.ACTION_OTHER_USER_TYPING_CHANGED");
        intent.putExtra("extra_new_state", state);
        if (user instanceof UserKey) intent.putExtra(key, (UserKey) user);
        else if (user != null) intent.putExtra(key, user.toString());
        return intent;
    }

    @Test public void aOneToOneChatGetsTrackThisPersonAndTheTapTracksThem() {
        Summary ana = chat("ana", "100=Me", "7=Ana");
        ArrayList<Object> rows = menuRows(ana);
        assertSame(mute, rows.get(0));
        Built track = (Built) rows.get(1);
        assertNull("Hide from chat list is off", rows.get(2));
        assertEquals(SpecialContacts.ROW_ID, track.builder.id);
        assertEquals("hush_track_person", track.name);
        assertEquals(text("special_contacts_track"), track.builder.label.toString());
        assertEquals(Icons.STAR, track.builder.picture);

        tap(ana);
        assertEquals(text("special_contacts_tracked"), ShadowToast.getTextOfLatestToast());
        assertEquals(Collections.singleton("7"), SpecialContacts.tracked);
        List<SpecialContactsStore.Person> people = SpecialContacts.list();
        assertEquals(1, people.size());
        assertEquals("Ana", people.get(0).name);
        assertEquals(NOW, people.get(0).since);

        Built stop = (Built) menuRows(ana).get(1);
        assertEquals(text("special_contacts_untrack"), stop.builder.label.toString());
        assertEquals(Icons.STAR_CROSS, stop.builder.picture);
        tap(ana);
        assertEquals(text("special_contacts_untracked"), ShadowToast.getTextOfLatestToast());
        assertTrue(SpecialContacts.tracked.isEmpty());
        assertTrue(SpecialContacts.list().isEmpty());
    }

    @Test public void groupsAndChatsThisAccountIsntInGetNoRow() {
        List<Summary> chats = Arrays.asList(
            chat("group", "100=Me", "7=Ana", "8=Ben"),
            chat("theirs", "7=Ana", "8=Ben"),
            chat("alone", "100=Me"),
            chat("empty"),
            chat("no id", "100=Me", "=Ana"));
        for (Summary chat : chats) {
            assertEquals(chat.key.id, Arrays.asList(mute, null, null), menuRows(chat));
            tap(chat);
            assertEquals(chat.key.id, text("special_contacts_failed"), ShadowToast.getTextOfLatestToast());
        }
        assertTrue(SpecialContacts.list().isEmpty());

        Summary group = chat("group", "100=Me", "7=Ana", "8=Ben");
        group.people.add("not a person");
        assertEquals(Arrays.asList(mute, null, null), menuRows(group));
        Summary ana = chat("ana", "100=Me", "7=Ana");
        ana.people.add(1, "not a person");
        assertTrue("Only people count", menuRows(ana).get(1) instanceof Built);
    }

    @Test public void itSitsBesideHideFromChatListAndGoesOnTheEndOfAFullMenu() {
        Settings.preferences.edit().putBoolean(ChatHiding.KEY, true).commit();
        Summary ana = chat("ana", "100=Me", "7=Ana");
        ArrayList<Object> rows = menuRows(ana);
        assertEquals(ChatHiding.ROW_ID, ((Built) rows.get(1)).builder.id);
        assertEquals(SpecialContacts.ROW_ID, ((Built) rows.get(2)).builder.id);

        ArrayList<Object> full = new ArrayList<>(Collections.singletonList(mute));
        ChatHiding.menuRows(new Menu(ana), full);
        assertEquals(3, full.size());
        assertEquals(SpecialContacts.ROW_ID, ((Built) full.get(2)).builder.id);
        assertFalse("Messenger's own rows stay its own", ChatHiding.menuTapped(new Menu(ana), 0x4b));
    }

    @Test public void presenceAndTypingAreWrittenForTrackedPeopleOnly() {
        SpecialContacts.presence(new UserKey("7"), null, null, null, null, 1, 0, 1);
        tap(chat("ana", "100=Me", "7=Ana"));

        SpecialContacts.presence(new UserKey("8"), null, null, null, null, 1, 0, 1);
        SpecialContacts.presence("7", null, null, null, null, 1, 0, 1);
        SpecialContacts.presence(null, null, null, null, null, 1, 0, 1);
        now = NOW + 1000;
        SpecialContacts.presence(new UserKey("7"), 4L, null, null, null, 1, 0, 1);
        now = NOW + 2000;
        SpecialContacts.typing(typing("extra_user_key", new UserKey("7"), 1));
        now = NOW + 3000;
        SpecialContacts.typing(typing("extra_user_key", new UserKey("7"), 0));
        SpecialContacts.typing(typing("extra_user_key", new UserKey("8"), 1));
        SpecialContacts.typing(typing("extra_user_key", "7", 1));
        SpecialContacts.typing(new Intent());
        SpecialContacts.typing(null);
        now = NOW + 60_000;
        SpecialContacts.typing(typing("extra_thread_user", new UserKey("7"), 11));
        now = NOW + 120_000;
        SpecialContacts.presence(new UserKey("7"), null, null, null, null, 0, (NOW + 100_000) / 1000, 0);

        assertEquals(Arrays.asList("offline=" + (NOW + 100_000), "typing", "typing", "online", "tracked"), kinds("7"));
        List<SpecialContactsStore.Event> history = SpecialContacts.history("7");
        assertEquals(Arrays.asList(NOW + 120_000, NOW + 60_000, NOW + 2000, NOW + 1000, NOW),
            Arrays.asList(history.get(0).at, history.get(1).at, history.get(2).at, history.get(3).at, history.get(4).at));
        assertNull("Nothing went wrong on the way", Settings.hookErrors.get(SpecialContacts.KEY));
    }

    @Test public void theTypingStatesThatMeanTyping() {
        for (int state = -1; state <= 13; state++)
            assertEquals(String.valueOf(state), Arrays.asList(1, 2, 5, 6, 11, 12).contains(state), SpecialContacts.isTyping(state));
    }

    @Test public void offPauseAndSafeModeWriteNothingAndKeepThePeople() throws Exception {
        Summary ana = chat("ana", "100=Me", "7=Ana");
        tap(ana);
        for (String state : new String[] {"off", "paused", "safe"}) {
            ShadowToast.reset();
            Settings.preferences.edit().putBoolean(SpecialContacts.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);

            assertEquals(state, Arrays.asList(mute, null, null), menuRows(ana));
            tap(ana);
            assertEquals(state, 0, ShadowToast.shownToastCount());
            now += 60_000;
            SpecialContacts.presence(new UserKey("7"), null, null, null, null, 1, 0, 1);
            SpecialContacts.typing(typing("extra_user_key", new UserKey("7"), 1));
            ChatHiding.inboxRows(new Supplier(), Rows.of(chat("ana", "100=Me", "7=Ana Banana")));
            assertEquals(state, Collections.singletonList("tracked"), kinds("7"));
        }
        Settings.preferences.edit().putBoolean(SpecialContacts.KEY, true).putBoolean("paused", false).putBoolean("safe_mode", false).commit();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        SpecialContacts.presence(new UserKey("7"), null, null, null, null, 1, 0, 1);
        assertEquals("Back on, still tracked", Arrays.asList("online", "tracked"), kinds("7"));
    }

    @Test public void theChatListPicksUpANewNameOnceAMinute() {
        Summary ana = chat("ana", "100=Me", "7=Ana");
        tap(ana);
        Supplier supplier = new Supplier();
        now = NOW + 5000;
        ChatHiding.inboxRows(supplier, Rows.of(chat("ben", "100=Me", "8=Ben"), chat("ana", "100=Me", "7=Ana B")));
        now = NOW + 6000;
        ChatHiding.inboxRows(supplier, Rows.of(chat("ana", "100=Me", "7=Ana C")));
        assertEquals("Once a minute", Arrays.asList("name=Ana\nAna B", "tracked"), kinds("7"));
        shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(61));
        ChatHiding.inboxRows(supplier, Rows.of(chat("ana", "100=Me", "7=Ana C")));
        assertEquals(Arrays.asList("name=Ana B\nAna C", "name=Ana\nAna B", "tracked"), kinds("7"));
        assertEquals("Ana C", SpecialContacts.list().get(0).name);
    }

    @Test public void eachAccountKeepsItsOwnPeople() throws Exception {
        tap(chat("ana", "100=Me", "7=Ana"));
        signOut("100");
        account("200");
        Summary theirs = chat("ana2", "200=Them", "7=Ana");
        assertEquals("Not tracked under this account", text("special_contacts_track"), ((Built) menuRows(theirs).get(1)).builder.label.toString());
        assertTrue(SpecialContacts.tracked.isEmpty());
        SpecialContacts.presence(new UserKey("7"), null, null, null, null, 1, 0, 1);

        signOut("200");
        account("100");
        assertEquals(text("special_contacts_untrack"), ((Built) menuRows(chat("ana", "100=Me", "7=Ana")).get(1)).builder.label.toString());
        assertEquals("Nothing written while the other account was in use", Collections.singletonList("tracked"), kinds("7"));
    }

    @Test public void withNoAccountTheTapSaysItCouldntAndThereIsNoRow() {
        signOut("100");
        Summary ana = chat("ana", "100=Me", "7=Ana");
        assertEquals(Arrays.asList(mute, null, null), menuRows(ana));
        tap(ana);
        assertEquals(text("special_contacts_failed"), ShadowToast.getTextOfLatestToast());
        assertTrue(SpecialContacts.list().isEmpty());
    }

    @Test public void eachEventReadsAsASentence() {
        SettingsText words = new SettingsText(context);
        String at = SpecialContacts.when(context, NOW);
        String earlier = SpecialContacts.when(context, NOW - 3_600_000);
        assertEquals(words.get("special_contacts_online", at), SpecialContacts.describe(context, words, new SpecialContactsStore.Event(NOW, "online", "")));
        assertEquals(words.get("special_contacts_typing", at), SpecialContacts.describe(context, words, new SpecialContactsStore.Event(NOW, "typing", "")));
        assertEquals(words.get("special_contacts_since", at), SpecialContacts.describe(context, words, new SpecialContactsStore.Event(NOW, "tracked", "")));
        assertEquals(words.get("special_contacts_renamed", at, "Ana B"), SpecialContacts.describe(context, words, new SpecialContactsStore.Event(NOW, "name", "Ana\nAna B")));
        assertEquals(words.get("special_contacts_offline_at", at, earlier),
            SpecialContacts.describe(context, words, new SpecialContactsStore.Event(NOW, "offline", Long.toString(NOW - 3_600_000))));
        assertEquals(words.get("special_contacts_offline", at), SpecialContacts.describe(context, words, new SpecialContactsStore.Event(NOW, "offline", "")));
        assertFalse("Today shows the time alone", at.contains("2025"));
        assertNotEquals("Another day shows its date", at, SpecialContacts.when(context, NOW - 3L * 24 * 3_600_000));
    }

    @Test public void settingsListsThePeopleTheirHistoryAndStopTracking() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals(View.VISIBLE, root.findViewWithTag("special_contacts_empty").getVisibility());

            // Tracked from the chat list while settings sat behind it, then Back.
            screen.pause().stop();
            tap(chat("ana", "100=Me", "7=Ana"));
            now = NOW + 1000;
            SpecialContacts.presence(new UserKey("7"), null, null, null, null, 1, 0, 1);
            screen.restart().resume();

            assertNull(root.findViewWithTag("special_contacts_empty"));
            assertNotNull(root.findViewWithTag("special_contacts_person_7"));
            TextView latest = root.findViewWithTag("special_contacts_latest_7");
            SettingsText words = new SettingsText(context);
            assertEquals(words.get("special_contacts_online", SpecialContacts.when(context, NOW + 1000)), latest.getText().toString());
            LinearLayout list = root.findViewWithTag("special_contacts_list");
            assertEquals("One person, not a second copy", 1, list.getChildCount());

            Button history = root.findViewWithTag("special_contacts_history_7");
            assertEquals(text("special_contacts_history"), history.getText().toString());
            history.performClick();
            LinearLayout events = root.findViewWithTag("special_contacts_events_7");
            assertNotNull(events);
            assertEquals("Two lines and Clear history", 3, events.getChildCount());
            assertEquals(text("special_contacts_hide_history"), ((Button) root.findViewWithTag("special_contacts_history_7")).getText().toString());

            root.findViewWithTag("special_contacts_clear_7").performClick();
            idle();
            assertEquals(text("special_contacts_cleared"), ShadowToast.getTextOfLatestToast());
            assertEquals(text("special_contacts_nothing"), ((TextView) root.findViewWithTag("special_contacts_latest_7")).getText().toString());
            assertFalse("Nothing left to clear", root.findViewWithTag("special_contacts_clear_7").isEnabled());

            root.findViewWithTag("special_contacts_stop_7").performClick();
            idle();
            assertEquals(text("special_contacts_untracked"), ShadowToast.getTextOfLatestToast());
            assertNull(root.findViewWithTag("special_contacts_person_7"));
            assertEquals(View.VISIBLE, root.findViewWithTag("special_contacts_empty").getVisibility());
            assertTrue(SpecialContacts.tracked.isEmpty());
        }
    }
}
