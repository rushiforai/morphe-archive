package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.MotionEvent;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Intercepts Spacebar long-press events ({@code keyCode == -10022}, {@code data == "space"}) inside
 * Gboard's {@code LanguagePickerExtension} and triggers {@code AgenticDictationExtension} (Rambler
 * start/stop) directly under the user's thumb with zero extra keyboard height.
 *
 * <p>Supports three trigger modes (configurable in settings):</p>
 * <ul>
 *   <li>{@link RamblerEnhancementsSettings#SPACEBAR_MODE_HYBRID} (default, like Hex on macOS):
 *       holding Spacebar starts Rambler; releasing quickly (&lt; {@value #HYBRID_HOLD_THRESHOLD_MS}ms
 *       after trigger) keeps Rambler listening hands-free, while continuing to hold while speaking
 *       and then releasing immediately stops &amp; transcribes.</li>
 *   <li>{@link RamblerEnhancementsSettings#SPACEBAR_MODE_HOLD} (Push-to-Talk): releasing your thumb
 *       after starting Rambler immediately stops listening &amp; transcribes.</li>
 *   <li>{@link RamblerEnhancementsSettings#SPACEBAR_MODE_TOGGLE} (Hands-free): long-press toggles
 *       Rambler on/off without reacting to finger release.</li>
 * </ul>
 *
 * <p>Leaves normal Spacebar taps, Spacebar cursor-glide, Globe key taps, floating globe
 * long-presses, and the bottom-right keyboard switcher button completely untouched, and hooks
 * {@code LanguagePickerExtension} + {@code SoftKeyboardView.dispatchTouchEvent} rather than
 * GboardWu's hooks so it stacks conflict-free alongside GboardWu.</p>
 */
public final class RamblerSpacebarTrigger {
    private static final String TAG = "RamblerEnhancements";
    private static final String MODULE_MANAGER_CLASS =
            "com.google.android.libraries.inputmethod.module.ModuleManager";
    public static final int KEYCODE_SHOW_SYSTEM_IME_PICKER = -10022;
    public static final int KEYCODE_SWITCH_KEYBOARD = -10004;
    public static final int KEYCODE_SWITCH_KEYBOARD_WITH_PAYLOAD = -10104;
    public static final String DATA_SPACE = "space";
    public static final String DATA_FREE_CURSOR = "free_cursor";
    private static final String ACTION_LONG_PRESS = "LONG_PRESS";
    public static final long HYBRID_HOLD_THRESHOLD_MS = 600L;
    private static final long HOLD_ASYNC_STOP_WINDOW_MS = 400L;
    private static final long HOLD_ASYNC_STOP_RECHECK_DELAY_MS = 200L;

    interface Clock {
        long elapsedRealtime();
    }

    private static final Clock SYSTEM_CLOCK = new Clock() {
        @Override
        public long elapsedRealtime() {
            return SystemClock.elapsedRealtime();
        }
    };

    private static volatile Clock clock = SYSTEM_CLOCK;
    private static volatile WeakReference<Object> agenticExtensionRef;
    private static volatile WeakReference<Context> appContextRef;

    private static volatile boolean pendingHoldRelease;
    private static volatile long pendingTriggerElapsedMs;
    private static volatile int pendingTriggerGeneration;

    private static volatile Class<?> cachedEventClass;
    private static volatile Method cachedEventGetKeyData;
    private static volatile Class<?> cachedEventActionClass;
    private static volatile Field cachedEventActionField;
    private static volatile Class<?> cachedKeyDataClass;
    private static volatile Field cachedKeyDataCodeField;
    private static volatile Field cachedKeyDataDataField;
    private static volatile Class<?> cachedLangPickerClass;
    private static volatile Method cachedExtGetContext;
    private static volatile Class<?> cachedAgenticClass;
    private static volatile Field cachedAgenticContextField;
    private static volatile Method cachedAgenticIsActive;
    private static volatile Method cachedAgenticTrigger;
    private static volatile Field cachedAgenticUiManagerField;
    private static volatile Class<?> cachedUiManagerClass;
    private static volatile Method cachedUiManagerGetState;

    private RamblerSpacebarTrigger() {
    }

    static void setClockForTesting(Clock testClock) {
        clock = testClock == null ? SYSTEM_CLOCK : testClock;
    }

    public static void resetForTesting() {
        clock = SYSTEM_CLOCK;
        agenticExtensionRef = null;
        appContextRef = null;
        pendingHoldRelease = false;
        pendingTriggerElapsedMs = 0L;
        pendingTriggerGeneration = 0;
        cachedEventClass = null;
        cachedEventGetKeyData = null;
        cachedEventActionClass = null;
        cachedEventActionField = null;
        cachedKeyDataClass = null;
        cachedKeyDataCodeField = null;
        cachedKeyDataDataField = null;
        cachedLangPickerClass = null;
        cachedExtGetContext = null;
        cachedAgenticClass = null;
        cachedAgenticContextField = null;
        cachedAgenticIsActive = null;
        cachedAgenticTrigger = null;
        cachedAgenticUiManagerField = null;
        cachedUiManagerClass = null;
        cachedUiManagerGetState = null;
    }

    /**
     * Captures the live {@code AgenticDictationExtension} instance at the end of its constructor
     * without relying on constructor parameter registers that R8 may reuse before {@code return}.
     */
    public static void onAgenticExtensionCreated(Object extension) {
        if (extension == null) {
            return;
        }
        try {
            agenticExtensionRef = new WeakReference<Object>(extension);
            Context ctx = readAgenticContext(extension);
            seedAppContext(ctx);
        } catch (Throwable err) {
            logWarningSafely("Failed to capture AgenticDictationExtension for spacebar trigger", err);
        }
    }

    /**
     * When Long-press spacebar for Rambler is enabled, clears {@code NO_IME_PICKER}
     * ({@code 0x10000000000L}) in {@code LanguagePickerExtension.getInitialKeyboardState} so
     * single-language keyboards also dispatch Spacebar long-press events.
     */
    public static boolean shouldClearNoImePickerState(Object langPickerExt) {
        try {
            Context ctx = resolveContext(langPickerExt);
            return ctx != null
                    && RamblerEnhancementsSettings.readSpacebarLongPressRamblerEnabled(ctx);
        } catch (Throwable err) {
            logWarningSafely("Failed to check spacebar long-press initial state override", err);
            return false;
        }
    }

    /**
     * Handles Spacebar long-press events inside {@code LanguagePickerExtension.consumeEvent(Event)}:
     * <ul>
     *   <li>Stock IME-picker path: {@code keyCode == -10022 && "space".equals(data)}.</li>
     *   <li>Cursor Trackpad path (when Gboard's {@code free_cursor} +
     *       {@code enable_free_cursor_by_long_press_space} are active):
     *       {@code keyCode == -10004 && "free_cursor".equals(data) && action == LONG_PRESS}.</li>
     * </ul>
     *
     * <p>Swipe-on-Spacebar 2D Cursor Trackpad ({@code -10104}, {@code SWITCH_KEYBOARD_WITH_PAYLOAD})
     * passes straight through whenever a Spacebar hold-to-talk gesture is not in progress, and is
     * only suppressed during an active Spacebar hold so slight thumb drift while speaking never
     * hijacks dictation.</p>
     *
     * <p>Returns {@code true} only when Rambler accepted the toggle/start request (or suppressed a
     * mid-hold free-cursor hijack); returns {@code false} to fall back cleanly to stock behavior.</p>
     */
    public static boolean maybeHandleSpaceLongPress(Object langPickerExt, Object event) {
        if (langPickerExt == null || event == null) {
            return false;
        }
        try {
            Object keyData = readKeyData(event);
            if (keyData == null) {
                return false;
            }
            Integer keyCodeObj = readKeyCode(keyData);
            if (keyCodeObj == null) {
                return false;
            }
            int keyCode = keyCodeObj.intValue();
            Object data = readKeyDataPayload(keyData);

            // Guard: while the user is holding Spacebar after triggering Rambler in Smart Hybrid
            // or Hold-to-Talk mode, prevent slight thumb drift from switching to FreeCursorKeyboard.
            if (pendingHoldRelease
                    && keyCode == KEYCODE_SWITCH_KEYBOARD_WITH_PAYLOAD
                    && isFreeCursorPayload(data)) {
                Context holdCtx = resolveContext(langPickerExt);
                if (holdCtx != null
                        && RamblerEnhancementsSettings.readSpacebarLongPressRamblerEnabled(holdCtx)) {
                    return true;
                }
            }

            boolean isStockSpaceLongPress =
                    keyCode == KEYCODE_SHOW_SYSTEM_IME_PICKER && DATA_SPACE.equals(data);
            boolean isTrackpadSpaceLongPress =
                    keyCode == KEYCODE_SWITCH_KEYBOARD
                            && DATA_FREE_CURSOR.equals(data)
                            && isLongPressAction(event);
            if (!isStockSpaceLongPress && !isTrackpadSpaceLongPress) {
                return false;
            }

            Context ctx = resolveContext(langPickerExt);
            if (ctx == null
                    || !RamblerEnhancementsSettings.readSpacebarLongPressRamblerEnabled(ctx)) {
                return false;
            }
            seedAppContext(ctx);

            Object agentic = resolveAgenticExtension(ctx);
            if (agentic == null) {
                return false;
            }
            if (!invokeIsActive(agentic)) {
                return false;
            }

            String stateBefore = readAgenticUiStateName(agentic);
            boolean handled = invokeTrigger(agentic);
            if (handled) {
                boolean startedNewSession = !isActivelyListeningState(stateBefore);
                String mode = RamblerEnhancementsSettings.readSpacebarLongPressMode(ctx);
                if (startedNewSession
                        && !RamblerEnhancementsSettings.SPACEBAR_MODE_TOGGLE.equals(mode)) {
                    pendingTriggerGeneration++;
                    pendingTriggerElapsedMs = clock.elapsedRealtime();
                    pendingHoldRelease = true;
                } else {
                    pendingHoldRelease = false;
                }
            }
            return handled;
        } catch (Throwable err) {
            logWarningSafely("Failed to handle spacebar long-press Rambler trigger", err);
            return false;
        }
    }

    /**
     * Non-intrusive touch observer installed at entry of
     * {@code SoftKeyboardView.dispatchTouchEvent(MotionEvent)}. Returns immediately via a single
     * volatile check during normal typing; when armed by a Spacebar long-press start, detects
     * thumb release ({@code ACTION_UP} / {@code ACTION_CANCEL}) for Hold-to-Talk and Smart Hybrid
     * modes and stops Rambler listening cleanly to trigger transcription.
     */
    public static void onKeyboardTouchEvent(MotionEvent event) {
        if (event == null || !pendingHoldRelease) {
            return;
        }
        try {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                // A brand-new touch sequence started; any previous spacebar hold is over.
                pendingHoldRelease = false;
                return;
            }
            if (action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL) {
                return;
            }
            final long triggerElapsed = pendingTriggerElapsedMs;
            final int generation = pendingTriggerGeneration;
            pendingHoldRelease = false;

            Context ctx = resolveContext(null);
            if (ctx == null
                    || !RamblerEnhancementsSettings.readSpacebarLongPressRamblerEnabled(ctx)) {
                return;
            }
            String mode = RamblerEnhancementsSettings.readSpacebarLongPressMode(ctx);
            if (RamblerEnhancementsSettings.SPACEBAR_MODE_TOGGLE.equals(mode)) {
                return;
            }
            long heldAfterTriggerMs = Math.max(0L, clock.elapsedRealtime() - triggerElapsed);
            if (RamblerEnhancementsSettings.SPACEBAR_MODE_HYBRID.equals(mode)
                    && heldAfterTriggerMs < HYBRID_HOLD_THRESHOLD_MS) {
                // Quick release in Smart Hybrid mode -> stay hands-free.
                return;
            }

            Object agentic = resolveAgenticExtension(ctx);
            if (agentic == null || !invokeIsActive(agentic)) {
                return;
            }
            String stateNow = readAgenticUiStateName(agentic);
            if (stateNow == null || isActivelyListeningState(stateNow)) {
                invokeTrigger(agentic);
            } else if (RamblerEnhancementsSettings.SPACEBAR_MODE_HOLD.equals(mode)
                    && isIdlingState(stateNow)
                    && heldAfterTriggerMs < HOLD_ASYNC_STOP_WINDOW_MS) {
                // In Hold-to-Talk mode, if the user released immediately while Gboard's async
                // onboarding check is still transitioning IDLING -> WAITING/LISTENING, re-check
                // once on the main looper and stop if listening started.
                scheduleDeferredHoldStop(agentic, generation);
            }
        } catch (Throwable err) {
            logWarningSafely("Failed to handle spacebar release for Rambler", err);
        }
    }

    private static void scheduleDeferredHoldStop(final Object agentic, final int generation) {
        try {
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper == null) {
                return;
            }
            new Handler(mainLooper).postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (pendingTriggerGeneration != generation) {
                            return;
                        }
                        if (!invokeIsActive(agentic)) {
                            return;
                        }
                        String state = readAgenticUiStateName(agentic);
                        if (isActivelyListeningState(state)) {
                            invokeTrigger(agentic);
                        }
                    } catch (Throwable err) {
                        logWarningSafely("Deferred spacebar hold stop failed", err);
                    }
                }
            }, HOLD_ASYNC_STOP_RECHECK_DELAY_MS);
        } catch (Throwable ignored) {
            // Safe no-op if main looper is unavailable.
        }
    }

    static boolean isActivelyListeningState(String stateName) {
        return "LISTENING".equals(stateName) || "WAITING".equals(stateName);
    }

    static boolean isIdlingState(String stateName) {
        return "IDLING".equals(stateName) || "IDLE".equals(stateName);
    }

    private static void seedAppContext(Context ctx) {
        if (ctx != null) {
            Context app = ctx.getApplicationContext();
            appContextRef = new WeakReference<Context>(app != null ? app : ctx);
        }
    }

    private static Object resolveAgenticExtension(Context context) {
        WeakReference<Object> ref = agenticExtensionRef;
        Object existing = ref == null ? null : ref.get();
        if (existing != null) {
            return existing;
        }
        try {
            ClassLoader loader = context.getClassLoader();
            if (loader == null) {
                loader = RamblerSpacebarTrigger.class.getClassLoader();
            }
            String agenticClassName = RamblerDynamicConfig.SPACEBAR_LP_AGENTIC_CLASS;
            if (agenticClassName == null || agenticClassName.isEmpty()) {
                return null;
            }
            Class<?> moduleManagerClass = Class.forName(MODULE_MANAGER_CLASS, false, loader);
            Class<?> agenticClass = Class.forName(agenticClassName, false, loader);
            Method getInstance = moduleManagerClass.getMethod("getInstance", Context.class);
            Method loadModule = moduleManagerClass.getMethod(
                    RamblerDynamicConfig.MODULE_LOAD_METHOD, Class.class);
            Object moduleManager = getInstance.invoke(null, context);
            if (moduleManager == null) {
                return null;
            }
            Object loaded = loadModule.invoke(moduleManager, agenticClass);
            if (loaded == null) {
                // ModuleManager indexes AgenticDictationExtension under its module interface
                // (e.g. Lncb; on 18.5.4 / Laasl; on 18.8.0) rather than the concrete class.
                for (Class<?> iface : agenticClass.getInterfaces()) {
                    try {
                        Object candidate = loadModule.invoke(moduleManager, iface);
                        if (agenticClass.isInstance(candidate)) {
                            loaded = candidate;
                            break;
                        }
                    } catch (Throwable ignoredIface) {
                        // Try next interface.
                    }
                }
            }
            if (loaded != null) {
                agenticExtensionRef = new WeakReference<Object>(loaded);
            }
            return loaded;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Context resolveContext(Object langPickerExt) {
        if (langPickerExt != null) {
            try {
                Method getter = resolveExtGetContextMethod(langPickerExt.getClass());
                if (getter != null) {
                    Object res = getter.invoke(langPickerExt);
                    if (res instanceof Context ctx) {
                        return ctx;
                    }
                }
            } catch (Throwable ignored) {
                // Fall back to cached application context.
            }
        }
        WeakReference<Context> ref = appContextRef;
        return ref == null ? null : ref.get();
    }

    private static Context readAgenticContext(Object extension) {
        try {
            Class<?> cls = extension.getClass();
            ensureAgenticCacheForClass(cls);
            Field field = cachedAgenticContextField;
            if (field == null) {
                field = findField(cls, RamblerDynamicConfig.AGENTIC_CONTEXT_FIELD);
                cachedAgenticContextField = field;
            }
            if (field != null) {
                Object val = field.get(extension);
                if (val instanceof Context ctx) {
                    return ctx;
                }
            }
        } catch (Throwable ignored) {
            // Optional context seed; resolveContext() will still query langPickerExt.
        }
        return null;
    }

    private static String readAgenticUiStateName(Object agentic) {
        try {
            Class<?> cls = agentic.getClass();
            ensureAgenticCacheForClass(cls);
            Field uiMgrField = cachedAgenticUiManagerField;
            if (uiMgrField == null) {
                uiMgrField = findField(cls, RamblerDynamicConfig.SPACEBAR_LP_AGENTIC_UI_MANAGER_FIELD);
                cachedAgenticUiManagerField = uiMgrField;
            }
            if (uiMgrField == null) {
                return null;
            }
            Object uiMgr = uiMgrField.get(agentic);
            if (uiMgr == null) {
                return null;
            }
            Class<?> uiCls = uiMgr.getClass();
            Method getState = cachedUiManagerGetState;
            if (getState == null || cachedUiManagerClass != uiCls) {
                getState = findMethod(uiCls, RamblerDynamicConfig.SPACEBAR_LP_UI_MANAGER_GET_STATE_METHOD);
                if (getState == null) {
                    return null;
                }
                cachedUiManagerClass = uiCls;
                cachedUiManagerGetState = getState;
            }
            Object state = getState.invoke(uiMgr);
            if (state instanceof Enum<?> enumState) {
                return enumState.name();
            }
            return state == null ? null : state.toString();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void ensureAgenticCacheForClass(Class<?> cls) {
        if (cachedAgenticClass != cls) {
            cachedAgenticClass = cls;
            cachedAgenticContextField = null;
            cachedAgenticIsActive = null;
            cachedAgenticTrigger = null;
            cachedAgenticUiManagerField = null;
            cachedUiManagerClass = null;
            cachedUiManagerGetState = null;
        }
    }

    private static Object readKeyData(Object event) throws Throwable {
        Class<?> cls = event.getClass();
        Method getter = cachedEventGetKeyData;
        if (getter == null || cachedEventClass != cls) {
            getter = findMethod(cls, RamblerDynamicConfig.SPACEBAR_LP_EVENT_GET_KEYDATA_METHOD);
            if (getter == null) {
                return null;
            }
            cachedEventClass = cls;
            cachedEventGetKeyData = getter;
        }
        return getter.invoke(event);
    }

    private static boolean isLongPressAction(Object event) {
        try {
            Class<?> cls = event.getClass();
            Field actionField = cachedEventActionField;
            if (cachedEventActionClass != cls) {
                actionField = findField(cls, RamblerDynamicConfig.SPACEBAR_LP_EVENT_ACTION_FIELD);
                cachedEventActionClass = cls;
                cachedEventActionField = actionField;
            }
            if (actionField == null) {
                return false;
            }
            Object raw = actionField.get(event);
            if (raw instanceof Enum<?> enumVal) {
                return ACTION_LONG_PRESS.equals(enumVal.name());
            }
            return raw != null && ACTION_LONG_PRESS.equals(raw.toString());
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isFreeCursorPayload(Object data) {
        if (DATA_FREE_CURSOR.equals(data)) {
            return true;
        }
        if (data == null) {
            return false;
        }
        try {
            String text = data.toString();
            return text != null && text.contains(DATA_FREE_CURSOR);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Integer readKeyCode(Object keyData) throws Throwable {
        Class<?> cls = keyData.getClass();
        Field codeField = cachedKeyDataCodeField;
        if (codeField == null || cachedKeyDataClass != cls) {
            codeField = findField(cls, RamblerDynamicConfig.SPACEBAR_LP_KEYDATA_CODE_FIELD);
            Field dataField = findField(cls, RamblerDynamicConfig.SPACEBAR_LP_KEYDATA_DATA_FIELD);
            if (codeField == null || dataField == null) {
                return null;
            }
            cachedKeyDataClass = cls;
            cachedKeyDataCodeField = codeField;
            cachedKeyDataDataField = dataField;
        }
        Object raw = codeField.get(keyData);
        return raw instanceof Integer i ? i : null;
    }

    private static Object readKeyDataPayload(Object keyData) throws Throwable {
        Field dataField = cachedKeyDataDataField;
        if (dataField == null || cachedKeyDataClass != keyData.getClass()) {
            readKeyCode(keyData);
            dataField = cachedKeyDataDataField;
        }
        return dataField == null ? null : dataField.get(keyData);
    }

    private static Method resolveExtGetContextMethod(Class<?> cls) {
        Method getter = cachedExtGetContext;
        if (getter != null && cachedLangPickerClass == cls) {
            return getter;
        }
        getter = findMethod(cls, RamblerDynamicConfig.SPACEBAR_LP_EXT_GET_CONTEXT_METHOD);
        if (getter != null) {
            cachedLangPickerClass = cls;
            cachedExtGetContext = getter;
        }
        return getter;
    }

    private static boolean invokeIsActive(Object agentic) throws Throwable {
        Class<?> cls = agentic.getClass();
        ensureAgenticCacheForClass(cls);
        Method isActive = cachedAgenticIsActive;
        if (isActive == null) {
            isActive = findMethod(cls, RamblerDynamicConfig.SPACEBAR_LP_AGENTIC_IS_ACTIVE_METHOD);
            if (isActive == null) {
                return false;
            }
            cachedAgenticIsActive = isActive;
        }
        return Boolean.TRUE.equals(isActive.invoke(agentic));
    }

    private static boolean invokeTrigger(Object agentic) throws Throwable {
        Class<?> cls = agentic.getClass();
        ensureAgenticCacheForClass(cls);
        Method trigger = cachedAgenticTrigger;
        if (trigger == null) {
            trigger = findMethod(cls, RamblerDynamicConfig.SPACEBAR_LP_AGENTIC_TRIGGER_METHOD);
            if (trigger == null) {
                return false;
            }
            cachedAgenticTrigger = trigger;
        }
        return Boolean.TRUE.equals(trigger.invoke(agentic));
    }

    private static Field findField(Class<?> cls, String name) {
        if (cls == null || name == null || name.isEmpty()) {
            return null;
        }
        Class<?> cursor = cls;
        while (cursor != null && cursor != Object.class) {
            try {
                Field f = cursor.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {
                cursor = cursor.getSuperclass();
            }
        }
        return null;
    }

    private static Method findMethod(Class<?> cls, String name) {
        if (cls == null || name == null || name.isEmpty()) {
            return null;
        }
        Class<?> cursor = cls;
        while (cursor != null && cursor != Object.class) {
            try {
                Method m = cursor.getDeclaredMethod(name);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) {
                cursor = cursor.getSuperclass();
            }
        }
        return null;
    }

    private static void logWarningSafely(String message, Throwable err) {
        try {
            Log.w(TAG, message, err);
        } catch (Throwable ignored) {
            // Never propagate logging errors on Gboard's hot input-event path.
        }
    }
}
