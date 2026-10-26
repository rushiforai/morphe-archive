package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

/** Applies the current native selection in AI mode, subject to the official CC display gate. */
final class CaptionSessionReconciler {
    private static final Object LOCK = new Object();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static ReadyTask playerReadyTask;
    private static long playerReadyGeneration;

    private static final class Session {
        final String video;
        final long epoch;

        Session(String video, long epoch) {
            this.video = video;
            this.epoch = epoch;
        }
    }

    private static Session session;
    private static Context context;
    private static String appliedKey = "";
    private static long appliedSelection = -1L;
    private static int applications;

    private CaptionSessionReconciler() {}

    static void onVideo(Context c, String videoId) {
        if (c != null) context = c.getApplicationContext();
        String video = videoId == null ? "" : videoId.trim();
        if (video.isEmpty()) {
            onTeardown(context);
            return;
        }
        long epoch = CaptionPlayerAuthority.ownerEpoch();
        boolean fresh;
        synchronized (LOCK) {
            fresh = session == null || !session.video.equals(video) || session.epoch != epoch;
            if (fresh) {
                cancelPlayerReadyLocked();
                session = new Session(video, epoch);
                appliedKey = "";
            }
        }
        mark("INTENT_SESSION", "video=" + video + ";epoch=" + epoch + ";fresh=" + fresh);
        onPlayerReady(context, "video");
        apply("video");
    }

    static void onTeardown(Context c) {
        if (c != null) context = c.getApplicationContext();
        synchronized (LOCK) {
            cancelPlayerReadyLocked();
            session = null;
            appliedKey = "";
            appliedSelection = -1L;
        }
        CaptionActions.deactivateForTeardown();
        mark("INTENT_TEARDOWN", "intent=" + intentSummary());
    }

    static void onShortsClosed(Context c) {
        if (c != null) context = c.getApplicationContext();
        synchronized (LOCK) { cancelPlayerReadyLocked(); }
        NativeCaptionBridge.onShortsClosed();
        CaptionNativeProjection.ccState(CaptionIntentPolicy.UNKNOWN);
        retireApplication();
        CaptionActions.deactivateAfterNativeReset();
    }

    static boolean onUserSwitched(Context c, boolean enabled) {
        if (c == null) return false;
        context = c.getApplicationContext();
        CaptionSessionIntent intent = CaptionSessionIntent.userToggled(c, enabled);
        DeepSeekConfig.saveEnabled(c, enabled);
        retireApplication();
        mark("INTENT_USER_SWITCH", intent.summary() + ";reason=ai_switch");
        if (enabled) apply("switch");
        else CaptionActions.deactivateAfterNativeReset();
        return true;
    }

    static void onUserActivated(Context c) {
        if (c == null) return;
        context = c.getApplicationContext();
        CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);
        if (!DeepSeekConfig.enabled(c)) return;
        // Upgrade 1.5.7's split mode record without adopting any saved language.
        if (!CaptionSessionIntent.load(c).aiEnabled) CaptionSessionIntent.userToggled(c, true);
        retireApplication();
        mark("CAPTION_CC_STATE", "reason=cc_on;state=1;" + intentSummary());
        apply("cc_on");
    }

    static void onUserOff(Context c, String reason) {
        if (c == null) return;
        context = c.getApplicationContext();
        CaptionNativeProjection.ccState(CaptionIntentPolicy.OFF);
        retireApplication();
        mark("CAPTION_CC_STATE", "reason=" + reason + ";state=0;" + intentSummary());
    }

    static void onCcState(Context c, int state, String reason) {
        if (c != null) context = c.getApplicationContext();
        int previous = CaptionNativeProjection.ccState();
        CaptionNativeProjection.ccState(state);
        if (previous == state) return;
        retireApplication();
        mark("CAPTION_CC_STATE", "reason=" + reason + ";state=" + state + ";" + intentSummary());
        if (state == CaptionIntentPolicy.ON) onUserActivated(context);
        else CaptionActions.deactivateAfterNativeReset();
    }

    static boolean displayAllowed(Context c) {
        return c != null && DeepSeekConfig.enabled(c)
                && !CaptionPlayerAuthority.shortsExitBlocked()
                && CaptionNativeProjection.ccState() == CaptionIntentPolicy.ON;
    }

    /** A catalogue, a prefetch URL and a previous video's language are never selection evidence. */
    static CaptionNativeProjection.Snapshot currentSelection() {
        CaptionNativeProjection.Snapshot selected = CaptionNativeProjection.snapshot();
        String video = CaptionActions.currentVideoIdSnapshot();
        return selected.hasTarget() && !video.isEmpty() && video.equals(selected.video)
                ? selected : null;
    }

    /** Both Morphe's automatic/default selection and a manual menu selection are authoritative. */
    static void onNativeSelection(Context c, long epoch, boolean explicit) {
        if (c != null) context = c.getApplicationContext();
        if (!accepts(epoch)) {
            mark("INTENT_OBSERVATION_STALE", "event=selection;epoch=" + epoch);
            return;
        }
        CaptionNativeProjection.Snapshot selected = CaptionNativeProjection.snapshot();
        if (!sessionVideo().equals(selected.video)) return;
        reconcileShortsCc(selected);
        if (selected.off) {
            if (explicit) CaptionActions.deactivateByUser();
            else {
                retireApplication();
                CaptionActions.deactivateAfterNativeReset();
            }
            return;
        }
        if (explicit) CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);
        mark("CAPTION_NATIVE_SELECTION", "authority=player;" + selected.summary());
        if (explicit) onUserActivated(context);
        else apply("native_selection");
    }

    static void onObservation(Context c, String event, long epoch) {
        if (c != null) context = c.getApplicationContext();
        if (!accepts(epoch)) {
            mark("INTENT_OBSERVATION_STALE", "event=" + event + ";epoch=" + epoch);
            return;
        }
        onPlayerReady(context, "observation_" + event);
        apply("observation_" + event);
    }

    /** One event-driven retry after open/verified geometry; no periodic polling or inline fetch. */
    static void onPlayerReady(Context c, String reason) {
        if (c == null || !CaptionPlayerAuthority.shortsRecoveryCandidate()) return;
        String video = CaptionActions.currentVideoIdSnapshot();
        if (video == null || video.isEmpty()) return;
        synchronized (LOCK) {
            long epoch = CaptionPlayerAuthority.ownerEpoch();
            if (playerReadyTask != null) {
                if (playerReadyTask.epoch == epoch && playerReadyTask.video.equals(video)) {
                    playerReadyTask.forceProbe |= isSurfaceReadyReason(reason);
                    return;
                }
                cancelPlayerReadyLocked();
            }
            playerReadyTask = new ReadyTask(c.getApplicationContext(), video, epoch,
                    playerReadyGeneration, reason);
            MAIN.post(playerReadyTask);
        }
    }

    private static boolean isSurfaceReadyReason(String reason) {
        return "geometry_ready".equals(reason) || "player_regular".equals(reason)
                || "shorts_open".equals(reason);
    }

    private static void cancelPlayerReadyLocked() {
        playerReadyGeneration++;
        if (playerReadyTask != null) MAIN.removeCallbacks(playerReadyTask);
        playerReadyTask = null;
    }

    private static final class ReadyTask implements Runnable {
        final Context owner;
        final String video, reason;
        final long epoch, generation;
        volatile boolean forceProbe;
        ReadyTask(Context owner, String video, long epoch, long generation, String reason) {
            this.owner=owner;this.video=video;this.epoch=epoch;this.generation=generation;this.reason=reason;
            this.forceProbe=isSurfaceReadyReason(reason);
        }
        public void run() {
            try {
                synchronized (LOCK) {
                    if (playerReadyTask != this || generation != playerReadyGeneration
                            || epoch != CaptionPlayerAuthority.ownerEpoch()
                            || !video.equals(CaptionActions.currentVideoIdSnapshot())) return;
                }
                if (!CaptionPlayerAuthority.ownerValid()
                        || CaptionPlayerAuthority.state() != CaptionPlayerAuthority.REGULAR
                        || !CaptionPlayerAuthority.shortsRecoveryCandidate()) return;
                if (forceProbe && !CaptionSurface.isShorts()) CaptionSurface.allowShortsReadyProbe();
                int before = CaptionNativeProjection.ccState();
                onPlayerRegular(owner);
                mark("SHORTS_READY_RECONCILE", "video="+video+";epoch="+epoch+";reason="+reason
                        +";cc_before="+before+";cc_after="+CaptionNativeProjection.ccState()
                        +";track_observed="+(currentSelection()!=null)
                        +";active="+CaptionActions.isVisibleActive());
            } finally {
                synchronized (LOCK) { if (playerReadyTask == this) playerReadyTask = null; }
            }
        }
    }

    static void onPlayerRegular(Context c) {
        if (c == null) return;
        context = c.getApplicationContext();
        CaptionPlayerAuthority.recoverShorts();
        synchronized (LOCK) {
            long epoch = CaptionPlayerAuthority.ownerEpoch();
            if (session == null) {
                String video = CaptionActions.currentVideoIdSnapshot();
                if (video == null || video.trim().isEmpty()) return;
                session = new Session(video.trim(), epoch);
                appliedKey = "";
            } else bindCurrentEpoch(epoch);
        }
        // Shorts has no regular TouchImageView controller callback. Its final native dispatcher
        // can arrive before either the foreground video or the visible Shorts surface.
        reconcileShortsCc(CaptionNativeProjection.snapshot());
        if (currentSelection() == null || !displayAllowed(c)) return;
        if (!CaptionActions.isVisibleActive() && !CaptionActions.ownsNativeTrack()) retireApplication();
        apply("player_tick");
    }

    private static void reconcileShortsCc(CaptionNativeProjection.Snapshot selected) {
        CaptionPlayerAuthority.recoverShorts();
        if (!selected.committed || !selected.observed
                || !CaptionPlayerAuthority.displayPermitted() || !CaptionSurface.isShorts()
                || !selected.video.equals(CaptionActions.currentVideoIdSnapshot())) return;
        // A default selection initializes an unknown CC state only. An explicit CC off remains
        // the authority even if a delayed default/forced track is delivered afterwards.
        // Automatic null/reset is fail-closed evidence, not a durable user-Off command. A later
        // committed default may finish initialization. Explicit Off is recorded by the user path.
        if (selected.off && !selected.explicit && selected.ccState != CaptionIntentPolicy.OFF)
            CaptionNativeProjection.ccState(CaptionIntentPolicy.UNKNOWN);
        else if (!selected.off && selected.hasTarget() && selected.ccState == CaptionIntentPolicy.UNKNOWN)
            onCcState(context, CaptionIntentPolicy.ON, "shorts_native_commit");
    }

    static boolean accepts(long epoch) {
        synchronized (LOCK) {
            bindCurrentEpoch(epoch);
            return session != null && session.epoch == epoch;
        }
    }

    static boolean observable(long epoch) {
        synchronized (LOCK) {
            bindCurrentEpoch(epoch);
            return session == null || session.epoch == epoch;
        }
    }

    private static void bindCurrentEpoch(long epoch) {
        if (session != null && session.epoch != epoch
                && epoch == CaptionPlayerAuthority.ownerEpoch()) {
            session = new Session(session.video, epoch);
            appliedKey = "";
        }
    }

    static void retireApplication() {
        synchronized (LOCK) { appliedKey = ""; }
    }

    private static void apply(String reason) {
        Context c = context;
        if (!displayAllowed(c)) return;
        CaptionSessionIntent intent = CaptionSessionIntent.load(c);
        CaptionNativeProjection.Snapshot selected = currentSelection();
        if (!intent.aiEnabled || selected == null) return;
        Session s;
        boolean replace;
        synchronized (LOCK) {
            s = session;
            if (s == null || !s.video.equals(selected.video)) return;
            if (key(s, intent, selected).equals(appliedKey)) return;
            replace = appliedSelection >= 0 && appliedSelection != selected.revision;
        }
        // Retire old-language requests and render guards before admitting the new selection.
        if (replace && (CaptionActions.isVisibleActive() || CaptionActions.ownsNativeTrack()))
            CaptionActions.deactivateAfterNativeReset();

        String url = selected.url;
        boolean source = !selected.translated;
        if (!source) {
            SourceSelection own = SourceTrackPolicy.ownTargetTrack(c, url);
            if (own != null) {
                url = own.url;
                source = true;
            } else url = SourceTrackPolicy.apply(c, url);
        }
        if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)) return;
        synchronized (LOCK) {
            if (session == null || !session.video.equals(selected.video) || !displayAllowed(c)
                    || CaptionNativeProjection.snapshot().revision != selected.revision
                    || CaptionSessionIntent.load(c).revision != intent.revision) return;
            bindCurrentEpoch(CaptionPlayerAuthority.ownerEpoch());
            s = session;
            String key = key(s, intent, selected);
            if (key.equals(appliedKey)) return;
            appliedKey = key;
            appliedSelection = selected.revision;
            applications++;
        }
        CaptionButtonController.noteAiTrackSelected();
        if (source) CaptionActions.activateSource(c, url);
        else CaptionActions.activate(c, url);
        CaptionMusicSuppressor.forceNativeRendererScan();
        CaptionMusicSuppressor.kick();
        mark("INTENT_APPLY", "applied=true;reason=" + reason + ";video=" + s.video
                + ";epoch=" + s.epoch + ";" + intent.summary() + ";target=" + selected.target()
                + ";translate=" + selected.translated + ";selection=" + selected.revision
                + ";authority=player;mode=" + (source ? "source" : "translation"));
    }

    private static String key(Session s, CaptionSessionIntent intent,
            CaptionNativeProjection.Snapshot selected) {
        return s.video + "|" + s.epoch + "|" + intent.revision + "|" + selected.revision;
    }

    private static String intentSummary() { return CaptionSessionIntent.load(context).summary(); }
    private static void mark(String stage, String detail) { CaptionDiagnostics.mark(context, stage, detail); }
    static String appliedKey() { synchronized (LOCK) { return appliedKey; } }
    static int applications() { synchronized (LOCK) { return applications; } }
    static String sessionVideo() { synchronized (LOCK) { return session == null ? "" : session.video; } }
    static long sessionEpoch() { synchronized (LOCK) { return session == null ? -1L : session.epoch; } }

    static void resetForTests() {
        synchronized (LOCK) {
            cancelPlayerReadyLocked();
            session = null;
            appliedKey = "";
            appliedSelection = -1L;
            applications = 0;
            context = null;
        }
    }
}
