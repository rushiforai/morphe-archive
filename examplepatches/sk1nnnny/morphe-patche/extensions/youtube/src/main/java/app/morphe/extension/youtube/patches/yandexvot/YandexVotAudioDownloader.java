// https://github.com/anddea/revanced-patches/blob/84e91edb3d6afb3cbb058cb9dd56e375ac2bd62c/extensions/shared/src/main/java/app/morphe/extension/youtube/patches/voiceovertranslation/VotAudioDownloader.java
/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 *
 * Licensed under the GNU General Public License v3.0.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 - Attribution Notice
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

import android.net.Uri;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.spoof.requests.StreamingDataRequest;

import org.json.JSONArray;
import org.json.JSONObject;

final class YandexVotAudioDownloader {
    private static final int CHUNK_SIZE_BYTES = 5_295_308;
    private static final int CONNECTION_TIMEOUT_MS = 15_000;
    private static final int READ_TIMEOUT_MS = 30_000;
    private static final String AUDIO_DOWNLOAD_TYPE = "web_api_steal_sig_and_n";
    private static final String USER_AGENT =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " +
                    "(KHTML, like Gecko) Chrome/134.0.0.0 YaBrowser/25.4.0.0 Safari/537.36";
    private static final String YOUTUBE_BASE_URL = "https://m.youtube.com";
    private static final String YOUTUBE_CLIENT_NAME = "ANDROID_VR";
    private static final String YOUTUBE_CLIENT_VERSION = "1.65.10";
    private static final String YOUTUBE_CLIENT_USER_AGENT =
            "com.google.android.apps.youtube.vr.oculus/1.65.10 " +
                    "(Linux; U; Android 12L; eureka-user Build/SQ3A.220605.009.A1) gzip";
    private static final Pattern YOUTUBE_API_KEY_PATTERN =
            Pattern.compile("[\"']INNERTUBE_API_KEY[\"']\\s*:\\s*[\"']([^\"']+)[\"']");
    private static final Pattern YOUTUBE_STS_PATTERN =
            Pattern.compile("[\"']STS[\"']\\s*:\\s*(\\d+)");
    private static final Pattern YOUTUBE_VISITOR_DATA_PATTERN =
            Pattern.compile("[\"'](?:VISITOR_DATA|visitorData)[\"']\\s*:\\s*[\"']([^\"']+)[\"']");
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

    private record WatchContext(
            String apiKey,
            int signatureTimestamp,
            String visitorData
    ) {
    }

    interface ProgressListener {
        boolean isCancelled();

        void onPreparing();

        void onUploading(int part, int totalParts);
    }

    private YandexVotAudioDownloader() {
    }

    static boolean downloadAndSend(
            String videoId,
            String videoUrl,
            String translationId,
            ProgressListener listener
    ) {
        if (isEmpty(videoId) || isEmpty(videoUrl) || isEmpty(translationId)) return false;
        if (listener.isCancelled()) return false;

        try {
            listener.onPreparing();
            AudioFormatInfo audioFormat = fetchAudioFormat(videoId);
            if (listener.isCancelled()) return false;
            if (audioFormat == null || isEmpty(audioFormat.url())) {
                Logger.printDebug(() -> "Yandex VOT audio upload: no audio format for " + videoId);
                return false;
            }

            String audioUrl = audioFormat.url();
            long fileSize = audioFormat.fileSize() > 0
                    ? audioFormat.fileSize()
                    : resolveFileSize(audioUrl);
            if (listener.isCancelled()) return false;
            if (fileSize <= 0) {
                Logger.printDebug(() -> "Yandex VOT audio upload: unknown audio size for " + videoId);
                return false;
            }

            Logger.printDebug(() -> "Yandex VOT audio upload: selected itag="
                    + audioFormat.itag() + ", mime=" + audioFormat.mimeType()
                    + ", bitrate=" + audioFormat.bitrate() + ", bytes=" + fileSize);
            String fileId = makeFileId(audioFormat.itag(), fileSize);
            int parts = toPartsCount(fileSize);
            if (parts <= 1) {
                listener.onUploading(1, 1);
                byte[] audioData = downloadRange(audioUrl, 0, fileSize - 1);
                return !listener.isCancelled()
                        && YandexVotApiClient.sendAudio(
                                videoUrl, translationId, fileId, audioData);
            }

            for (int i = 0; i < parts; i++) {
                if (listener.isCancelled()) return false;
                listener.onUploading(i + 1, parts);
                long start = (long) i * CHUNK_SIZE_BYTES;
                long end = Math.min(fileSize - 1, start + CHUNK_SIZE_BYTES - 1);
                byte[] audioData = downloadRange(audioUrl, start, end);
                if (listener.isCancelled()
                        || !YandexVotApiClient.sendPartialAudio(
                                videoUrl, translationId, fileId, parts, 1, i, audioData)) {
                    return false;
                }
            }

            return true;
        } catch (Exception e) {
            Logger.printException(() -> "Yandex VOT audio upload failed for " + videoId, e);
            return false;
        }
    }

    @Nullable
    private static AudioFormatInfo fetchAudioFormat(String videoId) throws Exception {
        StreamingDataRequest request = StreamingDataRequest.getRequestForVideoId(videoId);
        Format cachedFormat = getAudioFormat(request);
        if (cachedFormat != null) {
            return new AudioFormatInfo(
                    addCpn(cachedFormat.getUrl()),
                    cachedFormat.getItag(),
                    -1,
                    cachedFormat.getMimeType(),
                    getBitrate(cachedFormat)
            );
        }

        // Do not start another Morphe spoof-stream request here. Such a request
        // does not have the headers captured from YouTube and can fail with the
        // unrelated "no client streams" playback toast. Resolve a dedicated,
        // audio-only ANDROID_VR stream instead.
        return fetchAudioFormatFromYouTube(videoId);
    }

    @Nullable
    private static Format getAudioFormat(@Nullable StreamingDataRequest request) throws IOException {
        if (request == null) return null;

        StreamingDataRequest.StreamData streamData = request.getStream();
        if (streamData == null) return null;

        byte[] playerResponseBytes = streamData.streamingData();
        if (playerResponseBytes == null || playerResponseBytes.length == 0) return null;

        PlayerResponse playerResponse = PlayerResponse.parseFrom(playerResponseBytes);
        if (!playerResponse.hasStreamingData()) return null;

        return selectBestAudioFormat(playerResponse.getStreamingData().getAdaptiveFormatsList());
    }

    @Nullable
    private static Format selectBestAudioFormat(List<Format> formats) {
        Format bestOpus = null;
        int bestOpusBitrate = Integer.MAX_VALUE;
        Format bestOther = null;
        int bestOtherBitrate = Integer.MAX_VALUE;

        for (Format format : formats) {
            if (isEmpty(format.getUrl()) || !isAudioFormat(format)) continue;

            int bitrate = getBitrate(format);
            boolean opus = format.getMimeType().toLowerCase(Locale.US).contains("opus");
            if (opus) {
                if (bestOpus == null || bitrate < bestOpusBitrate) {
                    bestOpus = format;
                    bestOpusBitrate = bitrate;
                }
            } else if (bestOther == null || bitrate < bestOtherBitrate) {
                bestOther = format;
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

    @Nullable
    private static AudioFormatInfo fetchAudioFormatFromYouTube(String videoId) throws Exception {
        WatchContext watchContext = fetchWatchContext(videoId);
        JSONObject client = new JSONObject();
        client.put("clientName", YOUTUBE_CLIENT_NAME);
        client.put("clientVersion", YOUTUBE_CLIENT_VERSION);
        client.put("hl", "en");
        client.put("gl", "US");
        client.put("androidSdkVersion", 32);
        client.put("osName", "Android");
        client.put("osVersion", "12L");
        client.put("platform", "MOBILE");
        if (!isEmpty(watchContext.visitorData())) {
            client.put("visitorData", watchContext.visitorData());
        }

        JSONObject body = new JSONObject();
        body.put("context", new JSONObject().put("client", client));
        body.put("videoId", videoId);
        body.put("contentCheckOk", true);
        body.put("racyCheckOk", true);
        if (watchContext.signatureTimestamp() > 0) {
            JSONObject contentPlaybackContext = new JSONObject()
                    .put("signatureTimestamp", watchContext.signatureTimestamp());
            body.put(
                    "playbackContext",
                    new JSONObject().put("contentPlaybackContext", contentPlaybackContext)
            );
        }

        String endpoint = YOUTUBE_BASE_URL + "/youtubei/v1/player?key="
                + watchContext.apiKey();
        HttpURLConnection connection = (HttpURLConnection) new URL(endpoint).openConnection();
        try {
            connection.setRequestMethod("POST");
            setYouTubeHeaders(connection);
            connection.setRequestProperty("Content-Type", "application/json");
            if (!isEmpty(watchContext.visitorData())) {
                connection.setRequestProperty("X-Goog-Visitor-Id", watchContext.visitorData());
            }
            connection.setConnectTimeout(CONNECTION_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setDoOutput(true);
            byte[] requestBody = body.toString().getBytes(StandardCharsets.UTF_8);
            connection.setFixedLengthStreamingMode(requestBody.length);
            try (OutputStream output = connection.getOutputStream()) {
                output.write(requestBody);
            }

            int responseCode = connection.getResponseCode();
            if (responseCode != HttpURLConnection.HTTP_OK) {
                throw new IOException("YouTube player request failed: HTTP " + responseCode);
            }

            JSONObject response;
            try (InputStream input = connection.getInputStream()) {
                response = new JSONObject(new String(readAllBytes(input), StandardCharsets.UTF_8));
            }
            JSONObject streamingData = response.optJSONObject("streamingData");
            if (streamingData == null) return null;
            return selectBestJsonAudioFormat(streamingData.optJSONArray("adaptiveFormats"));
        } catch (RuntimeException e) {
            throw new IOException("Could not parse YouTube player response", e);
        } finally {
            connection.disconnect();
        }
    }

    private static WatchContext fetchWatchContext(String videoId) throws IOException {
        String watchUrl = YOUTUBE_BASE_URL + "/watch?v=" + videoId + "&hl=en";
        HttpURLConnection connection = (HttpURLConnection) new URL(watchUrl).openConnection();
        try {
            connection.setRequestMethod("GET");
            setYouTubeHeaders(connection);
            connection.setConnectTimeout(CONNECTION_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            int responseCode = connection.getResponseCode();
            if (responseCode != HttpURLConnection.HTTP_OK) {
                throw new IOException("YouTube watch page failed: HTTP " + responseCode);
            }
            String html;
            try (InputStream input = connection.getInputStream()) {
                html = new String(readAllBytes(input), StandardCharsets.UTF_8);
            }
            String apiKey = findFirst(html, YOUTUBE_API_KEY_PATTERN);
            if (isEmpty(apiKey)) {
                throw new IOException("YouTube API key was not found");
            }
            String sts = findFirst(html, YOUTUBE_STS_PATTERN);
            int signatureTimestamp = 0;
            if (!isEmpty(sts)) {
                try {
                    signatureTimestamp = Integer.parseInt(sts);
                } catch (NumberFormatException ignored) {
                }
            }
            String visitorData = decodeEscapedJsonString(
                    findFirst(html, YOUTUBE_VISITOR_DATA_PATTERN)
            );
            return new WatchContext(apiKey, signatureTimestamp, visitorData);
        } finally {
            connection.disconnect();
        }
    }

    @Nullable
    private static AudioFormatInfo selectBestJsonAudioFormat(@Nullable JSONArray formats) {
        if (formats == null) return null;

        AudioFormatInfo bestOpus = null;
        AudioFormatInfo bestOther = null;
        for (int i = 0; i < formats.length(); i++) {
            JSONObject format = formats.optJSONObject(i);
            if (format == null) continue;
            String url = format.optString("url", "");
            String mimeType = format.optString("mimeType", "");
            if (isEmpty(url) || !mimeType.toLowerCase(Locale.US).startsWith("audio/")) {
                continue;
            }
            long fileSize = parsePositiveLong(format.optString("contentLength", ""));
            if (fileSize <= 0) continue;
            AudioFormatInfo candidate = new AudioFormatInfo(
                    addCpn(url),
                    format.optInt("itag", 0),
                    fileSize,
                    mimeType,
                    Math.max(0, format.optInt("bitrate", 0))
            );
            boolean opus = mimeType.toLowerCase(Locale.US).contains("opus");
            if (opus) {
                if (bestOpus == null || compareBitrate(candidate, bestOpus) < 0) {
                    bestOpus = candidate;
                }
            } else if (bestOther == null || compareBitrate(candidate, bestOther) < 0) {
                bestOther = candidate;
            }
        }
        return bestOpus != null ? bestOpus : bestOther;
    }

    private static int compareBitrate(AudioFormatInfo left, AudioFormatInfo right) {
        int leftBitrate = left.bitrate() > 0 ? left.bitrate() : Integer.MAX_VALUE;
        int rightBitrate = right.bitrate() > 0 ? right.bitrate() : Integer.MAX_VALUE;
        return Integer.compare(leftBitrate, rightBitrate);
    }

    private static void setYouTubeHeaders(HttpURLConnection connection) {
        connection.setRequestProperty("Accept", "*/*");
        connection.setRequestProperty("Accept-Encoding", "identity");
        connection.setRequestProperty("Origin", YOUTUBE_BASE_URL);
        connection.setRequestProperty("Referer", YOUTUBE_BASE_URL + "/");
        connection.setRequestProperty("User-Agent", YOUTUBE_CLIENT_USER_AGENT);
    }

    private static byte[] readAllBytes(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int read;
        while ((read = input.read(buffer)) != -1) {
            output.write(buffer, 0, read);
        }
        return output.toByteArray();
    }

    @Nullable
    private static String findFirst(String text, Pattern pattern) {
        Matcher matcher = pattern.matcher(text);
        return matcher.find() ? matcher.group(1) : null;
    }

    private static String decodeEscapedJsonString(@Nullable String value) {
        if (value == null) return "";
        return value.replace("\\u0026", "&").replace("\\/", "/");
    }

    private static long parsePositiveLong(@Nullable String value) {
        if (value == null || value.isEmpty()) return -1;
        try {
            long parsed = Long.parseLong(value);
            return parsed > 0 ? parsed : -1;
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    private static String addCpn(String audioUrl) {
        return Uri.parse(audioUrl)
                .buildUpon()
                .appendQueryParameter("cpn", makeCpn())
                .build()
                .toString();
    }

    private static String makeCpn() {
        StringBuilder cpn = new StringBuilder(16);
        for (int i = 0; i < 16; i++) {
            cpn.append(CPN_ALPHABET.charAt(CPN_RANDOM.nextInt(CPN_ALPHABET.length())));
        }
        return cpn.toString();
    }

    private static long resolveFileSize(String audioUrl) throws IOException {
        long size = parseClen(audioUrl);
        if (size > 0) return size;

        HttpURLConnection connection = openAudioConnection(audioUrl, 0, 0);
        try {
            int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_PARTIAL) {
                size = parseContentRangeSize(connection.getHeaderField("Content-Range"));
                if (size > 0) return size;
            }

            long contentLength = connection.getContentLengthLong();
            return contentLength > 0 ? contentLength : -1;
        } finally {
            connection.disconnect();
        }
    }

    private static byte[] downloadRange(String audioUrl, long start, long end) throws IOException {
        long expectedSize = end - start + 1;
        if (expectedSize <= 0 || expectedSize > Integer.MAX_VALUE) {
            throw new IOException("Invalid audio range size: " + expectedSize);
        }

        HttpURLConnection connection = openAudioConnection(audioUrl, start, end);
        try {
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_PARTIAL && code != HttpURLConnection.HTTP_OK) {
                throw new IOException("Audio download failed: HTTP " + code);
            }
            if (code == HttpURLConnection.HTTP_OK && start > 0) {
                throw new IOException("Audio server ignored range request");
            }

            try (InputStream inputStream = connection.getInputStream()) {
                byte[] bytes = readBytes(inputStream, expectedSize);
                if (bytes.length != expectedSize) {
                    throw new IOException(
                            "Incomplete audio range: expected " + expectedSize
                                    + " bytes, got " + bytes.length
                    );
                }
                return bytes;
            }
        } finally {
            connection.disconnect();
        }
    }

    private static HttpURLConnection openAudioConnection(
            String audioUrl,
            long start,
            long end
    ) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(audioUrl).openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Range", "bytes=" + start + "-" + end);
        connection.setRequestProperty("Accept", "*/*");
        connection.setRequestProperty("Accept-Encoding", "identity");
        connection.setRequestProperty("User-Agent", USER_AGENT);
        connection.setConnectTimeout(CONNECTION_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        connection.setInstanceFollowRedirects(true);
        return connection;
    }

    private static byte[] readBytes(InputStream inputStream, long expectedSize) throws IOException {
        ByteArrayOutputStream out =
                new ByteArrayOutputStream((int) Math.min(expectedSize, CHUNK_SIZE_BYTES));
        byte[] buffer = new byte[8192];
        long total = 0;
        int read;
        while ((read = inputStream.read(buffer)) != -1) {
            total += read;
            if (total > expectedSize) {
                throw new IOException("Audio range exceeded expected size");
            }
            out.write(buffer, 0, read);
        }
        if (total == 0) {
            throw new IOException("Empty audio range");
        }
        return out.toByteArray();
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

    private static long parseContentRangeSize(@Nullable String contentRange) {
        if (contentRange == null) return -1;

        int slash = contentRange.lastIndexOf('/');
        if (slash < 0 || slash == contentRange.length() - 1) return -1;

        try {
            return Long.parseLong(contentRange.substring(slash + 1).trim());
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    private static int toPartsCount(long fileSize) throws IOException {
        long parts = (fileSize + CHUNK_SIZE_BYTES - 1) / CHUNK_SIZE_BYTES;
        if (parts <= 0 || parts > Integer.MAX_VALUE) {
            throw new IOException("Invalid audio parts count: " + parts);
        }
        return (int) parts;
    }

    private static String makeFileId(int itag, long fileSize) {
        return String.format(
                Locale.US,
                "{\"downloadType\":\"%s\",\"itag\":%d,\"minChunkSize\":%d,\"fileSize\":\"%d\"}",
                AUDIO_DOWNLOAD_TYPE,
                itag,
                CHUNK_SIZE_BYTES,
                fileSize
        );
    }

    private static boolean isEmpty(@Nullable String value) {
        return value == null || value.isEmpty();
    }
}
