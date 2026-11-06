package dev.jason.gboardpatches.extension.toprowswipe;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;

import dev.jason.gboardpatches.extension.zhuyinslide.GboardZhuyinSlideFixtureResources;
import dev.jason.gboardpatches.extension.zhuyinslide.GboardZhuyinSlideRuntime;
import dev.jason.gboardpatches.extension.zhuyinslide.GboardZhuyinSlideTargetFixture;

import java.lang.reflect.Field;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public final class GboardTopRowSlideMarkerIntegrationTest {
    private static final int FIXTURE_VIEW_ID = 0x7f0b5001;

    @Before
    public void configureCustomZhuyinTopRow() throws Exception {
        resetRuntimeState();
        GboardZhuyinSlideFixtureResources.clear();
        Field cachedSettings = GboardTopRowSwipeRuntime.class
                .getDeclaredField("cachedSettingsSnapshot");
        cachedSettings.setAccessible(true);
        cachedSettings.set(null, GboardTopRowSwipeRuntime.settingsSnapshotFromProviderValues(
                Boolean.TRUE,
                Boolean.TRUE,
                Boolean.FALSE,
                defaultDisplayTexts(),
                defaultCommitTexts(),
                SystemClock.elapsedRealtime()));
    }

    @After
    public void resetAfterTest() {
        resetRuntimeState();
        GboardZhuyinSlideFixtureResources.clear();
    }

    @Test
    public void customPageRebindKeepsSlideIdentityForPointerOwnership() throws Exception {
        Object view = GboardZhuyinSlideTargetFixture.newSoftKeyView(
                RuntimeEnvironment.getApplication());
        GboardZhuyinSlideTargetFixture.setResourceEntryName(
                view, FIXTURE_VIEW_ID, "E01");
        Object base = GboardZhuyinSlideTargetFixture.metadata(
                0x7f0b2901, "ㄅ", "ㄅ", new String[] {"ㄅ", "1", "!"}, null, null);

        GboardZhuyinSlideTargetFixture.bind(view, base, 51L);
        Object initiallyBound = GboardZhuyinSlideTargetFixture.boundMetadata(view);
        assertTrue(GboardZhuyinSlideRuntime.isPatchedMetadata(initiallyBound));
        GboardTopRowSwipeRuntime.afterSoftKeyBound(view);
        assertTrue(GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.containsKey(view));

        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);
        Object customMetadata = GboardTopRowSwipeRuntime.patchIncomingSoftKeyMetadata(
                view, initiallyBound);
        assertNotSame(initiallyBound, customMetadata);
        GboardZhuyinSlideTargetFixture.bind(view, customMetadata, 52L);

        Object rebound = GboardZhuyinSlideTargetFixture.boundMetadata(view);
        assertTrue(GboardZhuyinSlideRuntime.isPatchedMetadata(rebound));
        GboardTopRowSwipeRuntime.afterSoftKeyBound(view);

        Object tracker = GboardZhuyinSlideTargetFixture.newPointerTracker();
        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "PRESS");
        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, view, 1.0f, 1.0f));
        GboardZhuyinSlideTargetFixture.setCurrentOwner(tracker, view);

        Object crossedView = GboardZhuyinSlideTargetFixture.newSoftKeyView(
                RuntimeEnvironment.getApplication());
        Object crossedBase = GboardZhuyinSlideTargetFixture.metadata(
                0x7f0b2902, "ㄝ", "ㄝ", new String[] {"ㄝ", "……"}, null, null);
        GboardZhuyinSlideTargetFixture.bind(crossedView, crossedBase, 53L);
        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "SLIDE_DOWN");
        assertTrue(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, crossedView, 2.0f, 3.0f));

        GboardZhuyinSlideRuntime.clearPointerState(tracker);
        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, crossedView, 2.0f, 3.0f));
    }

    @Test
    public void nativeCompleteUnmarkedSourceRemainsUnmarkedAfterTopRowClone()
            throws Exception {
        Object view = GboardZhuyinSlideTargetFixture.newSoftKeyView(
                RuntimeEnvironment.getApplication());
        GboardZhuyinSlideTargetFixture.setResourceEntryName(
                view, FIXTURE_VIEW_ID, "E01");
        Object nativeComplete = GboardZhuyinSlideTargetFixture.metadata(
                0x7f0b2903,
                "ㄅ",
                "ㄅ",
                new String[] {"ㄅ", "1", "!"},
                "native-up",
                "native-down");
        assertFalse(GboardZhuyinSlideRuntime.isPatchedMetadata(nativeComplete));

        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);
        GboardZhuyinSlideTargetFixture.bind(view, nativeComplete, 54L);

        Object rebound = GboardZhuyinSlideTargetFixture.boundMetadata(view);
        assertNotSame(nativeComplete, rebound);
        assertFalse(GboardZhuyinSlideRuntime.isPatchedMetadata(rebound));
    }

    @Test
    public void freshCustomZhuyinBindKeepsTopRowLineageAcrossSlideClone()
            throws Exception {
        configureCustomJavaScriptSlot(0);
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);

        Object view = GboardZhuyinSlideTargetFixture.newSoftKeyView(
                RuntimeEnvironment.getApplication());
        GboardZhuyinSlideTargetFixture.setResourceEntryName(
                view, FIXTURE_VIEW_ID, "E01");
        Object base = GboardZhuyinSlideTargetFixture.metadata(
                0x7f0b2904, "ㄅ", "ㄅ", new String[] {"ㄅ", "1", "!"}, null, null);

        GboardZhuyinSlideTargetFixture.bind(view, base, 55L);
        Object rebound = GboardZhuyinSlideTargetFixture.boundMetadata(view);

        assertNotSame(base, rebound);
        assertTrue(GboardZhuyinSlideRuntime.isPatchedMetadata(rebound));
        assertSame(base,
                GboardTopRowSwipeRuntime.resolveOriginalKeyMetadataForPatchInterop(rebound));
        GboardTopRowSwipeRuntime.QuickJsSlotConfig config =
                GboardTopRowSwipeRuntime.quickJsSlotConfig(rebound);
        assertNotNull(config);
        assertEquals(0, config.rowIndex);
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN, config.layoutKind);

        GboardTopRowSwipeRuntime.afterSoftKeyBound(view);
        assertTrue(GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.containsKey(view));
    }

    private static void resetRuntimeState() {
        GboardTopRowSwipeRuntime.SESSIONS.clear();
        GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.clear();
        GboardTopRowSwipeRuntime.ORIGINAL_KEY_METADATA_BY_PATCHED.clear();
        GboardTopRowSwipeRuntime.TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.clear();
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK);
        GboardTopRowSwipeRuntime.clearSettingsSnapshotCache();
    }

    private static ArrayList<String> defaultDisplayTexts() {
        ArrayList<String> values = new ArrayList<String>();
        for (GboardTopRowSwipeSettings.SlotText slot : GboardTopRowSwipeSettings.defaultSlots()) {
            values.add(slot.displayText);
        }
        return values;
    }

    private static ArrayList<String> defaultCommitTexts() {
        ArrayList<String> values = new ArrayList<String>();
        for (GboardTopRowSwipeSettings.SlotText slot : GboardTopRowSwipeSettings.defaultSlots()) {
            values.add(slot.commitText);
        }
        return values;
    }

    private static void configureCustomJavaScriptSlot(int slotIndex) throws Exception {
        boolean[] isJavaScripts = new boolean[GboardTopRowSwipeSettings.SLOT_COUNT];
        isJavaScripts[slotIndex] = true;
        ArrayList<String> scripts = new ArrayList<String>();
        int[] timeouts = new int[GboardTopRowSwipeSettings.SLOT_COUNT];
        for (int index = 0; index < GboardTopRowSwipeSettings.SLOT_COUNT; index++) {
            scripts.add(index == slotIndex ? "return 'ok';" : "");
            timeouts[index] = GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MS;
        }
        Field cachedSettings = GboardTopRowSwipeRuntime.class
                .getDeclaredField("cachedSettingsSnapshot");
        cachedSettings.setAccessible(true);
        cachedSettings.set(null, GboardTopRowSwipeRuntime.settingsSnapshotFromProviderValues(
                Boolean.TRUE,
                Boolean.TRUE,
                Boolean.FALSE,
                defaultDisplayTexts(),
                defaultCommitTexts(),
                isJavaScripts,
                scripts,
                timeouts,
                "",
                GboardTopRowSwipeSettings.DEFAULT_RESPONSE_BODY_LIMIT_BYTES,
                GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MAX_MS,
                GboardTopRowSwipeSettings.DEFAULT_MEMORY_LIMIT_BYTES,
                GboardTopRowSwipeSettings.DEFAULT_MAX_STACK_BYTES,
                SystemClock.elapsedRealtime()));
    }
}
