import java.nio.file.*;
import javax.tools.ToolProvider;
public class VerifyWacchoiSuffixNg {
    public static void main(String[] args) throws Exception {
        String source = Files.readString(Path.of("extensions/chmate/src/main/java/app/morphe/extension/chmate/WacchoiSuffixNg.java"));
        String constants = source.substring(source.indexOf("    private static final int REGEX"), source.indexOf("    private static final String EXPIRY_PREFS"));
        String methods = source.substring(source.indexOf("    static short registrationFlags"), source.indexOf("    public static void confirmPrefix"))
                + source.substring(source.indexOf("    public static String clipboardValue"), source.indexOf("    public static void confirm(Context"));
        Path temp = Files.createTempDirectory("haiagaru-ng-suffix-");
        try {
            Path file = temp.resolve("Suffix.java");
            Files.writeString(file,"import java.util.regex.*; public class Suffix {" + constants + methods + "}");
            if (ToolProvider.getSystemJavaCompiler().run(null,null,null,"-d",temp.toString(),file.toString()) != 0) throw new AssertionError("compile");
            try (var loader = new java.net.URLClassLoader(new java.net.URL[]{temp.toUri().toURL()})) {
                Class<?> type = loader.loadClass("Suffix");
                var flags = type.getDeclaredMethod("registrationFlags",short.class,boolean.class,boolean.class);
                flags.setAccessible(true);
                for (boolean chain : new boolean[]{false,true}) {
                    for (boolean hidden : new boolean[]{false,true}) {
                        int expected = 0x20 | (chain ? 8 : 0) | (hidden ? 1 : 0);
                        if ((short)flags.invoke(null,(short)0,chain,hidden) != expected)
                            throw new AssertionError("new NG flags");
                        if ((short)flags.invoke(null,(short)0x1a9,chain,hidden) != (0x1a0 | expected))
                            throw new AssertionError("update must replace only chain/hidden flags");
                        if ((short)flags.invoke(null,(short)0x159,chain,hidden) != (0x100 | expected))
                            throw new AssertionError("suffix rule must use regex mode exclusively");
                    }
                }
                var extract = type.getMethod("suffix",String.class);
                var prefix = type.getMethod("prefix",String.class);
                var prefixCopy = type.getMethod("prefixClipboardValue",String.class);
                var suffixCopy = type.getMethod("suffixClipboardValue",String.class);
                var modes = type.getDeclaredMethod("registrationFlags", short.class, boolean.class, boolean.class, boolean.class, boolean.class);
                modes.setAccessible(true);
                for (boolean regexMode : new boolean[]{false,true}) for (boolean enabled : new boolean[]{false,true})
                    for (boolean chain : new boolean[]{false,true}) for (boolean hidden : new boolean[]{false,true}) {
                        int expected = 0x100 | (regexMode ? 0x20 : 0x10) | (enabled ? 0 : 4) | (chain ? 8 : 0) | (hidden ? 1 : 0);
                        if ((short)modes.invoke(null, (short)0x17d, regexMode, enabled, chain, hidden) != expected)
                            throw new AssertionError("registration mode and options must replace old flags");
                    }
                var fragment = type.getDeclaredMethod("regexFragment", String.class); fragment.setAccessible(true);
                var append = type.getDeclaredMethod("appendRegex", String.class, String.class); append.setAccessible(true);
                var strip = type.getDeclaredMethod("stripTrailingSeparators", String.class); strip.setAccessible(true);
                if (!"-aabb".equals(fragment.invoke(null,"-aabb"))) throw new AssertionError("simple fragment spelling");
                String special = (String)fragment.invoke(null,"-a+|/");
                if (!java.util.regex.Pattern.compile(special).matcher("abcd-a+|/").find()) throw new AssertionError("symbol literal escaping");
                String merged=(String)append.invoke(null,"-old1|",special);
                if (java.util.regex.Pattern.compile(merged).matcher("unrelated").find()
                        || !java.util.regex.Pattern.compile(merged).matcher("abcd-a+|/").find()
                        || !java.util.regex.Pattern.compile(merged).matcher("abcd-old1").find()) throw new AssertionError("safe alternation");
                if (!"-aabb".equals(strip.invoke(null,"-aabb||")) || !"-ab\\|".equals(strip.invoke(null,"-ab\\|")))
                    throw new AssertionError("trailing separators and escaped pipes");
                String suffix = (String) extract.invoke(null,"名無しさん (ﾜｯﾁｮｲ 8f01-uDul)");
                if (!"uDul".equals(suffix)) throw new AssertionError("suffix");
                if (!"8f01".equals(prefix.invoke(null,"名無しさん (ﾜｯﾁｮｲ 8f01-uDul)"))) throw new AssertionError("parenthesized prefix");
                if (!"8f01-".equals(prefixCopy.invoke(null,"名無しさん (ﾜｯﾁｮｲ 8f01-uDul)"))) throw new AssertionError("upper copy format");
                if (!"-uDul".equals(suffixCopy.invoke(null,"名無しさん (ﾜｯﾁｮｲ 8f01-uDul)"))) throw new AssertionError("lower copy format");
                if (suffixCopy.invoke(null,"no Wacchoi") != null || prefixCopy.invoke(null,"no Wacchoi") != null)
                    throw new AssertionError("invalid Wacchoi copy must be empty");
                var clipboard = type.getMethod("clipboardValue", String.class);
                if (!"-Kuom|".equals(clipboard.invoke(null, "名無しさん (ﾜｯﾁｮｲ abcd-Kuom)")))
                    throw new AssertionError("Clipboard format");
                if (!"-uDul|".equals(clipboard.invoke(null, "(ｽｯﾌﾟ Sd03-uDul)")))
                    throw new AssertionError("Clipboard carrier suffix");
                if (clipboard.invoke(null, "not a slip") != null) throw new AssertionError("Invalid suffix copied");
                if (!"-a+/-|".equals(clipboard.invoke(null, "abcd-a+/-")))
                    throw new AssertionError("Clipboard must preserve raw symbols");
                for (String name : new String[]{"(ｽｯﾌﾟ Sd03-uDul)", "(ｽﾌﾟﾌﾟ Sdaa-uDul)",
                        "(ｻｻｸｯﾃﾛﾗ Sp01-uDul)", "(ｵｯﾍﾟｹ Sr01-uDul)", "(ﾜｯﾁｮｲW 8f01-uDul)"}) {
                    if (!suffix.equals(extract.invoke(null, name))) throw new AssertionError("carrier suffix: " + name);
                }
                var regex = java.util.regex.Pattern.compile((String)type.getMethod("expression",String.class).invoke(null,suffix));
                if (!regex.matcher("(ﾜｯﾁｮｲ abcd-uDul)").find() || regex.matcher("(ﾜｯﾁｮｲ abcd-uDux)").find()
                        || regex.matcher("abcd-uDulExtra").find()) throw new AssertionError("suffix matching");
                String parenthesizedRegex=(String)append.invoke(null,"\\Q(ﾜｯﾁｮｲ abcd-old1)\\E|",fragment.invoke(null,"(ﾜｯﾁｮｲ abcd-uDul)"));
                var mergedParentheses=java.util.regex.Pattern.compile(parenthesizedRegex);
                if(!mergedParentheses.matcher("(ﾜｯﾁｮｲ abcd-old1)").find()||!mergedParentheses.matcher("(ﾜｯﾁｮｲ abcd-uDul)").find())
                    throw new AssertionError("parenthesized regex addition");
                if (java.util.regex.Pattern.compile(regex.pattern(), java.util.regex.Pattern.CASE_INSENSITIVE)
                        .matcher("abcd-udul").find()) throw new AssertionError("case-sensitive identity");
                if (!regex.matcher("(ｽｯﾌﾟ Sd03-uDul)").find()
                        || !regex.matcher("(ｻｻｸｯﾃﾛﾗ Sp01-uDul)").find()
                        || regex.matcher("Sd03-udul").find()
                        || regex.matcher("XSd03-uDul").find()) throw new AssertionError("carrier matching");
                String symbolic = (String)extract.invoke(null,"abcd-a+/-");
                if (!"a+/-".equals(symbolic)) throw new AssertionError("symbol suffix");
                if (!java.util.regex.Pattern.compile((String)type.getMethod("expression",String.class).invoke(null,symbolic)).matcher("ffff-a+/-").find()) throw new AssertionError("quoted symbols");
                System.out.println("Wacchoi suffix NG: all checks passed");
            }
        } finally {
            try (var paths = Files.walk(temp)) {
                for (Path p : paths.sorted(java.util.Comparator.reverseOrder()).toList()) Files.delete(p);
            }
        }
    }
}
