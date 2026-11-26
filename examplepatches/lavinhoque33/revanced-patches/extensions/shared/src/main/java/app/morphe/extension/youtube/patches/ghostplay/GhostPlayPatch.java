/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/5197
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.youtube.patches.ghostplay;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.patches.MediaHttpRequest;
import app.morphe.extension.shared.utils.IntentUtils;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.utils.FlyoutUtils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.ShortsPlayerState;
import app.morphe.extension.youtube.shared.VideoInformation;
import app.morphe.extension.youtube.videoplayer.GhostPlayButton;

import java.util.Map;

/** Suppresses supported watch-history signals; this is not an anonymity or sign-out feature. */
@SuppressWarnings("unused")
public final class GhostPlayPatch {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final GhostPlaybackState STATE = new GhostPlaybackState();
    private static final long MINUTE_MS = 60_000;
    private static volatile long timedUntil;
    private static String historyId;

    private static final Runnable UPDATE_TIMER = GhostPlayPatch::updateTimer;
    private static final Runnable SAVE_POSITION = new Runnable() {
        @Override
        public void run() {
            String id = historyId;
            if (id == null || !id.equals(VideoInformation.getVideoId())
                    || !isPlaybackOpen()
                    || !Settings.GHOST_PLAY_LOCAL_HISTORY.get() || !shouldBlockCurrent(id)) {
                historyId = null;
                return;
            }
            GhostHistoryStore.record(id, VideoInformation.getVideoTitle(), VideoInformation.getChannelName(),
                    VideoInformation.getVideoTime(), VideoInformation.getVideoLength());
            MAIN.postDelayed(this, 10_000);
        }
    };

    private GhostPlayPatch() {}

    public static boolean isPatchIncluded() {
        return false; // Updated only after all required patch points have been resolved.
    }

    /** First active check resets an intentionally non-persistent session from the previous process. */
    private static final class Session {
        static {
            if (!Settings.GHOST_PLAY_PERSIST_MODE.get() && Settings.GHOST_PLAY_MODE_ACTIVE.get()) {
                Settings.GHOST_PLAY_MODE_ACTIVE.save(false);
            }
            PlayerType.getOnChange().addObserver(type -> {
                clearPlaybackIfIdle();
                return kotlin.Unit.INSTANCE;
            });
            ShortsPlayerState.getOnChange().addObserver(state -> {
                clearPlaybackIfIdle();
                return kotlin.Unit.INSTANCE;
            });
        }

        static boolean active() {
            return Settings.GHOST_PLAY_MODE_ACTIVE.get() || SystemClock.elapsedRealtime() < timedUntil;
        }
    }

    private static boolean isPlaybackOpen() {
        return ShortsPlayerState.getCurrent().isOpen() || !PlayerType.getCurrent().isNoneOrHidden();
    }

    private static void clearPlaybackIfIdle() {
        if (isPlaybackOpen()) return;
        STATE.dismissed();
        MAIN.post(() -> {
            MAIN.removeCallbacks(SAVE_POSITION);
            historyId = null;
        });
        refreshUi();
    }

    public static boolean isEnabled() {
        return isPatchIncluded() && Settings.GHOST_PLAY_ENABLED.get();
    }

    public static boolean isSessionGhostActive() {
        return isEnabled() && Session.active();
    }

    public static long getTimedGhostRemainingMinutes() {
        long remaining = timedUntil - SystemClock.elapsedRealtime();
        return remaining <= 0 ? 0 : (remaining + MINUTE_MS - 1) / MINUTE_MS;
    }

    private static void updateTimer() {
        refreshUi();
        long remaining = timedUntil - SystemClock.elapsedRealtime();
        if (remaining > 0) {
            // At each displayed minute boundary (and at expiry), rather than polling UI.
            MAIN.postDelayed(UPDATE_TIMER, (remaining - 1) % MINUTE_MS + 1);
        }
    }

    private static void setSession(boolean active, int minutes) {
        if (!isEnabled()) return;
        Session.active();
        Settings.GHOST_PLAY_MODE_ACTIVE.save(active && minutes == 0);
        timedUntil = active && minutes > 0 ? SystemClock.elapsedRealtime() + minutes * MINUTE_MS : 0;
        MAIN.removeCallbacks(UPDATE_TIMER);
        updateTimer();
        if (active) beginRecording(VideoInformation.getVideoId());
    }

    public static void toggleSessionGhostMode() {
        if (!isEnabled()) return;
        boolean active = !isSessionGhostActive();
        setSession(active, 0);
        notify(active ? "morphe_ghost_play_session_on_toast" : "morphe_ghost_play_session_off_toast");
    }

    public static void toggleFromPlayerButton() {
        if (!isEnabled()) return;
        if (!isSessionGhostActive() && isCurrentVideoGhost()) {
            STATE.optOut();
            refreshUi();
            notify("morphe_ghost_play_video_off_toast");
        } else {
            toggleSessionGhostMode();
        }
    }

    public static void enableTimedGhostMode(int minutes) {
        setSession(minutes > 0, minutes);
    }

    public static void cancelTimerKeepGhostOn() {
        setSession(true, 0);
        notify("morphe_ghost_play_timer_cancelled_keep_on_toast");
    }

    public static boolean isCurrentVideoGhost() {
        return shouldBlockCurrent(VideoInformation.getVideoId());
    }

    private static boolean shouldBlockCurrent(String id) {
        return isEnabled() && (Session.active() || STATE.currentIsProtected(id));
    }

    /** Explicitly queued launches and auto rules are checked before some native tracking starts. */
    public static void onVideoResponse(@Nullable String id, boolean shortOpeningOrPlaying) {
        if (!isEnabled() || !validVideoId(id)) return;
        if (shortOpeningOrPlaying ? Settings.GHOST_PLAY_AUTO_SHORTS.get() : isSearchAutoActive()) {
            STATE.autoCandidate(id, SystemClock.elapsedRealtime());
        }
    }

    private static boolean isSearchAutoActive() {
        return Settings.GHOST_PLAY_AUTO_SEARCH.get() && NavigationBar.isSearchBarActive()
                && !PlayerType.getCurrent().isMaximizedOrFullscreen();
    }

    /** Only actual video loads (not prefetched responses) consume or replace one-video state. */
    public static void onVideoStarted(String id) {
        if (!isEnabled() || !validVideoId(id)) return;
        if (STATE.started(id, SystemClock.elapsedRealtime())) {
            notify("morphe_ghost_play_video_active_toast");
        }
        if (shouldBlockCurrent(id)) beginRecording(id);
        refreshUi();
    }

    /** Uses ID-bound metadata instead of the previous playback's global channel. */
    public static void onVideoMetadata(String channelId, String channelName, String id, String title,
                                       long length, boolean live) {
        if (!isEnabled() || !validVideoId(id) || !GhostChannelStore.contains(channelId, channelName)) return;
        STATE.autoCandidate(id, SystemClock.elapsedRealtime());
        STATE.protectCurrent(id);
        if (STATE.currentIsProtected(id)) beginRecording(id);
        refreshUi();
    }

    public static void markCurrentVideoIfMatchesChannel() {
        onVideoMetadata(VideoInformation.getChannelId(), VideoInformation.getChannelName(),
                VideoInformation.getVideoId(), "", 0, false);
    }

    public static void playVideoInGhostMode(String id, long resumeMs) {
        if (!isEnabled() || !validVideoId(id)) return;
        STATE.request(id, SystemClock.elapsedRealtime());
        String url = "https://www.youtube.com/watch?v=" + id;
        if (resumeMs >= 5_000) url += "&t=" + resumeMs / 1000 + "s";
        IntentUtils.launchView(url, Utils.getContext().getPackageName());
    }

    public static int addFlyoutButton(Object panel, int index, String id, boolean playing) {
        if (!isEnabled() || !Settings.GHOST_PLAY_FLYOUT_BUTTON.get() || !validVideoId(id)) return index;
        Drawable icon = ResourceUtils.getDrawable("morphe_ghost_play_flyout");
        if (icon == null) return index;
        return FlyoutUtils.addFlyoutButton(panel, icon, str("morphe_ghost_play_flyout_action"), view -> {
            FlyoutUtils.dismissFlyout();
            if (!isEnabled()) return;
            if (playing && id.equals(VideoInformation.getVideoId())) {
                STATE.request(id, SystemClock.elapsedRealtime());
                onVideoStarted(id);
            } else {
                playVideoInGhostMode(id, 0);
            }
        }, index);
    }

    /** VSS2 ping and log, and VSS3 segment log hooks have the event's own video ID. */
    public static boolean shouldBlockStats(@Nullable String id) {
        return isEnabled() && (Session.active() || STATE.blocksStats(id, SystemClock.elapsedRealtime()));
    }

    /** Prefer the ping's ID instead of suppressing an older video's ping as current playback. */
    public static boolean shouldBlockPtracking(@Nullable Uri uri) {
        if (!isEnabled()) return false;
        String id = uri == null ? null : GhostRequestHeaders.queryId(uri);
        return id == null ? isCurrentVideoGhost() : shouldBlockStats(id);
    }

    /** Runs before RVX's existing optional replace/block hook. */
    public static Uri blockTrackingUrl(Uri uri) {
        if (!isEnabled() || uri == null) return uri;
        String path = uri.getPath();
        if (path == null || !GhostRequestHeaders.isPlaybackTrackingPath(path) || path.endsWith("/ptracking")) {
            return uri;
        }
        boolean block = shouldBlockPtracking(uri);
        return block ? TrackingSink.URI : uri;
    }

    private static final class TrackingSink {
        static final Uri URI = Uri.parse("https://www.youtube.com/gen_204");
    }

    public static Map<String, String> overrideRequestHeaders(String url, Map<String, String> headers, byte[] body) {
        if (!isEnabled() || headers == null || headers.isEmpty()) return headers;
        if (!Settings.GHOST_PLAY_ANONYMIZE_REQUESTS.get() && !Settings.GHOST_PLAY_AUTO_SHORTS.get()
                && !Settings.GHOST_PLAY_AUTO_SEARCH.get()) return headers;
        return GhostRequestHeaders.sanitize(url, headers, body);
    }

    public static MediaHttpRequest onMediaRequest(MediaHttpRequest request, Object callbacks) {
        if (!isEnabled() || request == null || !Settings.GHOST_PLAY_ANONYMIZE_REQUESTS.get()) return request;
        return GhostRequestHeaders.sanitizeNative(request);
    }

    static boolean shouldStripHeaders(@Nullable String id, boolean shortRequest, boolean playerRequest) {
        if (id != null && (shortRequest ? Settings.GHOST_PLAY_AUTO_SHORTS.get()
                : playerRequest && isSearchAutoActive())) {
            STATE.autoCandidate(id, SystemClock.elapsedRealtime());
        }
        return Settings.GHOST_PLAY_ANONYMIZE_REQUESTS.get() && (Session.active()
                || (id != null && STATE.protectsRequest(id, SystemClock.elapsedRealtime())));
    }

    static boolean validVideoId(@Nullable String id) {
        if (id == null || id.length() != 11) return false;
        for (int i = 0; i < id.length(); i++) {
            char c = id.charAt(i);
            if (!(c >= 'A' && c <= 'Z' || c >= 'a' && c <= 'z' || c >= '0' && c <= '9'
                    || c == '_' || c == '-')) return false;
        }
        return true;
    }

    private static void beginRecording(String id) {
        if (!validVideoId(id) || !Settings.GHOST_PLAY_LOCAL_HISTORY.get()) return;
        MAIN.post(() -> {
            if (id.equals(historyId)) return;
            historyId = id;
            MAIN.removeCallbacks(SAVE_POSITION);
            MAIN.postDelayed(SAVE_POSITION, 2_500);
        });
    }

    private static void refreshUi() {
        Utils.runOnMainThread(() -> {
            GhostPlayButton.refreshButtonState();
            GhostPlayToolbarButton.refresh();
        });
    }

    private static void notify(String message) {
        Utils.showToastShort(str(message));
    }
}
