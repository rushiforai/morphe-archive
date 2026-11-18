package app.revanced.extension.rif;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.nio.charset.StandardCharsets;

public class RedditBlocksTest {

    private static byte[] b(String s) {
        return s.getBytes(StandardCharsets.UTF_8);
    }

    @Test
    public void recognisesTheBlockPage() {
        assertTrue(RedditBlocks.isBlockPage(b(
                "<body class=theme-beta><div><style>...</style><div>You've been blocked by "
                        + "network security.</div></div>")));
        assertTrue(RedditBlocks.isBlockPage(b(
                "<!DOCTYPE html><html><head><title>Blocked</title></head><body></body></html>")));
        assertTrue(RedditBlocks.isBlockPage(b("\n  <HTML><TITLE>BLOCKED</TITLE>")));
    }

    @Test
    public void ignoresEverythingElse() {
        assertFalse(RedditBlocks.isBlockPage(null));
        assertFalse(RedditBlocks.isBlockPage(new byte[0]));
        assertFalse(RedditBlocks.isBlockPage(b("{\"reason\": \"private\", \"message\": \"Forbidden\"}")));
        assertFalse(RedditBlocks.isBlockPage(b("  {\"message\": \"blocked by network security\"}")));
        assertFalse(RedditBlocks.isBlockPage(b("<html><title>Forbidden</title></html>")));
    }
}
