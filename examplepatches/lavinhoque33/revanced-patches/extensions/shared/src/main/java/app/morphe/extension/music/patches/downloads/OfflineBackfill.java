/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.music.patches.spoof.SpoofVideoStreamsPatch;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.spoof.ClientType;
import app.morphe.extension.shared.spoof.requests.StreamOrDetailsDataRequest;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Fills in the stored data of the stream copies that were downloaded before the offline replay existed, while the
 * device is online: one copy at a time, with a pause between two, so nothing the user plays is slowed down. The
 * response comes from the request the downloader itself uses, is checked against the copy exactly as the stream
 * swap checks a played one, and is stored the way an online play stores it. A run starts from the app's own
 * navigation, stops as soon as the setting is off or the network is gone, and the next run goes on with what is
 * still missing, so nothing has to be remembered between launches. A copy that fails is tried again after a wait
 * that grows, and is left for the next launch after {@link OfflineBackfillLogic#MAX_FAILURES} failures.
 */
final class OfflineBackfill {
    private static final AtomicBoolean running = new AtomicBoolean();
    private static final OfflineBackfillLogic.Schedule schedule = new OfflineBackfillLogic.Schedule();
    private static final OfflineBackfillLogic.Schedule headerSchedule = new OfflineBackfillLogic.Schedule();
    private static volatile long idleUntil;

    private OfflineBackfill() {}

    /** Starts a run when none is going and the setting and the network allow it. Returns at once. */
    static void kick() {
        if (OfflineBackfillLogic.blockedReason(OfflineReplay.enabled(), Utils.isInternetReachable()) != null) {
            return;
        }
        if (!OfflineBackfillLogic.mayStartAgain(idleUntil, SystemClock.elapsedRealtime())) return;
        if (!running.compareAndSet(false, true)) return;

        Utils.runOnBackgroundThread(OfflineBackfill::run);
    }

    private static void run() {
        int stored = 0;
        int failed = 0;
        try {
            while (true) {
                String blocked = OfflineBackfillLogic.blockedReason(OfflineReplay.enabled(),
                        Utils.isInternetReachable());
                if (blocked != null) {
                    Logger.printInfo(() -> "Backfill: paused, " + blocked);
                    break;
                }

                long now = SystemClock.elapsedRealtime();
                String id = schedule.next(OfflineCopyStore.idsWithoutData(), now);
                String sourceId = id != null ? null
                        : headerSchedule.next(OfflineCopyStore.sourceIdsWithoutTitle(), now);
                if (id == null && sourceId == null) {
                    idleUntil = SystemClock.elapsedRealtime() + OfflineBackfillLogic.IDLE_MILLIS;
                    break;
                }

                String failure = id != null ? backfill(id) : backfillHeader(sourceId);
                OfflineBackfillLogic.Schedule step = id != null ? schedule : headerSchedule;
                String stepId = id != null ? id : sourceId;
                if (failure == null) {
                    step.succeeded(stepId);
                    if (id != null) stored++;
                } else if (Utils.isInternetReachable()) {
                    step.failed(stepId, SystemClock.elapsedRealtime());
                    failed++;
                }
                Thread.sleep(OfflineBackfillLogic.PAUSE_BETWEEN_MILLIS);
            }
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        } catch (Exception ex) {
            Logger.printException(() -> "Backfill: the run stopped", ex);
        } finally {
            running.set(false);
        }

        if (stored > 0 || failed > 0) {
            int storedNow = stored;
            int failedNow = failed;
            Logger.printInfo(() -> "Backfill: summary stored=" + storedNow + " failed=" + failedNow
                    + " remaining=" + OfflineCopyStore.idsWithoutData().size());
        }
    }

    /** @return null once the playlist or album has its title, else why it has none. Logs the outcome. */
    @Nullable
    private static String backfillHeader(String sourceId) {
        try {
            String title = OfflineCopyStore.fillHeader(sourceId);
            Logger.printInfo(() -> "Backfill: source " + sourceId + " title=" + title);
            return null;
        } catch (Exception ex) {
            String failure = ex.getClass().getSimpleName() + " " + ex.getMessage();
            Logger.printInfo(() -> "Backfill: source " + sourceId + " failed:" + failure);
            return failure;
        }
    }

    /** @return null once the copy has stored data, else why it has none. Logs the outcome. */
    @Nullable
    private static String backfill(String videoId) {
        String failure = fetchAndStore(videoId);
        if (failure != null) Logger.printInfo(() -> "Backfill: " + videoId + " failed:" + failure);
        return failure;
    }

    @Nullable
    private static String fetchAndStore(String videoId) {
        try {
            RawAudioFiles.Entry raw = RawAudioStore.find(videoId);
            if (raw == null) return "no copy";

            String failure = "no client answered";
            for (ClientType client : StreamOrDetailsDataRequest.buildClientOrder(
                    SpoofVideoStreamsPatch.getAvailableClients(), Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE.get())) {
                StreamOrDetailsDataRequest request = StreamOrDetailsDataRequest.fetchRequestForDownload(
                        videoId, List.of(client), client);
                StreamOrDetailsDataRequest.StreamData stream = request.getStream();
                if (stream == null) continue;

                PlayerResponse response = PlayerResponse.parseFrom(stream.streamingData());
                Format selected = null;
                for (Format format : response.getStreamingData().getAdaptiveFormatsList()) {
                    if (format.getItag() == raw.itag()) {
                        selected = format;
                        break;
                    }
                }
                if (selected == null) {
                    failure = "itag " + raw.itag() + " missing";
                    continue;
                }

                String mismatch = StreamSwapLogic.mismatch(raw, selected, response);
                if (mismatch != null) {
                    failure = mismatch;
                    continue;
                }

                // The setting may have been turned off while the request was out.
                if (!OfflineReplay.enabled()) return "setting off";

                OfflineCopyStore.Outcome outcome = OfflineCopyStore.storeBackfilled(videoId,
                        stream.streamingData(), raw.itag());
                if (outcome.written() == null) return outcome.reason();

                int bytes = outcome.written().responseBytes();
                Logger.printInfo(() -> "Backfill: " + videoId + " stored=" + bytes);
                StreamDownloads.readinessChanged();
                return null;
            }
            return failure;
        } catch (Exception ex) {
            return ex.getClass().getSimpleName() + " " + ex.getMessage();
        }
    }
}
