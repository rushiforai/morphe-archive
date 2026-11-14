package app.morphe.extension.chmate;

/** Synthetic drafts and destinations only; no network or account data. */
public final class StockChmatePostingRulesTest {
    private static int checks;
    private static void ok(boolean value) { if (!value) throw new AssertionError("case " + checks); checks++; }
    private static void rejects(String target, String body, String subject) {
        try { StockChmatePostingRules.validate(target, body, subject); throw new AssertionError("unexpected acceptance"); }
        catch (IllegalArgumentException expected) { checks++; }
    }
    public static void main(String[] args) {
        String board = "https://bbs.eddibb.cc/liveedge/";
        String reply = "https://bbs.eddibb.cc/test/read.cgi/liveedge/1794595980/";
        ok(board.equals(StockChmatePostingRules.target("http://bbs.eddibb.cc/liveedge")));
        ok(board.equals(StockChmatePostingRules.target("https://BBS.EDDIBB.CC:443/liveedge/")));
        ok(reply.equals(StockChmatePostingRules.target(reply + "l50")));
        ok(reply.equals(StockChmatePostingRules.target(reply + "1-20")));
        ok(reply.equals(StockChmatePostingRules.target(reply.substring(0, reply.length()-1))));
        ok(StockChmatePostingRules.newThread(board));
        ok(!StockChmatePostingRules.newThread(reply));
        for (String bad : new String[]{"https://bbs.eddibb.cc.evil.test/liveedge/", "https://user@bbs.eddibb.cc/liveedge/",
                "https://bbs.eddibb.cc:8443/liveedge/", "https://bbs.eddibb.cc/liveedge/?x=1", "https://bbs.eddibb.cc/liveedge/#x",
                "file:///liveedge/", "javascript:alert(1)", "https://bbs.eddibb.cc/test/bbs.cgi", "https://bbs.eddibb.cc/other/",
                "https://bbs.eddibb.cc/test/read.cgi/liveedge/0/", "https://bbs.eddibb.cc/test/read.cgi/liveedge/9223372036854775808/",
                "https://bbs.eddibb.cc/test/read.cgi/liveedge/%31/", "https://bbs.eddibb.cc/test/read.cgi/liveedge/123/../../other/",
                "https://bbs.eddibb.cc/test/read.cgi/other/123/", "https://bbs.eddibb.cc/liveedge/../other/", null, "broken URL"})
            ok(StockChmatePostingRules.target(bad) == null);
        StockChmatePostingRules.validate(board, "本文\n>>1\n絵文字😀", "日本語スレタイ"); checks++;
        StockChmatePostingRules.validate(reply, "本文\r\n空行\n\nhttps://example.test/", null); checks++;
        StockChmatePostingRules.validate(reply, "x".repeat(StockChmatePostingRules.MAX_BODY), null); checks++;
        rejects(board, "本文", null);
        rejects(board, "本文", " \t");
        rejects(board, "本文", "改行\nタイトル");
        rejects(board, "本文", "x".repeat(1025));
        rejects(reply, " \t\r\n", null);
        rejects(reply, null, null);
        rejects(reply, "x".repeat(StockChmatePostingRules.MAX_BODY + 1), null);
        rejects("https://evil.test/liveedge/", "本文", "タイトル");
        rejects(null, "本文", "タイトル");
        System.out.println("Stock ChMate posting: " + checks + " policy checks passed");
    }
}
