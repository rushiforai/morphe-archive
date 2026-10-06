import app.morphe.extension.chmate.ReplacementRules;

public class VerifyReplacementRules {
    static void check(boolean result, String name) { if (!result) throw new AssertionError(name); }
    public static void main(String[] args) {
        ReplacementRules r = ReplacementRules.parse("\uFEFF; comment\r\n<ex2>https://example■.com/\thttps://example.com/\tmsg\r\nhello\tworld\n");
        check(r.size() == 2, "BOM/comments/CRLF");
        check("https://example.com/a+/- HELLO".equals(ReplacementRules.parse("<ex2>https://example■.com/\thttps://example.com/")
                .apply("https://example■.com/a+/- HELLO")), "URL suffix and symbols preserved");
        check("world".equals(r.apply("HELLO")), "Default case insensitive");
        check("HELLO".equals(ReplacementRules.parse("<ex2>hello\tworld").apply("HELLO")), "Case sensitive");
        check("ab".equals(ReplacementRules.parse("■\t").apply("a■b")), "Empty replacement");
        check("$1\\x".equals(ReplacementRules.parse("a\t$1\\x").apply("a")), "Literal replacement, not regex groups");
        check("c".equals(ReplacementRules.parse("a\tb\nb\tc").apply("a")), "File order");
        for (String bad : new String[]{"<rx>a\tb", "a\tb\tname", "a\tb\tmsg\t<0>example", "\tb", "no tab"}) {
            try { ReplacementRules.parse(bad); throw new AssertionError("Accepted unsupported rule: " + bad); }
            catch (IllegalArgumentException expected) { }
        }
        String huge = "a".repeat(65536);
        check(huge.equals(ReplacementRules.parse("a\t" + "x".repeat(4096)).apply(huge)), "Bounded expansion");
        check(r.apply(null) == null, "Null passthrough");
        System.out.println("Replacement rules regression checks passed");
    }
}
