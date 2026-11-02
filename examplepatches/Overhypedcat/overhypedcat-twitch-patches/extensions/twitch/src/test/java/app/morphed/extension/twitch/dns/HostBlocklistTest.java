package app.morphed.extension.twitch.dns;

import org.junit.Test;

import java.net.UnknownHostException;

import app.morphed.extension.twitch.patches.TwitchDns;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

public class HostBlocklistTest {
    @Test
    public void blocksTwitchAdAndTrackingServers() {
        assertTrue(HostBlocklist.isBlocked("edge.ads.twitch.tv"));
        assertTrue(HostBlocklist.isBlocked("spade.twitch.tv"));
        assertTrue(HostBlocklist.isBlocked("player.stats.live-video.net"));
        assertTrue(HostBlocklist.isBlocked("sb.scorecardresearch.com"));
        assertTrue(HostBlocklist.isBlocked("Pubads.G.DoubleClick.net."));
    }

    @Test
    public void tellsAdServersFromTrackers() {
        assertTrue(HostBlocklist.isAdServer("edge.ads.twitch.tv"));
        assertTrue(HostBlocklist.isAdServer("aax.amazon-adsystem.com"));
        assertFalse(HostBlocklist.isAdServer("spade.twitch.tv"));
        assertFalse(HostBlocklist.isAdServer("player.stats.live-video.net"));
    }

    @Test
    public void leavesTwitchItselfAlone() {
        assertFalse(HostBlocklist.isBlocked("gql.twitch.tv"));
        assertFalse(HostBlocklist.isBlocked("usher.ttvnw.net"));
        assertFalse(HostBlocklist.isBlocked("euc11.playlist.ttvnw.net"));
        assertFalse(HostBlocklist.isBlocked("8a2de3.rufio.hls.live-video.net"));
        assertFalse(HostBlocklist.isBlocked("static-cdn.jtvnw.net"));
        assertFalse(HostBlocklist.isBlocked("irc-ws.chat.twitch.tv"));
        assertFalse(HostBlocklist.isBlocked("api2.branch.io"));
        assertFalse(HostBlocklist.isBlocked("downloads.twitch.tv"));
    }

    @Test
    public void blockedServerIsRefusedAndOthersAreLookedUpNormally() throws Exception {
        for (String host : new String[]{"edge.ads.twitch.tv", "spade.twitch.tv"}) {
            try {
                TwitchDns.getAllByName(host);
                fail(host);
            } catch (UnknownHostException expected) {
                assertTrue(expected.getMessage().contains("Blocked"));
            }
        }
        // An IP literal needs no network, so this checks the normal path without depending on DNS.
        assertEquals("10.0.0.1", TwitchDns.getAllByName("10.0.0.1")[0].getHostAddress());
    }
}
