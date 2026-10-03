/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.util.Log;

import app.morphe.extension.facebook.settings.DeVancedSettings;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

/** Manages the right-side hold, downward lock, and reel-change reset states. */
public final class ReelsPlaybackSpeed {
    private static final String TAG = "DeVancedReelsSpeed";
    private static final float NORMAL_SPEED = 1.0f;
    private static final float TWO_X_SPEED = 2.0f;

    private static final Object STATE_LOCK = new Object();
    private static final ConcurrentHashMap<Class<?>, Method> ORIGIN_METHODS =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Method> NO_ARG_STRING_METHODS =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<Class<?>, Method> RATE_SETTERS =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Field> ORIGIN_FIELDS =
            new ConcurrentHashMap<>();

    private static volatile Object activePlayer;
    private static volatile String activeShortsIdentity;
    private static volatile boolean activeShortsLockable;
    private static volatile boolean gestureHeld;
    private static volatile String lockedReelIdentity;

    private ReelsPlaybackSpeed() {
    }

    public static void onPlayerRead(Object player) {
        notePlayer(player);
    }

    public static float overrideGetter(float original) {
        if (!DeVancedSettings.isReels2xSpeedEnabled()) {
            return activeShortsIdentity == null
                    ? original
                    : NORMAL_SPEED;
        }
        return shouldOverride(activeShortsIdentity) ? TWO_X_SPEED : original;
    }

    public static float overrideSpeed(Object player, float original) {
        String identity = notePlayer(player);
        if (!DeVancedSettings.isReels2xSpeedEnabled()) {
            return identity == null ? original : NORMAL_SPEED;
        }
        return shouldOverride(identity) ? TWO_X_SPEED : original;
    }

    public static boolean isGestureAvailable() {
        return DeVancedSettings.isReels2xSpeedEnabled() &&
                activeShortsIdentity != null;
    }

    public static void setGestureHeld(boolean held) {
        boolean changed;
        synchronized (STATE_LOCK) {
            changed = gestureHeld != held;
            gestureHeld = held;
        }
        if (changed) {
            Log.i(TAG, "gesture held=" + held);
            applyDesiredRate();
        }
    }

    /** Returns false when the active Shorts has no stable video id. */
    public static boolean lockCurrentPlayer() {
        if (!isGestureAvailable()) return false;
        String identity = activeShortsIdentity;
        if (identity == null || !activeShortsLockable) return false;

        boolean changed;
        synchronized (STATE_LOCK) {
            changed = !identity.equals(lockedReelIdentity);
            lockedReelIdentity = identity;
        }
        if (changed) {
            Log.i(TAG, "reel locked=" + identity);
            applyDesiredRate();
        }
        return true;
    }

    public static void resetGestureState() {
        synchronized (STATE_LOCK) {
            gestureHeld = false;
            lockedReelIdentity = null;
        }
        applyDesiredRate();
    }

    private static String notePlayer(Object player) {
        PlayerSnapshot snapshot = readSnapshot(player);
        if (snapshot == null) {
            synchronized (STATE_LOCK) {
                activePlayer = null;
                activeShortsIdentity = null;
                activeShortsLockable = false;
                gestureHeld = false;
            }
            return null;
        }

        boolean resetRate = false;
        synchronized (STATE_LOCK) {
            boolean changed = !Objects.equals(
                    activeShortsIdentity,
                    snapshot.identity
            );
            if (changed) {
                gestureHeld = false;
                if (lockedReelIdentity != null &&
                        !lockedReelIdentity.equals(snapshot.identity)) {
                    lockedReelIdentity = null;
                    resetRate = true;
                    Log.i(TAG, "reel changed; lock cleared");
                }
            }
            activePlayer = player;
            activeShortsIdentity = snapshot.identity;
            activeShortsLockable = snapshot.lockable;
        }

        if (resetRate) setPlayerRate(player, NORMAL_SPEED);
        return snapshot.identity;
    }

    private static PlayerSnapshot readSnapshot(Object player) {
        if (!isShortsPlayer(player)) return null;

        String videoId = readNoArgString(player, "CLz");
        if (videoId == null || videoId.isEmpty()) {
            videoId = readNoArgString(player, "CM0");
        }

        String origin = originSignature(player);
        String identity;
        boolean lockable;
        if (videoId != null && !videoId.isEmpty()) {
            identity = "video:" + videoId;
            lockable = true;
        } else {
            identity = "player:" +
                    System.identityHashCode(player) + ":" + origin;
            lockable = false;
        }
        return new PlayerSnapshot(identity, lockable);
    }

    private static String originSignature(Object player) {
        try {
            Method originMethod = ORIGIN_METHODS.computeIfAbsent(
                    player.getClass(),
                    type -> findMethod(type, "Bs0")
            );
            if (originMethod == null) return null;
            Object origin = originMethod.invoke(player);
            if (origin == null) return null;
            String category = readStringField(origin, "A00");
            String surface = readStringField(origin, "A01");
            return category + "|" + surface;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String readNoArgString(Object target, String methodName) {
        if (target == null) return null;
        try {
            Method method = NO_ARG_STRING_METHODS.computeIfAbsent(
                    target.getClass().getName() + "#" + methodName,
                    key -> findMethod(target.getClass(), methodName)
            );
            if (method == null) return null;
            Object value = method.invoke(target);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Method findMethod(Class<?> type, String name) {
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Method method = current.getDeclaredMethod(name);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    private static boolean shouldOverride(String identity) {
        if (identity == null) return false;
        synchronized (STATE_LOCK) {
            return gestureHeld || identity.equals(lockedReelIdentity);
        }
    }

    private static void applyDesiredRate() {
        Object player = activePlayer;
        String identity = activeShortsIdentity;
        if (player == null || identity == null) return;
        setPlayerRate(player, shouldOverride(identity)
                ? TWO_X_SPEED
                : NORMAL_SPEED);
    }

    private static boolean isShortsPlayer(Object playerSettings) {
        if (playerSettings == null) return false;
        try {
            Method originMethod = ORIGIN_METHODS.computeIfAbsent(
                    playerSettings.getClass(),
                    ReelsPlaybackSpeed::findOriginMethod
            );
            if (originMethod == null) return false;
            Object origin = originMethod.invoke(playerSettings);
            if (origin == null) return false;

            String category = readStringField(origin, "A00");
            String surface = readStringField(origin, "A01");
            return isShortsOrigin(category) || isShortsOrigin(surface);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void setPlayerRate(Object player, float rate) {
        if (player == null) return;
        try {
            Method setter = RATE_SETTERS.computeIfAbsent(
                    player.getClass(),
                    ReelsPlaybackSpeed::findRateSetter
            );
            if (setter == null) return;
            setter.invoke(player, rate);
        } catch (Throwable ignored) {
        }
    }

    private static Method findRateSetter(Class<?> type) {
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Method method = current.getDeclaredMethod("A1V", float.class);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    private static Method findOriginMethod(Class<?> type) {
        for (Class<?> current = type;
             current != null;
             current = current.getSuperclass()) {
            try {
                Method method = current.getDeclaredMethod("Bs0");
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    private static String readStringField(Object target, String name) {
        if (target == null) return null;
        try {
            Field field = ORIGIN_FIELDS.computeIfAbsent(
                    target.getClass().getName() + "#" + name,
                    key -> findField(target.getClass(), name)
            );
            if (field == null) return null;
            Object value = field.get(target);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Field findField(Class<?> type, String name) {
        for (Class<?> current = type;
             current != null;
             current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
            }
        }
        return null;
    }

    private static final class PlayerSnapshot {
        final String identity;
        final boolean lockable;

        PlayerSnapshot(String identity, boolean lockable) {
            this.identity = identity;
            this.lockable = lockable;
        }
    }

    private static boolean isShortsOrigin(String value) {
        return value != null && value.toLowerCase(Locale.US).contains("fb_shorts");
    }
}
