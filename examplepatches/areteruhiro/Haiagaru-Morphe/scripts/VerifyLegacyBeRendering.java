import java.nio.file.*;
import java.net.URLClassLoader;
import javax.tools.ToolProvider;

/** JVM regression checks using the actual production methods, without Android UI stubs.
 * Run from the repository root: java scripts/VerifyLegacyBeRendering.java
 */
public class VerifyLegacyBeRendering {
    private static void check(boolean value, String label) {
        if (!value) throw new AssertionError(label);
    }

    private static String method(String source, String signature) {
        int start = source.indexOf(signature);
        if (start < 0) throw new AssertionError(signature);
        int open = source.indexOf('{', start), depth = 1, end = open + 1;
        while (depth > 0) {
            char c = source.charAt(end++);
            if (c == '{') depth++;
            if (c == '}') depth--;
        }
        return source.substring(start, end);
    }

    public static void main(String[] args) throws Exception {
        String source = Files.readString(Path.of(
                "extensions/chmate/src/main/java/app/morphe/extension/chmate/Haiagaru.java"));
        StringBuilder code = new StringBuilder(
                "import java.util.*; import java.util.regex.*; public class BeUnderTest {\n");
        for (String field : new String[]{"LEGACY_BE_ATTACHMENT_TOKEN", "LEGACY_PREMIUM_BE_URL",
                "LEGACY_BE_ICO_URL", "LEGACY_BE_ANY_URL"}) {
            int start = source.indexOf("private static final Pattern " + field);
            code.append(source, start, source.indexOf(';', start) + 1).append('\n');
        }
        for (String signature : new String[]{
                "public static String prepareLegacyBeParsing(String original)",
                "public static String normalizeBeIconUrl(String original)",
                "private static String deduplicateBeIcons(String text)",
                "public static String stripLegacyBeAttachmentTokens(String original)",
                "public static long alignLegacyLinkRange("}) {
            code.append(method(source, signature)).append('\n');
        }
        code.append('}');
        Path temp = Files.createTempDirectory("haiagaru-be-regression-");
        try {
            Path java = temp.resolve("BeUnderTest.java");
            Files.writeString(java, code);
            check(ToolProvider.getSystemJavaCompiler().run(null, null, null,
                    "-d", temp.toString(), java.toString()) == 0, "Compile extracted production code");
            try (URLClassLoader loader = new URLClassLoader(new java.net.URL[]{temp.toUri().toURL()})) {
                Class<?> test = loader.loadClass("BeUnderTest");
                var prepare = test.getMethod("prepareLegacyBeParsing", String.class);
                var strip = test.getMethod("stripLegacyBeAttachmentTokens", String.class);
                String canonical = "sssp://img.5ch.net/ico/test.gif";
                for (String prefix : new String[]{"sssp://", "https://", "http://", "//", "\u0003", ""}) {
                    for (String host : new String[]{"5ch.io", "5ch.net", "2ch.net"}) {
                        String token = prefix + "img." + host + "/ico/test.gif";
                        check(canonical.equals(prepare.invoke(null, token)), "Normalize " + token);
                        check("\nbody".equals(strip.invoke(null, token + "\nbody")), "Strip " + token);
                    }
                }
                String longBody = "x".repeat(100);
                var normalize = test.getMethod("normalizeBeIconUrl", String.class);
                check("https://img.5ch.io/ico/syobo1.gif".equals(normalize.invoke(null,
                        "https://img.2ch.net/ico/syobo1.gif")), "Old icon fetch host");
                check("https://img.5ch.io/premium/5997079.gif".equals(normalize.invoke(null,
                        "https://img.2ch.net/ico/_be5997079.gif")), "Old premium fetch host");
                check("https://be.5ch.io/user/416049822".equals(normalize.invoke(null,
                        "https://be.5ch.io/user/416049822")), "Do not rewrite profile links");
                check(("sssp://img.5ch.net/ico/_betest.gif\n" + longBody).equals(
                        prepare.invoke(null, "sssp://img.5ch.io/premium/test.gif\n" + longBody)),
                        "Long body must retain its icon");
                check((canonical + "\n\nbody").equals(prepare.invoke(null,
                        canonical + "\nimg.5ch.io/ico/test.gif\nbody")), "Deduplicate equivalent tokens");
                String unrelated = "https://other.example/img.5ch.io/ico/test.gif";
                check(unrelated.equals(prepare.invoke(null, unrelated)), "Leave unrelated URLs alone");
                var align = test.getMethod("alignLegacyLinkRange", CharSequence.class,
                        String.class, int.class, int.class);
                String url = "https://example.com/";
                long range = (Long) align.invoke(null, "prefix " + url, url, 30, 49);
                check((int) range == 7 && (int) (range >>> 32) == 7 + url.length(),
                        "Repair offset beyond eight characters");
                range = (Long) align.invoke(null, url + " ".repeat(80) + url, url, 50, 69);
                check((int) range == 50, "Do not guess between distant duplicate links");
                String bare = "title 391(c)2ch.net\nhttp://hello.2ch.net/test/read.cgi/qa/1418210008/";
                int domainStart = bare.indexOf("2ch.net");
                range = (Long) align.invoke(null, bare, "http://2ch.net",
                        domainStart + 7, domainStart + 14);
                check((int) range == domainStart && (int) (range >>> 32) == domainStart + 7,
                        "Bare domain span must not bleed into next line");
                String abbreviated = "icon\nttp://example.com/thread/";
                String target = "http://example.com/thread/";
                range = (Long) align.invoke(null, abbreviated, target, 12, abbreviated.length() + 7);
                check((int) range == 5 && (int) (range >>> 32) == abbreviated.length(),
                        "ttp display shifted seven characters");
                range = (Long) align.invoke(null, "http://hello.2ch.net/", "http://2ch.net", 13, 20);
                check((int) range == 13, "Do not match a domain embedded in another host");
            }
            System.out.println("BE rendering regression checks passed");
        } finally {
            for (String name : new String[]{"BeUnderTest.java", "BeUnderTest.class"})
                Files.deleteIfExists(temp.resolve(name));
            Files.deleteIfExists(temp);
        }
    }
}
