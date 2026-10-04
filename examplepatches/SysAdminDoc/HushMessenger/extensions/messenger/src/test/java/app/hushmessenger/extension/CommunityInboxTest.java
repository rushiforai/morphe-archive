package app.hushmessenger.extension;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class CommunityInboxTest {
    private final Object ordinary = new Object(), joined = new Object(), announcement = new Object();
    private final Object unjoined = new Object(), unknown = new Object();
    private final List<?> snapshot = Collections.unmodifiableList(Arrays.asList(ordinary, joined, null, unjoined, announcement, unknown));

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
    }

    private List<?> render(boolean main) {
        return Settings.filterJoinedCommunityInboxRows(snapshot, () -> main, row -> row == joined || row == announcement);
    }

    @Test public void presentationCopyKeepsOrderUnknownsAndTheCompleteNativeSnapshot() {
        Settings.preferences.edit().putBoolean("community_inbox", true).commit();
        List<?> shown = render(true);
        assertEquals(Arrays.asList(ordinary, null, unjoined, unknown), shown);
        assertNotSame(snapshot, shown);
        assertEquals(6, snapshot.size());
        assertSame(joined, snapshot.get(1));
        assertSame(announcement, snapshot.get(4));
        assertThrows(UnsupportedOperationException.class, () -> shown.clear());
        assertEquals(Collections.singletonMap("community_inbox", true), Settings.preferences.getAll());
    }

    @Test public void offPauseAndResumeReevaluateTheSameCapturedSnapshotOnEachRender() {
        assertSame(snapshot, render(true));
        Settings.preferences.edit().putBoolean("community_inbox", true).apply();
        assertEquals(4, render(true).size());
        Settings.preferences.edit().putBoolean("paused", true).apply();
        assertSame(snapshot, render(true));
        Settings.preferences.edit().putBoolean("paused", false).apply();
        assertEquals(4, render(true).size());
        Settings.preferences.edit().putBoolean("community_inbox", false).apply();
        assertSame(snapshot, render(true));
        assertEquals(6, snapshot.size());
    }

    @Test public void offPauseSafeModeAndUnsupportedAvoidEveryNativeClassification() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("community_inbox", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            AtomicInteger calls = new AtomicInteger();
            assertSame(state, snapshot, Settings.filterJoinedCommunityInboxRows(snapshot,
                () -> { calls.incrementAndGet(); return true; }, row -> { calls.incrementAndGet(); return true; }));
            assertEquals(state, 0, calls.get());
        }
    }

    @Test public void searchFoldersAndUnknownScopeKeepTheExactOriginalRows() {
        Settings.preferences.edit().putBoolean("community_inbox", true).commit();
        assertSame(snapshot, render(false));
        // An unbound/unsupported extension has false native stubs, including unknown scope objects.
        assertSame(snapshot, Settings.filterJoinedCommunityInboxRows(snapshot, new Object(), new Object()));
        assertSame(snapshot, Settings.filterJoinedCommunityInboxRows(snapshot, (Object) null, null));
        assertSame(snapshot, Settings.filterJoinedCommunityInboxRows(snapshot, () -> true, row -> false));
        assertNull(Settings.filterJoinedCommunityInboxRows(null, () -> true, row -> true));
    }

    @Test public void allHiddenAndMidClassificationFailureNeverChangeOrCacheTheSnapshot() {
        Settings.preferences.edit().putBoolean("community_inbox", true).commit();
        List<?> onlyCommunities = List.of(joined, announcement);
        assertEquals(Collections.emptyList(), Settings.filterJoinedCommunityInboxRows(onlyCommunities, () -> true, row -> true));
        assertEquals(2, onlyCommunities.size());
        assertSame(snapshot, Settings.filterJoinedCommunityInboxRows(snapshot, () -> true, row -> {
            if (row == unjoined) throw new IllegalStateException("private row detail");
            return row == joined;
        }));
        assertFalse(Settings.lastHookErrors().get("community_inbox").contains("private row detail"));
        assertEquals(4, render(true).size());
    }

    // Messenger's thread-type chips; every one but MESSAGE_REQUESTS keeps the INBOX folder.
    private enum Chip { ALL, UNREAD, GROUPS, CHANNELS, CHANNELS_INCLUDING_UNJOINED, MESSAGE_REQUESTS }

    @Test public void onlyTheAllChipIsTheMainChatsList() {
        assertTrue(Settings.isAllChatsFilter(Chip.ALL));
        for (Chip chip : Chip.values()) if (chip != Chip.ALL) assertFalse(chip.name(), Settings.isAllChatsFilter(chip));
        assertFalse(Settings.isAllChatsFilter("ALL"));
        assertFalse(Settings.isAllChatsFilter(null));
        Settings.preferences.edit().putBoolean("community_inbox", true).commit();
        assertSame(snapshot, Settings.filterJoinedCommunityInboxRows(snapshot, null, Chip.CHANNELS));
    }
}
