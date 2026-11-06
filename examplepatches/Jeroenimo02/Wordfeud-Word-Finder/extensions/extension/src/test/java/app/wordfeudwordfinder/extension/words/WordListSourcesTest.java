package app.wordfeudwordfinder.extension.words;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.net.URI;
import org.junit.Test;

public class WordListSourcesTest {

    private static final int MAX_ID = 12;

    @Test
    public void allEntriesPinned() {
        for (int id = 0; id <= MAX_ID; id++) {
            WordListSources.Source s = WordListSources.get(id);
            if (s == null) continue;
            assertTrue("id " + id, s.url.startsWith("https://"));
            assertTrue("id " + id + " not pinned: " + s.url, s.url.matches(".*/[0-9a-f]{40}/.*"));
            assertTrue("id " + id, !s.url.contains("/main/") && !s.url.contains("/master/"));
            assertTrue("id " + id + " sha256", s.sha256.matches("[0-9a-f]{64}"));
            assertTrue("id " + id + " version", s.version >= 1);
            assertNotNull(s.charset);
        }
    }

    @Test
    public void openListsPerRuleset() {
        // Every Wordfeud ruleset 0..12 has an open list (wordlists/sources.json); 8 (Swedish strict) its own.
        for (int id = 0; id <= MAX_ID; id++) assertNotNull("id " + id, WordListSources.get(id));
        assertNull(WordListSources.get(13));
        assertTrue(WordListSources.get(8).url.endsWith("/wordlists/sv-strict/words.txt.gz"));
        assertTrue(WordListSources.get(6).url.endsWith("/wordlists/es/words.txt.gz"));
        WordListSources.Source nl = WordListSources.get(2);
        assertTrue(nl.url, nl.url.endsWith("/wordlists/nl/words.txt.gz"));
        assertTrue(nl.gzip());
        assertEquals("UTF-8", nl.charset);
        // US (0) and international (5) English have their own lists since 2026-11-05.
        assertTrue(WordListSources.get(0).url.endsWith("/wordlists/en-us/words.txt.gz"));
        assertTrue(WordListSources.get(5).url.endsWith("/wordlists/en-intl/words.txt.gz"));
        assertTrue(WordListSources.get(0).version >= 2); // above the old shared English list (version 1)
    }

    @Test
    public void urlPointsAtThisRepositoryAndBuildCommit() {
        WordListSources.Source nl = WordListSources.get(2);
        assertEquals("https://raw.githubusercontent.com/" + WordListManifest.REPOSITORY + "/" + WordListManifest.COMMIT
                + "/wordlists/nl/words.txt.gz", nl.url);
    }

    @Test
    public void allHostsAreRawGithubusercontent() {
        for (int id = 0; id <= MAX_ID; id++) {
            WordListSources.Source s = WordListSources.get(id);
            if (s == null) continue;
            assertEquals("id " + id, "raw.githubusercontent.com", URI.create(s.url).getHost());
        }
    }
}
