package dev.jason.gboardpatches.extension.webclipboard;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardWebClipboardCaptureBootstrapSourceTest {
    @Test
    public void missingLoopbackTokenFailsClosedBeforeClipboardRead() throws Exception {
        String source = new String(
                Files.readAllBytes(Path.of(
                        "src/main/java/dev/jason/gboardpatches/extension/webclipboard/"
                                + "GboardWebClipboardCaptureBootstrap.java")),
                StandardCharsets.UTF_8);
        String runtimeConfigBody = source.substring(
                source.indexOf("private static RuntimeLookup webClipboardRuntimeConfig"),
                source.indexOf("private static ClipData currentClipboardData"));

        Assert.assertTrue(runtimeConfigBody.contains(
                "ClipboardSyncLoopbackAuth.isUsableToken(loopbackIngressToken)"));
        Assert.assertTrue(runtimeConfigBody.contains("return RuntimeLookup.unavailable();"));
        Assert.assertFalse(source.contains("fallbackLoopbackIngressToken()"));
        Assert.assertFalse(source.contains(
                "gboardpatches-web-clipboard-loopback-fallback-v1"));
    }
}
