/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.haptics;

import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.provider.Settings;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Haptic feedback for the app's taps, long presses and pull-to-refresh.
 *
 * The app is built with Compose. Every {@code clickable} and {@code combinedClickable} ends in a
 * {@code ClickableElement} or {@code CombinedClickableElement} that holds the click callbacks, so
 * the patch passes those callbacks through {@link #wrapClick} and {@link #wrapLongClick}. A
 * wrapper vibrates and then runs the app's own callback unchanged. The role of the clickable
 * (button, tab, switch, ...) picks the effect, so tabs and buttons feel different from rows.
 *
 * The system "Touch feedback" setting is honoured: with it off nothing vibrates.
 */
@SuppressWarnings("unused")
public final class HapticsHook {
    static final String TAG = "NyandexHaptics";
    static final String PREFERENCES = "nyandex";

    /** Tabs, buttons, checkboxes, switches and radio buttons. */
    static final String KEY_BUTTONS = "haptics_buttons";
    /** Clickable elements that have no role (rows, covers, custom controls). */
    static final String KEY_OTHER_TAPS = "haptics_other_taps";
    static final String KEY_LONG_PRESS = "haptics_long_press";
    static final String KEY_REFRESH = "haptics_refresh";

    // androidx.compose.ui.semantics.Role values.
    private static final int ROLE_NONE = -1;
    private static final int ROLE_BUTTON = 0;
    private static final int ROLE_CHECKBOX = 1;
    private static final int ROLE_SWITCH = 2;
    private static final int ROLE_RADIO_BUTTON = 3;
    private static final int ROLE_TAB = 4;

    private static final int TICK = 0;
    private static final int CLICK = 1;
    private static final int HEAVY_CLICK = 2;

    private static volatile Context context;
    private static volatile Vibrator vibrator;
    private static volatile Field roleField;

    private HapticsHook() {
    }

    // region Hooks called from the patched app

    /**
     * Wrap the {@code onClick} of a clickable. Returns the callback unchanged if it is null or
     * anything goes wrong. {@code role} is the app's boxed {@code Role}, or null.
     */
    public static Object wrapClick(Object role, Object onClick) {
        try {
            if (onClick == null || isWrapper(onClick)) return onClick;
            return wrap(onClick, new ClickHandler(onClick, roleValue(role), false));
        } catch (Throwable throwable) {
            Log.e(TAG, "Failed to wrap a click", throwable);
            return onClick;
        }
    }

    /** Wrap the {@code onLongClick} of a combined clickable; null (no long press) stays null. */
    public static Object wrapLongClick(Object onLongClick) {
        try {
            if (onLongClick == null || isWrapper(onLongClick)) return onLongClick;
            return wrap(onLongClick, new ClickHandler(onLongClick, ROLE_NONE, true));
        } catch (Throwable throwable) {
            Log.e(TAG, "Failed to wrap a long click", throwable);
            return onLongClick;
        }
    }

    /**
     * Called by {@code SwipeRefreshLayout.setRefreshing(refreshing, notify)}. {@code notify} is
     * true only when the user's pull started the refresh, not when the app toggles the spinner.
     */
    public static void onSpinner(boolean refreshing, boolean notify) {
        if (refreshing && notify && enabled(KEY_REFRESH, true)) perform(CLICK);
    }

    // endregion

    // region Wrapping

    private static Object wrap(Object callback, ClickHandler handler) {
        Class<?> function0 = function0(callback);
        if (function0 == null) return callback;
        return Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0}, handler);
    }

    private static Class<?> function0(Object callback) {
        for (Class<?> type = callback.getClass(); type != null; type = type.getSuperclass()) {
            for (Class<?> candidate : type.getInterfaces()) {
                if (candidate.getName().equals("kotlin.jvm.functions.Function0")) return candidate;
            }
        }
        return null;
    }

    private static boolean isWrapper(Object callback) {
        return Proxy.isProxyClass(callback.getClass())
                && Proxy.getInvocationHandler(callback) instanceof ClickHandler;
    }

    /**
     * Runs the haptic effect and then the app's callback. equals and hashCode follow the wrapped
     * callback, so Compose still sees an unchanged element when the app recreates a wrapper.
     */
    private static final class ClickHandler implements InvocationHandler {
        private final Object delegate;
        private final int role;
        private final boolean longPress;

        ClickHandler(Object delegate, int role, boolean longPress) {
            this.delegate = delegate;
            this.role = role;
            this.longPress = longPress;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] arguments) throws Throwable {
            String name = method.getName();
            if (name.equals("equals") && arguments != null && arguments.length == 1) {
                Object other = arguments[0];
                if (other == proxy) return true;
                if (other != null && isWrapper(other)) {
                    ClickHandler handler = (ClickHandler) Proxy.getInvocationHandler(other);
                    return handler.longPress == longPress && handler.role == role
                            && delegate.equals(handler.delegate);
                }
                return false;
            }
            if (name.equals("hashCode") && (arguments == null || arguments.length == 0)) {
                return delegate.hashCode() * 31 + (longPress ? 1 : 0);
            }
            if (name.equals("toString") && (arguments == null || arguments.length == 0)) {
                return "Haptic(" + delegate + ")";
            }
            if (name.equals("invoke")) feedback();
            try {
                return method.invoke(delegate, arguments);
            } catch (InvocationTargetException exception) {
                throw exception.getCause() != null ? exception.getCause() : exception;
            }
        }

        private void feedback() {
            try {
                if (longPress) {
                    if (enabled(KEY_LONG_PRESS, true)) perform(HEAVY_CLICK);
                    return;
                }
                switch (role) {
                    case ROLE_TAB:
                        if (enabled(KEY_BUTTONS, true)) perform(TICK);
                        break;
                    case ROLE_BUTTON:
                    case ROLE_CHECKBOX:
                    case ROLE_SWITCH:
                    case ROLE_RADIO_BUTTON:
                        if (enabled(KEY_BUTTONS, true)) perform(CLICK);
                        break;
                    case ROLE_NONE:
                        if (enabled(KEY_OTHER_TAPS, false)) perform(TICK);
                        break;
                    default:
                        break;
                }
            } catch (Throwable throwable) {
                Log.e(TAG, "Haptic feedback failed", throwable);
            }
        }
    }

    /** The int inside the app's boxed {@code Role} (its only int field), or -1 for no role. */
    private static int roleValue(Object role) throws IllegalAccessException {
        if (role == null) return ROLE_NONE;
        Field field = roleField;
        if (field == null || field.getDeclaringClass() != role.getClass()) {
            field = null;
            for (Field candidate : role.getClass().getDeclaredFields()) {
                if (candidate.getType() == int.class && !java.lang.reflect.Modifier.isStatic(candidate.getModifiers())) {
                    candidate.setAccessible(true);
                    field = candidate;
                    break;
                }
            }
            if (field == null) return ROLE_NONE;
            roleField = field;
        }
        return field.getInt(role);
    }

    // endregion

    // region Effects

    private static boolean enabled(String key, boolean fallback) {
        Context current = context();
        if (current == null) return false;
        try {
            // The system "Touch feedback" switch turns every app's tap haptics off.
            ContentResolver resolver = current.getContentResolver();
            if (Settings.System.getInt(resolver, Settings.System.HAPTIC_FEEDBACK_ENABLED, 1) == 0) {
                return false;
            }
        } catch (Throwable ignored) {
        }
        SharedPreferences preferences = current.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        return preferences.getBoolean(key, fallback);
    }

    @SuppressWarnings("deprecation")
    private static void perform(int kind) {
        Vibrator current = vibrator();
        if (current == null || !current.hasVibrator()) return;
        if (Build.VERSION.SDK_INT >= 29) {
            int effect = kind == TICK ? VibrationEffect.EFFECT_TICK
                    : kind == CLICK ? VibrationEffect.EFFECT_CLICK
                    : VibrationEffect.EFFECT_HEAVY_CLICK;
            current.vibrate(VibrationEffect.createPredefined(effect));
        } else if (Build.VERSION.SDK_INT >= 26) {
            long millis = kind == TICK ? 8 : kind == CLICK ? 14 : 24;
            current.vibrate(VibrationEffect.createOneShot(millis, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
            current.vibrate(kind == TICK ? 8 : kind == CLICK ? 14 : 24);
        }
    }

    private static Vibrator vibrator() {
        Vibrator current = vibrator;
        if (current != null) return current;
        Context application = context();
        if (application == null) return null;
        current = (Vibrator) application.getSystemService(Context.VIBRATOR_SERVICE);
        vibrator = current;
        return current;
    }

    private static Context context() {
        Context current = context;
        if (current != null) return current;
        try {
            // The application object of the current process; a public, unrestricted hidden API.
            Object application = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (application instanceof Context) {
                current = ((Context) application).getApplicationContext();
                context = current;
            }
        } catch (Throwable throwable) {
            Log.e(TAG, "No application context", throwable);
        }
        return current;
    }

    // endregion
}
