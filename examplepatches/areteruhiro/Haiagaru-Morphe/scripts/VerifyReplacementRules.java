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
        // CASE_INSENSITIVE matches TRACK but captured text preserves the source case.
        check("TRACK-12:jpg".equals(ReplacementRules.parse("<rx>(track)-(\\d+)\\.(jpe?g)\t$1-$2:$3")
                .apply("TRACK-12.jpg")), "Regex groups and case insensitive");
        check("TRACK-12.jpg".equals(ReplacementRules.parse("<rx2>(track)-(\\d+)\t$1/$2")
                .apply("TRACK-12.jpg")), "Regex case sensitive");
        check("https://imgur.com/a/qLQYKm9".equals(ReplacementRules.parse("<rx2>(https://imgur\\.com/a/[A-Za-z0-9]+)\\.(?:jpg|mp4|gifv)$\t$1")
                .apply("https://imgur.com/a/qLQYKm9.gifv")), "Regex fake extension stripping");
        check("$3\\abc".equals(ReplacementRules.parse("<rx>(abc)\t\\$3\\\\$1")
                .apply("abc")), "Regex literal dollars and slash");
        check("left:value".equals(ReplacementRules.parse("<rx>(?<word>[a-z]+)=(\\d+)\t${word}:value")
                .apply("left=13")), "Named regex group");
        for (String bad : new String[]{"<rx>(\tb", "a\tb\tname", "a\tb\tmsg\t<0>example", "\tb", "no tab"}) {
            try { ReplacementRules.parse(bad); throw new AssertionError("Accepted unsupported rule: " + bad); }
            catch (IllegalArgumentException expected) { }
        }
        String huge = "a".repeat(65536);
        check(huge.equals(ReplacementRules.parse("a\t" + "x".repeat(4096)).apply(huge)), "Bounded expansion");
        check(huge.equals(ReplacementRules.parse("<rx>a\t" + "x".repeat(4096)).apply(huge)), "Regex expansion bounded");
        check("value".equals(ReplacementRules.parse("<rx>(a+)+$\tblocked").apply("value")), "No regex false matches");
        String pathological = "a".repeat(4000) + "!";
        check(pathological.equals(ReplacementRules.parse("<rx>(a+)+$\tblocked").apply(pathological)), "Regex time bounded");
        check(r.apply(null) == null, "Null passthrough");
        System.out.println("Replacement rules regression checks passed");
    }
}
