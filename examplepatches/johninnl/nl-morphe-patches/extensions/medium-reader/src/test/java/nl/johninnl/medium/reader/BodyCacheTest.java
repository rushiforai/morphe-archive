package nl.johninnl.medium.reader;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;
import java.util.concurrent.atomic.AtomicLong;
import static org.junit.Assert.*;

public class BodyCacheTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();
    private final AtomicLong clock = new AtomicLong(1000);
    private static final String ID = "dc7f60d860e4";
    private static final URI ORIGIN = URI.create("https://freedium-mirror.cfd/");
    private File directory;
    private BodyCache cache;
    private BodyCache.Key key;

    @Before public void setup() throws Exception {
        directory = temporary.newFolder("bodies");
        cache = new BodyCache(directory, 2 * 1024 * 1024, 2, 5000, clock::get);
        key = BodyCache.key(ID, "revision-1", ORIGIN);
    }
    private ArticleBody body(String id, String text) {
        ArticleBody.Markup markup = new ArticleBody.Markup("STRONG", 0, 3, null);
        ArticleBody.Image image = new ArticleBody.Image("1*image.png", ORIGIN.resolve("img/medium/700/1*image.png"), "Alt", 1200, 800);
        return new ArticleBody(id, "Title", URI.create("https://medium.com/p/" + id), null, Arrays.asList(
                new ArticleBody.Block("P", text, Collections.singletonList(markup), null, null),
                new ArticleBody.Block("IMG", "Caption", Collections.emptyList(), image, null)));
    }

    @Test public void roundTripsBodyWithoutMixingNativeAccountStateIntoCache() throws Exception {
        cache.put(key, body(ID, "One paragraph."));
        BodyCache.Entry entry = cache.get(key);
        assertNotNull(entry);
        assertEquals(1000, entry.fetchedAtMillis);
        assertEquals("One paragraph.", entry.body.blocks.get(0).text);
        assertEquals(3, entry.body.blocks.get(0).markups.get(0).end);
        assertEquals("Caption", entry.body.blocks.get(1).text);
        assertEquals("1*image.png", entry.body.blocks.get(1).image.id);
        assertEquals(1200, entry.body.blocks.get(1).image.width);
    }

    @Test public void doesNotReuseAnotherRevisionOrMirror() throws Exception {
        cache.put(key, body(ID, "One paragraph."));
        assertNotNull(cache.get(key));
        assertNull(cache.get(BodyCache.key(ID, "revision-2", ORIGIN)));
        assertNull(cache.get(BodyCache.key(ID, "revision-1", URI.create("https://another.example/"))));
    }

    @Test public void expiresOldBodyRatherThanRelabellingItAsFresh() throws Exception {
        cache.put(key, body(ID, "One paragraph."));
        assertNotNull(cache.get(key));
        clock.set(6001);
        assertNull(cache.get(key));
    }

    @Test public void expiredOnlineEntryRemainsAvailableAsAnExplicitOfflineSnapshot() throws Exception {
        java.util.concurrent.atomic.AtomicLong time = new java.util.concurrent.atomic.AtomicLong(1000);
        BodyCache cache = new BodyCache(temporary.newFolder(), 1024 * 1024, 10, 100, time::get);
        BodyCache.Key key = BodyCache.key(ID, "v1", ORIGIN);
        cache.put(key, body(ID, "Saved text")); time.set(1200);
        assertNull(cache.get(key));
        assertEquals(1, cache.saved().size()); assertEquals("Saved text", cache.saved().get(0).body.blocks.get(0).text);
        assertEquals(1000, cache.saved().get(0).fetchedAtMillis);
        cache.clear(); assertTrue(cache.saved().isEmpty());
    }

    @Test public void treatsCorruptedCacheAsMiss() throws Exception {
        cache.put(key, body(ID, "One paragraph."));
        assertNotNull(cache.get(key));
        File file = directory.listFiles()[0];
        byte[] bytes = Files.readAllBytes(file.toPath());
        bytes[bytes.length / 2] ^= 1;
        Files.write(file.toPath(), bytes);
        assertNull(cache.get(key));
    }

    @Test public void evictsOldestBodyWhenCountBoundIsReached() throws Exception {
        cache.put(key, body(ID, "First body."));
        clock.set(2000);
        BodyCache.Key second = BodyCache.key("bf716433d4a6", "v1", ORIGIN);
        cache.put(second, body("bf716433d4a6", "Second body."));
        clock.set(3000);
        BodyCache.Key third = BodyCache.key("8ad269371d15", "v1", ORIGIN);
        cache.put(third, body("8ad269371d15", "Third body."));
        assertNull(cache.get(key));
        assertNotNull(cache.get(second));
        assertNotNull(cache.get(third));
    }

    @Test public void failedOversizedWritePreservesPreviouslyStoredBody() throws Exception {
        cache = new BodyCache(directory, 2048, 2, 5000, clock::get);
        cache.put(key, body(ID, "Original body."));
        try { cache.put(key, body(ID, "x".repeat(10000))); fail("Oversized body was stored"); }
        catch (IOException expected) { }
        assertNotNull(cache.get(key));
        assertEquals("Original body.", cache.get(key).body.blocks.get(0).text);
    }

    @Test public void storesLongCodeWithoutModifiedUtfLengthTruncation() throws Exception {
        String text = "x".repeat(80000);
        cache.put(key, body(ID, text));
        assertNotNull(cache.get(key));
        assertEquals(text, cache.get(key).body.blocks.get(0).text);
    }

    @Test public void clearDoesNotDeleteUnrelatedFiles() throws Exception {
        File unrelated = new File(directory, "native-download.marker");
        Files.write(unrelated.toPath(), new byte[]{1, 2, 3});
        cache.put(key, body(ID, "One paragraph."));
        assertNotNull(cache.get(key));
        cache.clear();
        assertNull(cache.get(key));
        assertArrayEquals(new byte[]{1, 2, 3}, Files.readAllBytes(unrelated.toPath()));
    }
}
