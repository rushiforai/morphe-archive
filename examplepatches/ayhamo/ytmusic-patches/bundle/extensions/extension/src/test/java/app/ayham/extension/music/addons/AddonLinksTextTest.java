package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;

import org.junit.Test;

/** The settings' addon links: each whole link on its own line; what a test says. */
public class AddonLinksTextTest {
    @Test
    public void eachWholeLinkOnItsOwnLine() {
        String s = AddonLinksPreference.summary(Arrays.asList("https://a.example/tok1/manifest.json", "https://b.example/x?token=abc"));
        assertEquals("1. https://a.example/tok1/manifest.json\n\n2. https://b.example/x?token=abc\n\nTap to add, test, reorder or remove.", s);
    }

    @Test
    public void noLinksYet() {
        assertTrue(AddonLinksPreference.summary(Collections.<String>emptyList()).startsWith("None yet."));
    }

    @Test
    public void aTestSaysWhatAnswered() {
        Protocol.Manifest m = new Protocol.Manifest();
        m.name = "Nebula";
        m.version = "1.2";
        m.usable = true;
        m.allowDownloads = true;
        assertEquals("Nebula 1.2 answers (120 ms).\nA search for \"The Weeknd - Blinding Lights\": 15 songs (800 ms).",
                AddonLinksPreference.testResult(m, 15, 120, 800));
        m.allowDownloads = false;
        assertTrue(AddonLinksPreference.testResult(m, 1, 1, 1).endsWith("1 song (1 ms).\nIt allows no downloads."));
        m.usable = false;
        assertTrue(AddonLinksPreference.testResult(m, 0, 1, 1).endsWith("It has no search, so it can't be used."));
    }
}
