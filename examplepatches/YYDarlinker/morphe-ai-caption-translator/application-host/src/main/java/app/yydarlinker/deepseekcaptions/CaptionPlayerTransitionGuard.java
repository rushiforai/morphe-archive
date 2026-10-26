package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.view.Choreographer;
import android.view.View;

import java.lang.ref.WeakReference;

/**
 * Keeps extension work out of YouTube's player transition critical path. It consumes {@link
 * CaptionPlayerAuthority} and owns at most one revocable read-only probe per owner epoch. Every
 * probe exit path (owner change, decor disappearance, token change, timeout, completion) releases
 * its own slot, and a cleanup only clears the slot it owns, so an old probe can never clear a newer
 * one.
 */
final class CaptionPlayerTransitionGuard {
    private static final int MIN_OBSERVATION_FRAMES = 3;
    private static final int NO_MOTION_FALLBACK_FRAMES = 3;
    private static final int STABLE_FRAMES_REQUIRED = 2;
    private static final int MAX_OBSERVATION_FRAMES = 12;
    private static final int PIXEL_TOLERANCE = 1;

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static WeakReference<View> playerRectView = new WeakReference<>(null);
    private static WeakReference<View> observedPlayerView = new WeakReference<>(null);
    private static WeakReference<View> recoveryLayoutRoot = new WeakReference<>(null);
    private static long ownerEpoch = -1;
    private static long generation;
    private static long probeNanos;
    private static Probe pendingProbe;
    private static boolean awaitingPlayerChild;
    private static boolean listenerInstalled;

    private static final CaptionPlayerAuthority.Listener AUTHORITY_LISTENER =
            CaptionPlayerTransitionGuard::onAuthorityChanged;

    /**
     * A real layout event is only a wake-up. Restore permission still requires this owner to expose
     * a proven current player surface, so an unrelated decor relayout cannot award the restore.
     */
    private static final View.OnLayoutChangeListener RECOVERY_LAYOUT =
            (v, l, t, r, b, oldL, oldT, oldR, oldB) -> {
                if (awaitingPlayerChild && pendingProbe == null && ownerSurfaceStable())
                    awardRestore();
            };

    private CaptionPlayerTransitionGuard() {}

    static void installAuthorityListener() {
        listenerInstalled = true;
        CaptionPlayerAuthority.addListener(AUTHORITY_LISTENER);
    }

    static void setActivity(Activity activity) {
        removeRecoveryLayout();
        activityRef = new WeakReference<>(activity);
        ownerEpoch = -1;
        forget();
    }

    /**
     * One player notification on the main thread. Authority merge only plus constant-time
     * bookkeeping; no tree scan, font measurement, network or keystore work happens here.
     */
    static void onPlayerType(String rawType) {
        Activity activity = activityRef.get();
        if (activity != null && activity != CaptionPlayerAuthority.activity())
            CaptionPlayerAuthority.setOwner(activity);
        long currentEpoch = CaptionPlayerAuthority.ownerEpoch();
        if (currentEpoch != ownerEpoch) {
            ownerEpoch = currentEpoch;
            forget();
        }
        boolean installed = listenerInstalled;
        CaptionPlayerAuthority.onNotification(rawType);
        // The state change reaches the coordinator through the listener; before it is installed
        // (first notification of a cold owner) drive the coordinator directly.
        if (!installed) onAuthorityChanged();
    }

    /** After the authority merged a notification or changed owner or state (main thread). */
    private static void onAuthorityChanged() {
        // Permission denial retracts an existing paint in this very commit, not at the next tick.
        // The epoch keeps the delayed cleanup of an old owner from hiding a newer one.
        if (!CaptionPlayerAuthority.displayPermitted())
            CaptionOverlay.denyDisplay(CaptionPlayerAuthority.ownerEpoch());
        // A cleared authority also clears this coordinator: a stale Activity must never be
        // re-declared as the owner of a later session.
        if (CaptionPlayerAuthority.activity() == null) {
            activityRef = new WeakReference<>(null);
            ownerEpoch = -1;
            forget();
            return;
        }
        String type = CaptionPlayerAuthority.playerType();
        int state = CaptionPlayerAuthority.state();
        CaptionMusicSuppressor.pauseDiscoveryForPlayerTransition(true);
        CaptionMusicSuppressor.beginNativeRendererTransition();
        CaptionButtonController.onPlayerTransition(type);

        switch (state) {
            case CaptionPlayerAuthority.COMPACT:
                forget();
                if (CaptionPlayerAuthority.ownerValid())
                    awaitValidLayout(CaptionPlayerAuthority.decorView());
                CaptionMusicSuppressor.endNativeRendererTransition();
                break;
            case CaptionPlayerAuthority.CLOSED:
            case CaptionPlayerAuthority.UNKNOWN:
                revokeProbe();
                CaptionMusicSuppressor.endNativeRendererTransition();
                break;
            case CaptionPlayerAuthority.REGULAR:
                // No compact predecessor: the authoritative non-compact type is already decisive,
                // so no geometry is observed. One frame-aligned render keeps the visible caption on
                // the newly reported mode and the coordinator returns to idle.
                forget();
                removeRecoveryLayout();
                CaptionOverlay.requestPlayerRender();
                CaptionButtonController.onPlayerStable();
                CaptionMusicSuppressor.endNativeRendererTransition();
                CaptionSessionReconciler.onPlayerReady(activityRef.get(), "player_regular");
                break;
            default: // TRANSITIONING_TO_REGULAR relies on real geometry.
                if (ownerSurfaceStable() && pendingProbe == null) startProbe();
        }
    }

    // ---- State shared by the exit paths ----

    /** Drops the probe, the remembered player views and the wait for a player child. */
    private static void forget() {
        revokeProbe();
        awaitingPlayerChild = false;
    }

    private static void revokeProbe() {
        generation++;
        pendingProbe = null;
        observedPlayerView.clear();
        playerRectView.clear();
    }

    /**
     * The surface is settled: hand the display permission to the authority and end the quarantine.
     */
    private static void settle() {
        removeRecoveryLayout();
        awaitingPlayerChild = false;
        CaptionPlayerAuthority.settleRegular();
        CaptionButtonController.onPlayerStable();
        CaptionMusicSuppressor.endNativeRendererTransition();
        CaptionSessionReconciler.onPlayerReady(activityRef.get(), "geometry_ready");
    }

    private static void markStable(Activity activity, String detail) {
        CaptionDiagnostics.mark(
                activity,
                "PLAYER_TRANSITION_STABLE",
                "type="
                        + CaptionPlayerAuthority.playerType()
                        + detail
                        + ";state="
                        + CaptionPlayerAuthority.stateName()
                        + ";geometry_probe_total_us="
                        + probeNanos / 1000
                        + ";"
                        + CaptionPlayerAuthority.shortId());
    }

    private static void awardRestore() {
        settle();
        Activity activity = activityRef.get();
        if (activity != null) markStable(activity, "");
    }

    // ---- Waiting for the player to come back ----

    private static void removeRecoveryLayout() {
        View view = recoveryLayoutRoot.get();
        if (view != null) view.removeOnLayoutChangeListener(RECOVERY_LAYOUT);
        recoveryLayoutRoot.clear();
    }

    /**
     * Waits for one real layout event on the highest view of the current player subtree that is
     * still attached. The decor frame alone is not evidence that the player child came back, so the
     * listener sits below it whenever a player subtree is still reachable.
     */
    private static void awaitValidLayout(View decorRoot) {
        removeRecoveryLayout();
        View target = playerSubtreeRoot(decorRoot);
        awaitingPlayerChild = target != null;
        if (target == null) return;
        recoveryLayoutRoot = new WeakReference<>(target);
        target.addOnLayoutChangeListener(RECOVERY_LAYOUT);
    }

    private static View playerSubtreeRoot(View decorRoot) {
        View player = playerRectView.get();
        if (player == null) player = observedPlayerView.get();
        View highest = null;
        for (View current = player;
                current != null && current != decorRoot;
                current = current.getParent() instanceof View ? (View) current.getParent() : null)
            highest = current;
        return highest == null ? decorRoot : highest;
    }

    // ---- The player view ----

    /**
     * Does this owner still have proven, current player geometry? The view comes from the cache and
     * a missing cache means the last real render already hid this surface; there is no per-frame
     * decor walk. It uses the visibility rule of the overlay, so a hidden container is never taken
     * for a settled surface.
     */
    private static boolean ownerSurfaceStable() {
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing() || activity.getWindow() == null)
            return false;
        View cached = playerRectView.get();
        if (cached == null || !cached.isAttachedToWindow() || !cached.isShown()) {
            readPlayerRect(activity);
            cached = playerRectView.get();
        }
        return CaptionSurface.visible(cached);
    }

    /** The visible rectangle of [view], or null if it is hidden or not larger than one pixel. */
    private static Rect visibleRect(View view) {
        Rect rect = new Rect();
        return CaptionSurface.visible(view)
                        && view.getGlobalVisibleRect(rect)
                        && rect.width() > 1
                        && rect.height() > 1
                ? rect
                : null;
    }

    /**
     * A last-resort permission check for a latched miniplayer name. It is used only when the player
     * type that is being contradicted is {@code WATCH_WHILE_MINIMIZED}, and only when a visible
     * player surface is actually regular-sized. A genuine miniplayer stays compact; a Shorts
     * surface is excluded because its own authority already owns that decision.
     */
    static boolean recoverFromProvenGeometry() {
        int state = CaptionPlayerAuthority.state();
        if (state != CaptionPlayerAuthority.COMPACT
                && state != CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR) return false;
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing() || activity.getWindow() == null) return false;
        if (CaptionSurface.isShorts()) return false;
        Rect rect = readPlayerRect(activity);
        DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
        if (!looksLikeRegularPlayer(rect, metrics.widthPixels, metrics.heightPixels)) return false;
        return CaptionPlayerAuthority.settleRegularFromGeometry();
    }

    /**
     * The miniplayer is a wide but very short strip in portrait (about 8% of the screen height) and
     * a small floating window in landscape (about 28%). A regular detail/fullscreen player is at
     * least a quarter of the portrait height or two fifths of the landscape height.
     */
    static boolean looksLikeRegularPlayer(Rect rect, int screenWidth, int screenHeight) {
        if (rect == null || screenWidth <= 0 || screenHeight <= 0) return false;
        int width = rect.width(), height = rect.height();
        if (width <= 1 || height <= 1) return false;
        boolean portrait = screenWidth <= screenHeight;
        float minimumHeight = screenHeight * (portrait ? 0.15f : 0.40f);
        return height >= minimumHeight && width >= screenWidth * 0.35f;
    }

    /** The rectangle of the player: the cached view, else the observed one, else the largest id. */
    private static Rect readPlayerRect(Activity activity) {
        View root = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
        if (root == null) return null;
        View cached = playerRectView.get();
        Rect rect = visibleRect(cached);
        if (rect != null) return rect;
        View previous = observedPlayerView.get();
        rect = visibleRect(previous);
        if (rect != null) {
            playerRectView = new WeakReference<>(previous);
            return rect;
        }
        View bestView = null;
        Rect best = null;
        for (String name : CaptionSurface.PLAYER_IDS) {
            int id;
            try {
                id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
            } catch (Throwable ignored) {
                continue;
            }
            View candidate = id == 0 ? null : root.findViewById(id);
            rect = visibleRect(candidate);
            if (rect != null && (best == null || area(rect) > area(best))) {
                best = rect;
                bestView = candidate;
            }
        }
        if (bestView != null) {
            playerRectView = new WeakReference<>(bestView);
            observedPlayerView = new WeakReference<>(bestView);
        }
        return best;
    }

    private static long area(Rect rect) {
        return (long) rect.width() * rect.height();
    }

    private static boolean nearlySame(Rect a, Rect b) {
        return Math.abs(a.left - b.left) <= PIXEL_TOLERANCE
                && Math.abs(a.top - b.top) <= PIXEL_TOLERANCE
                && Math.abs(a.right - b.right) <= PIXEL_TOLERANCE
                && Math.abs(a.bottom - b.bottom) <= PIXEL_TOLERANCE;
    }

    // ---- The geometry probe ----

    private static void startProbe() {
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing() || activity.getWindow() == null) {
            // A missing owner is not permission to display at an unverified location.
            observedPlayerView.clear();
            CaptionMusicSuppressor.endNativeRendererTransition();
            return;
        }
        Probe probe = new Probe(++generation);
        pendingProbe = probe;
        Choreographer.getInstance().postFrameCallback(probe);
    }

    private static void finish(Probe probe) {
        pendingProbe = null;
        settle();
        Activity activity = activityRef.get();
        if (activity != null && CaptionActions.isVisibleActive())
            markStable(
                    activity,
                    ";observed_frames="
                            + probe.frames
                            + ";observed_frame_ns="
                            + Math.max(0, probe.lastFrameNanos - probe.firstFrameNanos));
    }

    /** Watches the player rectangle frame by frame until it stops moving or the ceiling is hit. */
    private static final class Probe implements Choreographer.FrameCallback {
        final long token;
        int frames, stableFrames;
        boolean sawMotion;
        long firstFrameNanos, lastFrameNanos;
        Rect previous;

        Probe(long token) {
            this.token = token;
        }

        @Override
        public void doFrame(long frameTimeNanos) {
            lastFrameNanos = frameTimeNanos;
            if (firstFrameNanos == 0) firstFrameNanos = frameTimeNanos;
            if (token != generation || pendingProbe != this) return;
            Activity activity = activityRef.get();
            if (activity == null || activity.isFinishing() || activity.getWindow() == null) {
                // The owner disappeared mid-observation: release this slot, keep the quarantine.
                release();
                awaitingPlayerChild = true;
                CaptionMusicSuppressor.endNativeRendererTransition();
                return;
            }
            long started = System.nanoTime();
            Rect current = readPlayerRect(activity);
            probeNanos += System.nanoTime() - started;
            frames++;
            if (current != null && previous != null) {
                if (nearlySame(previous, current)) stableFrames++;
                else {
                    sawMotion = true;
                    stableFrames = 0;
                }
            } else stableFrames = 0;
            previous = current == null ? null : new Rect(current);

            if (frames >= MIN_OBSERVATION_FRAMES
                    && stableFrames >= STABLE_FRAMES_REQUIRED
                    && (sawMotion || frames >= NO_MOTION_FALLBACK_FRAMES)) {
                finish(this);
            } else if (frames >= MAX_OBSERVATION_FRAMES) {
                // End the observation and keep the safe blank surface until a real player-subtree
                // layout or a new authoritative notification arrives: no forced restore at the
                // ceiling and no permanent polling.
                release();
                awaitValidLayout(CaptionPlayerAuthority.decorView());
                CaptionMusicSuppressor.endNativeRendererTransition();
                CaptionButtonController.onPlayerStable();
                CaptionDiagnostics.mark(
                        activity,
                        "PLAYER_TRANSITION_SAFE_BLANK",
                        "reason=geometry_not_stable;observed_frames="
                                + frames
                                + ";state="
                                + CaptionPlayerAuthority.stateName()
                                + ";"
                                + CaptionPlayerAuthority.shortId());
            } else Choreographer.getInstance().postFrameCallback(this);
        }

        private void release() {
            if (pendingProbe == this) pendingProbe = null;
        }
    }

    /** Test-only reset so each fixture starts from a clean probe slot. */
    static void resetForTests() {
        removeRecoveryLayout();
        activityRef = new WeakReference<>(null);
        ownerEpoch = -1;
        generation = 0;
        probeNanos = 0;
        forget();
        if (listenerInstalled) {
            CaptionPlayerAuthority.removeListener(AUTHORITY_LISTENER);
            listenerInstalled = false;
        }
    }
}
