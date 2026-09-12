package app.morphe.extension.tiktok.cleardisplay;

import android.os.Handler;
import android.os.Looper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Owns Automatic Clear Display for TikTok 46.4.3.
 *
 * TikTok validates clear-mode events against the current panel/feed context. For that
 * reason BlueIT no longer fabricates an event and calls event.post(). Instead we retain
 * the real ClearModePanelComponent and ask it to enter clear mode through TikTok's own
 * request method (Rv0), using the native PINCH_ZOOM event type and "pinch" source.
 */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class AutomaticClearDisplayController {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Object LOCK = new Object();

    private static final String CLEAR_PANEL_REQUEST_METHOD = "Rv0";
    private static final String CLEAR_EVENT_TYPE_CLASS = "X.12x2";
    private static final String CLEAR_EVENT_PINCH_ZOOM = "PINCH_ZOOM";
    private static final String CLEAR_EVENT_DISPATCHER_CLASS = "X.093F";

    private static Runnable pending;
    private static Object latestEvent;
    private static Object latestPanel;
    private static String latestPanelToken = "";
    private static volatile boolean manualOverride;
    private static volatile long lastAutomaticPostAtMs;
    private static volatile Integer pinchZoomType;

    private AutomaticClearDisplayController() {
    }

    public static boolean isEnabled() {
        return Settings.AUTOMATIC_CLEAR_DISPLAY.get();
    }

    public static boolean shouldRestoreRememberedState() {
        return !isEnabled();
    }

    /**
     * Called from ClearModePanelComponent.resetClearMode for the current feed item.
     * Keeping the real panel is essential because it supplies TikTok's current eventType.
     */
    public static void updatePanelContext(Object panel, Object itemContext) {
        if (panel == null) return;

        String token = contextToken(itemContext);
        synchronized (LOCK) {
            boolean changed = panel != latestPanel || !token.equals(latestPanelToken);
            latestPanel = panel;
            latestPanelToken = token;

            if (changed) {
                cancelLocked();
                manualOverride = false;
                lastAutomaticPostAtMs = 0L;

                // resetClearMode is itself a per-item lifecycle signal. Schedule here as
                // a fallback in case PlayerController's first-frame callback is delayed.
                if (isEnabled()) {
                    scheduleLocked(panel, token);
                }
            }
        }
    }

    /** Called for every newly rendered feed video by the existing proven first-frame hook. */
    public static void onNewVideo(Object clearDisplayEvent) {
        synchronized (LOCK) {
            latestEvent = clearDisplayEvent;
            if (!isEnabled() || manualOverride || latestPanel == null) {
                return;
            }

            cancelLocked();
            scheduleLocked(latestPanel, latestPanelToken);
        }
    }

    /** Immediately enters clear-display mode using TikTok's current real panel. */
    public static boolean postNow() {
        final Object panel;
        final Object fallbackEvent;
        synchronized (LOCK) {
            panel = latestPanel;
            fallbackEvent = latestEvent;
            cancelLocked();
        }

        if (panel != null && requestNativeClearDisplay(panel, false)) {
            return true;
        }

        // Compatibility fallback for a surface where no ClearModePanelComponent was
        // observed. The native 46.4.3 event-bus dispatcher is attempted before post().
        return fallbackEvent != null && dispatchEvent(fallbackEvent, false);
    }

    /**
     * Tracks native clear-display state. A false state before BlueIT ever entered clear
     * mode is ordinary TikTok setup, not a manual override. Once automatic clear mode was
     * requested, a later false state suppresses re-entry until the next feed item.
     */
    public static void onClearDisplayStateChanged(boolean enabled) {
        if (!isEnabled() || enabled) {
            return;
        }

        long automaticPostAt = lastAutomaticPostAtMs;
        if (automaticPostAt <= 0L) {
            return;
        }

        // Ignore only the immediate synchronous event-bus churn caused by the request.
        if (System.currentTimeMillis() - automaticPostAt <= 150L) {
            return;
        }

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

    private static void scheduleLocked(Object panel, String token) {
        if (panel == null || manualOverride) return;

        final Object scheduledPanel = panel;
        final String scheduledToken = token;
        pending = () -> {
            synchronized (LOCK) {
                pending = null;
                if (!isEnabled() || manualOverride || scheduledPanel != latestPanel
                        || !scheduledToken.equals(latestPanelToken)) {
                    return;
                }
            }
            requestNativeClearDisplay(scheduledPanel, true);
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
     * TikTok 46.4.3: ClearModePanelComponent.Rv0(int eventType, String source,
     * boolean isClean). Rv0 obtains the current feed eventType itself, creates LX/0RG4
     * and dispatches it through LX/093F, matching the native pinch implementation.
     */
    private static boolean requestNativeClearDisplay(Object panel, boolean automatic) {
        try {
            int eventType = getPinchZoomType();
            Method request = findMethod(
                    panel.getClass(),
                    CLEAR_PANEL_REQUEST_METHOD,
                    int.class,
                    String.class,
                    boolean.class
            );
            if (request == null) {
                throw new NoSuchMethodException(panel.getClass().getName() + ".Rv0(int,String,boolean)");
            }
            request.setAccessible(true);

            Object result = request.invoke(panel, eventType, "pinch", true);
            boolean accepted = !(result instanceof Boolean) || (Boolean) result;
            if (accepted && automatic) {
                lastAutomaticPostAtMs = System.currentTimeMillis();
            }

            if (BaseSettings.DEBUG.get()) {
                Logger.printInfo(() -> "[BlueIT ClearDisplay] native panel request "
                        + (automatic ? "automatic" : "gesture")
                        + " accepted=" + accepted
                        + " eventType=" + eventType);
            }
            return accepted;
        } catch (Throwable throwable) {
            if (automatic) {
                lastAutomaticPostAtMs = 0L;
            }
            if (BaseSettings.DEBUG.get()) {
                Logger.printException(() -> "[BlueIT ClearDisplay] native panel request failed", throwable);
            }
            return false;
        }
    }

    private static int getPinchZoomType() throws Exception {
        Integer cached = pinchZoomType;
        if (cached != null) return cached;

        Class<?> typeClass = Class.forName(CLEAR_EVENT_TYPE_CLASS);
        Field field = typeClass.getDeclaredField(CLEAR_EVENT_PINCH_ZOOM);
        field.setAccessible(true);
        Object enumValue = field.get(null);
        if (enumValue == null) throw new IllegalStateException("PINCH_ZOOM is null");

        Method getType = findMethod(enumValue.getClass(), "getType");
        if (getType == null) throw new NoSuchMethodException("PINCH_ZOOM.getType()");
        getType.setAccessible(true);
        Object value = getType.invoke(enumValue);
        if (!(value instanceof Number)) throw new IllegalStateException("PINCH_ZOOM.getType() is not numeric");

        int resolved = ((Number) value).intValue();
        pinchZoomType = resolved;
        return resolved;
    }

    /** Native event-bus fallback for 46.4.3. */
    private static boolean dispatchEvent(Object event, boolean automatic) {
        try {
            Class<?> dispatcher = Class.forName(CLEAR_EVENT_DISPATCHER_CLASS);
            Method dispatch = null;
            for (Method candidate : dispatcher.getDeclaredMethods()) {
                if (!candidate.getName().equals("LIZ") || candidate.getParameterTypes().length != 1
                        || !Modifier.isStatic(candidate.getModifiers())) {
                    continue;
                }
                if (candidate.getParameterTypes()[0].isAssignableFrom(event.getClass())) {
                    dispatch = candidate;
                    break;
                }
            }
            if (dispatch != null) {
                dispatch.setAccessible(true);
                if (automatic) lastAutomaticPostAtMs = System.currentTimeMillis();
                dispatch.invoke(null, event);
                return true;
            }
        } catch (Throwable ignored) {
            // Fall through to the legacy event instance method.
        }

        try {
            Method post = findMethod(event.getClass(), "post");
            if (post == null) return false;
            post.setAccessible(true);
            if (automatic) lastAutomaticPostAtMs = System.currentTimeMillis();
            post.invoke(event);
            return true;
        } catch (Throwable throwable) {
            if (automatic) lastAutomaticPostAtMs = 0L;
            if (BaseSettings.DEBUG.get()) {
                Logger.printException(() -> "[BlueIT ClearDisplay] fallback event dispatch failed", throwable);
            }
            return false;
        }
    }

    private static String contextToken(Object itemContext) {
        if (itemContext == null) return "null";
        try {
            Object aweme = invokeNoArg(itemContext, "getAweme");
            if (aweme != null) {
                Object aid = invokeNoArg(aweme, "getAid");
                if (aid instanceof String && !((String) aid).isEmpty()) {
                    return "aid:" + aid;
                }
            }
        } catch (Throwable ignored) {
        }
        return itemContext.getClass().getName() + "@" + System.identityHashCode(itemContext);
    }

    private static Object invokeNoArg(Object target, String name) throws Exception {
        Method method = findMethod(target.getClass(), name);
        if (method == null) return null;
        method.setAccessible(true);
        return method.invoke(target);
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... parameterTypes) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredMethod(name, parameterTypes);
            } catch (NoSuchMethodException ignored) {
            }
        }
        try {
            return type.getMethod(name, parameterTypes);
        } catch (NoSuchMethodException ignored) {
            return null;
        }
    }
}
