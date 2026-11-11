package e.e.a;

/** Regression coverage for a cold-start restored account-history tab. */
public final class TabHistory127Test {
    private static int assertions;
    private static void eq(String expected, String actual, String why) {
        assertions++;
        if (expected == null ? actual != null : !expected.equals(actual))
            throw new AssertionError(why + " expected=" + expected + " got=" + actual);
    }
    public static void main(String[] args) {
        String history = TabHistory127.ACCOUNT_HISTORY;
        eq(history, TabHistory127.url(4, ""), "empty saved account history is repaired");
        eq(history, TabHistory127.url(4, null), "missing saved account history is repaired");
        eq(history, TabHistory127.url(4, "  \t "), "whitespace-only history is repaired");
        eq(history, TabHistory127.url(4, history), "correct history URL is preserved");
        String alternative = "https://nvapi.nicovideo.jp/v2/users/me/watch/history?selectContentType=short&limit=100";
        eq(alternative, TabHistory127.url(4, alternative), "nonempty custom history URL is preserved");
        eq("", TabHistory127.url(8, ""), "local watch history is never rewritten");
        eq("", TabHistory127.url(0, ""), "search tabs are never rewritten");
        eq(null, TabHistory127.url(2, null), "missing playlist URLs stay unchanged");
        eq("https://www.nicovideo.jp/mylist/45354006",
           TabHistory127.url(3, "https://www.nicovideo.jp/mylist/45354006"),
           "public mylists are unchanged");
        eq(history, TabHistory127.url(4, TabHistory127.url(4, "")), "repair is idempotent");
        System.out.println("PASS: " + assertions
                + " account-history startup/tab restore URL assertions");
    }
}
