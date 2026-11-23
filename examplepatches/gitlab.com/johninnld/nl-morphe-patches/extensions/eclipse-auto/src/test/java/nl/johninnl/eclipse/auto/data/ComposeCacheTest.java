package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class ComposeCacheTest {
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private static final class Time implements ComposeCache.Clock {
        long now = 1_000_000L;
        String day = "2026-11-22";

        @Override public long now() { return now; }

        @Override public String utcDay() { return day; }
    }

    private final Time time = new Time();

    @Test public void homeIsFreshForFiveMinutesAndDiscoverForTen() {
        ComposeCache cache = new ComposeCache(null, time);
        cache.put("home", "acct", "{\"rows\":[]}");
        cache.put("discover", "acct", "{\"sections\":[]}");
        time.now += ComposeCache.HOME_FRESH_MS - 1;
        assertTrue(cache.lookup("home", "acct").fresh);
        time.now += 1;
        assertFalse("five minutes is stale for Home", cache.lookup("home", "acct").fresh);
        assertTrue("Discover is still fresh at five minutes", cache.lookup("discover", "acct").fresh);
        time.now = 1_000_000L + ComposeCache.DISCOVER_FRESH_MS;
        assertFalse(cache.lookup("discover", "acct").fresh);
        assertEquals(300000L, ComposeCache.HOME_FRESH_MS);
        assertEquals(600000L, ComposeCache.DISCOVER_FRESH_MS);
    }

    @Test public void aStaleEntryIsStillReturnedSoItCanBeShownWhileARefreshRuns() {
        ComposeCache cache = new ComposeCache(null, time);
        cache.put("home", "acct", "body");
        time.now += 3 * ComposeCache.HOME_FRESH_MS;
        ComposeCache.Lookup lookup = cache.lookup("home", "acct");
        assertEquals("body", lookup.body);
        assertFalse(lookup.fresh);
    }

    @Test public void anEntryFromAnotherUtcDayIsNeverFreshButStillServesWhenOffline() {
        ComposeCache cache = new ComposeCache(null, time);
        cache.put("home", "acct", "yesterday");
        time.day = "2026-11-23";
        ComposeCache.Lookup lookup = cache.lookup("home", "acct");
        assertEquals("yesterday", lookup.body);
        assertFalse(lookup.fresh);
    }

    @Test public void aClockThatWentBackwardsIsNotTrustedAsFresh() {
        ComposeCache cache = new ComposeCache(null, time);
        cache.put("home", "acct", "body");
        time.now -= 1000;
        assertFalse(cache.lookup("home", "acct").fresh);
    }

    @Test public void entriesAreKeyedPerFeedAndPerAccount() {
        ComposeCache cache = new ComposeCache(null, time);
        cache.put("home", "a|us", "A");
        assertNull(cache.lookup("home", "b|us"));
        assertNull(cache.lookup("discover", "a|us"));
        assertEquals("A", cache.lookup("home", "a|us").body);
        cache.clear("home", "a|us");
        assertNull(cache.lookup("home", "a|us"));
    }

    @Test public void anEntrySurvivesARestartThroughTheFileAndStoresNoAccountNameOrToken() throws Exception {
        File directory = new File(folder.getRoot(), "eclipse_auto");
        new ComposeCache(directory, time).put("home", "user-1|us", "{\"rows\":[]}");
        File[] files = directory.listFiles();
        assertNotNull(files);
        assertEquals(1, files.length);
        assertTrue(files[0].getName().matches("home-[0-9a-f]{24}\\.json"));
        assertFalse("the account key appears only as a hash", files[0].getName().contains("example"));
        String content = new String(Files.readAllBytes(files[0].toPath()), StandardCharsets.UTF_8);
        JSONObject stored = new JSONObject(content);
        assertEquals("[body, day, storedAt]", sortedKeys(stored));
        assertFalse(content.contains("example.com"));
        time.now += 1000;
        ComposeCache.Lookup lookup = new ComposeCache(directory, time).lookup("home", "user-1|us");
        assertEquals("{\"rows\":[]}", lookup.body);
        assertTrue(lookup.fresh);
        new ComposeCache(directory, time).clear("home", "user-1|us");
        assertEquals(0, directory.listFiles().length);
    }

    private static String sortedKeys(JSONObject object) {
        java.util.List<String> keys = new java.util.ArrayList<>();
        java.util.Iterator<String> iterator = object.keys();
        while (iterator.hasNext()) keys.add(iterator.next());
        java.util.Collections.sort(keys);
        return keys.toString();
    }

    @Test public void aCorruptFileIsIgnoredAndAnUnwritableDirectoryOnlyCostsTheFile() throws Exception {
        File directory = folder.newFolder("broken");
        ComposeCache cache = new ComposeCache(directory, time);
        cache.put("home", "acct", "ok");
        File file = directory.listFiles()[0];
        Files.write(file.toPath(), "not json".getBytes(StandardCharsets.UTF_8));
        assertNull("a corrupt file is no entry", new ComposeCache(directory, time).lookup("home", "acct"));
        File blocker = folder.newFile("not-a-directory");
        ComposeCache blocked = new ComposeCache(new File(blocker, "inside"), time);
        blocked.put("home", "acct", "kept in memory");
        assertEquals("kept in memory", blocked.lookup("home", "acct").body);
    }
}
