package app.ayham.extension.music.automix;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Collections;

import org.junit.Test;

/** spotify-mixes.md on files that bend the rules: malformed curves, jogwheel, no timing. */
public class SpotifyMixesTest {
    private static final String A = "AAAAAAAAAAA", B = "BBBBBBBBBBB", C = "CCCCCCCCCCC";

    private static String track(String title, String id) {
        return "{\"title\":\"" + title + "\",\"youtubeVideoId\":\"" + id + "\"}";
    }

    private static MixFile.Read read(String mixes) {
        return MixFile.read("{\"format\":\"spotify-mix-export\",\"version\":3,\"playlist\":{\"name\":\"T\",\"tracks\":["
                + track("One", A) + "," + track("Two", B) + "]},\"mixes\":[" + mixes + "]}");
    }

    /** Rule 5: a point that isn't two numbers, or a segment with no numeric start or end, is left out; nothing throws. */
    @Test
    public void malformedCurvePointsAreLeftOut() {
        MixFile.Read r = read("{\"index\":1,\"from\":" + track("One", A) + ",\"to\":" + track("Two", B)
                + ",\"fromStartMs\":1000,\"durationMs\":8000,\"bars\":4,\"style\":{\"volume\":7},\"curves\":{\"volume\":{\"from\":{\"curve\":["
                + "{\"start\":0,\"end\":1,\"points\":[null,[0.5],\"x\",[1,\"y\"],{},[0,1],[1,0]]},"
                + "{\"start\":\"a\",\"end\":1,\"points\":[[0,0.5],[1,0.5]]},"
                + "{\"start\":0,\"end\":1,\"points\":[[0.5]]}]}}}}");
        assertNull(r.refused);
        assertEquals(Collections.emptyList(), r.skipped);
        assertEquals(1, r.mixes.size());
        MixOverride.Drawing d = r.mixes.get(0).override.drawn[0];
        assertNotNull(d);
        double[][] gain = d.out.get("gain");
        assertEquals(2, gain.length);
        assertArrayEquals(new double[]{0, 1}, gain[0], 1e-9);
        assertArrayEquals(new double[]{16, 0}, gain[1], 1e-9);
    }

    /** A playlist whose tracks aren't a list (or no playlist) reads the mixes and doesn't throw (extension step 2). */
    @Test
    public void tracksThatArentAListDontThrow() {
        String mix = "{\"index\":1,\"from\":" + track("One", A) + ",\"to\":" + track("Two", B) + ",\"fromStartMs\":1000,\"durationMs\":8000,\"style\":{}}";
        for (String pl : new String[]{"{\"name\":\"T\",\"tracks\":\"x\"}", "{\"name\":\"T\",\"tracks\":{}}", "{\"name\":\"T\",\"tracks\":[null,1,\"y\"]}", "null", "[]"}) {
            MixFile.Read r = MixFile.read("{\"format\":\"spotify-mix-export\",\"version\":3,\"playlist\":" + pl + ",\"mixes\":[" + mix + "]}");
            assertNull(pl, r.refused);
            assertEquals(pl, 1, r.mixes.size());
        }
    }

    /** Rules 3, 6, 7, 9: jogwheel is named as not carried; a mix with no timing at all is skipped, a straight cut stays No transition. */
    @Test
    public void jogwheelIsNotCarriedAndNoTimingIsSkipped() {
        MixFile.Read r = read("{\"index\":1,\"from\":" + track("One", A) + ",\"to\":" + track("Two", B)
                + ",\"fromStartMs\":1000,\"durationMs\":8000,\"style\":{\"jogwheel\":3}},"
                + "{\"index\":2,\"from\":" + track("Two", B) + ",\"to\":" + track("One", A) + ",\"style\":{}},"
                + "{\"index\":3,\"from\":" + track("One", A) + ",\"to\":" + track("Three", C) + ",\"durationMs\":1,\"style\":{}}");
        assertNull(r.refused);
        assertTrue(r.notes.toString(), r.notes.contains("not carried: jogwheel"));
        assertEquals(Collections.singletonList("mix 2 skipped: its timing is not valid"), r.skipped);
        assertEquals(2, r.mixes.size());
        assertEquals("custom", r.mixes.get(0).override.preset);
        assertEquals("none", r.mixes.get(1).override.preset);
    }
}
