package dev.jason.gboardpatches.extension.toprowswipe;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;

import org.junit.After;
import org.junit.Test;
import org.robolectric.RuntimeEnvironment;

public final class GboardTopRowSwipeRuntimeTest {
    @After
    public void resetRuntimeState() {
        GboardTopRowSwipeRuntime.SESSIONS.clear();
        GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.clear();
        GboardTopRowSwipeRuntime.ORIGINAL_KEY_METADATA_BY_PATCHED.clear();
        GboardTopRowSwipeRuntime.TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.clear();
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK);
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK);
        GboardTopRowSwipeRuntime.clearSettingsSnapshotCache();
    }

    @Test
    public void resolvesZhuyinAndEnglishQwertyTopRowSlots() {
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.topRowLayoutKindForSlot(
                        0,
                        GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ZHUYIN,
                        "ㄅ"));
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                GboardTopRowSwipeRuntime.topRowLayoutKindForSlot(
                        9,
                        GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ENGLISH_QWERTY,
                        "p"));
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                GboardTopRowSwipeRuntime.topRowLayoutKindForSlot(
                        0,
                        GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.NONE,
                        "q"));
    }

    @Test
    public void rejectsNonTopRowEnglishQwertyLetters() {
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.NONE,
                GboardTopRowSwipeRuntime.topRowLayoutKindForSlot(
                        0,
                        GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ENGLISH_QWERTY,
                        "a"));
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.NONE,
                GboardTopRowSwipeRuntime.topRowLayoutKindForSlot(
                        9,
                        GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ENGLISH_QWERTY,
                        "m"));
    }

    @Test
    public void resolvesEnglishQwertyTopRowIndexFromLabels() {
        assertEquals(0, GboardTopRowSwipeRuntimeSupport.englishQwertyTopRowIndexForLabel("q"));
        assertEquals(9, GboardTopRowSwipeRuntimeSupport.englishQwertyTopRowIndexForLabel("P"));
        assertEquals(-1, GboardTopRowSwipeRuntimeSupport.englishQwertyTopRowIndexForLabel("a"));
    }

    @Test
    public void englishQwertyFallbackUsesPressTextWhenPrimaryLabelIsMissing() {
        GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior =
                new GboardTopRowSwipeRuntimeSupport.KeyBehavior(
                        null,
                        "q",
                        new String[0],
                        false,
                        false,
                        GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ENGLISH_QWERTY);

        GboardTopRowSwipeRuntime.TopRowSlot slot =
                GboardTopRowSwipeRuntime.topRowSlotForEnglishQwertyLabelFallback(
                        true,
                        behavior);

        assertEquals(0, slot.rowIndex);
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                slot.layoutKind);
    }

    @Test
    public void englishQwertyFallbackDoesNotRequireVisualFirstRowWhenLegacyKindMatches() {
        GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior =
                new GboardTopRowSwipeRuntimeSupport.KeyBehavior(
                        "e",
                        "e",
                        new String[0],
                        false,
                        false,
                        GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ENGLISH_QWERTY);

        GboardTopRowSwipeRuntime.TopRowSlot slot =
                GboardTopRowSwipeRuntime.topRowSlotForEnglishQwertyLabelFallback(
                        false,
                        behavior);

        assertEquals(2, slot.rowIndex);
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                slot.layoutKind);
    }

    @Test
    public void keepsZhuyinAndEnglishQwertyPageStateSeparate() {
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK);

        assertEquals(GboardTopRowSwipeRuntime.TopRowPage.CUSTOM,
                GboardTopRowSwipeRuntime.currentPage(
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN));
        assertEquals(GboardTopRowSwipeRuntime.TopRowPage.STOCK,
                GboardTopRowSwipeRuntime.currentPage(
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY));
    }

    @Test
    public void visibleTopRowKeyDoesNotRetainSoftKeyView() {
        for (Field field : GboardTopRowSwipeRuntime.VisibleTopRowKey.class.getDeclaredFields()) {
            assertFalse("VisibleTopRowKey must not strongly retain the WeakHashMap key",
                    "softKeyView".equals(field.getName()));
        }
    }

    @Test
    public void sourceExcludesToolbarAndHeaderSurfacesFromTopRowCache() throws Exception {
        String source = readSource(
                "src/main/java/dev/jason/gboardpatches/extension/toprowswipe/"
                        + "GboardTopRowSwipeRuntime.java");

        assertTrue(source.contains("isTopRowCacheEligibleView("));
        assertTrue(source.contains("view.getVisibility() == View.VISIBLE"));
        assertTrue(source.contains("view.getAlpha() <= 0f"));
        assertTrue(source.contains("isSameVisualRow("));
        assertTrue(source.contains("AccessPointsBarItemSoftKeyView"));
        assertTrue(source.contains("AccessPointsBar"));
        assertTrue(source.contains("softkey_holder_fixed_candidates"));
        assertTrue(source.contains("key_pos_header_"));
        assertTrue(source.contains(".keyboard-header-area"));
        assertTrue(source.contains("CandidatesHolderView"));
        assertTrue(source.contains("isDisallowedTopRowSurface("));
    }

    @Test
    public void sourceSkipsResourceNameLookupForNoIdViews() throws Exception {
        String source = readSource(
                "src/main/java/dev/jason/gboardpatches/extension/toprowswipe/"
                        + "GboardTopRowSwipeRuntimeSupport.java");

        assertTrue(source.contains("view.getId() == View.NO_ID"));
    }

    @Test
    public void malformedProviderValuesDisableTopRowSwipeAtRuntime() {
        GboardTopRowSwipeRuntime.SettingsSnapshot snapshot =
                GboardTopRowSwipeRuntime.settingsSnapshotFromProviderValues(
                        Boolean.TRUE,
                        Boolean.TRUE,
                        Boolean.TRUE,
                        Collections.singletonList("A"),
                        defaultCommitTexts(),
                        1000L);

        assertFalse(snapshot.enabled);

        ArrayList<String> displays = defaultDisplayTexts();
        displays.set(0, "");
        snapshot = GboardTopRowSwipeRuntime.settingsSnapshotFromProviderValues(
                Boolean.TRUE,
                Boolean.TRUE,
                Boolean.TRUE,
                displays,
                defaultCommitTexts(),
                1000L);

        assertFalse(snapshot.enabled);
    }

    @Test
    public void settingsSnapshotKeepsLayoutTogglesSeparateFromGlobalEnable() {
        GboardTopRowSwipeRuntime.SettingsSnapshot snapshot =
                GboardTopRowSwipeRuntime.settingsSnapshotFromProviderValues(
                        Boolean.TRUE,
                        Boolean.TRUE,
                        Boolean.FALSE,
                        defaultDisplayTexts(),
                        defaultCommitTexts(),
                        1000L);

        assertTrue(snapshot.enabled);
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);
        assertTrue(GboardTopRowSwipeRuntime.shouldAllowTopRowCustomPatchedDispatch(
                snapshot,
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN));
        assertFalse(GboardTopRowSwipeRuntime.shouldAllowTopRowCustomPatchedDispatch(
                snapshot,
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY));
    }

    @Test
    public void customTopRowPatchedDispatchRequiresCurrentCustomPage() {
        GboardTopRowSwipeRuntime.SettingsSnapshot snapshot = customSnapshot(true, false, 1000L);
        Object customTopRowMetadata = new Object();
        GboardTopRowSwipeRuntime.markTopRowCustomPatchedMetadata(
                customTopRowMetadata,
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN);

        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK);
        assertTrue(GboardTopRowSwipeRuntime.shouldConsumeDisabledTopRowCustomDispatch(
                snapshot,
                customTopRowMetadata));

        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);
        assertFalse(GboardTopRowSwipeRuntime.shouldConsumeDisabledTopRowCustomDispatch(
                snapshot,
                customTopRowMetadata));
    }

    @Test
    public void customEnglishPageCanRecoverSlotFromVisibleCache() {
        Object softKeyView = new Object();
        GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.put(
                softKeyView,
                new GboardTopRowSwipeRuntime.VisibleTopRowKey(
                        new Object(),
                        4,
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY));
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);

        GboardTopRowSwipeRuntime.TopRowSlot slot =
                GboardTopRowSwipeRuntime.topRowSlotFromVisibleCache(softKeyView);

        assertEquals(4, slot.rowIndex);
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY,
                slot.layoutKind);
    }

    @Test
    public void quickJsConfigCanRecoverFromActiveSessionRow() {
        Object tracker = new Object();
        GboardTopRowSwipeRuntime.SESSIONS.put(
                tracker,
                new GboardTopRowSwipeRuntime.SwipeSession(
                        new Object(),
                        0f,
                        0f,
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                        6));
        GboardTopRowSwipeRuntime.SettingsSnapshot snapshot = customJavaScriptSnapshot(
                6,
                "return 'ok';",
                1_500,
                1000L);
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM);

        GboardTopRowSwipeRuntime.QuickJsSlotConfig config =
                GboardTopRowSwipeRuntime.quickJsSlotConfigFromSession(snapshot, tracker);

        assertEquals(6, config.rowIndex);
        assertEquals(GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN, config.layoutKind);
        assertEquals("return 'ok';", config.scriptSource);
        assertEquals(1_500, config.timeoutMs);
    }

    @Test
    public void consumedSessionRecyclesOnlyAfterRecycleWindow() throws Exception {
        Method recycleMethod = GboardTopRowSwipeRuntime.class.getDeclaredMethod(
                "shouldRecycleConsumedSession",
                long.class,
                GboardTopRowSwipeRuntime.SwipeSession.class);
        recycleMethod.setAccessible(true);

        GboardTopRowSwipeRuntime.SwipeSession session =
                new GboardTopRowSwipeRuntime.SwipeSession(
                        new Object(),
                        0f,
                        0f,
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY);
        session.consumed = true;
        session.consumedAtElapsedMs = 1_000L;

        assertFalse((Boolean) recycleMethod.invoke(
                null,
                1_000L + GboardTopRowSwipeRuntime.CONSUMED_SESSION_RECYCLE_WINDOW_MS - 1L,
                session));
        assertTrue((Boolean) recycleMethod.invoke(
                null,
                1_000L + GboardTopRowSwipeRuntime.CONSUMED_SESSION_RECYCLE_WINDOW_MS,
                session));
    }

    @Test
    public void nonViewAnchorSessionIsRecycledForNextIncomingView() {
        View incoming = new View(RuntimeEnvironment.getApplication());
        GboardTopRowSwipeRuntime.SwipeSession session =
                new GboardTopRowSwipeRuntime.SwipeSession(
                        new Object(),
                        0f,
                        0f,
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ENGLISH_QWERTY);

        assertTrue(GboardTopRowSwipeRuntime.shouldRecycleSessionForIncomingView(
                session,
                incoming,
                incoming));
    }

    private static GboardTopRowSwipeRuntime.SettingsSnapshot customSnapshot(
            boolean zhuyinEnabled, boolean englishEnabled, long loadedAtElapsedMs) {
        return GboardTopRowSwipeRuntime.settingsSnapshotFromProviderValues(
                Boolean.TRUE,
                Boolean.valueOf(zhuyinEnabled),
                Boolean.valueOf(englishEnabled),
                defaultDisplayTexts(),
                defaultCommitTexts(),
                loadedAtElapsedMs);
    }

    private static ArrayList<String> defaultDisplayTexts() {
        ArrayList<String> displays = new ArrayList<String>(GboardTopRowSwipeSettings.SLOT_COUNT);
        for (GboardTopRowSwipeSettings.SlotText slot : GboardTopRowSwipeSettings.defaultSlots()) {
            displays.add(slot.displayText);
        }
        return displays;
    }

    private static ArrayList<String> defaultCommitTexts() {
        ArrayList<String> commits = new ArrayList<String>(GboardTopRowSwipeSettings.SLOT_COUNT);
        for (GboardTopRowSwipeSettings.SlotText slot : GboardTopRowSwipeSettings.defaultSlots()) {
            commits.add(slot.commitText);
        }
        return commits;
    }

    private static GboardTopRowSwipeRuntime.SettingsSnapshot customJavaScriptSnapshot(
            int javaScriptSlotIndex,
            String script,
            int timeoutMs,
            long loadedAtElapsedMs) {
        boolean[] isJavaScripts = new boolean[GboardTopRowSwipeSettings.SLOT_COUNT];
        isJavaScripts[javaScriptSlotIndex] = true;
        ArrayList<String> scripts = new ArrayList<String>(GboardTopRowSwipeSettings.SLOT_COUNT);
        int[] timeouts = new int[GboardTopRowSwipeSettings.SLOT_COUNT];
        for (int index = 0; index < GboardTopRowSwipeSettings.SLOT_COUNT; index++) {
            scripts.add(index == javaScriptSlotIndex ? script : "");
            timeouts[index] = index == javaScriptSlotIndex
                    ? timeoutMs : GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MS;
        }
        return GboardTopRowSwipeRuntime.settingsSnapshotFromProviderValues(
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
                loadedAtElapsedMs);
    }

    private static String readSource(String path) throws Exception {
        return new String(Files.readAllBytes(Path.of(path)), StandardCharsets.UTF_8);
    }
}
