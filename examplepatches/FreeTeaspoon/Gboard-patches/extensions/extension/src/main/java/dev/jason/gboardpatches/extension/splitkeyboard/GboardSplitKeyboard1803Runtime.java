package dev.jason.gboardpatches.extension.splitkeyboard;

import android.content.SharedPreferences;

import java.lang.reflect.Method;
import java.util.Collection;
import java.util.List;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardSplitKeyboard1803Runtime {
    private static final String IMMUTABLE_LIST_CLASS = "vvw";
    private static final String IMMUTABLE_LIST_COPY_METHOD = "o";
    private static final String SPLIT_ELIGIBILITY_METHOD = "au";
    private static final String CURRENT_MODE_METHOD = "G";
    private static final String SWITCH_MODE_METHOD = "ag";
    private static final String RESTORE_ACTION_METHOD = "O";

    private GboardSplitKeyboard1803Runtime() {
    }

    public static int applyAccessPointState(String accessPointName, int stockState) {
        try {
            SharedPreferences preferences = GboardFlagRuntimeContext.preferencesOrNull();
            return preferences == null
                    ? stockState
                    : GboardSplitKeyboard1803Policy.forceAccessPointState(
                            accessPointName,
                            stockState,
                            GboardSplitKeyboardSettings.readEnabled(preferences));
        } catch (Throwable ignored) {
            return stockState;
        }
    }

    public static Object includeAccessPointInOrder(Object stockOrder) {
        try {
            if (!(stockOrder instanceof List<?>)) {
                return stockOrder;
            }
            SharedPreferences preferences = GboardFlagRuntimeContext.preferencesOrNull();
            if (preferences == null || !GboardSplitKeyboardSettings.readEnabled(preferences)) {
                return stockOrder;
            }
            List<String> enforcedOrder = GboardSplitKeyboard1803Policy.appendSplitAccessPoint(
                    (List<?>) stockOrder, true);
            if (enforcedOrder.equals(stockOrder)) {
                return stockOrder;
            }
            ClassLoader classLoader = stockOrder.getClass().getClassLoader();
            Class<?> immutableListClass = Class.forName(
                    IMMUTABLE_LIST_CLASS, false, classLoader);
            Method copyMethod = immutableListClass.getDeclaredMethod(
                    IMMUTABLE_LIST_COPY_METHOD, Collection.class);
            copyMethod.setAccessible(true);
            return copyMethod.invoke(null, enforcedOrder);
        } catch (Throwable ignored) {
            return stockOrder;
        }
    }

    public static void afterModeEnvironmentChanged(Object controller) {
        try {
            if (controller == null) {
                return;
            }
            SharedPreferences preferences = GboardFlagRuntimeContext.preferencesOrNull();
            if (preferences == null) {
                return;
            }
            boolean splitKeyboardEnabled = GboardSplitKeyboardSettings.readEnabled(preferences);
            boolean autoSplitEnabled =
                    GboardSplitKeyboardSettings.readAutoSplitEnabled(preferences);
            boolean stockEligible = (Boolean) invoke(controller, SPLIT_ELIGIBILITY_METHOD);
            int currentMode = (Integer) invoke(controller, CURRENT_MODE_METHOD);
            if (GboardSplitKeyboard1803Policy.shouldSwitchToSplit(
                    splitKeyboardEnabled,
                    autoSplitEnabled,
                    stockEligible,
                    currentMode)) {
                invoke(controller, SWITCH_MODE_METHOD,
                        new Class<?>[] { int.class, boolean.class, boolean.class },
                        GboardSplitKeyboard1803Policy.SPLIT_KEYBOARD_MODE,
                        false,
                        false);
            }
        } catch (Throwable ignored) {
            // Preserve stock lifecycle behavior when the target contract is unavailable.
        }
    }

    public static boolean interceptSplitAction(Object controller) {
        try {
            if (controller == null) {
                return false;
            }
            SharedPreferences preferences = GboardFlagRuntimeContext.preferencesOrNull();
            if (preferences == null) {
                return false;
            }
            boolean splitKeyboardEnabled = GboardSplitKeyboardSettings.readEnabled(preferences);
            int currentMode = (Integer) invoke(controller, CURRENT_MODE_METHOD);
            if (!GboardSplitKeyboard1803Policy.shouldRedirectSplitActionToRestore(
                    splitKeyboardEnabled, currentMode)) {
                return false;
            }
            invoke(controller, RESTORE_ACTION_METHOD);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Object invoke(Object receiver, String methodName, Object... arguments)
            throws ReflectiveOperationException {
        return invoke(receiver, methodName, new Class<?>[0], arguments);
    }

    private static Object invoke(Object receiver, String methodName,
            Class<?>[] parameterTypes, Object... arguments) throws ReflectiveOperationException {
        Method method = receiver.getClass().getDeclaredMethod(methodName, parameterTypes);
        method.setAccessible(true);
        return method.invoke(receiver, arguments);
    }
}
