/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class YandexVotProxyRoutingTest {
    private static final String PRIMARY = "https://vot-worker.eu.cc";
    private static final String OTHER = "https://custom-worker.example";
    private static final String AUDIO_PATH = "/video-translation/audio";

    @Before
    @After
    public void resetRoutingState() {
        YandexVotProxyRouting.resetForTests();
    }

    @Test
    public void audio413RetriesThroughLargeBodyFallbackAndRemembersPrimary() {
        String primaryUrl = YandexVotProxyRouting.initialUrl(PRIMARY, AUDIO_PATH, "PUT");
        assertEquals(PRIMARY + AUDIO_PATH, primaryUrl);

        String fallbackUrl = YandexVotProxyRouting.retryUrlAfterResponse(
                PRIMARY,
                primaryUrl,
                AUDIO_PATH,
                "PUT",
                413
        );
        assertEquals(
                YandexVotProxyRouting.LARGE_AUDIO_FALLBACK_BASE_URL + AUDIO_PATH,
                fallbackUrl
        );
        assertEquals(
                fallbackUrl,
                YandexVotProxyRouting.initialUrl(PRIMARY, AUDIO_PATH, "PUT")
        );
    }

    @Test
    public void rememberedLimitDoesNotOverrideAnotherConfiguredWorker() {
        String primaryUrl = YandexVotProxyRouting.initialUrl(PRIMARY, AUDIO_PATH, "PUT");
        YandexVotProxyRouting.retryUrlAfterResponse(
                PRIMARY,
                primaryUrl,
                AUDIO_PATH,
                "PUT",
                413
        );

        assertEquals(
                OTHER + AUDIO_PATH,
                YandexVotProxyRouting.initialUrl(OTHER, AUDIO_PATH, "PUT")
        );
    }

    @Test
    public void customWorker413DoesNotRedirectToPublicFallback() {
        assertNull(YandexVotProxyRouting.retryUrlAfterResponse(
                OTHER,
                OTHER + AUDIO_PATH,
                AUDIO_PATH,
                "PUT",
                413
        ));
        assertEquals(
                OTHER + AUDIO_PATH,
                YandexVotProxyRouting.initialUrl(OTHER, AUDIO_PATH, "PUT")
        );
    }

    @Test
    public void nonAudioOrNon413ResponsesDoNotUseFallback() {
        String translatePath = "/video-translation/translate";
        assertNull(YandexVotProxyRouting.retryUrlAfterResponse(
                PRIMARY,
                PRIMARY + translatePath,
                translatePath,
                "POST",
                413
        ));
        assertNull(YandexVotProxyRouting.retryUrlAfterResponse(
                PRIMARY,
                PRIMARY + AUDIO_PATH,
                AUDIO_PATH,
                "PUT",
                500
        ));
    }

    @Test
    public void fallback413DoesNotLoop() {
        String fallbackUrl = YandexVotProxyRouting.LARGE_AUDIO_FALLBACK_BASE_URL + AUDIO_PATH;
        assertNull(YandexVotProxyRouting.retryUrlAfterResponse(
                PRIMARY,
                fallbackUrl,
                AUDIO_PATH,
                "PUT",
                413
        ));
    }

    @Test
    public void transientAudioUploadRetriesAreScopedAndBounded() {
        for (int responseCode : new int[]{429, 502, 503, 504}) {
            assertTrue(YandexVotProxyRouting.shouldRetryTransientAudioUpload(
                    AUDIO_PATH, "PUT", responseCode, 0));
            assertTrue(YandexVotProxyRouting.shouldRetryTransientAudioUpload(
                    AUDIO_PATH, "PUT", responseCode, 1));
            assertFalse(YandexVotProxyRouting.shouldRetryTransientAudioUpload(
                    AUDIO_PATH, "PUT", responseCode, 2));
        }

        assertFalse(YandexVotProxyRouting.shouldRetryTransientAudioUpload(
                AUDIO_PATH, "PUT", 500, 0));
        assertFalse(YandexVotProxyRouting.shouldRetryTransientAudioUpload(
                AUDIO_PATH, "POST", 503, 0));
        assertFalse(YandexVotProxyRouting.shouldRetryTransientAudioUpload(
                "/video-translation/translate", "POST", 503, 0));
    }

    @Test
    public void transientAudioUploadBackoffIsShortAndBounded() {
        assertEquals(750L, YandexVotProxyRouting.transientRetryDelayMillis(0));
        assertEquals(1_500L, YandexVotProxyRouting.transientRetryDelayMillis(1));
    }

    @Test
    public void proxySerializationPreservesLegacyDecimalByteArrayContract() throws Exception {
        byte[] body = new byte[256];
        for (int index = 0; index < body.length; index++) {
            body[index] = (byte) index;
        }
        Map<String, String> headers = new LinkedHashMap<>();
        headers.put("Content-Type", "application/x-protobuf");

        ByteArrayOutputStream output = new ByteArrayOutputStream();
        YandexVotApiClient.writeBinaryProxyRequest(output, body, headers);
        String json = output.toString(StandardCharsets.UTF_8.name());

        assertEquals(
                "{\"headers\":{\"Content-Type\":\"application/x-protobuf\"},\"body\":[",
                json.substring(0, json.indexOf('[') + 1)
        );
        assertEquals("0,1,2,3,4,5,6,7,8,9,10,11", json.substring(
                json.indexOf('[') + 1,
                json.indexOf(",12")
        ));
        assertEquals("254,255]}", json.substring(json.length() - 9));
        assertEquals(976, json.getBytes(StandardCharsets.UTF_8).length);
    }
}
