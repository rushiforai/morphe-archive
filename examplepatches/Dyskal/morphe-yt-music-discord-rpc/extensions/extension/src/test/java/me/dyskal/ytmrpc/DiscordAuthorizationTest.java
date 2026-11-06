package me.dyskal.ytmrpc;

import org.json.JSONObject;
import org.junit.Test;

import static org.junit.Assert.*;

public class DiscordAuthorizationTest {
    private static final String APP = "1559278040175878146";

    @Test public void duplicateTapsDoNotReplaceThePendingAttempt() throws Exception {
        DiscordAuthorization auth = new DiscordAuthorization();
        DiscordAuthorization.Attempt first = auth.begin(APP, 1000, 42);
        assertNull(auth.begin(APP, 1001, 99));
        assertEquals(42, first.returnTaskId);
        assertSame(first, auth.claim(first.state, 1002));
        assertThrows(DiscordFailure.class, () -> auth.claim(first.state, 1003));
    }

    @Test public void cancellationRejectsAnAlreadyClaimedNetworkResult() throws Exception {
        DiscordAuthorization auth = new DiscordAuthorization();
        DiscordAuthorization.Attempt attempt = auth.begin(APP, 1000, 42);
        auth.claim(attempt.state, 1001);
        assertSame(attempt, auth.cancel());
        assertFalse(auth.isCurrent(attempt)); assertFalse(auth.finish(attempt));
        DiscordAuthorization.Attempt next = auth.begin(APP, 1002, 99);
        assertTrue(auth.isCurrent(next)); assertFalse(auth.finish(attempt));
    }

    @Test public void stateMismatchDoesNotConsumeTheLegitimateAttempt() throws Exception {
        DiscordAuthorization auth = new DiscordAuthorization();
        DiscordAuthorization.Attempt attempt = auth.begin(APP, 1000, 42);
        assertThrows(DiscordFailure.class, () -> auth.claim("wrong-state", 1001));
        assertSame(attempt, auth.claim(attempt.state, 1002));
    }

    @Test public void pendingStateRoundTripsWithoutReplacingSavedCredentials() throws Exception {
        DiscordAuthorization auth = new DiscordAuthorization();
        DiscordAuthorization.Attempt attempt = auth.begin(APP, 1000, 42);
        JSONObject saved = new JSONObject().put("access_token", "existing-grant").put("pending", attempt.toJson());
        assertEquals("existing-grant", saved.getString("access_token"));
        DiscordAuthorization restored = new DiscordAuthorization();
        DiscordAuthorization.Attempt next = restored.restore(saved.getJSONObject("pending"), 1001);
        assertNotNull(next); assertEquals(attempt.state, next.state); assertEquals(attempt.verifier, next.verifier);
        assertEquals(42, next.returnTaskId);
        assertSame(next, restored.claim(attempt.state, 1002));
    }

    @Test public void expiredAttemptsAreNotRestoredOrAccepted() throws Exception {
        DiscordAuthorization auth = new DiscordAuthorization();
        DiscordAuthorization.Attempt attempt = auth.begin(APP, 1000, 42);
        long expired = 1000 + DiscordAuthorization.TIMEOUT_MILLIS;
        assertThrows(DiscordFailure.class, () -> auth.claim(attempt.state, expired));
        assertNull(new DiscordAuthorization().restore(attempt.toJson(), expired));
    }

    @Test public void finishedCallbackCannotClaimOrConsumeANewPendingAttempt() throws Exception {
        DiscordAuthorization auth = new DiscordAuthorization();
        DiscordAuthorization.Attempt first = auth.begin(APP, 1000, 42);
        assertSame(first, auth.claim(first.state, 1001)); assertTrue(auth.finish(first));
        assertThrows(DiscordFailure.class, () -> auth.claim(first.state, 1002));
        DiscordAuthorization.Attempt next = auth.begin(APP, 1003, 99);
        assertThrows(DiscordFailure.class, () -> auth.claim(first.state, 1004));
        assertTrue(auth.isCurrent(next)); assertSame(next, auth.claim(next.state, 1005));
        assertEquals(99, next.returnTaskId);
    }

    @Test public void missingTaskStillAllowsAValidCallbackAfterProcessDeath() throws Exception {
        DiscordAuthorization auth = new DiscordAuthorization();
        DiscordAuthorization.Attempt attempt = auth.begin(APP, 1000, -1);
        JSONObject pending = attempt.toJson(); pending.remove("return_task_id");
        DiscordAuthorization restored = new DiscordAuthorization();
        DiscordAuthorization.Attempt next = restored.restore(pending, 1001);
        assertEquals(-1, next.returnTaskId);
        assertSame(next, restored.claim(attempt.state, 1002));
    }
}
