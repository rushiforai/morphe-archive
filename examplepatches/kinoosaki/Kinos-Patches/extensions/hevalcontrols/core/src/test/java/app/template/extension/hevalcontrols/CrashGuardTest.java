package app.template.extension.hevalcontrols;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CrashGuardTest {
    private static final String REGISTRY = "hevalcontrols-registry:1\nx.feature\tFeature\t\tX\t1\t0\t0\t\n";

    /** In-memory records shared by the "processes" of one test. */
    private static final class MemoryRecords implements CrashGuard.Records {
        final Map<String, String> files = new HashMap<>();

        @Override
        public String read(String name) {
            return files.get(name);
        }

        @Override
        public boolean write(String name, String text) {
            files.put(name, text);
            return true;
        }

        @Override
        public void delete(String name) {
            files.remove(name);
        }
    }

    /** Answers a fixed verdict for every pid (null: no exit history, as below Android 11). */
    private static final class FixedHistory implements CrashGuard.ExitHistory {
        Boolean verdict;

        @Override
        public Boolean diedFromCrash(int pid, long startedWallMillis, long windowMillis) {
            return verdict;
        }
    }

    private static final class FakeClock implements CrashGuard.Clock {
        long wall = 1_000_000L;
        long elapsed = 10_000L;

        @Override
        public long wallMillis() {
            return wall;
        }

        @Override
        public long elapsedMillis() {
            return elapsed;
        }
    }

    private MemoryRecords records;
    private FixedHistory history;
    private FakeClock clock;
    private FakeStore store;
    private int pid = 100;

    @Before
    public void setUp() {
        HevalSettings.resetForTests();
        CrashGuard.resetForTests();
        Registry.install(REGISTRY);
        store = new FakeStore();
        HevalSettings.initForTests(store);
        records = new MemoryRecords();
        history = new FixedHistory();
        clock = new FakeClock();
    }

    @After
    public void tearDown() {
        HevalSettings.resetForTests();
        CrashGuard.resetForTests();
        Registry.install(null);
    }

    /** One process start. */
    private CrashGuard start() {
        CrashGuard guard = new CrashGuard(records, history, clock, pid++);
        guard.start();
        CrashGuard.installForTests(guard);
        clock.wall += 1_000;
        return guard;
    }

    /** A start that crashes quickly, detected by the uncaught-exception mark (Android 10 and older). */
    private void quickJavaCrash() {
        CrashGuard guard = start();
        clock.elapsed += 5_000;
        guard.markCrash();
    }

    @Test
    public void firstStartWritesARecordAndNoStreak() {
        CrashGuard guard = start();
        assertEquals("100 1000000", records.files.get(CrashGuard.START_RECORD));
        assertEquals("0", records.files.get(CrashGuard.CRASH_STREAK));
        assertEquals(0, CrashGuard.crashStreak());
        assertFalse(HevalSettings.isSafeMode());
    }

    @Test
    public void threeQuickCrashesEnterSafeMode() {
        quickJavaCrash();
        quickJavaCrash();
        assertEquals(1, CrashGuard.crashStreak());
        quickJavaCrash();
        assertEquals(2, CrashGuard.crashStreak());
        assertFalse(HevalSettings.isSafeMode());
        assertTrue(HevalSettings.isEnabled("x.feature"));

        start();
        assertTrue(HevalSettings.isSafeMode());
        assertTrue(CrashGuard.enteredSafeModeThisStart());
        assertEquals(Boolean.TRUE, store.values.get("_safe_mode"));
        assertFalse(HevalSettings.isEnabled("x.feature"));
        // The streak restarts, so a resume gets three more tries.
        assertEquals("0", records.files.get(CrashGuard.CRASH_STREAK));
    }

    @Test
    public void aLateCrashIsNotMarked() {
        CrashGuard guard = start();
        clock.elapsed += CrashGuard.WINDOW_MS + 1;
        guard.markCrash();
        assertFalse(records.files.get(CrashGuard.START_RECORD).endsWith("crashed"));
        start();
        assertEquals(0, CrashGuard.crashStreak());
    }

    @Test
    public void survivingTheStartResetsTheStreak() {
        quickJavaCrash();
        quickJavaCrash();
        CrashGuard guard = start();
        assertEquals(2, CrashGuard.crashStreak());
        guard.survivedStartup();
        assertEquals("0", records.files.get(CrashGuard.CRASH_STREAK));
        assertNull(records.files.get(CrashGuard.START_RECORD));
        start();
        assertEquals(0, CrashGuard.crashStreak());
    }

    @Test
    public void aMarkedCrashIsNotResetBySurvival() {
        CrashGuard guard = start();
        clock.elapsed += 1_000;
        guard.markCrash();
        guard.survivedStartup();
        assertTrue(records.files.get(CrashGuard.START_RECORD).endsWith(" crashed"));
    }

    @Test
    public void exitHistoryOverridesTheMarkOnAndroid11() {
        // Native crashes leave no Java mark; the exit history still counts them.
        history.verdict = Boolean.TRUE;
        start();
        start();
        start();
        assertEquals(2, CrashGuard.crashStreak());
        start();
        assertTrue(HevalSettings.isSafeMode());

        // A marked record whose process the history says was killed normally is not a crash.
        HevalSettings.setSafeMode(false);
        history.verdict = Boolean.FALSE;
        quickJavaCrash();
        start();
        assertEquals(0, CrashGuard.crashStreak());
    }

    @Test
    public void corruptRecordsStartAFreshStreak() {
        records.files.put(CrashGuard.START_RECORD, "not a record");
        records.files.put(CrashGuard.CRASH_STREAK, "-4");
        start();
        assertEquals(0, CrashGuard.crashStreak());
        assertEquals("0", records.files.get(CrashGuard.CRASH_STREAK));

        records.files.put(CrashGuard.START_RECORD, "12 34 crashed");
        records.files.put(CrashGuard.CRASH_STREAK, "garbage");
        start();
        assertEquals(1, CrashGuard.crashStreak());
    }

    @Test
    public void aBrokenExitHistoryFallsBackToTheMark() {
        CrashGuard.ExitHistory throwing = new CrashGuard.ExitHistory() {
            @Override
            public Boolean diedFromCrash(int pid, long startedWallMillis, long windowMillis) {
                throw new SecurityException("no access");
            }
        };
        CrashGuard guard = new CrashGuard(records, throwing, clock, 7);
        assertTrue(guard.diedYoungFromACrash("5 100 crashed"));
        assertFalse(guard.diedYoungFromACrash("5 100"));
    }

    @Test
    public void resumeLeavesSafeModeAndClearsTheStreak() {
        quickJavaCrash();
        quickJavaCrash();
        quickJavaCrash();
        start();
        assertTrue(HevalSettings.isSafeMode());
        records.files.put(CrashGuard.CRASH_STREAK, "2");

        assertTrue(CrashGuard.resume(false));
        assertFalse(HevalSettings.isSafeMode());
        assertFalse(HevalSettings.isPaused());
        assertTrue(HevalSettings.isEnabled("x.feature"));
        assertEquals("0", records.files.get(CrashGuard.CRASH_STREAK));
    }

    @Test
    public void resumePausedKeepsEveryFeatureStock() {
        store.externalWrite("_safe_mode", true);
        assertTrue(CrashGuard.resume(true));
        assertFalse(HevalSettings.isSafeMode());
        assertTrue(HevalSettings.isPaused());
        assertFalse(HevalSettings.isEnabled("x.feature"));
    }

    @Test
    public void safeModeIsNotEnteredWhenItCannotBeSaved() {
        quickJavaCrash();
        quickJavaCrash();
        quickJavaCrash();
        store.refuseCommits = true;
        start();
        assertFalse(HevalSettings.isSafeMode());
        assertFalse(CrashGuard.enteredSafeModeThisStart());
        // The streak stays at the threshold, so the next start tries again.
        assertEquals(String.valueOf(CrashGuard.THRESHOLD), records.files.get(CrashGuard.CRASH_STREAK));
    }
}
