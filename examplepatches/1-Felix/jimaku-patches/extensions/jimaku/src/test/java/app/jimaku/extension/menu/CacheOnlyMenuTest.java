package app.jimaku.extension.menu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import app.jimaku.extension.gateway.Lookup;

/** The menu as Menu and Player read it in step 2: the whole model, signed out, with only the shared cache. */
public class CacheOnlyMenuTest {
    private static Lookup cachedJa(String... translations) {
        return new Lookup("ja", Arrays.asList(translations), false);
    }

    private static List<String> rows(Lookup lookup, String preferred, String showing) {
        List<String> rows = new ArrayList<>();
        for (MenuModel.Row row : MenuModel.languages(lookup, preferred, showing, Locale.ENGLISH)) {
            assertTrue(row.premium);
            rows.add(row.name + (row.checked ? " ✓" : ""));
        }
        return rows;
    }

    @Test
    public void listsWhatTheCacheHasToShow() {
        assertEquals(Arrays.asList("English", "Deutsch", "Português ✓"), rows(cachedJa("pt", "en", "de"), "en", "pt"));
        // Nothing to make: no row for the preferred language until the cache has it, and none without a cache.
        assertEquals(Collections.singletonList("Deutsch"), rows(cachedJa("de"), "en", null));
        assertEquals(Collections.emptyList(), rows(null, "en", null));
        // The video's own language is Original caption's, unless it is the one on screen or preferred.
        assertEquals(Arrays.asList("English", "日本語 ✓"), rows(cachedJa("en"), "en", "ja"));
        assertEquals(Arrays.asList("日本語", "English"), rows(cachedJa("en"), "ja", null));
    }

    @Test
    public void hasAnOriginalWhereItAddsSomething() {
        assertFalse(MenuModel.originalAvailable(null, "en", null));
        assertTrue(MenuModel.originalAvailable(cachedJa("en"), "en", "en"));
        assertFalse(MenuModel.originalAvailable(cachedJa("en"), "en", "ja"));
        Lookup english = new Lookup("en", Collections.emptyList(), false);
        assertFalse(MenuModel.originalAvailable(english, "en", null));
        assertTrue(MenuModel.originalAvailable(new Lookup("en", Arrays.asList("de"), false), "en", "de"));
        assertTrue(MenuModel.originalAvailable(new Lookup("en", Arrays.asList("en"), true), "en", "en"));
    }
}
