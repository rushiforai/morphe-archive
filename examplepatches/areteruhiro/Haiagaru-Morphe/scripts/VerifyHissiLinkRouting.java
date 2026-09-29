import app.morphe.extension.chmate.HissiLinkRouting;

/** Standalone regression check for links in Hissi's thread and response lists. */
public class VerifyHissiLinkRouting {
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    public static void main(String[] args) {
        for (String url : new String[] {
                "https://rosie.5ch.net/test/read.cgi/operatex/1600326394/l50",
                "http://rosie.5ch.net/test/read.cgi/operatex/1600326394/24",
                "https://egg.5ch.io/test/read.cgi/android/1781182873/3",
                "http://aoi.bbspink.com/test/read.cgi/3shuchaku/1427347314/19",
                "https://talk.jp/boards/newsplus/1789378339",
                "https://itest.5ch.io/egg/test/read.cgi/android/1781182873/",
                "https://bbs.eddibb.cc/test/read.cgi/liveedge/1707378532/47",
                "https://jbbs.shitaraba.net/bbs/read.cgi/anime/11177/1551207927/3",
                "https://tokyo.machi.to/bbs/read.cgi/tokyo/1690890202/3",
                "https://5chan.jp/test/read.cgi/5ch_newsplus/1684812738/1/",
                "https://yaruozatsudan.com/test/read.cgi/yaruzatsu01/1789778159/",
        }) {
            check(HissiLinkRouting.isThreadUrl(url), "Expected ChMate thread: " + url);
        }
        for (String url : new String[] {
                "http://hissi.org/read.php/operatex/20200917/UlBjVy9TdkI.html",
                "https://hissi.org/",
                "https://5ch.io/",
                "https://evil5ch.io/test/read.cgi/android/1781182873/",
                "https://egg.5ch.io.example/test/read.cgi/android/1781182873/",
                "https://user@egg.5ch.io/test/read.cgi/android/1781182873/",
                "https://evil.bbs.eddibb.cc/test/read.cgi/liveedge/1707378532/",
                "javascript:alert(1)",
                null,
        }) {
            check(!HissiLinkRouting.isThreadUrl(url), "Unexpected ChMate thread: " + url);
        }
        System.out.println("PASS: Hissi thread, response, itest, and non-thread links");
    }
}
