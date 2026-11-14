package app.hushmessenger.extension;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class SpecialContactsStoreTest {
    private static final long NOW = 1_763_000_000_000L;
    private File folder;

    @Before public void reset() throws Exception {
        File root = new File(RuntimeEnvironment.getApplication().getCacheDir(), "special_contacts_store_test");
        delete(root);
        folder = new File(root, "100");
    }

    private static void delete(File file) {
        File[] inside = file.listFiles();
        if (inside != null) for (File each : inside) delete(each);
        file.delete();
    }

    private SpecialContactsStore store() {
        SpecialContactsStore store = new SpecialContactsStore(folder);
        store.load();
        return store;
    }

    /** One person's history as kind=detail, newest first. */
    private static List<String> kinds(SpecialContactsStore store, String id) {
        List<String> kinds = new ArrayList<>();
        for (SpecialContactsStore.Event event : store.history(id)) kinds.add(event.detail.isEmpty() ? event.kind : event.kind + "=" + event.detail);
        return kinds;
    }

    @Test public void tracksUpToFiftyPeopleByTheirUserId() {
        SpecialContactsStore store = store();
        assertEquals("100", store.account);
        assertEquals(SpecialContactsStore.Result.ADDED, store.track("7", "Ana", NOW));
        assertEquals(SpecialContactsStore.Result.ALREADY, store.track("7", "Ana", NOW + 1));
        for (String bad : new String[] {null, "", "ana", "7a", "123456789012345678901", "../7"})
            assertEquals(String.valueOf(bad), SpecialContactsStore.Result.FAILED, store.track(bad, "Someone", NOW));
        assertEquals(Collections.singleton("7"), store.ids());
        assertEquals(Collections.singletonList("tracked"), kinds(store, "7"));

        for (int i = 1; i < SpecialContactsStore.MAX_PEOPLE; i++) assertEquals(SpecialContactsStore.Result.ADDED, store.track("9" + i, "", NOW));
        assertEquals(SpecialContactsStore.MAX_PEOPLE, store.count());
        assertEquals(SpecialContactsStore.Result.FULL, store.track("8", "Ben", NOW));
        assertFalse(store.ids().contains("8"));

        assertTrue(store.untrack("7"));
        assertFalse("Already stopped", store.untrack("7"));
        assertFalse(store.ids().contains("7"));
        assertFalse("Nothing kept of them", new File(folder, "7.json").exists());
        assertEquals("Room again", SpecialContactsStore.Result.ADDED, store.track("8", "Ben", NOW));
    }

    @Test public void onlineIsWrittenOnceUntilTheyGoOffline() {
        SpecialContactsStore store = store();
        store.track("7", "Ana", NOW);
        assertFalse("Not tracked", store.presence("8", true, 0, NOW));
        assertTrue(store.presence("7", true, 0, NOW + 1));
        assertFalse("Still online", store.presence("7", true, 0, NOW + 2));
        // Messenger's last active time is in seconds.
        assertTrue(store.presence("7", false, NOW / 1000, NOW + 3));
        assertFalse("The same offline update again", store.presence("7", false, NOW / 1000, NOW + 4));
        assertTrue(store.presence("7", true, NOW / 1000, NOW + 5));
        assertEquals(Arrays.asList("online", "offline=" + (NOW / 1000 * 1000), "online", "tracked"), kinds(store, "7"));
        assertEquals(NOW + 5, store.history("7").get(0).at);
    }

    @Test public void offlineNeedsALastActiveTimeAndOnlyRepeatsWhenItMovedOn() {
        SpecialContactsStore store = store();
        store.track("7", "Ana", NOW);
        assertFalse("This phone losing its connection says nothing about them", store.presence("7", false, 0, NOW + 1));
        assertTrue("The first thing seen", store.presence("7", false, NOW, NOW + 2));
        assertFalse("Milliseconds are taken as they are", store.presence("7", false, NOW + 30_000, NOW + 3));
        assertTrue("On again in between", store.presence("7", false, NOW + 120_000, NOW + 4));
        assertFalse("An older time", store.presence("7", false, NOW, NOW + 5));
        assertEquals(Arrays.asList("offline=" + (NOW + 120_000), "offline=" + NOW, "tracked"), kinds(store, "7"));
    }

    @Test public void typingIsOneEventPerBurst() {
        SpecialContactsStore store = store();
        store.track("7", "Ana", NOW);
        assertFalse("Not tracked", store.typing("8", NOW));
        assertTrue(store.typing("7", NOW));
        assertFalse(store.typing("7", NOW + 29_000));
        assertTrue(store.typing("7", NOW + SpecialContactsStore.TYPING_BURST_MILLIS));
        assertTrue("The clock went back", store.typing("7", NOW - 60_000));
        assertEquals(Arrays.asList("typing", "typing", "typing", "tracked"), kinds(store, "7"));
    }

    @Test public void aNewNameGoesInTheHistory() {
        SpecialContactsStore store = store();
        store.track("7", "", NOW);
        store.track("8", "Ben", NOW);
        assertTrue("The first name is kept quietly", store.named("7", "Ana", NOW + 1));
        assertFalse("Same name", store.named("7", " Ana ", NOW + 2));
        assertFalse("No name", store.named("7", "  ", NOW + 3));
        assertTrue(store.named("7", "Ana\tB", NOW + 4));
        assertTrue(store.named("8", "Benji", NOW + 5));
        assertFalse("Not tracked", store.named("9", "Cal", NOW + 6));
        assertEquals(Arrays.asList("name=Ana\nAna B", "tracked"), kinds(store, "7"));
        assertEquals(Arrays.asList("name=Ben\nBenji", "tracked"), kinds(store, "8"));
    }

    @Test public void everythingIsReadBackAfterARestart() {
        SpecialContactsStore store = store();
        store.track("7", "Ana", NOW);
        store.track("8", "Ben", NOW + 1);
        store.presence("7", true, 0, NOW + 10);
        store.typing("8", NOW + 5);

        SpecialContactsStore again = store();
        assertEquals(store.ids(), again.ids());
        assertEquals(Arrays.asList("online", "tracked"), kinds(again, "7"));
        List<String> order = new ArrayList<>();
        for (SpecialContactsStore.Person person : again.people()) order.add(person.id + "=" + person.name + "@" + person.latest.at);
        assertEquals("Seen most lately first", Arrays.asList("7=Ana@" + (NOW + 10), "8=Ben@" + (NOW + 5)), order);
        assertFalse("Still known to be online", again.presence("7", true, 0, NOW + 20));
    }

    @Test public void anUnreadableFileKeepsThePersonTrackedWithAFreshHistory() throws Exception {
        assertTrue(folder.mkdirs());
        Files.write(new File(folder, "7.json").toPath(), "{not json".getBytes(StandardCharsets.UTF_8));
        Files.write(new File(folder, "8.json").toPath(), "{\"v\":1,\"id\":\"9\",\"events\":[]}".getBytes(StandardCharsets.UTF_8));
        Files.write(new File(folder, "ana.json").toPath(), "{}".getBytes(StandardCharsets.UTF_8));
        Files.write(new File(folder, "notes.txt").toPath(), "hi".getBytes(StandardCharsets.UTF_8));
        Files.write(new File(folder, "9.json").toPath(), ("{\"v\":1,\"id\":\"9\",\"name\":\"Cal\",\"since\":5,\"last\":0,\"events\":"
            + "[[5,\"tracked\",\"\"],[6,\"wave\",\"\"],[7,\"online\"],\"x\",[8,\"typing\",\"\"]]}").getBytes(StandardCharsets.UTF_8));

        SpecialContactsStore store = store();
        assertEquals(new java.util.HashSet<>(Arrays.asList("7", "8", "9")), store.ids());
        assertTrue(store.history("7").isEmpty());
        assertTrue("Another person's file under this id", store.history("8").isEmpty());
        assertEquals("Only the events it knows", Arrays.asList("typing", "tracked"), kinds(store, "9"));
        assertTrue("Written again in the format it reads", store.presence("7", true, 0, NOW));
        assertEquals(Collections.singletonList("online"), kinds(store(), "7"));
    }

    @Test public void clearingTheHistoryKeepsThemTracked() {
        SpecialContactsStore store = store();
        store.track("7", "Ana", NOW);
        store.presence("7", false, NOW, NOW + 1);
        assertTrue(store.clearHistory("7"));
        assertFalse("Not tracked", store.clearHistory("8"));
        assertTrue(store.history("7").isEmpty());
        assertNull(store.people().get(0).latest);
        assertTrue(store.ids().contains("7"));
        assertTrue("Seen again from the start", store.presence("7", false, NOW, NOW + 2));
        assertEquals(1, store().history("7").size());
    }

    @Test public void theOldestEventsGoPastFiveHundred() {
        SpecialContactsStore store = store();
        store.track("7", "Ana", NOW);
        for (int i = 1; i <= SpecialContactsStore.MAX_EVENTS + 20; i++)
            assertTrue(store.typing("7", NOW + i * SpecialContactsStore.TYPING_BURST_MILLIS));
        List<SpecialContactsStore.Event> history = store().history("7");
        assertEquals(SpecialContactsStore.MAX_EVENTS, history.size());
        assertEquals(NOW + (SpecialContactsStore.MAX_EVENTS + 20) * SpecialContactsStore.TYPING_BURST_MILLIS, history.get(0).at);
        assertEquals(NOW + 21 * SpecialContactsStore.TYPING_BURST_MILLIS, history.get(history.size() - 1).at);
    }
}
