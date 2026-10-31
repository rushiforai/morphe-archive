package e.e.a;

public final class PostingRulesTest {
    private static void check(String expected, String actual, String label) {
        if (!expected.equals(actual)) throw new AssertionError(label + ": " + actual);
    }

    public static void main(String[] args) {
        check("so46885057", PostingRules.videoId("so46885057", "so46885057", "46885057"),
            "official channel numeric API ID uses canonical watch ID");
        check("sm123", PostingRules.videoId(null, "sm123", "123"),
            "request watch ID is used when client metadata is absent");
        check("nm4", PostingRules.videoId(null, null, "nm4"),
            "canonical video ID remains a fallback");
        try {
            PostingRules.videoId(null, null, "46885057");
            throw new AssertionError("reject internal numeric ID");
        } catch (IllegalArgumentException expected) { }
        System.out.println("PostingRules: 4 checks passed");
    }
}
