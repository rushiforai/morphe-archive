package app.template.extension.hevalcontrols;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class HevalSettingsTest {
    /** on.default (on), off.default (off), needs.on (needs on.default), patch.time (build time), late (restart). */
    private static final String REGISTRY = "hevalcontrols-registry:1\n"
            + "on.default\tOn by default\t\tA\t1\t0\t0\t\n"
            + "off.default\tOff by default\t\tA\t0\t0\t0\t\n"
            + "needs.on\tNeeds on.default\t\tB\t1\t0\t0\ton.default\n"
            + "needs.missing\tNeeds a missing feature\t\tB\t1\t0\t0\tnot.patched\n"
            + "patch.time\tPatch time\t\tC\t1\t0\t1\t\n"
            + "late\tRestart required\t\tC\t1\t1\t0\t\n"
            + "cycle.a\tCycle A\t\tD\t1\t0\t0\tcycle.b\n"
            + "cycle.b\tCycle B\t\tD\t1\t0\t0\tcycle.a\n";

    private FakeStore store;

    @Before
    public void setUp() {
        HevalSettings.resetForTests();
        Registry.install(REGISTRY);
        store = new FakeStore();
    }

    @After
    public void tearDown() {
        HevalSettings.resetForTests();
        CrashGuard.resetForTests();
        Registry.install(null);
    }

    @Test
    public void beforeInitTheRegisteredDefaultApplies() {
        // No context off Android, so the lazy init finds nothing and answers the default.
        assertFalse(HevalSettings.isReady());
        assertTrue(HevalSettings.isEnabled("on.default"));
        assertFalse(HevalSettings.isEnabled("off.default"));
        assertFalse(HevalSettings.isEnabled("unknown.feature"));
        assertFalse(HevalSettings.isReady());
    }

    @Test
    public void defaultsApplyWithAnEmptyStore() {
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.isReady());
        assertEquals("test", HevalSettings.initSource());
        assertTrue(HevalSettings.isEnabled("on.default"));
        assertFalse(HevalSettings.isEnabled("off.default"));
        assertTrue(HevalSettings.isEnabled("late"));
    }

    @Test
    public void toggleIsPersistedAndAppliesAtOnce() {
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.setEnabled("on.default", false));
        assertEquals(Boolean.FALSE, store.values.get("f.on.default"));
        assertFalse(HevalSettings.isEnabled("on.default"));
        assertFalse(HevalSettings.isChosen("on.default"));

        assertTrue(HevalSettings.setEnabled("off.default", true));
        assertEquals(Boolean.TRUE, store.values.get("f.off.default"));
        assertTrue(HevalSettings.isEnabled("off.default"));

        // A new process reads the same store.
        HevalSettings.resetForTests();
        HevalSettings.initForTests(store);
        assertFalse(HevalSettings.isEnabled("on.default"));
        assertTrue(HevalSettings.isEnabled("off.default"));
    }

    @Test
    public void globalPauseForcesStockButKeepsChoices() {
        HevalSettings.initForTests(store);
        HevalSettings.setEnabled("off.default", true);
        assertTrue(HevalSettings.setPaused(true));
        assertTrue(HevalSettings.isPaused());
        for (Feature feature : Registry.get().features()) {
            assertFalse(feature.id, HevalSettings.isEnabled(feature.id));
        }
        assertTrue(HevalSettings.isChosen("off.default"));
        assertEquals(HevalSettings.State.DISABLED, HevalSettings.stateOf(Registry.get().feature("on.default")));

        HevalSettings.setPaused(false);
        assertTrue(HevalSettings.isEnabled("off.default"));
        assertTrue(HevalSettings.isEnabled("on.default"));
    }

    @Test
    public void safeModeForcesStock() {
        store.values.put("_safe_mode", true);
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.isSafeMode());
        assertFalse(HevalSettings.isEnabled("on.default"));
        assertFalse(HevalSettings.isEnabled("patch.time"));

        HevalSettings.setSafeMode(false);
        assertTrue(HevalSettings.isEnabled("on.default"));
    }

    @Test
    public void unreadableStoreFailsOpenToStock() {
        store.failReads = true;
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.isEngineFailed());
        assertTrue(HevalSettings.engineError().startsWith("java.lang.ClassCastException"));
        // Stock, not the default: a broken engine must never force a modification.
        assertFalse(HevalSettings.isEnabled("on.default"));

        // The store recovers and reports a change: the engine recovers too.
        store.failReads = false;
        store.externalWrite("f.off.default", true);
        assertFalse(HevalSettings.isEngineFailed());
        assertTrue(HevalSettings.isEnabled("on.default"));
        assertTrue(HevalSettings.isEnabled("off.default"));
    }

    @Test
    public void failedWritesReturnFalseAndNeverThrow() {
        HevalSettings.initForTests(store);
        store.failCommits = true;
        assertFalse(HevalSettings.setEnabled("on.default", false));
        assertTrue(HevalSettings.isEnabled("on.default"));
        store.failCommits = false;
        store.refuseCommits = true;
        assertFalse(HevalSettings.setPaused(true));
        assertFalse(HevalSettings.isPaused());
    }

    @Test
    public void writesBeforeInitAreRefused() {
        assertFalse(HevalSettings.setEnabled("on.default", false));
        assertFalse(HevalSettings.setPaused(true));
        assertFalse(HevalSettings.resetAll());
    }

    @Test
    public void wrongValueTypesFallBackToTheDefault() {
        store.values.put("f.on.default", "yes");
        store.values.put("f.off.default", 1);
        store.values.put("_paused", "true");
        HevalSettings.initForTests(store);
        assertFalse(HevalSettings.isEngineFailed());
        assertFalse(HevalSettings.isPaused());
        assertTrue(HevalSettings.isEnabled("on.default"));
        assertFalse(HevalSettings.isEnabled("off.default"));
    }

    @Test
    public void unknownIdsAreIgnoredSafely() {
        store.values.put("f.removed.feature", true);
        store.values.put("something.else", 42);
        HevalSettings.initForTests(store);
        assertFalse(HevalSettings.isEnabled("removed.feature"));
        assertFalse(HevalSettings.isEnabled(null));
        assertFalse(HevalSettings.isEnabled(""));
        assertFalse(HevalSettings.setEnabled("removed.feature", true));
        assertFalse(HevalSettings.setEnabled(null, true));
        assertEquals(0, store.commits);
        assertTrue(HevalSettings.isEnabled("on.default"));
    }

    @Test
    public void buildTimeOnlyFeaturesCannotBeSwitched() {
        HevalSettings.initForTests(store);
        Feature patchTime = Registry.get().feature("patch.time");
        assertFalse(HevalSettings.setEnabled("patch.time", false));
        assertEquals(HevalSettings.State.BUILD_TIME_ONLY, HevalSettings.stateOf(patchTime));
        // A stored value (an old import) is ignored too.
        store.externalWrite("f.patch.time", false);
        assertTrue(HevalSettings.isChosen("patch.time"));
    }

    @Test
    public void dependenciesGateTheDependent() {
        HevalSettings.initForTests(store);
        assertTrue(HevalSettings.isEnabled("needs.on"));
        HevalSettings.setEnabled("on.default", false);
        assertFalse(HevalSettings.isEnabled("needs.on"));
        assertTrue(HevalSettings.isChosen("needs.on"));

        Feature missing = Registry.get().feature("needs.missing");
        assertFalse(HevalSettings.isEnabled("needs.missing"));
        assertEquals("not.patched", HevalSettings.missingDependency(missing));
        assertEquals(HevalSettings.State.UNSUPPORTED, HevalSettings.stateOf(missing));

        // A dependency cycle cannot switch itself on.
        assertFalse(HevalSettings.isEnabled("cycle.a"));
        assertFalse(HevalSettings.isEnabled("cycle.b"));
    }

    @Test
    public void restartRequiredComparesWithTheProcessStart() {
        HevalSettings.initForTests(store);
        Feature late = Registry.get().feature("late");
        assertEquals(HevalSettings.State.ENABLED, HevalSettings.stateOf(late));
        assertEquals(0, HevalSettings.pendingRestartCount());

        HevalSettings.setEnabled("late", false);
        assertEquals(HevalSettings.State.RESTART_REQUIRED, HevalSettings.stateOf(late));
        assertEquals(1, HevalSettings.pendingRestartCount());
        // Live features are not counted.
        HevalSettings.setEnabled("off.default", true);
        assertEquals(1, HevalSettings.pendingRestartCount());

        HevalSettings.setEnabled("late", true);
        assertEquals(0, HevalSettings.pendingRestartCount());
    }

    @Test
    public void externalChangesRebuildTheSnapshot() {
        HevalSettings.initForTests(store);
        store.externalWrite("f.off.default", true);
        assertTrue(HevalSettings.isEnabled("off.default"));
        store.externalWrite("_paused", true);
        assertFalse(HevalSettings.isEnabled("off.default"));
    }

    @Test
    public void resetAllRestoresDefaultsAndUnpauses() {
        store.values.put("_safe_mode", false);
        store.values.put("_theme", "amoled");
        HevalSettings.initForTests(store);
        HevalSettings.setEnabled("on.default", false);
        HevalSettings.setEnabled("off.default", true);
        HevalSettings.setPaused(true);
        store.values.put("f.removed.feature", true);

        assertTrue(HevalSettings.resetAll());
        assertTrue(HevalSettings.isEnabled("on.default"));
        assertFalse(HevalSettings.isEnabled("off.default"));
        assertFalse(HevalSettings.isPaused());
        assertFalse(store.values.containsKey("f.removed.feature"));
        assertEquals("amoled", HevalSettings.theme());
    }

    @Test
    public void themeIsValidated() {
        HevalSettings.initForTests(store);
        assertEquals("system", HevalSettings.theme());
        assertTrue(HevalSettings.setTheme("dark"));
        assertEquals("dark", HevalSettings.theme());
        assertFalse(HevalSettings.setTheme("neon"));
        assertEquals("dark", HevalSettings.theme());
    }

    @Test
    public void hookFailuresKeepClassAndFrameButNoMessage() {
        HevalSettings.initForTests(store);
        HevalSettings.reportFailure("on.default", new IllegalStateException("secret chat text"));
        String failure = HevalSettings.failureOf("on.default");
        assertTrue(failure, failure.startsWith("java.lang.IllegalStateException at HevalSettingsTest."));
        assertFalse(failure, failure.contains("secret"));
        assertEquals(HevalSettings.State.FAILED, HevalSettings.stateOf(Registry.get().feature("on.default")));
        // Reporting is informational: the choice still decides.
        assertTrue(HevalSettings.isEnabled("on.default"));
        HevalSettings.reportFailure(null, new RuntimeException());
        HevalSettings.reportFailure("off.default", null);
        assertNull(HevalSettings.failureOf("off.default"));
    }

    @Test
    public void unsupportedRegistryAnswersStock() {
        Registry.install("hevalcontrols-registry:9\n");
        HevalSettings.initForTests(store);
        assertFalse(HevalSettings.isEnabled("on.default"));
        assertTrue(Registry.get().features().isEmpty());
    }

    @Test
    public void readsDuringConcurrentWritesNeverThrow() throws InterruptedException {
        HevalSettings.initForTests(store);
        final AtomicReference<Throwable> failure = new AtomicReference<>();
        final CountDownLatch done = new CountDownLatch(4);
        for (int t = 0; t < 4; t++) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        for (int i = 0; i < 20_000; i++) {
                            HevalSettings.isEnabled("on.default");
                            HevalSettings.isEnabled("needs.on");
                        }
                    } catch (Throwable error) {
                        failure.set(error);
                    } finally {
                        done.countDown();
                    }
                }
            }).start();
        }
        for (int i = 0; i < 200; i++) {
            synchronized (store) {
                HevalSettings.setEnabled("on.default", i % 2 == 0);
                HevalSettings.setPaused(i % 7 == 0);
            }
        }
        assertTrue(done.await(30, TimeUnit.SECONDS));
        assertNull(failure.get());
    }
}
