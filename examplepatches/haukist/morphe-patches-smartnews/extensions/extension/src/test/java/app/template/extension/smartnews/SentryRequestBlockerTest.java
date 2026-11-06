package app.template.extension.smartnews;

import org.junit.Test;

import java.util.Locale;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class SentryRequestBlockerTest {
    @Test
    public void blocksSentryDomainsAndSubdomains() {
        for (String host : new String[] {"sentry.io", "o127165.ingest.sentry.io",
                "o127165.ingest.us.sentry.io", "sentry-cdn.com", "js.sentry-cdn.com",
                "browser.sentry-cdn.com", "O127165.INGEST.SENTRY.IO.", "SENTRY-CDN.COM."}) {
            assertTrue(host, SentryRequestBlocker.isBlockedHost(host));
        }
    }

    @Test
    public void leavesPageHostsAndLookalikesAlone() {
        for (String host : new String[] {"mp.smartnews.com", "static.smartnews.com",
                "sentry.io.example.com", "notsentry.io", "my-sentry-cdn.com", "example.com",
                "", "127.0.0.1", "::1"}) {
            assertFalse(host, SentryRequestBlocker.isBlockedHost(host));
        }
        assertFalse(SentryRequestBlocker.isBlockedHost(null));
    }

    @Test
    public void lowercasesIndependentlyOfTheDeviceLocale() {
        Locale previous = Locale.getDefault();
        try {
            Locale.setDefault(new Locale("tr", "TR"));
            assertTrue(SentryRequestBlocker.isBlockedHost("O127165.INGEST.SENTRY.IO"));
        } finally {
            Locale.setDefault(previous);
        }
    }
}
