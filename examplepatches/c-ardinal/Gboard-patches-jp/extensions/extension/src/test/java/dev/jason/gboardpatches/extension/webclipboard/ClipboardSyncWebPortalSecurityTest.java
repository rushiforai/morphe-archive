package dev.jason.gboardpatches.extension.webclipboard;

import org.junit.Assert;
import org.junit.Test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Field;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class ClipboardSyncWebPortalSecurityTest {
    private static final String LOOPBACK_TOKEN =
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";
    private static final String LEGACY_STATIC_TOKEN =
            "gboardpatches-web-clipboard-loopback-fallback-v1";

    @Test
    public void onlyConfiguredTokenHeaderCanPublishPhoneClipboard() throws Exception {
        ClipboardSyncWebPortal portal = new ClipboardSyncWebPortal(
                0,
                0,
                text -> { },
                ClipboardSyncWebPortal.WebAssets.empty(),
                new ClipboardSyncWebPortal.SecurityConfig(false, "0000", LOOPBACK_TOKEN));
        portal.start();
        try {
            HttpResponse legacyResponse = request(portal.getPort(),
                    phoneClipboardRequest("legacy-forged", LEGACY_STATIC_TOKEN, ""));
            Assert.assertEquals(403, legacyResponse.statusCode);
            Assert.assertTrue(legacyResponse.body.contains("invalid_loopback_token"));

            String bodyCredential = "text=body-forged"
                    + "&loopbackIngressToken=" + LOOPBACK_TOKEN
                    + "&token=" + LOOPBACK_TOKEN;
            HttpResponse bodyCredentialResponse = request(portal.getPort(),
                    phoneClipboardRequest("", "", bodyCredential));
            Assert.assertEquals(403, bodyCredentialResponse.statusCode);
            Assert.assertTrue(bodyCredentialResponse.body.contains("invalid_loopback_token"));
            Assert.assertEquals("", latestPhoneClipboardText(portal));

            HttpResponse validResponse = request(portal.getPort(),
                    phoneClipboardRequest("trusted-phone", LOOPBACK_TOKEN, ""));
            Assert.assertEquals(200, validResponse.statusCode);
            Assert.assertEquals("trusted-phone", latestPhoneClipboardText(portal));
        } finally {
            portal.stop();
        }
    }

    @Test
    public void statusProofUsesOnlyConfiguredPerInstallToken() throws Exception {
        String source = new String(
                Files.readAllBytes(Path.of(
                        "src/main/java/dev/jason/gboardpatches/extension/webclipboard/"
                                + "ClipboardSyncWebPortal.java")),
                StandardCharsets.UTF_8);
        String statusBody = source.substring(
                source.indexOf("private String buildStatusJson"),
                source.indexOf("private String buildAckJson"));
        String ingressAuthBody = source.substring(
                source.indexOf("private boolean isLoopbackIngressAuthorized"),
                source.indexOf("private String readHttpLine"));

        Assert.assertTrue(statusBody.contains("loopbackProofForStatusRequest"));
        Assert.assertFalse(statusBody.contains("fallbackLoopbackProofForStatusRequest"));
        Assert.assertFalse(statusBody.contains("loopbackFallbackProof"));
        Assert.assertTrue(ingressAuthBody.contains(
                "ClipboardSyncLoopbackAuth.tokenMatches(expectedToken, suppliedToken)"));
        Assert.assertFalse(ingressAuthBody.contains("extractField("));
    }

    @Test
    public void ingressClientRejectsLegacyStaticToken() throws Exception {
        ClipboardSyncWebPortal portal = new ClipboardSyncWebPortal(
                0,
                0,
                text -> { },
                ClipboardSyncWebPortal.WebAssets.empty(),
                new ClipboardSyncWebPortal.SecurityConfig(true, "1234", LOOPBACK_TOKEN));
        portal.start();
        try {
            Assert.assertFalse(ClipboardSyncLoopbackIngressClient.isExpectedPortal(
                    portal.getPort(), LEGACY_STATIC_TOKEN, 2_000));
            Assert.assertFalse(ClipboardSyncLoopbackIngressClient.submitPhoneClipboard(
                    "legacy-client-forged", portal.getPort(), LEGACY_STATIC_TOKEN, 2_000));
        } finally {
            portal.stop();
        }
    }

    private static String phoneClipboardRequest(String text, String token, String rawBody) {
        String body = rawBody == null || rawBody.isEmpty()
                ? "text=" + text
                : rawBody;
        byte[] bodyBytes = body.getBytes(StandardCharsets.UTF_8);
        StringBuilder request = new StringBuilder()
                .append("POST /phone-clipboard HTTP/1.1\r\n")
                .append("Host: 127.0.0.1\r\n")
                .append("Content-Type: application/x-www-form-urlencoded; charset=utf-8\r\n");
        if (token != null && !token.isEmpty()) {
            request.append("X-Loopback-Ingress-Token: ").append(token).append("\r\n");
        }
        return request
                .append("Content-Length: ").append(bodyBytes.length).append("\r\n")
                .append("Connection: close\r\n")
                .append("\r\n")
                .append(body)
                .toString();
    }

    private static HttpResponse request(int port, String rawRequest) throws Exception {
        try (Socket socket = new Socket("127.0.0.1", port);
             BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
                     socket.getOutputStream(), StandardCharsets.UTF_8));
             BufferedReader reader = new BufferedReader(new InputStreamReader(
                     socket.getInputStream(), StandardCharsets.UTF_8))) {
            writer.write(rawRequest);
            writer.flush();

            String statusLine = reader.readLine();
            String line;
            while ((line = reader.readLine()) != null && !line.isEmpty()) {
                // Drain response headers.
            }
            StringBuilder body = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                body.append(line).append('\n');
            }
            return new HttpResponse(parseStatusCode(statusLine), body.toString());
        }
    }

    private static int parseStatusCode(String statusLine) {
        if (statusLine == null) {
            return 0;
        }
        String[] parts = statusLine.split(" ");
        return parts.length > 1 ? Integer.parseInt(parts[1]) : 0;
    }

    private static String latestPhoneClipboardText(ClipboardSyncWebPortal portal)
            throws Exception {
        Field field = ClipboardSyncWebPortal.class.getDeclaredField("latestPhoneClipboardText");
        field.setAccessible(true);
        return (String) field.get(portal);
    }

    private static final class HttpResponse {
        final int statusCode;
        final String body;

        HttpResponse(int statusCode, String body) {
            this.statusCode = statusCode;
            this.body = body;
        }
    }
}
