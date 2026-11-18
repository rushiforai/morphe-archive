package io.github.sabopura.morphe.extension.twitch.app;

import java.lang.reflect.Field;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;

/**
 * Twitch's own error-screen Retry on the presenter on screen: a new access token and playlist for
 * live streams, the same position for VODs. Clip and vertical presenters have no usable Retry.
 */
public final class PlayerRetry {
    private static final String STREAM = "tv.twitch.android.models.streams.StreamModel";
    private static final String VOD = "tv.twitch.android.models.videos.VodModel";
    private static volatile Object castHelper;

    private PlayerRetry() {
    }

    /** Injection point: Twitch reading its cast session, which it does whenever casting starts. */
    public static void castHelper(Object helper) {
        castHelper = helper;
    }

    /** Main thread. */
    public static boolean casting() {
        Object helper = castHelper;
        if (helper == null) return false;
        try {
            return session(helper) != null;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.cast-session", e);
            return false;
        }
    }

    /** Main thread. False when the presenter on screen cannot Retry, so the caller reloads by itself. */
    public static boolean retry() {
        Object presenter = PlayerAttach.onScreen();
        if (presenter == null || !holdsContent(presenter)) return false;
        try {
            retry(presenter, 0, true);
            return true;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.player-retry", e);
            return false;
        }
    }

    /** Only the live and VOD presenters keep their stream or video, and only they reload it on Retry. */
    private static boolean holdsContent(Object presenter) {
        try {
            for (Class<?> c = presenter.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field field : c.getDeclaredFields()) {
                    String type = field.getType().getName();
                    if (!type.equals(STREAM) && !type.equals(VOD)) continue;
                    field.setAccessible(true);
                    return field.get(presenter) != null;
                }
            }
        } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
            Diagnostics.note("app.player-retry-content", e);
        }
        return false;
    }

    /** Replaced at patch time: Twitch's cast session, or null when not casting. */
    private static Object session(Object helper) {
        return null;
    }

    /** Replaced at patch time: the call Twitch's Retry button makes, (0, true). */
    private static void retry(Object presenter, Integer position, boolean newToken) {
    }
}
