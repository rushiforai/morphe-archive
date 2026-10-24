package app.yydarlinker.deepseekcaptions;

import android.content.Context;

/**
 * Applies the session intent to the native caption session, idempotently.
 *
 * <p>One session is one video at one player-owner epoch. The applied key is
 * {@code video|epoch|revision}: the same key is applied at most once, so repeated observations,
 * player ticks and re-entrant callbacks cannot restart the engine. A teardown retires the key with
 * the session, so entering the same video again applies the same intent again - that re-entry is
 * the recovery the user sees, and it needs neither a remembered url nor a "was the video left"
 * heuristic. A player tick is enough for that recovery: YouTube may re-enter the video without
 * announcing its id again.
 *
 * <p>The intent is the only thing that decides whether captions are wanted and for which language.
 * Native observations reach this class through {@code NativeCaptionBridge.observe}; they can ask for
 * an application, but only a user act writes the intent. A transient native Off therefore retires
 * the current application (so it can come back) without ever becoming "the user turned AI off".
 */
final class CaptionSessionReconciler {
    private static final Object LOCK = new Object();

    /** One video at one player epoch; the unit the applied key is scoped to. */
    private static final class Session {
        final String video;
        final long epoch;

        /** The url this session last reached its target with, keyed by video|target|translate. */
        String materialKey = "";
        String materialUrl = "";
        boolean materialTranslate, materialOwn;

        Session(String video, long epoch) {
            this.video = video;
            this.epoch = epoch;
        }
    }

    /** How one target is reached: the concrete url and whether it is the video's own track. */
    private static final class Resolution {
        final String url;
        final boolean translate, own;

        Resolution(String url, boolean translate, boolean own) {
            this.url = url;
            this.translate = translate;
            this.own = own;
        }
    }

    private static Session session;
    private static String appliedKey = "";
    private static Context context;
    private static int applications;

    private CaptionSessionReconciler() {}

    // ---- Events ----

    /**
     * A video is on screen: start the session and apply the intent at once (the engine does not
     * wait for a native track callback; that callback can only refine how the target is reached).
     */
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
                session = new Session(video, epoch);
                appliedKey = "";
            }
        }
        mark("INTENT_SESSION", "video=" + video + ";epoch=" + epoch + ";fresh=" + fresh);
        // materialize() reads the signed source track from SourceCatalog and activate() submits the
        // source load, so this call starts the fetch without waiting for a track list or a CC
        // observation. If the catalogue is not ready yet, the next observation applies it.
        apply("video");
    }

    /** The caption session is gone (video cleared or player destroyed). The intent is untouched. */
    static void onTeardown(Context c) {
        if (c != null) context = c.getApplicationContext();
        synchronized (LOCK) {
            session = null;
            appliedKey = "";
        }
        CaptionActions.deactivateForTeardown();
        mark("INTENT_TEARDOWN", "intent=" + intentSummary());
    }

    /**
     * The AI switch was used. This is the one writer of the switch bit and the target the native
     * caption menu never named; an absent target adopts the native selection the user already made.
     */
    static boolean onUserSwitched(Context c, boolean enabled) {
        if (c == null) return false;
        CaptionSessionIntent intent;
        if (enabled) {
            CaptionSessionIntent previous = CaptionSessionIntent.load(c);
            CaptionNativeProjection.Snapshot projection = CaptionNativeProjection.snapshot();
            if (previous.hasTarget() || !projection.hasTarget()) {
                intent = CaptionSessionIntent.userToggled(c, true);
            } else {
                // translateTarget means "prefer an existing track in the target language", not
                // "never translate". The flag belongs to the video whose native track reported it,
                // so only that video may donate it; another video (or no live session) only
                // donates the language and keeps the translating default.
                String video = sessionVideo();
                boolean sameVideo = !video.isEmpty() && video.equals(projection.video);
                intent =
                        CaptionSessionIntent.userEnabledFor(
                                c,
                                projection.language,
                                sameVideo ? projection.translated : true);
            }
        } else {
            intent = CaptionSessionIntent.userToggled(c, false);
        }
        DeepSeekConfig.saveEnabled(c, enabled);
        synchronized (LOCK) {
            appliedKey = "";
        }
        mark("INTENT_USER_SWITCH", intent.summary() + ";reason=ai_switch");
        if (enabled) apply("switch");
        return true;
    }

    /**
     * The user turned the official CC control back on. It re-enables the session the same control
     * turned off; an AI feature switch that is off keeps YouTube's own captions in charge.
     */
    static void onUserActivated(Context c) {
        if (c == null) return;
        context = c.getApplicationContext();
        if (!DeepSeekConfig.enabled(c)) return;
        CaptionSessionIntent intent = CaptionSessionIntent.load(c);
        if (!intent.aiEnabled) {
            CaptionNativeProjection.Snapshot projection = CaptionNativeProjection.snapshot();
            if (projection.hasTarget())
                CaptionSessionIntent.userEnabledFor(
                        c, projection.language, projection.translated);
            else CaptionSessionIntent.userToggled(c, true);
        }
        synchronized (LOCK) {
            appliedKey = "";
        }
        mark("INTENT_USER_SWITCH", "reason=cc_on;" + intentSummary());
        apply("cc_on");
    }

    /**
     * The user turned captions off: the one writer of the off bit. The command layer calls this, so
     * the display stop and the intent write happen exactly once, in that order.
     *
     * <p>The AI feature switch is not touched: it says whether AI captions are installed at all,
     * while this record says whether they are wanted right now. Keeping them apart is what lets the
     * same CC control turn the session back on without also re-enabling the feature.
     */
    static void onUserOff(Context c, String reason) {
        if (c == null) return;
        context = c.getApplicationContext();
        CaptionSessionIntent intent = CaptionSessionIntent.userToggled(c, false);
        synchronized (LOCK) {
            appliedKey = session == null ? "" : key(session, intent);
        }
        mark("INTENT_USER_OFF", "reason=" + reason + ";" + intent.summary());
    }

    /**
     * The native caption model reported its selection. [explicit] means YouTube's own caption menu
     * produced it, which is a user act; everything else is an observation.
     */
    static void onNativeSelection(Context c, long epoch, boolean explicit) {
        if (c != null) context = c.getApplicationContext();
        if (!accepts(epoch)) {
            mark("INTENT_OBSERVATION_STALE", "event=selection;epoch=" + epoch);
            return;
        }
        CaptionNativeProjection.Snapshot projection = CaptionNativeProjection.snapshot();
        if (!explicit) {
            // The native model selecting Off is a reset of the native session, not a user command:
            // the intent stays, the application is retired so the session can come back.
            if (projection.off) nativeReset();
            else apply("selection");
            return;
        }
        if (projection.off) {
            // The Off row of YouTube's own caption menu: a user act, so it writes the intent (the
            // command layer does that) and ends the display.
            CaptionActions.deactivateByUser();
            return;
        }
        if (!projection.hasTarget()) return;
        CaptionSessionIntent.userSelected(c, projection.language, projection.translated);
        synchronized (LOCK) {
            appliedKey = "";
        }
        mark("INTENT_USER_SELECTED", projection.summary());
        apply("cc_menu");
    }

    /** Any accepted native observation; a deferred application gets another chance here. */
    static void onObservation(Context c, String event, long epoch) {
        if (c != null) context = c.getApplicationContext();
        if (!accepts(epoch)) {
            mark("INTENT_OBSERVATION_STALE", "event=" + event + ";epoch=" + epoch);
            return;
        }
        apply("observation_" + event);
    }

    /**
     * A player tick. It is a reconciliation pass, not a command: it rebuilds a session retired by a
     * teardown (the same video may not be announced again), re-binds that session to the current
     * player-owner epoch, and applies the intent only when it is not realised for this session (a
     * deferred target, or a native reset that retired it).
     *
     * <p>A tick re-binds the session to the current player-owner epoch. Stopping and restarting
     * the engine closes and re-opens the authority, so the session must follow that epoch; the
     * video is still the one on screen, and a stale epoch would otherwise silence every later
     * observation.
     */
    static void onPlayerRegular(Context c) {
        if (c == null) return;
        context = c.getApplicationContext();
        String resumedVideo = null;
        long resumedEpoch = -1;
        synchronized (LOCK) {
            long current = CaptionPlayerAuthority.ownerEpoch();
            if (session == null) {
                // A teardown retires the session, but re-entering the same video does not
                // necessarily re-announce its id: YouTube may keep the same player and only start
                // ticking again. The tick is the recovery point, so it rebuilds the session from
                // the video the player is showing now. A tick with no video id changes nothing.
                String video = CaptionActions.currentVideoIdSnapshot();
                if (video != null && !video.trim().isEmpty()) {
                    session = new Session(video.trim(), current);
                    appliedKey = "";
                    resumedVideo = session.video;
                    resumedEpoch = current;
                }
            } else if (session.epoch != current) {
                session = new Session(session.video, current);
                appliedKey = "";
            }
        }
        if (resumedVideo != null)
            mark(
                    "INTENT_SESSION",
                    "video="
                            + resumedVideo
                            + ";epoch="
                            + resumedEpoch
                            + ";fresh=true;reason=resume_tick");
        // The applied key records an application that was requested, not one whose engine is
        // still running. When the same session's key is still applied but nothing is on screen
        // and no active session owns the native track, the intent has not converged: clear the
        // key and apply once. ownsNativeTrack() is part of the test on purpose: a session that is
        // still starting owns the native track, and clearing the key for it would restart the
        // fetch on every tick.
        if (needsResume(c)) {
            synchronized (LOCK) {
                appliedKey = "";
            }
            apply("resume_tick");
            return;
        }
        if (!needsApply(c)) return;
        apply("player_tick");
    }

    /** True while [epoch] still names the live session; older events must change nothing. */
    static boolean accepts(long epoch) {
        synchronized (LOCK) {
            return session != null && session.epoch == epoch;
        }
    }

    /**
     * The current application is over, but the session is not: the next tick or observation may
     * apply the same intent again. Used by a native reset, which never writes the intent.
     */
    static void retireApplication() {
        synchronized (LOCK) {
            appliedKey = "";
        }
    }

    /**
     * True while an observation of [epoch] may be recorded at all: it belongs to the live session,
     * or no session is running yet (a player can report its tracks before the first video id).
     */
    static boolean observable(long epoch) {
        synchronized (LOCK) {
            return session == null || session.epoch == epoch;
        }
    }

    /**
     * Keeps an ordinary source-language request on the session target across a lifecycle or player
     * transition. Read-only for the intent.
     */
    static String restoreTarget(Context c, String url) {
        CaptionSessionIntent intent = CaptionSessionIntent.load(c);
        if (!intent.translates()
                || !CaptionActions.isVisibleActive()
                || !DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)
                || TargetLanguage.fromUrl(url) != null) return url;
        String requested = CaptionUrls.videoId(url);
        String foreground = CaptionActions.currentVideoIdSnapshot();
        if (!requested.isEmpty()
                && !foreground.isEmpty()
                && !requested.equals(foreground)) return url;
        return TargetLanguage.withCode(url, intent.targetLanguage);
    }

    // ---- Applying ----

    private static void apply(String reason) {
        Context c = context;
        Session s;
        CaptionSessionIntent intent;
        synchronized (LOCK) {
            s = session;
            if (s == null) return;
            intent = CaptionSessionIntent.load(c);
            String key = key(s, intent);
            if (!intent.aiEnabled || !intent.hasTarget()) {
                // Nothing to realise. Recording the key keeps the tick path from asking again.
                appliedKey = key;
                return;
            }
            if (key.equals(appliedKey)) return;
        }
        Resolution resolution = materialize(c, s.video, intent);
        if (resolution == null) {
            mark(
                    "INTENT_APPLY",
                    "applied=false;reason=deferred;cause="
                            + reason
                            + ";video="
                            + s.video
                            + ";epoch="
                            + s.epoch
                            + ";"
                            + intent.summary()
                            + ";projection="
                            + CaptionNativeProjection.snapshot().summary());
            return;
        }
        String key;
        synchronized (LOCK) {
            if (session != s) return;
            key = key(s, CaptionSessionIntent.load(c));
            if (key.equals(appliedKey)) return;
            // Claimed before acting: a re-entrant observation cannot apply this key twice.
            appliedKey = key;
            applications++;
        }
        if (intent.aiEnabled && !DeepSeekConfig.enabled(c))
            DeepSeekConfig.saveEnabled(c, true);
        CaptionButtonController.noteAiTrackSelected();
        if (resolution.own || !resolution.translate) CaptionActions.activateSource(c, resolution.url);
        else CaptionActions.activate(c, resolution.url);
        CaptionMusicSuppressor.forceNativeRendererScan();
        CaptionMusicSuppressor.kick();
        mark(
                "INTENT_APPLY",
                "applied=true;reason="
                        + reason
                        + ";video="
                        + s.video
                        + ";epoch="
                        + s.epoch
                        + ";"
                        + intent.summary()
                        + ";mode="
                        + (resolution.own || !resolution.translate ? "source" : "translation"));
    }

    /** A native reset retires the application; it never writes the intent. */
    private static void nativeReset() {
        retireApplication();
        CaptionActions.deactivateAfterNativeReset();
        mark(
                "INTENT_APPLY",
                "applied=false;reason=native_reset;intent="
                        + intentSummary()
                        + ";projection="
                        + CaptionNativeProjection.snapshot().summary());
    }

    private static boolean needsApply(Context c) {
        synchronized (LOCK) {
            if (session == null) return false;
        }
        CaptionSessionIntent intent = CaptionSessionIntent.load(c);
        if (!intent.aiEnabled || !intent.hasTarget()) return false;
        synchronized (LOCK) {
            return session != null && !key(session, intent).equals(appliedKey);
        }
    }

    /**
     * True when the intent is wanted and cannot be seen in the engine: the applied key may still
     * match because it only says the application was requested. A session that is visible or that
     * owns the native track is running (or starting), so it is not resumed again.
     */
    private static boolean needsResume(Context c) {
        synchronized (LOCK) {
            if (session == null) return false;
        }
        CaptionSessionIntent intent = CaptionSessionIntent.load(c);
        return intent.aiEnabled
                && intent.hasTarget()
                && !CaptionActions.isVisibleActive()
                && !CaptionActions.ownsNativeTrack();
    }

    /** The concrete url and mode for [intent] on [video], or null while it is not knowable yet. */
    private static Resolution materialize(Context c, String video, CaptionSessionIntent intent) {
        String target = intent.targetLanguage;
        if (video.isEmpty() || target.isEmpty()) return null;
        String materialKey = video + "|" + target + "|" + intent.translateTarget;
        synchronized (LOCK) {
            if (session != null
                    && materialKey.equals(session.materialKey)
                    && !session.materialUrl.isEmpty())
                return new Resolution(
                        session.materialUrl, session.materialTranslate, session.materialOwn);
        }
        Resolution resolved = resolve(c, video, target, intent.translateTarget);
        if (resolved == null) return null;
        synchronized (LOCK) {
            if (session != null && session.video.equals(video)) {
                session.materialKey = materialKey;
                session.materialUrl = resolved.url;
                session.materialTranslate = resolved.translate;
                session.materialOwn = resolved.own;
            }
        }
        return resolved;
    }

    private static Resolution resolve(Context c, String video, String target, boolean translate) {
        CaptionNativeProjection.Snapshot projection = CaptionNativeProjection.snapshot();
        if (projection.hasTarget()
                && video.equals(projection.video)
                && projection.translated == translate
                && sameTarget(projection.language, target)
                && DeepSeekCaptionHook.isYouTubeTimedTextUrl(projection.url))
            return realize(c, projection.url, translate);
        SourceCatalog.Snapshot catalog = SourceCatalog.snapshot(video);
        if (!catalog.complete || catalog.tracks.isEmpty()) return null;
        if (!translate) {
            // translateTarget means "prefer an existing track in the target language", not "never
            // translate". A video without such a track still gets a translated session instead of
            // staying deferred forever.
            for (SourceSelection track : catalog.tracks)
                if (SourceSelection.sameWritingLanguage(track.language, target))
                    return new Resolution(track.url, false, true);
        }
        return realize(c, TargetLanguage.withCode(catalog.tracks.get(0).url, target), true);
    }

    /** Prefers the video's own track in the target language; translating it would be pointless. */
    private static Resolution realize(Context c, String url, boolean translate) {
        if (!translate) return new Resolution(url, false, true);
        SourceSelection own = SourceTrackPolicy.ownTargetTrack(c, url);
        if (own != null) return new Resolution(own.url, false, true);
        String selected = SourceTrackPolicy.apply(c, url);
        return DeepSeekCaptionHook.isYouTubeTimedTextUrl(selected)
                ? new Resolution(selected, true, false)
                : null;
    }

    /** The identity of one application: a new video, epoch or user act applies again. */
    private static String key(Session s, CaptionSessionIntent intent) {
        return s.video + "|" + s.epoch + "|" + intent.revision;
    }

    private static boolean sameTarget(String a, String b) {
        TargetLanguage left = TargetLanguage.fromCode(a);
        TargetLanguage right = TargetLanguage.fromCode(b);
        return left != null && right != null && left.code.equalsIgnoreCase(right.code);
    }

    private static String intentSummary() {
        return CaptionSessionIntent.load(context).summary();
    }

    private static void mark(String stage, String detail) {
        CaptionDiagnostics.mark(context, stage, detail);
    }

    // ---- Diagnostics and tests ----

    static String appliedKey() {
        synchronized (LOCK) {
            return appliedKey;
        }
    }

    static int applications() {
        synchronized (LOCK) {
            return applications;
        }
    }

    static String sessionVideo() {
        synchronized (LOCK) {
            return session == null ? "" : session.video;
        }
    }

    static long sessionEpoch() {
        synchronized (LOCK) {
            return session == null ? -1L : session.epoch;
        }
    }

    static void resetForTests() {
        synchronized (LOCK) {
            session = null;
            appliedKey = "";
            applications = 0;
            context = null;
        }
    }
}
