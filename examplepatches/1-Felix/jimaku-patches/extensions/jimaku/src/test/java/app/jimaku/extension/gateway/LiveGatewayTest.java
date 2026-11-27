package app.jimaku.extension.gateway;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assume.assumeTrue;

import org.junit.Test;

/**
 * Reads the real gateway over TLS, for a run by hand: JIMAKU_LIVE_GATEWAY=1. Uses a Frieren
 * mini-anime episode whose Japanese transcript and English translation are in the shared cache.
 */
public class LiveGatewayTest {
    @Test
    public void readsTheRealGateway() throws Exception {
        assumeTrue("1".equals(System.getenv("JIMAKU_LIVE_GATEWAY")));
        Gateway gateway = new Gateway(new MemoryInstalls());
        Lookup lookup = gateway.lookup("bWCkSOafQNc", new Cancellation());
        assertEquals("ja", lookup.original);
        assertFalse(gateway.document("bWCkSOafQNc", "en", new Cancellation()).isEmpty());
        assertNull(gateway.lookup("aaaaaaaaaaa", new Cancellation()));
    }

    @Test(expected = GatewayException.class)
    public void refusesACertificateForAnotherHost() throws Exception {
        assumeTrue("1".equals(System.getenv("JIMAKU_LIVE_GATEWAY")));
        // wrong.host.badssl.com serves a certificate for *.badssl.com that doesn't name it.
        new Gateway("https://wrong.host.badssl.com", Gateway.userAgent(), 10_000, new MemoryInstalls()).lookup("bWCkSOafQNc", new Cancellation());
    }
}
