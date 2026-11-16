package app.morphed.extension.twitch.vpn;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.util.Base64;

/** Reading VPN providers' configs: in any case, with errors that say what's wrong and where. */
public class WgConfigTest {
    private static final String KEY = Base64.getEncoder().encodeToString(new byte[32]);

    private static String config(String endpoint, String publicKey) {
        return "[Interface]\nPrivateKey = " + KEY + "\nAddress = 10.2.0.2/32\nDNS = 10.2.0.1\n"
                + "[Peer]\nPublicKey = " + publicKey + "\nEndpoint = " + endpoint + "\n";
    }

    private static String refusal(String text) {
        try {
            WgConfig.parse("NL-1", text);
        } catch (IllegalArgumentException expected) {
            return expected.getMessage();
        }
        fail("accepted: " + text);
        return null;
    }

    @Test
    public void readsAConfig() {
        WgConfig config = WgConfig.parse("NL-1", config("nl.example.net:51821", KEY));
        assertEquals("nl.example.net", config.endpointHost);
        assertEquals(51821, config.endpointPort);
        assertEquals(10, config.address[0]);
        assertEquals(1420, config.mtu);
    }

    @Test
    public void sectionsAndKeysInAnyCase() {
        String lower = "[interface]\nprivatekey = " + KEY + "\naddress = 10.2.0.2/32\n"
                + "[peer]\npublickey = " + KEY + "\nendpoint = 1.2.3.4:51820\n";
        assertTrue(WgConfig.looksLikeWireGuard(lower));
        assertEquals("1.2.3.4", WgConfig.parse("x", lower).endpointHost);
    }

    @Test
    public void aBadPortIsSaidPlainly() {
        assertEquals("NL-1: Endpoint's port isn't a number from 1 to 65535", refusal(config("1.2.3.4:abc", KEY)));
        assertEquals("NL-1: Endpoint's port isn't a number from 1 to 65535", refusal(config("1.2.3.4:70000", KEY)));
        assertEquals("NL-1: Endpoint has no port", refusal(config("1.2.3.4", KEY)));
    }

    @Test
    public void keyErrorsNameTheServerAndSayWhy() {
        assertEquals("NL-1: PublicKey isn't a valid key (not Base64)", refusal(config("1.2.3.4:51820", "not*base64")));
        String short16 = Base64.getEncoder().encodeToString(new byte[16]);
        assertEquals("NL-1: PublicKey isn't a valid key (16 bytes, a key has 32)",
                refusal(config("1.2.3.4:51820", short16)));
    }

    @Test
    public void whatIsntAConfigIsRefused() {
        assertEquals("NL-1 isn't a WireGuard config", refusal("just some notes"));
    }
}
