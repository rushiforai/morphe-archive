import java.nio.file.Files;
import java.nio.file.Path;
import javax.tools.ToolProvider;

/** Compiles the pure text helper from WacchoiClipboard without an Android runtime. */
public final class VerifyWacchoiClipboard {
    public static void main(String[] args) throws Exception {
        String source = Files.readString(Path.of("extensions/chmate/src/main/java/app/morphe/extension/chmate/WacchoiClipboard.java"));
        String constants = source.substring(source.indexOf("    private static final String CODE"), source.indexOf("    static ClipData stripIfEnabled"));
        String method = source.substring(source.indexOf("    static String stripParentheses"), source.indexOf("    private WacchoiClipboard"));
        Path temp = Files.createTempDirectory("haiagaru-wacchoi-clipboard-");
        try {
            Path file = temp.resolve("ClipboardText.java");
            Files.writeString(file, "import java.util.regex.*; public class ClipboardText {" + constants + method + "}");
            if (ToolProvider.getSystemJavaCompiler().run(null, null, null, "-d", temp.toString(), file.toString()) != 0)
                throw new AssertionError("compile");
            try (var loader = new java.net.URLClassLoader(new java.net.URL[]{temp.toUri().toURL()})) {
                Class<?> type = loader.loadClass("ClipboardText");
                var strip = type.getDeclaredMethod("stripParentheses", String.class);
                strip.setAccessible(true);
                equal("名無しさん ﾜｯﾁｮｲ 8f01-uDul", strip.invoke(null, "名無しさん (ﾜｯﾁｮｲ 8f01-uDul)"), "ASCII parentheses");
                equal("名無しさん ﾜｯﾁｮｲ 8f01-uDul", strip.invoke(null, "名無しさん （ﾜｯﾁｮｲ 8f01-uDul）"), "full-width parentheses");
                equal("説明 (そのまま)", strip.invoke(null, "説明 (そのまま)"), "unrelated parentheses");
                equal("ID 8f01-uDul (注記)", strip.invoke(null, "ID 8f01-uDul (注記)"), "unwrapped identifier");
                equal("(ﾜｯﾁｮｲ 8f01-uDul)\n次の行", strip.invoke(null, "(ﾜｯﾁｮｲ 8f01-uDul)\n次の行"), "multiline copy");
            }
        } finally {
            try (var paths = Files.walk(temp)) {
                for (Path path : paths.sorted(java.util.Comparator.reverseOrder()).toList()) Files.delete(path);
            }
        }
        System.out.println("PASS: 5 Wacchoi clipboard text checks");
    }

    private static void equal(Object expected, Object actual, String label) {
        if (!java.util.Objects.equals(expected, actual)) throw new AssertionError(label + ": expected=" + expected + " actual=" + actual);
    }
}
