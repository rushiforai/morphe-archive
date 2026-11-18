package io.github.sabopura.morphe.extension.twitch.points;

import java.util.*;
import org.junit.Test;
import static org.junit.Assert.*;

public class ClaimDispatcherTest {
    private static final class State {
        final String id, status;
        State(String id, String status) { this.id = id; this.status = status; }
    }
    private static final class Fixture implements ClaimDispatcher.Access {
        final List<Runnable> queue = new ArrayList<>();
        final List<String> submissions = new ArrayList<>();
        final Object presenter = new Object();
        long now;
        int errors, claims;
        boolean fail, reenter;
        final ClaimDispatcher dispatcher = new ClaimDispatcher(this, queue::add, () -> now, failure -> errors++);
        public boolean enabled(Object value) { return value instanceof State; }
        public Object claim(Object value) { return ((State) value).id; }
        public String status(Object value) { return ((State) value).status; }
        public String id(Object value) { return (String) value; }
        public void submit(Object provider, String id) {
            if (fail) throw new IllegalStateException("synthetic error");
            submissions.add(id);
            if (reenter) dispatcher.update(new State(id, null), provider);
        }
        public void claimed() { claims++; }
        void run() { queue.remove(0).run(); }
    }
    @Test public void latestStateWinsWithoutSynchronousReentry() {
        Fixture f = new Fixture();
        f.dispatcher.update(new State("old", null), f.presenter);
        f.dispatcher.update(new State("new", null), f.presenter);
        assertEquals(1, f.queue.size());
        assertTrue(f.submissions.isEmpty());
        f.reenter = true;
        f.run(); f.run();
        assertEquals(Collections.singletonList("new"), f.submissions);
    }
    @Test public void logoutBanOrDisabledStateCancelsQueuedWork() {
        Fixture f = new Fixture();
        f.dispatcher.update(new State("a", null), f.presenter);
        f.dispatcher.update(new Object(), f.presenter);
        f.run();
        assertTrue(f.submissions.isEmpty());
        f.dispatcher.update(new State("a", null), f.presenter);
        f.run();
        assertEquals(Collections.singletonList("a"), f.submissions);
    }
    @Test public void failedSubmissionsAreBoundedWithoutCrashingTheStateRenderer() {
        Fixture f = new Fixture(); f.fail = true;
        for (int i = 0; i < 5; i++) {
            f.now = i * 30000L;
            f.dispatcher.update(new State("a", null), f.presenter);
            f.run();
        }
        assertEquals(3, f.errors);
    }
    @Test public void aClaimCountsOnceWhenItSucceedsHoweverManyAttemptsItTook() {
        Fixture f = new Fixture();
        for (int i = 0; i < 3; i++) {
            f.now = i * 30000L;
            f.dispatcher.update(new State("a", "UNKNOWN"), f.presenter); f.run();
        }
        assertEquals(3, f.submissions.size());
        assertEquals(0, f.claims);
        f.dispatcher.update(new State("a", "SUCCESS"), f.presenter); f.run();
        f.dispatcher.update(new State(null, "SUCCESS"), f.presenter); f.run();
        assertEquals(1, f.claims);
        f.dispatcher.update(new State("b", "UNKNOWN"), f.presenter); f.run();
        f.dispatcher.update(new State(null, "SUCCESS"), f.presenter); f.run();
        assertEquals(2, f.claims);
    }
    @Test public void failedClaimsAndOthersSuccessesAreNotCounted() {
        Fixture f = new Fixture();
        f.dispatcher.update(new State("a", "SUCCESS"), f.presenter); f.run();
        f.fail = true;
        f.dispatcher.update(new State("b", null), f.presenter); f.run();
        f.dispatcher.update(new State("b", "SUCCESS"), f.presenter); f.run();
        assertEquals(0, f.claims);
    }
    @Test public void ignoresAbsentAndCompletedClaimsAcrossPresenters() {
        Fixture f = new Fixture();
        for (State s : Arrays.asList(new State(null, null), new State("done", "SUCCESS"))) {
            f.dispatcher.update(s, f.presenter); f.run();
        }
        f.dispatcher.update(new State("a", null), f.presenter); f.run();
        Object second = new Object();
        f.dispatcher.update(new State("a", null), second); f.run();
        assertEquals(Collections.singletonList("a"), f.submissions);
    }
}
