package dev.jason.gboardpatches.extension.rambler;

import android.os.Bundle;
import android.util.Log;
import android.view.inputmethod.EditorInfo;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import dev.jason.gboardpatches.extension.advancedvoice.GboardAdvancedVoice1777RuntimeSettings;

/** Routes exact 17.7.7 voice launches through the stock online Jetson backend. */
public final class GboardRambler1777Runtime {
    private static final String TAG = "GboardPatches";
    private static final String LOG_PREFIX = "[gboard-rambler-17.7.7] ";
    private static final int LAUNCH_VOICE_IME = -0x273a;
    private static final String SESSION_TYPE = "session_type";
    private static final String JETSON = "jetson";
    private static final String LAUNCH_SCOPE_CLASS = "hng";
    private static final String LAUNCH_SCOPE_METHOD = "f";
    private static final String PARSER_SCOPE_CLASS = "jmz";
    private static final String PARSER_SCOPE_METHOD = "f";

    private static final ScopedInvocationState LAUNCH_SCOPE = new ScopedInvocationState();
    private static final ScopedInvocationState PARSER_SCOPE = new ScopedInvocationState();
    private static final AtomicInteger INFO_LOG_COUNT = new AtomicInteger();
    private static final AtomicInteger ERROR_LOG_COUNT = new AtomicInteger();
    private static final Map<ClassLoader, WeakReference<Handles>> HANDLES_BY_LOADER =
            new WeakHashMap<ClassLoader, WeakReference<Handles>>();

    private static volatile Field voiceEventActionsField;
    private static volatile Field voiceActionCodeField;

    private GboardRambler1777Runtime() {
    }

    public static void enterLaunchScope(Object event) {
        boolean entered = false;
        try {
            entered = GboardAdvancedVoice1777RuntimeSettings.isRamblerEnabled()
                    && isLaunchVoiceIme(event);
        } catch (Throwable failure) {
            logError("launch scope entry failed", failure);
        } finally {
            try {
                LAUNCH_SCOPE.noteInvocation(
                        entered,
                        expectedFrameDepth(LAUNCH_SCOPE_CLASS, LAUNCH_SCOPE_METHOD));
            } catch (Throwable failure) {
                logError("launch scope marker failed", failure);
            }
        }
    }

    public static void exitLaunchScope() {
        try {
            LAUNCH_SCOPE.exitInvocation();
        } catch (Throwable failure) {
            logError("launch scope exit failed", failure);
        }
    }

    public static boolean afterNgaEligibility(boolean stockResult) {
        try {
            return LAUNCH_SCOPE.isActive(
                    expectedFrameDepth(LAUNCH_SCOPE_CLASS, LAUNCH_SCOPE_METHOD))
                    ? false : stockResult;
        } catch (Throwable failure) {
            logError("NGA eligibility transform failed", failure);
            return stockResult;
        }
    }

    public static boolean tryInitializeStockFallback(Object switcher) {
        try {
            if (!LAUNCH_SCOPE.isActive(
                    expectedFrameDepth(LAUNCH_SCOPE_CLASS, LAUNCH_SCOPE_METHOD))
                    || switcher == null) {
                return false;
            }
            Handles handles = handles(switcher.getClass().getClassLoader());
            Object fallback = handles.switcherFallbackField.get(switcher);
            if (fallback != null) {
                return true;
            }

            Object supplier = handles.switcherFallbackSupplierField.get(switcher);
            if (supplier == null) {
                return false;
            }
            fallback = handles.supplierGetMethod.invoke(supplier);
            if (fallback == null) {
                return false;
            }

            // Resolve every required value before committing any stock state mutation.
            Object ngaHandler = handles.switcherNgaHandlerField.get(switcher);
            Object editorInfo = handles.switcherEditorInfoField.get(switcher);
            boolean restarting = handles.switcherRestartingField.getBoolean(switcher);
            Object inputView = handles.switcherInputViewField.get(switcher);

            handles.switcherFallbackField.set(switcher, fallback);
            handles.invokeBestEffort(
                    handles.ngaHandlerSelectionChangeMethod,
                    ngaHandler,
                    handles.fallbackSelectionChangeReason);
            handles.invokeBestEffort(
                    handles.ngaHandlerStopMethod,
                    ngaHandler,
                    handles.fallbackStopReason);
            if (editorInfo != null) {
                handles.invokeBestEffort(
                        handles.fallbackStartInputMethod,
                        fallback,
                        editorInfo,
                        Boolean.valueOf(restarting));
            }
            if (inputView != null) {
                handles.invokeBestEffort(
                        handles.fallbackStartInputViewMethod,
                        fallback,
                        inputView);
            }
            logInfo("initialized stock fallback for an exact Rambler launch");
            return true;
        } catch (Throwable failure) {
            logError("stock fallback initialization failed", failure);
            return false;
        }
    }

    public static void enterParserScope(Object event) {
        boolean entered = false;
        try {
            entered = GboardAdvancedVoice1777RuntimeSettings.isRamblerEnabled()
                    && isLaunchVoiceIme(event);
        } catch (Throwable failure) {
            logError("parser scope entry failed", failure);
        } finally {
            try {
                PARSER_SCOPE.noteInvocation(
                        entered,
                        expectedFrameDepth(PARSER_SCOPE_CLASS, PARSER_SCOPE_METHOD));
            } catch (Throwable failure) {
                logError("parser scope marker failed", failure);
            }
        }
    }

    public static void exitParserScope() {
        try {
            PARSER_SCOPE.exitInvocation();
        } catch (Throwable failure) {
            logError("parser scope exit failed", failure);
        }
    }

    public static Object injectJetsonSession(Object original) {
        try {
            if (!PARSER_SCOPE.isActive(
                    expectedFrameDepth(PARSER_SCOPE_CLASS, PARSER_SCOPE_METHOD))) {
                return original;
            }
            Bundle input = original instanceof Bundle
                    ? new Bundle((Bundle) original) : new Bundle();
            input.putString(SESSION_TYPE, JETSON);
            logInfo("injected session_type=jetson into exact voice launch");
            return input;
        } catch (Throwable failure) {
            logError("Jetson session injection failed", failure);
            return original;
        }
    }

    private static boolean isLaunchVoiceIme(Object event) throws ReflectiveOperationException {
        if (event == null) {
            return false;
        }
        Field actionsField = voiceEventActionsField;
        if (actionsField == null || !actionsField.getDeclaringClass().isInstance(event)) {
            actionsField = event.getClass().getDeclaredField("b");
            actionsField.setAccessible(true);
            voiceEventActionsField = actionsField;
        }
        Object actionsValue = actionsField.get(event);
        if (!(actionsValue instanceof Object[])) {
            return false;
        }
        Object[] actions = (Object[]) actionsValue;
        if (actions.length == 0 || actions[0] == null) {
            return false;
        }
        Field codeField = voiceActionCodeField;
        if (codeField == null || !codeField.getDeclaringClass().isInstance(actions[0])) {
            codeField = actions[0].getClass().getDeclaredField("c");
            codeField.setAccessible(true);
            voiceActionCodeField = codeField;
        }
        return codeField.getInt(actions[0]) == LAUNCH_VOICE_IME;
    }

    private static int expectedFrameDepth(String expectedClass, String expectedMethod) {
        int count = 0;
        StackTraceElement[] frames = Thread.currentThread().getStackTrace();
        for (StackTraceElement frame : frames) {
            String className = frame.getClassName();
            int separator = className.lastIndexOf('.');
            String simpleClassName = separator < 0
                    ? className : className.substring(separator + 1);
            if (expectedClass.equals(simpleClassName)
                    && expectedMethod.equals(frame.getMethodName())) {
                count++;
            }
        }
        return count;
    }

    private static Handles handles(ClassLoader classLoader) throws Exception {
        ClassLoader resolvedLoader = classLoader != null
                ? classLoader : GboardRambler1777Runtime.class.getClassLoader();
        if (resolvedLoader == null) {
            throw new IllegalStateException("Rambler runtime has no ClassLoader");
        }
        synchronized (HANDLES_BY_LOADER) {
            WeakReference<Handles> reference = HANDLES_BY_LOADER.get(resolvedLoader);
            Handles cached = reference == null ? null : reference.get();
            if (cached != null) {
                return cached;
            }
            Handles created = new Handles(resolvedLoader);
            HANDLES_BY_LOADER.put(resolvedLoader, new WeakReference<Handles>(created));
            return created;
        }
    }

    private static void logInfo(String message) {
        try {
            if (INFO_LOG_COUNT.getAndIncrement() < 30) {
                Log.i(TAG, LOG_PREFIX + message);
            }
        } catch (Throwable ignored) {
            // Logging must not affect Gboard.
        }
    }

    private static void logError(String message, Throwable failure) {
        try {
            if (ERROR_LOG_COUNT.getAndIncrement() < 8) {
                Log.w(TAG, LOG_PREFIX + message, failure);
            }
        } catch (Throwable ignored) {
            // Logging must not affect Gboard.
        }
    }

    static final class ScopedInvocationState {
        private final ThreadLocal<ArrayDeque<Boolean>> invocations =
                new ThreadLocal<ArrayDeque<Boolean>>();

        void noteInvocation(boolean entered, int expectedFrameDepth) {
            if (expectedFrameDepth <= 0) {
                invocations.remove();
                return;
            }
            ArrayDeque<Boolean> markers = invocations.get();
            if (markers == null) {
                markers = new ArrayDeque<Boolean>();
                invocations.set(markers);
            }
            // A marker at the same or a deeper frame depth survived an exceptional unwind.
            // Remove it before recording the current invocation so it cannot affect later calls.
            while (markers.size() >= expectedFrameDepth) {
                markers.pop();
            }
            markers.push(Boolean.valueOf(entered));
        }

        int exitInvocation() {
            ArrayDeque<Boolean> markers = invocations.get();
            if (markers == null || markers.isEmpty()) {
                invocations.remove();
                return -1;
            }
            boolean entered = markers.pop().booleanValue();
            if (markers.isEmpty()) {
                invocations.remove();
            }
            return entered ? countActive(markers) : -1;
        }

        boolean isActive(int expectedFrameDepth) {
            ArrayDeque<Boolean> markers = invocations.get();
            if (expectedFrameDepth <= 0 || markers == null) {
                invocations.remove();
                return false;
            }
            while (markers.size() > expectedFrameDepth) {
                markers.pop();
            }
            if (markers.isEmpty()) {
                invocations.remove();
                return false;
            }
            return markers.peek().booleanValue();
        }

        private static int countActive(ArrayDeque<Boolean> markers) {
            int count = 0;
            for (Boolean marker : markers) {
                if (marker.booleanValue()) {
                    count++;
                }
            }
            return count;
        }
    }

    private static final class Handles {
        final Field switcherNgaHandlerField;
        final Field switcherFallbackSupplierField;
        final Field switcherFallbackField;
        final Field switcherEditorInfoField;
        final Field switcherRestartingField;
        final Field switcherInputViewField;
        final Method supplierGetMethod;
        final Method ngaHandlerSelectionChangeMethod;
        final Method ngaHandlerStopMethod;
        final Method fallbackStartInputMethod;
        final Method fallbackStartInputViewMethod;
        final Object fallbackSelectionChangeReason;
        final Object fallbackStopReason;

        Handles(ClassLoader classLoader) throws Exception {
            Class<?> switcherClass = resolve(classLoader, "hng");
            Class<?> ngaHandlerClass = resolve(classLoader, "hoa");
            Class<?> supplierClass = resolve(classLoader, "uuh");
            Class<?> fallbackHandlerClass = resolve(classLoader, "qwb");
            Class<?> inputViewClass = resolve(classLoader, "ovf");
            Class<?> selectionChangeReasonClass = resolve(classLoader, "qwa");
            Class<?> stopReasonClass = resolve(classLoader, "qwq");

            switcherNgaHandlerField = switcherClass.getDeclaredField("c");
            switcherFallbackSupplierField = switcherClass.getDeclaredField("d");
            switcherFallbackField = switcherClass.getDeclaredField("g");
            switcherEditorInfoField = switcherClass.getDeclaredField("h");
            switcherRestartingField = switcherClass.getDeclaredField("i");
            switcherInputViewField = switcherClass.getDeclaredField("j");
            supplierGetMethod = supplierClass.getDeclaredMethod("if");
            ngaHandlerSelectionChangeMethod = ngaHandlerClass.getDeclaredMethod(
                    "i", selectionChangeReasonClass);
            ngaHandlerStopMethod = ngaHandlerClass.getDeclaredMethod("g", stopReasonClass);
            fallbackStartInputMethod = fallbackHandlerClass.getDeclaredMethod(
                    "a", EditorInfo.class, boolean.class);
            fallbackStartInputViewMethod = fallbackHandlerClass.getDeclaredMethod(
                    "c", inputViewClass);
            Field selectionReasonField = selectionChangeReasonClass.getDeclaredField("e");
            Field stopReasonField = stopReasonClass.getDeclaredField("F");

            setAccessible(
                    switcherNgaHandlerField,
                    switcherFallbackSupplierField,
                    switcherFallbackField,
                    switcherEditorInfoField,
                    switcherRestartingField,
                    switcherInputViewField,
                    supplierGetMethod,
                    ngaHandlerSelectionChangeMethod,
                    ngaHandlerStopMethod,
                    fallbackStartInputMethod,
                    fallbackStartInputViewMethod,
                    selectionReasonField,
                    stopReasonField);
            fallbackSelectionChangeReason = selectionReasonField.get(null);
            fallbackStopReason = stopReasonField.get(null);
        }

        void invokeBestEffort(Method method, Object receiver, Object... args) {
            try {
                method.invoke(receiver, args);
            } catch (Throwable failure) {
                logError("best-effort fallback step failed: " + method.getName(), failure);
            }
        }

        private static Class<?> resolve(ClassLoader classLoader, String name)
                throws ClassNotFoundException {
            return Class.forName(name, false, classLoader);
        }

        private static void setAccessible(Object... members) {
            for (Object member : members) {
                if (member instanceof Field) {
                    ((Field) member).setAccessible(true);
                } else if (member instanceof Method) {
                    ((Method) member).setAccessible(true);
                }
            }
        }
    }
}
