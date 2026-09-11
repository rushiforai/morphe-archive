/*
 * Copyright (C) 2026 anddea
 *
 * This file is derived from the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 *
 * Modified for Dual VoT Patches and Morphe.
 * The standalone ANDROID_VR stream fallback previously adapted from the MIT-licensed
 * ilyhalight/voice-over-translation project was removed: audio now comes only from the
 * playing session's streaming data (see the class comment below).
 *
 * Licensed under the GNU General Public License v3.0.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Ports or substantial
 *    modifications must retain historical authorship credit in version control.
 *
 * 4. User Interface Attribution (Section 7(b)): Derived works must maintain a
 *    visible acknowledgment to the original author(s) in the application UI.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import android.net.Uri;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.shared.innertube.utils.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.utils.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.spoof.SpoofVideoStreamsPatch;
import app.morphe.extension.shared.spoof.potoken.PoTokenManager;
import app.morphe.extension.shared.spoof.requests.StreamingDataRequest;

/**
 * Uploads the original compressed audio track of the currently playing video to Yandex in
 * ordered parts of {@link YandexVotAudioParts#PART_SIZE_BYTES}.
 *
 * <p><b>Implemented here.</b> A matching live player request is preferred when available.
 * Otherwise an existing direct-DASH spoof response is reused, or an on-demand non-SABR player
 * response is obtained through Morphe's supported TV/JS/PoToken request stack. This works
 * independently of the user's stream-spoof setting and does not restore the obsolete standalone
 * ANDROID_VR watch-page scraper. Low-bitrate Opus remains preferred. The complete
 * byte-addressable response is streamed in validated bounded parts; signed URLs, cookies,
 * tokens and private request headers are never logged or persisted.
 *
 * <p>A body-carrying SABR request is deliberately never treated as raw audio. Direct sources
 * still fail closed with {@link YandexVotAudioResult#SOURCE_DENIED} if a later byte range is not
 * authorized; no prefix or empty file is uploaded.
 */
final class YandexVotAudioDownloader {
    /**
     * Safety net for the whole acquisition + upload run. Every network operation is also
     * individually bounded by the connect/read timeouts and re-checked between reads, so a
     * stalled or slowly trickling run ends in bounded time instead of waiting forever.
     */
    private static final long OVERALL_TRANSFER_DEADLINE_MS = 15 * 60 * 1000L;

    private static final String AUDIO_DOWNLOAD_TYPE = "web_api_steal_sig_and_n";
    private static final String CPN_ALPHABET =
            "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_";
    private static final SecureRandom CPN_RANDOM = new SecureRandom();
    private record AudioFormatInfo(
            String url,
            int itag,
            long fileSize,
            String mimeType,
            int bitrate
    ) {
    }

    /** A cached protobuf format paired with the exact live player request that can deliver it. */
    private record CapturedAudioFormat(
            Format format,
            YandexVotPlayerMediaTransport.Snapshot mediaRequest
    ) {
    }

    private record ResolvedAudioFormat(
            Format format,
            @Nullable YandexVotPlayerMediaTransport.Snapshot mediaRequest,
            @Nullable String clientUserAgent,
            String sourceMode
    ) {
    }

    private record DirectAudioFormat(Format format, String clientUserAgent) {
    }

    /** Pure format metadata used to select among only the requests the active player opened. */
    static record AudioCandidate(int itag, String url, String mimeType, int bitrate) {
    }

    static record CapturedAudioCandidate(
            AudioCandidate candidate,
            YandexVotPlayerMediaTransport.Snapshot mediaRequest
    ) {
    }

    interface ProgressListener {
        boolean isCancelled();

        void onPreparing();

        void onUploading(int part, int totalParts);
    }

    private YandexVotAudioDownloader() {
    }

    static YandexVotAudioResult downloadAndSend(
            String videoId,
            String videoUrl,
            String translationId,
            ProgressListener listener
    ) {
        boolean spoofIncluded = SpoofVideoStreamsPatch.isPatchIncluded();
        boolean spoofSetting = SharedYouTubeSettings.SPOOF_VIDEO_STREAMS.get();
        boolean externalPoTokenSetting = SharedYouTubeSettings.EXTERNAL_POTOKEN_PROVIDER.get();
        YandexVotDiagnostics.sourceEnvironment(
                spoofIncluded,
                spoofSetting,
                externalPoTokenSetting,
                YandexVotPlayerMediaTransport.snapshotCount());
        YandexVotPlayerMediaTransport.logDiagnosticSummary();
        YandexVotDiagnostics.source("enter", -1, YandexVotPlayerMediaTransport.snapshotCount());
        if (isEmpty(videoId) || isEmpty(videoUrl) || isEmpty(translationId)) {
            return finish(YandexVotAudioResult.SOURCE_UNAVAILABLE);
        }
        if (listener == null || listener.isCancelled()) {
            return finish(YandexVotAudioResult.CANCELLED);
        }

        try {
            listener.onPreparing();
            ResolvedAudioFormat resolvedAudio = resolveAudioFormat(
                    videoId,
                    shouldRefreshDedicatedPoToken(
                            spoofIncluded, spoofSetting, externalPoTokenSetting));
            if (listener.isCancelled()) return finish(YandexVotAudioResult.CANCELLED);
            if (resolvedAudio == null || isEmpty(resolvedAudio.format().getUrl())) {
                return finish(YandexVotAudioResult.SOURCE_UNAVAILABLE);
            }

            Format cachedFormat = resolvedAudio.format();
            String sourceUrl = resolvedAudio.mediaRequest() == null
                    ? addCpn(cachedFormat.getUrl())
                    : resolvedAudio.mediaRequest().url;
            AudioFormatInfo audioFormat = new AudioFormatInfo(
                    cachedFormat.getUrl(),
                    cachedFormat.getItag(),
                    -1,
                    cachedFormat.getMimeType(),
                    getBitrate(cachedFormat)
            );
            YandexVotDiagnostics.source(
                    "selected-" + resolvedAudio.sourceMode(),
                    audioFormat.itag(),
                    YandexVotPlayerMediaTransport.snapshotCount());

            String audioUrl = sourceUrl;
            YandexVotHttpAudioPartReader.Factory mediaFactory = resolvedAudio.mediaRequest() == null
                    ? YandexVotHttpAudioPartReader.factoryForUserAgent(
                            resolvedAudio.clientUserAgent())
                    : YandexVotPlayerMediaTransport.factoryFor(resolvedAudio.mediaRequest());
            long fileSize = parseClen(audioUrl);
            if (fileSize <= 0) {
                // The MediaDataSource URL can omit clen while the cached player format has it.
                fileSize = parseClen(audioFormat.url());
            }
            if (fileSize <= 0) {
                try {
                    fileSize = YandexVotHttpAudioPartReader.probeTotalSize(
                            audioUrl, mediaFactory);
                } catch (YandexVotAudioTransfer.SourceDeniedException ex) {
                    return finish(YandexVotAudioResult.SOURCE_DENIED);
                } catch (IOException ex) {
                    return finish(YandexVotAudioResult.SOURCE_READ_FAILED);
                }
            }
            if (listener.isCancelled()) return finish(YandexVotAudioResult.CANCELLED);
            if (fileSize <= 0) {
                return finish(YandexVotAudioResult.SOURCE_UNAVAILABLE);
            }

            final long resolvedFileSize = fileSize;
            int parts = YandexVotAudioParts.partCount(resolvedFileSize);
            String fileId = makeFileId(audioFormat.itag(), resolvedFileSize);

            final long deadlineMs = android.os.SystemClock.elapsedRealtime()
                    + OVERALL_TRANSFER_DEADLINE_MS;
            YandexVotAudioTransfer.Deadline deadline =
                    () -> android.os.SystemClock.elapsedRealtime() >= deadlineMs;
            YandexVotAudioTransfer.PartReader reader =
                    new YandexVotHttpAudioPartReader(audioUrl, resolvedFileSize, mediaFactory);

            YandexVotAudioTransfer.Progress progress = new YandexVotAudioTransfer.Progress() {
                @Override
                public boolean isCancelled() {
                    return listener.isCancelled();
                }

                @Override
                public void onUploading(int part, int totalParts) {
                    listener.onUploading(part, totalParts);
                }
            };

            YandexVotAudioResult result = YandexVotAudioTransfer.run(
                    resolvedFileSize,
                    reader,
                    fileId,
                    new YandexVotApiUploader(videoUrl, translationId),
                    progress,
                    deadline
            );
            return finish(result);
        } catch (Exception e) {
            // Never expose the signed source URL or its host details. Fail the acquisition
            // with the generic source category and keep the exact cause out of logs.
            return finish(YandexVotAudioResult.SOURCE_READ_FAILED);
        }
    }

    private static YandexVotAudioResult finish(YandexVotAudioResult result) {
        YandexVotDiagnostics.source(
                "exit-" + result.name().toLowerCase(Locale.US).replace('_', '-'),
                -1,
                YandexVotPlayerMediaTransport.snapshotCount());
        return result;
    }

    /**
     * Resolves the best audio-only format. A separate request is started only after the user
     * asks for Yandex translation and only when neither the player transport nor the shared
     * spoof response exposes a byte-addressable audio URL.
     */
    @Nullable
    private static ResolvedAudioFormat resolveAudioFormat(
            String videoId,
            boolean refreshDedicatedPoToken
    ) throws Exception {
        StreamingDataRequest sharedRequest = StreamingDataRequest.getRequestForVideoId(videoId);

        CapturedAudioFormat captured = getCapturedAudioFormat(videoId, sharedRequest);
        if (captured != null) {
            return new ResolvedAudioFormat(
                    captured.format(), captured.mediaRequest(), null, "player-transport");
        }

        DirectAudioFormat sharedDirect = getDirectAudioFormat(sharedRequest, "shared");
        if (sharedDirect != null) {
            return new ResolvedAudioFormat(
                    sharedDirect.format(), null, sharedDirect.clientUserAgent(), "shared-direct");
        }

        if (refreshDedicatedPoToken) {
            // TV Simply's player PoToken is bound to the video. The shared Morphe cache is
            // process-wide, so force a fresh binding only for this isolated fallback request.
            PoTokenManager.reset();
            YandexVotDiagnostics.source(
                    "dedicated-potoken-refresh", -1,
                    YandexVotPlayerMediaTransport.snapshotCount());
        }
        StreamingDataRequest directRequest =
                YandexVotPlayerMediaTransport.requestDirectStreams(videoId);
        DirectAudioFormat requestedDirect = getDirectAudioFormat(directRequest, "dedicated");
        if (requestedDirect != null) {
            return new ResolvedAudioFormat(
                    requestedDirect.format(), null, requestedDirect.clientUserAgent(),
                    "dedicated-direct");
        }
        return null;
    }

    static boolean shouldRefreshDedicatedPoToken(
            boolean spoofIncluded,
            boolean spoofSetting,
            boolean externalPoTokenSetting
    ) {
        return spoofIncluded && !spoofSetting && externalPoTokenSetting;
    }

    @Nullable
    private static DirectAudioFormat getDirectAudioFormat(
            @Nullable StreamingDataRequest request,
            String sourceMode
    ) throws IOException {
        if (request == null) {
            YandexVotDiagnostics.source(
                    sourceMode + "-response-missing", -1,
                    YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }
        StreamingDataRequest.StreamData streamData = request.getStream();
        if (streamData == null || streamData.streamingData() == null
                || streamData.streamingData().length == 0) {
            YandexVotDiagnostics.source(
                    sourceMode + "-response-empty", -1,
                    YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }
        if (streamData.usesSabr()) {
            YandexVotDiagnostics.source(
                    sourceMode + "-sabr-response-ignored", -1,
                    YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }
        try {
            PlayerResponse playerResponse = PlayerResponse.parseFrom(streamData.streamingData());
            if (!playerResponse.hasStreamingData()) return null;
            Format selected = selectBestAudioFormat(
                    playerResponse.getStreamingData().getAdaptiveFormatsList());
            YandexVotDiagnostics.source(
                    selected == null
                            ? sourceMode + "-no-direct-audio"
                            : sourceMode + "-direct-audio-ready",
                    selected == null ? -1 : selected.getItag(),
                    YandexVotPlayerMediaTransport.snapshotCount());
            return selected == null
                    ? null
                    : new DirectAudioFormat(selected, streamData.clientUserAgent());
        } catch (Exception e) {
            YandexVotDiagnostics.source(
                    sourceMode + "-response-unparseable", -1,
                    YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }
    }

    @Nullable
    private static CapturedAudioFormat getCapturedAudioFormat(
            String videoId,
            @Nullable StreamingDataRequest request
    ) throws IOException {
        if (request == null) {
            YandexVotDiagnostics.source(
                    "no-cached-player-response", -1, YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }

        StreamingDataRequest.StreamData streamData = request.getStream();
        if (streamData == null) {
            YandexVotDiagnostics.source(
                    "player-response-loading", -1, YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }

        byte[] playerResponseBytes = streamData.streamingData();
        if (playerResponseBytes == null || playerResponseBytes.length == 0) {
            YandexVotDiagnostics.source(
                    "empty-streaming-data", -1, YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }

        PlayerResponse playerResponse;
        try {
            playerResponse = PlayerResponse.parseFrom(playerResponseBytes);
        } catch (Exception e) {
            YandexVotDiagnostics.source(
                    "unparseable-player-response", -1, YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }
        if (!playerResponse.hasStreamingData()) {
            YandexVotDiagnostics.source(
                    "no-streaming-data", -1, YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }

        return selectBestCapturedAudioFormat(
                videoId, playerResponse.getStreamingData().getAdaptiveFormatsList());
    }

    @Nullable
    private static CapturedAudioFormat selectBestCapturedAudioFormat(
            String videoId,
            List<Format> formats
    ) {
        List<AudioCandidate> candidates = new ArrayList<>();
        for (Format format : formats) {
            if (isEmpty(format.getUrl()) || !isAudioFormat(format)) continue;
            candidates.add(new AudioCandidate(
                    format.getItag(), format.getUrl(), format.getMimeType(), getBitrate(format)));
        }

        if (candidates.isEmpty()) {
            YandexVotDiagnostics.source(
                    "no-audio-formats", -1, YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }

        CapturedAudioCandidate selected = selectBestCapturedAudioCandidate(videoId, candidates);
        if (selected == null) {
            YandexVotDiagnostics.source(
                    "no-matching-media-request", -1, YandexVotPlayerMediaTransport.snapshotCount());
            return null;
        }
        for (Format format : formats) {
            if (format.getItag() == selected.candidate().itag()
                    && selected.candidate().url().equals(format.getUrl())) {
                return new CapturedAudioFormat(format, selected.mediaRequest());
            }
        }
        return null;
    }

    @Nullable
    static CapturedAudioCandidate selectBestCapturedAudioCandidate(
            String videoId,
            List<AudioCandidate> candidates
    ) {
        CapturedAudioCandidate bestOpus = null;
        int bestOpusBitrate = Integer.MAX_VALUE;
        CapturedAudioCandidate bestOther = null;
        int bestOtherBitrate = Integer.MAX_VALUE;

        for (AudioCandidate candidate : candidates) {
            if (isEmpty(candidate.url())) continue;

            YandexVotPlayerMediaTransport.Snapshot mediaRequest =
                    YandexVotPlayerMediaTransport.findForFormat(
                            videoId, candidate.itag(), candidate.url());
            if (mediaRequest == null) continue;

            int bitrate = candidate.bitrate();
            boolean opus = candidate.mimeType() != null
                    && candidate.mimeType().toLowerCase(Locale.US).contains("opus");
            if (opus) {
                if (bestOpus == null || bitrate < bestOpusBitrate) {
                    bestOpus = new CapturedAudioCandidate(candidate, mediaRequest);
                    bestOpusBitrate = bitrate;
                }
            } else if (bestOther == null || bitrate < bestOtherBitrate) {
                bestOther = new CapturedAudioCandidate(candidate, mediaRequest);
                bestOtherBitrate = bitrate;
            }
        }

        return bestOpus != null ? bestOpus : bestOther;
    }

    @Nullable
    static Format selectBestAudioFormat(List<Format> formats) {
        List<AudioCandidate> candidates = new ArrayList<>();
        for (Format format : formats) {
            if (isEmpty(format.getUrl()) || !isAudioFormat(format)) continue;
            candidates.add(new AudioCandidate(
                    format.getItag(), format.getUrl(), format.getMimeType(), getBitrate(format)));
        }
        AudioCandidate selected = selectBestDirectAudioCandidate(candidates);
        if (selected == null) return null;
        for (Format format : formats) {
            if (format.getItag() == selected.itag()
                    && selected.url().equals(format.getUrl())) {
                return format;
            }
        }
        return null;
    }

    @Nullable
    static AudioCandidate selectBestDirectAudioCandidate(List<AudioCandidate> candidates) {
        AudioCandidate bestOpus = null;
        int bestOpusBitrate = Integer.MAX_VALUE;
        AudioCandidate bestOther = null;
        int bestOtherBitrate = Integer.MAX_VALUE;

        for (AudioCandidate candidate : candidates) {
            if (candidate == null || isEmpty(candidate.url())) continue;
            int bitrate = candidate.bitrate();
            boolean opus = candidate.mimeType() != null
                    && candidate.mimeType().toLowerCase(Locale.US).contains("opus");
            if (opus) {
                if (bestOpus == null || bitrate < bestOpusBitrate) {
                    bestOpus = candidate;
                    bestOpusBitrate = bitrate;
                }
            } else if (bestOther == null || bitrate < bestOtherBitrate) {
                bestOther = candidate;
                bestOtherBitrate = bitrate;
            }
        }
        return bestOpus != null ? bestOpus : bestOther;
    }

    private static boolean isAudioFormat(Format format) {
        String mimeType = format.getMimeType();
        if (mimeType != null && mimeType.startsWith("audio/")) return true;

        return switch (format.getItag()) {
            case 139, 140, 141, 171, 172, 249, 250, 251, 599, 600, 774 -> true;
            default -> false;
        };
    }

    private static int getBitrate(Format format) {
        int bitrate = format.getAverageBitrate() > 0
                ? format.getAverageBitrate()
                : format.getBitrate();
        return bitrate > 0 ? bitrate : Integer.MAX_VALUE - 1;
    }

    /** Uploads a whole part to Yandex using the existing validated protocol calls. */
    private record YandexVotApiUploader(String videoUrl, String translationId)
            implements YandexVotAudioTransfer.PartUploader {
        @Override
        public boolean uploadPart(String fileId, int totalParts, int partIndex, byte[] partData) {
            YandexVotDiagnostics.uploadPart("start", partIndex + 1, totalParts, null);
            boolean accepted;
            if (totalParts <= 1) {
                accepted = YandexVotApiClient.sendAudio(
                        videoUrl, translationId, fileId, partData);
            } else {
                accepted = YandexVotApiClient.sendPartialAudio(
                        videoUrl, translationId, fileId, totalParts, 1, partIndex, partData);
            }
            YandexVotDiagnostics.uploadPart("result", partIndex + 1, totalParts, accepted);
            return accepted;
        }
    }

    private static long parseClen(String audioUrl) {
        int queryStart = audioUrl.indexOf('?');
        if (queryStart < 0 || queryStart == audioUrl.length() - 1) return -1;

        String query = audioUrl.substring(queryStart + 1);
        String[] params = query.split("&");
        for (String param : params) {
            if (!param.startsWith("clen=")) continue;
            try {
                return Long.parseLong(param.substring(5));
            } catch (NumberFormatException ignored) {
                return -1;
            }
        }
        return -1;
    }

    private static String makeFileId(int itag, long fileSize) {
        return String.format(
                Locale.US,
                "{\"downloadType\":\"%s\",\"itag\":%d,\"minChunkSize\":%d,\"fileSize\":\"%d\"}",
                AUDIO_DOWNLOAD_TYPE,
                itag,
                YandexVotAudioParts.PART_SIZE_BYTES,
                fileSize
        );
    }

    private static String addCpn(String audioUrl) {
        Uri uri = Uri.parse(audioUrl);
        if (!isEmpty(uri.getQueryParameter("cpn"))) return audioUrl;
        return uri.buildUpon().appendQueryParameter("cpn", makeCpn()).build().toString();
    }

    private static String makeCpn() {
        StringBuilder cpn = new StringBuilder(16);
        for (int i = 0; i < 16; i++) {
            cpn.append(CPN_ALPHABET.charAt(CPN_RANDOM.nextInt(CPN_ALPHABET.length())));
        }
        return cpn.toString();
    }

    private static boolean isEmpty(@Nullable String value) {
        return value == null || value.isEmpty();
    }
}
