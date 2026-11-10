package com.amazonaws.ivs.net;

import org.junit.Test;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

public class MorphedHttpClientTest {
    private static final HttpClient PLAYER_CLIENT = new HttpClient() {
        @Override
        public String description() {
            return "player client";
        }

        @Override
        public void execute(Request request, ResponseCallback responseCallback) {
        }

        @Override
        public void release() {
        }
    };

    @Test
    public void wrapsThePlayersClient() {
        HttpClient wrapped = MorphedHttpClient.wrap(PLAYER_CLIENT, () -> {
        });

        assertTrue(wrapped instanceof MorphedHttpClient);
        assertSame("player client", wrapped.description());
        // Never wrapped twice.
        assertSame(wrapped, MorphedHttpClient.wrap(wrapped, () -> {
        }));
    }

    @Test
    public void failedSetupKeepsThePlayersOwnClient() {
        HttpClient result = MorphedHttpClient.wrap(PLAYER_CLIENT, () -> {
            throw new ExceptionInInitializerError("ad blocker setup broke");
        });

        // Video still plays, just without the ad blocker (and the user is told).
        assertSame(PLAYER_CLIENT, result);
    }

    @Test
    public void noClientStaysNoClient() {
        assertNull(MorphedHttpClient.wrap(null, () -> {
        }));
    }
}
