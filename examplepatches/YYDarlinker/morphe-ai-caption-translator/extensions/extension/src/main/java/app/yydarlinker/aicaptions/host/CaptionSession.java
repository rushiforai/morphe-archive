package app.yydarlinker.aicaptions.host;

import app.yydarlinker.aicaptions.overlay.CaptionOverlay;

import app.yydarlinker.aicaptions.CaptionUrls;
import app.yydarlinker.aicaptions.SourceSelection;
import app.yydarlinker.aicaptions.TargetLanguage;
import app.yydarlinker.aicaptions.diagnostics.CaptionDiagnostics;
import app.yydarlinker.aicaptions.settings.AiCaptionConfig;
import app.yydarlinker.aicaptions.settings.CaptionQuickToggle;
import app.yydarlinker.aicaptions.settings.CaptionStorage;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;

/** Coordinates the current visit, native selection and persistent AI switch. */
public final class CaptionSession {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile Context context;
    private static volatile String video = "";
    private static long appliedEpoch = -1, appliedRevision = -1;
    private static Ready ready;

    private CaptionSession() {}

    static String video() { return video; }

    static void bind(Activity activity) {
        context = activity.getApplicationContext();
        if (CaptionPlayer.activity() != activity) {
            cancelReady();
            if (!video.isEmpty() && AiCaptionHook.enabled()) CaptionActions.deactivateForTeardown();
            video = "";
            NativeCaptionBridge.clearVisit();
            CaptionButton.resetVisit();
            CaptionPlayer.setOwner(activity);
        }
        CaptionRuntimePorts.install(activity);
        if (CaptionQuickToggle.shortsOpen()) CaptionPlayer.onShortsStateChanged(true);
        if (AiCaptionHook.enabled()) CaptionButton.findCurrent();
    }

    static void onVideo(String id) {
        String next = id == null ? "" : id.trim();
        boolean changed = !next.equals(video);
        if (changed) {
            cancelReady();
            video = next;
            retire();
            CaptionPlayer.setVideo(next);
            if (AiCaptionHook.enabled()) CaptionButton.resetVisit();
        }
        NativeCaptionBridge.onVideo(next);
        if (!AiCaptionHook.enabled()) return;
        CaptionActions.onVideoId(next);
        if (changed && !next.isEmpty()) CaptionButton.findCurrent();
        if (!changed) CaptionPlayer.reconcileCurrentPlayerTypeIfUnsettled();
        observe();
    }

    static void onShortsClosed() {
        cancelReady();
        NativeCaptionBridge.clearVisit();
        retire();
        if (AiCaptionHook.enabled()) CaptionActions.deactivateAfterNativeReset();
    }

    static void onTick() {
        CaptionPlayer.reconcileCurrentPlayerTypeIfUnsettled();
        if (CaptionPlayer.shortsRecoveryCandidate()) {
            CaptionPlayer.recoverShorts();
            reconcileShortsCc();
        }
        apply();
    }

    static void observe() {
        if (!AiCaptionHook.enabled()) return;
        onReady(false);
        reconcileShortsCc();
        apply();
    }

    static void onReady(boolean geometryChanged) {
        if (!AiCaptionHook.enabled() || video.isEmpty()
                || !CaptionPlayer.shortsRecoveryCandidate()) return;
        long epoch = CaptionPlayer.ownerEpoch();
        if (ready != null && ready.epoch == epoch) {
            ready.geometryChanged |= geometryChanged;
            return;
        }
        cancelReady();
        ready = new Ready(epoch, geometryChanged);
        MAIN.post(ready);
    }

    private static void cancelReady() {
        if (ready != null) MAIN.removeCallbacks(ready);
        ready = null;
    }

    private static final class Ready implements Runnable {
        final long epoch;
        boolean geometryChanged;

        Ready(long epoch, boolean geometryChanged) {
            this.epoch = epoch;
            this.geometryChanged = geometryChanged;
        }

        public void run() {
            if (ready != this) return;
            try {
                if (epoch != CaptionPlayer.ownerEpoch() || !AiCaptionHook.enabled()
                        || !CaptionPlayer.shortsRecoveryCandidate()) return;
                if (geometryChanged) CaptionSurface.allowShortsReadyProbe();
                if (!CaptionPlayer.recoverShorts()) CaptionPlayer.waitForShortsLayout();
                reconcileShortsCc();
                apply();
            } finally {
                if (ready == this) ready = null;
            }
        }
    }

    private static void reconcileShortsCc() {
        if (!CaptionPlayer.shortsRecoveryCandidate() || !CaptionPlayer.displayPermitted()
                || !CaptionSurface.isShorts() || NativeCaptionBridge.ccState() != NativeCaptionBridge.UNKNOWN
                || NativeCaptionBridge.selection() == null) return;
        onCcState(NativeCaptionBridge.ON);
    }

    static void onNativeSelection(boolean off, boolean explicit) {
        if (explicit) {
            onCcState(off ? NativeCaptionBridge.OFF : NativeCaptionBridge.ON);
        } else if (off) {
            if (AiCaptionHook.enabled() && CaptionSurface.isShorts()
                    && NativeCaptionBridge.ccState() != NativeCaptionBridge.OFF)
                NativeCaptionBridge.setCc(NativeCaptionBridge.UNKNOWN);
            if (AiCaptionHook.enabled()) CaptionActions.deactivateAfterNativeReset();
        } else observe();
    }

    static void onCcState(int state) {
        int previous = NativeCaptionBridge.ccState();
        NativeCaptionBridge.setCc(state);
        if (!AiCaptionHook.enabled()) return;
        if (state == NativeCaptionBridge.ON) {
            backfillIntent();
            apply();
        } else if (previous != state) {
            CaptionActions.deactivateAfterNativeReset();
        }
    }

    static boolean displayAllowed() {
        return AiCaptionHook.enabled() && !CaptionPlayer.shortsExitBlocked()
                && NativeCaptionBridge.ccState() == NativeCaptionBridge.ON;
    }

    static boolean matchesRequest(String url) {
        NativeCaptionBridge.Selection selected = NativeCaptionBridge.selection();
        String requested = CaptionUrls.videoId(url);
        if (selected == null || !requested.isEmpty() && !video.equals(requested)) return false;
        TargetLanguage target = TargetLanguage.fromUrl(url);
        return selected.translated ? target != null && selected.target.equalsIgnoreCase(target.code)
                : target == null;
    }

    static void retire() {
        appliedEpoch = appliedRevision = -1;
    }

    private static void apply() {
        if (!displayAllowed()) return;
        NativeCaptionBridge.Selection selected = NativeCaptionBridge.selection();
        if (selected == null) return;
        long epoch = CaptionPlayer.ownerEpoch();
        if (appliedEpoch == epoch && appliedRevision == selected.revision) return;
        Intent intent = readIntent(context);
        if (!intent.enabled) return;
        if (appliedRevision >= 0 && (CaptionActions.isVisibleActive() || CaptionActions.ownsNativeTrack()))
            CaptionActions.deactivateAfterNativeReset();
        SourceSelection own = selected.translated ? CaptionTracks.ownTargetTrack(selected.url) : null;
        String url = own != null ? own.url
                : selected.translated ? CaptionTracks.preferredSource(selected.url) : selected.url;
        if (!AiCaptionHook.isYouTubeTimedTextUrl(url)) return;
        appliedEpoch = epoch;
        appliedRevision = selected.revision;
        CaptionActions.activate(context, url, own != null || !selected.translated, true);
        CaptionDiagnostics.mark(context, "INTENT_APPLY", "video=" + video + ";epoch=" + epoch
                + ";target=" + selected.target + ";translate=" + (own == null && selected.translated)
                + ";revision=" + intent.revision + ";selection=" + selected.revision);
    }

    public static boolean onUserSwitched(Context c, boolean enabled) {
        if (c == null) return false;
        saveIntent(c, enabled);
        AiCaptionConfig.saveEnabled(c, enabled);
        boolean changed = AiCaptionHook.enabled() != enabled;
        AiCaptionHook.enabled(enabled);
        if (changed && AiCaptionHook.installed()) NativeCaptionBridge.invalidateRenderers();
        retire();
        cancelReady();
        if (AiCaptionHook.enabled()) {
            CaptionActions.refreshConfiguration(c);
            if (!video.isEmpty()) CaptionActions.onVideoId(video);
            CaptionPlayer.resumeObservers();
            NativeCaptionBridge.refreshCatalog();
            CaptionButton.findCurrent();
            reconcileShortsCc();
            apply();
        } else {
            CaptionOverlay.setPlayerControlsVisible(false);
            CaptionPlayer.pauseObservers();
            CaptionButton.resetVisit();
            CaptionActions.deactivateAfterNativeReset();
            CaptionActions.refreshConfiguration(c);
        }
        return true;
    }

    private static void backfillIntent() {
        if (!readIntent(context).enabled) saveIntent(context, true);
    }

    private static final class Intent {
        final boolean enabled;
        final long revision;

        Intent(boolean enabled, long revision) {
            this.enabled = enabled;
            this.revision = revision;
        }
    }

    private static Intent readIntent(Context c) {
        try {
            SharedPreferences prefs = CaptionStorage.SESSION.open(c);
            return new Intent(prefs.getBoolean("ai_enabled", false),
                    Math.max(0L, prefs.getLong("revision", 0L)));
        } catch (RuntimeException unavailable) {
            return new Intent(false, 0);
        }
    }

    private static void saveIntent(Context c, boolean enabled) {
        try {
            CaptionStorage.SESSION.open(c).edit()
                    .putBoolean("ai_enabled", enabled)
                    .putLong("revision", readIntent(c).revision + 1)
                    .putString("provenance", "USER")
                    .remove("target_language").remove("translate_target").apply();
        } catch (RuntimeException unavailable) {
            CaptionDiagnostics.mark(c, "INTENT_WRITE_FAILED", "caption session preference unavailable");
        }
    }
}
