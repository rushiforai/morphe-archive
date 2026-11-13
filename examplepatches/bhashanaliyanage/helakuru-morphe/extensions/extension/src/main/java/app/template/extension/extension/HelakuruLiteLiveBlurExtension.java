package app.template.extension.extension;

import android.content.Context;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.inputmethodservice.InputMethodService;
import android.animation.ValueAnimator;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.WeakHashMap;

/** Runtime blur and tint behavior for the Lite Frosted Glass settings. */
public final class HelakuruLiteLiveBlurExtension {
    private static final String ENABLED = "morphe_live_keyboard_blur_lite";
    private static final String BLUR_STRENGTH = "morphe_frosted_blur_strength";
    private static final String BLUR_MODE = "morphe_frosted_blur_mode";
    private static final String PAUSE_WHILE_TYPING = "morphe_frosted_pause_blur_while_typing";
    private static final String RESUME_BLUR_DELAY = "morphe_frosted_resume_blur_delay";
    private static final String TRANSPARENCY_FOLLOWS_THEME = "morphe_frosted_transparency_follow_theme";
    private static final String TRANSPARENCY_AMOUNT = "morphe_frosted_transparency_amount";
    private static final String COLOR_THEME = "morphe_frosted_color_theme";
    private static final int DEFAULT_BLUR_DP = 32;
    private static final int DEFAULT_TRANSPARENCY = 50;
    private static final int DEFAULT_RESUME_BLUR_DELAY_MS = 200;
    private static final long BLUR_RETURN_DURATION_MS = 160L;
    private static final Map<Window, WindowState> STATES = new WeakHashMap<>();

    private HelakuruLiteLiveBlurExtension() { }

    /** Called at the end of Lite's input-view setup, after it has applied the active theme. */
    public static void applyKeyboardBlur(Object serviceObject) {
        if (!(serviceObject instanceof InputMethodService)) return;
        InputMethodService service = (InputMethodService) serviceObject;
        try {
            Window window = service.getWindow() == null ? null : service.getWindow().getWindow();
            if (window == null) return;
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(service);
            if (!preferences.getBoolean(ENABLED, false)) {
                restore(window, service);
                return;
            }

            View root = getRootView(service);
            WindowState state;
            synchronized (STATES) {
                state = STATES.get(window);
                if (state == null) {
                    WindowManager.LayoutParams attributes = window.getAttributes();
                    state = new WindowState(
                            (attributes.flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND) != 0,
                            getBlurBehindRadius(attributes),
                            getBackgroundBlurRadius(window),
                            window.getDecorView().getBackground());
                    STATES.put(window, state);
                }
            }
            final WindowState currentState = state;
            if (state.preferences == null) {
                state.preferences = preferences;
                state.preferencesListener = (sharedPreferences, key) -> {
                    if (!ENABLED.equals(key) && !PAUSE_WHILE_TYPING.equals(key)) return;
                    window.getDecorView().post(() -> {
                        if (!sharedPreferences.getBoolean(ENABLED, false)) {
                            restore(window, service);
                        } else if (!sharedPreferences.getBoolean(PAUSE_WHILE_TYPING, false)) {
                            cancelTypingPause(currentState);
                            applyKeyboardBlur(service);
                        }
                    });
                };
                preferences.registerOnSharedPreferenceChangeListener(state.preferencesListener);
            }
            registerBatterySaverReceiver(service, window, state);
            cancelTypingPause(state);
            View previousRoot = state.root;
            if (previousRoot != null && previousRoot != root) {
                removeWindowVisibilityListener(state);
                if (state.detachListener != null) {
                    previousRoot.removeOnAttachStateChangeListener(state.detachListener);
                    state.detachListener = null;
                }
            }
            state.root = root;
            if (root != null && state.detachListener == null) {
                state.detachListener = new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View view) {
                        addWindowVisibilityListener(view, currentState, service);
                    }
                    @Override public void onViewDetachedFromWindow(View view) {
                        removeWindowVisibilityListener(currentState);
                        endTypingPauseSession(currentState, service);
                    }
                };
                root.addOnAttachStateChangeListener(state.detachListener);
                if (root.isAttachedToWindow()) addWindowVisibilityListener(root, currentState, service);
            }
            if (isBatterySaverOn(service)) {
                suspendForBatterySaver(service, window, state);
                return;
            }
            // Input can restart while the user types. Replacing the window background
            // on each restart can rebuild its blur surface, so install it once per window.
            if (!state.windowBackgroundApplied) {
                window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                state.windowBackgroundApplied = true;
            }
            if (Build.VERSION.SDK_INT >= 31 && isBlurAvailable(service)) {
                int blurDp = clamp(preferences.getInt(BLUR_STRENGTH, DEFAULT_BLUR_DP), 0, 80);
                int radius = Math.round(blurDp * service.getResources().getDisplayMetrics().density);
                WindowManager.LayoutParams attributes = window.getAttributes();
                boolean blurBehind = "behind".equals(preferences.getString(BLUR_MODE, "background"));
                int behindRadius = blurBehind ? radius : 0;
                boolean needsBehindFlag = behindRadius > 0;
                boolean hasBehindFlag = (attributes.flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND) != 0;
                if (hasBehindFlag != needsBehindFlag || getBlurBehindRadius(attributes) != behindRadius) {
                    if (needsBehindFlag) {
                        attributes.flags |= WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
                    } else {
                        attributes.flags &= ~WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
                    }
                    attributes.getClass().getMethod("setBlurBehindRadius", int.class)
                            .invoke(attributes, behindRadius);
                    window.setAttributes(attributes);
                }
                int backgroundRadius = blurBehind ? 0 : radius;
                if (getBackgroundBlurRadius(window) != backgroundRadius) {
                    window.getClass().getMethod("setBackgroundBlurRadius", int.class)
                            .invoke(window, backgroundRadius);
                }
            }
            applyKeyboardSurfaces(service, root, state, preferences);
            if (!preferences.getBoolean(PAUSE_WHILE_TYPING, false)) {
                state.spacebarHeld = false;
            } else if (state.spacebarHeld) {
                // Input restarts can reapply Lite's theme while the finger is still
                // down; restore the opaque pause after those surfaces are refreshed.
                pauseForTyping(service, window, state, preferences);
            }
        } catch (Throwable ignored) {
            // Keep the IME usable if a platform or Lite internal changes.
        }
    }

    /** Reapply Lite keyboard surfaces after a language, layout, or toolbar-state transition. */
    public static void onKeyboardStateChanged(Object serviceObject) {
        if (!(serviceObject instanceof InputMethodService)) return;
        InputMethodService service = (InputMethodService) serviceObject;
        try {
            View root = getRootView(service);
            Runnable refresh = () -> {
                try {
                    HelakuruLiteSettingsExtension.invalidateKeyboardMode(service);
                    SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(service);
                    if (!preferences.getBoolean(ENABLED, false)) return;
                    Window window = service.getWindow() == null ? null : service.getWindow().getWindow();
                    if (window == null) return;
                    WindowState state;
                    synchronized (STATES) { state = STATES.get(window); }
                    if (state == null) {
                        applyKeyboardBlur(service);
                        return;
                    }
                    if (isBatterySaverOn(service)) {
                        suspendForBatterySaver(service, window, state);
                    } else if (state.spacebarHeld) {
                        applyKeyboardSurfaces(service, getRootView(service), state, preferences, true);
                        pauseForTyping(service, window, state, preferences);
                    } else if (state.restoreRunnable != null || state.animator != null) {
                        // Keep the typing-pause opaque state and its pending restoration intact.
                        applyKeyboardSurfaces(service, getRootView(service), state, preferences, true);
                    } else {
                        applyKeyboardBlur(service);
                    }
                } catch (Throwable ignored) {
                    // Keyboard state changes must never interfere with normal typing.
                }
            };
            // Run after Lite's queued layout/theme work but before the next frame is drawn.
            if (root != null) root.postOnAnimation(refresh);
            else new Handler(Looper.getMainLooper()).post(refresh);
        } catch (Throwable ignored) { }
    }

    /** Called independently of Lite's optional keypress-feedback patch. */
    public static void onKeyPress(Object serviceObject, int keyCode) {
        if (!(serviceObject instanceof InputMethodService)) return;
        InputMethodService service = (InputMethodService) serviceObject;
        try {
            Window window = service.getWindow() == null ? null : service.getWindow().getWindow();
            if (window == null) return;
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(service);
            if (!preferences.getBoolean(ENABLED, false)
                    || !preferences.getBoolean(PAUSE_WHILE_TYPING, false)
                    || Build.VERSION.SDK_INT < 31 || isBatterySaverOn(service)
                    || !isBlurAvailable(service)) return;

            WindowState state;
            synchronized (STATES) { state = STATES.get(window); }
            if (state == null) {
                applyKeyboardBlur(service);
                synchronized (STATES) { state = STATES.get(window); }
            }
            if (state == null) return;
            cancelTypingPause(state);
            state.blurMode = preferences.getString(BLUR_MODE, "background");
            state.targetBlurRadius = Math.round(clamp(
                    preferences.getInt(BLUR_STRENGTH, DEFAULT_BLUR_DP), 0, 80)
                    * service.getResources().getDisplayMetrics().density);
            View root = getRootView(service);
            state.root = root;
            pauseForTyping(service, window, state, preferences);
            if (!state.spacebarHeld) scheduleBlurRestore(service, window, state, preferences);
        } catch (Throwable ignored) {
            // Keep key input working if a platform or Lite internal changes.
        }
    }

    /** Keep blur disabled for the full spacebar touch, including cursor movement. */
    public static void onSpacebarHold(Object serviceObject, boolean held) {
        if (!(serviceObject instanceof InputMethodService)) return;
        InputMethodService service = (InputMethodService) serviceObject;
        try {
            Window window = service.getWindow() == null ? null : service.getWindow().getWindow();
            if (window == null) return;
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(service);
            if (!preferences.getBoolean(ENABLED, false)
                    || !preferences.getBoolean(PAUSE_WHILE_TYPING, false)
                    || Build.VERSION.SDK_INT < 31 || isBatterySaverOn(service)
                    || !isBlurAvailable(service)) return;

            WindowState state;
            synchronized (STATES) { state = STATES.get(window); }
            if (state == null) {
                applyKeyboardBlur(service);
                synchronized (STATES) { state = STATES.get(window); }
            }
            if (state == null || state.spacebarHeld == held) return;
            state.spacebarHeld = held;
            cancelTypingPause(state);
            if (held) {
                pauseForTyping(service, window, state, preferences);
            } else if (service.isInputViewShown()) {
                pauseForTyping(service, window, state, preferences);
                scheduleBlurRestore(service, window, state, preferences);
            }
        } catch (Throwable ignored) {
            // Keep key input working if a platform or Lite internal changes.
        }
    }

    private static void pauseForTyping(InputMethodService service, Window window,
                                       WindowState state, SharedPreferences preferences) {
        state.blurMode = preferences.getString(BLUR_MODE, "background");
        state.targetBlurRadius = Math.round(clamp(
                preferences.getInt(BLUR_STRENGTH, DEFAULT_BLUR_DP), 0, 80)
                * service.getResources().getDisplayMetrics().density);
        View root = getRootView(service);
        state.root = root;
        state.targetAlpha = getConfiguredRootAlpha(service, root, preferences);
        disableWindowBlur(window);
        setRootAlpha(state, 255);
    }

    private static void scheduleBlurRestore(InputMethodService service, Window window,
                                            WindowState state, SharedPreferences preferences) {
        WindowState capturedState = state;
        Runnable restoreRunnable = () -> {
            capturedState.restoreRunnable = null;
            if (capturedState.spacebarHeld
                    || !preferences.getBoolean(ENABLED, false)
                    || !preferences.getBoolean(PAUSE_WHILE_TYPING, false)
                    || !service.isInputViewShown()) return;
            animateBlurBack(window, capturedState);
        };
        state.restoreRunnable = restoreRunnable;
        long delayMs = clamp(preferences.getInt(RESUME_BLUR_DELAY,
                DEFAULT_RESUME_BLUR_DELAY_MS), 0, 2000);
        state.handler.postDelayed(restoreRunnable, delayMs);
    }

    private static void animateBlurBack(Window window, WindowState state) {
        ValueAnimator animator = ValueAnimator.ofFloat(0f, 1f);
        state.animator = animator;
        animator.setDuration(BLUR_RETURN_DURATION_MS);
        animator.addUpdateListener(value -> {
            float fraction = (Float) value.getAnimatedValue();
            int radius = Math.round(state.targetBlurRadius * fraction);
            int alpha = Math.round(255 + (state.targetAlpha - 255) * fraction);
            setWindowBlur(window, state.blurMode, radius);
            setRootAlpha(state, alpha);
        });
        animator.addListener(new android.animation.AnimatorListenerAdapter() {
            @Override public void onAnimationEnd(android.animation.Animator animation) {
                if (state.animator == animator) state.animator = null;
            }
        });
        animator.start();
    }

    private static void cancelTypingPause(WindowState state) {
        if (state == null) return;
        if (state.restoreRunnable != null) {
            state.handler.removeCallbacks(state.restoreRunnable);
            state.restoreRunnable = null;
        }
        if (state.animator != null) {
            state.animator.cancel();
            state.animator = null;
        }
    }

    private static void endTypingPauseSession(WindowState state, InputMethodService service) {
        state.spacebarHeld = false;
        cancelTypingPause(state);
        HelakuruLiteSpacebarCursorExtension.onKeyboardSessionEnded(service);
    }

    private static void addWindowVisibilityListener(View root, WindowState state,
                                                    InputMethodService service) {
        // ViewTreeObserver window-visibility listeners were added in API 34. The
        // attach-state listener installed by applyKeyboardBlur covers older Android
        // versions, where hiding the IME window detaches its input view.
        if (Build.VERSION.SDK_INT < 34 || state.windowVisibilityListener != null) return;
        state.visibilityObserver = root.getViewTreeObserver();
        state.windowVisibilityListener = visibility -> {
            if (visibility != View.VISIBLE) {
                endTypingPauseSession(state, service);
            }
        };
        state.visibilityObserver.addOnWindowVisibilityChangeListener(state.windowVisibilityListener);
    }

    private static void removeWindowVisibilityListener(WindowState state) {
        if (state.windowVisibilityListener == null || state.visibilityObserver == null) return;
        if (Build.VERSION.SDK_INT >= 34 && state.visibilityObserver.isAlive()) {
            state.visibilityObserver.removeOnWindowVisibilityChangeListener(state.windowVisibilityListener);
        }
        state.windowVisibilityListener = null;
        state.visibilityObserver = null;
    }

    private static void setWindowBlur(Window window, String mode, int radius) {
        if (Build.VERSION.SDK_INT < 31) return;
        try {
            WindowManager.LayoutParams attributes = window.getAttributes();
            boolean blurBehind = "behind".equals(mode);
            int behindRadius = blurBehind ? radius : 0;
            boolean hasBehindFlag = (attributes.flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND) != 0;
            if ((behindRadius > 0) != hasBehindFlag
                    || getBlurBehindRadius(attributes) != behindRadius) {
                if (behindRadius > 0) attributes.flags |= WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
                else attributes.flags &= ~WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
                attributes.getClass().getMethod("setBlurBehindRadius", int.class).invoke(attributes, behindRadius);
                window.setAttributes(attributes);
            }
            int backgroundRadius = blurBehind ? 0 : radius;
            if (getBackgroundBlurRadius(window) != backgroundRadius) {
                window.getClass().getMethod("setBackgroundBlurRadius", int.class)
                        .invoke(window, backgroundRadius);
            }
        } catch (Throwable ignored) { }
    }

    /** Clear every window blur mechanism while typing, regardless of the selected blur mode. */
    private static void disableWindowBlur(Window window) {
        if (Build.VERSION.SDK_INT < 31) return;
        try {
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.flags &= ~WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
            attributes.getClass().getMethod("setBlurBehindRadius", int.class).invoke(attributes, 0);
            window.setAttributes(attributes);
            window.getClass().getMethod("setBackgroundBlurRadius", int.class).invoke(window, 0);
        } catch (Throwable ignored) { }
    }

    private static int getConfiguredRootAlpha(Context context, View root, SharedPreferences preferences) {
        if (root == null) return 255;
        int themeSurface = getHelakuruBackgroundColor(root);
        int transparency = getTransparency(context, themeSurface);
        return Math.round((100 - transparency) * 2.55f);
    }

    private static void setRootAlpha(WindowState state, int alpha) {
        View root = state.root;
        if (root == null) return;
        SurfaceState surface = state.surfaces.get(root);
        if (surface != null && surface.applied instanceof ColorDrawable) {
            ColorDrawable tint = (ColorDrawable) surface.applied;
            tint.setColor((tint.getColor() & 0x00ffffff) | (clamp(alpha, 0, 255) << 24));
        }
    }

    private static void applyKeyboardSurfaces(InputMethodService service, View root,
                                              WindowState state, SharedPreferences preferences) {
        applyKeyboardSurfaces(service, root, state, preferences, false);
    }

    private static void applyKeyboardSurfaces(InputMethodService service, View root,
                                              WindowState state, SharedPreferences preferences,
                                              boolean opaque) {
        if (root == null) return;
        int themeSurface = getHelakuruBackgroundColor(root);
        int tint = getTintColor(service, root, preferences);
        int transparency = getTransparency(service, themeSurface);
        int alpha = opaque ? 255 : Math.round((100 - transparency) * 2.55f);
        ColorDrawable rootTint = new ColorDrawable((tint & 0x00ffffff) | (alpha << 24));
        applyBackground(root, state, rootTint);

        // KeyboardView has a stock opaque background of its own. Let the root's
        // tinted surface show through instead of leaving the keys on Lite's white fill.
        View keyboard = asView(getFieldValue(service, "keyboardView"));
        if (keyboard == null) {
            int keyboardId = service.getResources().getIdentifier("keyboard_view", "id", service.getPackageName());
            if (keyboardId != 0) keyboard = root.findViewById(keyboardId);
        }
        if (keyboard != null) applyBackground(keyboard, state, transparentDrawable());

        Object candidateViews = getFieldValue(service, "candidateViews");
        Object predictionColor = getFieldValue(candidateViews, "predictionBarColor");
        View toolbar = asView(getFieldValue(candidateViews, "container"));
        if (toolbar == null) toolbar = findCandidateContainer(service, root);
        if (toolbar != null) {
            // The toolbar backdrop is a separate Lite surface; clear it so it
            // inherits the same root tint and alpha as the key area.
            applyBackground(toolbar, state, transparentDrawable());
            int toolbarThemeColor = predictionColor instanceof Integer
                    ? (Integer) predictionColor : themeSurface;
            clearToolbarSurfaces(toolbar, state, toolbarThemeColor);
        }
    }

    private static void clearToolbarSurfaces(View view, WindowState state, int themeColor) {
        Drawable background = view.getBackground();
        // Lite uses flat theme-colored backgrounds for every unselected toolbar
        // button as well as its backing layers. Rounded selection drawables and
        // ImageView foreground icons must remain untouched.
        if (background instanceof ColorDrawable
                && ((ColorDrawable) background).getColor() == themeColor) {
            SurfaceState surface = state.surfaces.get(view);
            if (surface != null && background == surface.applied) {
                // setBackgroundColor can mutate our drawable in place on a theme
                // refresh. Save the new stock color before clearing it again.
                surface.original = new ColorDrawable(themeColor);
            }
            applyBackground(view, state, transparentDrawable());
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                clearToolbarSurfaces(group.getChildAt(i), state, themeColor);
            }
        }
    }

    private static void applyBackground(View view, WindowState state, Drawable target) {
        if (view == null) return;
        Drawable current = view.getBackground();
        SurfaceState surface = state.surfaces.get(view);
        if (surface == null) {
            surface = new SurfaceState(current);
            state.surfaces.put(view, surface);
        } else if (current != surface.applied) {
            // Lite may replace a theme background during a keyboard/theme refresh.
            surface.original = current;
        } else if (current instanceof ColorDrawable && target instanceof ColorDrawable) {
            // Reuse our drawable across input restarts to avoid unnecessary redraws
            // and preserve its saved original.
            ((ColorDrawable) current).setColor(((ColorDrawable) target).getColor());
            surface.applied = current;
            return;
        }
        view.setBackground(target);
        surface.applied = target;
    }

    private static int getTintColor(Context context, View root, SharedPreferences preferences) {
        if ("monet".equals(preferences.getString(COLOR_THEME, "monet"))) {
            Integer color = HelakuruLiteAccentChooser.resolve(context,
                    preferences.getString(HelakuruLiteAccentChooser.PREFERENCE_KEY,
                            HelakuruLiteAccentChooser.DEFAULT_ACCENT));
            if (color != null) return color;
        }
        return getHelakuruBackgroundColor(root);
    }

    private static int getTransparency(Context context, int themeColor) {
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
        if (!preferences.getBoolean(TRANSPARENCY_FOLLOWS_THEME, true)) {
            return clamp(preferences.getInt(TRANSPARENCY_AMOUNT, DEFAULT_TRANSPARENCY), 0, 100);
        }
        double luminance = (0.2126 * Color.red(themeColor) + 0.7152 * Color.green(themeColor)
                + 0.0722 * Color.blue(themeColor)) / 255.0;
        return luminance < 0.45 ? 82 : 90;
    }

    private static int getHelakuruBackgroundColor(View root) {
        try {
            Object theme = getFieldValue(root, "theme");
            Field surface = theme.getClass().getField("f");
            return surface.getInt(theme);
        } catch (Throwable ignored) { }
        try {
            Class<?> serviceClass = Class.forName("lk.bhasha.helakuru.lite.keyboard.KeyboardService");
            Field color = serviceClass.getField("keyBackgroundColor");
            return color.getInt(null);
        } catch (Throwable ignored) {
            return Color.DKGRAY;
        }
    }

    private static boolean isBlurAvailable(Context context) {
        if (Build.VERSION.SDK_INT < 31) return false;
        try {
            Object manager = context.getSystemService(Context.WINDOW_SERVICE);
            Method method = manager.getClass().getMethod("isCrossWindowBlurEnabled");
            return (Boolean) method.invoke(manager);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isBatterySaverOn(Context context) {
        try {
            PowerManager power = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
            return power != null && power.isPowerSaveMode();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void registerBatterySaverReceiver(InputMethodService service, Window window,
                                                       WindowState state) {
        if (state.batterySaverReceiver != null) return;
        try {
            state.batterySaverReceiver = new BroadcastReceiver() {
                @Override public void onReceive(Context context, Intent intent) {
                    applyKeyboardBlur(service);
                }
            };
            IntentFilter filter = new IntentFilter(PowerManager.ACTION_POWER_SAVE_MODE_CHANGED);
            if (Build.VERSION.SDK_INT >= 33) {
                service.registerReceiver(state.batterySaverReceiver, filter, Context.RECEIVER_NOT_EXPORTED);
            } else {
                service.registerReceiver(state.batterySaverReceiver, filter);
            }
        } catch (Throwable ignored) {
            state.batterySaverReceiver = null;
        }
    }

    /** Restore Lite's stock window and view surfaces while preserving saved user preferences. */
    private static void suspendForBatterySaver(InputMethodService service, Window window, WindowState state) {
        state.spacebarHeld = false;
        cancelTypingPause(state);
        disableWindowBlur(window);
        try {
            if (state.windowBackgroundApplied) {
                window.setBackgroundDrawable(state.windowBackground);
                state.windowBackgroundApplied = false;
            }
            for (Map.Entry<View, SurfaceState> entry : new ArrayList<>(state.surfaces.entrySet())) {
                View view = entry.getKey();
                SurfaceState surface = entry.getValue();
                if (view != null && view.getBackground() == surface.applied) {
                    view.setBackground(surface.original);
                }
            }
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(service);
            if ("monet".equals(preferences.getString(COLOR_THEME, "monet"))) {
                applyKeyboardSurfaces(service, getRootView(service), state, preferences, true);
            }
        } catch (Throwable ignored) { }
    }

    private static int getBackgroundBlurRadius(Window window) {
        try {
            return (Integer) window.getClass().getMethod("getBackgroundBlurRadius").invoke(window);
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static int getBlurBehindRadius(WindowManager.LayoutParams attributes) {
        try {
            return (Integer) attributes.getClass().getMethod("getBlurBehindRadius").invoke(attributes);
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static View getRootView(InputMethodService service) {
        return asView(getFieldValue(service, "rootView"));
    }

    private static View findCandidateContainer(Context context, View root) {
        int id = context.getResources().getIdentifier("candidate_container", "id", context.getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    private static Object getFieldValue(Object object, String name) {
        if (object == null) return null;
        try {
            Field field = object.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(object);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static View asView(Object object) {
        return object instanceof View ? (View) object : null;
    }

    private static ColorDrawable transparentDrawable() {
        return new ColorDrawable(Color.TRANSPARENT);
    }

    private static void restore(Window window, InputMethodService service) {
        WindowState state;
        synchronized (STATES) {
            state = STATES.remove(window);
        }
        if (state == null) return;
        state.spacebarHeld = false;
        cancelTypingPause(state);
        if (state.preferences != null && state.preferencesListener != null) {
            state.preferences.unregisterOnSharedPreferenceChangeListener(state.preferencesListener);
        }
        if (state.batterySaverReceiver != null) {
            try { service.unregisterReceiver(state.batterySaverReceiver); } catch (Throwable ignored) { }
            state.batterySaverReceiver = null;
        }
        View oldRoot = state.root;
        if (oldRoot != null && state.detachListener != null) {
            oldRoot.removeOnAttachStateChangeListener(state.detachListener);
        }
        removeWindowVisibilityListener(state);
        try {
            if (Build.VERSION.SDK_INT >= 31) {
                if (isBatterySaverOn(service)) {
                    disableWindowBlur(window);
                } else {
                    WindowManager.LayoutParams attributes = window.getAttributes();
                    if (state.hadBlurBehindFlag) {
                        attributes.flags |= WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
                    } else {
                        attributes.flags &= ~WindowManager.LayoutParams.FLAG_BLUR_BEHIND;
                    }
                    attributes.getClass().getMethod("setBlurBehindRadius", int.class)
                            .invoke(attributes, state.blurBehindRadius);
                    window.setAttributes(attributes);
                    window.getClass().getMethod("setBackgroundBlurRadius", int.class)
                            .invoke(window, state.backgroundBlurRadius);
                }
            }
            window.setBackgroundDrawable(state.windowBackground);
            for (Map.Entry<View, SurfaceState> entry : new ArrayList<>(state.surfaces.entrySet())) {
                View view = entry.getKey();
                SurfaceState surface = entry.getValue();
                if (view != null && view.getBackground() == surface.applied) {
                    view.setBackground(surface.original);
                }
            }
        } catch (Throwable ignored) {
            // Ignore unsupported restoration APIs.
        }
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    private static final class SurfaceState {
        Drawable original;
        Drawable applied;
        SurfaceState(Drawable original) { this.original = original; }
    }

    private static final class WindowState {
        final boolean hadBlurBehindFlag;
        final int blurBehindRadius;
        final int backgroundBlurRadius;
        final Drawable windowBackground;
        boolean windowBackgroundApplied;
        boolean spacebarHeld;
        final Handler handler = new Handler(Looper.getMainLooper());
        Runnable restoreRunnable;
        ValueAnimator animator;
        View root;
        View.OnAttachStateChangeListener detachListener;
        ViewTreeObserver visibilityObserver;
        ViewTreeObserver.OnWindowVisibilityChangeListener windowVisibilityListener;
        String blurMode = "background";
        int targetBlurRadius;
        int targetAlpha = 255;
        SharedPreferences preferences;
        SharedPreferences.OnSharedPreferenceChangeListener preferencesListener;
        BroadcastReceiver batterySaverReceiver;
        final Map<View, SurfaceState> surfaces = new IdentityHashMap<>();
        WindowState(boolean hadBlurBehindFlag, int blurBehindRadius, int backgroundBlurRadius,
                    Drawable windowBackground) {
            this.hadBlurBehindFlag = hadBlurBehindFlag;
            this.blurBehindRadius = blurBehindRadius;
            this.backgroundBlurRadius = backgroundBlurRadius;
            this.windowBackground = windowBackground;
        }
    }
}
