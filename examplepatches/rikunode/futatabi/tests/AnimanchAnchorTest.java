package dev.rikunode.futatabi.bridge;

/** Host-side regression: source reply backlinks must never become body quotes. */
public final class AnimanchAnchorTest {
    private static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        String thread = "2735092000000";
        String raw = "<p><a class=\"reslink\" href=\"#res5\">&gt;&gt;5</a></p>"
                + "<p>body</p><div class='reply'><a class='reslink' href='#res7'>&gt;&gt;7</a></div>";
        String converted = AnimanchAdapter.replyMarkup(thread, raw);
        check(converted.equals("<p>&gt;No.2735092000005</p><p>body</p>"), "outgoing target only");
        check(AnimanchAdapter.sourceReplyText(thread, ">No.2735092000005\nbody").equals(">>5\nbody"), "reverse mapping");
        check(AnimanchAdapter.sourceReplyText(thread, ">No.9999999000005\n>>5").equals(">No.9999999000005\n>>5"), "other thread and native anchor unchanged");
        check(AnimanchAdapter.replyMarkup(thread, "<p>plain &gt;&gt;6</p>").equals("<p>plain &gt;&gt;6</p>"), "unlinked text preserved");
        System.out.println("Animanch anchor regression PASS");
    }
}
