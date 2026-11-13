package app.morphe.extension.chmate;

import java.util.regex.Pattern;

public final class SiteBoardPatternsTest {
    static int checks;
    static void check(boolean value, String label) {
        if (!value) throw new AssertionError(label);
        checks++;
    }

    public static void main(String[] args) {
        Pattern edge = SiteBoardPatterns.direct("edge"), org = SiteBoardPatterns.direct("kenmo");
        // BoardID.c in 191/226/242 is an http URL, even for HTTPS registrations.
        for (String scheme : new String[]{"http", "https"}) {
            for (String host : new String[]{"bbs.eddibb.cc", "bbs.eddibb.org"}) {
                String board = scheme + "://" + host + "/liveedge/";
                check(edge.matcher(board).find(), "Edge belongs to its native provider: " + board);
                check(!org.matcher(board).find(), "Edge cannot become Org");
            }
            for (String host : new String[]{"kenmo.org", "00c.org"}) {
                for (String path : new String[]{"poverty", "live", "board_1-test"}) {
                    String board = scheme + "://" + host + "/" + path + "/";
                    check(org.matcher(board).find(), "Org belongs to its native provider: " + board);
                    check(!edge.matcher(board).find(), "Org cannot become Edge");
                }
            }
        }
        for (String invalid : new String[]{"https://evilkenmo.org/poverty/", "https://kenmo.org.evil.test/poverty/",
                "https://user@kenmo.org/poverty/", "https://kenmo.org/poverty/?x=1",
                "https://kenmo.org/test/read.cgi/poverty/123/", "https://kenmo.org/",
                "ftp://kenmo.org/poverty/", "prefixhttp://kenmo.org/poverty/"})
            check(!org.matcher(invalid).find(), "not an Org board: " + invalid);
        for (String invalid : new String[]{"https://bbs.eddibb.cc.evil.test/liveedge/",
                "https://bbs.eddibb.cc/other/", "https://bbs.eddibb.cc/test/read.cgi/liveedge/123/",
                "https://user@bbs.eddibb.cc/liveedge/", "prefixhttp://bbs.eddibb.cc/liveedge/"})
            check(!edge.matcher(invalid).find(), "not an Edge board: " + invalid);
        check(SiteBoardPatterns.direct("bakusai") == null, "Bakusai gateway classification retained");
        check(SiteBoardPatterns.direct("futaba") == null, "Futaba gateway classification retained");
        check(SiteBoardPatterns.direct("animanch") == null, "Animanch gateway classification retained");
        check(!Pattern.compile("https://bbs\\.eddibb\\.cc/liveedge/").matcher("http://bbs.eddibb.cc/liveedge/").find(),
                "old HTTPS-only provider reproduces fallthrough to Other");
        System.out.println("Site board patterns: " + checks + " checks passed");
    }
}
