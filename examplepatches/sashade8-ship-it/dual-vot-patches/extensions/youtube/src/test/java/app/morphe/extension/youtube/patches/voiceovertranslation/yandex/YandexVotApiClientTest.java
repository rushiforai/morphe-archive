/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.io.IOException;
import java.net.ConnectException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

import javax.net.ssl.SSLHandshakeException;

public class YandexVotApiClientTest {
    @Test
    public void classifiesNetworkFailuresWithoutMessageOrHostData() {
        assertEquals("dns", YandexVotApiClient.networkFailureCategory(
                new UnknownHostException("private.example")));
        assertEquals("timeout", YandexVotApiClient.networkFailureCategory(
                new SocketTimeoutException("timed out")));
        assertEquals("tls", YandexVotApiClient.networkFailureCategory(
                new SSLHandshakeException("certificate")));
        assertEquals("connect", YandexVotApiClient.networkFailureCategory(
                new ConnectException("refused")));
        assertEquals("connection", YandexVotApiClient.networkFailureCategory(
                new SocketException("reset")));
        assertEquals("io", YandexVotApiClient.networkFailureCategory(
                new IOException("io")));
        assertEquals("other", YandexVotApiClient.networkFailureCategory(
                new IllegalStateException("unexpected")));
    }

    @Test
    public void classifiesWrappedNetworkFailure() {
        assertEquals("dns", YandexVotApiClient.networkFailureCategory(
                new IllegalStateException("wrapper", new UnknownHostException("host"))));
        assertEquals("dns", YandexVotApiClient.networkFailureCategory(
                new IOException("wrapper", new UnknownHostException("host"))));
    }
}
