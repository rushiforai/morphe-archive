package dev.jason.gboardpatches.extension.toprowswipe;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;
import android.view.View;

import java.lang.reflect.Field;
import java.util.Collections;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE)
public final class GboardTopRowSwipePageReconciliationTest {
    @After
    public void resetRuntimeState() {
        GboardTopRowSwipeRuntime.SESSIONS.clear();
        GboardTopRowSwipeRuntime.TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.clear();
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK);
        GboardTopRowSwipeRuntime.clearSettingsSnapshotCache();
    }

    @Test
    public void stockKeyAfterKeyboardRebuildOverridesStaleCustomPageBeforeToggle()
            throws Exception {
        long now = SystemClock.elapsedRealtime();
        GboardTopRowSwipeRuntime.SettingsSnapshot snapshot =
                GboardTopRowSwipeRuntime.settingsSnapshotFromProviderValues(
                        Boolean.TRUE,
                        Boolean.TRUE,
                        Boolean.TRUE,
                        Collections.nCopies(GboardTopRowSwipeSettings.SLOT_COUNT, "slot"),
                        Collections.nCopies(GboardTopRowSwipeSettings.SLOT_COUNT, "slot"),
                        now);
        Field cachedSettings = GboardTopRowSwipeRuntime.class.getDeclaredField(
                "cachedSettingsSnapshot");
        cachedSettings.setAccessible(true);
        cachedSettings.set(null, snapshot);

        Object tracker = new Object();
        View stockKey = new View(RuntimeEnvironment.getApplication());
        GboardTopRowSwipeRuntime.SwipeSession session =
                new GboardTopRowSwipeRuntime.SwipeSession(
                        stockKey,
                        0f,
                        0f,
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                        0);
        session.armed = true;
        GboardTopRowSwipeRuntime.SESSIONS.put(tracker, session);
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);

        assertTrue(GboardTopRowSwipeRuntime.maybeConsumeTopRowSwipe(
                null, tracker, null, new Object()));
        assertEquals(GboardTopRowSwipeRuntime.TopRowPage.STOCK,
                GboardTopRowSwipeRuntime.currentPage(
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY));
        assertEquals(GboardTopRowSwipeRuntime.TopRowPage.CUSTOM, session.pendingPage);
    }
}
