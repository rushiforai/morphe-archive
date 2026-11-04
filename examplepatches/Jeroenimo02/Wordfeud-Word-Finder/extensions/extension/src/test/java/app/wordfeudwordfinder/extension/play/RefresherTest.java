package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Test;

public class RefresherTest {
    static final class FakeEnv implements Refresher.Env {
        final RefreshStrategiesTest.FakeMessenger messenger = new RefreshStrategiesTest.FakeMessenger();
        String debug;
        final List<String> log = new ArrayList<>();
        Refresher.DebugLog seenLog = null;
        RefreshDiagnostic diag;

        @Override
        public Refresher.Messenger messenger(Refresher.DebugLog l, RefreshDiagnostic d) {
            diag = d;
            seenLog = l;
            return messenger;
        }

        @Override
        public String debugOrder() {
            return debug;
        }

        @Override
        public void debugLog(String line) {
            log.add(line);
        }
    }

    @After
    public void reset() {
        Refresher.install(null);
        RefreshDiagnostic.clearLast();
    }

    @Test
    public void diagnosticWhenNothingCouldBeSent() {
        FakeEnv env = new FakeEnv();
        env.messenger.available = false;
        Refresher.install(env);
        Refresher.refresh(4391L);
        assertEquals("LifecycleBounce: not possible", RefreshDiagnostic.last()); // full line for Copy details
    }

    @Test
    public void scheduledSequenceIsFinishedByTheMessenger() {
        FakeEnv env = new FakeEnv();
        Refresher.install(env);
        Refresher.refresh(4391L);
        assertNull(RefreshDiagnostic.last()); // still running: the bridge finishes it after the last message
        String ch = LifecycleBounce.CHANNEL;
        env.diag.expect(6);
        env.diag.step("jni=captured, dispatchPlatformMessage via getMethod");
        for (int i = 0; i < 6; i++) env.diag.sent("jni", RefreshDiagnostic.message("dispatch", ch, 26) + " OK");
        env.diag.finish();
        env.diag.finish(); // once only
        assertTrue(RefreshDiagnostic.last().startsWith("LifecycleBounce: jni=captured, dispatchPlatformMessage via"
                + " getMethod | dispatch(" + ch + ",26B) OK | "));
    }

    @Test
    public void diagnosticRecordsFailuresPerStrategy() {
        RefreshDiagnostic d = new RefreshDiagnostic(null);
        List<Refresher.Strategy> order = Arrays.asList(
                new Refresher.Strategy() {
                    public boolean refresh(long id) { throw new IllegalStateException("x"); }
                    public String name() { return "A"; }
                },
                new Refresher.Strategy() {
                    public boolean refresh(long id) { return false; }
                    public String name() { return "B"; }
                });
        assertFalse(Refresher.run(order, 9L, null, d));
        assertEquals("A: failed IllegalStateException || B: not possible", d.text());
    }

    @Test
    public void defaultOrderIsLifecycleBounceOnly() {
        assertEquals(Arrays.asList(LifecycleBounce.NAME), Refresher.ORDER); // V4 testbuild 5
        Refresher.refresh(42L); // no environment: never throws
        FakeEnv env = new FakeEnv();
        Refresher.install(env);
        Refresher.refresh(42L);
        assertEquals(6, env.messenger.sent.size()); // inactive … paused … resumed
        assertEquals(LifecycleBounce.CHANNEL, env.messenger.sent.get(0).channel);
        assertTrue(env.log.isEmpty()); // release: no logging at all
        assertEquals(null, env.seenLog);
    }

    @Test
    public void emptyOrderIsTheFallback() {
        assertFalse(Refresher.run(new ArrayList<>(), 42L, null));
        FakeEnv env = new FakeEnv();
        env.debug = "# no strategies"; // injected empty order (the debug file replaces ORDER)
        Refresher.install(env);
        Refresher.refresh(42L);
        assertTrue(env.messenger.sent.isEmpty()); // nothing happens; Wordfeud refreshes itself
    }

    @Test
    public void debugFileOverridesTheOrderAndLogsOnlyNames() {
        FakeEnv env = new FakeEnv();
        env.debug = "RouteBounce\nForegroundSignal";
        Refresher.install(env);
        Refresher.refresh(4391L);
        assertEquals(2, env.messenger.sent.size()); // RouteBounce worked, so ForegroundSignal did not run
        assertEquals("flutter/navigation", env.messenger.sent.get(0).channel);
        assertTrue(env.seenLog != null);
        String all = String.join("\n", env.log);
        assertTrue(all, all.contains("strategy RouteBounce: start"));
        assertFalse(all, all.contains("4391")); // no game ids or message contents in the log
    }

    @Test
    public void debugFallsThroughWhenNoEngine() {
        FakeEnv env = new FakeEnv();
        env.debug = "FcmNudge,RouteBounce";
        env.messenger.available = false;
        Refresher.install(env);
        Refresher.refresh(1L);
        assertTrue(env.messenger.sent.isEmpty());
        String all = String.join("\n", env.log);
        assertTrue(all, all.contains("FcmNudge") && all.contains("RouteBounce"));
    }

    @Test
    public void runsInOrderUntilOneWorksAndSwallowsFailures() {
        List<String> calls = new ArrayList<>();
        List<Refresher.Strategy> order = Arrays.asList(
                id -> { calls.add("a" + id); throw new IllegalStateException("boom"); },
                id -> { calls.add("b" + id); return false; },
                id -> { calls.add("c" + id); return true; },
                id -> { calls.add("d" + id); return true; });
        assertTrue(Refresher.run(order, 7L, null));
        List<String> log = new ArrayList<>();
        Refresher.run(Arrays.asList(new RouteBounce(new RefreshStrategiesTest.FakeMessenger())), 7L, log::add);
        assertEquals("strategy RouteBounce: start", log.get(0)); // the NAME constant, not a (minifiable) class name
        assertEquals(Arrays.asList("a7", "b7", "c7"), calls);
    }
}
