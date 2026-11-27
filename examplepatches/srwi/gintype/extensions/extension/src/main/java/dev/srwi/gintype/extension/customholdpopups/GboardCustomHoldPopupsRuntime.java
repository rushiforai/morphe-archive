package dev.srwi.gintype.extension.customholdpopups;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;
import android.util.Log;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroupOverlay;
import android.view.animation.LinearInterpolator;
import android.view.inputmethod.InputConnection;
import dev.srwi.gintype.extension.settings.GboardPatchesFeatureAvailability;
import dev.srwi.gintype.extension.settings.GboardPatchesSettingsActivity;
import dev.srwi.gintype.extension.thicctopbar.ThiccTopBarGboardReflector;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Runtime hook coordinator for Custom Hold Popups.
 *
 * <p>Hooks:
 * <ul>
 *   <li>{@code SoftKeyView.s(SoftKeyDef, J)Z} — augments character, digit, and punctuation keys
 *       with custom/modified long-press symbols and a trailing {@code ✎} option while leaving
 *       function and special keys untouched.</li>
 *   <li>{@code Lqin.D(J)V} ({@code TouchActionBundle.showPopup}) — starts the stationary hold
 *       timer when a hold popup opens.</li>
 *   <li>{@code Lqsl.c(F, F, Z)Z} — restarts/cancels the stationary hold timer when the highlighted
 *       popup symbol changes during finger movement.</li>
 *   <li>{@code Lqsl.a(J)V} &amp; {@code Lqsl.close()V} — cancels any active hold timer when the
 *       popup closes.</li>
 *   <li>{@code BasicMotionEventHandler.o(...)V} — intercepts release on {@code ✎} to open the
 *       Add-Symbol Editor Dialog without committing text, suppresses text output after a 2-second
 *       stationary hold-to-edit trigger, and commits multi-character custom snippets cleanly.</li>
 * </ul>
 */
public final class GboardCustomHoldPopupsRuntime {

    private static final String TAG = "GboardCustomHoldPopups";

    public static final int PENCIL_SENTINEL_KEY_CODE = -777777;
    private static final int PLAIN_TEXT_KEY_CODE = -10009;
    public static final int DEFAULT_POPUP_LAYOUT_THEME_ATTR = 0x7f040280;
    private static final String EDIT_ICON_DRAWABLE_NAME = "gboard_custom_hold_popups_edit";
    private static final long SETTINGS_REFRESH_INTERVAL_MS = 400L;

    /**
     * Metadata for each item in an augmented LONG_PRESS ActionDef so that 2-second stationary hold
     * knows whether an item is a default symbol (and what its original default value was) or a
     * user-added symbol (and its index in {@code addedSymbols}).
     */
    static final class PopupItemMeta {
        final String baseKey;
        final String currentSymbol;
        final String originalDefaultSymbol;
        final boolean userAdded;
        final int addedIndex;
        final boolean pencilAddOption;

        PopupItemMeta(
                String baseKey,
                String currentSymbol,
                String originalDefaultSymbol,
                boolean userAdded,
                int addedIndex,
                boolean pencilAddOption) {
            this.baseKey = baseKey;
            this.currentSymbol = currentSymbol;
            this.originalDefaultSymbol = originalDefaultSymbol;
            this.userAdded = userAdded;
            this.addedIndex = addedIndex;
            this.pencilAddOption = pencilAddOption;
        }
    }

    private static final class ActivePopupState {
        final Object touchActionBundle; // Lqin;
        final Object popupManager;      // Lqsl;
        final Object softKeyDef;
        final String baseKey;
        Object currentSelectedKeyData;
        Runnable holdRunnable;
        ValueAnimator countdownAnimator;
        ViewGroupOverlay countdownOverlay;
        HoldCountdownDrawable countdownDrawable;

        ActivePopupState(
                Object touchActionBundle,
                Object popupManager,
                Object softKeyDef,
                String baseKey) {
            this.touchActionBundle = touchActionBundle;
            this.popupManager = popupManager;
            this.softKeyDef = softKeyDef;
            this.baseKey = baseKey;
        }
    }

    private static volatile Handler mainHandler;

    private static Handler getMainHandler() {
        Handler h = mainHandler;
        if (h == null) {
            try {
                Looper looper = Looper.getMainLooper();
                if (looper != null) {
                    h = new Handler(looper);
                    mainHandler = h;
                }
            } catch (Throwable ignored) {
            }
        }
        return h;
    }

    private static void postToMainThread(Runnable action) {
        if (action == null) return;
        Handler h = getMainHandler();
        if (h != null) {
            h.post(action);
        }
    }

    private static void postDelayedToMainThread(Runnable action, long delayMs) {
        if (action == null) return;
        Handler h = getMainHandler();
        if (h != null) {
            h.postDelayed(action, delayMs);
        }
    }

    private static void removeMainThreadCallbacks(Runnable action) {
        if (action == null) return;
        Handler h = getMainHandler();
        if (h != null) {
            h.removeCallbacks(action);
        }
    }

    /**
     * Thread-safe weak-key identity map using {@link System#identityHashCode} and {@code ==}
     * so transient {@code SoftKeyDef} and {@code KeyData} instances created across Shift/layout
     * switches are automatically reclaimed by GC once no longer referenced by Gboard.
     */
    private static final class WeakIdentityMap<K, V> {
        private final Map<IdentityWeakKey<K>, V> map = new HashMap<IdentityWeakKey<K>, V>();
        private final java.lang.ref.ReferenceQueue<K> queue =
                new java.lang.ref.ReferenceQueue<K>();

        private static final class IdentityWeakKey<K> extends java.lang.ref.WeakReference<K> {
            final int hash;

            IdentityWeakKey(K referent, java.lang.ref.ReferenceQueue<K> queue) {
                super(referent, queue);
                this.hash = System.identityHashCode(referent);
            }

            @Override
            public int hashCode() {
                return hash;
            }

            @Override
            public boolean equals(Object obj) {
                if (this == obj) return true;
                if (!(obj instanceof IdentityWeakKey<?> other)) return false;
                if (this.hash != other.hash) return false;
                Object a = this.get();
                Object b = other.get();
                return a != null && a == b;
            }
        }

        private void expungeStaleEntries() {
            Object ref;
            while ((ref = queue.poll()) != null) {
                map.remove(ref);
            }
        }

        synchronized V get(K key) {
            if (key == null) return null;
            expungeStaleEntries();
            return map.get(new IdentityWeakKey<K>(key, null));
        }

        synchronized void put(K key, V value) {
            if (key == null) return;
            expungeStaleEntries();
            map.put(new IdentityWeakKey<K>(key, queue), value);
        }
    }

    // Use WeakIdentityMap for SoftKeyDef and KeyData (Lqbc) instances so lookups are based on
    // object identity (===) rather than value equality (.equals()), preventing collisions while
    // allowing GC to reclaim old defs after Shift/layout switches.
    private static final WeakIdentityMap<Object, Object> AUGMENTED_TO_ORIGINAL_DEF =
            new WeakIdentityMap<Object, Object>();
    private static final WeakIdentityMap<Object, String> AUGMENTED_DEF_BASE_KEY =
            new WeakIdentityMap<Object, String>();
    private static final WeakIdentityMap<Object, PopupItemMeta> KEY_DATA_META =
            new WeakIdentityMap<Object, PopupItemMeta>();
    private static final Map<Object, Object> ACTIVE_SOFT_KEY_VIEWS =
            Collections.synchronizedMap(new WeakHashMap<Object, Object>());
    private static final Map<Object, ActivePopupState> ACTIVE_POPUPS_BY_MANAGER =
            Collections.synchronizedMap(new IdentityHashMap<Object, ActivePopupState>());
    private static final long CONSUMED_BUNDLE_TTL_MS = 500L;
    private static final Map<Object, Long> CONSUMED_BUNDLES =
            Collections.synchronizedMap(new IdentityHashMap<Object, Long>());

    private static volatile boolean reflectionReady = false;
    private static volatile boolean reflectionFailed = false;

    // SoftKeyDef reflection
    private static volatile Class<?> softKeyDefClass;
    private static volatile Constructor<?> softKeyDefCtor;
    private static volatile Field[] softKeyDefCtorFields;
    private static volatile int softKeyDefActionDefsParamIndex = -1;
    private static volatile Field softKeyDefActionDefsField;
    private static volatile Field softKeyDefLabelsField;

    // SoftKeyView reflection
    private static volatile Field softKeyViewDefField;          // e : SoftKeyDef
    private static volatile Field softKeyViewStateField;        // f : J
    private static volatile Method softKeyViewSetDefMethod;     // s(SoftKeyDef, J)Z

    // ActionDef reflection
    private static volatile Class<?> actionDefClass;
    private static volatile Constructor<?> actionDefCtor;
    private static volatile Field actionDefActionField;         // e : Lqae;
    private static volatile Field actionDefKeyDatasField;       // f : Lwns;
    private static volatile Field actionDefActionOnDownField;   // g : Z
    private static volatile Field actionDefRepeatableField;     // h : Z
    private static volatile Field actionDefPopupLayoutField;    // i : I
    private static volatile Field actionDefAlwaysShowField;     // j : Z
    private static volatile Field actionDefPlayMediaField;      // k : Z
    private static volatile Field actionDefPlayReleaseField;    // l : Z
    private static volatile Field actionDefIconBgLevelField;    // m : I
    private static volatile Field actionDefMergeIdxField;       // n : I
    private static volatile Field actionDefContentDescField;    // o : String
    private static volatile Field actionDefPopupLabelsField;    // p : Lwns;
    private static volatile Field actionDefPopupIconsField;     // q : [I
    private static volatile Field actionDefSuppressLongField;   // r : Z

    // Lqae (Action type enum: a=PRESS, b=LONG_PRESS)
    private static volatile Object actionPressEnum;             // Lqae.a
    private static volatile Object actionLongPressEnum;         // Lqae.b

    // Lqbc (KeyData) & Lqbb (Intention enum: b=DECODE, c=COMMIT)
    private static volatile Class<?> keyDataClass;              // Lqbc;
    private static volatile Constructor<?> keyDataCtor;         // <init>(I, Lqbb;, Object, I)
    private static volatile Field keyDataCodeField;             // c : I
    private static volatile Field keyDataIntentionField;        // d : Lqbb;
    private static volatile Field keyDataDataField;             // e : Object
    private static volatile Object intentionCommitEnum;         // Lqbb.c

    // Lwns (Guava ImmutableList)
    private static volatile Method immutableListCopyOfArrayMethod; // Lwns.q(Object[])Lwns;

    // Lqin (TouchActionBundle) & Lqsl (PopupManager)
    private static volatile Field bundleSoftKeyViewField;       // Lqin.m : SoftKeyView
    private static volatile Field bundleActionDefField;         // Lqin.n : ActionDef
    private static volatile Field bundlePopupManagerField;      // Lqin.q : Lqsl
    private static volatile Method bundleClosePopupMethod;      // Lqin.C()V
    private static volatile Field popupViewField;               // Lqsl.e : View
    private static volatile Field popupSelectedKeyDataField;    // Lqsl.f : Lqbc
    private static volatile Field popupContextField;            // Lqsl.a : Context
    private static volatile Field popupKeyboardViewField;       // Lqsl.r : SoftKeyboardView
    private static volatile Method popupIsShowingMethod;        // Lqsl.b()Z
    private static volatile Method popupHideMethod;             // Lqsl.a(J)V

    private static final Object EXTRA_REFLECTION_LOCK = new Object();

    private static final class SettingsSnapshot {
        static final SettingsSnapshot DEFAULTS = new SettingsSnapshot(
                GboardCustomHoldPopupsSettings.DEFAULT_ENABLED,
                GboardCustomHoldPopupsSettings.DEFAULT_LOCK_KEYS,
                GboardCustomHoldPopupsSettings.DEFAULT_HOLD_DURATION_MS,
                Collections.emptyMap());

        final boolean enabled;
        final boolean lockKeys;
        final int holdDurationMs;
        final Map<String, GboardCustomHoldPopupsSettings.KeyHoldRules> rules;

        SettingsSnapshot(
                boolean enabled,
                boolean lockKeys,
                int holdDurationMs,
                Map<String, GboardCustomHoldPopupsSettings.KeyHoldRules> rules) {
            this.enabled = enabled;
            this.lockKeys = lockKeys;
            this.holdDurationMs = holdDurationMs;
            this.rules = rules != null ? rules : Collections.emptyMap();
        }
    }

    private static volatile Context cachedContext;
    private static volatile int cachedEditIconResId = -1;
    private static volatile int cachedPopupLayoutId = 0;
    private static volatile SettingsSnapshot settingsSnapshot = SettingsSnapshot.DEFAULTS;
    private static volatile long lastSettingsReadMs = 0L;
    private static volatile boolean refreshingKeyboards = false;

    private GboardCustomHoldPopupsRuntime() {
    }

    public static void invalidateCachedSettings() {
        lastSettingsReadMs = 0L;
    }

    public static void invalidateAndRefreshActiveKeyboards() {
        invalidateAndRefreshActiveKeyboards(null);
    }

    public static void invalidateAndRefreshActiveKeyboards(Context context) {
        if (context != null) {
            cachedContext = context.getApplicationContext() != null
                    ? context.getApplicationContext()
                    : context;
        }
        lastSettingsReadMs = 0L;
        postToMainThread(GboardCustomHoldPopupsRuntime::refreshActiveSoftKeyViewsOnMainThread);
    }

    private static SettingsSnapshot refreshSettingsIfNeeded(Context context, boolean force) {
        if (context != null) {
            Context app = context.getApplicationContext();
            cachedContext = app != null ? app : context;
        }
        Context ctx = context != null ? context : cachedContext;
        if (ctx == null) return settingsSnapshot;
        long now = SystemClock.uptimeMillis();
        if (!force && lastSettingsReadMs != 0L
                && now - lastSettingsReadMs < SETTINGS_REFRESH_INTERVAL_MS) {
            return settingsSnapshot;
        }
        SharedPreferences prefs = GboardCustomHoldPopupsSettings.resolvePreferences(ctx);
        SettingsSnapshot updated = new SettingsSnapshot(
                GboardCustomHoldPopupsSettings.readEnabled(prefs),
                GboardCustomHoldPopupsSettings.readLockKeys(prefs),
                GboardCustomHoldPopupsSettings.readHoldDurationMs(prefs),
                GboardCustomHoldPopupsSettings.readAllRules(prefs));
        settingsSnapshot = updated;
        lastSettingsReadMs = now;
        return updated;
    }

    /**
     * Hooked at the start of {@code SoftKeyView.s(SoftKeyDef, J)Z}.
     */
    public static Object transformSoftKeyDef(Object softKeyViewObj, Object softKeyDefObj) {
        if (softKeyDefObj == null) {
            if (softKeyViewObj != null) {
                ACTIVE_SOFT_KEY_VIEWS.remove(softKeyViewObj);
            }
            return null;
        }
        try {
            Context context = softKeyViewObj instanceof View
                    ? ((View) softKeyViewObj).getContext()
                    : cachedContext;
            SettingsSnapshot snap = refreshSettingsIfNeeded(context, false);

            Object originalDef = AUGMENTED_TO_ORIGINAL_DEF.get(softKeyDefObj);
            if (originalDef == null) {
                originalDef = softKeyDefObj;
            }
            if (softKeyViewObj != null) {
                ACTIVE_SOFT_KEY_VIEWS.put(softKeyViewObj, originalDef);
            }

            if (!snap.enabled) {
                return originalDef;
            }
            if (!ensureReflectionInitialized(originalDef.getClass().getClassLoader(), originalDef)) {
                return originalDef;
            }

            String rawKeyLabel = extractEligibleKeyLabel(originalDef);
            if (rawKeyLabel == null) {
                return originalDef;
            }
            String normalizedBaseKey = GboardCustomHoldPopupsSettings.normalizeBaseKey(rawKeyLabel);
            if (normalizedBaseKey.isEmpty()) {
                return originalDef;
            }
            boolean shifted = GboardCustomHoldPopupsSettings.isShiftedKeyLabel(
                    rawKeyLabel, normalizedBaseKey);

            Object augmented = buildAugmentedSoftKeyDef(
                    originalDef, normalizedBaseKey, shifted, snap.rules.get(normalizedBaseKey), snap.lockKeys);
            if (augmented != null && augmented != originalDef) {
                AUGMENTED_TO_ORIGINAL_DEF.put(augmented, originalDef);
                AUGMENTED_DEF_BASE_KEY.put(augmented, normalizedBaseKey);
                return augmented;
            }
            return originalDef;
        } catch (Throwable t) {
            Log.w(TAG, "transformSoftKeyDef failed", t);
            return softKeyDefObj;
        }
    }

    /**
     * Hooked before return in {@code Lqin.D(J)V} ({@code TouchActionBundle.showPopup}).
     */
    public static void onPopupShown(Object touchActionBundleObj) {
        if (touchActionBundleObj == null || !settingsSnapshot.enabled) return;
        try {
            ensureBundleAndPopupReflection(touchActionBundleObj, null);
            if (bundlePopupManagerField == null || bundleSoftKeyViewField == null) {
                return;
            }
            Object popupManager = bundlePopupManagerField.get(touchActionBundleObj);
            if (popupManager == null) return;
            ensureBundleAndPopupReflection(touchActionBundleObj, popupManager);

            if (popupIsShowingMethod != null) {
                Object showing = popupIsShowingMethod.invoke(popupManager);
                if (!(showing instanceof Boolean) || !((Boolean) showing)) {
                    return;
                }
            }

            Object softKeyView = bundleSoftKeyViewField.get(touchActionBundleObj);
            Object softKeyDef = (softKeyView != null && softKeyViewDefField != null)
                    ? softKeyViewDefField.get(softKeyView)
                    : null;
            if (softKeyDef == null) return;

            String baseKey = AUGMENTED_DEF_BASE_KEY.get(softKeyDef);
            if (baseKey == null) {
                String rawLabel = extractEligibleKeyLabel(softKeyDef);
                if (rawLabel == null) return;
                baseKey = GboardCustomHoldPopupsSettings.normalizeBaseKey(rawLabel);
            }
            if (baseKey == null || baseKey.isEmpty()) return;

            cancelPopupHoldTimer(popupManager);
            ActivePopupState state = new ActivePopupState(
                    touchActionBundleObj, popupManager, softKeyDef, baseKey);
            ACTIVE_POPUPS_BY_MANAGER.put(popupManager, state);

            Object selectedKeyData = popupSelectedKeyDataField != null
                    ? popupSelectedKeyDataField.get(popupManager)
                    : null;
            updateSelectedKeyDataAndScheduleTimer(state, selectedKeyData);
        } catch (Throwable t) {
            Log.w(TAG, "onPopupShown failed", t);
        }
    }

    /**
     * Hooked before return in {@code Lqsl.c(F, F, Z)Z} ({@code PopupManager.handleMove}).
     */
    public static void onPopupSelectionUpdated(Object popupManagerObj, boolean isUpEvent) {
        if (popupManagerObj == null || !settingsSnapshot.enabled) return;
        try {
            ActivePopupState state = ACTIVE_POPUPS_BY_MANAGER.get(popupManagerObj);
            if (state == null) return;
            if (isUpEvent) {
                cancelStateTimerOnly(state);
                return;
            }
            Object selectedKeyData = popupSelectedKeyDataField != null
                    ? popupSelectedKeyDataField.get(popupManagerObj)
                    : null;
            if (selectedKeyData != state.currentSelectedKeyData) {
                updateSelectedKeyDataAndScheduleTimer(state, selectedKeyData);
            }
        } catch (Throwable t) {
            Log.w(TAG, "onPopupSelectionUpdated failed", t);
        }
    }

    /**
     * Hooked at entry of {@code Lqsl.a(J)V} and {@code Lqsl.close()V}.
     */
    public static void onPopupHidden(Object popupManagerObj) {
        if (popupManagerObj == null) return;
        cancelPopupHoldTimer(popupManagerObj);
    }

    /**
     * Hooked at entry of {@code BasicMotionEventHandler.o(Lqin, Lqae, Lqbc, SoftKeyDef, ...)V}.
     *
     * @return {@code true} to suppress stock Gboard dispatch, {@code false} to allow stock dispatch.
     */
    public static boolean shouldInterceptKeyDataDispatch(
            Object basicHandlerObj,
            Object touchActionBundleObj,
            Object actionEnumObj,
            Object keyDataObj,
            Object softKeyDefObj) {
        try {
            if (touchActionBundleObj != null) {
                Long consumedAt = CONSUMED_BUNDLES.remove(touchActionBundleObj);
                if (consumedAt != null
                        && (SystemClock.uptimeMillis() - consumedAt) <= CONSUMED_BUNDLE_TTL_MS) {
                    return true;
                }
            }
            if (!settingsSnapshot.enabled || keyDataObj == null) {
                return false;
            }
            ensureKeyDataReflection(keyDataObj);

            PopupItemMeta meta = KEY_DATA_META.get(keyDataObj);
            int keyCode = keyDataCodeField != null ? keyDataCodeField.getInt(keyDataObj) : 0;

            // 1. Released on Pencil (✎) -> suppress commit and open Editor Dialog in Add mode!
            if ((meta != null && meta.pencilAddOption) || keyCode == PENCIL_SENTINEL_KEY_CODE) {
                // Always prefer resolving the base key directly from the pressed SoftKeyDef
                // (or TouchActionBundle's SoftKeyView), falling back to meta.baseKey if needed.
                String baseKey = resolveBaseKeyFromDefOrBundle(softKeyDefObj, touchActionBundleObj);
                if ((baseKey == null || baseKey.isEmpty()) && meta != null) {
                    baseKey = meta.baseKey;
                }
                if (baseKey != null && !baseKey.isEmpty()) {
                    Context ctx = resolveContext(basicHandlerObj, touchActionBundleObj);
                    launchEditorDialogFromKeyboard(
                            ctx,
                            GboardCustomHoldPopupsEditorDialog.MODE_ADD,
                            baseKey,
                            "",
                            "",
                            false,
                            -1);
                }
                return true;
            }

            // 2. Multi-character snippets and emojis are created with PLAIN_TEXT (-10009) + COMMIT
            // intention in buildAugmentedSoftKeyDef so Gboard dispatches them natively through its
            // own decoder/shift pipeline (and triggers ThiccTopBarRuntime.onKeyDataDispatched).
        } catch (Throwable t) {
            Log.w(TAG, "shouldInterceptKeyDataDispatch failed", t);
        }
        return false;
    }

    private static void updateSelectedKeyDataAndScheduleTimer(
            ActivePopupState state,
            Object selectedKeyData) {
        cancelStateTimerOnly(state);
        state.currentSelectedKeyData = selectedKeyData;
        SettingsSnapshot snap = settingsSnapshot;
        if (selectedKeyData == null || snap.lockKeys) {
            return;
        }
        PopupItemMeta meta = resolvePopupItemMeta(state.baseKey, selectedKeyData);
        if (meta == null || meta.pencilAddOption) {
            return;
        }
        int holdDurationMs = snap.holdDurationMs;
        final Object expectedKeyData = selectedKeyData;
        final PopupItemMeta targetMeta = meta;
        Runnable timerTask = new Runnable() {
            @Override
            public void run() {
                if (state.holdRunnable != this) return;
                state.holdRunnable = null;
                onHoldToEditTimerFired(state, expectedKeyData, targetMeta);
            }
        };
        state.holdRunnable = timerTask;
        postDelayedToMainThread(timerTask, holdDurationMs);
        startCountdownIndicator(state, holdDurationMs);
    }

    private static void onHoldToEditTimerFired(
            ActivePopupState state,
            Object expectedKeyData,
            PopupItemMeta meta) {
        try {
            stopCountdownIndicator(state);
            Object popupManager = state.popupManager;
            if (popupManager == null) return;
            if (popupIsShowingMethod != null) {
                Object showing = popupIsShowingMethod.invoke(popupManager);
                if (!(showing instanceof Boolean) || !((Boolean) showing)) {
                    return;
                }
            }
            Object currentKeyData = popupSelectedKeyDataField != null
                    ? popupSelectedKeyDataField.get(popupManager)
                    : null;
            if (currentKeyData == null || currentKeyData != expectedKeyData) {
                return;
            }

            // Mark this touch bundle as consumed so releasing the finger will not commit a symbol
            if (state.touchActionBundle != null) {
                CONSUMED_BUNDLES.put(state.touchActionBundle, SystemClock.uptimeMillis());
            }
            ACTIVE_POPUPS_BY_MANAGER.remove(popupManager);

            // Clear selected KeyData and dismiss the popup immediately
            if (popupSelectedKeyDataField != null) {
                popupSelectedKeyDataField.set(popupManager, null);
            }
            if (state.touchActionBundle != null && bundleClosePopupMethod != null) {
                try {
                    bundleClosePopupMethod.invoke(state.touchActionBundle);
                } catch (Throwable ignored) {
                }
            }
            if (popupHideMethod != null) {
                try {
                    popupHideMethod.invoke(popupManager, 0L);
                } catch (Throwable ignored) {
                }
            }

            Context ctx = resolveContext(null, state.touchActionBundle);
            triggerEditHapticFeedback(ctx, state.touchActionBundle, popupManager);

            String effectiveBaseKey = (state.baseKey != null && !state.baseKey.isEmpty())
                    ? state.baseKey
                    : meta.baseKey;

            launchEditorDialogFromKeyboard(
                    ctx,
                    GboardCustomHoldPopupsEditorDialog.MODE_EDIT,
                    effectiveBaseKey,
                    meta.currentSymbol,
                    meta.originalDefaultSymbol,
                    meta.userAdded,
                    meta.addedIndex);
        } catch (Throwable t) {
            Log.w(TAG, "onHoldToEditTimerFired failed", t);
        }
    }

    private static PopupItemMeta resolvePopupItemMeta(String baseKey, Object keyDataObj) {
        if (keyDataObj == null) return null;
        PopupItemMeta recorded = KEY_DATA_META.get(keyDataObj);
        if (recorded != null) {
            return recorded;
        }
        try {
            ensureKeyDataReflection(keyDataObj);
            int code = keyDataCodeField != null ? keyDataCodeField.getInt(keyDataObj) : 0;
            if (code == PENCIL_SENTINEL_KEY_CODE) {
                return new PopupItemMeta(
                        baseKey, GboardCustomHoldPopupsSettings.PENCIL_SYMBOL, "", false, -1, true);
            }
            Object dataObj = keyDataDataField != null ? keyDataDataField.get(keyDataObj) : null;
            if (dataObj instanceof CharSequence) {
                String symbol = dataObj.toString();
                if (GboardCustomHoldPopupsSettings.PENCIL_SYMBOL.equals(symbol)) {
                    return new PopupItemMeta(baseKey, symbol, "", false, -1, true);
                }
                if (!symbol.isEmpty()) {
                    String orig = GboardCustomHoldPopupsSettings.normalizeDefaultKey(symbol);
                    return new PopupItemMeta(baseKey, symbol, orig, false, -1, false);
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static void cancelPopupHoldTimer(Object popupManagerObj) {
        ActivePopupState state = ACTIVE_POPUPS_BY_MANAGER.remove(popupManagerObj);
        if (state != null) {
            cancelStateTimerOnly(state);
        }
    }

    private static void cancelStateTimerOnly(ActivePopupState state) {
        if (state != null) {
            if (state.holdRunnable != null) {
                removeMainThreadCallbacks(state.holdRunnable);
                state.holdRunnable = null;
            }
            stopCountdownIndicator(state);
        }
    }

    private static void startCountdownIndicator(ActivePopupState state, int holdDurationMs) {
        if (state == null || state.popupManager == null || popupViewField == null) {
            return;
        }
        Runnable startAction = () -> {
            if (state.holdRunnable == null) {
                return;
            }
            try {
                Object popupViewObj = popupViewField.get(state.popupManager);
                if (!(popupViewObj instanceof View)) {
                    return;
                }
                View popupView = (View) popupViewObj;
                View rootView = popupView.getRootView();
                if (!(rootView instanceof ViewGroup)) {
                    return;
                }
                View targetView = findSelectedPopupItemView(popupView);
                if (targetView == null) {
                    targetView = popupView;
                }

                ViewGroup rootGroup = (ViewGroup) rootView;
                ViewGroupOverlay overlay = rootGroup.getOverlay();
                if (overlay == null) {
                    return;
                }

                int startDelayMs = Math.min(600, Math.max(0, holdDurationMs - 300));
                int animDurationMs = Math.max(1, holdDurationMs - startDelayMs);

                float density = popupView.getResources().getDisplayMetrics().density;
                int ringColor = resolveCountdownRingColor(popupView, popupView.getContext());
                HoldCountdownDrawable drawable = new HoldCountdownDrawable(
                        popupView, targetView, rootGroup, density, animDurationMs, ringColor);
                drawable.setBounds(0, 0, rootGroup.getWidth(), rootGroup.getHeight());
                overlay.add(drawable);

                ValueAnimator animator = ValueAnimator.ofFloat(0f, 1f);
                animator.setStartDelay(startDelayMs);
                animator.setDuration(animDurationMs);
                animator.setInterpolator(new LinearInterpolator());
                animator.addUpdateListener(anim -> {
                    Object val = anim.getAnimatedValue();
                    if (val instanceof Float) {
                        drawable.setFraction((Float) val);
                    }
                    if (rootGroup.getWidth() > 0 && rootGroup.getHeight() > 0) {
                        drawable.setBounds(0, 0, rootGroup.getWidth(), rootGroup.getHeight());
                    }
                    drawable.invalidateSelf();
                });

                state.countdownOverlay = overlay;
                state.countdownDrawable = drawable;
                state.countdownAnimator = animator;
                animator.start();
            } catch (Throwable t) {
                Log.w(TAG, "startCountdownIndicator failed", t);
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) {
            startAction.run();
        } else {
            postToMainThread(startAction);
        }
    }

    private static void stopCountdownIndicator(ActivePopupState state) {
        if (state == null) return;
        ValueAnimator animator = state.countdownAnimator;
        ViewGroupOverlay overlay = state.countdownOverlay;
        HoldCountdownDrawable drawable = state.countdownDrawable;
        state.countdownAnimator = null;
        state.countdownOverlay = null;
        state.countdownDrawable = null;
        if (animator == null && overlay == null && drawable == null) {
            return;
        }
        Runnable stopAction = () -> {
            if (animator != null) {
                try {
                    animator.cancel();
                } catch (Throwable ignored) {
                }
            }
            if (overlay != null && drawable != null) {
                try {
                    overlay.remove(drawable);
                } catch (Throwable ignored) {
                }
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) {
            stopAction.run();
        } else {
            postToMainThread(stopAction);
        }
    }

    private static View findSelectedPopupItemView(View popupView) {
        if (popupView == null || popupView.getVisibility() != View.VISIBLE) {
            return null;
        }
        ArrayDeque<View> queue = new ArrayDeque<View>();
        queue.add(popupView);
        while (!queue.isEmpty()) {
            View current = queue.poll();
            if (current == null || current.getVisibility() != View.VISIBLE) {
                continue;
            }
            if (current != popupView && (current.isPressed() || current.isSelected())) {
                return current;
            }
            if (current instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) current;
                for (int i = 0; i < vg.getChildCount(); i++) {
                    queue.add(vg.getChildAt(i));
                }
            }
        }
        return popupView;
    }

    private static View findHighlightCircleView(View popupView, View itemView) {
        if (popupView == null || itemView == null) {
            return null;
        }
        int itemW = itemView.getWidth();
        int itemH = itemView.getHeight();
        if (itemW <= 0 || itemH <= 0) {
            return null;
        }
        Class<?> cls = popupView.getClass();
        for (String fieldName : new String[] { "f", "g" }) {
            try {
                Field f = findDeclaredFieldOrNull(cls, fieldName);
                if (f == null) continue;
                Object val = f.get(popupView);
                if (val instanceof View) {
                    View candidate = (View) val;
                    if (candidate == popupView || candidate == itemView) continue;
                    if (candidate.getVisibility() != View.VISIBLE) continue;
                    int cw = candidate.getWidth();
                    int ch = candidate.getHeight();
                    if (cw > 0 && ch > 0
                            && cw <= itemW * 1.25f
                            && ch <= itemH * 1.25f) {
                        return candidate;
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static int resolveCountdownRingColor(View popupView, Context context) {
        boolean dark = ThiccTopBarGboardReflector.isKeyboardDark(popupView);
        return ThiccTopBarGboardReflector.resolveNormalAccentColor(popupView, context, dark);
    }

    private static final class HoldCountdownDrawable extends Drawable {
        private static final int MAX_ALPHA = 230;
        private static final float FADE_IN_MS = 150f;

        private final View popupView;
        private final View itemView;
        private final View rootView;
        private final int animDurationMs;
        private View resolvedHighlightView;
        private boolean highlightLookupDone = false;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int[] targetLoc = new int[2];
        private final int[] rootLoc = new int[2];
        private volatile float fraction = 0f;

        HoldCountdownDrawable(
                View popupView,
                View itemView,
                View rootView,
                float density,
                int animDurationMs,
                int ringColor) {
            this.popupView = popupView;
            this.itemView = itemView;
            this.rootView = rootView;
            this.animDurationMs = Math.max(1, animDurationMs);
            this.paint.setStyle(Paint.Style.STROKE);
            this.paint.setStrokeWidth(2.5f * density);
            this.paint.setColor(ringColor);
        }

        void setFraction(float fraction) {
            this.fraction = Math.max(0f, Math.min(1f, fraction));
        }

        @Override
        public void draw(Canvas canvas) {
            if (fraction <= 0f) {
                return;
            }
            if (!itemView.isAttachedToWindow() || !rootView.isAttachedToWindow()) {
                return;
            }
            if (!highlightLookupDone && itemView.getWidth() > 0 && itemView.getHeight() > 0) {
                highlightLookupDone = true;
                resolvedHighlightView = findHighlightCircleView(popupView, itemView);
                if (resolvedHighlightView != null) {
                    int highlightRgb = ThiccTopBarGboardReflector.sampleViewDrawableRgb(resolvedHighlightView);
                    if (highlightRgb >= 0) {
                        ThiccTopBarGboardReflector.recordKeyboardThemeAccent(highlightRgb);
                        paint.setColor(0xFF000000 | highlightRgb);
                    }
                }
            }
            View measureView = (resolvedHighlightView != null
                    && resolvedHighlightView.isAttachedToWindow()
                    && resolvedHighlightView.getWidth() > 0
                    && resolvedHighlightView.getHeight() > 0)
                    ? resolvedHighlightView
                    : itemView;
            boolean exactHighlightBounds = measureView == resolvedHighlightView;

            int w = measureView.getWidth();
            int h = measureView.getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            measureView.getLocationInWindow(targetLoc);
            rootView.getLocationInWindow(rootLoc);

            float centerX = (targetLoc[0] - rootLoc[0]) + (w * 0.5f);
            float centerY = (targetLoc[1] - rootLoc[1]) + (h * 0.5f);

            float targetRadius = exactHighlightBounds
                    ? (Math.min(w, h) * 0.5f)
                    : (Math.min(w, h) * 0.46f);
            float startRadius = targetRadius * 1.85f;
            float currentRadius = startRadius + (targetRadius - startRadius) * fraction;

            float elapsedMs = fraction * animDurationMs;
            float alphaFactor = Math.min(1f, elapsedMs / FADE_IN_MS);
            int alpha = Math.round(MAX_ALPHA * alphaFactor);
            if (alpha <= 0) {
                return;
            }
            paint.setAlpha(alpha);
            canvas.drawCircle(centerX, centerY, currentRadius, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        @SuppressWarnings("deprecation")
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Determines whether a {@code SoftKeyDef} represents a normal character, number, or punctuation
     * key eligible for Custom Hold Popups (excluding Spacebar, Backspace, Shift, Enter,
     * Emoji/Symbol/Language switchers, and icon-based action/settings popups).
     *
     * @return the primary visible key label if eligible, or {@code null} if excluded.
     */
    static String extractEligibleKeyLabel(Object softKeyDef) {
        if (softKeyDef == null) return null;
        try {
            // 1. Must have a PRESS (Lqae.a) ActionDef whose primary KeyData commits/decodes a
            // single character/digit/punctuation string (not a special negative function keyCode).
            Object actionDefsObj = softKeyDefActionDefsField.get(softKeyDef);
            if (!(actionDefsObj instanceof List)) return null;
            List<?> actionDefs = (List<?>) actionDefsObj;

            Object pressActionDef = null;
            Object longPressActionDef = null;
            for (int i = 0; i < actionDefs.size(); i++) {
                Object ad = actionDefs.get(i);
                if (ad == null) continue;
                Object actionType = actionDefActionField.get(ad);
                if (actionType == actionPressEnum) {
                    pressActionDef = ad;
                } else if (actionType == actionLongPressEnum) {
                    longPressActionDef = ad;
                }
            }
            if (pressActionDef == null) {
                return null;
            }
            // Repeatable keys (e.g. Backspace continuous delete) or actionOnDown function keys are excluded
            if (actionDefRepeatableField.getBoolean(pressActionDef)) {
                return null;
            }

            Object pressKeyDatasObj = actionDefKeyDatasField.get(pressActionDef);
            if (!(pressKeyDatasObj instanceof List) || ((List<?>) pressKeyDatasObj).isEmpty()) {
                return null;
            }
            Object primaryKeyData = ((List<?>) pressKeyDatasObj).get(0);
            if (primaryKeyData == null) return null;

            int pressKeyCode = keyDataCodeField.getInt(primaryKeyData);
            Object pressIntention = keyDataIntentionField.get(primaryKeyData);
            Object pressData = keyDataDataField.get(primaryKeyData);

            // Must have a non-null COMMIT/DECODE intention (function keys like Shift, Enter,
            // Backspace, Emoji/Symbol switchers, One-Handed mode, Settings have intention == null
            // or negative function keyCodes without character data)
            if (pressIntention == null) {
                return null;
            }
            if (!(pressData instanceof String)) {
                return null;
            }
            String pressText = ((String) pressData).trim();
            if (!isEligibleBaseKeyString(pressText, pressKeyCode)) {
                return null;
            }

            // 2. If the key already has a LONG_PRESS ActionDef, verify it is not an icon-based
            // settings/IME switcher popup or special action popup.
            if (longPressActionDef != null) {
                int[] popupIcons = (int[]) actionDefPopupIconsField.get(longPressActionDef);
                if (popupIcons != null) {
                    int editIconId = cachedEditIconResId;
                    for (int iconId : popupIcons) {
                        if (iconId != 0 && iconId != editIconId) {
                            return null;
                        }
                    }
                }
                Object lpKeyDatasObj = actionDefKeyDatasField.get(longPressActionDef);
                if (lpKeyDatasObj instanceof List) {
                    List<?> lpKeyDatas = (List<?>) lpKeyDatasObj;
                    for (int i = 0; i < lpKeyDatas.size(); i++) {
                        Object kd = lpKeyDatas.get(i);
                        if (kd == null) continue;
                        int code = keyDataCodeField.getInt(kd);
                        if (code == PENCIL_SENTINEL_KEY_CODE) continue;
                        Object data = keyDataDataField.get(kd);
                        Object intention = keyDataIntentionField.get(kd);
                        // Special non-text long-press action (e.g. voice input, settings, clipboard, cursor)
                        if (intention == null || !(data instanceof String)) {
                            return null;
                        }
                    }
                }
            }

            // 3. Prefer visible label on the SoftKeyDef only when it matches pressText
            // (preserving shift casing without mistaking a corner hint label for the primary key).
            Object labelsObj = softKeyDefLabelsField.get(softKeyDef);
            if (labelsObj instanceof List && !((List<?>) labelsObj).isEmpty()) {
                Object firstLabel = ((List<?>) labelsObj).get(0);
                if (firstLabel instanceof CharSequence) {
                    String visible = firstLabel.toString().trim();
                    if (visible.equalsIgnoreCase(pressText)
                            && isEligibleBaseKeyString(visible, pressKeyCode)) {
                        return visible;
                    }
                }
            }
            return pressText;
        } catch (Throwable ignored) {
            return null;
        }
    }

    static boolean isEligibleBaseKeyString(String text, int keyCode) {
        if (text == null || text.isEmpty()) {
            return false;
        }
        int firstCp = text.codePointAt(0);
        // Spacebar (" ") or control characters are excluded, unless keyCode matches the Unicode
        // codepoint of the printable character itself (e.g. ';' = 59, '<' = 60, '>' = 62, 'B' = 66, 'C' = 67).
        if (firstCp != keyCode
                && (keyCode == 62 || keyCode == 66 || keyCode == 67 || keyCode == 59 || keyCode == 60)) {
            // KEYCODE_SPACE (62), KEYCODE_ENTER (66), KEYCODE_DEL (67), KEYCODE_SHIFT_LEFT/RIGHT (59/60)
            return false;
        }
        // Exclude negative system/IME keyCodes except Gboard text-input keyCodes:
        // -10043 = ALPHABET, -10009 = PLAIN_TEXT, -10027 = SHORT_TEXT,
        // -10139 = ALPHABET_LONG_PRESS, -10142 = DEAD_KEY, -60001 = PLAIN_TEXT_MOZC_AS_IS
        if (keyCode < 0
                && keyCode != -10043
                && keyCode != -10009
                && keyCode != -10027
                && keyCode != -10139
                && keyCode != -10142
                && keyCode != -60001) {
            return false;
        }
        int codePoints = text.codePointCount(0, text.length());
        if (codePoints != 1) {
            return false;
        }
        int cp = text.codePointAt(0);
        if (Character.isWhitespace(cp) || Character.isISOControl(cp)) {
            return false;
        }
        int type = Character.getType(cp);
        return Character.isLetterOrDigit(cp)
                || type == Character.CONNECTOR_PUNCTUATION
                || type == Character.DASH_PUNCTUATION
                || type == Character.START_PUNCTUATION
                || type == Character.END_PUNCTUATION
                || type == Character.INITIAL_QUOTE_PUNCTUATION
                || type == Character.FINAL_QUOTE_PUNCTUATION
                || type == Character.OTHER_PUNCTUATION
                || type == Character.MATH_SYMBOL
                || type == Character.CURRENCY_SYMBOL
                || type == Character.MODIFIER_SYMBOL
                || type == Character.OTHER_SYMBOL;
    }

    private static Object buildAugmentedSoftKeyDef(
            Object originalSoftKeyDef,
            String normalizedBaseKey,
            boolean shifted,
            GboardCustomHoldPopupsSettings.KeyHoldRules keyRules,
            boolean lockKeys) throws Exception {
        Object actionDefsObj = softKeyDefActionDefsField.get(originalSoftKeyDef);
        if (!(actionDefsObj instanceof List)) return originalSoftKeyDef;
        List<?> originalActionDefs = (List<?>) actionDefsObj;

        Object pressActionDef = null;
        Object existingLongPressDef = null;
        int existingLongPressIndex = -1;

        for (int i = 0; i < originalActionDefs.size(); i++) {
            Object ad = originalActionDefs.get(i);
            if (ad == null) continue;
            Object actionType = actionDefActionField.get(ad);
            if (actionType == actionPressEnum) {
                pressActionDef = ad;
            } else if (actionType == actionLongPressEnum) {
                existingLongPressDef = ad;
                existingLongPressIndex = i;
            }
        }
        if (pressActionDef == null) return originalSoftKeyDef;

        List<?> pressKeyDatas = (List<?>) actionDefKeyDatasField.get(pressActionDef);
        Object pressPrimaryKeyData = pressKeyDatas.get(0);
        int baseKeyCode = keyDataCodeField.getInt(pressPrimaryKeyData);
        Object baseIntention = keyDataIntentionField.get(pressPrimaryKeyData);
        Object commitIntention = intentionCommitEnum != null ? intentionCommitEnum : baseIntention;

        Map<String, String> modifiedDefaults = keyRules != null
                ? keyRules.modifiedDefaults
                : Collections.emptyMap();
        List<String> addedSymbols = keyRules != null
                ? keyRules.addedSymbols
                : Collections.emptyList();

        List<Object> newKeyDatas = new ArrayList<Object>();
        List<String> newPopupLabels = new ArrayList<String>();

        // 1. Existing default LONG_PRESS symbols (with any user modifications applied)
        if (existingLongPressDef != null) {
            List<?> origKeyDatas = (List<?>) actionDefKeyDatasField.get(existingLongPressDef);
            List<?> origLabels = (List<?>) actionDefPopupLabelsField.get(existingLongPressDef);
            for (int i = 0; i < origKeyDatas.size(); i++) {
                Object origKd = origKeyDatas.get(i);
                if (origKd == null) continue;
                int origCode = keyDataCodeField.getInt(origKd);
                if (origCode == PENCIL_SENTINEL_KEY_CODE) continue;
                Object origData = keyDataDataField.get(origKd);
                if (!(origData instanceof String)) continue;
                String origSymbol = (String) origData;
                if (GboardCustomHoldPopupsSettings.PENCIL_SYMBOL.equals(origSymbol)) continue;

                String origLabel = (origLabels != null && i < origLabels.size()
                        && origLabels.get(i) instanceof String
                        && !((String) origLabels.get(i)).isEmpty())
                        ? (String) origLabels.get(i)
                        : origSymbol;

                String normalizedOrig =
                        GboardCustomHoldPopupsSettings.normalizeDefaultKey(origSymbol);
                String customReplacement = modifiedDefaults.get(normalizedOrig);

                Object finalKd;
                String finalLabel;
                if (customReplacement != null && !customReplacement.isEmpty()) {
                    String displayReplacement =
                            GboardCustomHoldPopupsSettings.applyShiftCaseIfSingleLetter(
                                    customReplacement, shifted);
                    boolean singleLetter = isSingleLetterSymbol(displayReplacement);
                    Object intention = singleLetter
                            ? keyDataIntentionField.get(origKd)
                            : commitIntention;
                    int code = singleLetter ? origCode : PLAIN_TEXT_KEY_CODE;
                    finalKd = createKeyData(code, intention, displayReplacement);
                    finalLabel = displayReplacement;
                } else {
                    finalKd = createKeyData(
                            origCode,
                            keyDataIntentionField.get(origKd),
                            origSymbol);
                    finalLabel = origLabel;
                }
                String storedRuleSymbol = (customReplacement != null && !customReplacement.isEmpty())
                        ? customReplacement
                        : normalizedOrig;
                KEY_DATA_META.put(
                        finalKd,
                        new PopupItemMeta(
                                normalizedBaseKey,
                                storedRuleSymbol,
                                normalizedOrig,
                                false,
                                -1,
                                false));
                newKeyDatas.add(finalKd);
                newPopupLabels.add(finalLabel);
            }
        }

        // 2. User-added custom symbols for this base key (applied globally across all languages)
        for (int i = 0; i < addedSymbols.size(); i++) {
            String rawAdded = addedSymbols.get(i);
            if (rawAdded == null || rawAdded.isEmpty()) continue;
            String displayAdded = GboardCustomHoldPopupsSettings.applyShiftCaseIfSingleLetter(
                    rawAdded, shifted);
            boolean singleLetter = isSingleLetterSymbol(displayAdded);
            Object intention = singleLetter ? baseIntention : commitIntention;
            int code = singleLetter ? baseKeyCode : PLAIN_TEXT_KEY_CODE;
            Object addedKd = createKeyData(code, intention, displayAdded);
            KEY_DATA_META.put(
                    addedKd,
                    new PopupItemMeta(
                            normalizedBaseKey,
                            rawAdded,
                            "",
                            true,
                            i,
                            false));
            newKeyDatas.add(addedKd);
            newPopupLabels.add(displayAdded);
        }

        // 3. Trailing Edit/Add option to add a new symbol (unless keys are locked)
        boolean includeEditIcon = !lockKeys;
        if (includeEditIcon) {
            Object pencilKd = createKeyData(
                    PENCIL_SENTINEL_KEY_CODE,
                    commitIntention,
                    GboardCustomHoldPopupsSettings.PENCIL_SYMBOL);
            KEY_DATA_META.put(
                    pencilKd,
                    new PopupItemMeta(
                            normalizedBaseKey,
                            GboardCustomHoldPopupsSettings.PENCIL_SYMBOL,
                            "",
                            false,
                            -1,
                            true));
            newKeyDatas.add(pencilKd);
        }

        if (newKeyDatas.isEmpty()) {
            return originalSoftKeyDef;
        }

        int itemCount = newKeyDatas.size();
        int[] newPopupIcons = new int[itemCount];
        if (includeEditIcon) {
            int editIconResId = resolveEditIconResId(cachedContext);
            if (editIconResId != 0) {
                newPopupIcons[itemCount - 1] = editIconResId;
            } else {
                newPopupLabels.add(GboardCustomHoldPopupsSettings.PENCIL_SYMBOL);
            }
        }
        Object keyDatasImmutable = toImmutableList(newKeyDatas.toArray(new Object[0]));
        Object popupLabelsImmutable = toImmutableList(newPopupLabels.toArray(new Object[0]));

        boolean actionOnDown = existingLongPressDef != null
                && actionDefActionOnDownField.getBoolean(existingLongPressDef);
        boolean repeatable = false;
        int existingPopupLayoutId = existingLongPressDef != null
                ? actionDefPopupLayoutField.getInt(existingLongPressDef)
                : 0;
        if (existingPopupLayoutId != 0 && cachedPopupLayoutId == 0) {
            cachedPopupLayoutId = existingPopupLayoutId;
        }
        int popupLayoutId = existingPopupLayoutId != 0
                ? existingPopupLayoutId
                : (cachedPopupLayoutId != 0 ? cachedPopupLayoutId : DEFAULT_POPUP_LAYOUT_THEME_ATTR);
        boolean alwaysShowPopup = true;
        boolean playMediaEffect = existingLongPressDef == null
                || actionDefPlayMediaField.getBoolean(existingLongPressDef);
        boolean playMediaEffectOnRelease = existingLongPressDef == null
                || actionDefPlayReleaseField.getBoolean(existingLongPressDef);
        int iconBackgroundLevel = existingLongPressDef != null
                ? actionDefIconBgLevelField.getInt(existingLongPressDef)
                : 0;
        int mergeInsertionIndex = existingLongPressDef != null
                ? actionDefMergeIdxField.getInt(existingLongPressDef)
                : -1;
        String contentDescription = existingLongPressDef != null
                ? (String) actionDefContentDescField.get(existingLongPressDef)
                : null;
        boolean suppressLongClick = false;

        Object newLongPressActionDef = actionDefCtor.newInstance(
                actionLongPressEnum,
                keyDatasImmutable,
                actionOnDown,
                repeatable,
                popupLayoutId,
                alwaysShowPopup,
                playMediaEffect,
                playMediaEffectOnRelease,
                iconBackgroundLevel,
                mergeInsertionIndex,
                contentDescription,
                popupLabelsImmutable,
                newPopupIcons,
                suppressLongClick);

        List<Object> updatedActionDefs = new ArrayList<Object>(originalActionDefs.size() + 1);
        for (int i = 0; i < originalActionDefs.size(); i++) {
            if (i == existingLongPressIndex) {
                updatedActionDefs.add(newLongPressActionDef);
            } else {
                updatedActionDefs.add(originalActionDefs.get(i));
            }
        }
        if (existingLongPressIndex < 0) {
            updatedActionDefs.add(newLongPressActionDef);
        }

        Object actionDefsImmutable = toImmutableList(updatedActionDefs.toArray(new Object[0]));
        Field[] ctorFields = softKeyDefCtorFields;
        int actionDefsIdx = softKeyDefActionDefsParamIndex;
        Object[] ctorArgs = new Object[ctorFields.length];
        for (int i = 0; i < ctorFields.length; i++) {
            ctorArgs[i] = (i == actionDefsIdx)
                    ? actionDefsImmutable
                    : ctorFields[i].get(originalSoftKeyDef);
        }
        return softKeyDefCtor.newInstance(ctorArgs);
    }

    private static boolean isSingleLetterSymbol(String s) {
        return s != null
                && !s.isEmpty()
                && s.codePointCount(0, s.length()) == 1
                && Character.isLetter(s.codePointAt(0));
    }

    private static Object createKeyData(int keyCode, Object intention, Object data)
            throws Exception {
        return keyDataCtor.newInstance(keyCode, intention, data, Integer.MAX_VALUE);
    }

    private static int resolveEditIconResId(Context context) {
        int cached = cachedEditIconResId;
        if (cached >= 0) {
            return cached;
        }
        if (context == null) {
            return 0;
        }
        try {
            int resId = context.getResources().getIdentifier(
                    EDIT_ICON_DRAWABLE_NAME, "drawable", context.getPackageName());
            cachedEditIconResId = resId;
            return resId;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static Object toImmutableList(Object[] array) throws Exception {
        return immutableListCopyOfArrayMethod.invoke(null, (Object) array);
    }

    private static void refreshActiveSoftKeyViewsOnMainThread() {
        if (refreshingKeyboards) return;
        refreshingKeyboards = true;
        try {
            refreshSettingsIfNeeded(cachedContext, true);
            List<Map.Entry<Object, Object>> snapshot;
            synchronized (ACTIVE_SOFT_KEY_VIEWS) {
                snapshot = new ArrayList<Map.Entry<Object, Object>>(
                        ACTIVE_SOFT_KEY_VIEWS.entrySet());
            }
            for (Map.Entry<Object, Object> entry : snapshot) {
                Object viewObj = entry.getKey();
                Object originalDef = entry.getValue();
                if (!(viewObj instanceof View) || originalDef == null) continue;
                try {
                    View view = (View) viewObj;
                    ensureSoftKeyViewReflection(view);
                    if (softKeyViewDefField == null || softKeyViewSetDefMethod == null) continue;
                    long stateBits = softKeyViewStateField != null
                            ? softKeyViewStateField.getLong(view)
                            : 0L;
                    // Clear current SoftKeyDef reference so SoftKeyView.s(SoftKeyDef, J) does not
                    // short-circuit on `if (newDef == this.e) return false;`
                    softKeyViewDefField.set(view, null);
                    softKeyViewSetDefMethod.invoke(view, originalDef, stateBits);
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "refreshActiveSoftKeyViewsOnMainThread failed", t);
        } finally {
            refreshingKeyboards = false;
        }
    }

    private static void launchEditorDialogFromKeyboard(
            Context context,
            String mode,
            String baseKey,
            String currentSymbol,
            String originalSymbol,
            boolean userAdded,
            int addedIndex) {
        Context ctx = context != null ? context : cachedContext;
        if (ctx == null) return;
        postToMainThread(() -> {
            try {
                Intent intent = new Intent(ctx, GboardPatchesSettingsActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
                ArrayList<String> navPath = new ArrayList<String>(1);
                navPath.add(GboardCustomHoldPopupsSettingsFeature.class.getName());
                intent.putStringArrayListExtra(
                        GboardPatchesSettingsActivity.EXTRA_NAVIGATION_PATH, navPath);
                intent.putExtra(
                        GboardPatchesSettingsActivity.EXTRA_HOLD_POPUP_EDITOR_MODE, mode);
                intent.putExtra(
                        GboardPatchesSettingsActivity.EXTRA_HOLD_POPUP_BASE_KEY, baseKey);
                intent.putExtra(
                        GboardPatchesSettingsActivity.EXTRA_HOLD_POPUP_CURRENT_SYMBOL,
                        currentSymbol == null ? "" : currentSymbol);
                intent.putExtra(
                        GboardPatchesSettingsActivity.EXTRA_HOLD_POPUP_ORIGINAL_SYMBOL,
                        originalSymbol == null ? "" : originalSymbol);
                intent.putExtra(
                        GboardPatchesSettingsActivity.EXTRA_HOLD_POPUP_IS_USER_ADDED, userAdded);
                intent.putExtra(
                        GboardPatchesSettingsActivity.EXTRA_HOLD_POPUP_ADDED_INDEX, addedIndex);
                ctx.startActivity(intent);
            } catch (Throwable t) {
                Log.w(TAG, "Failed to launch Custom Hold Popups editor activity", t);
            }
        });
    }

    private static boolean commitTextDirectlyToInputConnection(
            Object basicHandlerObj,
            Context context,
            String text) {
        if (text == null || text.isEmpty()) return false;
        try {
            InputConnection ic = resolveActiveInputConnection(basicHandlerObj, context);
            if (ic != null) {
                ic.finishComposingText();
                ic.commitText(text, 1);
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "commitTextDirectlyToInputConnection failed", t);
        }
        return false;
    }

    private static InputConnection resolveActiveInputConnection(
            Object basicHandlerObj,
            Context context) {
        Context ctx = context != null ? context : cachedContext;
        try {
            Context cur = ctx;
            while (cur instanceof ContextWrapper && !(cur instanceof InputMethodService)) {
                cur = ((ContextWrapper) cur).getBaseContext();
            }
            if (cur instanceof InputMethodService) {
                InputConnection ic = ((InputMethodService) cur).getCurrentInputConnection();
                if (ic != null) return ic;
            }
        } catch (Throwable ignored) {
        }
        if (basicHandlerObj != null) {
            try {
                for (Class<?> c = basicHandlerObj.getClass();
                        c != null && c != Object.class;
                        c = c.getSuperclass()) {
                    for (Field f : c.getDeclaredFields()) {
                        if (View.class.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            Object v = f.get(basicHandlerObj);
                            if (v instanceof View) {
                                InputConnection ic = ThiccTopBarGboardReflector
                                        .resolveInputConnectionViaHierarchy((View) v);
                                if (ic != null) return ic;
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static void triggerEditHapticFeedback(
            Context context,
            Object touchActionBundleObj,
            Object popupManagerObj) {
        try {
            if (context != null) {
                Vibrator vibrator = null;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    VibratorManager vm = context.getSystemService(VibratorManager.class);
                    if (vm != null) {
                        vibrator = vm.getDefaultVibrator();
                    }
                }
                if (vibrator == null) {
                    vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
                }
                if (vibrator != null && vibrator.hasVibrator()) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        vibrator.vibrate(VibrationEffect.createPredefined(
                                VibrationEffect.EFFECT_HEAVY_CLICK));
                    } else {
                        vibrator.vibrate(VibrationEffect.createOneShot(20L, 120));
                    }
                    return;
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            if (touchActionBundleObj != null && bundleSoftKeyViewField != null) {
                Object skv = bundleSoftKeyViewField.get(touchActionBundleObj);
                if (skv instanceof View) {
                    ((View) skv).performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                    return;
                }
            }
            if (popupManagerObj != null && popupKeyboardViewField != null) {
                Object kbv = popupKeyboardViewField.get(popupManagerObj);
                if (kbv instanceof View) {
                    ((View) kbv).performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static String resolveBaseKeyFromDefOrBundle(
            Object softKeyDefObj,
            Object touchActionBundleObj) {
        String fromDef = resolveBaseKeyFromDef(softKeyDefObj);
        if (fromDef != null && !fromDef.isEmpty()) {
            return fromDef;
        }
        if (touchActionBundleObj != null) {
            try {
                ensureBundleAndPopupReflection(touchActionBundleObj, null);
                if (bundleSoftKeyViewField != null) {
                    Object skv = bundleSoftKeyViewField.get(touchActionBundleObj);
                    if (skv != null) {
                        ensureSoftKeyViewReflection(skv);
                        if (softKeyViewDefField != null) {
                            Object def = softKeyViewDefField.get(skv);
                            String fromViewDef = resolveBaseKeyFromDef(def);
                            if (fromViewDef != null && !fromViewDef.isEmpty()) {
                                return fromViewDef;
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static String resolveBaseKeyFromDef(Object softKeyDefObj) {
        if (softKeyDefObj == null) return null;
        String mapped = AUGMENTED_DEF_BASE_KEY.get(softKeyDefObj);
        if (mapped != null) return mapped;
        String raw = extractEligibleKeyLabel(softKeyDefObj);
        return raw != null ? GboardCustomHoldPopupsSettings.normalizeBaseKey(raw) : null;
    }

    private static Context resolveContext(Object basicHandlerObj, Object touchActionBundleObj) {
        if (cachedContext != null) {
            return cachedContext;
        }
        try {
            if (touchActionBundleObj != null) {
                ensureBundleAndPopupReflection(touchActionBundleObj, null);
                if (bundleSoftKeyViewField != null) {
                    Object v = bundleSoftKeyViewField.get(touchActionBundleObj);
                    if (v instanceof View && ((View) v).getContext() != null) {
                        cachedContext = ((View) v).getContext();
                        return cachedContext;
                    }
                }
                if (bundlePopupManagerField != null) {
                    Object pm = bundlePopupManagerField.get(touchActionBundleObj);
                    if (pm != null) {
                        ensureBundleAndPopupReflection(touchActionBundleObj, pm);
                        if (popupContextField != null) {
                            Object c = popupContextField.get(pm);
                            if (c instanceof Context) {
                                cachedContext = (Context) c;
                                return cachedContext;
                            }
                        }
                    }
                }
            }
            if (basicHandlerObj != null) {
                for (Class<?> c = basicHandlerObj.getClass();
                        c != null && c != Object.class;
                        c = c.getSuperclass()) {
                    for (Field f : c.getDeclaredFields()) {
                        if (Context.class.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            Object ctx = f.get(basicHandlerObj);
                            if (ctx instanceof Context) {
                                cachedContext = (Context) ctx;
                                return cachedContext;
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return cachedContext;
    }

    private static boolean ensureReflectionInitialized(
            ClassLoader classLoader,
            Object sampleSoftKeyDef) {
        if (reflectionReady) return true;
        if (reflectionFailed) return false;
        synchronized (GboardCustomHoldPopupsRuntime.class) {
            if (reflectionReady) return true;
            if (reflectionFailed) return false;
            try {
                Class<?> skdCls = sampleSoftKeyDef != null
                        ? sampleSoftKeyDef.getClass()
                        : Class.forName(
                                "com.google.android.libraries.inputmethod.metadata.SoftKeyDef",
                                false,
                                classLoader);
                softKeyDefClass = skdCls;

                // Resolve SoftKeyDef primary constructor and non-static, non-transient fields
                // structurally so both 18.5.4 (10-arg with Compose) and 18.8.1+ (20-arg Kotlin)
                // work identically without hardcoding obfuscated field letters.
                List<Field> skdFields = collectInstanceCtorFields(skdCls);
                Constructor<?> skdCtor = findMatchingPrimaryConstructor(skdCls, skdFields);
                if (skdCtor == null) {
                    throw new NoSuchMethodException(
                            "Could not match primary SoftKeyDef constructor to " + skdFields.size() + " fields");
                }
                skdCtor.setAccessible(true);
                softKeyDefCtor = skdCtor;
                softKeyDefCtorFields = skdFields.toArray(new Field[0]);

                int listFieldCount = 0;
                for (int i = 0; i < skdFields.size(); i++) {
                    Field f = skdFields.get(i);
                    if (List.class.isAssignableFrom(f.getType())) {
                        if (listFieldCount == 0) {
                            softKeyDefActionDefsField = f;
                            softKeyDefActionDefsParamIndex = i;
                        } else if (listFieldCount == 1) {
                            softKeyDefLabelsField = f;
                        }
                        listFieldCount++;
                    }
                }
                if (softKeyDefActionDefsField == null || softKeyDefLabelsField == null) {
                    throw new NoSuchFieldException("Could not locate actionDefs/labels fields on SoftKeyDef");
                }

                Class<?> immutableListClass = softKeyDefActionDefsField.getType();
                Method copyOfArray = null;
                for (Method m : immutableListClass.getDeclaredMethods()) {
                    int mods = m.getModifiers();
                    if (Modifier.isPublic(mods)
                            && Modifier.isStatic(mods)
                            && m.getReturnType() == immutableListClass
                            && m.getParameterCount() == 1
                            && m.getParameterTypes()[0] == Object[].class) {
                        copyOfArray = m;
                        break;
                    }
                }
                if (copyOfArray == null) {
                    throw new NoSuchMethodException(
                            "Could not find public static copyOf(Object[]) on " + immutableListClass.getName());
                }
                copyOfArray.setAccessible(true);
                immutableListCopyOfArrayMethod = copyOfArray;

                Class<?> adCls = Class.forName(
                        "com.google.android.libraries.inputmethod.metadata.ActionDef",
                        false,
                        classLoader);
                actionDefClass = adCls;
                List<Field> adFields = collectInstanceCtorFields(adCls);
                Constructor<?> adCtor = findMatchingPrimaryConstructor(adCls, adFields);
                if (adCtor == null || adFields.size() < 14) {
                    throw new NoSuchMethodException(
                            "Could not match primary ActionDef constructor to " + adFields.size() + " fields");
                }
                adCtor.setAccessible(true);
                actionDefCtor = adCtor;
                actionDefActionField = adFields.get(0);
                actionDefKeyDatasField = adFields.get(1);
                actionDefActionOnDownField = adFields.get(2);
                actionDefRepeatableField = adFields.get(3);
                actionDefPopupLayoutField = adFields.get(4);
                actionDefAlwaysShowField = adFields.get(5);
                actionDefPlayMediaField = adFields.get(6);
                actionDefPlayReleaseField = adFields.get(7);
                actionDefIconBgLevelField = adFields.get(8);
                actionDefMergeIdxField = adFields.get(9);
                actionDefContentDescField = adFields.get(10);
                actionDefPopupLabelsField = adFields.get(11);
                actionDefPopupIconsField = adFields.get(12);
                actionDefSuppressLongField = adFields.get(13);

                Class<?> actionEnumCls = actionDefActionField.getType();
                actionPressEnum = findEnumConstant(actionEnumCls, "PRESS", "a");
                actionLongPressEnum = findEnumConstant(actionEnumCls, "LONG_PRESS", "b");

                // Derive KeyData class dynamically from ActionDef's zero-arg KeyData getter
                // (e.g. ActionDef.b() -> Lqbc in 18.5.4, Lagmb in 18.8.1).
                Class<?> kdCls = null;
                for (Method m : adCls.getDeclaredMethods()) {
                    if (!Modifier.isStatic(m.getModifiers())
                            && m.getParameterCount() == 0
                            && !m.getReturnType().isPrimitive()
                            && m.getReturnType() != String.class
                            && m.getReturnType() != Object.class) {
                        kdCls = m.getReturnType();
                        break;
                    }
                }
                if (kdCls != null) {
                    initKeyDataClass(kdCls);
                }

                reflectionReady = true;
                return true;
            } catch (Throwable t) {
                reflectionFailed = true;
                Log.w(TAG, "Failed to initialize Custom Hold Popups reflection", t);
                return false;
            }
        }
    }

    private static List<Field> collectInstanceCtorFields(Class<?> cls) {
        List<Field> fields = new ArrayList<Field>();
        for (Field f : cls.getDeclaredFields()) {
            int mods = f.getModifiers();
            if (Modifier.isStatic(mods) || Modifier.isTransient(mods)) {
                continue;
            }
            f.setAccessible(true);
            fields.add(f);
        }
        return fields;
    }

    private static Constructor<?> findMatchingPrimaryConstructor(
            Class<?> cls,
            List<Field> instanceFields) {
        for (Constructor<?> ctor : cls.getDeclaredConstructors()) {
            Class<?>[] params = ctor.getParameterTypes();
            if (params.length != instanceFields.size()) {
                continue;
            }
            boolean match = true;
            for (int i = 0; i < params.length; i++) {
                if (!params[i].equals(instanceFields.get(i).getType())) {
                    match = false;
                    break;
                }
            }
            if (match) {
                return ctor;
            }
        }
        return null;
    }

    private static Object findEnumConstant(
            Class<?> enumCls,
            String expectedName,
            String fallbackFieldName) throws Exception {
        Object[] constants = enumCls.getEnumConstants();
        if (constants != null) {
            for (Object constant : constants) {
                if (constant instanceof Enum<?> && expectedName.equals(((Enum<?>) constant).name())) {
                    return constant;
                }
            }
        }
        return findDeclaredField(enumCls, fallbackFieldName).get(null);
    }

    private static void ensureKeyDataReflection(Object sampleKeyData) throws Exception {
        if (keyDataCtor != null) return;
        if (sampleKeyData != null) {
            initKeyDataClass(sampleKeyData.getClass());
        }
    }

    private static synchronized void initKeyDataClass(Class<?> kdCls) throws Exception {
        if (keyDataCtor != null) return;
        keyDataClass = kdCls;
        Field codeField = null;
        Field intentionField = null;
        Field dataField = null;
        for (Field f : kdCls.getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers())) continue;
            f.setAccessible(true);
            Class<?> ft = f.getType();
            if (codeField == null && ft == int.class) {
                codeField = f;
            } else if (intentionField == null && ft.isEnum()) {
                intentionField = f;
            } else if (dataField == null && ft == Object.class) {
                dataField = f;
            }
        }
        if (codeField == null || intentionField == null || dataField == null) {
            throw new NoSuchFieldException(
                    "Could not resolve KeyData fields on " + kdCls.getName());
        }
        keyDataCodeField = codeField;
        keyDataIntentionField = intentionField;
        keyDataDataField = dataField;
        Class<?> intentionEnumCls = keyDataIntentionField.getType();
        intentionCommitEnum = findEnumConstant(intentionEnumCls, "COMMIT", "c");
        keyDataCtor = kdCls.getDeclaredConstructor(
                int.class, intentionEnumCls, Object.class, int.class);
        keyDataCtor.setAccessible(true);
    }

    private static void ensureSoftKeyViewReflection(Object softKeyViewObj) {
        if (softKeyViewSetDefMethod != null || softKeyViewObj == null) return;
        synchronized (EXTRA_REFLECTION_LOCK) {
            if (softKeyViewSetDefMethod != null) return;
            try {
                Class<?> skvCls = softKeyViewObj.getClass();
                Field defField = softKeyViewDefField;
                Field stateField = softKeyViewStateField;
                Method setDefMethod = null;
                for (Class<?> c = skvCls; c != null && c != Object.class; c = c.getSuperclass()) {
                    for (Field f : c.getDeclaredFields()) {
                        if (Modifier.isStatic(f.getModifiers())) continue;
                        if (defField == null && f.getType().getName().endsWith("SoftKeyDef")) {
                            f.setAccessible(true);
                            defField = f;
                        } else if (stateField == null && f.getType() == long.class) {
                            f.setAccessible(true);
                            stateField = f;
                        }
                    }
                    if (setDefMethod == null && defField != null) {
                        for (Method m : c.getDeclaredMethods()) {
                            if (!Modifier.isStatic(m.getModifiers())
                                    && m.getReturnType() == boolean.class
                                    && m.getParameterCount() == 2
                                    && m.getParameterTypes()[0] == defField.getType()
                                    && m.getParameterTypes()[1] == long.class) {
                                m.setAccessible(true);
                                setDefMethod = m;
                                break;
                            }
                        }
                    }
                }
                softKeyViewDefField = defField;
                softKeyViewStateField = stateField;
                // Publish guard field last so readers observe initialized sibling fields
                softKeyViewSetDefMethod = setDefMethod;
            } catch (Throwable ignored) {
            }
        }
    }

    private static void ensureBundleAndPopupReflection(
            Object touchActionBundleObj,
            Object popupManagerObj) {
        boolean needBundle = touchActionBundleObj != null && bundlePopupManagerField == null;
        boolean needPopup = popupManagerObj != null && popupSelectedKeyDataField == null;
        if (!needBundle && !needPopup) return;
        synchronized (EXTRA_REFLECTION_LOCK) {
            try {
                if (touchActionBundleObj != null && bundlePopupManagerField == null) {
                    Class<?> bundleCls = touchActionBundleObj.getClass();
                    Field skvField = null;
                    Field adField = null;
                    Field pmField = null;
                    for (Field f : bundleCls.getDeclaredFields()) {
                        if (Modifier.isStatic(f.getModifiers())) continue;
                        Class<?> ft = f.getType();
                        String typeName = ft.getName();
                        if (skvField == null && typeName.endsWith("SoftKeyView")) {
                            f.setAccessible(true);
                            skvField = f;
                        } else if (adField == null && typeName.endsWith("ActionDef")) {
                            f.setAccessible(true);
                            adField = f;
                        } else if (pmField == null && AutoCloseable.class.isAssignableFrom(ft)
                                && looksLikePopupManagerClass(ft)) {
                            f.setAccessible(true);
                            pmField = f;
                        }
                    }
                    bundleSoftKeyViewField = skvField;
                    bundleActionDefField = adField;
                    if (skvField != null && softKeyViewDefField == null) {
                        for (Field f : skvField.getType().getDeclaredFields()) {
                            if (!Modifier.isStatic(f.getModifiers())
                                    && f.getType().getName().endsWith("SoftKeyDef")) {
                                f.setAccessible(true);
                                softKeyViewDefField = f;
                                break;
                            }
                        }
                    }
                    // Close-popup helper on TouchActionBundle: C()V in 18.5.4, E()V in 18.8.1.
                    for (String closeName : new String[]{"C", "E"}) {
                        try {
                            Method closePopup = bundleCls.getDeclaredMethod(closeName);
                            if (closePopup.getReturnType() == void.class) {
                                closePopup.setAccessible(true);
                                bundleClosePopupMethod = closePopup;
                                break;
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                    // Publish guard field last
                    bundlePopupManagerField = pmField;
                }
                if (popupManagerObj != null && popupSelectedKeyDataField == null) {
                    Class<?> pmCls = popupManagerObj.getClass();
                    Field ctxField = null;
                    Field viewField = null;
                    Field kbViewField = null;
                    Field selectedKdField = null;
                    Class<?> kdCls = keyDataClass;
                    for (Field f : pmCls.getDeclaredFields()) {
                        int mods = f.getModifiers();
                        if (Modifier.isStatic(mods)) continue;
                        Class<?> ft = f.getType();
                        String typeName = ft.getName();
                        if (ctxField == null && Context.class.isAssignableFrom(ft)) {
                            f.setAccessible(true);
                            ctxField = f;
                        } else if (kbViewField == null && typeName.endsWith("SoftKeyboardView")) {
                            f.setAccessible(true);
                            kbViewField = f;
                        } else if (viewField == null && ft == View.class && !Modifier.isFinal(mods)) {
                            f.setAccessible(true);
                            viewField = f;
                        } else if (selectedKdField == null && kdCls != null && ft == kdCls) {
                            f.setAccessible(true);
                            selectedKdField = f;
                        }
                    }
                    if (viewField == null) {
                        viewField = findDeclaredFieldOrNull(pmCls, "e");
                    }
                    if (selectedKdField == null) {
                        selectedKdField = findDeclaredFieldOrNull(pmCls, "f");
                    }
                    popupContextField = ctxField;
                    popupViewField = viewField;
                    popupKeyboardViewField = kbViewField;
                    try {
                        Method isShowing = pmCls.getDeclaredMethod("b");
                        if (isShowing.getReturnType() == boolean.class) {
                            isShowing.setAccessible(true);
                            popupIsShowingMethod = isShowing;
                        }
                    } catch (Throwable ignored) {
                    }
                    for (Method m : pmCls.getDeclaredMethods()) {
                        if (!Modifier.isStatic(m.getModifiers())
                                && m.getReturnType() == void.class
                                && m.getParameterCount() == 1
                                && m.getParameterTypes()[0] == long.class) {
                            m.setAccessible(true);
                            popupHideMethod = m;
                            break;
                        }
                    }
                    // Publish guard field last
                    popupSelectedKeyDataField = selectedKdField;
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static boolean looksLikePopupManagerClass(Class<?> cls) {
        for (Method m : cls.getDeclaredMethods()) {
            if (!Modifier.isStatic(m.getModifiers())
                    && m.getReturnType() == boolean.class
                    && m.getParameterCount() == 3
                    && m.getParameterTypes()[0] == float.class
                    && m.getParameterTypes()[1] == float.class
                    && m.getParameterTypes()[2] == boolean.class) {
                return true;
            }
        }
        return false;
    }

    private static Field findDeclaredField(Class<?> cls, String name) throws NoSuchFieldException {
        Field f = cls.getDeclaredField(name);
        f.setAccessible(true);
        return f;
    }

    private static Field findDeclaredFieldOrNull(Class<?> cls, String name) {
        try {
            Field f = cls.getDeclaredField(name);
            f.setAccessible(true);
            return f;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
