package app.ayham.extension.music.addons;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;

import app.ayham.extension.music.automix.Json;

import org.junit.Test;

/** Answers and links from an addon are untrusted: they fail as bad input, never as a crash. */
public class HostileInputTest {
    @Test
    public void deepNestingIsBadInputNotAStackOverflow() {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < 100_000; i++) b.append('[');
        try {
            Json.parse(b.toString());
            fail("parsed");
        } catch (IllegalArgumentException expected) {
            // a RuntimeException: AddonClient's catch takes it as the addon's fault
        }
    }

    @Test
    public void moderateNestingStillParses() {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < 40; i++) b.append("{\"a\":");
        b.append("1");
        for (int i = 0; i < 40; i++) b.append('}');
        assertNotNull(Json.parse(b.toString()));
    }

    @Test
    public void anOverlongPortIsNotALink() {
        assertNull(Protocol.parse("https://h:99999999999/x"));
        assertNotNull(Protocol.parse("https://h:8443/x"));
    }
}
