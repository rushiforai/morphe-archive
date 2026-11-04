package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.*;

import app.wordfeudwordfinder.extension.core.WfError;
import app.wordfeudwordfinder.extension.ui.Strings.Key;
import org.junit.Test;

public class StringsTest {
    @Test public void fallbackToEnglish() {
        assertEquals("Play", Strings.get("xx", Key.PLAY));
        assertEquals("Play", Strings.get(null, Key.PLAY));
    }
    @Test public void everyLanguageHasEveryKey() {
        for (String lang : Strings.languages())
            for (Key k : Key.values()) {
                String s = Strings.get(lang, k);
                assertNotNull(lang + " " + k, s);
                assertFalse(lang + " " + k, s.trim().isEmpty());
            }
    }
    @Test public void closeLabel() {
        assertEquals("Close", Strings.get("en", Key.CLOSE));
        assertEquals("Sluiten", Strings.get("nl", Key.CLOSE));
        assertEquals("Close", Strings.get("xx", Key.CLOSE));
    }
    @Test public void languageTagsNormalized() {
        assertEquals(Strings.get("nl", Key.PLAY), Strings.get("nl-NL", Key.PLAY));
        assertEquals(Strings.get("nl", Key.PLAY), Strings.get("nl_BE", Key.PLAY));
        assertEquals(Strings.get("nb", Key.PLAY), Strings.get("no", Key.PLAY));
        assertEquals(Strings.get("nb", Key.PLAY), Strings.get("nn", Key.PLAY));
        assertNotEquals("Play", Strings.get("nl", Key.PLAY));
    }
    @Test public void placeholdersWork() {
        for (String lang : Strings.languages()) {
            assertEquals(lang, "12", String.format(Strings.get(lang, Key.PTS), 12).replaceAll("\\D", ""));
            assertTrue(String.format(Strings.get(lang, Key.USES), "AB").contains("AB"));
            assertTrue(String.format(Strings.get(lang, Key.ENDS_ON), "DW").contains("DW"));
        }
    }
    @Test public void errorKeyMapping() {
        assertEquals(Key.ERR_WL_HTTP, Strings.errorKey(WfError.wlHttp(404)));
        assertEquals(Key.ERR_GS_EVENT, Strings.errorKey(WfError.gsEvent("swap")));
        assertEquals(Key.ERR_MV_SERVER, Strings.errorKey(WfError.mvServer("x")));
        assertEquals(Key.ERR_MV_SESSION, Strings.errorKey(WfError.mvSession()));
        assertEquals(Key.ERR_GS_DATA, Strings.errorKey(WfError.gsData("d")));
        assertEquals(Key.ERR_WL_NET, Strings.errorKey(WfError.wlNet()));
        assertEquals(Key.ERR_WL_HASH, Strings.errorKey(WfError.wlHash()));
        assertEquals(Key.ERR_WL_DISK, Strings.errorKey(WfError.wlDisk()));
        assertEquals(Key.ERR_WL_NONE, Strings.errorKey(WfError.wlNone()));
        assertEquals(Key.ERR_MV_NET, Strings.errorKey(WfError.mvNet()));
        assertTrue(Strings.get("en", Key.ERR_MV_SESSION).contains("reopening Wordfeud"));
    }
    @Test public void realDiacritics() {
        assertEquals("L\u00e6ngde", Strings.get("da", Key.SORT_LENGTH));
        assertEquals("Ords\u00f6kare", Strings.get("sv", Key.TITLE));
        assertEquals("Ords\u00f8ker", Strings.get("nb", Key.TITLE));
        assertEquals("L\u00e4nge", Strings.get("de", Key.SORT_LENGTH));
        assertEquals("R\u00e9essayer", Strings.get("fr", Key.RETRY));
        assertTrue(Strings.get("es", Key.ERR_WL_HASH).contains("est\u00e1 da\u00f1ada"));
        assertTrue(Strings.get("fr", Key.ERR_MV_NET).contains("\u00c9chec"));
    }
    @Test public void task14Placeholders() {
        for (String lang : Strings.languages()) {
            assertTrue(lang, String.format(Strings.get(lang, Key.REJECTED_WORDS), "AB, CD").contains("AB, CD"));
            String pct = String.format(Strings.get(lang, Key.DOWNLOAD_PCT), 42);
            assertTrue(lang, pct.contains("42") && pct.contains("%"));
            assertTrue(lang, String.format(Strings.get(lang, Key.ERROR_CODE), "WL-NET").contains("WL-NET"));
        }
        assertEquals("Move rejected: AB", String.format(Strings.get("en", Key.REJECTED_WORDS), "AB"));
        assertEquals("42%", String.format(Strings.get("en", Key.DOWNLOAD_PCT), 42));
        assertEquals("Code: WL-NET", String.format(Strings.get("en", Key.ERROR_CODE), "WL-NET"));
    }
    @Test public void rejectedOneOfPlaceholder() {
        for (String lang : Strings.languages())
            assertTrue(lang, String.format(Strings.get(lang, Key.REJECTED_ONE_OF), "A, B").contains("A, B"));
        assertEquals("Move rejected: one of A, B", String.format(Strings.get("en", Key.REJECTED_ONE_OF), "A, B"));
    }
}
