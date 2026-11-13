package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.inputmethodservice.InputMethodService;
import android.inputmethodservice.Keyboard;
import android.inputmethodservice.KeyboardView;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.preference.SwitchPreference;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputConnection;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Spacebar hold and horizontal swipe cursor control for Helakuru Lite. */
public final class HelakuruLiteSpacebarCursorExtension {
    private static final String PREFERENCE_KEY = "morphe_spacebar_cursor_enabled";
    private static final long HOLD_DELAY_MS = 300L;
    private static final long SUPPRESSION_TIMEOUT_MS = 500L;
    private static final float BASE_DP_PER_CHARACTER = 12f;
    private static final Map<View, GestureState> STATES = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private HelakuruLiteSpacebarCursorExtension() { }

    public static void bindSettings(Object activityObject) {
        if (!(activityObject instanceof PreferenceActivity)) return;
        PreferenceActivity activity = (PreferenceActivity) activityObject;
        try {
            Preference preference = activity.findPreference(PREFERENCE_KEY);
            if (!(preference instanceof SwitchPreference)) return;
            SwitchPreference toggle = (SwitchPreference) preference;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(activity);
            toggle.setPersistent(false);
            toggle.setChecked(settings.getBoolean(PREFERENCE_KEY, true));
            toggle.setOnPreferenceChangeListener((changed, value) -> {
                settings.edit().putBoolean(PREFERENCE_KEY, Boolean.TRUE.equals(value)).apply();
                return true;
            });
            HelakuruLiteSettingsExtension.applySettingsWindow(activity);
        } catch (Throwable ignored) { }
    }

    public static void attachTouchObserver(Object serviceObject) {
        if (!(serviceObject instanceof InputMethodService)) return;
        View keyboard = findKeyboardView(serviceObject);
        if (keyboard == null) return;
        CursorTouchObserver observer = new CursorTouchObserver((InputMethodService) serviceObject);
        HelakuruLiteTouchObserverExtension.addObserver(keyboard, "spacebar-cursor", observer::onTouch);
    }

    /** Forget a gesture when the IME window hides or detaches without a touch-cancel event. */
    public static void onKeyboardSessionEnded(Object serviceObject) {
        View keyboard = findKeyboardView(serviceObject);
        if (keyboard != null) clear(keyboard);
    }

    /** Defer repeatable space delivery until the gesture is known to be a tap or cursor hold. */
    public static boolean consumeSpaceKey(Object serviceObject, int keyCode) {
        View keyboard = findKeyboardView(serviceObject);
        if (keyboard == null) return false;
        synchronized (STATES) {
            GestureState state = STATES.get(keyboard);
            if (state == null) return false;
            synchronized (state) {
                if (state.replayingSpace) return false;
                long now = android.os.SystemClock.uptimeMillis();
                if (state.cursorMode && (state.touchActive || now <= state.suppressSpaceUntil)) return true;
                if (keyCode != 32) return false;
                if (state.touchActive && !state.fallbackToNative) {
                    state.deferredSpace = true;
                    return true;
                }
                return now <= state.suppressSpaceUntil;
            }
        }
    }

    private static final class CursorTouchObserver {
        private final WeakReference<InputMethodService> service;

        CursorTouchObserver(InputMethodService service) {
            this.service = new WeakReference<>(service);
        }

        void onTouch(View view, MotionEvent event) {
            InputMethodService ime = service.get();
            if (ime == null) return;
            int action = event.getActionMasked();
            if (!isEnabled(ime)) {
                clear(view);
                return;
            }
            if (action == MotionEvent.ACTION_DOWN) {
                if (!isSpacebarTouch(view, event.getX(), event.getY())) {
                    clear(view);
                    return;
                }
                synchronized (STATES) {
                    GestureState existing = STATES.get(view);
                    if (existing != null) {
                        synchronized (existing) {
                            if (existing.touchActive && existing.blurHoldActive) return;
                        }
                    }
                }
                GestureState state = stateFor(view, ime);
                synchronized (state) {
                    reset(state);
                    state.touchActive = true;
                    setBlurHold(state, true);
                    state.downTime = event.getEventTime();
                    state.lastX = event.getX();
                    state.velocity = VelocityTracker.obtain();
                    state.velocity.addMovement(event);
                    state.activation = () -> activate(view, state);
                    MAIN.postDelayed(state.activation, HOLD_DELAY_MS);
                }
            } else {
                GestureState state;
                synchronized (STATES) { state = STATES.get(view); }
                if (state == null) return;
                synchronized (state) {
                    if (!state.touchActive) return;
                    if (state.velocity != null) state.velocity.addMovement(event);
                    if (action == MotionEvent.ACTION_MOVE) {
                        if (!state.cursorMode && !isSpacebarTouch(view, event.getX(), event.getY())) {
                            state.touchActive = false;
                            setBlurHold(state, false);
                            state.suppressSpaceUntil = android.os.SystemClock.uptimeMillis() + SUPPRESSION_TIMEOUT_MS;
                            cancelActivation(state);
                            recycleVelocity(state);
                            return;
                        }
                        if (!state.cursorMode && event.getEventTime() - state.downTime >= HOLD_DELAY_MS) {
                            activate(view, state);
                        }
                        if (state.cursorMode) moveCursor(ime, view, state, event.getX());
                        else state.lastX = event.getX();
                    } else if (action == MotionEvent.ACTION_UP) {
                        if (!state.cursorMode && event.getEventTime() - state.downTime >= HOLD_DELAY_MS) {
                            activate(view, state);
                        }
                        state.touchActive = false;
                        setBlurHold(state, false);
                        cancelActivation(state);
                        if (!state.fallbackToNative) {
                            state.suppressSpaceUntil = android.os.SystemClock.uptimeMillis() + SUPPRESSION_TIMEOUT_MS;
                            if (!state.cursorMode) replaySpace(ime, state);
                        }
                        recycleVelocity(state);
                    } else if (action == MotionEvent.ACTION_CANCEL) {
                        state.touchActive = false;
                        state.cursorMode = false;
                        setBlurHold(state, false);
                        state.suppressSpaceUntil = android.os.SystemClock.uptimeMillis() + SUPPRESSION_TIMEOUT_MS;
                        cancelActivation(state);
                        recycleVelocity(state);
                    }
                }
            }
        }
    }

    private static void activate(View view, GestureState state) {
        synchronized (state) {
            if (!state.touchActive || state.cursorMode || state.fallbackToNative) return;
            InputMethodService service = state.service.get();
            if (service == null) return;
            InputConnection connection = service.getCurrentInputConnection();
            ExtractedText extracted = extract(connection);
            if (!hasUsableSelection(extracted)) {
                state.fallbackToNative = true;
                cancelActivation(state);
                if (state.deferredSpace) replaySpace(service, state);
                return;
            }

            state.connection = new WeakReference<>(connection);
            state.minimum = extracted.startOffset;
            state.maximum = extracted.startOffset + extracted.text.length();
            state.cursor = clamp(extracted.startOffset + extracted.selectionEnd, state.minimum, state.maximum);
            state.cursorMode = true;
            cancelActivation(state);
            view.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        }
    }

    private static void moveCursor(InputMethodService service, View view, GestureState state, float x) {
        float deltaX = x - state.lastX;
        state.lastX = x;
        if (deltaX == 0f || state.velocity == null) return;
        state.velocity.computeCurrentVelocity(1000);
        float density = view.getResources().getDisplayMetrics().density;
        float speedDpPerSecond = Math.abs(state.velocity.getXVelocity()) / Math.max(0.1f, density);
        float speedMultiplier = Math.min(3f, 1f + speedDpPerSecond / 1500f);
        state.characterRemainder += (deltaX / (BASE_DP_PER_CHARACTER * density)) * speedMultiplier;
        int step = state.characterRemainder > 0f
                ? (int) Math.floor(state.characterRemainder)
                : (int) Math.ceil(state.characterRemainder);
        if (step == 0) return;
        state.characterRemainder -= step;
        InputConnection connection = state.connection == null ? null : state.connection.get();
        if (connection == null) return;

        int direction = step > 0 ? 1 : -1;
        for (int moved = 0; moved < Math.abs(step); moved++) {
            int next = clamp(state.cursor + direction, state.minimum, state.maximum);
            if (next == state.cursor) break;
            if (!connection.setSelection(next, next)) break;
            state.cursor = next;
            view.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        }
        // Keep consuming space repeats even if an editor rejects a cursor update.
    }

    private static void replaySpace(InputMethodService service, GestureState state) {
        if (!(service instanceof KeyboardView.OnKeyboardActionListener)) return;
        state.replayingSpace = true;
        try {
            ((KeyboardView.OnKeyboardActionListener) service).onKey(32, new int[]{32});
        } finally {
            state.replayingSpace = false;
            state.deferredSpace = false;
        }
    }

    private static ExtractedText extract(InputConnection connection) {
        if (connection == null) return null;
        try {
            ExtractedTextRequest request = new ExtractedTextRequest();
            request.token = 0;
            request.flags = 0;
            request.hintMaxChars = 2048;
            request.hintMaxLines = 10;
            return connection.getExtractedText(request, 0);
        } catch (Throwable ignored) { return null; }
    }

    private static boolean hasUsableSelection(ExtractedText text) {
        return text != null && text.text != null && text.selectionStart >= 0
                && text.selectionEnd >= 0 && text.selectionStart <= text.text.length()
                && text.selectionEnd <= text.text.length();
    }

    private static boolean isEnabled(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(PREFERENCE_KEY, true);
    }

    private static boolean isSpacebarTouch(View view, float x, float y) {
        if (!(view instanceof KeyboardView)) return false;
        Keyboard keyboard = ((KeyboardView) view).getKeyboard();
        if (keyboard == null) return false;
        List<Keyboard.Key> keys = keyboard.getKeys();
        for (Keyboard.Key key : keys) {
            if (key.codes == null || !contains(key.codes, 32)) continue;
            if (x >= key.x && x < key.x + key.width && y >= key.y && y < key.y + key.height) return true;
        }
        return false;
    }

    private static boolean contains(int[] values, int target) {
        for (int value : values) if (value == target) return true;
        return false;
    }

    private static GestureState stateFor(View view, InputMethodService service) {
        synchronized (STATES) {
            GestureState state = STATES.get(view);
            if (state == null) {
                state = new GestureState(service);
                STATES.put(view, state);
            } else {
                state.service = new WeakReference<>(service);
            }
            return state;
        }
    }

    private static void clear(View view) {
        synchronized (STATES) {
            GestureState state = STATES.get(view);
            if (state == null) return;
            synchronized (state) {
                setBlurHold(state, false);
                state.touchActive = false;
                state.cursorMode = false;
                state.suppressSpaceUntil = 0L;
                cancelActivation(state);
                recycleVelocity(state);
            }
        }
    }

    private static void reset(GestureState state) {
        setBlurHold(state, false);
        cancelActivation(state);
        recycleVelocity(state);
        state.touchActive = false;
        state.cursorMode = false;
        state.suppressSpaceUntil = 0L;
        state.characterRemainder = 0f;
        state.connection = null;
        state.fallbackToNative = false;
        state.deferredSpace = false;
        state.replayingSpace = false;
    }

    private static void setBlurHold(GestureState state, boolean held) {
        if (state.blurHoldActive == held) return;
        state.blurHoldActive = held;
        InputMethodService service = state.service.get();
        if (service != null) HelakuruLiteLiveBlurExtension.onSpacebarHold(service, held);
    }

    private static void cancelActivation(GestureState state) {
        if (state.activation != null) MAIN.removeCallbacks(state.activation);
        state.activation = null;
    }

    private static void recycleVelocity(GestureState state) {
        if (state.velocity != null) state.velocity.recycle();
        state.velocity = null;
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    private static View findKeyboardView(Object serviceObject) {
        Class<?> type = serviceObject.getClass();
        while (type != null) {
            try {
                Field field = type.getDeclaredField("keyboardView");
                field.setAccessible(true);
                Object value = field.get(serviceObject);
                return value instanceof View ? (View) value : null;
            } catch (NoSuchFieldException ignored) {
                type = type.getSuperclass();
            } catch (Throwable ignored) { return null; }
        }
        return null;
    }

    private static final class GestureState {
        WeakReference<InputMethodService> service;
        WeakReference<InputConnection> connection;
        Runnable activation;
        VelocityTracker velocity;
        long downTime;
        long suppressSpaceUntil;
        float lastX;
        float characterRemainder;
        int cursor;
        int minimum;
        int maximum;
        boolean touchActive;
        boolean cursorMode;
        boolean fallbackToNative;
        boolean deferredSpace;
        boolean replayingSpace;
        boolean blurHoldActive;

        GestureState(InputMethodService service) {
            this.service = new WeakReference<>(service);
        }
    }
}
