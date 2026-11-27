package dev.jason.gboardpatches.extension.toprowswipe;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardQuickJsFeatureSourceTest {
    @Test
    public void finishSlotScriptTreatsFalseCommitTextAsFailure() throws Exception {
        String source = readSource(
                "src/main/java/dev/jason/gboardpatches/extension/toprowswipe/"
                        + "GboardQuickJsFeature.java");

        String method = extractMethod(source, "private static void finishSlotScript(");
        Assert.assertTrue(method.contains("boolean committed = inputConnection.commitText("));
        Assert.assertTrue(method.contains("safeResult.committedText,"));
        Assert.assertTrue(method.contains("1);"));
        Assert.assertTrue(method.contains("if (!committed) {"));
        Assert.assertTrue(method.contains("commitFailed = true;"));
        Assert.assertTrue(method.contains(
                "\"InputConnection rejected QuickJS top-row slot result commit\""));
    }

    private static String readSource(String path) throws Exception {
        return new String(Files.readAllBytes(Path.of(path)), StandardCharsets.UTF_8);
    }

    private static String extractMethod(String source, String signature) {
        int signatureIndex = source.indexOf(signature);
        Assert.assertTrue("Missing method signature: " + signature, signatureIndex >= 0);

        int bodyStart = source.indexOf('{', signatureIndex);
        Assert.assertTrue("Missing method body start: " + signature, bodyStart >= 0);

        int depth = 0;
        for (int index = bodyStart; index < source.length(); index++) {
            char current = source.charAt(index);
            if (current == '{') {
                depth++;
            } else if (current == '}') {
                depth--;
                if (depth == 0) {
                    return source.substring(signatureIndex, index + 1);
                }
            }
        }
        throw new AssertionError("Unterminated method body: " + signature);
    }
}
