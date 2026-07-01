package dev.jason.gboardpatches.extension.toprowswipe;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsProvider;

@SuppressWarnings("unused")
public final class GboardTopRowSwipeRuntime {
    private static final String TAG = "GboardTopRowSwipe";
    static final String QUICK_JS_PAYLOAD_PREFIX = "__hc_qjs__:";
    static final float HORIZONTAL_TRIGGER_DP = 10f;
    static final float HORIZONTAL_TRIGGER_KEY_WIDTHS = 0.5f;
    static final float MAX_DOWNWARD_DRIFT_DP = 72f;
    static final float MAX_UPWARD_DRIFT_DP = 24f;
    static final long ROW_TRANSITION_DURATION_MS = 160L;
    static final long SETTINGS_CACHE_WINDOW_MS = 1_000L;
    static final long CONSUMED_SESSION_RECYCLE_WINDOW_MS = 250L;
    private static final String ACCESS_POINTS_BAR_ITEM_SOFT_KEY_VIEW =
            "com.google.android.libraries.inputmethod.accesspoint.widget"
                    + ".AccessPointsBarItemSoftKeyView";
    private static final String ACCESS_POINTS_BAR_VIEW =
            "com.google.android.libraries.inputmethod.accesspoint.widget.AccessPointsBar";
    private static final String PROACTIVE_SUGGESTIONS_HOLDER_VIEW =
            "com.google.android.apps.inputmethod.libs.proactivesuggestion"
                    + ".ProactiveSuggestionsHolderView";
    private static final String FIXED_CANDIDATES_ID = "softkey_holder_fixed_candidates";
    private static final String PROACTIVE_SUGGESTIONS_ID = "key_pos_proactive_suggestions";
    private static final String HEADER_ID_PREFIX = "key_pos_header_";
    private static final String KEYBOARD_HEADER_TAG = ".keyboard-header-area";
    private static final String CANDIDATES_HOLDER_SUFFIX = "CandidatesHolderView";
    static final String ROW_TRANSITION_OVERLAY_TAG =
            "gboardpatches:top-row-swipe-transition";

    static final Map<Object, SwipeSession> SESSIONS =
            Collections.synchronizedMap(new WeakHashMap<Object, SwipeSession>());
    static final Map<Object, VisibleTopRowKey> VISIBLE_TOP_ROW_KEYS =
            Collections.synchronizedMap(new WeakHashMap<Object, VisibleTopRowKey>());
    static final Map<Object, Object> ORIGINAL_KEY_METADATA_BY_PATCHED =
            Collections.synchronizedMap(new WeakHashMap<Object, Object>());
    static final Map<Object, PatchedTopRowMetadataState> TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS =
            Collections.synchronizedMap(
                    new WeakHashMap<Object, PatchedTopRowMetadataState>());

    private static final Map<TopRowLayoutKind, TopRowPage> CURRENT_PAGE_BY_LAYOUT_KIND =
            Collections.synchronizedMap(new EnumMap<TopRowLayoutKind, TopRowPage>(
                    TopRowLayoutKind.class));
    private static final Object SETTINGS_LOCK = new Object();
    private static final AtomicInteger ENGLISH_FALLBACK_LOG_COUNT = new AtomicInteger(0);
    private static final AtomicInteger ENGLISH_SESSION_LOG_COUNT = new AtomicInteger(0);
    private static final AtomicInteger SESSION_RECYCLE_LOG_COUNT = new AtomicInteger(0);
    private static final AtomicInteger SESSION_CONSUME_LOG_COUNT = new AtomicInteger(0);
    private static final AtomicInteger SESSION_APPLY_LOG_COUNT = new AtomicInteger(0);
    private static final AtomicInteger SESSION_CACHE_HIT_LOG_COUNT = new AtomicInteger(0);

    private static volatile SettingsSnapshot cachedSettingsSnapshot;

    private GboardTopRowSwipeRuntime() {
    }

    enum TopRowPage {
        STOCK,
        CUSTOM
    }

    enum TopRowLayoutKind {
        NONE,
        ZHUYIN,
        ENGLISH_QWERTY
    }

    static final class TopRowSlot {
        final int rowIndex;
        final TopRowLayoutKind layoutKind;

        TopRowSlot(int rowIndex, TopRowLayoutKind layoutKind) {
            this.rowIndex = rowIndex;
            this.layoutKind = layoutKind;
        }
    }

    static final class SwipeSession {
        final Object anchorSoftKeyView;
        final float startX;
        final float startY;
        final TopRowLayoutKind layoutKind;
        final int rowIndex;
        boolean armed;
        boolean consumed;
        TopRowPage pendingPage;
        int swipeDirectionSign;
        long consumedAtElapsedMs;

        SwipeSession(Object anchorSoftKeyView, float startX, float startY,
                TopRowLayoutKind layoutKind) {
            this(anchorSoftKeyView, startX, startY, layoutKind, -1);
        }

        SwipeSession(Object anchorSoftKeyView, float startX, float startY,
                TopRowLayoutKind layoutKind, int rowIndex) {
            this.anchorSoftKeyView = anchorSoftKeyView;
            this.startX = startX;
            this.startY = startY;
            this.layoutKind = layoutKind;
            this.rowIndex = rowIndex;
        }
    }

    static final class VisibleTopRowKey {
        final Object originalMetadata;
        final int rowIndex;
        final TopRowLayoutKind layoutKind;

        VisibleTopRowKey(Object originalMetadata, int rowIndex,
                TopRowLayoutKind layoutKind) {
            this.originalMetadata = originalMetadata;
            this.rowIndex = rowIndex;
            this.layoutKind = layoutKind;
        }
    }

    static final class PatchedTopRowMetadataState {
        final TopRowLayoutKind layoutKind;
        final int rowIndex;
        final boolean isJavaScript;
        final String quickJsScriptSource;
        final int quickJsTimeoutMs;

        PatchedTopRowMetadataState(TopRowLayoutKind layoutKind, int rowIndex, TopRowItem item) {
            this.layoutKind = layoutKind;
            this.rowIndex = rowIndex;
            this.isJavaScript = item != null && item.isJavaScript;
            this.quickJsScriptSource = isJavaScript ? item.scriptText : null;
            this.quickJsTimeoutMs = item != null
                    ? item.timeoutMs : GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MS;
        }
    }

    static final class QuickJsSlotConfig {
        final TopRowLayoutKind layoutKind;
        final int rowIndex;
        final String scriptSource;
        final int timeoutMs;

        QuickJsSlotConfig(TopRowLayoutKind layoutKind, int rowIndex, String scriptSource,
                int timeoutMs) {
            this.layoutKind = layoutKind;
            this.rowIndex = rowIndex;
            this.scriptSource = scriptSource;
            this.timeoutMs = timeoutMs;
        }
    }

    static final class RowSnapshot {
        final ViewGroup host;
        final Rect bounds;
        final Bitmap bitmap;

        RowSnapshot(ViewGroup host, Rect bounds, Bitmap bitmap) {
            this.host = host;
            this.bounds = bounds;
            this.bitmap = bitmap;
        }
    }

    static final class TopRowItem {
        final String label;
        final String commitText;
        final boolean isJavaScript;
        final String scriptText;
        final int timeoutMs;

        TopRowItem(String label, String commitText) {
            this(label, commitText, false, "", GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MS);
        }

        TopRowItem(String label, String commitText, boolean isJavaScript, String scriptText,
                int timeoutMs) {
            this.label = label;
            this.commitText = commitText;
            this.isJavaScript = isJavaScript;
            this.scriptText = scriptText;
            this.timeoutMs = timeoutMs;
        }
    }

    static final class SettingsSnapshot {
        final long loadedAtElapsedMs;
        final boolean available;
        final boolean enabled;
        final boolean zhuyinEnabled;
        final boolean englishQwertyEnabled;
        final String globalJavaScript;
        final GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits;
        final TopRowItem[] items;

        SettingsSnapshot(long loadedAtElapsedMs, boolean available, boolean enabled,
                boolean zhuyinEnabled, boolean englishQwertyEnabled, String globalJavaScript,
                GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits,
                TopRowItem[] items) {
            this.loadedAtElapsedMs = loadedAtElapsedMs;
            this.available = available;
            this.enabled = enabled;
            this.zhuyinEnabled = zhuyinEnabled;
            this.englishQwertyEnabled = englishQwertyEnabled;
            this.globalJavaScript = globalJavaScript != null ? globalJavaScript : "";
            this.javaScriptRuntimeLimits = javaScriptRuntimeLimits != null
                    ? javaScriptRuntimeLimits
                    : GboardTopRowSwipeSettings.defaultJavaScriptRuntimeLimits();
            this.items = items;
        }
    }

    public static Object patchIncomingSoftKeyMetadata(Object receiver, Object keyMetadata) {
        if (!(receiver instanceof View view) || keyMetadata == null) {
            return keyMetadata;
        }
        if (TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.containsKey(keyMetadata)) {
            return keyMetadata;
        }
        try {
            ClassLoader classLoader = receiver.getClass().getClassLoader();
            if (classLoader == null) {
                return keyMetadata;
            }
            GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles =
                    GboardTopRowSwipeRuntimeSupport.reflectionHandles(classLoader);
            Object originalMetadata = resolveOriginalKeyMetadata(keyMetadata);
            GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior =
                    GboardTopRowSwipeRuntimeSupport.inspectKeyBehavior(handles, originalMetadata);
            SettingsSnapshot snapshot = settingsSnapshot(view.getContext());
            TopRowSlot customTopRowSlot =
                    topRowSlotForCustomPage(snapshot, view, behavior);
            if (customTopRowSlot == null) {
                return keyMetadata;
            }
            TopRowItem topRowItem = customTopRowItem(snapshot, customTopRowSlot.rowIndex);
            Object builder = handles.keyMetadataBuilderConstructor.newInstance();
            handles.copyKeyMetadataMethod.invoke(builder, originalMetadata);
            GboardTopRowSwipeRuntimeSupport.LabelSet labelSet =
                    GboardTopRowSwipeRuntimeSupport.appendOrReplaceTextLabelIds(
                            handles.extractKeyLabelIds(originalMetadata),
                            handles.extractKeyLabelTexts(originalMetadata),
                            GboardTopRowSwipeRuntimeSupport.PRIMARY_LABEL_VIEW_ID,
                            topRowItem.label);
            handles.setKeyLabelTextsMethod.invoke(builder, labelSet.ids, labelSet.texts);
            String actionPayload = topRowItem.isJavaScript
                    ? QUICK_JS_PAYLOAD_PREFIX
                    : topRowItem.commitText;
            Object pressAction = handles.buildPlainTextAction(handles.pressActionType,
                    actionPayload, topRowItem.label);
            if (pressAction == null) {
                return keyMetadata;
            }
            handles.replaceActionOnKeyMetadataBuilder(builder, handles.pressActionType,
                    pressAction);
            Object patched = handles.buildKeyMetadataMethod.invoke(builder);
            if (patched != null) {
                ORIGINAL_KEY_METADATA_BY_PATCHED.put(patched, originalMetadata);
                TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.put(
                        patched,
                        new PatchedTopRowMetadataState(
                                customTopRowSlot.layoutKind,
                                customTopRowSlot.rowIndex,
                                topRowItem));
                return patched;
            }
        } catch (Throwable ignored) {
            // Fail closed and keep stock metadata.
        }
        return keyMetadata;
    }

    public static void afterSoftKeyBound(Object receiver, Object keyMetadata) {
        if (!(receiver instanceof View view)) {
            return;
        }
        try {
            Object originalMetadata = resolveOriginalKeyMetadata(keyMetadata);
            if (originalMetadata == null) {
                VISIBLE_TOP_ROW_KEYS.remove(receiver);
                return;
            }
            ClassLoader classLoader = receiver.getClass().getClassLoader();
            if (classLoader == null) {
                VISIBLE_TOP_ROW_KEYS.remove(receiver);
                return;
            }
            GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles =
                    GboardTopRowSwipeRuntimeSupport.reflectionHandles(classLoader);
            GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior =
                    GboardTopRowSwipeRuntimeSupport.inspectKeyBehavior(handles, originalMetadata);
            TopRowSlot slot = topRowSlotForViewAndBehavior(view, behavior);
            if (slot == null || !isLayoutEnabled(view.getContext(), slot.layoutKind)) {
                VISIBLE_TOP_ROW_KEYS.remove(receiver);
                return;
            }
            VISIBLE_TOP_ROW_KEYS.put(receiver,
                    new VisibleTopRowKey(originalMetadata, slot.rowIndex, slot.layoutKind));
        } catch (Throwable ignored) {
            VISIBLE_TOP_ROW_KEYS.remove(receiver);
        }
    }

    public static Object maybeArmAndResolveTopRowOwner(Object tracker, Object incomingSoftKeyView,
            Object hitSoftKeyView, float x, float y) {
        if (tracker == null) {
            return incomingSoftKeyView;
        }
        long now = SystemClock.elapsedRealtime();
        SwipeSession session = SESSIONS.get(tracker);
        if (shouldRecycleSessionForIncomingView(session, incomingSoftKeyView, hitSoftKeyView)) {
            logLimited(SESSION_RECYCLE_LOG_COUNT,
                    "recycle-detached"
                            + " tracker=" + trackerId(tracker)
                            + " layout=" + session.layoutKind);
            clearSwipeSession(tracker);
            session = null;
        }
        if (shouldRecycleConsumedSession(now, session)) {
            logLimited(SESSION_RECYCLE_LOG_COUNT,
                    "recycle"
                            + " tracker=" + trackerId(tracker)
                            + " layout=" + session.layoutKind
                            + " ageMs=" + (now - session.consumedAtElapsedMs)
                            + " pendingPage=" + session.pendingPage);
            clearSwipeSession(tracker);
            session = null;
        }
        if (session == null) {
            Object candidateOwner = incomingSoftKeyView instanceof View
                    ? incomingSoftKeyView : hitSoftKeyView;
            if (!(candidateOwner instanceof View candidateView)) {
                return incomingSoftKeyView;
            }
            try {
                SettingsSnapshot snapshot = settingsSnapshot(candidateView.getContext());
                if (!snapshot.enabled) {
                    return incomingSoftKeyView;
                }
                ClassLoader classLoader = candidateOwner.getClass().getClassLoader();
                if (classLoader == null) {
                    return incomingSoftKeyView;
                }
                GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles =
                        GboardTopRowSwipeRuntimeSupport.reflectionHandles(classLoader);
                TopRowSlot slot = topRowSlotFromVisibleCache(candidateOwner);
                GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior = null;
                if (slot == null) {
                    Object currentKeyMetadata = handles.softKeyMetadataField.get(candidateOwner);
                    Object originalKeyMetadata = resolveOriginalKeyMetadata(currentKeyMetadata);
                    behavior = GboardTopRowSwipeRuntimeSupport.inspectKeyBehavior(handles,
                            originalKeyMetadata);
                    slot = topRowSlotForViewAndBehavior(candidateView, behavior);
                } else {
                    logLimited(SESSION_CACHE_HIT_LOG_COUNT,
                            "cache-hit"
                                    + " viewId=" + GboardTopRowSwipeRuntimeSupport.safeViewName(candidateView)
                                    + " rowIndex=" + slot.rowIndex
                                    + " layout=" + slot.layoutKind);
                }
                if (slot == null || !isLayoutEnabled(snapshot, slot.layoutKind)) {
                    maybeLogEnglishCandidateMiss(candidateView, behavior, snapshot);
                    return incomingSoftKeyView;
                }
                SESSIONS.put(tracker, new SwipeSession(
                        candidateOwner, x, y, slot.layoutKind, slot.rowIndex));
                maybeLogEnglishSessionCreate(candidateView, behavior, slot);
                return incomingSoftKeyView;
            } catch (Throwable ignored) {
                return incomingSoftKeyView;
            }
        }

        if (session.armed || session.consumed) {
            return session.armed ? session.anchorSoftKeyView : incomingSoftKeyView;
        }
        if (!(session.anchorSoftKeyView instanceof View anchorView)) {
            clearSwipeSession(tracker);
            return incomingSoftKeyView;
        }
        float dx = x - session.startX;
        float dy = y - session.startY;
        float horizontal = Math.abs(dx);
        float down = Math.max(0f, dy);
        float up = Math.max(0f, -dy);
        float horizontalTriggerPx = Math.max(
                dpToPx(anchorView, HORIZONTAL_TRIGGER_DP),
                anchorView.getWidth() * HORIZONTAL_TRIGGER_KEY_WIDTHS);
        float maxDownwardDriftPx = dpToPx(anchorView, MAX_DOWNWARD_DRIFT_DP);
        float maxUpwardDriftPx = dpToPx(anchorView, MAX_UPWARD_DRIFT_DP);
        if (horizontal >= horizontalTriggerPx
                && down <= maxDownwardDriftPx
                && up <= maxUpwardDriftPx) {
            session.armed = true;
            session.swipeDirectionSign = dx >= 0f ? 1 : -1;
            return session.anchorSoftKeyView;
        }
        return incomingSoftKeyView;
    }

    public static void clearSwipeSession(Object tracker) {
        if (tracker == null) {
            return;
        }
        SwipeSession removed = SESSIONS.remove(tracker);
        if (removed != null) {
            applyPendingPageIfNeeded(removed);
        }
    }

    public static boolean maybeConsumeTopRowSwipe(Object gestureDispatcher, Object tracker,
            Object action, Object keyMetadata) {
        if (isTopRowCustomPatchedMetadata(keyMetadata)) {
            Context context = null;
            try {
                ClassLoader classLoader = gestureDispatcher != null
                        ? gestureDispatcher.getClass().getClassLoader() : null;
                if (classLoader != null) {
                    GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles =
                            GboardTopRowSwipeRuntimeSupport.reflectionHandles(classLoader);
                    context = handles.extractGestureDispatcherContext(gestureDispatcher);
                }
            } catch (Throwable ignored) {
                context = null;
            }
            if (shouldConsumeDisabledTopRowCustomDispatch(context, keyMetadata)) {
                return true;
            }
        }

        SwipeSession session = SESSIONS.get(tracker);
        if (session == null || !session.armed || session.consumed) {
            return false;
        }
        Context context = session.anchorSoftKeyView instanceof View view
                ? view.getContext() : null;
        if (!isLayoutEnabled(context, session.layoutKind)) {
            return false;
        }
        session.consumed = true;
        session.consumedAtElapsedMs = SystemClock.elapsedRealtime();
        session.pendingPage = toggledPage(currentPage(session.layoutKind));
        logLimited(SESSION_CONSUME_LOG_COUNT,
                "consume"
                        + " tracker=" + trackerId(tracker)
                        + " layout=" + session.layoutKind
                        + " pendingPage=" + session.pendingPage);
        return true;
    }

    public static boolean maybeConsumeQuickJsTopRowPress(Object gestureDispatcher,
            Object action, Object keyMetadata) {
        return maybeConsumeQuickJsTopRowPress(
                gestureDispatcher, null, action, null, keyMetadata);
    }

    public static boolean maybeConsumeQuickJsTopRowPress(Object gestureDispatcher,
            Object tracker, Object action, Object actionData, Object keyMetadata) {
        if (!(action instanceof Enum<?> actionEnum) || !"PRESS".equals(actionEnum.name())) {
            return false;
        }
        try {
            ClassLoader classLoader = gestureDispatcher != null
                    ? gestureDispatcher.getClass().getClassLoader() : null;
            if (classLoader == null) {
                return false;
            }
            GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles =
                    GboardTopRowSwipeRuntimeSupport.reflectionHandles(classLoader);
            boolean quickJsMarkerPayload =
                    hasQuickJsMarkerPayload(handles, actionData, keyMetadata);
            QuickJsSlotConfig config = quickJsSlotConfig(keyMetadata);
            if (config == null && quickJsMarkerPayload) {
                config = quickJsSlotConfigFromSession(handles, tracker, gestureDispatcher);
            }
            return GboardQuickJsFeature.maybeConsumeQuickJsTopRowPress(
                    null, handles, gestureDispatcher, config, quickJsMarkerPayload);
        } catch (Throwable ignored) {
            return false;
        }
    }

    static SettingsSnapshot settingsSnapshot(Context context) {
        long now = SystemClock.elapsedRealtime();
        SettingsSnapshot cached = cachedSettingsSnapshot;
        if (cached != null && cached.available
                && now - cached.loadedAtElapsedMs <= SETTINGS_CACHE_WINDOW_MS) {
            return cached;
        }
        SettingsSnapshot loaded;
        synchronized (SETTINGS_LOCK) {
            SettingsSnapshot current = cachedSettingsSnapshot;
            if (current != null && current.available
                    && now - current.loadedAtElapsedMs <= SETTINGS_CACHE_WINDOW_MS) {
                return current;
            }
            loaded = loadSettingsSnapshot(context, now);
            cachedSettingsSnapshot = loaded.available ? loaded : null;
        }
        applySettingsSnapshotRuntimeState(loaded);
        return loaded;
    }

    static void clearSettingsSnapshotCache() {
        synchronized (SETTINGS_LOCK) {
            cachedSettingsSnapshot = null;
        }
    }

    static SettingsSnapshot settingsSnapshotFromProviderValues(Boolean enabled,
            Boolean zhuyinEnabled,
            Boolean englishQwertyEnabled,
            List<String> displays,
            List<String> commits,
            long loadedAtElapsedMs) {
        return settingsSnapshotFromProviderValues(
                enabled,
                zhuyinEnabled,
                englishQwertyEnabled,
                displays,
                commits,
                new boolean[GboardTopRowSwipeSettings.SLOT_COUNT],
                defaultScriptTexts(),
                defaultTimeouts(),
                "",
                GboardTopRowSwipeSettings.DEFAULT_RESPONSE_BODY_LIMIT_BYTES,
                GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MAX_MS,
                GboardTopRowSwipeSettings.DEFAULT_MEMORY_LIMIT_BYTES,
                GboardTopRowSwipeSettings.DEFAULT_MAX_STACK_BYTES,
                loadedAtElapsedMs);
    }

    static SettingsSnapshot settingsSnapshotFromProviderValues(Boolean enabled,
            Boolean zhuyinEnabled,
            Boolean englishQwertyEnabled,
            List<String> displays,
            List<String> commits,
            boolean[] isJavaScripts,
            List<String> scripts,
            int[] timeouts,
            String globalJavaScript,
            int responseBodyLimitBytes,
            int timeoutMaxMs,
            int memoryLimitBytes,
            int maxStackBytes,
            long loadedAtElapsedMs) {
        if (enabled == null
                || zhuyinEnabled == null
                || englishQwertyEnabled == null
                || !hasExactlySlotCount(displays)
                || !hasExactlySlotCount(commits)
                || !hasExactlySlotCount(isJavaScripts)
                || !hasExactlySlotCount(scripts)
                || !hasExactlySlotCount(timeouts)
                || !hasOnlyNonBlankText(displays)
                || !hasOnlyText(commits)
                || !hasOnlyText(scripts)) {
            return unavailableSettingsSnapshot(loadedAtElapsedMs);
        }
        GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits =
                GboardTopRowSwipeSettings.sanitizeJavaScriptRuntimeLimits(
                        new GboardTopRowSwipeSettings.JavaScriptRuntimeLimits(
                                responseBodyLimitBytes,
                                timeoutMaxMs,
                                memoryLimitBytes,
                                maxStackBytes));
        return new SettingsSnapshot(
                loadedAtElapsedMs,
                true,
                enabled.booleanValue(),
                zhuyinEnabled.booleanValue(),
                englishQwertyEnabled.booleanValue(),
                globalJavaScript != null ? globalJavaScript : "",
                javaScriptRuntimeLimits,
                itemsFromSlots(GboardTopRowSwipeSettings.sanitizeSlots(
                        displays,
                        commits,
                        boxedBooleans(isJavaScripts),
                        scripts,
                        boxedIntegers(timeouts),
                        javaScriptRuntimeLimits.timeoutMaxMs)));
    }

    static TopRowPage currentPage(TopRowLayoutKind layoutKind) {
        if (layoutKind == null || layoutKind == TopRowLayoutKind.NONE) {
            return TopRowPage.STOCK;
        }
        synchronized (CURRENT_PAGE_BY_LAYOUT_KIND) {
            TopRowPage page = CURRENT_PAGE_BY_LAYOUT_KIND.get(layoutKind);
            return page != null ? page : TopRowPage.STOCK;
        }
    }

    static void setCurrentPage(TopRowLayoutKind layoutKind, TopRowPage page) {
        if (layoutKind == null || layoutKind == TopRowLayoutKind.NONE || page == null) {
            return;
        }
        CURRENT_PAGE_BY_LAYOUT_KIND.put(layoutKind, page);
    }

    static TopRowPage toggledPage(TopRowPage page) {
        return page == TopRowPage.STOCK ? TopRowPage.CUSTOM : TopRowPage.STOCK;
    }

    static TopRowLayoutKind topRowLayoutKindForSlot(int rowIndex,
            GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind legacyKeyboardKind,
            String primaryLabel) {
        if (rowIndex < 0 || rowIndex >= GboardTopRowSwipeRuntimeSupport.TOP_ROW_SLOT_VIEW_NAMES.length) {
            return TopRowLayoutKind.NONE;
        }
        if (legacyKeyboardKind == GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ZHUYIN) {
            return TopRowLayoutKind.ZHUYIN;
        }
        String normalizedLabel =
                GboardTopRowSwipeRuntimeSupport.asciiLowercase(primaryLabel);
        if (GboardTopRowSwipeRuntimeSupport.ENGLISH_QWERTY_TOP_ROW_LABELS[rowIndex]
                .equals(normalizedLabel)) {
            return TopRowLayoutKind.ENGLISH_QWERTY;
        }
        return TopRowLayoutKind.NONE;
    }

    static TopRowSlot topRowSlotForViewAndBehavior(View view,
            GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior) {
        if (view == null || behavior == null || isDisallowedTopRowSurface(view)) {
            return null;
        }
        String englishDetectionLabel = englishQwertyDetectionLabel(behavior);
        int rowIndex = GboardTopRowSwipeRuntimeSupport.topRowSlotIndexForView(view);
        if (rowIndex >= 0) {
            TopRowLayoutKind layoutKind = topRowLayoutKindForSlot(
                    rowIndex, behavior.legacyKeyboardKind, englishDetectionLabel);
            if (layoutKind != TopRowLayoutKind.NONE) {
                return new TopRowSlot(rowIndex, layoutKind);
            }
        }
        if (behavior.legacyKeyboardKind
                == GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ENGLISH_QWERTY) {
            return topRowSlotForEnglishQwertyLabelFallback(isConfirmedVisualFirstRow(view),
                    behavior);
        }
        return null;
    }

    static TopRowSlot topRowSlotForEnglishQwertyLabelFallback(
            boolean visualFirstRowConfirmed,
            GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior) {
        if (behavior == null
                || behavior.legacyKeyboardKind
                        == GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ZHUYIN) {
            return null;
        }
        int englishRowIndex =
                GboardTopRowSwipeRuntimeSupport.englishQwertyTopRowIndexForLabel(
                        englishQwertyDetectionLabel(behavior));
        if (englishRowIndex < 0) {
            return null;
        }
        if (behavior.legacyKeyboardKind
                == GboardTopRowSwipeRuntimeSupport.LegacyKeyboardKind.ENGLISH_QWERTY) {
            return new TopRowSlot(englishRowIndex, TopRowLayoutKind.ENGLISH_QWERTY);
        }
        if (!visualFirstRowConfirmed) {
            return null;
        }
        return new TopRowSlot(englishRowIndex, TopRowLayoutKind.ENGLISH_QWERTY);
    }

    private static String englishQwertyDetectionLabel(
            GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior) {
        if (behavior == null) {
            return null;
        }
        if (behavior.primaryLabel != null && !behavior.primaryLabel.isBlank()) {
            return behavior.primaryLabel;
        }
        if (behavior.pressText != null && !behavior.pressText.isBlank()) {
            return behavior.pressText;
        }
        return null;
    }

    static TopRowSlot topRowSlotFromVisibleCache(Object softKeyView) {
        VisibleTopRowKey visible = VISIBLE_TOP_ROW_KEYS.get(softKeyView);
        if (visible == null || visible.layoutKind == null
                || visible.layoutKind == TopRowLayoutKind.NONE) {
            return null;
        }
        if (currentPage(visible.layoutKind) != TopRowPage.CUSTOM) {
            return null;
        }
        return new TopRowSlot(visible.rowIndex, visible.layoutKind);
    }

    static boolean shouldRecycleConsumedSession(long now, SwipeSession session) {
        return session != null
                && session.consumed
                && session.consumedAtElapsedMs > 0L
                && now - session.consumedAtElapsedMs >= CONSUMED_SESSION_RECYCLE_WINDOW_MS;
    }

    static boolean shouldRecycleSessionForIncomingView(SwipeSession session,
            Object incomingSoftKeyView, Object hitSoftKeyView) {
        if (session == null) {
            return false;
        }
        if (!(session.anchorSoftKeyView instanceof View anchorView)) {
            return true;
        }
        if (!anchorView.isAttachedToWindow()) {
            return true;
        }
        Object candidateOwner = incomingSoftKeyView instanceof View
                ? incomingSoftKeyView : hitSoftKeyView;
        if (!(candidateOwner instanceof View candidateView)) {
            return false;
        }
        if (!candidateView.isAttachedToWindow()) {
            return false;
        }
        return anchorView.getRootView() != candidateView.getRootView();
    }

    private static void maybeLogEnglishCandidateMiss(View candidateView,
            GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior,
            SettingsSnapshot snapshot) {
        if (candidateView == null || behavior == null) {
            return;
        }
        String detectionLabel = englishQwertyDetectionLabel(behavior);
        int viewSlotIndex = GboardTopRowSwipeRuntimeSupport.topRowSlotIndexForView(candidateView);
        boolean visualFirstRow = isConfirmedVisualFirstRow(candidateView);
        boolean englishLikeLabel =
                GboardTopRowSwipeRuntimeSupport.englishQwertyTopRowIndexForLabel(
                        detectionLabel) >= 0;
        if (!englishLikeLabel && viewSlotIndex < 0 && !visualFirstRow) {
            return;
        }
        logLimited(ENGLISH_FALLBACK_LOG_COUNT,
                "miss"
                        + " viewId=" + GboardTopRowSwipeRuntimeSupport.safeViewName(candidateView)
                        + " slotIndex=" + viewSlotIndex
                        + " visualFirstRow=" + visualFirstRow
                        + " primaryLabel=" + behavior.primaryLabel
                        + " pressText=" + behavior.pressText
                        + " detectionLabel=" + detectionLabel
                        + " legacyKind=" + behavior.legacyKeyboardKind
                        + " englishEnabled=" + (snapshot != null && snapshot.englishQwertyEnabled));
    }

    private static void maybeLogEnglishSessionCreate(View candidateView,
            GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior,
            TopRowSlot slot) {
        if (candidateView == null || behavior == null || slot == null
                || slot.layoutKind != TopRowLayoutKind.ENGLISH_QWERTY) {
            return;
        }
        logLimited(ENGLISH_SESSION_LOG_COUNT,
                "armed"
                        + " viewId=" + GboardTopRowSwipeRuntimeSupport.safeViewName(candidateView)
                        + " rowIndex=" + slot.rowIndex
                        + " primaryLabel=" + behavior.primaryLabel
                        + " pressText=" + behavior.pressText
                        + " detectionLabel=" + englishQwertyDetectionLabel(behavior)
                        + " legacyKind=" + behavior.legacyKeyboardKind);
    }

    private static void logLimited(AtomicInteger counter, String message) {
        int current = counter.incrementAndGet();
        if (current <= 40) {
            Log.i(TAG, message + " [count=" + current + "]");
        }
    }

    private static String trackerId(Object tracker) {
        return tracker == null ? "<null>" : Integer.toHexString(System.identityHashCode(tracker));
    }

    static boolean isConfirmedVisualFirstRow(View candidateView) {
        if (!isUsableVisibleTopRowView(candidateView, null)
                || isDisallowedTopRowSurface(candidateView)) {
            return false;
        }
        View rootView = candidateView.getRootView();
        if (!(rootView instanceof ViewGroup rootGroup)) {
            return false;
        }

        List<View> sameClassViews = new ArrayList<View>();
        collectUsableSameClassViews(rootGroup, candidateView.getClass(), sameClassViews);
        if (sameClassViews.size() < GboardTopRowSwipeRuntimeSupport.TOP_ROW_SLOT_VIEW_NAMES.length) {
            return false;
        }

        int[] candidateLocation = new int[2];
        candidateView.getLocationOnScreen(candidateLocation);
        int candidateTop = candidateLocation[1];
        int minTop = Integer.MAX_VALUE;
        for (View sameClassView : sameClassViews) {
            int[] location = new int[2];
            sameClassView.getLocationOnScreen(location);
            minTop = Math.min(minTop, location[1]);
        }
        if (minTop == Integer.MAX_VALUE) {
            return false;
        }
        int sameRowTolerancePx = Math.max(2, candidateView.getHeight() / 4);
        return Math.abs(candidateTop - minTop) <= sameRowTolerancePx;
    }

    static boolean shouldAllowTopRowCustomPatchedDispatch(SettingsSnapshot snapshot,
            TopRowLayoutKind layoutKind) {
        return isLayoutEnabled(snapshot, layoutKind)
                && currentPage(layoutKind) == TopRowPage.CUSTOM;
    }

    static void markTopRowCustomPatchedMetadata(Object keyMetadata, TopRowLayoutKind layoutKind) {
        if (keyMetadata == null || layoutKind == null || layoutKind == TopRowLayoutKind.NONE) {
            return;
        }
        TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.put(
                keyMetadata,
                new PatchedTopRowMetadataState(layoutKind, -1, null));
    }

    static String globalJavaScript(Context context) {
        SettingsSnapshot snapshot = settingsSnapshot(context);
        return snapshot != null ? snapshot.globalJavaScript : "";
    }

    static GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits(
            Context context) {
        SettingsSnapshot snapshot = settingsSnapshot(context);
        return snapshot != null
                ? snapshot.javaScriptRuntimeLimits
                : GboardTopRowSwipeSettings.defaultJavaScriptRuntimeLimits();
    }

    static boolean shouldConsumeDisabledTopRowCustomDispatch(Context context,
            Object keyMetadata) {
        if (!isTopRowCustomPatchedMetadata(keyMetadata)) {
            return false;
        }
        if (context == null) {
            clearSettingsSnapshotCache();
            resetRuntimeStateForUnavailable();
            return true;
        }
        SettingsSnapshot snapshot = loadSettingsSnapshot(context, SystemClock.elapsedRealtime());
        synchronized (SETTINGS_LOCK) {
            cachedSettingsSnapshot = snapshot;
        }
        applySettingsSnapshotRuntimeState(snapshot);
        return shouldConsumeDisabledTopRowCustomDispatch(snapshot, keyMetadata);
    }

    static boolean shouldConsumeDisabledTopRowCustomDispatch(SettingsSnapshot snapshot,
            Object keyMetadata) {
        if (!isTopRowCustomPatchedMetadata(keyMetadata)) {
            return false;
        }
        PatchedTopRowMetadataState metadataState =
                TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.get(keyMetadata);
        TopRowLayoutKind layoutKind = metadataState != null
                ? metadataState.layoutKind : TopRowLayoutKind.NONE;
        if (shouldAllowTopRowCustomPatchedDispatch(snapshot, layoutKind)) {
            return false;
        }
        resetRuntimeStateForLayout(layoutKind);
        return true;
    }

    public static Object resolveOriginalKeyMetadataForPatchInterop(Object keyMetadata) {
        Object originalMetadata = ORIGINAL_KEY_METADATA_BY_PATCHED.get(keyMetadata);
        return originalMetadata != null ? originalMetadata : keyMetadata;
    }

    private static Object resolveOriginalKeyMetadata(Object keyMetadata) {
        return resolveOriginalKeyMetadataForPatchInterop(keyMetadata);
    }

    private static boolean isTopRowCustomPatchedMetadata(Object keyMetadata) {
        return TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.containsKey(keyMetadata);
    }

    static QuickJsSlotConfig quickJsSlotConfig(Object keyMetadata) {
        PatchedTopRowMetadataState metadataState =
                TOP_ROW_CUSTOM_PATCHED_METADATA_MARKERS.get(keyMetadata);
        if (metadataState == null || !metadataState.isJavaScript) {
            return null;
        }
        return new QuickJsSlotConfig(
                metadataState.layoutKind,
                metadataState.rowIndex,
                metadataState.quickJsScriptSource,
                metadataState.quickJsTimeoutMs);
    }

    static QuickJsSlotConfig quickJsSlotConfigFromSession(
            SettingsSnapshot snapshot, Object tracker) {
        SwipeSession session = SESSIONS.get(tracker);
        return quickJsSlotConfigFromSession(snapshot, session);
    }

    private static QuickJsSlotConfig quickJsSlotConfigFromSession(
            GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles,
            Object tracker,
            Object gestureDispatcher) throws Throwable {
        SwipeSession session = SESSIONS.get(tracker);
        if (session == null) {
            return null;
        }
        if (session.anchorSoftKeyView != null && handles != null) {
            try {
                Object currentKeyMetadata =
                        handles.softKeyMetadataField.get(session.anchorSoftKeyView);
                QuickJsSlotConfig config = quickJsSlotConfig(currentKeyMetadata);
                if (config != null) {
                    return config;
                }
            } catch (Throwable ignored) {
                // Fall back to the session row and current settings below.
            }
        }
        Context context = session.anchorSoftKeyView instanceof View view
                ? view.getContext() : null;
        if (context == null && handles != null) {
            context = handles.extractGestureDispatcherContext(gestureDispatcher);
        }
        return quickJsSlotConfigFromSession(settingsSnapshot(context), session);
    }

    private static QuickJsSlotConfig quickJsSlotConfigFromSession(
            SettingsSnapshot snapshot, SwipeSession session) {
        if (snapshot == null || session == null
                || session.rowIndex < 0
                || session.layoutKind == null
                || session.layoutKind == TopRowLayoutKind.NONE
                || currentPage(session.layoutKind) != TopRowPage.CUSTOM
                || !isLayoutEnabled(snapshot, session.layoutKind)) {
            return null;
        }
        TopRowItem item = customTopRowItem(snapshot, session.rowIndex);
        if (item == null || !item.isJavaScript) {
            return null;
        }
        return new QuickJsSlotConfig(
                session.layoutKind,
                session.rowIndex,
                item.scriptText,
                item.timeoutMs);
    }

    private static boolean hasQuickJsMarkerPayload(
            GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles,
            Object actionData,
            Object keyMetadata) throws Throwable {
        if (QUICK_JS_PAYLOAD_PREFIX.equals(handles.extractActionDataPayload(actionData))) {
            return true;
        }
        Object pressAction = handles.findExactAction(keyMetadata, handles.pressActionType);
        return QUICK_JS_PAYLOAD_PREFIX.equals(handles.extractSinglePayloadToken(pressAction));
    }

    private static boolean isLayoutEnabled(Context context, TopRowLayoutKind layoutKind) {
        return isLayoutEnabled(settingsSnapshot(context), layoutKind);
    }

    private static boolean isLayoutEnabled(SettingsSnapshot snapshot,
            TopRowLayoutKind layoutKind) {
        if (snapshot == null || !snapshot.enabled || layoutKind == null) {
            return false;
        }
        return switch (layoutKind) {
            case ZHUYIN -> snapshot.zhuyinEnabled;
            case ENGLISH_QWERTY -> snapshot.englishQwertyEnabled;
            case NONE -> false;
        };
    }

    private static TopRowSlot topRowSlotForCustomPage(SettingsSnapshot snapshot, View view,
            GboardTopRowSwipeRuntimeSupport.KeyBehavior behavior) {
        if (snapshot == null || !snapshot.enabled) {
            return null;
        }
        TopRowSlot slot = topRowSlotForViewAndBehavior(view, behavior);
        if (slot == null
                || !isLayoutEnabled(snapshot, slot.layoutKind)
                || currentPage(slot.layoutKind) != TopRowPage.CUSTOM) {
            return null;
        }
        return slot;
    }

    private static TopRowItem customTopRowItem(SettingsSnapshot snapshot, int rowIndex) {
        if (snapshot == null || rowIndex < 0 || rowIndex >= snapshot.items.length) {
            return defaultTopRowItem(rowIndex);
        }
        TopRowItem item = snapshot.items[rowIndex];
        return item != null ? item : defaultTopRowItem(rowIndex);
    }

    private static SettingsSnapshot loadSettingsSnapshot(Context context, long now) {
        if (context == null) {
            return unavailableSettingsSnapshot(now);
        }
        try {
            Bundle result = context.getContentResolver().call(
                    Uri.parse("content://" + context.getPackageName()
                            + GboardPatchesSettingsProvider.AUTHORITY_SUFFIX),
                    GboardTopRowSwipeSettings.METHOD_GET_TOP_ROW_SWIPE_SETTINGS,
                    null,
                    null);
            if (result == null) {
                return unavailableSettingsSnapshot(now);
            }
            Boolean enabled = result.containsKey(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_ENABLED)
                            ? Boolean.valueOf(result.getBoolean(
                                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_ENABLED,
                                    false))
                            : null;
            Boolean zhuyinEnabled = result.containsKey(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_ZHUYIN_ENABLED)
                            ? Boolean.valueOf(result.getBoolean(
                                    GboardTopRowSwipeSettings
                                            .BUNDLE_KEY_TOP_ROW_SWIPE_ZHUYIN_ENABLED,
                                    false))
                            : null;
            Boolean englishQwertyEnabled = result.containsKey(
                    GboardTopRowSwipeSettings
                            .BUNDLE_KEY_TOP_ROW_SWIPE_ENGLISH_QWERTY_ENABLED)
                                    ? Boolean.valueOf(result.getBoolean(
                                            GboardTopRowSwipeSettings
                                                    .BUNDLE_KEY_TOP_ROW_SWIPE_ENGLISH_QWERTY_ENABLED,
                                            false))
                                    : null;
            ArrayList<String> displays = result.getStringArrayList(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_DISPLAY_TEXTS);
            ArrayList<String> commits = result.getStringArrayList(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_COMMIT_TEXTS);
            boolean[] isJavaScripts = result.getBooleanArray(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_IS_JAVA_SCRIPT);
            ArrayList<String> scripts = result.getStringArrayList(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_SCRIPT_TEXTS);
            int[] timeouts = result.getIntArray(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_TIMEOUTS_MS);
            String globalJavaScript = result.getString(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_GLOBAL_JAVA_SCRIPT);
            int responseBodyLimitBytes = result.getInt(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_JS_RESPONSE_BODY_LIMIT_BYTES,
                    GboardTopRowSwipeSettings.DEFAULT_RESPONSE_BODY_LIMIT_BYTES);
            int timeoutMaxMs = result.getInt(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_JS_TIMEOUT_MAX_MS,
                    GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MAX_MS);
            int memoryLimitBytes = result.getInt(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_JS_MEMORY_LIMIT_BYTES,
                    GboardTopRowSwipeSettings.DEFAULT_MEMORY_LIMIT_BYTES);
            int maxStackBytes = result.getInt(
                    GboardTopRowSwipeSettings.BUNDLE_KEY_TOP_ROW_SWIPE_JS_MAX_STACK_BYTES,
                    GboardTopRowSwipeSettings.DEFAULT_MAX_STACK_BYTES);
            return settingsSnapshotFromProviderValues(enabled, zhuyinEnabled,
                    englishQwertyEnabled, displays, commits, isJavaScripts, scripts, timeouts,
                    globalJavaScript, responseBodyLimitBytes, timeoutMaxMs, memoryLimitBytes,
                    maxStackBytes, now);
        } catch (Throwable ignored) {
            return unavailableSettingsSnapshot(now);
        }
    }

    private static SettingsSnapshot unavailableSettingsSnapshot(long loadedAtElapsedMs) {
        return new SettingsSnapshot(loadedAtElapsedMs, false, false, false, false, "",
                GboardTopRowSwipeSettings.defaultJavaScriptRuntimeLimits(),
                defaultTopRowItems());
    }

    private static TopRowItem[] defaultTopRowItems() {
        TopRowItem[] items = new TopRowItem[GboardTopRowSwipeSettings.SLOT_COUNT];
        List<GboardTopRowSwipeSettings.SlotText> defaults =
                GboardTopRowSwipeSettings.defaultSlots();
        for (int index = 0; index < items.length; index++) {
            GboardTopRowSwipeSettings.SlotText slot = defaults.get(index);
            items[index] = new TopRowItem(slot.displayText, slot.commitText);
        }
        return items;
    }

    private static TopRowItem[] itemsFromSlots(
            List<GboardTopRowSwipeSettings.SlotText> slots) {
        TopRowItem[] items = defaultTopRowItems();
        if (slots == null) {
            return items;
        }
        int count = Math.min(items.length, slots.size());
        for (int index = 0; index < count; index++) {
            GboardTopRowSwipeSettings.SlotText slot = slots.get(index);
            if (slot != null) {
                items[index] = new TopRowItem(
                        slot.displayText,
                        slot.commitText,
                        slot.isJavaScript,
                        slot.scriptText,
                        slot.timeoutMs);
            }
        }
        return items;
    }

    private static TopRowItem defaultTopRowItem(int rowIndex) {
        TopRowItem[] defaults = defaultTopRowItems();
        if (rowIndex >= 0 && rowIndex < defaults.length) {
            return defaults[rowIndex];
        }
        return defaults[0];
    }

    private static boolean hasExactlySlotCount(List<String> values) {
        return values != null && values.size() == GboardTopRowSwipeSettings.SLOT_COUNT;
    }

    private static boolean hasExactlySlotCount(boolean[] values) {
        return values != null && values.length == GboardTopRowSwipeSettings.SLOT_COUNT;
    }

    private static boolean hasExactlySlotCount(int[] values) {
        return values != null && values.length == GboardTopRowSwipeSettings.SLOT_COUNT;
    }

    private static boolean hasOnlyNonBlankText(List<String> values) {
        if (values == null) {
            return false;
        }
        for (String value : values) {
            if (value == null || value.trim().isEmpty()) {
                return false;
            }
        }
        return true;
    }

    private static boolean hasOnlyText(List<String> values) {
        if (values == null) {
            return false;
        }
        for (String value : values) {
            if (value == null) {
                return false;
            }
        }
        return true;
    }

    private static List<Boolean> boxedBooleans(boolean[] values) {
        ArrayList<Boolean> boxed = new ArrayList<Boolean>(values.length);
        for (boolean value : values) {
            boxed.add(Boolean.valueOf(value));
        }
        return boxed;
    }

    private static List<String> defaultScriptTexts() {
        ArrayList<String> scripts = new ArrayList<String>(GboardTopRowSwipeSettings.SLOT_COUNT);
        for (int index = 0; index < GboardTopRowSwipeSettings.SLOT_COUNT; index++) {
            scripts.add("");
        }
        return scripts;
    }

    private static int[] defaultTimeouts() {
        int[] timeouts = new int[GboardTopRowSwipeSettings.SLOT_COUNT];
        for (int index = 0; index < timeouts.length; index++) {
            timeouts[index] = GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MS;
        }
        return timeouts;
    }

    private static List<Integer> boxedIntegers(int[] values) {
        ArrayList<Integer> boxed = new ArrayList<Integer>(values.length);
        for (int value : values) {
            boxed.add(Integer.valueOf(value));
        }
        return boxed;
    }

    private static void applySettingsSnapshotRuntimeState(SettingsSnapshot loaded) {
        if (loaded == null) {
            return;
        }
        if (!loaded.available) {
            resetRuntimeStateForUnavailable();
        } else if (!loaded.enabled) {
            resetRuntimeStateForUnavailable();
        } else {
            resetRuntimeStateForDisabledLayouts(loaded);
        }
    }

    private static void resetRuntimeStateForUnavailable() {
        synchronized (CURRENT_PAGE_BY_LAYOUT_KIND) {
            CURRENT_PAGE_BY_LAYOUT_KIND.clear();
        }
        VISIBLE_TOP_ROW_KEYS.clear();
    }

    private static void resetRuntimeStateForDisabledLayouts(SettingsSnapshot snapshot) {
        if (snapshot == null) {
            resetRuntimeStateForUnavailable();
            return;
        }
        if (!snapshot.zhuyinEnabled) {
            resetRuntimeStateForLayout(TopRowLayoutKind.ZHUYIN);
        }
        if (!snapshot.englishQwertyEnabled) {
            resetRuntimeStateForLayout(TopRowLayoutKind.ENGLISH_QWERTY);
        }
    }

    private static boolean resetRuntimeStateForLayout(TopRowLayoutKind layoutKind) {
        if (layoutKind == null || layoutKind == TopRowLayoutKind.NONE) {
            return false;
        }
        boolean stateChanged = false;
        synchronized (CURRENT_PAGE_BY_LAYOUT_KIND) {
            stateChanged = CURRENT_PAGE_BY_LAYOUT_KIND.remove(layoutKind) != null;
        }
        synchronized (VISIBLE_TOP_ROW_KEYS) {
            Iterator<Map.Entry<Object, VisibleTopRowKey>> iterator =
                    VISIBLE_TOP_ROW_KEYS.entrySet().iterator();
            while (iterator.hasNext()) {
                VisibleTopRowKey visible = iterator.next().getValue();
                if (visible == null || visible.layoutKind == layoutKind) {
                    iterator.remove();
                    stateChanged = true;
                }
            }
        }
        return stateChanged;
    }

    private static void applyPendingPageIfNeeded(SwipeSession session) {
        if (session == null || session.pendingPage == null) {
            return;
        }
        try {
            View anchorView = session.anchorSoftKeyView instanceof View
                    ? (View) session.anchorSoftKeyView : null;
            Context context = anchorView != null ? anchorView.getContext() : null;
            if (!isLayoutEnabled(context, session.layoutKind)) {
                resetRuntimeStateForLayout(session.layoutKind);
                return;
            }
            ClassLoader classLoader = session.anchorSoftKeyView != null
                    ? session.anchorSoftKeyView.getClass().getClassLoader() : null;
            if (classLoader == null) {
                return;
            }
            GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles =
                    GboardTopRowSwipeRuntimeSupport.reflectionHandles(classLoader);
            Map<View, VisibleTopRowKey> visibleTopRowKeys =
                    copyVisibleTopRowKeys(session.layoutKind, anchorView);
            RowSnapshot beforeSnapshot = captureTopRowSnapshot(visibleTopRowKeys);
            setCurrentPage(session.layoutKind, session.pendingPage);
            refreshVisibleTopRowKeyMetadata(handles, visibleTopRowKeys);
            RowSnapshot afterSnapshot = captureTopRowSnapshot(visibleTopRowKeys);
            maybeAnimateTopRowTransition(visibleTopRowKeys, beforeSnapshot, afterSnapshot,
                    session.swipeDirectionSign);
            logLimited(SESSION_APPLY_LOG_COUNT,
                    "apply"
                            + " layout=" + session.layoutKind
                            + " page=" + session.pendingPage
                            + " visibleKeys=" + visibleTopRowKeys.size());
        } catch (Throwable ignored) {
            // Keep host alive; stale view state is preferable to crash.
        }
    }

    private static void refreshVisibleTopRowKeyMetadata(
            GboardTopRowSwipeRuntimeSupport.ReflectionHandles handles,
            Map<View, VisibleTopRowKey> visibleTopRowKeys) throws Throwable {
        clearSettingsSnapshotCache();
        for (Map.Entry<View, VisibleTopRowKey> entry : visibleTopRowKeys.entrySet()) {
            View softKeyView = entry.getKey();
            VisibleTopRowKey visible = entry.getValue();
            if (softKeyView == null || visible == null || visible.originalMetadata == null) {
                continue;
            }
            Object rebuilt = patchIncomingSoftKeyMetadata(softKeyView, visible.originalMetadata);
            if (rebuilt != null) {
                handles.rebindSoftKeyView(softKeyView, rebuilt);
                softKeyView.invalidate();
                softKeyView.requestLayout();
            }
        }
    }

    static Map<View, VisibleTopRowKey> copyVisibleTopRowKeys(TopRowLayoutKind layoutKind) {
        return copyVisibleTopRowKeys(layoutKind, null);
    }

    private static Map<View, VisibleTopRowKey> copyVisibleTopRowKeys(
            TopRowLayoutKind layoutKind, View anchorView) {
        Map<View, VisibleTopRowKey> visibleTopRowKeys =
                new HashMap<View, VisibleTopRowKey>();
        View anchorRoot = anchorView != null && anchorView.isAttachedToWindow()
                ? anchorView.getRootView() : null;
        synchronized (VISIBLE_TOP_ROW_KEYS) {
            Iterator<Map.Entry<Object, VisibleTopRowKey>> iterator =
                    VISIBLE_TOP_ROW_KEYS.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<Object, VisibleTopRowKey> entry = iterator.next();
                VisibleTopRowKey visible = entry.getValue();
                if (visible == null || !(entry.getKey() instanceof View view)) {
                    iterator.remove();
                    continue;
                }
                if (!isTopRowCacheEligibleView(view, anchorRoot)
                        || !isSameVisualRow(view, anchorView)) {
                    iterator.remove();
                    continue;
                }
                if (visible.layoutKind == layoutKind) {
                    visibleTopRowKeys.put(view, visible);
                }
            }
        }
        return visibleTopRowKeys;
    }

    private static boolean isTopRowCacheEligibleView(View view, View anchorRoot) {
        if (!isUsableVisibleTopRowView(view, anchorRoot)) {
            return false;
        }
        if (!(view.getVisibility() == View.VISIBLE) || view.getAlpha() <= 0f) {
            return false;
        }
        return !isDisallowedTopRowSurface(view);
    }

    private static boolean isUsableVisibleTopRowView(View view, View anchorRoot) {
        if (view == null || !view.isAttachedToWindow()
                || view.getWidth() <= 0 || view.getHeight() <= 0) {
            return false;
        }
        return anchorRoot == null || view.getRootView() == anchorRoot;
    }

    private static boolean isSameVisualRow(View view, View anchorView) {
        if (view == null || anchorView == null) {
            return true;
        }
        int[] viewLocation = new int[2];
        int[] anchorLocation = new int[2];
        view.getLocationOnScreen(viewLocation);
        anchorView.getLocationOnScreen(anchorLocation);
        int sameRowTolerancePx = Math.max(
                2,
                Math.max(view.getHeight(), anchorView.getHeight()) / 4);
        return Math.abs(viewLocation[1] - anchorLocation[1]) <= sameRowTolerancePx;
    }

    static boolean isDisallowedTopRowSurface(View view) {
        if (view == null) {
            return true;
        }
        View current = view;
        while (current != null) {
            String className = current.getClass().getName();
            if (ACCESS_POINTS_BAR_ITEM_SOFT_KEY_VIEW.equals(className)
                    || ACCESS_POINTS_BAR_VIEW.equals(className)
                    || PROACTIVE_SUGGESTIONS_HOLDER_VIEW.equals(className)
                    || className.endsWith(CANDIDATES_HOLDER_SUFFIX)) {
                return true;
            }
            String viewName = GboardTopRowSwipeRuntimeSupport.safeViewName(current);
            if (viewName != null
                    && (FIXED_CANDIDATES_ID.equals(viewName)
                    || PROACTIVE_SUGGESTIONS_ID.equals(viewName)
                    || viewName.startsWith(HEADER_ID_PREFIX))) {
                return true;
            }
            Object tag = current.getTag();
            if (tag instanceof String tagString
                    && tagString.contains(KEYBOARD_HEADER_TAG)) {
                return true;
            }
            current = current.getParent() instanceof View parentView ? parentView : null;
        }
        return false;
    }

    private static void collectUsableSameClassViews(View view, Class<?> viewClass,
            List<View> result) {
        if (view == null || viewClass == null || result == null) {
            return;
        }
        if (view.getClass() == viewClass
                && view.getVisibility() == View.VISIBLE
                && isUsableVisibleTopRowView(view, null)) {
            result.add(view);
        }
        if (!(view instanceof ViewGroup group)) {
            return;
        }
        int childCount = group.getChildCount();
        for (int index = 0; index < childCount; index++) {
            collectUsableSameClassViews(group.getChildAt(index), viewClass, result);
        }
    }

    private static float dpToPx(View view, float dp) {
        if (view == null) {
            return dp;
        }
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp,
                view.getResources().getDisplayMetrics());
    }

    private static RowSnapshot captureTopRowSnapshot(
            Map<View, VisibleTopRowKey> visibleTopRowKeys) {
        List<View> topRowViews = new ArrayList<View>(visibleTopRowKeys.keySet());
        if (topRowViews.isEmpty()) {
            return null;
        }
        topRowViews.sort((left, right) -> {
            int[] leftLocation = new int[2];
            int[] rightLocation = new int[2];
            left.getLocationOnScreen(leftLocation);
            right.getLocationOnScreen(rightLocation);
            return Integer.compare(leftLocation[0], rightLocation[0]);
        });

        ViewGroup host = resolveAnimationHost(topRowViews.get(0));
        if (host == null) {
            return null;
        }
        Rect bounds = resolveRowBounds(host, topRowViews);
        if (bounds == null || bounds.width() <= 0 || bounds.height() <= 0) {
            return null;
        }
        Bitmap bitmap = Bitmap.createBitmap(bounds.width(), bounds.height(),
                Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        int[] hostLocation = new int[2];
        host.getLocationOnScreen(hostLocation);
        for (View topRowView : topRowViews) {
            int[] viewLocation = new int[2];
            topRowView.getLocationOnScreen(viewLocation);
            canvas.save();
            canvas.translate(viewLocation[0] - hostLocation[0] - bounds.left,
                    viewLocation[1] - hostLocation[1] - bounds.top);
            topRowView.draw(canvas);
            canvas.restore();
        }
        return new RowSnapshot(host, bounds, bitmap);
    }

    private static ViewGroup resolveAnimationHost(View view) {
        if (view == null) {
            return null;
        }
        View rootView = view.getRootView();
        return rootView instanceof ViewGroup rootGroup ? rootGroup : null;
    }

    private static Rect resolveRowBounds(ViewGroup host, List<View> topRowViews) {
        int[] hostLocation = new int[2];
        host.getLocationOnScreen(hostLocation);
        Rect unionBounds = null;
        for (View topRowView : topRowViews) {
            int[] viewLocation = new int[2];
            topRowView.getLocationOnScreen(viewLocation);
            Rect viewBounds = new Rect(
                    viewLocation[0] - hostLocation[0],
                    viewLocation[1] - hostLocation[1],
                    viewLocation[0] - hostLocation[0] + topRowView.getWidth(),
                    viewLocation[1] - hostLocation[1] + topRowView.getHeight());
            if (unionBounds == null) {
                unionBounds = viewBounds;
            } else {
                unionBounds.union(viewBounds);
            }
        }
        return unionBounds;
    }

    private static void maybeAnimateTopRowTransition(
            Map<View, VisibleTopRowKey> visibleTopRowKeys,
            RowSnapshot beforeSnapshot,
            RowSnapshot afterSnapshot,
            int swipeDirectionSign) {
        if (beforeSnapshot == null || afterSnapshot == null
                || beforeSnapshot.host == null || beforeSnapshot.bitmap == null
                || afterSnapshot.bitmap == null) {
            return;
        }
        ViewGroup host = beforeSnapshot.host;
        removeExistingOverlay(host);

        FrameLayout overlay = new FrameLayout(host.getContext());
        overlay.setTag(ROW_TRANSITION_OVERLAY_TAG);
        overlay.setLayoutParams(new ViewGroup.LayoutParams(
                beforeSnapshot.bounds.width(),
                beforeSnapshot.bounds.height()));
        overlay.setX(beforeSnapshot.bounds.left);
        overlay.setY(beforeSnapshot.bounds.top);
        overlay.setClipChildren(true);
        overlay.setClipToPadding(true);

        ImageView oldImage = new ImageView(host.getContext());
        oldImage.setImageBitmap(beforeSnapshot.bitmap);
        oldImage.setScaleType(ImageView.ScaleType.FIT_XY);
        oldImage.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        ImageView newImage = new ImageView(host.getContext());
        newImage.setImageBitmap(afterSnapshot.bitmap);
        newImage.setScaleType(ImageView.ScaleType.FIT_XY);
        newImage.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        float offset = beforeSnapshot.bounds.width();
        float animationDirection = swipeDirectionSign >= 0 ? 1f : -1f;
        float newStart = -offset * animationDirection;
        float oldEnd = offset * animationDirection;
        newImage.setTranslationX(newStart);

        overlay.addView(oldImage);
        overlay.addView(newImage);
        host.addView(overlay);
        setTopRowAlpha(visibleTopRowKeys, 0f);

        oldImage.animate()
                .translationX(oldEnd)
                .setDuration(ROW_TRANSITION_DURATION_MS)
                .start();
        newImage.animate()
                .translationX(0f)
                .setDuration(ROW_TRANSITION_DURATION_MS)
                .setListener(new AnimatorListenerAdapter() {
                    @Override
                    public void onAnimationEnd(Animator animation) {
                        setTopRowAlpha(visibleTopRowKeys, 1f);
                        removeExistingOverlay(host);
                        beforeSnapshot.bitmap.recycle();
                        afterSnapshot.bitmap.recycle();
                    }
                })
                .start();
    }

    private static void setTopRowAlpha(Map<View, VisibleTopRowKey> visibleTopRowKeys,
            float alpha) {
        for (View view : visibleTopRowKeys.keySet()) {
            view.setAlpha(alpha);
        }
    }

    private static void removeExistingOverlay(ViewGroup host) {
        if (host == null) {
            return;
        }
        View existingOverlay = host.findViewWithTag(ROW_TRANSITION_OVERLAY_TAG);
        if (existingOverlay != null) {
            host.removeView(existingOverlay);
        }
    }
}
