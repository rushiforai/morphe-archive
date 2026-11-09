/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static app.hushtelegram.extension.telegram.misc.SpecialContactsStore.*;
import static org.junit.Assert.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SpecialContactsStoreTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    /** Milliseconds, as the clock gives them; a status counts seconds. */
    private static final long T = 1_700_000_000_000L;
    private static final long S = T / 1000;

    private File root;
    private SpecialContactsStore store;

    @Before public void open() throws IOException {
        root = folder.newFolder("special");
        store = new SpecialContactsStore(root);
    }

    @Test public void trackingStartsWithOneLineAndStoppingDeletesTheFile() {
        assertTrue(store.nobody());
        assertEquals(Result.ADDED, store.track(0, 42, null, T));
        assertEquals(Result.ALREADY, store.track(0, 42, null, T + 1));
        assertFalse(store.nobody());
        assertTrue(store.anyTracked(42));
        assertTrue(store.trackedNow(0, 42));
        assertTrue(store.tracked(0, 42));
        assertEquals(1, store.count(0));
        assertTrue(store.fileOf(0, 42).isFile());
        assertEquals(Collections.singletonList(TRACKED), kinds(store.history(0, 42)));
        assertEquals(T, store.history(0, 42).get(0).at);

        assertTrue(store.untrack(0, 42));
        assertFalse(store.untrack(0, 42));
        assertFalse(store.fileOf(0, 42).exists());
        assertTrue(store.nobody());
        assertFalse(store.anyTracked(42));
        assertTrue(store.history(0, 42).isEmpty());
        assertTrue(store.observe(0, 42, look(RECENTLY, 0), T, false).isEmpty());
        assertNull(store.typing(0, 42, "", "u0", T));
    }

    @Test public void onlyRealAccountsAndPeopleCanBeTracked() {
        assertEquals(Result.FAILED, store.track(-1, 42, null, T));
        assertEquals(Result.FAILED, store.track(Accounts.MAX, 42, null, T));
        assertEquals(Result.FAILED, store.track(0, 0, null, T));
        assertEquals(Result.FAILED, store.track(0, -5, null, T));
        assertTrue(store.nobody());
        assertFalse(store.trackedNow(-1, 42));
        assertFalse(store.trackedNow(Accounts.MAX, 42));
    }

    @Test public void fiftyPeopleAtMostForEachAccount() {
        for (long id = 1; id <= MAX_PEOPLE; id++) assertEquals(Result.ADDED, store.track(0, id, null, T));
        assertEquals(Result.FULL, store.track(0, 1000, null, T));
        assertEquals(Result.ALREADY, store.track(0, 7, null, T));
        assertEquals(Result.ADDED, store.track(1, 1000, null, T));
        assertEquals(MAX_PEOPLE, store.count(0));
        assertEquals(MAX_PEOPLE, new SpecialContactsStore(root).count(0));
        assertTrue(store.untrack(0, 7));
        assertEquals(Result.ADDED, store.track(0, 1000, null, T));
    }

    @Test public void fiveHundredLinesAtMostAndTheOldestGoFirst() {
        store.track(0, 42, null, T);
        int typed = MAX_EVENTS + 100;
        for (int i = 1; i <= typed; i++) assertNotNull(store.typing(0, 42, "", "u0", T + i * TYPING_BURST_MILLIS));
        for (SpecialContactsStore each : Arrays.asList(store, new SpecialContactsStore(root))) {
            List<Event> history = each.history(0, 42);
            assertEquals(MAX_EVENTS, history.size());
            assertEquals(T + typed * TYPING_BURST_MILLIS, history.get(0).at);
            assertEquals(T + (typed - MAX_EVENTS + 1) * TYPING_BURST_MILLIS, history.get(MAX_EVENTS - 1).at);
            assertFalse(kinds(history).contains(TRACKED));
        }
    }

    @Test public void typingCountsOncePerBurstInEachChat() {
        store.track(0, 42, null, T);
        Event first = store.typing(0, 42, "", "u0", T);
        assertNotNull(first);
        assertEquals(TYPING, first.kind);
        assertEquals("", first.detail);
        assertNull(store.typing(0, 42, "", "u0", T + 10_000));
        // Each update keeps the burst going, so a pause has to run its whole length.
        assertNull(store.typing(0, 42, "", "u0", T + 35_000));
        Event group = store.typing(0, 42, "Family", "c5", T + 36_000);
        assertNotNull(group);
        assertEquals("Family", group.detail);
        assertNull(store.typing(0, 42, "Family", "c5", T + 40_000));
        assertNotNull(store.typing(0, 42, "", "u0", T + 35_000 + TYPING_BURST_MILLIS));
        assertEquals(Arrays.asList(TYPING, TYPING, TYPING, TRACKED), kinds(store.history(0, 42)));
        // A clock that went back starts a new burst rather than hiding typing for good.
        assertNotNull(store.typing(0, 42, "", "u0", T));
    }

    @Test public void theFirstLookOnlyLearnsAndARepeatAddsNothing() {
        store.track(0, 42, null, T);
        assertEquals(none(), kinds(store.observe(0, 42, look(ONLINE, S + 300), T, false)));
        assertEquals(none(), kinds(store.observe(0, 42, look(ONLINE, S + 300), T + 1_000, false)));
        assertEquals(Collections.singletonList(TRACKED), kinds(store.history(0, 42)));
    }

    @Test public void eachStatusChangeIsALine() {
        store.track(0, 42, null, T);
        store.observe(0, 42, look(ONLINE, S + 300), T, false);
        List<Event> offline = store.observe(0, 42, look(OFFLINE, S + 5), T + 10_000, false);
        assertEquals(Collections.singletonList(OFFLINE_AT), kinds(offline));
        assertEquals(Long.toString(S + 5), offline.get(0).detail);
        assertEquals(none(), kinds(store.observe(0, 42, look(OFFLINE, S + 5), T + 11_000, false)));
        assertEquals(Collections.singletonList(OFFLINE_AT), kinds(store.observe(0, 42, look(OFFLINE, S + 20), T + 30_000, false)));
        // An older copy of the last seen time isn't news.
        assertEquals(none(), kinds(store.observe(0, 42, look(OFFLINE, S + 5), T + 31_000, false)));
        assertEquals(Collections.singletonList(SEEN_RECENTLY), kinds(store.observe(0, 42, look(RECENTLY, 0), T + 40_000, false)));
        assertEquals(Collections.singletonList(SEEN_WEEK), kinds(store.observe(0, 42, look(WEEK, 0), T + 50_000, false)));
        assertEquals(Collections.singletonList(SEEN_MONTH), kinds(store.observe(0, 42, look(MONTH, 0), T + 60_000, false)));
        assertEquals(Collections.singletonList(SEEN_LONG_AGO), kinds(store.observe(0, 42, look(HIDDEN, 0), T + 70_000, false)));
        assertEquals(Collections.singletonList(ONLINE_NOW), kinds(store.observe(0, 42, look(ONLINE, S + 400), T + 80_000, false)));
        assertEquals(none(), kinds(store.observe(0, 42, look(UNKNOWN, 0), T + 90_000, false)));
    }

    @Test public void anOfflineTimeFromBeforeTheLastOnlineIsAnOldCopy() {
        store.track(0, 42, null, T);
        store.observe(0, 42, look(OFFLINE, S - 600), T, false);
        assertEquals(Collections.singletonList(ONLINE_NOW), kinds(store.observe(0, 42, look(ONLINE, S + 300), T, false)));
        assertEquals(none(), kinds(store.observe(0, 42, look(OFFLINE, S - 120), T + 1_000, false)));
        assertEquals(Collections.singletonList(OFFLINE_AT), kinds(store.observe(0, 42, look(OFFLINE, S + 10), T + 10_000, false)));
    }

    @Test public void anOnlineThatRanOutCountsAsOfflineThen() {
        store.track(0, 42, null, T);
        store.observe(0, 42, look(OFFLINE, S - 600), T, false);
        List<Event> added = store.observe(0, 42, look(ONLINE, S - 300), T, false);
        assertEquals(Collections.singletonList(OFFLINE_AT), kinds(added));
        assertEquals(Long.toString(S - 300), added.get(0).detail);
        // One that ran out before the offline time already kept is older still.
        assertEquals(none(), kinds(store.observe(0, 42, look(ONLINE, S - 900), T, false)));
        // One running out within the minute is still online.
        assertEquals(Collections.singletonList(ONLINE_NOW), kinds(store.observe(0, 42, look(ONLINE, S - 30), T, false)));
    }

    @Test public void nameUsernameAndPhoneChangesKeepTheOldAndTheNew() {
        store.track(0, 42, person("Ann Lee", "@ann", "15550001"), T);
        assertEquals(Collections.singletonList(TRACKED), kinds(store.history(0, 42)));
        List<Event> name = store.observe(0, 42, person("Ann Smith", "@ann", "15550001"), T + 1, false);
        assertEquals(Collections.singletonList(NAME), kinds(name));
        assertEquals("Ann Lee\nAnn Smith", name.get(0).detail);
        List<Event> username = store.observe(0, 42, person("Ann Smith", "@annie", "15550001"), T + 2, false);
        assertEquals(Collections.singletonList(USERNAME), kinds(username));
        assertEquals("@ann\n@annie", username.get(0).detail);
        assertEquals("@annie\n", store.observe(0, 42, person("Ann Smith", "", "15550001"), T + 3, false).get(0).detail);
        List<Event> phone = store.observe(0, 42, person("Ann Smith", "", "15550002"), T + 4, false);
        assertEquals(Collections.singletonList(PHONE), kinds(phone));
        assertEquals("15550001\n15550002", phone.get(0).detail);
        // A number hidden by privacy settings, then shown again, isn't a change.
        assertEquals(none(), kinds(store.observe(0, 42, person("Ann Smith", "", ""), T + 5, false)));
        assertEquals(none(), kinds(store.observe(0, 42, person("Ann Smith", "", "15550002"), T + 6, false)));
        // An update that carries no name or username says nothing about them.
        assertEquals(none(), kinds(store.observe(0, 42, person(null, null, null), T + 7, false)));
        SpecialContactsStore.Person shown = store.person(0, 42);
        assertEquals("Ann Smith", shown.name);
        assertEquals("", shown.username);
    }

    @Test public void contactChangesAreLinesAndASavedContactsNameIsYours() {
        store.track(0, 42, contact(person("Ann Lee", "@ann", ""), false, false), T);
        assertEquals(Collections.singletonList(CONTACT_SAVED),
                kinds(store.observe(0, 42, contact(person("Annie (gym)", "@ann", ""), true, false), T + 1, false)));
        assertEquals(Collections.singletonList(MUTUAL_ON),
                kinds(store.observe(0, 42, contact(person("Annie (gym)", "@ann", ""), true, true), T + 2, false)));
        assertEquals(none(), kinds(store.observe(0, 42, contact(person("Annie", "@ann", ""), true, true), T + 3, false)));
        assertEquals(Collections.singletonList(MUTUAL_OFF),
                kinds(store.observe(0, 42, contact(person("Annie", "@ann", ""), true, false), T + 4, false)));
        assertEquals(Collections.singletonList(CONTACT_REMOVED),
                kinds(store.observe(0, 42, contact(person("Ann Lee", "@ann", ""), false, false), T + 5, false)));
        // Telegram only says they saved you back for someone you saved, so a stranger's flag means nothing.
        assertEquals(none(), kinds(store.observe(0, 42, contact(person("Ann Lee", "@ann", ""), false, true), T + 6, false)));
        assertEquals(Collections.singletonList(NAME),
                kinds(store.observe(0, 42, contact(person("Ann Smith", "@ann", ""), false, false), T + 7, false)));
    }

    @Test public void photoChangesAreLinesAndAPhotoYouSetIsSkipped() {
        store.track(0, 42, photo(look(RECENTLY, 0), 0), T);
        assertEquals(Collections.singletonList(PHOTO_ADDED), kinds(store.observe(0, 42, photo(look(RECENTLY, 0), 7), T + 1, false)));
        assertEquals(Collections.singletonList(PHOTO_CHANGED), kinds(store.observe(0, 42, photo(look(RECENTLY, 0), 8), T + 2, false)));
        Seen personal = photo(look(RECENTLY, 0), 99);
        personal.personalPhoto = true;
        assertEquals(none(), kinds(store.observe(0, 42, personal, T + 3, false)));
        assertEquals(none(), kinds(store.observe(0, 42, photo(look(RECENTLY, 0), 8), T + 4, false)));
        assertEquals(Collections.singletonList(PHOTO_REMOVED), kinds(store.observe(0, 42, photo(look(RECENTLY, 0), 0), T + 5, false)));
    }

    @Test public void lastSeenAndPhotoGoingTogetherIsAGuessedBlockAndOneComingBackAGuessedUnblock() {
        store.track(0, 42, photo(look(RECENTLY, 0), 7), T);
        assertEquals(Collections.singletonList(MAYBE_BLOCKED), kinds(store.observe(0, 42, photo(look(HIDDEN, 0), 0), T + 1, false)));
        assertEquals(none(), kinds(store.observe(0, 42, photo(look(HIDDEN, 0), 0), T + 2, false)));
        assertEquals(Collections.singletonList(MAYBE_UNBLOCKED), kinds(store.observe(0, 42, photo(look(RECENTLY, 0), 0), T + 3, false)));
        assertEquals(Collections.singletonList(PHOTO_ADDED), kinds(store.observe(0, 42, photo(look(RECENTLY, 0), 7), T + 4, false)));
        // A photo coming back alone counts too.
        store.observe(0, 42, photo(look(HIDDEN, 0), 0), T + 5, false);
        assertEquals(Collections.singletonList(MAYBE_UNBLOCKED), kinds(store.observe(0, 42, photo(look(HIDDEN, 0), 9), T + 6, false)));
        assertEquals(Arrays.asList(MAYBE_UNBLOCKED, MAYBE_BLOCKED, PHOTO_ADDED, MAYBE_UNBLOCKED, MAYBE_BLOCKED, TRACKED), kinds(store.history(0, 42)));
    }

    @Test public void noGuessForABotSomeoneAlwaysHiddenOrAStoredCopy() {
        store.track(0, 1, photo(look(RECENTLY, 0), 7), T);
        Seen bot = photo(look(HIDDEN, 0), 0);
        bot.bot = true;
        assertEquals(Arrays.asList(SEEN_LONG_AGO, PHOTO_REMOVED), kinds(store.observe(0, 1, bot, T + 1, false)));

        store.track(0, 2, photo(look(HIDDEN, 0), 0), T);
        assertEquals(none(), kinds(store.observe(0, 2, photo(look(HIDDEN, 0), 0), T + 1, false)));

        store.track(0, 3, photo(look(RECENTLY, 0), 7), T);
        assertEquals(none(), kinds(store.observe(0, 3, photo(look(HIDDEN, 0), 0), T + 1, true)));

        // Without a status and a photo seen before there's nothing to compare.
        store.track(0, 4, null, T);
        assertEquals(none(), kinds(store.observe(0, 4, photo(look(HIDDEN, 0), 0), T + 1, false)));
        // Hiding one of the two is a privacy setting, not a block.
        store.track(0, 5, photo(look(RECENTLY, 0), 7), T);
        assertEquals(Collections.singletonList(SEEN_LONG_AGO), kinds(store.observe(0, 5, photo(look(HIDDEN, 0), 7), T + 1, false)));
    }

    @Test public void aStoredCopyOnlyFillsInWhatIsntKnown() {
        store.track(0, 42, null, T);
        assertEquals(none(), kinds(store.observe(0, 42, photo(person("Ann Lee", "@ann", "1555"), 7), T + 1, true)));
        // An older stored copy can't undo what's already known.
        assertEquals(none(), kinds(store.observe(0, 42, photo(person("Ann Old", "@old", "1444"), 3), T + 2, true)));
        assertEquals("Ann Lee", store.person(0, 42).name);
        assertEquals("@ann", store.person(0, 42).username);
        assertEquals(none(), kinds(store.observe(0, 42, photo(person("Ann Lee", "@ann", "1555"), 7), T + 3, false)));
        assertEquals(Collections.singletonList(NAME), kinds(store.observe(0, 42, photo(person("Ann Smith", "@ann", "1555"), 7), T + 4, false)));
    }

    @Test public void aDeletedAccountIsOneLine() {
        store.track(0, 42, look(RECENTLY, 0), T);
        Seen gone = new Seen();
        gone.deleted = true;
        assertEquals(Collections.singletonList(DELETED), kinds(store.observe(0, 42, gone, T + 1, false)));
        gone = new Seen();
        gone.deleted = true;
        assertEquals(none(), kinds(store.observe(0, 42, gone, T + 2, false)));

        // Someone never seen with a status gets no line: there's nothing to say they were there before.
        store.track(0, 43, null, T);
        Seen stored = new Seen();
        stored.deleted = true;
        assertEquals(none(), kinds(store.observe(0, 43, stored, T + 1, false)));
    }

    @Test public void everythingSurvivesReopening() throws IOException {
        store.track(0, 42, photo(person("Ann Lee", "@ann", "1555"), 7), T);
        store.observe(0, 42, look(ONLINE, S + 300), T + 1, false);
        store.typing(0, 42, "Family", "c5", T + 2);
        List<String> before = kinds(store.history(0, 42));
        SpecialContactsStore reopened = new SpecialContactsStore(root);
        assertTrue(reopened.trackedNow(0, 42));
        assertEquals(before, kinds(reopened.history(0, 42)));
        assertEquals("Family", reopened.history(0, 42).get(0).detail);
        SpecialContactsStore.Person shown = reopened.person(0, 42);
        assertEquals("Ann Lee", shown.name);
        assertEquals("@ann", shown.username);
        assertEquals(T, shown.since);
        assertEquals(T + 2, shown.lastAt);
        // What was last seen came back too, so the next change still has its old value.
        Seen renamed = photo(person("Ann Smith", "@ann", "1555"), 7);
        renamed.status = UNKNOWN;
        List<Event> name = reopened.observe(0, 42, renamed, T + 3, false);
        assertEquals(Collections.singletonList(NAME), kinds(name));
        assertEquals("Ann Lee\nAnn Smith", name.get(0).detail);
        // Still online since T + 1, so an offline time from just after that is a change.
        assertEquals(Collections.singletonList(OFFLINE_AT), kinds(reopened.observe(0, 42, look(OFFLINE, S + 4), T + 4, false)));
    }

    @Test public void anUnreadableHistoryStartsOverAndTheFileIsWrittenAgain() throws IOException {
        store.track(0, 42, person("Ann Lee", "", ""), T);
        store.track(0, 43, person("Bob", "", ""), T);
        write(store.fileOf(0, 42), "{not json");
        write(store.fileOf(0, 43), "{\"id\":7,\"events\":[]}");
        SpecialContactsStore reopened = new SpecialContactsStore(root);
        for (long id : new long[]{42, 43}) {
            assertTrue(reopened.tracked(0, id));
            assertTrue(reopened.history(0, id).isEmpty());
        }
        SpecialContactsStore third = new SpecialContactsStore(root);
        assertTrue(third.history(0, 42).isEmpty());
        assertEquals(none(), kinds(third.observe(0, 42, person("Ann Smith", "", ""), T + 1, false)));
        assertNotNull(third.typing(0, 42, "", "u0", T + 2));
        assertEquals(Collections.singletonList(TYPING), kinds(new SpecialContactsStore(root).history(0, 42)));
    }

    @Test public void eachAccountKeepsItsOwnPeople() {
        store.track(0, 42, look(RECENTLY, 0), T);
        store.track(1, 42, look(RECENTLY, 0), T);
        store.track(1, 43, null, T);
        assertEquals(Collections.singletonList(SEEN_WEEK), kinds(store.observe(1, 42, look(WEEK, 0), T + 1, false)));
        assertEquals(Collections.singletonList(TRACKED), kinds(store.history(0, 42)));
        assertEquals(1, store.count(0));
        assertEquals(2, store.count(1));
        assertFalse(store.trackedNow(2, 42));
        assertTrue(store.untrack(0, 42));
        assertFalse(store.trackedNow(0, 42));
        assertTrue(store.trackedNow(1, 42));
        assertTrue(store.anyTracked(42));
        assertTrue(new File(root, "1").isDirectory());
        assertEquals(Arrays.asList(42L, 43L), ids(new SpecialContactsStore(root).list(1)));
        assertTrue(new SpecialContactsStore(root).list(0).isEmpty());
    }

    @Test public void theListPutsTheMostRecentlyActiveFirst() {
        store.track(0, 3, null, T);
        store.track(0, 1, null, T);
        store.track(0, 2, null, T + 5);
        assertEquals(Arrays.asList(2L, 1L, 3L), ids(store.list(0)));
        store.typing(0, 3, "", "u0", T + 10);
        assertEquals(Arrays.asList(3L, 2L, 1L), ids(store.list(0)));
        assertEquals(2, store.list(0).get(0).events);
    }

    @Test public void clearingEmptiesTheHistoryAndKeepsTracking() {
        store.track(0, 42, look(RECENTLY, 0), T);
        store.observe(0, 42, look(WEEK, 0), T + 1, false);
        assertTrue(store.clear(0, 42));
        assertTrue(store.trackedNow(0, 42));
        assertTrue(store.history(0, 42).isEmpty());
        assertTrue(new SpecialContactsStore(root).history(0, 42).isEmpty());
        // What was last seen stays, so the next change is still a line.
        assertEquals(Collections.singletonList(SEEN_MONTH), kinds(store.observe(0, 42, look(MONTH, 0), T + 2, false)));
        assertFalse(store.clear(0, 99));
    }

    @Test public void onlyAnAccountFolderOfPeoplesFilesIsRead() throws IOException {
        assertTrue(new File(root, "abc").mkdirs());
        assertTrue(new File(root, Integer.toString(Accounts.MAX)).mkdirs());
        write(new File(root, Accounts.MAX + "/5.json"), "{}");
        assertTrue(new File(root, "0").mkdirs());
        write(new File(root, "0/notes.txt"), "x");
        write(new File(root, "0/0.json"), "{}");
        write(new File(root, "0/12.json.bak"), "{}");
        write(new File(root, "loose.json"), "{}");
        SpecialContactsStore reopened = new SpecialContactsStore(root);
        assertEquals(Collections.singletonList(12L), ids(reopened.list(0)));
        assertFalse(reopened.anyTracked(5));
    }

    @Test public void aFileNameNamesAPersonOnlyWhenItsAllDigits() {
        assertEquals(42, idOf("42.json"));
        assertEquals(42, idOf("42.json.bak"));
        assertEquals(42, idOf("42.json.new"));
        assertEquals(Long.MAX_VALUE, idOf(Long.MAX_VALUE + ".json"));
        for (String name : new String[]{".json", "x.json", "4x2.json", "-4.json", "42.txt", "42", "9223372036854775808.json",
                "12345678901234567890.json", "42.json.old"}) {
            assertEquals(name, 0, idOf(name));
        }
    }

    private static Seen look(int status, long lastSeen) {
        Seen seen = new Seen();
        seen.status = status;
        seen.lastSeen = lastSeen;
        return seen;
    }

    private static Seen person(String name, String usernames, String phone) {
        Seen seen = look(RECENTLY, 0);
        seen.name = name;
        seen.usernames = usernames;
        seen.phone = phone;
        return seen;
    }

    private static Seen photo(Seen seen, long id) {
        seen.photoKnown = true;
        seen.photoId = id;
        return seen;
    }

    private static Seen contact(Seen seen, boolean contact, boolean mutual) {
        seen.contactKnown = true;
        seen.contact = contact;
        seen.mutual = mutual;
        return seen;
    }

    private static List<String> none() {
        return Collections.emptyList();
    }

    private static List<String> kinds(List<Event> events) {
        List<String> kinds = new ArrayList<>();
        for (Event event : events) kinds.add(event.kind);
        return kinds;
    }

    private static List<Long> ids(List<SpecialContactsStore.Person> people) {
        List<Long> ids = new ArrayList<>();
        for (SpecialContactsStore.Person person : people) ids.add(person.id);
        return ids;
    }

    private static void write(File file, String text) throws IOException {
        File dir = file.getParentFile();
        if (!dir.mkdirs() && !dir.isDirectory()) throw new IOException("no folder for " + file);
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(text.getBytes(StandardCharsets.UTF_8));
        }
    }
}
