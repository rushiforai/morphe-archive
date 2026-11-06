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

import androidx.annotation.NonNull;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;


import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.settings.YandexVotSettings;

public class YandexVotApiClient {

    private static final String YANDEX_API_HOST = "api.browser.yandex.ru";

    private static final String HMAC_KEY = "bt8xH3VOlb4mqf0nqAibnDOoiPlXsisf";
    private static final String COMPONENT_VERSION = "26.4.1.1026";
    private static final String VOT_MODULE = "video-translation";
    private static final double DEFAULT_DURATION = 310.0;

    private static final String USER_AGENT =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " +
            "(KHTML, like Gecko) Chrome/147.0.0.0 YaBrowser/26.4.1.1026 Yowser/2.5 Safari/537.36";

    private static final int CONNECT_TIMEOUT_MS = 15000;
    private static final int READ_TIMEOUT_MS = 30000;

    public static final int STATUS_FAILED = 0;
    public static final int STATUS_FINISHED = 1;
    public static final int STATUS_WAITING = 2;
    public static final int STATUS_LONG_WAITING = 3;
    public static final int STATUS_PART_CONTENT = 5;
    public static final int STATUS_AUDIO_REQUESTED = 6;
    public static final int STATUS_SESSION_REQUIRED = 7;

    /** Session state — created on demand, shared across requests. */
    private static String sessionUuid = null;
    private static String sessionSecretKey = null;
    private static long sessionExpiresAt = 0;

    /** Translation result cache — keyed by videoUrl + sourceLang + targetLang + liveVoices. */
    private static final long CACHE_TTL_MS = 30 * 60_000; // 30 minutes
    private static final Map<String, CachedResult> translationCache = new ConcurrentHashMap<>();

    /** Simple flag: once a token passes validation, skip re-checking it during the process lifetime. */
    private static volatile String lastValidatedToken = null;
    private static volatile boolean tokenIsValid = false;

    private record CachedResult(TranslationResult result, long createdAt) {
        boolean isValid() {
            return System.currentTimeMillis() - createdAt <= CACHE_TTL_MS;
        }
    }

    public record TranslationResult(int status, String audioUrl, int remainingTime,
                                    String translationId, String message) {
    }

    private static boolean isProxyEnabled() {
        return YandexVotSettings.YANDEX_VOT_AUDIO_PROXY_ENABLED.get()
                && !YandexVotSettings.YANDEX_VOT_PROXY_URL.get().trim().isEmpty();
    }

    @NonNull
    private static String getProxyBaseUrl() {
        String configuredUrl = YandexVotSettings.YANDEX_VOT_PROXY_URL.get().trim();
        if (!configuredUrl.matches("(?i)^https?://.*")) {
            configuredUrl = "https://" + configuredUrl;
        }
        return configuredUrl.replaceAll("/+$", "");
    }

    @NonNull
    private static String getApiUrl(@NonNull String path) {
        return (isProxyEnabled()
                ? getProxyBaseUrl()
                : "https://" + YANDEX_API_HOST) + path;
    }

    /**
     * Converts a direct audio URL (S3/Yandex) to a proxied URL.
     * Used when audio proxy is enabled — routes audio through the configured proxy host.
     *
     * @param originalUrl the original audio URL
     * @return proxied URL, or originalUrl on error
     */
    @NonNull
    public static String toProxyAudioUrl(@NonNull String originalUrl) {
        if (originalUrl.isEmpty()) {
            return originalUrl;
        }
        if (!isProxyEnabled()) {
            return originalUrl;
        }
        try {
            URI uri = new URI(originalUrl);
            String path = uri.getRawPath();
            String query = uri.getRawQuery();
            if (path == null || path.isEmpty()) {
                return originalUrl;
            }
            String pathTrimmed = path.replaceFirst("^/+", "");
            int lastSlash = pathTrimmed.lastIndexOf('/');
            if (lastSlash >= 0) {
                pathTrimmed = pathTrimmed.substring(lastSlash + 1);
            }
            StringBuilder proxyUrl = new StringBuilder();
            proxyUrl.append(getProxyBaseUrl());
            proxyUrl.append("/video-translation/audio-proxy/");
            proxyUrl.append(pathTrimmed);
            if (query != null && !query.isEmpty()) {
                proxyUrl.append("?").append(query);
            }
            Logger.printDebug(() -> "toProxyAudioUrl: " + originalUrl + " -> " + proxyUrl);
            return proxyUrl.toString();
        } catch (URISyntaxException e) {
            Logger.printDebug(() -> "toProxyAudioUrl: invalid URL " + originalUrl);
            return originalUrl;
        }
    }

    private static void writeBinaryProxyRequest(
            @NonNull OutputStream output,
            @NonNull byte[] body,
            @NonNull Map<String, String> headers
    ) throws IOException {
        StringBuilder json = new StringBuilder(16_384);
        json.append("{\"headers\":");
        appendJsonHeaders(json, headers);
        json.append(",\"body\":[");
        for (int i = 0; i < body.length; i++) {
            if (i > 0) json.append(',');
            json.append(body[i] & 0xFF);
            if (json.length() >= 16_384) {
                writeUtf8(output, json);
                json.setLength(0);
            }
        }
        json.append("]}");
        writeUtf8(output, json);
    }

    private static void writeUtf8(
            @NonNull OutputStream output,
            @NonNull StringBuilder text
    ) throws IOException {
        output.write(text.toString().getBytes(StandardCharsets.UTF_8));
    }

    @NonNull
    private static byte[] wrapJsonProxyRequest(
            @NonNull String jsonBody,
            @NonNull Map<String, String> headers
    ) {
        StringBuilder json = new StringBuilder(jsonBody.length() + 256);
        json.append("{\"headers\":");
        appendJsonHeaders(json, headers);
        json.append(",\"body\":").append(jsonBody).append('}');
        return json.toString().getBytes(StandardCharsets.UTF_8);
    }

    private static void appendJsonHeaders(
            @NonNull StringBuilder json,
            @NonNull Map<String, String> headers
    ) {
        json.append('{');
        boolean first = true;
        for (Map.Entry<String, String> header : headers.entrySet()) {
            if (!first) json.append(',');
            first = false;
            appendJsonString(json, header.getKey());
            json.append(':');
            appendJsonString(json, header.getValue());
        }
        json.append('}');
    }

    private static void appendJsonString(@NonNull StringBuilder json, @NonNull String value) {
        json.append('"');
        for (int i = 0; i < value.length(); i++) {
            char character = value.charAt(i);
            switch (character) {
                case '"':
                    json.append("\\\"");
                    break;
                case '\\':
                    json.append("\\\\");
                    break;
                case '\b':
                    json.append("\\b");
                    break;
                case '\f':
                    json.append("\\f");
                    break;
                case '\n':
                    json.append("\\n");
                    break;
                case '\r':
                    json.append("\\r");
                    break;
                case '\t':
                    json.append("\\t");
                    break;
                default:
                    if (character < 0x20) {
                        json.append(String.format(Locale.US, "\\u%04x", (int) character));
                    } else {
                        json.append(character);
                    }
            }
        }
        json.append('"');
    }

    public static TranslationResult requestTranslation(
            String videoUrl, double duration,
            String sourceLang, String targetLang,
            String videoTitle, boolean useLiveVoices
    ) {
        return requestTranslation(videoUrl, duration, sourceLang, targetLang, videoTitle,
                useLiveVoices, true);
    }

    public static TranslationResult requestTranslation(
            String videoUrl, double duration,
            String sourceLang, String targetLang,
            String videoTitle, boolean useLiveVoices, boolean firstRequest
    ) {
        // Proactively ensure a valid session exists before any API call.
        if (!ensureSession()) {
            Logger.printDebug(() -> "VOT: unable to establish session, network may be unavailable");
            return null;
        }

        String cacheKey = videoUrl + "|" + sourceLang + "|" + targetLang + "|" + useLiveVoices;
        CachedResult cached = translationCache.get(cacheKey);
        if (cached != null && cached.isValid()) {
            Logger.printDebug(() -> "VOT cache hit: " + cacheKey);
            return cached.result();
        }
        if (cached != null) {
            translationCache.remove(cacheKey);
        }

        // Resolve OAuth token once (may be null if not configured)
        String oauthToken = useLiveVoices ? YandexVotSettings.YANDEX_VOT_OAUTH_TOKEN.get() : null;
        if (oauthToken != null && oauthToken.isEmpty()) {
            oauthToken = null;
        }
        // Validate OAuth token before using it (makes a lightweight API call, cached per process).
        if (oauthToken != null && !isValidOAuthToken(oauthToken)) {
            Logger.printDebug(() -> "VOT OAuth token is invalid, clearing and falling back");
            YandexVotSettings.YANDEX_VOT_OAUTH_TOKEN.save("");
            // Return a special result — caller will show "auth required" toast.
            return new TranslationResult(STATUS_SESSION_REQUIRED, null, 0, null, null);
        }

        // Retry once on SESSION_REQUIRED
        for (int attempt = 0; attempt < 2; attempt++) {
            try {
                if (duration <= 0) {
                    duration = DEFAULT_DURATION;
                }

                String apiSourceLang = (sourceLang == null || sourceLang.isEmpty() || "auto".equalsIgnoreCase(sourceLang))
                        ? "" : sourceLang;

                byte[] body = YandexVotProtobuf.encodeTranslationRequest(
                        videoUrl, firstRequest, duration,
                        apiSourceLang, targetLang, videoTitle,
                        useLiveVoices
                );

                String path = "/video-translation/translate";
                byte[] responseBytes = sendApiRequest(path, body, oauthToken);

                if (responseBytes == null || responseBytes.length == 0) {
                    return null;
                }

                YandexVotProtobuf.TranslationResponse response = YandexVotProtobuf.decodeTranslationResponse(responseBytes);

                // If server asks for a session, create one and retry
                if (response.status == STATUS_SESSION_REQUIRED && attempt == 0) {
                    Logger.printDebug(() -> "VOT: session required, creating session and retrying...");
                    invalidateSession();
                    if (createSession()) {
                        continue;
                    }
                    // Session creation failed — return the result as-is
                }

                TranslationResult result = new TranslationResult(
                        response.status,
                        response.url,
                        response.remainingTime,
                        response.translationId,
                        response.message
                );

                // Cache only finished / part-content results (not waiting or errors)
                if (result.status() == STATUS_FINISHED || result.status() == STATUS_PART_CONTENT) {
                    translationCache.put(cacheKey, new CachedResult(result, System.currentTimeMillis()));
                }

                return result;

            } catch (Exception e) {
                Logger.printException(() -> "YandexVotApiClient.requestTranslation failed for " + videoUrl, e);
                return null;
            }
        }
        return null; // unreachable but silences warning
    }

    /**
     * Whether a finished (STATUS_FINISHED or STATUS_PART_CONTENT) translation exists in cache
     * for the given video/language pair. Used by the UI to show an indicator on voice-style buttons.
     */
    public static boolean hasCachedTranslation(String videoUrl, String sourceLang, String targetLang, boolean useLiveVoices) {
        String cacheKey = videoUrl + "|" + sourceLang + "|" + targetLang + "|" + useLiveVoices;
        CachedResult cached = translationCache.get(cacheKey);
        return cached != null && cached.isValid();
    }

    private static void invalidateSession() {
        sessionSecretKey = null;
        sessionUuid = null;
        sessionExpiresAt = 0;
    }

    /**
     * Sends a protobuf request directly to the Yandex VOT API.
     * Uses the same format as the official Yandex Browser extension.
     *
     * @param oauthToken optional OAuth token for live voices (may be null)
     */
    private static byte[] sendApiRequest(String path, byte[] body, String oauthToken) throws IOException {
        return sendApiRequest(path, body, "POST", oauthToken);
    }

    private static byte[] sendApiRequest(String path, byte[] body, String method, String oauthToken) throws IOException {
        String vtransSignature = computeHmacHex(body);
        // Use existing session UUID or generate a new one (will be replaced when session is created)
        String uuid = sessionUuid != null ? sessionUuid : generateUuid();
        String tokenData = uuid + ":" + path + ":" + COMPONENT_VERSION;
        String tokenSign = computeHmacHex(tokenData.getBytes(StandardCharsets.UTF_8));
        String vtransToken = tokenSign + ":" + tokenData;

        Map<String, String> yandexHeaders = new LinkedHashMap<>();
        yandexHeaders.put("Accept", "application/x-protobuf");
        yandexHeaders.put("Accept-Language", "en");
        yandexHeaders.put("Content-Type", "application/x-protobuf");
        yandexHeaders.put("User-Agent", USER_AGENT);
        yandexHeaders.put("Pragma", "no-cache");
        yandexHeaders.put("Cache-Control", "no-cache");
        yandexHeaders.put("Vtrans-Signature", vtransSignature);
        yandexHeaders.put("Sec-Vtrans-Token", vtransToken);
        if (sessionSecretKey != null && !sessionSecretKey.isEmpty()) {
            yandexHeaders.put("Sec-Vtrans-Sk", sessionSecretKey);
        }
        if (oauthToken != null && !oauthToken.isEmpty()) {
            yandexHeaders.put("Authorization", "OAuth " + oauthToken);
        }

        boolean useProxy = isProxyEnabled();
        String requestUrl = getApiUrl(path);
        Logger.printDebug(() -> "VOT sendApiRequest: " + method + " " + requestUrl
                + (useProxy ? " via VOT worker" : ""));

        HttpURLConnection connection = (HttpURLConnection) new URL(requestUrl).openConnection();
        try {
            connection.setRequestMethod(method);
            if (useProxy) {
                connection.setRequestProperty("Accept", "application/x-protobuf");
                connection.setRequestProperty("Content-Type", "application/json");
                connection.setRequestProperty("User-Agent", USER_AGENT);
            } else {
                for (Map.Entry<String, String> header : yandexHeaders.entrySet()) {
                    connection.setRequestProperty(header.getKey(), header.getValue());
                }
            }
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setDoOutput(true);

            if (useProxy) {
                connection.setChunkedStreamingMode(32 * 1024);
            } else {
                connection.setFixedLengthStreamingMode(body.length);
            }

            try (OutputStream os = connection.getOutputStream()) {
                if (useProxy) {
                    writeBinaryProxyRequest(os, body, yandexHeaders);
                } else {
                    os.write(body);
                }
            }

            int responseCode = connection.getResponseCode();
            if (responseCode != 200) {
                Logger.printDebug(() -> "VOT sendApiRequest: " + requestUrl
                        + " returned " + responseCode);
                return null;
            }

            return readBytes(connection.getInputStream());

        } finally {
            connection.disconnect();
        }
    }

    private static String computeHmacHex(byte[] data) {
        try {
            Mac hmac = Mac.getInstance("HmacSHA256");
            SecretKeySpec keySpec = new SecretKeySpec(
                    HMAC_KEY.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            hmac.init(keySpec);
            byte[] result = hmac.doFinal(data);

            StringBuilder hex = new StringBuilder();
            for (byte b : result) {
                hex.append(String.format(Locale.US, "%02x", b & 0xFF));
            }
            return hex.toString();
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            return "";
        }
    }

    private static String generateUuid() {
        String hexDigits = "0123456789ABCDEF";
        Random random = new Random();
        StringBuilder uuid = new StringBuilder(32);
        for (int i = 0; i < 32; i++) {
            uuid.append(hexDigits.charAt(random.nextInt(16)));
        }
        return uuid.toString();
    }

    /**
     * Creates a new Yandex session. Called when the API returns STATUS_SESSION_REQUIRED
     * or when no valid session exists.
     */
    private static boolean createSession() {
        try {
            String uuid = generateUuid();
            String path = "/session/create";
            byte[] body = YandexVotProtobuf.encodeSessionRequest(uuid, VOT_MODULE);

            // Session creation uses Ya-Summary headers (no body signing, token-based only)
            String tokenData = uuid + ":" + path + ":" + COMPONENT_VERSION;
            String tokenSign = computeHmacHex(tokenData.getBytes(StandardCharsets.UTF_8));
            String summaryToken = tokenSign + ":" + tokenData;

            Map<String, String> yandexHeaders = new LinkedHashMap<>();
            yandexHeaders.put("Accept", "application/x-protobuf");
            yandexHeaders.put("Content-Type", "application/x-protobuf");
            yandexHeaders.put("User-Agent", USER_AGENT);
            yandexHeaders.put("X-Ya-Summary-Token", summaryToken);
            yandexHeaders.put("X-Ya-Summary-Sk", "");

            boolean useProxy = isProxyEnabled();
            String requestUrl = getApiUrl(path);
            Logger.printDebug(() -> "VOT createSession: POST " + requestUrl
                    + (useProxy ? " via VOT worker" : ""));

            HttpURLConnection connection = (HttpURLConnection) new URL(requestUrl).openConnection();
            try {
                connection.setRequestMethod("POST");
                if (useProxy) {
                    connection.setRequestProperty("Accept", "application/x-protobuf");
                    connection.setRequestProperty("Content-Type", "application/json");
                    connection.setRequestProperty("User-Agent", USER_AGENT);
                } else {
                    for (Map.Entry<String, String> header : yandexHeaders.entrySet()) {
                        connection.setRequestProperty(header.getKey(), header.getValue());
                    }
                }
                connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
                connection.setReadTimeout(READ_TIMEOUT_MS);
                connection.setDoOutput(true);
                if (useProxy) {
                    connection.setChunkedStreamingMode(32 * 1024);
                } else {
                    connection.setFixedLengthStreamingMode(body.length);
                }

                try (OutputStream os = connection.getOutputStream()) {
                    if (useProxy) {
                        writeBinaryProxyRequest(os, body, yandexHeaders);
                    } else {
                        os.write(body);
                    }
                }

                int responseCode = connection.getResponseCode();
                if (responseCode != 200) {
                    Logger.printDebug(() -> "VOT createSession: returned " + responseCode);
                    return false;
                }

                byte[] responseBytes = readBytes(connection.getInputStream());
                if (responseBytes.length == 0) {
                    Logger.printDebug(() -> "VOT createSession: empty response");
                    return false;
                }

                YandexVotProtobuf.SessionResponse response = YandexVotProtobuf.decodeSessionResponse(responseBytes);
                if (response.secretKey == null || response.secretKey.isEmpty()) {
                    Logger.printDebug(() -> "VOT createSession: no secretKey in response");
                    return false;
                }

                sessionUuid = uuid;
                sessionSecretKey = response.secretKey;
                // expires is in seconds from the session creation time
                sessionExpiresAt = System.currentTimeMillis() + (response.expires > 0 ? response.expires * 1000L : 3600_000L);

                Logger.printDebug(() -> "VOT createSession: success, expires in " + response.expires + "s");
                return true;

            } finally {
                connection.disconnect();
            }
        } catch (UnknownHostException e) {
            Logger.printException(() -> "VOT createSession failed: DNS resolution error", e);
            return false;
        } catch (SocketTimeoutException e) {
            Logger.printException(() -> "VOT createSession failed: connection timeout", e);
            return false;
        } catch (ConnectException e) {
            Logger.printException(() -> "VOT createSession failed: connection refused", e);
            return false;
        } catch (Exception e) {
            Logger.printException(() -> "VOT createSession failed", e);
            return false;
        }
    }

    /**
     * Returns true if the error message indicates that "live voices" (Lively)
     * are unavailable for the requested language pair. In that case the caller
     * should retry with standard voices instead.
     */
    public static boolean isLivelyVoiceUnavailableError(String message) {
        if (message == null || message.isEmpty()) return false;
        String lower = message.toLowerCase(Locale.US);
        return lower.contains("обычная озвучка") || lower.contains("standard voice");
    }

    /**
     * Validates a Yandex OAuth token by calling login.yandex.ru/info.
     * Caches the result so we only call it once per token per process lifetime.
     *
     * @param token the OAuth token to validate
     * @return true if the token is valid, false otherwise
     */
    public static boolean isValidOAuthToken(String token) {
        if (token == null || token.isEmpty()) return false;
        // The worker forwards the OAuth header to the VOT API. Avoid making a
        // separate direct login.yandex.ru request when Yandex is region-blocked.
        if (isProxyEnabled()) return true;
        // Return cached result if we already validated this exact token.
        if (token.equals(lastValidatedToken)) return tokenIsValid;
        try {
            String url = "https://login.yandex.ru/info?format=json";
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            try {
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Authorization", "OAuth " + token);
                conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
                conn.setReadTimeout(READ_TIMEOUT_MS);
                int code = conn.getResponseCode();
                lastValidatedToken = token;
                tokenIsValid = (code == 200);
                Logger.printDebug(() -> "VOT OAuth token validation: HTTP " + code
                        + " -> " + (tokenIsValid ? "valid" : "invalid"));
                return tokenIsValid;
            } finally {
                conn.disconnect();
            }
        } catch (UnknownHostException | SocketTimeoutException | ConnectException e) {
            Logger.printDebug(() -> "VOT OAuth token validation: network error (" +
                    e.getClass().getSimpleName() + "), assuming valid temporarily");
            // Network is unreachable — assume valid to avoid blocking the user,
            // but DON'T cache so we re-validate when the network recovers.
            return true;
        } catch (Exception e) {
            Logger.printDebug(() -> "VOT OAuth token validation failed: " + e.getMessage());
            // Unknown error — cache as invalid to prevent repeated failures.
            lastValidatedToken = token;
            tokenIsValid = false;
            return false;
        }
    }

    /**
     * Clears the OAuth token validation cache.
     * Call when the user signs out so that a new token can be re-validated.
     */
    public static void clearTokenValidationCache() {
        lastValidatedToken = null;
        tokenIsValid = false;
    }

    /**
     * Clears the translation cache. Call when the user changes language, proxy
     * or other translation-related settings to force fresh API requests.
     */
    public static void clearTranslationCache() {
        translationCache.clear();
    }

    /**
     * Sends a fail-audio request (JSON, PUT) to abort the currently queued audio
     * so that a fresh empty-audio request can trigger regeneration.
     */
    public static void sendFailedAudio(String videoUrl) {
        try {
            String path = "/video-translation/fail-audio-js";
            String jsonBody = "{\"video_url\":\"" + videoUrl + "\"}";
            sendJsonRequest(path, jsonBody);
        } catch (Exception e) {
            Logger.printException(() -> "YandexVotApiClient.sendFailedAudio failed for " + videoUrl, e);
        }
    }

    public static boolean sendAudio(
            String videoUrl,
            String translationId,
            String fileId,
            byte[] audioData
    ) {
        try {
            byte[] body = YandexVotProtobuf.encodeAudioRequest(
                    translationId, videoUrl, fileId, audioData);
            return sendAudioRequestBody(body);
        } catch (Exception e) {
            Logger.printException(() -> "YandexVotApiClient.sendAudio failed for " + videoUrl, e);
            return false;
        }
    }

    public static boolean sendPartialAudio(
            String videoUrl,
            String translationId,
            String fileId,
            int audioPartsLength,
            int version,
            int chunkId,
            byte[] audioData
    ) {
        try {
            byte[] body = YandexVotProtobuf.encodePartialAudioRequest(
                    translationId,
                    videoUrl,
                    fileId,
                    audioPartsLength,
                    version,
                    chunkId,
                    audioData
            );
            return sendAudioRequestBody(body);
        } catch (Exception e) {
            Logger.printException(
                    () -> "YandexVotApiClient.sendPartialAudio failed for " + videoUrl,
                    e
            );
            return false;
        }
    }

    private static boolean sendAudioRequestBody(byte[] body) throws IOException {
        if (!ensureSession()) return false;
        byte[] response = sendApiRequest(
                "/video-translation/audio",
                body,
                "PUT",
                null
        );
        return response != null;
    }

    /**
     * Sends an empty audio protobuf request (PUT) to trigger translation generation
     * on Yandex servers. Kept only as a fallback if the real YouTube audio stream
     * cannot be downloaded or uploaded.
     */
    public static void sendEmptyAudio(String videoUrl, String translationId, String oauthToken) {
        try {
            byte[] body = YandexVotProtobuf.encodeEmptyAudioRequest(translationId, videoUrl);
            String path = "/video-translation/audio";
            sendApiRequest(path, body, "PUT", oauthToken);
        } catch (Exception e) {
            Logger.printException(() -> "YandexVotApiClient.sendEmptyAudio failed for " + videoUrl, e);
        }
    }

    /**
     * Sends a JSON request to the Yandex VOT API (for fail-audio-js endpoint).
     */
    private static void sendJsonRequest(String path, String jsonBody) throws IOException {
        Map<String, String> yandexHeaders = new LinkedHashMap<>();
        yandexHeaders.put("Content-Type", "application/json");
        yandexHeaders.put("Accept", "application/json");
        yandexHeaders.put("User-Agent", USER_AGENT);

        boolean useProxy = isProxyEnabled();
        String requestUrl = getApiUrl(path);
        byte[] payloadBytes = useProxy
                ? wrapJsonProxyRequest(jsonBody, yandexHeaders)
                : jsonBody.getBytes(StandardCharsets.UTF_8);

        HttpURLConnection connection = (HttpURLConnection) new URL(requestUrl).openConnection();
        try {
            connection.setRequestMethod("PUT");
            if (useProxy) {
                connection.setRequestProperty("Content-Type", "application/json");
                connection.setRequestProperty("Accept", "application/json");
                connection.setRequestProperty("User-Agent", USER_AGENT);
            } else {
                for (Map.Entry<String, String> header : yandexHeaders.entrySet()) {
                    connection.setRequestProperty(header.getKey(), header.getValue());
                }
            }
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setDoOutput(true);

            connection.setFixedLengthStreamingMode(payloadBytes.length);

            try (OutputStream os = connection.getOutputStream()) {
                os.write(payloadBytes);
            }
            int responseCode = connection.getResponseCode();
            if (responseCode < 200 || responseCode >= 300) {
                Logger.printDebug(() -> "VOT sendJsonRequest: " + requestUrl
                        + " returned " + responseCode);
            }
        } finally {
            connection.disconnect();
        }
    }

    /** Returns true if the current session is still valid. */
    private static boolean hasValidSession() {
        return sessionSecretKey != null && !sessionSecretKey.isEmpty()
                && System.currentTimeMillis() < sessionExpiresAt;
    }

    /** Ensures a valid session exists, creating one if necessary. */
    private static boolean ensureSession() {
        if (hasValidSession()) return true;
        return createSession();
    }

    private static byte[] readBytes(InputStream is) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] chunk = new byte[4096];
        int bytesRead;
        while ((bytesRead = is.read(chunk)) != -1) {
            buffer.write(chunk, 0, bytesRead);
        }
        return buffer.toByteArray();
    }
}
