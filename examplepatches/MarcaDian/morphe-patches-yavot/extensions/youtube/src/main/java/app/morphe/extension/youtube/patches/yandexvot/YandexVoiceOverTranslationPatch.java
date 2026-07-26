/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s) (based on contributions):
 * - Jav1x (https://github.com/Jav1x)
 * - anddea (https://github.com/anddea)
 *
 * Ported to morphe-patches: https://github.com/MorpheApp/morphe-patches
 * Modified by: Jav1x (https://github.com/Jav1x)
 *
 * Licensed under the GNU General Public License v3.0.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Attribution Notice
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Attribution (Section 7(b)): This specific copyright notice and the
 *    list of original authors above must be preserved in any copy or
 *    derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin (Section 7(c)): Modified versions must be clearly marked as
 *    such (e.g., by adding a "Modified by" line or a new copyright notice).
 *    They must not be misrepresented as the original work.
 *
 * ------------------------------------------------------------------------
 * Version Control Acknowledgement (Non-binding Request)
 * ------------------------------------------------------------------------
 *
 * While not a legal requirement of the GPLv3, the original author(s)
 * respectfully request that ports or substantial modifications retain
 * historical authorship credit in version control systems (e.g., Git),
 * listing original author(s) appropriately and modifiers as committers
 * or co-authors.
 */

package app.morphe.extension.youtube.patches.yandexvot;

import android.content.Context;
import android.media.AudioAttributes;
import android.media.MediaPlayer;
import android.media.PlaybackParams;
import android.os.Handler;
import android.os.Looper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;


import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.settings.YandexVotSettings;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.VideoState;

import static app.morphe.extension.shared.StringRef.str;
import static app.morphe.extension.shared.Utils.showToastShort;

@SuppressWarnings("unused")
public class YandexVoiceOverTranslationPatch {

    private static final String TAG = "VOT";

    private static final long PAUSE_DETECTION_TIMEOUT_MS = 1500;
    private static final long PROXY_PREPARE_TIMEOUT_MS = 15000;
    private static final String PROXY_USER_AGENT =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " +
            "(KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36";
    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private static final AtomicReference<MediaPlayer> mediaPlayer = new AtomicReference<>(null);
    private static final AtomicBoolean isTranslating = new AtomicBoolean(false);
    private static final AtomicReference<String> currentTranslatedVideoId = new AtomicReference<>("");
    private static volatile boolean isPaused = false;
    private static volatile long lastVideoTimeMs = -1;
    private static final long SEEK_DRIFT_THRESHOLD_MS = 20000;
    private static final long USER_SEEK_JUMP_MS = 3000;

    private static final Runnable pauseCheckRunnable = () -> {
        if (!isPaused) {
            pauseAudio();
        }
    };

    private static Runnable proxyPrepareTimeoutRunnable = () -> {};
    private static Runnable onTranslationStateChangeCallback;

    public static void setOnTranslationStateChangeCallback(Runnable r) {
        onTranslationStateChangeCallback = r;
    }

    private static void notifyTranslationStateChanged() {
        if (onTranslationStateChangeCallback != null) {
            Utils.runOnMainThread(onTranslationStateChangeCallback);
        }
    }

    /** Runs a Runnable on the main thread only if translation generation hasn't changed. */
    private static void runOnUiIfCurrentGen(long gen, Runnable r) {
        Utils.runOnMainThread(() -> {
            if (translationGeneration.get() == gen) r.run();
        });
    }

    private static volatile String tempProxyFile = null;

    private static volatile String pendingVideoId = "";
    private static volatile String pendingVideoTitle = "";
    private static volatile long pendingVideoLength = 0L;
    private static volatile boolean pendingIsLive = false;

    /** True when user started translation and original audio should be ducked before translated audio starts. */
    public static volatile boolean translationStarting = false;

    /** Remaining seconds while waiting for translation. -1 when not waiting. Updated for BottomSheet countdown. */
    public static volatile int waitingTimeSeconds = -1;

    /** Incremented on every new video or stop, invalidates in-flight async translation chains. */
    private static final AtomicLong translationGeneration = new AtomicLong(0);

    public static void initialize(@SuppressWarnings("unused") VideoInformation.PlaybackController controller) {
        VideoState.getOnChange().addObserver(state -> {
            if (state == VideoState.PLAYING) {
                resumeAudio(-1);
            } else {
                mainHandler.removeCallbacks(pauseCheckRunnable);
                pauseAudio();
            }
            return kotlin.Unit.INSTANCE;
        });
        // Playback speed is synced on-demand inside videoTimeChanged.
    }

    public static void onVideoIdChanged(String videoId) {
        if (videoId == null || videoId.isEmpty()) return;
        long videoLength = VideoInformation.getVideoLength();
        boolean isLive = videoLength <= 0 || videoLength == Long.MAX_VALUE;
        newVideoStarted(videoId, "", videoLength, isLive);
    }

    public static void newVideoStarted(
            String videoId, String videoTitle,
            long videoLength, boolean isLive
    ) {
        if (!YandexVotSettings.YANDEX_VOT_ENABLED.get()) return;
        String newId = videoId != null ? videoId : "";
        if (!newId.equals(pendingVideoId)) {
            translationStarting = false;
        }
        if (!newId.equals(currentTranslatedVideoId.get())) {
            stopAudioPlayback();
        }
        pendingVideoId = newId;
        pendingVideoTitle = videoTitle != null ? videoTitle : "";
        pendingVideoLength = videoLength;
        pendingIsLive = isLive;
        if (!newId.equals(currentTranslatedVideoId.get())) {
            translationGeneration.incrementAndGet();
        }
    }

    public static void toggleTranslation() {
        if (!YandexVotSettings.YANDEX_VOT_ENABLED.get()) return;

        if (isTranslationActive()) {
            translationStarting = false;
            waitingTimeSeconds = -1;
            stopAudioPlayback();
            isTranslating.set(false);
            notifyTranslationStateChanged();
            showToastShort(str("morphe_yandex_vot_stopped"));
            refreshOriginalAudioVolume();
            return;
        }

        if (pendingIsLive) {
            showToastShort(str("morphe_yandex_vot_unavailable_live"));
            return;
        }
        if (pendingVideoLength > 4 * 60 * 60 * 1000L) {
            showToastShort(str("morphe_yandex_vot_unavailable_too_long"));
            return;
        }
        String sourceLang = normalizeLanguageCode(YandexVotSettings.YANDEX_VOT_SOURCE_LANGUAGE.get());
        String targetLang = normalizeLanguageCode(YandexVotSettings.YANDEX_VOT_TARGET_LANGUAGE.get());
        if (!sourceLang.isEmpty() && !"auto".equalsIgnoreCase(sourceLang) && sourceLang.equals(targetLang)) {
            showToastShort(str("morphe_yandex_vot_unavailable_same_language"));
            return;
        }
        if (pendingVideoId == null || pendingVideoId.isEmpty()) return;

        final String videoId = pendingVideoId;
        final String videoTitle = pendingVideoTitle;
        final double durationSeconds = pendingVideoLength / 1000.0;
        translationStarting = true;
        refreshOriginalAudioVolume();
        Utils.runOnBackgroundThread(() -> requestTranslation(
                videoId, videoTitle,
                sourceLang, targetLang,
                durationSeconds
        ));
    }

    public static boolean isTranslationActive() {
        MediaPlayer mp = mediaPlayer.get();
        if (mp == null) return translationStarting;
        if (isPaused) return false;
        return currentTranslatedVideoId.get() != null && !currentTranslatedVideoId.get().isEmpty();
    }

    /**
     * Whether a cached (ready-to-play) translation exists for the current video and voice style.
     * Uses pendingVideoId so it works immediately when the BottomSheet opens, before user presses translate.
     * @param useLiveVoices true = live, false = standard
     */
    public static boolean isCachedForCurrentVideo(boolean useLiveVoices) {
        String videoId = pendingVideoId;
        if (videoId == null || videoId.isEmpty()) return false;
        String sourceLang = normalizeLanguageCode(YandexVotSettings.YANDEX_VOT_SOURCE_LANGUAGE.get());
        String targetLang = normalizeLanguageCode(YandexVotSettings.YANDEX_VOT_TARGET_LANGUAGE.get());
        String url = "https://youtu.be/" + videoId;
        return YandexVotApiClient.hasCachedTranslation(url, sourceLang, targetLang, useLiveVoices);
    }

    /**
     * Re-applies the current player volume so VOT original-audio multiplier takes effect immediately
     * without reloading the video.
     */
    public static void refreshOriginalAudioVolumeIfActive() {
        if (!YandexVotSettings.YANDEX_VOT_ENABLED.get()) return;
        if (!isTranslationActive() && !translationStarting) return;
        refreshOriginalAudioVolume();
    }

    /**
     * Re-applies the player volume with the given original-audio volume percent,
     * so the multiplier takes effect immediately.
     *
     * @param volumePercent original audio volume in percent (0-100)
     */
    public static void refreshOriginalAudioVolumeIfActive(int volumePercent) {
        if (!YandexVotSettings.YANDEX_VOT_ENABLED.get()) return;
        if (!isTranslationActive() && !translationStarting) return;
        refreshOriginalAudioVolume(volumePercent);
    }

    /**
     * Forces the player to re-apply volume so AudioTrack.setVolume hook runs immediately.
     */
    public static void refreshOriginalAudioVolume() {
        refreshOriginalAudioVolume(YandexVotSettings.YANDEX_VOT_ORIGINAL_AUDIO_VOLUME.get());
    }

    /**
     * Forces the player to re-apply volume with the given percent so AudioTrack.setVolume hook runs immediately.
     * @param volumePercent original audio volume in percent (0-100)
     */
    public static void refreshOriginalAudioVolume(int volumePercent) {
        // If AudioTrack isn't captured yet, ducking applies on the next player restart.
        YandexVotOriginalVolumePatch.applyCurrentMultiplierNow(volumePercent);
    }

    /**
     * Stops current translation and restarts it (e.g. when audio proxy setting changes).
     * No-op if translation is not active.
     */
    public static void restartTranslationIfActive() {
        if (!YandexVotSettings.YANDEX_VOT_ENABLED.get()) return;
        if (!isTranslationActive()) return;
        String videoId = currentTranslatedVideoId.get();
        if (videoId == null || videoId.isEmpty()) return;
        if (pendingIsLive) return;
        if (pendingVideoLength > 4 * 60 * 60 * 1000L) return;
        String sourceLang = normalizeLanguageCode(YandexVotSettings.YANDEX_VOT_SOURCE_LANGUAGE.get());
        String targetLang = normalizeLanguageCode(YandexVotSettings.YANDEX_VOT_TARGET_LANGUAGE.get());
        if (!sourceLang.isEmpty() && !"auto".equalsIgnoreCase(sourceLang) && sourceLang.equals(targetLang)) return;

        stopAudioPlayback();
        YandexVotApiClient.clearTranslationCache(); // force fresh request after settings change
        double durationSeconds = pendingVideoLength / 1000.0;
        Utils.runOnBackgroundThread(() -> requestTranslation(
                videoId, pendingVideoTitle,
                sourceLang, targetLang,
                durationSeconds
        ));
    }

    public static void setVideoTime(long videoTimeMillis) {
        if (!YandexVotSettings.YANDEX_VOT_ENABLED.get()) return;
        if (isPaused) {
            final long time = videoTimeMillis;
            mainHandler.postDelayed(() -> resumeAudio(time), 80);
        }
        mainHandler.removeCallbacks(pauseCheckRunnable);
        mainHandler.postDelayed(pauseCheckRunnable, PAUSE_DETECTION_TIMEOUT_MS);
        MediaPlayer mp = mediaPlayer.get();
        if (mp == null || !mp.isPlaying()) return;
        final long time = videoTimeMillis;
        Utils.runOnMainThread(() -> {
            MediaPlayer p = mediaPlayer.get();
            if (p == null || !p.isPlaying()) return;
            applyPlaybackSpeedToPlayer(p);
            try {
                int audioPos = p.getCurrentPosition();
                long drift = Math.abs(audioPos - time);
                long prev = lastVideoTimeMs;
                lastVideoTimeMs = time;
                boolean userSeeked = prev >= 0 && (time < prev - 500 || time > prev + USER_SEEK_JUMP_MS);
                if (userSeeked || drift > SEEK_DRIFT_THRESHOLD_MS) {
                    p.seekTo((int) time);
                    applyPlaybackSpeedToPlayer(p);
                }
            } catch (IllegalStateException ignored) { }
        });
    }

    static String formatRemainingTime(int seconds) {
        if (seconds < 60) {
            return str("morphe_yandex_vot_time_sec", Math.max(1, seconds));
        }
        int minutes = (seconds + 30) / 60;
        return str("morphe_yandex_vot_time_min", minutes);
    }

    /**
     * Normalizes language codes from morphe's format (uppercase, DEFAULT=auto)
     * to the format expected by the VOT API (lowercase).
     */
    private static String normalizeLanguageCode(String code) {
        if (code == null || code.isEmpty() || "DEFAULT".equalsIgnoreCase(code) || "auto".equalsIgnoreCase(code)) {
            return "auto";
        }
        return code.toLowerCase(java.util.Locale.US);
    }

    /** Default poll wait when the API doesn't return a remainingTime hint. */
    private static final int DEFAULT_POLL_WAIT_SECONDS = 63;

    private static int pollWaitSecondsFrom(YandexVotApiClient.TranslationResult result) {
        return result.remainingTime() > 0 ? result.remainingTime() : DEFAULT_POLL_WAIT_SECONDS;
    }

    private static boolean isProxyUrl(String url) {
        if (url == null || url.isEmpty()) return false;
        try {
            String path = new URI(url).getRawPath();
            return path != null && path.contains("/audio-proxy/");
        } catch (URISyntaxException e) {
            return false;
        }
    }

    private static void requestTranslation(
            String videoId, String videoTitle,
            String sourceLang, String targetLang,
            double durationSeconds
    ) {
        requestTranslation(videoId, videoTitle, sourceLang, targetLang,
                durationSeconds, YandexVotSettings.YANDEX_VOT_USE_LIVE_VOICES.get());
    }

    private static void requestTranslation(
            String videoId, String videoTitle,
            String sourceLang, String targetLang,
            double durationSeconds, boolean useLiveVoices
    ) {
        if (isTranslating.getAndSet(true)) return;
        final long generation = translationGeneration.get();
        try {
            String youtubeUrl = "https://youtu.be/" + videoId;
            YandexVotApiClient.TranslationResult result = YandexVotApiClient.requestTranslation(
                    youtubeUrl, durationSeconds, sourceLang, targetLang, videoTitle, useLiveVoices);
            if (result == null) {
                runOnUiIfCurrentGen(generation, () -> {
                    waitingTimeSeconds = -1;
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                });
                return;
            }
            Logger.printDebug(() -> "VOT response: status=" + result.status()
                    + " remainingTime=" + result.remainingTime()
                    + " useLiveVoices=" + useLiveVoices
                    + " audioUrl=" + (result.audioUrl() != null ? result.audioUrl().substring(0, Math.min(80, result.audioUrl().length())) : "null")
                    + " translationId=" + result.translationId()
                    + " message=" + result.message());
            int status = result.status();
            if (status == YandexVotApiClient.STATUS_FINISHED || status == YandexVotApiClient.STATUS_PART_CONTENT) {
                if (result.audioUrl() != null && !result.audioUrl().isEmpty()) {
                    playAudioWithProxyFallback(videoId, result.audioUrl(), generation);
                } else {
                    runOnUiIfCurrentGen(generation, () -> {
                        waitingTimeSeconds = -1;
                        translationStarting = false;
                        refreshOriginalAudioVolume();
                        showToastShort(str("morphe_yandex_vot_playback_error"));
                    });
                }
            } else if (status == YandexVotApiClient.STATUS_FAILED) {
                if (useLiveVoices && YandexVotApiClient.isLivelyVoiceUnavailableError(result.message())) {
                    // Live voices unavailable for this language pair – fallback to standard voices.
                    Logger.printDebug(() -> "VOT live voices unavailable, retrying with standard voices");
                    isTranslating.set(false);
                    Utils.runOnBackgroundThread(() -> {
                        if (translationGeneration.get() != generation) return;
                        requestTranslation(videoId, videoTitle, sourceLang, targetLang, durationSeconds, false);
                    });
                    return;
                }
                runOnUiIfCurrentGen(generation, () -> {
                    waitingTimeSeconds = -1;
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                });
            } else if (status == YandexVotApiClient.STATUS_SESSION_REQUIRED) {
                if (useLiveVoices) {
                    String oauthToken = YandexVotSettings.YANDEX_VOT_OAUTH_TOKEN.get();
                    if (oauthToken.isEmpty()) {
                        // No OAuth token configured for live voices — tell user to add one.
                        runOnUiIfCurrentGen(generation, () -> {
                            waitingTimeSeconds = -1;
                            translationStarting = false;
                            refreshOriginalAudioVolume();
                            showToastShort(str("morphe_yandex_vot_auth_required"));
                        });
                        return;
                    }
                    // Token is set but live voices session still failed — fallback to standard voices.
                    Logger.printDebug(() -> "VOT live voices session failed, retrying with standard voices");
                    isTranslating.set(false);
                    Utils.runOnBackgroundThread(() -> {
                        if (translationGeneration.get() != generation) return;
                        requestTranslation(videoId, videoTitle, sourceLang, targetLang, durationSeconds, false);
                    });
                    return;
                }
                // Standard voices session failed — cannot proceed
                runOnUiIfCurrentGen(generation, () -> {
                    waitingTimeSeconds = -1;
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                });
            } else if (status == YandexVotApiClient.STATUS_AUDIO_REQUESTED) {
                String translationId = result.translationId();
                YandexVotApiClient.sendFailedAudio(youtubeUrl);
                String oauth = useLiveVoices ? YandexVotSettings.YANDEX_VOT_OAUTH_TOKEN.get() : null;
                YandexVotApiClient.sendEmptyAudio(youtubeUrl, translationId, oauth);
                int pollWaitTime = pollWaitSecondsFrom(result);
                waitingTimeSeconds = pollWaitTime;
                notifyTranslationStateChanged();
                runOnUiIfCurrentGen(generation, () -> Utils.showToastLong(str("morphe_yandex_vot_stream_waiting", formatRemainingTime(pollWaitTime))));
                pollTranslation(videoId, videoTitle, youtubeUrl, durationSeconds, sourceLang, targetLang,
                        pollWaitTime, useLiveVoices, generation, 0);
            } else {
                int waitTime = pollWaitSecondsFrom(result);
                waitingTimeSeconds = waitTime;
                notifyTranslationStateChanged();
                runOnUiIfCurrentGen(generation, () -> Utils.showToastLong(str("morphe_yandex_vot_stream_waiting", formatRemainingTime(waitTime))));
                pollTranslation(videoId, videoTitle, youtubeUrl, durationSeconds, sourceLang, targetLang, waitTime, useLiveVoices, generation, 0);
            }
        } catch (Exception e) {
            Logger.printException(() -> "requestTranslation failed", e);
            runOnUiIfCurrentGen(generation, () -> {
                translationStarting = false;
                refreshOriginalAudioVolume();
                showToastShort(str("morphe_yandex_vot_playback_error"));
            });
        } finally {
            isTranslating.set(false);
        }
    }

    private static void playAudioWithProxyFallback(String videoId, String directAudioUrl, long generation) {
        boolean useProxy = YandexVotSettings.YANDEX_VOT_AUDIO_PROXY_ENABLED.get();
        String url = useProxy ? YandexVotApiClient.toProxyAudioUrl(directAudioUrl) : directAudioUrl;
        String fallback = useProxy ? directAudioUrl : null;
        runOnUiIfCurrentGen(generation, () -> startAudioPlayback(videoId, url, fallback));
    }

    /**
     * Polls the VOT API at intervals, showing remaining wait time.
     * @param generation capture from caller; aborts all actions if it changed
     */
    private static void pollTranslation(
            String videoId, String videoTitle,
            String url, double duration,
            String sourceLang, String targetLang,
            int waitSeconds, boolean useLiveVoices, long generation, int retryCount
    ) {
        try {
            Thread.sleep(waitSeconds * 1000L);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return;
        }
        if (translationGeneration.get() != generation) return;
        try {
            YandexVotApiClient.TranslationResult result = YandexVotApiClient.requestTranslation(
                    url, duration, sourceLang, targetLang, videoTitle, useLiveVoices, false);
            if (result == null) {
                if (retryCount < 1 && translationGeneration.get() == generation) {
                    // Network error — retry once with a short delay
                    pollTranslation(videoId, videoTitle, url, duration, sourceLang, targetLang,
                            Math.min(waitSeconds, 30), useLiveVoices, generation, retryCount + 1);
                } else {
                    runOnUiIfCurrentGen(generation, () -> {
                        translationStarting = false;
                        refreshOriginalAudioVolume();
                        showToastShort(str("morphe_yandex_vot_playback_error"));
                    });
                }
                return;
            }
            int status = result.status();
            if (status == YandexVotApiClient.STATUS_FINISHED || status == YandexVotApiClient.STATUS_PART_CONTENT) {
                if (result.audioUrl() != null && !result.audioUrl().isEmpty()) {
                    playAudioWithProxyFallback(videoId, result.audioUrl(), generation);
                    return;
                }
                runOnUiIfCurrentGen(generation, () -> {
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                });
            } else if (status == YandexVotApiClient.STATUS_FAILED) {
                if (useLiveVoices && YandexVotApiClient.isLivelyVoiceUnavailableError(result.message())) {
                    Logger.printDebug(() -> "VOT live voices unavailable (poll), retrying with standard voices");
                    Utils.runOnBackgroundThread(() -> {
                        if (translationGeneration.get() != generation) return;
                        requestTranslation(videoId, videoTitle, sourceLang, targetLang, duration, false);
                    });
                    return;
                }
                runOnUiIfCurrentGen(generation, () -> {
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                });
            } else if (status == YandexVotApiClient.STATUS_SESSION_REQUIRED) {
                if (useLiveVoices) {
                    String oauthToken = YandexVotSettings.YANDEX_VOT_OAUTH_TOKEN.get();
                    if (oauthToken.isEmpty()) {
                        runOnUiIfCurrentGen(generation, () -> {
                            translationStarting = false;
                            refreshOriginalAudioVolume();
                            showToastShort(str("morphe_yandex_vot_auth_required"));
                        });
                        return;
                    }
                    Logger.printDebug(() -> "VOT live voices session failed (poll), retrying with standard voices");
                    Utils.runOnBackgroundThread(() -> {
                        if (translationGeneration.get() != generation) return;
                        requestTranslation(videoId, videoTitle, sourceLang, targetLang, duration, false);
                    });
                    return;
                }
                runOnUiIfCurrentGen(generation, () -> {
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                });
            } else if (status == YandexVotApiClient.STATUS_AUDIO_REQUESTED) {
                // Audio was already sent in requestTranslation. Just wait — generation is in progress.
                int pollWaitTime = pollWaitSecondsFrom(result);
                Logger.printDebug(() -> "VOT audio requested (poll), waiting " + pollWaitTime + "s");
                if (translationGeneration.get() != generation) return;
                waitingTimeSeconds = pollWaitTime;
                notifyTranslationStateChanged();
                pollTranslation(videoId, videoTitle, url, duration, sourceLang, targetLang,
                        pollWaitTime, useLiveVoices, generation, 0);
            } else {
                int pollWaitTime = pollWaitSecondsFrom(result);
                waitingTimeSeconds = pollWaitTime;
                notifyTranslationStateChanged();
                pollTranslation(videoId, videoTitle, url, duration, sourceLang, targetLang, pollWaitTime, useLiveVoices, generation, 0);
            }
        } catch (Exception e) {
            Logger.printException(() -> "pollTranslation failure", e);
            if (retryCount < 1 && translationGeneration.get() == generation) {
                // Retry once on exception
                pollTranslation(videoId, videoTitle, url, duration, sourceLang, targetLang,
                        Math.min(waitSeconds, 30), useLiveVoices, generation, retryCount + 1);
            } else {
                runOnUiIfCurrentGen(generation, () -> {
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                });
            }
        }
    }

    private static void startAudioPlayback(String videoId, String audioUrl, String fallbackUrl) {
        stopAudioPlayback();
        waitingTimeSeconds = -1;
        mainHandler.removeCallbacks(proxyPrepareTimeoutRunnable);
        if (isProxyUrl(audioUrl)) {
            Context ctx = Utils.getContext();
            if (ctx == null) {
                if (fallbackUrl != null && !fallbackUrl.isEmpty()) {
                    startAudioPlayback(videoId, fallbackUrl, null);
                } else {
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                }
                return;
            }
            final Context ctxFinal = ctx;
            Utils.runOnBackgroundThread(() -> {
                String localPath = fetchProxyAudioToTemp(audioUrl, ctxFinal);
                Utils.runOnMainThread(() -> {
                    if (localPath != null) {
                        startAudioPlaybackFromFile(videoId, localPath);
                    } else if (fallbackUrl != null && !fallbackUrl.isEmpty()) {
                        startAudioPlayback(videoId, fallbackUrl, null);
                    } else {
                        translationStarting = false;
                        refreshOriginalAudioVolume();
                        showToastShort(str("morphe_yandex_vot_playback_error"));
                    }
                });
            });
            return;
        }
        startAudioPlaybackDirect(videoId, audioUrl, fallbackUrl);
    }

    private static String fetchProxyAudioToTemp(String proxyUrl, Context ctx) {
        String urlToFetch = proxyUrl;
        int maxRedirects = 5;
        for (int redirect = 0; redirect < maxRedirects; redirect++) {
            HttpURLConnection conn = null;
            FileOutputStream fos = null;
            try {
                URL url = new URL(urlToFetch);
                conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Range", "bytes=0-");
                conn.setRequestProperty("User-Agent", PROXY_USER_AGENT);
                conn.setRequestProperty("Accept", "*/*");
                conn.setConnectTimeout(15000);
                conn.setReadTimeout(60000);
                conn.setInstanceFollowRedirects(false);
                conn.connect();
                int code = conn.getResponseCode();
                if (code == 301 || code == 302 || code == 307 || code == 308) {
                    String location = conn.getHeaderField("Location");
                    conn.disconnect();
                    if (location != null && !location.isEmpty()) {
                        urlToFetch = location.startsWith("http") ? location : url.getProtocol() + "://" + url.getHost() + location;
                        continue;
                    }
                    return null;
                }
                if (code != 200 && code != 206) return null;
                File cacheDir = ctx.getCacheDir();
                File tempFile = File.createTempFile("vot_proxy_", ".mp3", cacheDir);
                long totalBytes = 0;
                try (InputStream is = conn.getInputStream()) {
                    fos = new FileOutputStream(tempFile);
                    byte[] buf = new byte[8192];
                    int n;
                    while ((n = is.read(buf)) > 0) {
                        fos.write(buf, 0, n);
                        totalBytes += n;
                    }
                }
                try {
                    fos.close();
                } catch (IOException ignored) {}
                final long bytes = totalBytes;
                if (bytes < 1000) {
                    boolean deleted = tempFile.delete();
                    if (!deleted) {
                        Logger.printDebug(() -> "VOT temp proxy file could not be deleted: " + tempFile.getAbsolutePath());
                    }
                    return null;
                }
                return tempFile.getAbsolutePath();
            } catch (Exception e) {
                Logger.printException(() -> "VOT proxy fetch failed", e);
                return null;
            } finally {
                if (fos != null) {
                    try { fos.close(); } catch (IOException ignored) { }
                }
                if (conn != null) conn.disconnect();
            }
        }
        return null;
    }

    private static void startAudioPlaybackFromFile(String videoId, String filePath) {
        stopAudioPlayback();
        tempProxyFile = filePath;
        try {
            MediaPlayer mp = new MediaPlayer();
            mp.setAudioAttributes(
                    new AudioAttributes.Builder()
                            .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                            .setUsage(AudioAttributes.USAGE_MEDIA)
                            .build());
            mp.setDataSource(filePath);
            mp.setOnPreparedListener(player -> Utils.runOnMainThread(() -> {
                translationStarting = false;
                float vol = YandexVotSettings.YANDEX_VOT_TRANSLATION_VOLUME.get() / 100.0f;
                player.setVolume(vol, vol);
                long videoTime = VideoInformation.getVideoTime();
                if (videoTime > 0) player.seekTo((int) videoTime);
                if (VideoState.getCurrent() == VideoState.PLAYING) {
                    applyPlaybackSpeedToPlayer(player);
                    player.start();
                } else {
                    isPaused = true;
                }
            }));
            mp.setOnErrorListener((p, what, extra) -> {
                Logger.printDebug(() -> "VOT MediaPlayer error: what=" + what + " extra=" + extra);
                Utils.runOnMainThread(() -> {
                    stopAudioPlayback();
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                });
                return true;
            });
            mp.setOnCompletionListener(p -> deleteTempProxyFile());
            mediaPlayer.set(mp);
            currentTranslatedVideoId.set(videoId != null ? videoId : "");
            notifyTranslationStateChanged();
            mp.prepareAsync();
        } catch (IOException e) {
            Logger.printException(() -> "startAudioPlaybackFromFile failed", e);
            deleteTempProxyFile();
            translationStarting = false;
            refreshOriginalAudioVolume();
            showToastShort(str("morphe_yandex_vot_playback_error"));
        }
    }

    private static void deleteTempProxyFile() {
        String path = tempProxyFile;
        tempProxyFile = null;
        if (path != null) {
            try {
                File file = new File(path);
                boolean deleted = file.delete();
                if (!deleted) {
                    Logger.printDebug(() -> "VOT temp proxy file could not be deleted: " + file.getAbsolutePath());
                }
            } catch (Exception ignored) { }
        }
    }

    private static void startAudioPlaybackDirect(String videoId, String audioUrl, String fallbackUrl) {
        try {
            MediaPlayer mp = new MediaPlayer();
            mp.setAudioAttributes(
                    new AudioAttributes.Builder()
                            .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                            .setUsage(AudioAttributes.USAGE_MEDIA)
                            .build());
            mp.setDataSource(audioUrl);
            final String fallback = fallbackUrl;
            mp.setOnPreparedListener(player -> Utils.runOnMainThread(() -> {
                translationStarting = false;
                mainHandler.removeCallbacks(proxyPrepareTimeoutRunnable);
                float vol = YandexVotSettings.YANDEX_VOT_TRANSLATION_VOLUME.get() / 100.0f;
                player.setVolume(vol, vol);
                long videoTime = VideoInformation.getVideoTime();
                if (videoTime > 0) player.seekTo((int) videoTime);

                if (VideoState.getCurrent() == VideoState.PLAYING) {
                    applyPlaybackSpeedToPlayer(player);
                    player.start();
                } else {
                    isPaused = true;
                }
            }));
            mp.setOnErrorListener((p, what, extra) -> {
                Logger.printDebug(() -> "VOT MediaPlayer error: what=" + what + " extra=" + extra + " url=" + audioUrl);
                Utils.runOnMainThread(() -> {
                    stopAudioPlayback();
                    if (fallback != null && !fallback.isEmpty()) {
                        startAudioPlayback(videoId, fallback, null);
                    } else {
                        translationStarting = false;
                        refreshOriginalAudioVolume();
                        showToastShort(str("morphe_yandex_vot_playback_error"));
                    }
                });
                return true;
            });
            mediaPlayer.set(mp);
            currentTranslatedVideoId.set(videoId != null ? videoId : "");
            notifyTranslationStateChanged();
            if (fallback != null && !fallback.isEmpty()) {
                proxyPrepareTimeoutRunnable = () -> {
                    MediaPlayer p = mediaPlayer.get();
                    if (p != null && p == mp && !p.isPlaying()) {
                        Logger.printDebug(() -> "VOT proxy prepare timeout, retrying direct");
                        Utils.runOnMainThread(() -> {
                            stopAudioPlayback();
                            startAudioPlayback(videoId, fallback, null);
                        });
                    }
                };
                mainHandler.postDelayed(proxyPrepareTimeoutRunnable, PROXY_PREPARE_TIMEOUT_MS);
            }
            mp.prepareAsync();
        } catch (IOException e) {
            Logger.printException(() -> "startAudioPlayback failed for videoId: " + videoId, e);
            Utils.runOnMainThread(() -> {
                if (fallbackUrl != null && !fallbackUrl.isEmpty()) {
                    startAudioPlayback(videoId, fallbackUrl, null);
                } else {
                    translationStarting = false;
                    refreshOriginalAudioVolume();
                    showToastShort(str("morphe_yandex_vot_playback_error"));
                }
            });
        }
    }

    public static void stopAudioPlayback() {
        mainHandler.removeCallbacks(pauseCheckRunnable);
        mainHandler.removeCallbacks(proxyPrepareTimeoutRunnable);
        waitingTimeSeconds = -1;
        translationGeneration.incrementAndGet();
        deleteTempProxyFile();
        MediaPlayer mp = mediaPlayer.getAndSet(null);
        if (mp != null) {
            try {
                if (mp.isPlaying()) mp.stop();
                mp.release();
            } catch (Exception ignored) { }
        }
        currentTranslatedVideoId.set("");
        notifyTranslationStateChanged();
        isPaused = false;
        lastVideoTimeMs = -1;
    }

    public static void pauseAudio() {
        MediaPlayer mp = mediaPlayer.get();
        if (mp != null) {
            try {
                if (mp.isPlaying()) {
                    mp.pause();
                    isPaused = true;
                }
            } catch (Exception ignored) { }
        }
    }

    public static void resumeAudio(long videoTimeMillis) {
        if (VideoState.getCurrent() != VideoState.PLAYING) return;
        MediaPlayer mp = mediaPlayer.get();
        if (mp == null || !isPaused) return;
        try {
            long position = videoTimeMillis >= 0 ? videoTimeMillis : VideoInformation.getVideoTime();
            mp.seekTo((int) position);
            applyPlaybackSpeedToPlayer(mp);
            mp.start();
            isPaused = false;
            // Re-apply VOT volume multiplier — during pause the original volume
            // may have been reset to full by the player (isTranslationActive
            // returns false while paused, so the setVolume hook doesn't duck).
            refreshOriginalAudioVolume();
        } catch (Exception ignored) { }
    }

    /**
     * Applies the current YANDEX_VOT_TRANSLATION_VOLUME setting to the MediaPlayer if translation is playing.
     * Call this when the user changes the volume in the bottom sheet.
     */
    public static void applyVolumeToCurrentPlayer() {
        applyVolumeToCurrentPlayer(YandexVotSettings.YANDEX_VOT_TRANSLATION_VOLUME.get());
    }

    /**
     * Applies the given volume percent (0-100) to the MediaPlayer if translation is playing.
     * @param volumePercent volume in percent (0-100)
     */
    public static void applyVolumeToCurrentPlayer(int volumePercent) {
        MediaPlayer mp = mediaPlayer.get();
        if (mp == null) return;
        float vol = volumePercent / 100.0f;
        try {
            mp.setVolume(vol, vol);
        } catch (Exception ignored) { }
    }

    private static void applyPlaybackSpeedToPlayer(MediaPlayer mp) {
        if (mp == null) return;
        float speed = VideoInformation.getPlaybackSpeed();
        if (speed <= 0f) speed = 1.0f;
        if (speed < 0.25f) speed = 0.25f;
        final float maxSpeed = VideoInformation.PLAYBACK_SPEED_MAXIMUM;
        if (speed > maxSpeed) speed = maxSpeed;
        try {
            PlaybackParams params = mp.getPlaybackParams();
            if (params.getSpeed() == speed) return;
            params.setSpeed(speed);
            mp.setPlaybackParams(params);
        } catch (Exception ignored) { }
    }
}
