package app.hushmessenger.extension;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.concurrent.TimeUnit;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class InboxRefreshTest {
    /** Stands in for Messenger's chat list supplier: a listed count, another int, and a static subscribe call. */
    static final class Supplier {
        int A00;
        int A03;
        int subscribes;
        RuntimeException failure;

        static void A04(Supplier supplier) {
            supplier.subscribes++;
            if (supplier.failure != null) throw supplier.failure;
        }

        void A05(Supplier supplier) { supplier.subscribes++; }
    }

    private static final String TYPE = "L" + Supplier.class.getName().replace('.', '/') + ";";
    private static final String ROUTE = TYPE + "->A04(" + TYPE + ")V|" + TYPE + "->A00:I";
    private static final long FIRST_CHECK = InboxRefresh.CHECKS_MS[0];
    private static final long ALL_CHECKS = InboxRefresh.CHECKS_MS[InboxRefresh.CHECKS_MS.length - 1];
    private static final int MOST_SUBSCRIBES = InboxRefresh.CHECKS_MS.length;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        synchronized (InboxRefresh.class) { InboxRefresh.tracked.clear(); }
    }

    private static void on() { Settings.preferences.edit().putBoolean("people", true).commit(); }

    private static void idle(long millis) { ShadowLooper.idleMainLooper(millis, TimeUnit.MILLISECONDS); }

    @Test public void anEmptyListGetsOneSubscribeAtEachScheduledCheckAndNoMore() {
        on();
        Supplier supplier = new Supplier();
        InboxRefresh.refresh(supplier, ROUTE);
        idle(FIRST_CHECK - 1);
        assertEquals(0, supplier.subscribes);
        assertEquals(0, Settings.lastActive("people"));
        idle(1);
        assertEquals(1, supplier.subscribes);
        assertTrue(Settings.lastActive("people") > 0);
        for (int i = 1; i < InboxRefresh.CHECKS_MS.length; i++) {
            idle(InboxRefresh.CHECKS_MS[i] - InboxRefresh.CHECKS_MS[i - 1] - 1);
            assertEquals(i, supplier.subscribes);
            idle(1);
            assertEquals(i + 1, supplier.subscribes);
        }
        idle(60_000);
        assertEquals(MOST_SUBSCRIBES, supplier.subscribes);
        // Later reads of the same supplier never schedule it again.
        for (int i = 0; i < 5; i++) InboxRefresh.refresh(supplier, ROUTE);
        idle(60_000);
        assertEquals(MOST_SUBSCRIBES, supplier.subscribes);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** #30: one check at 2.5 s left the footer up for about 5 seconds, so the first subscribe has to land sooner. */
    @Test public void theFirstSubscribeLandsWithinASecondAndTheScheduleStaysShortAndBounded() {
        on();
        Supplier supplier = new Supplier();
        InboxRefresh.refresh(supplier, ROUTE);
        idle(1_000);
        assertEquals(1, supplier.subscribes);
        assertTrue(MOST_SUBSCRIBES <= 4);
        assertTrue(ALL_CHECKS <= 10_000);
        for (int i = 1; i < InboxRefresh.CHECKS_MS.length; i++) {
            assertTrue(InboxRefresh.CHECKS_MS[i] - InboxRefresh.CHECKS_MS[i - 1] >= 500);
        }
        // Rows arriving between checks end the run there.
        idle(InboxRefresh.CHECKS_MS[1] - 1_000);
        assertEquals(2, supplier.subscribes);
        supplier.A00 = 1;
        idle(ALL_CHECKS + 60_000);
        assertEquals(2, supplier.subscribes);
    }

    @Test public void rowsArrivingStopTheRefresh() {
        on();
        Supplier early = new Supplier(), late = new Supplier();
        InboxRefresh.refresh(early, ROUTE);
        InboxRefresh.refresh(late, ROUTE);
        early.A00 = 1;
        late.A03 = 7;
        idle(FIRST_CHECK);
        assertEquals(0, early.subscribes);
        assertEquals(1, late.subscribes);
        late.A00 = 5;
        idle(ALL_CHECKS + 60_000);
        assertEquals(0, early.subscribes);
        assertEquals(1, late.subscribes);
    }

    @Test public void repeatedReadsScheduleEachSupplierOnce() {
        on();
        Supplier first = new Supplier(), second = new Supplier();
        for (int i = 0; i < 10; i++) {
            InboxRefresh.refresh(first, ROUTE);
            InboxRefresh.refresh(second, ROUTE);
        }
        idle(ALL_CHECKS + 60_000);
        assertEquals(MOST_SUBSCRIBES, first.subscribes);
        assertEquals(MOST_SUBSCRIBES, second.subscribes);
        assertEquals(2, InboxRefresh.tracked.size());
    }

    @Test public void offPauseSafeModeAndMissingKeepTheStockList() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("people", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Supplier supplier = new Supplier();
            InboxRefresh.refresh(supplier, ROUTE);
            idle(ALL_CHECKS);
            assertEquals(state, 0, supplier.subscribes);
            assertTrue(state, InboxRefresh.tracked.isEmpty());
        }
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void switchingOffOrPausingBeforeACheckKeepsTheStockList() {
        on();
        Supplier paused = new Supplier();
        InboxRefresh.refresh(paused, ROUTE);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        idle(ALL_CHECKS);
        assertEquals(0, paused.subscribes);
        Settings.preferences.edit().putBoolean("paused", false).commit();
        Supplier off = new Supplier();
        InboxRefresh.refresh(off, ROUTE);
        idle(FIRST_CHECK);
        assertEquals(1, off.subscribes);
        Settings.preferences.edit().putBoolean("people", false).commit();
        idle(ALL_CHECKS + 60_000);
        assertEquals(1, off.subscribes);
        assertEquals(0, paused.subscribes);
    }

    @Test public void theUnpatchedExtensionAndAGoneSupplierDoNothing() throws ReflectiveOperationException {
        on();
        Supplier supplier = new Supplier();
        // The extension alone has no route, so the hook leaves Messenger's list alone.
        InboxRefresh.onInboxItems(supplier);
        InboxRefresh.refresh(null, ROUTE);
        InboxRefresh.refresh(supplier, null);
        InboxRefresh.refresh(supplier, "");
        idle(ALL_CHECKS);
        assertEquals(0, supplier.subscribes);
        assertTrue(InboxRefresh.tracked.isEmpty());
        WeakReference<Object> gone = new WeakReference<>(new Supplier());
        gone.clear();
        InboxRefresh.check(gone, InboxRefresh.Route.of(ROUTE, Supplier.class), 0);
        idle(ALL_CHECKS);
        assertTrue(Settings.hookErrors.isEmpty());
        assertEquals(0, Settings.lastActive("people"));
    }

    @Test public void aRouteThatDoesNotFitTheSupplierIsReportedOnceAndNeverCalled() {
        on();
        String[] wrong = {
            "changed",
            ROUTE + "|" + TYPE + "->A03:I",
            ROUTE.replace("->A04(", "->A06("),
            ROUTE.replace("->A04(", "->A05("),
            ROUTE.replace("->A00:I", "->A07:I"),
            ROUTE.replace("->A00:I", "->failure:I"),
            ROUTE.replace("->A00:I", "->A00:J"),
            ROUTE.replace(TYPE, "Lcom/facebook/Other;"),
        };
        for (String route : wrong) {
            Settings.hookErrors.clear();
            Supplier supplier = new Supplier();
            InboxRefresh.refresh(supplier, route);
            assertNotNull(route, Settings.hookErrors.get("people"));
            Settings.hookErrors.clear();
            InboxRefresh.refresh(supplier, route);
            assertNull(route, Settings.hookErrors.get("people"));
            idle(ALL_CHECKS);
            assertEquals(route, 0, supplier.subscribes);
        }
    }

    @Test public void aFailingSubscribeIsRecordedWithoutItsMessageAndEndsTheRefresh() {
        on();
        Supplier supplier = new Supplier();
        supplier.failure = new IllegalStateException("thread with Alice");
        InboxRefresh.refresh(supplier, ROUTE);
        idle(FIRST_CHECK);
        assertEquals(1, supplier.subscribes);
        String error = Settings.hookErrors.get("people");
        assertNotNull(error);
        assertTrue(error, error.startsWith("java.lang.IllegalStateException at "));
        assertFalse(error, error.contains("Alice"));
        idle(ALL_CHECKS + 60_000);
        assertEquals(1, supplier.subscribes);
    }
}
