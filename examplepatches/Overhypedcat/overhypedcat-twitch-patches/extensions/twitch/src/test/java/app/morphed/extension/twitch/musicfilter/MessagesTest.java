package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

import app.morphed.extension.twitch.Messages;

/** Failures in words for the screen: no class names, no addresses, nothing garbled. */
public class MessagesTest {
    @Test
    public void noInternetIsSaidPlainly() {
        // Android's message is a whole sentence of its own
        assertEquals("no internet connection", Reasons.of(new UnknownHostException(
                "Unable to resolve host \"amp.shazam.com\": No address associated with hostname")));
        assertEquals("no answer in time", Reasons.of(new SocketTimeoutException("Read timed out")));
    }

    @Test
    public void reasonsDropAddressesAndCutLongTexts() {
        assertEquals("refused by", Reasons.of(new RuntimeException("refused by https://example.com/x?y=1")));
        StringBuilder longText = new StringBuilder();
        for (int i = 0; i < 50; i++) longText.append("word ");
        assertEquals(160, Reasons.of(new RuntimeException(longText.toString())).length());
    }

    @Test
    public void aFailureWithoutWordsSaysItWasUnexpected() {
        assertEquals("an unexpected error (NullPointerException)", Messages.of(new NullPointerException()));
        assertEquals("an unexpected error (IllegalStateException)", Reasons.of(new IllegalStateException(" ")));
        assertEquals("the file is gone", Messages.of(new java.io.IOException("the file is gone")));
    }

    @Test
    public void statusCodesAreExplained() {
        assertTrue(Reasons.status(429).contains("too many requests"));
        assertEquals("answered 418", Reasons.status(418));
    }

    @Test
    public void waitsAreWordedSoTheyStayTrue() {
        assertEquals("in a few seconds", Tracker.in(5));
        assertEquals("in about a minute", Tracker.in(60));
        assertEquals("in about 3 minutes", Tracker.in(170));
    }
}
