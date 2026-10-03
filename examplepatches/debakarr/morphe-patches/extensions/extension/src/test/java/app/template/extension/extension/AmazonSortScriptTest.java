package app.template.extension.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

/** The page script is a Java text block: check what actually reaches the WebView. */
public class AmazonSortScriptTest {

    private static final String JS = AmazonSortScript.JS;

    @Test
    public void backslashesAreSingleByTheTimeTheWebViewSeesThem() {
        // A doubled backslash would turn every regex in the script into a different one.
        // whitespace class (with a non-breaking space, written either as an escape or literally)
        assertTrue(JS.contains(".replace(/[\\s"));
        assertTrue(JS.contains("<script[\\s\\S]*?<\\/script>"));
        assertFalse(JS.contains("\\\\s"));
        assertFalse(JS.contains("\\\\u"));
    }

    @Test
    public void installsAllFourControlsAndIsIdempotent() {
        assertTrue(JS.startsWith("(function () {"));
        assertTrue(JS.contains("if (window.__morpheSort) { window.__morpheSort.refresh(); return; }"));
        for (String id : new String[]{"morphe-ranked", "morphe-sort-ratings", "morphe-min-four", "morphe-hide-ads"}) {
            assertTrue(id, JS.contains("'" + id + "'"));
        }
    }

    @Test
    public void offersBothModesTheFilterAndCrossPageLoading() {
        assertTrue(JS.contains("'count'") && JS.contains("'rating'"));
        assertTrue(JS.contains("MIN_RATING = 4"));
        assertTrue(JS.contains("credentials: 'include'")); // same-origin, the page's own session
        assertTrue(JS.contains("searchParams.set('page'"));
    }

    @Test
    public void writesTheScriptOutForExternalChecks() throws Exception {
        // `node --check` and a byte-for-byte comparison run against this file outside the JVM.
        File out = new File("build/amazon-sort.compiled.js");
        File dir = out.getParentFile();
        if (dir != null) dir.mkdirs();
        Files.write(out.toPath(), JS.getBytes(StandardCharsets.UTF_8));
        assertEquals(JS.length(), new String(Files.readAllBytes(out.toPath()), StandardCharsets.UTF_8).length());
    }
}
