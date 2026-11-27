package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

/** The sp_dc value read from Spotify's cookie header (canvas.md §4 rule 0); test values only. */
public class SpotifySessionTest {
    @Test
    public void readsTheSessionCookieAmongOthers() {
        assertEquals("TESTVALUE123", SpotifySession.spDc("sp_t=abc; sp_dc=TESTVALUE123; sp_landing=x"));
        assertEquals("TESTVALUE123", SpotifySession.spDc("sp_dc=TESTVALUE123"));
    }

    @Test
    public void noSessionWithoutIt() {
        assertNull(SpotifySession.spDc(null));
        assertNull(SpotifySession.spDc("sp_t=abc; sp_key=1"));
        assertNull(SpotifySession.spDc("sp_dc=; sp_t=abc"));
        assertNull(SpotifySession.spDc("xsp_dc=1"));
    }
}
