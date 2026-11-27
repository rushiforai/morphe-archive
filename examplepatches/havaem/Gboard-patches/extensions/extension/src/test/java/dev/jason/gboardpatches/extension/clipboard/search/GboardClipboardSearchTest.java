package dev.jason.gboardpatches.extension.clipboard.search;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;
import java.util.function.Function;

import org.junit.After;
import org.junit.Test;

public final class GboardClipboardSearchTest {
    private static final String RECENT = new String("recent-header");
    private static final String PINNED = new String("pinned-header");
    private static final Function<String, String> TEXT = item -> item.startsWith("img:") ? null : item;

    @After
    public void reset() {
        GboardClipboardSearch.clear();
    }

    @Test
    public void foldIgnoresCaseAccentsAndDStroke() {
        assertEquals("tieng viet", GboardClipboardSearch.fold("Tiếng Việt"));
        assertEquals("duong", GboardClipboardSearch.fold("ĐƯỜNG"));
    }

    @Test
    public void filterKeepsHeadersAndMatchingTextOnly() {
        List<String> items = Arrays.asList(RECENT, "Địa chỉ nhà", "img:photo", "hello",
                PINNED, "dia chi cong ty");
        List<String> result = GboardClipboardSearch.filter(items, "dia chi",
                Arrays.asList(RECENT, PINNED), TEXT);
        assertEquals(Arrays.asList(RECENT, "Địa chỉ nhà", PINNED, "dia chi cong ty"), result);
    }

    @Test
    public void filterWithoutQueryReturnsSameList() {
        List<String> items = Arrays.asList(RECENT, "a");
        assertSame(items, GboardClipboardSearch.filter(items, null, Arrays.asList(RECENT), TEXT));
    }

    @Test
    public void queryOnlySurvivesTheTripThroughTheQueryField() {
        GboardClipboardSearch.begin();
        GboardClipboardSearch.beforeOpenOrClose(); // clipboard closes for the query field
        assertTrue(GboardClipboardSearch.submit("  abc "));
        GboardClipboardSearch.beforeOpenOrClose(); // clipboard reopens, loader runs after this
        assertEquals("abc", GboardClipboardSearch.query());
        GboardClipboardSearch.afterOpen();
        assertEquals("abc", GboardClipboardSearch.query());
        GboardClipboardSearch.beforeOpenOrClose(); // user leaves the clipboard
        assertNull(GboardClipboardSearch.query());
    }

    @Test
    public void submitWithoutPendingSearchSavesNormally() {
        assertFalse(GboardClipboardSearch.submit("new clip"));
        assertNull(GboardClipboardSearch.query());
    }

    @Test
    public void abandonedSearchDoesNotCaptureTheNextSave() {
        GboardClipboardSearch.begin();
        GboardClipboardSearch.beforeOpenOrClose();
        GboardClipboardSearch.afterOpen(); // back on the clipboard without Done
        assertFalse(GboardClipboardSearch.submit("real clip"));
    }
}
