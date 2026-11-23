package nl.johninnl.eclipse.auto.tree;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Random;
import org.junit.Test;

public class MediaIdsTest {
    private static final String[] AWKWARD = {
        "plain", "with/slash", "double::colon", "a:b", "100%", "%2F", "space and tab\t", "q?x=1&y=2#frag", "café über",
        "日本語", "pl.00000000000000000000000000000001", "a/b::c/d::", "", "eclipse:home", "[root]", "~-._ok",
    };

    @Test public void everyBuilderRoundTripsThroughParseEvenWithSlashesAndDoubleColons() {
        for (String key : AWKWARD) {
            MediaIds.Parsed collection = MediaIds.parse(MediaIds.collection("album", key));
            assertEquals(MediaIds.Kind.COLLECTION, collection.kind);
            assertEquals("album", collection.a);
            assertEquals(key, collection.b);
            assertEquals(key, MediaIds.parse(MediaIds.row(key)).a);
            assertEquals(MediaIds.Kind.ROW, MediaIds.parse(MediaIds.row(key)).kind);
            assertEquals(MediaIds.Kind.SECTION, MediaIds.parse(MediaIds.section(key)).kind);
            assertEquals(key, MediaIds.parse(MediaIds.live(key)).a);
            assertEquals(key, MediaIds.parse(MediaIds.retry(key)).a);
            assertEquals(key, MediaIds.parse(MediaIds.notice(key)).a);
            MediaIds.Parsed track = MediaIds.parse(MediaIds.track(MediaIds.collection("playlist", key), 41));
            assertEquals(MediaIds.Kind.TRACK, track.kind);
            assertEquals("the parent id is the whole collection id", MediaIds.collection("playlist", key), track.a);
            assertEquals(41, track.index);
            MediaIds.Parsed more = MediaIds.parse(MediaIds.more(key, 7));
            assertEquals(MediaIds.Kind.MORE, more.kind);
            assertEquals(key, more.a);
            assertEquals(7, more.index);
        }
    }

    @Test public void aParentThatIsItselfAnIdWithSlashesAndColonsSurvivesNestedEncoding() {
        String parent = MediaIds.collection("editorial", "pl.a/b::c");
        MediaIds.Parsed nested = MediaIds.parse(MediaIds.more(MediaIds.track(parent, 3), 12));
        assertEquals(MediaIds.track(parent, 3), nested.a);
        assertEquals(parent, MediaIds.parse(nested.a).a);
    }

    @Test public void queueAndFixedIdsParse() {
        assertEquals(MediaIds.Kind.UP_NEXT, MediaIds.parse(MediaIds.upNext(0)).kind);
        assertEquals(3, MediaIds.parse(MediaIds.upNext(3)).index);
        assertEquals(MediaIds.Kind.CONTEXT, MediaIds.parse(MediaIds.context(120)).kind);
        assertEquals(120, MediaIds.parse(MediaIds.context(120)).index);
        assertEquals(MediaIds.Kind.HOME, MediaIds.parse(MediaIds.HOME).kind);
        assertEquals(MediaIds.Kind.DISCOVER, MediaIds.parse(MediaIds.DISCOVER).kind);
        assertEquals(MediaIds.Kind.QUEUE, MediaIds.parse(MediaIds.QUEUE).kind);
        assertEquals("the Umbra DJ card is a playable id of ours", MediaIds.Kind.DJ, MediaIds.parse(MediaIds.DJ).kind);
        assertTrue(MediaIds.handles(MediaIds.DJ));
        assertEquals(MediaIds.Kind.ROOT, MediaIds.parse("[root]").kind);
        assertEquals(MediaIds.Kind.LIBRARY, MediaIds.parse("[library]").kind);
        assertEquals(MediaIds.Kind.RADIO, MediaIds.parse("[radio]").kind);
    }

    @Test public void theAppsOwnIdsAreNeverOurs() {
        for (String shipped : new String[] {"playlist::abc", "favorites::1", "libalbum::Zm9v", "radio::s1", "queue::9",
            "[home]", "[queue]", "[lib_songs]", "radiocat::GENRE", "androidx.media3.session.recent.root", "library::1"}) {
            assertEquals(shipped, MediaIds.Kind.SHIPPED, MediaIds.parse(shipped).kind);
            assertFalse(shipped, MediaIds.isOurs(shipped));
            assertFalse(shipped, MediaIds.handles(shipped));
        }
        assertEquals(MediaIds.Kind.SHIPPED, MediaIds.parse(null).kind);
        assertTrue(MediaIds.handles("[root]") && MediaIds.handles("[library]") && MediaIds.handles("[radio]"));
        assertTrue(MediaIds.handles("eclipse:anything"));
        assertFalse(MediaIds.handles(null));
    }

    @Test public void malformedOrUnknownIdsOfOursAreUnknownAndNeverThrow() {
        for (String broken : new String[] {"eclipse:", "eclipse:x", "eclipse:t", "eclipse:t/abc", "eclipse:t/abc/xyz", "eclipse:t/%ZZ/1",
            "eclipse:t/%2/1", "eclipse:t/abc/-1", "eclipse:t/abc/1/extra", "eclipse:q/x/1", "eclipse:q/u/-1", "eclipse:q/u", "eclipse:c/a",
            "eclipse:c/a/b/c", "eclipse:c//", "eclipse:more/abc", "eclipse:h", "eclipse:h/a/b", "eclipse:live", "eclipse:t/ab c/1",
            "eclipse:t/é/1", "eclipse:q/c/99999999999", "eclipse:home/extra", "eclipse:HOME"}) {
            MediaIds.Parsed parsed = MediaIds.parse(broken);
            // "eclipse:c//" is two empty segments: well formed, with an empty type and key; every other one is unknown.
            if (broken.equals("eclipse:c//")) assertEquals(MediaIds.Kind.COLLECTION, parsed.kind);
            else assertEquals(broken, MediaIds.Kind.UNKNOWN, parsed.kind);
        }
    }

    @Test public void encodingKeepsOnlyUnreservedCharactersAndRoundTripsRandomText() {
        Random random = new Random(7);
        for (int round = 0; round < 500; round++) {
            StringBuilder text = new StringBuilder();
            int length = random.nextInt(24);
            for (int i = 0; i < length; i++) text.append((char) (random.nextInt(0x2fff) + (random.nextBoolean() ? 0 : 0x20)));
            String original = text.toString();
            // Unpaired surrogates are not valid text; restrict to what UTF-8 can carry.
            if (!java.nio.charset.StandardCharsets.UTF_8.newEncoder().canEncode(original)) continue;
            String encoded = MediaIds.encode(original);
            assertTrue(encoded, encoded.matches("[A-Za-z0-9._~%-]*"));
            assertEquals(original, MediaIds.decode(encoded));
        }
    }

    @Test public void noIdLeaksTheStructureOfItsKeyOrLooksLikeAUrl() {
        String id = MediaIds.collection("playlist", "https://host/path?token=abc::def");
        assertFalse(id.contains("::"));
        assertFalse(id.contains("?"));
        assertFalse(id.contains("="));
        assertTrue(id.startsWith("eclipse:c/playlist/"));
        assertEquals(3, id.substring(MediaIds.PREFIX.length()).split("/").length);
    }

    @Test public void decodeRejectsWhatEncodeNeverMakes() {
        for (String bad : new String[] {"%", "%4", "%GG", "a b", "a/b", "café"}) {
            try {
                MediaIds.decode(bad);
                throw new AssertionError("decode accepted " + bad);
            } catch (IllegalArgumentException expected) {
                assertNull(null);
            }
        }
    }
}
