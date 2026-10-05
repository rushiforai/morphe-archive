package dev.twitchpatches.extension.ads;

import org.junit.Test;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import static org.junit.Assert.*;

public final class TokenResultTest {
    @Test public void acceptedCallbackWinsOnceAndRejectsLaterResults() throws Exception {
        List<Boolean> outcomes = new ArrayList<>();
        TokenResult result = new TokenResult(outcomes::add);
        result.receive("synthetic-signature", "synthetic-token");
        result.fail();
        result.receive("late-signature", "late-token");
        assertEquals(1, outcomes.size());
        assertTrue(outcomes.get(0));
        assertEquals("synthetic-token", result.await(10).value);
    }

    @Test public void emptyRefusedTokenIsNotAccepted() throws Exception {
        List<Boolean> outcomes = new ArrayList<>();
        TokenResult result = new TokenResult(outcomes::add);
        result.receive("", "");
        assertNull(result.await(10));
        assertEquals(java.util.Collections.singletonList(false), outcomes);
    }

    @Test public void timeoutCancelsLateCallback() throws Exception {
        List<Boolean> outcomes = new ArrayList<>();
        TokenResult result = new TokenResult(outcomes::add);
        assertNull(result.await(1));
        result.receive("late-signature", "late-token");
        assertTrue(outcomes.isEmpty());
        assertNull(result.await(1));
    }

    @Test public void cancellationWakesWorkerAndDropsLaterToken() throws Exception {
        TokenResult result = new TokenResult(ignored -> { });
        AtomicReference<TokenResult.Token> returned = new AtomicReference<>();
        Thread worker = new Thread(() -> {
            try { returned.set(result.await(10000)); }
            catch (InterruptedException exception) { Thread.currentThread().interrupt(); }
        });
        worker.start();
        result.cancel();
        worker.join(1000);
        assertFalse(worker.isAlive());
        assertNull(returned.get());
        result.receive("late-signature", "late-token");
        assertNull(result.await(1));
    }

    @Test public void inactiveSessionDropsEvenAnAlreadyCompletedToken() throws Exception {
        TokenResult result = new TokenResult(ignored -> { });
        result.receive("synthetic-signature", "synthetic-token");
        assertNull(result.await(10000, () -> false));
    }
}
