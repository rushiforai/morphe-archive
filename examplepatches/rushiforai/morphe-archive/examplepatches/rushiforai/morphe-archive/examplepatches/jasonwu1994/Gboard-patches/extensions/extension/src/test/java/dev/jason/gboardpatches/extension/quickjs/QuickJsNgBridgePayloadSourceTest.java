package dev.jason.gboardpatches.extension.quickjs;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class QuickJsNgBridgePayloadSourceTest {
    @Test
    public void currentBridgeUsesDirectNativeEntryPointWithoutLegacyDelegate() throws Exception {
        String source = readText(
                "src/main/java/dev/jason/gboardpatches/extension/quickjs/"
                        + "QuickJsNgBridge.java");

        Assert.assertTrue(source.contains(
                "private static native NativeEvalResult nativeEvaluateLoaded("));
        Assert.assertFalse(source.contains(legacyWord()));
    }

    @Test
    public void arm64PayloadOmitsLegacyIdentifiers() throws Exception {
        byte[] bytes = Files.readAllBytes(Path.of(
                "native-payload/arm64-v8a/libgboardpatches_quickjs.so"));
        String text = new String(bytes, StandardCharsets.ISO_8859_1);

        Assert.assertFalse(text.contains(legacyWord()));
        Assert.assertTrue(text.contains(
                "Java_dev_jason_gboardpatches_extension_quickjs_QuickJsNgBridge_nativeEvaluateLoaded"));
        Assert.assertTrue(text.contains(
                "dev/jason/gboardpatches/extension/quickjs/QuickJsNgBridge"));
        Assert.assertTrue(text.contains(
                "dev/jason/gboardpatches/extension/quickjs/QuickJsNgBridge$NativeEvalResult"));
        Assert.assertFalse(text.contains(
                "dev/jason/hexcrack/targets/gboard/QuickJsNgBridge"));
        Assert.assertFalse(text.contains(
                "dev/jason/hexcrack/targets/gboard/QuickJsNgBridge$NativeEvalResult"));
    }

    private static String readText(String path) throws Exception {
        return new String(Files.readAllBytes(Path.of(path)), StandardCharsets.UTF_8);
    }

    private static String legacyWord() {
        return "hex" + "crack";
    }
}
