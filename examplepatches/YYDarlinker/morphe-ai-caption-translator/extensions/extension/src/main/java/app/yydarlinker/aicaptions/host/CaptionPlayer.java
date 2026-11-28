package app.yydarlinker.aicaptions.host;

import app.yydarlinker.aicaptions.TranslationRuntime;
import app.yydarlinker.aicaptions.overlay.CaptionOverlay;

import android.app.Activity;
import android.graphics.Rect;
import android.media.session.PlaybackState;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;

/** Player ownership, display permission, transition geometry and the official clock. */
public final class CaptionPlayer {
    public static final int UNKNOWN = 0, COMPACT = 1, TRANSITIONING_TO_REGULAR = 2, REGULAR = 3, CLOSED = 4;
    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static String video = "", playerType = "";
    private static volatile long epoch;
    private static int state = UNKNOWN;
    private static boolean surfaceDirty, shortsKnown, shortsOpen, shortsOwner;
    private static Probe probe;
    private static View layoutWatch;
    private static ViewTreeObserver shortsLayouts;
    private static final View.OnLayoutChangeListener ON_LAYOUT = (v, l, t, r, b, ol, ot, or, ob) -> {
        if (state == TRANSITIONING_TO_REGULAR) startProbe();
    };
    private static final ViewTreeObserver.OnGlobalLayoutListener ON_SHORTS_LAYOUT =
            () -> CaptionSession.onReady(true);

    private CaptionPlayer() {}

    static Activity activity() { return activity.get(); }
    public static long ownerEpoch() { return epoch; }
    public static int state() { return state; }
    public static String playerType() { return playerType; }
    public static String shortId() { return "video=" + video + ";authority_epoch=" + epoch; }

    public static String stateName() {
        switch (state) {
            case COMPACT: return "COMPACT";
            case TRANSITIONING_TO_REGULAR: return "TRANSITIONING_TO_REGULAR";
            case REGULAR: return "REGULAR";
            case CLOSED: return "CLOSED";
            default: return "UNKNOWN";
        }
    }

    public static boolean displayPermitted() {
        return state == REGULAR && ownerValid() && (!shortsOwner || CaptionSurface.isShorts());
    }

    static boolean transitioning() {
        return state == COMPACT && !recoverShorts() || state == TRANSITIONING_TO_REGULAR;
    }

    public static boolean consumeSurfaceDirty() {
        boolean dirty = surfaceDirty;
        surfaceDirty = false;
        return dirty;
    }

    private static boolean ownerValid() {
        Activity owner = activity();
        return owner != null && !owner.isFinishing() && !owner.isDestroyed() && owner.getWindow() != null;
    }

    public static void setOwner(Activity owner) {
        if (activity() == owner && state != CLOSED) return;
        activity = new WeakReference<>(owner);
        video = "";
        shortsKnown = shortsOpen = false;
        newVisit(owner == null ? CLOSED : UNKNOWN);
    }

    static void setVideo(String next) {
        if (video.equals(next)) return;
        video = next;
        newVisit(UNKNOWN);
    }

    private static void newVisit(int next) {
        epoch++;
        playerType = "";
        shortsOwner = false;
        resetClock();
        cancelProbe();
        stopWaitingForShorts();
        state = next;
        surfaceDirty = true;
        if (AiCaptionHook.enabled()) CaptionOverlay.denyDisplay(epoch);
    }

    static boolean shortsSurfaceAllowed() { return !shortsKnown || shortsOpen; }

    public static boolean shortsExitBlocked() { return shortsKnown && !shortsOpen && state != REGULAR; }

    static boolean shortsRecoveryCandidate() {
        return shortsSurfaceAllowed()
                && (shortsOwner || shortsOpen && (playerType.isEmpty() || "NONE".equals(playerType)));
    }

    static void onShortsStateChanged(boolean open) {
        if (shortsKnown && shortsOpen == open) return;
        boolean leaving = shortsOwner || shortsOpen && (playerType.isEmpty() || isCompactType(playerType));
        shortsKnown = true;
        shortsOpen = open;
        CaptionSurface.shortsStateChanged();
        surfaceDirty = true;
        if (!open && leaving) {
            newVisit(COMPACT);
            CaptionSession.onShortsClosed();
        } else if (open) CaptionSession.onReady(true);
    }

    static boolean recoverShorts() {
        if (!shortsRecoveryCandidate()) return false;
        if (state == REGULAR && CaptionSurface.isShorts()) return true;
        if (!CaptionSurface.shortsSurfaceNow()) return false;
        noteShortsSurface();
        return state == REGULAR;
    }

    static void waitForShortsLayout() {
        if (shortsLayouts != null || !ownerValid() || !AiCaptionHook.enabled()
                || !shortsRecoveryCandidate()) return;
        shortsLayouts = activity().getWindow().getDecorView().getViewTreeObserver();
        shortsLayouts.addOnGlobalLayoutListener(ON_SHORTS_LAYOUT);
    }

    static void stopWaitingForShorts() {
        if (shortsLayouts != null && shortsLayouts.isAlive())
            shortsLayouts.removeOnGlobalLayoutListener(ON_SHORTS_LAYOUT);
        shortsLayouts = null;
    }

    static void pauseObservers() {
        cancelProbe();
        stopWaitingForShorts();
    }

    static void resumeObservers() {
        reconcileCurrentPlayerType();
        reconcileCurrentPlayerTypeIfUnsettled();
        if (state == TRANSITIONING_TO_REGULAR) startProbe();
    }

    public static void noteShortsSurface() {
        if (!shortsSurfaceAllowed() || !ownerValid()) return;
        stopWaitingForShorts();
        boolean newlyFound = !shortsOwner;
        shortsOwner = true;
        if (newlyFound && state == REGULAR) CaptionSession.onReady(true);
        moveTo(REGULAR);
    }

    public static void onNotification(String type) {
        String next = type == null ? "" : type.trim().toUpperCase(Locale.ROOT);
        if (next.isEmpty()) return;
        boolean changed = !next.equals(playerType);
        playerType = next;
        surfaceDirty = true;
        if (!ownerValid()) moveTo(CLOSED);
        else if (shortsSurfaceAllowed() && (CaptionSurface.isShorts()
                || "NONE".equals(next) && CaptionSurface.shortsSurfaceNow())) noteShortsSurface();
        else if (isCompactType(next)) moveTo(COMPACT);
        else {
            shortsOwner = false;
            stopWaitingForShorts();
            if ((state == COMPACT || state == TRANSITIONING_TO_REGULAR)
                    && next.startsWith("WATCH_WHILE_SLIDING_")) moveTo(TRANSITIONING_TO_REGULAR);
            else if (state != REGULAR) moveTo(REGULAR);
            else if (changed) {
                CaptionButton.playerUnsettled();
                CaptionButton.playerStable();
                CaptionSession.onReady(true);
            }
        }
    }

    static boolean isCompactType(String type) {
        switch (type) {
            case "NONE":
            case "HIDDEN":
            case "INLINE_MINIMAL":
            case "WATCH_WHILE_MINIMIZED":
            case "WATCH_WHILE_PICTURE_IN_PICTURE":
            case "WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED":
                return true;
            default:
                return false;
        }
    }

    private static void moveTo(int next) {
        if (state == next) return;
        state = next;
        cancelProbe();
        if (next == REGULAR) {
            CaptionOverlay.requestPlayerRender();
            CaptionButton.playerStable();
            CaptionSession.onReady(true);
        } else {
            CaptionOverlay.denyDisplay(epoch);
            CaptionButton.playerUnsettled();
            if (next == TRANSITIONING_TO_REGULAR) startProbe();
        }
    }

    private static void startProbe() {
        if (probe != null || !ownerValid()) return;
        probe = new Probe(epoch);
        Choreographer.getInstance().postFrameCallback(probe);
    }

    private static void cancelProbe() {
        if (probe != null) Choreographer.getInstance().removeFrameCallback(probe);
        if (layoutWatch != null) layoutWatch.removeOnLayoutChangeListener(ON_LAYOUT);
        probe = null;
        layoutWatch = null;
    }

    private static final class Probe implements Choreographer.FrameCallback {
        final long owner;
        int frames, stable;
        Rect last;

        Probe(long owner) { this.owner = owner; }

        public void doFrame(long frameTimeNanos) {
            if (probe != this) return;
            if (epoch != owner || state != TRANSITIONING_TO_REGULAR || !ownerValid()) {
                cancelProbe();
                return;
            }
            Rect current = playerRect();
            stable = current != null && last != null
                    && Math.abs(current.left - last.left) <= 1 && Math.abs(current.top - last.top) <= 1
                    && Math.abs(current.right - last.right) <= 1 && Math.abs(current.bottom - last.bottom) <= 1
                    ? stable + 1 : 0;
            last = current;
            if (stable >= 2) moveTo(REGULAR);
            else if (++frames < 12) Choreographer.getInstance().postFrameCallback(this);
            else {
                cancelProbe();
                View player = CaptionSurface.player();
                layoutWatch = player == null ? activity().getWindow().getDecorView() : player;
                layoutWatch.addOnLayoutChangeListener(ON_LAYOUT);
            }
        }
    }

    private static Rect playerRect() {
        View player = CaptionSurface.player();
        Rect rect = new Rect();
        return CaptionSurface.visible(player) && player.getGlobalVisibleRect(rect) ? rect : null;
    }

    public static void reconcileCurrentPlayerType() {
        String type = Official.playerType();
        if (!type.isEmpty() && !"NONE".equals(type) && !playerType.equals(type)) onNotification(type);
    }

    static void reconcileCurrentPlayerTypeIfUnsettled() {
        if (state == REGULAR || state == CLOSED || !ownerValid()) return;
        reconcileCurrentPlayerType();
        if (state != COMPACT || !"WATCH_WHILE_MINIMIZED".equals(playerType)
                || CaptionSurface.isShorts()) return;
        Rect rect = playerRect();
        DisplayMetrics screen = activity().getResources().getDisplayMetrics();
        float minHeight = screen.widthPixels <= screen.heightPixels ? .15f : .40f;
        if (rect != null && rect.height() >= screen.heightPixels * minHeight
                && rect.width() >= screen.widthPixels * .35f) moveTo(REGULAR);
    }

    static TranslationRuntime.ClockSample clock(String expectedVideo) {
        long now = SystemClock.elapsedRealtime();
        try {
            Object id = Official.read(Official.ID);
            if (expectedVideo.isEmpty() || !expectedVideo.equals(id))
                return TranslationRuntime.ClockSample.UNAVAILABLE;
            Object position = Official.read(Official.TIME);
            if (!(position instanceof Number) || ((Number) position).longValue() < 0)
                return TranslationRuntime.ClockSample.UNAVAILABLE;
            Object rate = Official.read(Official.SPEED);
            float speed = rate instanceof Number ? ((Number) rate).floatValue() : 1f;
            if (!Float.isFinite(speed) || speed <= 0 || speed > 4)
                return TranslationRuntime.ClockSample.UNAVAILABLE;
            long at = ((Number) position).longValue();
            int state = playbackState(Official.read(Official.STATE));
            return new TranslationRuntime.ClockSample(true, expectedVideo, at, now,
                    observedPlayback(expectedVideo, at, now, speed, state), speed);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
            return TranslationRuntime.ClockSample.UNAVAILABLE;
        }
    }

    private static String clockVideo = "";
    private static long lastPosition, lastMovementAt;
    private static boolean advancing;

    private static synchronized void resetClock() {
        clockVideo = "";
        advancing = false;
    }

    // The regular watch player's PAUSED state can remain set while the Short advances.
    private static synchronized int observedPlayback(String owner, long position, long now,
            float speed, int state) {
        long elapsed = now - lastMovementAt, moved = position - lastPosition;
        boolean same = owner.equals(clockVideo) && elapsed >= 0 && elapsed <= 1500;
        if (!same || moved != 0) {
            advancing = same && moved > 0 && Math.abs(moved - elapsed * speed)
                    <= Math.max(120, elapsed * speed / 2);
            clockVideo = owner;
            lastPosition = position;
            lastMovementAt = now;
        } else if (elapsed > 500) advancing = false;
        return state == PlaybackState.STATE_PAUSED && advancing ? PlaybackState.STATE_PLAYING : state;
    }

    private static int playbackState(Object value) {
        String name = value == null ? "" : value.toString().toUpperCase(Locale.ROOT);
        if (name.contains("PAUSED")) return PlaybackState.STATE_PAUSED;
        if (name.contains("BUFFER")) return PlaybackState.STATE_BUFFERING;
        if (name.contains("ENDED")) return PlaybackState.STATE_STOPPED;
        if (name.contains("NEW") || name.contains("ERROR")) return PlaybackState.STATE_NONE;
        return PlaybackState.STATE_PLAYING;
    }

    private static final class Official {
        private static final String YOUTUBE = "app.morphe.extension.youtube.";
        private static final String INFO = YOUTUBE + "patches.VideoInformation";
        private static final String TYPE = YOUTUBE + "shared.PlayerType";
        static final Method ID = method(INFO, "getVideoId");
        static final Method TIME = method(INFO, "getVideoTime");
        static final Method SPEED = method(INFO, "getPlaybackSpeed");
        static final Method STATE = method(YOUTUBE + "shared.VideoState", "getCurrent");
        static final Method TYPE_GETTER = typeGetter();
        static final Field TYPE_FIELD = TYPE_GETTER == null ? typeField() : null;

        private static Method method(String owner, String name) {
            try {
                return Class.forName(owner).getMethod(name);
            } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
                return null;
            }
        }

        private static Method typeGetter() {
            Method getter = method(TYPE, "access$getCurrentPlayerType$cp");
            return getter == null ? method(TYPE, "getCurrentPlayerType") : getter;
        }

        private static Field typeField() {
            try {
                Field field = Class.forName(TYPE).getDeclaredField("currentPlayerType");
                field.setAccessible(true);
                return field;
            } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
                return null;
            }
        }

        static Object read(Method method) throws ReflectiveOperationException {
            return method == null ? null : method.invoke(null);
        }

        static String playerType() {
            try {
                Object type = TYPE_FIELD == null ? read(TYPE_GETTER) : TYPE_FIELD.get(null);
                return type instanceof Enum<?> ? ((Enum<?>) type).name() : "";
            } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
                return "";
            }
        }
    }

    static void resetForTests() {
        cancelProbe();
        stopWaitingForShorts();
        activity.clear();
        video = playerType = clockVideo = "";
        epoch = lastPosition = lastMovementAt = 0;
        state = UNKNOWN;
        surfaceDirty = shortsKnown = shortsOpen = shortsOwner = advancing = false;
    }
}
