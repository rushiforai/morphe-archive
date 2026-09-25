package app.morphe.extension.tiktok.cleardisplay;

import android.os.Handler;
import android.os.Looper;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Owns Automatic Clear Display for TikTok 46.7.3.
 *
 * Runtime requests are deliberately kept out of TikTok's verifier-sensitive bytecode. The patch
 * passes only the discovered clear-event class name as a String from exact native lifecycle hooks;
 * event construction, PINCH_ZOOM type resolution and event-bus dispatch all happen reflectively in
 * extension code and fail open.
 */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class AutomaticClearDisplayController {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Object LOCK = new Object();

    // Exact 46.7.3 discoveries. They are Strings on purpose: no verifier/link-time dependency is
    // introduced into the patched TikTok method.
    private static final String EVENT_TYPE_CLASS = "X.0tlj";
    private static final String EVENT_TYPE_PINCH_ZOOM = "PINCH_ZOOM";
    private static final String EVENT_DISPATCHER_CLASS = "X.06sX";

    private static final ConcurrentHashMap<String, Constructor<?>> EVENT_CONSTRUCTORS =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Method> EVENT_POST_METHODS =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Method> EVENT_DISPATCH_METHODS =
            new ConcurrentHashMap<>();
    private static final AtomicBoolean FIRST_TRIGGER_LOGGED = new AtomicBoolean(false);
    private static final AtomicInteger PANEL_TRIGGER_LOG_BUDGET = new AtomicInteger(12);

    private static Runnable pending;
    private static String latestEventClassName = "";
    private static int videoGeneration;
    private static volatile boolean patchEnabled;
    private static volatile boolean manualOverride;
    private static volatile long lastAutomaticPostAtMs;
    private static volatile boolean compatibilityFailureLogged;
    private static volatile Integer pinchZoomType;

    private AutomaticClearDisplayController() {
    }

    /** Called only when the Automatic Clear Display patch is actually present in the patched APK. */
    public static void enablePatch() {
        patchEnabled = true;
    }

    public static boolean isEnabled() {
        return patchEnabled && Settings.AUTOMATIC_CLEAR_DISPLAY.get();
    }

    public static boolean shouldRestoreRememberedState() {
        return !isEnabled();
    }

    /**
     * Primary 46.7.3 per-item trigger. Called at the final return of the exact
     * ClearModePanelComponent method containing the native "resetClearMode" path.
     */
    public static void onPanelReset(String eventClassName) {
        // If this callback exists in the APK, the optional patch is definitely installed. This also
        // makes runtime activation independent of opening BlueIT settings or a particular feed body.
        patchEnabled = true;

        String normalized = normalizeClassName(eventClassName);
        if (normalized.isEmpty()) return;

        if (BaseSettings.DEBUG.get() && PANEL_TRIGGER_LOG_BUDGET.getAndDecrement() > 0) {
            final boolean enabled = isEnabled();
            Logger.printInfo(() -> "[BlueIT ClearDisplay] native panel-reset trigger enabled="
                    + enabled + " class=" + normalized + " delayMs=" + delayMs());
        }

        synchronized (LOCK) {
            latestEventClassName = normalized;
            videoGeneration++;
            manualOverride = false;
            lastAutomaticPostAtMs = 0L;
            cancelLocked();
            if (isEnabled()) {
                scheduleLocked(videoGeneration, normalized);
            }
        }
    }

    /**
     * Secondary fallback retained for feeds that expose the proven render-first-frame hook. The
     * native panel-reset callback above is the primary trigger on 46.7.3.
     */
    public static void onRenderFirstFrame(String eventClassName) {
        if (!isEnabled()) return;

        String normalized = normalizeClassName(eventClassName);
        if (normalized.isEmpty()) return;

        if (BaseSettings.DEBUG.get() && FIRST_TRIGGER_LOGGED.compareAndSet(false, true)) {
            Logger.printInfo(() -> "[BlueIT ClearDisplay] first-frame fallback trigger active class="
                    + normalized + " delayMs=" + delayMs());
        }

        synchronized (LOCK) {
            latestEventClassName = normalized;
            videoGeneration++;
            manualOverride = false;
            lastAutomaticPostAtMs = 0L;
            cancelLocked();
            scheduleLocked(videoGeneration, normalized);
        }
    }

    /** Gesture/manual entry point used by optional integrations after a current event class is known. */
    public static boolean postNow() {
        final String eventClassName;
        synchronized (LOCK) {
            eventClassName = latestEventClassName;
            cancelLocked();
        }
        if (!isEnabled() || eventClassName.isEmpty()) return false;
        return postEvent(eventClassName, true);
    }

    /** Proven remembered-state restoration, also kept fully reflective for verifier safety. */
    public static boolean postRemembered(String eventClassName) {
        String normalized = normalizeClassName(eventClassName);
        if (normalized.isEmpty()) return false;
        return postEvent(normalized, false);
    }

    /**
     * Tracks native clear-display state. If the user manually leaves clear display after our
     * automatic request, do not force it back on for the same video. A new panel reset clears this.
     */
    public static void onClearDisplayStateChanged(boolean enabled) {
        if (!isEnabled() || enabled) return;

        long automaticPostAt = lastAutomaticPostAtMs;
        if (automaticPostAt <= 0L) return;

        // Ignore immediate synchronous state churn caused by our own event dispatch.
        if (System.currentTimeMillis() - automaticPostAt <= 150L) return;

        synchronized (LOCK) {
            manualOverride = true;
            cancelLocked();
        }
    }

    public static void cancel() {
        synchronized (LOCK) {
            cancelLocked();
        }
    }

    /** Compatibility no-op for older development APK bytecode. */
    public static void updatePanelContext(Object panel, Object itemContext) {
        // Intentionally unused in the verifier-safe 46.7.3 implementation.
    }

    private static void scheduleLocked(int generation, String eventClassName) {
        if (manualOverride) return;

        pending = () -> {
            synchronized (LOCK) {
                pending = null;
                if (!isEnabled()
                        || manualOverride
                        || generation != videoGeneration
                        || !eventClassName.equals(latestEventClassName)) {
                    return;
                }
            }
            postEvent(eventClassName, true);
        };
        MAIN.postDelayed(pending, delayMs());
    }

    private static long delayMs() {
        int configured = Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY_MS.get();
        return Math.max(250L, Math.min(15_000L, configured));
    }

    private static void cancelLocked() {
        if (pending != null) {
            MAIN.removeCallbacks(pending);
            pending = null;
        }
    }

    /**
     * Creates TikTok's real four-argument ClearDisplay event. Automatic entry uses the exact
     * PINCH_ZOOM enum type discovered from 46.7.3 and source="pinch". Remembered-state restoration
     * intentionally keeps the legacy neutral type/source combination.
     */
    private static boolean postEvent(String eventClassName, boolean automatic) {
        try {
            Constructor<?> constructor = eventConstructor(eventClassName);
            int eventType = automatic ? getPinchZoomType() : 0;
            Object event = constructor.newInstance(
                    true,
                    eventType,
                    "",
                    automatic ? "pinch" : "long_press"
            );

            if (automatic) lastAutomaticPostAtMs = System.currentTimeMillis();
            if (!dispatchEvent(eventClassName, event)) {
                throw new NoSuchMethodException("No compatible TikTok event dispatcher/post method");
            }

            if (BaseSettings.DEBUG.get()) {
                final int postedType = eventType;
                Logger.printInfo(() -> "[BlueIT ClearDisplay] event posted "
                        + (automatic ? "automatically" : "for remembered state")
                        + " class=" + eventClassName
                        + " type=" + postedType
                        + " source=" + (automatic ? "pinch" : "long_press"));
            }
            return true;
        } catch (Throwable throwable) {
            if (automatic) lastAutomaticPostAtMs = 0L;
            logCompatibilityFailureOnce(throwable, eventClassName);
            return false;
        }
    }

    /** Use TikTok's own LX/06sX.LIZ(IEvent) dispatcher first; instance post() is only a fallback. */
    private static boolean dispatchEvent(String eventClassName, Object event) {
        try {
            Method cached = EVENT_DISPATCH_METHODS.get(eventClassName);
            if (cached == null) {
                Class<?> dispatcher = loadClass(EVENT_DISPATCHER_CLASS);
                for (Method candidate : dispatcher.getDeclaredMethods()) {
                    Class<?>[] parameters = candidate.getParameterTypes();
                    if (!"LIZ".equals(candidate.getName())
                            || !Modifier.isStatic(candidate.getModifiers())
                            || parameters.length != 1
                            || !parameters[0].isAssignableFrom(event.getClass())) {
                        continue;
                    }
                    candidate.setAccessible(true);
                    cached = candidate;
                    EVENT_DISPATCH_METHODS.put(eventClassName, candidate);
                    break;
                }
            }
            if (cached != null) {
                cached.invoke(null, event);
                return true;
            }
        } catch (Throwable ignored) {
            // Fall through to the event's own post() helper.
        }

        try {
            Method post = eventPostMethod(eventClassName, event.getClass());
            post.invoke(event);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Resolve LX/0tlj.PINCH_ZOOM.getType() without linking the obfuscated enum into bytecode. */
    private static int getPinchZoomType() throws Exception {
        Integer cached = pinchZoomType;
        if (cached != null) return cached;

        Class<?> typeClass = loadClass(EVENT_TYPE_CLASS);
        Object enumValue = null;

        try {
            Field field = typeClass.getDeclaredField(EVENT_TYPE_PINCH_ZOOM);
            field.setAccessible(true);
            enumValue = field.get(null);
        } catch (NoSuchFieldException ignored) {
            // Fail-open fallback for a future minor obfuscation that preserves a useful label.
            for (Field field : typeClass.getDeclaredFields()) {
                if (!Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    Object candidate = field.get(null);
                    if (candidate == null) continue;
                    String label = (field.getName() + " " + String.valueOf(candidate))
                            .toLowerCase(Locale.ROOT);
                    if (label.contains("pinch") && label.contains("zoom")) {
                        enumValue = candidate;
                        break;
                    }
                } catch (Throwable ignoredCandidate) {
                }
            }
        }

        if (enumValue == null) {
            throw new NoSuchFieldException(EVENT_TYPE_CLASS + ".PINCH_ZOOM");
        }

        Method getType = findNoArgMethod(enumValue.getClass(), "getType");
        if (getType == null) throw new NoSuchMethodException(EVENT_TYPE_CLASS + ".getType()");
        getType.setAccessible(true);
        Object value = getType.invoke(enumValue);
        if (!(value instanceof Number)) {
            throw new IllegalStateException("PINCH_ZOOM.getType() is not numeric");
        }

        int resolved = ((Number) value).intValue();
        pinchZoomType = resolved;
        return resolved;
    }

    private static Constructor<?> eventConstructor(String eventClassName) throws Exception {
        Constructor<?> cached = EVENT_CONSTRUCTORS.get(eventClassName);
        if (cached != null) return cached;

        Class<?> eventClass = loadClass(eventClassName);
        Constructor<?> constructor = eventClass.getDeclaredConstructor(
                boolean.class,
                int.class,
                String.class,
                String.class
        );
        constructor.setAccessible(true);
        EVENT_CONSTRUCTORS.put(eventClassName, constructor);
        return constructor;
    }

    private static Method eventPostMethod(String eventClassName, Class<?> eventClass) throws Exception {
        Method cached = EVENT_POST_METHODS.get(eventClassName);
        if (cached != null) return cached;

        Method post = findNoArgMethod(eventClass, "post");
        if (post == null) {
            throw new NoSuchMethodException(eventClassName + ".post()");
        }
        post.setAccessible(true);
        EVENT_POST_METHODS.put(eventClassName, post);
        return post;
    }

    private static Class<?> loadClass(String className) throws ClassNotFoundException {
        try {
            return Class.forName(className);
        } catch (ClassNotFoundException first) {
            ClassLoader contextLoader = Thread.currentThread().getContextClassLoader();
            if (contextLoader != null) {
                return Class.forName(className, false, contextLoader);
            }
            throw first;
        }
    }

    private static Method findNoArgMethod(Class<?> type, String name) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredMethod(name);
            } catch (NoSuchMethodException ignored) {
            }
        }
        try {
            return type.getMethod(name);
        } catch (NoSuchMethodException ignored) {
            return null;
        }
    }

    private static String normalizeClassName(String eventClassName) {
        if (eventClassName == null) return "";
        String value = eventClassName.trim();
        if (value.startsWith("L") && value.endsWith(";") && value.length() > 2) {
            value = value.substring(1, value.length() - 1);
        }
        return value.replace('/', '.');
    }

    private static void logCompatibilityFailureOnce(Throwable throwable, String eventClassName) {
        if (compatibilityFailureLogged) return;
        compatibilityFailureLogged = true;
        Logger.printInfo(() -> "[BlueIT ClearDisplay] reflected 46.7.3 route unavailable "
                + "class=" + eventClassName
                + " (" + throwable.getClass().getSimpleName()
                + ": " + safeMessage(throwable) + ")");
    }

    private static String safeMessage(Throwable throwable) {
        String message = throwable.getMessage();
        return message == null ? "no message" : message;
    }
}
