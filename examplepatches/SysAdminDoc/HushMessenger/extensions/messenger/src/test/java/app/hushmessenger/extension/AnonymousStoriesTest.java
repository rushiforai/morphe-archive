package app.hushmessenger.extension;

import java.util.HashSet;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class AnonymousStoriesTest {
    // Messenger's session hashes its user ID, so the ID itself stands in for a session here.
    private static final String ACCOUNT = "100001";
    private static final String OTHER_ACCOUNT = "100002";

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().putBoolean("anonymous_stories", true).commit();
    }

    private static Set<String> seeded(Object session) {
        Set<String> readOnPhone = new HashSet<>();
        Settings.seedSeenStories(readOnPhone, session);
        return readOnPhone;
    }

    private static void keep(String... entries) {
        Settings.preferences.edit().putStringSet(Settings.SEEN_STORIES, Set.of(entries)).commit();
    }

    @Test public void cardsComeBackOnlyForTheAccountThatOpenedThem() {
        Settings.markStorySeen(ACCOUNT, "311");
        Settings.markStorySeen(ACCOUNT, "312");
        Settings.markStorySeen(OTHER_ACCOUNT, "411");
        assertEquals(Set.of("311", "312"), seeded(ACCOUNT));
        assertEquals(Set.of("411"), seeded(OTHER_ACCOUNT));
        assertEquals(Set.of(), seeded("100003"));
    }

    @Test public void seedingAddsToWhatMessengerAlreadyMarkedRead() {
        Settings.markStorySeen(ACCOUNT, "311");
        Set<String> readOnPhone = new HashSet<>(Set.of("200"));
        Settings.seedSeenStories(readOnPhone, ACCOUNT);
        assertEquals(Set.of("200", "311"), readOnPhone);
    }

    @Test public void withTheSwitchOffNothingIsKeptOrPutBack() {
        Settings.preferences.edit().putBoolean("anonymous_stories", false).commit();
        Settings.markStorySeen(ACCOUNT, "311");
        assertFalse(Settings.preferences.contains(Settings.SEEN_STORIES));

        Settings.preferences.edit().putBoolean("anonymous_stories", true).commit();
        Settings.markStorySeen(ACCOUNT, "312");
        Settings.preferences.edit().putBoolean("anonymous_stories", false).commit();
        assertEquals(Set.of(), seeded(ACCOUNT));
        Settings.preferences.edit().putBoolean("anonymous_stories", true).putBoolean("paused", true).commit();
        assertEquals(Set.of(), seeded(ACCOUNT));
        Settings.preferences.edit().putBoolean("paused", false).commit();
        assertEquals(Set.of("312"), seeded(ACCOUNT));
    }

    @Test public void cardsLastTwoDaysAndOpeningOneAgainKeepsOneEntry() {
        long now = System.currentTimeMillis();
        String account = Settings.storyAccount(ACCOUNT);
        keep(account + ":311:" + (now - Settings.SEEN_STORY_TTL - 60_000),
            account + ":312:" + (now - Settings.SEEN_STORY_TTL + 60_000),
            account + ":313:" + (now - 1_000));
        assertEquals(Set.of("312", "313"), seeded(ACCOUNT));

        Settings.markStorySeen(ACCOUNT, "313");
        Set<String> entries = Settings.preferences.getStringSet(Settings.SEEN_STORIES, Set.of());
        assertEquals(2, entries.size());
        assertTrue(entries.contains(account + ":312:" + (now - Settings.SEEN_STORY_TTL + 60_000)));
        assertTrue(entries.stream().anyMatch(entry -> entry.startsWith(account + ":313:")));
        assertFalse(entries.contains(account + ":313:" + (now - 1_000)));
    }

    @Test public void damagedEntriesAndMissingValuesChangeNothing() {
        long now = System.currentTimeMillis();
        String account = Settings.storyAccount(ACCOUNT);
        keep("garbage", account + ":", account + "::" + now, account + ":314:soon", account + ":315:" + now);
        assertEquals(Set.of("315"), seeded(ACCOUNT));

        Settings.markStorySeen(ACCOUNT, null);
        Settings.markStorySeen(ACCOUNT, "");
        Settings.seedSeenStories(null, ACCOUNT);
        assertEquals(Set.of("315"), seeded(ACCOUNT));
        assertEquals(5, Settings.preferences.getStringSet(Settings.SEEN_STORIES, Set.of()).size());

        // A missing session still gets a key of its own, apart from every real account.
        Settings.markStorySeen(null, "316");
        assertEquals(Set.of("316"), seeded(null));
        assertEquals(Set.of("315"), seeded(ACCOUNT));
    }
}
