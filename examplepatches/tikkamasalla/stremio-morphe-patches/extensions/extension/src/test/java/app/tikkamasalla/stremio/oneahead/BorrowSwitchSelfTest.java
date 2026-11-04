package app.tikkamasalla.stremio.oneahead;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Borrow switch table without a device: pure gate truth plus wiring checks
 * against the source text given by -Doa.src. Each check turns red when its
 * fix is reverted.
 */
public final class BorrowSwitchSelfTest {
    private static int total, fails;

    private static void check(String name, boolean ok) {
        total++;
        if (!ok) {
            fails++;
            System.out.println("FAIL " + name);
        }
    }

    private static String src(String rel) throws Exception {
        String root = System.getProperty("oa.src", "extensions/extension/src/main/java");
        return new String(Files.readAllBytes(Paths.get(root, rel)), StandardCharsets.UTF_8).replace("\r\n", "\n");
    }

    private static final String ONEAHEAD = "app/tikkamasalla/stremio/oneahead/";
    private static final String INTRO = "app/tikkamasalla/stremio/introskip/";

    private static void table() {
        check("both off runs nothing", !OneAheadGate.jobRuns(false, false)
                && !OneAheadGate.runBorrow(false) && !OneAheadGate.runDetect(false));
        check("borrow only runs borrow", OneAheadGate.jobRuns(true, false)
                && OneAheadGate.runBorrow(true) && !OneAheadGate.runDetect(false));
        check("oneahead only runs detect", OneAheadGate.jobRuns(false, true)
                && !OneAheadGate.runBorrow(false) && OneAheadGate.runDetect(true));
        check("both on runs both", OneAheadGate.jobRuns(true, true)
                && OneAheadGate.runBorrow(true) && OneAheadGate.runDetect(true));
        String url = "https://cdn.example/x.mkv";
        check("both off refused", "setting-off".equals(OneAheadGate.decideTarget(
                OneAheadGate.jobRuns(false, false), true, url, true, false, false, false)));
        check("borrow only starts", OneAheadGate.decideTarget(
                OneAheadGate.jobRuns(true, false), true, url, true, false, false, false) == null);
        check("oneahead only starts", OneAheadGate.decideTarget(
                OneAheadGate.jobRuns(false, true), true, url, true, false, false, false) == null);
        check("both on starts", OneAheadGate.decideTarget(
                OneAheadGate.jobRuns(true, true), true, url, true, false, false, false) == null);
    }

    private static void settings() throws Exception {
        String prefs = src(INTRO + "IntroSkipPrefs.java");
        check("borrow default false", prefs.contains("BORROW_DEFAULT = false"));
        check("borrow getter uses default", prefs.contains("getBoolean(KEY_BORROW, BORROW_DEFAULT)")
                && prefs.contains("return BORROW_DEFAULT;"));
        check("borrow key", prefs.contains("KEY_BORROW = \"borrow_enabled\""));
        String phone = src(INTRO + "IntroSkipSettings.java");
        check("phone row text", phone.contains("Borrow chapters from other releases"));
        check("phone row stored", phone.contains("KEY_BORROW") && phone.contains("isBorrowEnabled(context)"));
        String tv = src("app/tikkamasalla/stremio/ModSettingsActivity.java");
        check("tv row beside oneahead", tv.indexOf("KEY_ONEAHEAD") > 0
                && tv.indexOf("KEY_BORROW") > tv.indexOf("KEY_ONEAHEAD"));
        check("tv row uses default", tv.contains("KEY_BORROW") && tv.contains("BORROW_DEFAULT"));
    }

    private static void wiring() throws Exception {
        String t = src(ONEAHEAD + "OneAheadTrigger.java");
        check("prepared needs either", t.contains("|| !settingOn(ctx)) return;"));
        check("run gate needs either", t.contains("decideTarget(settingOn(ctx)"));
        check("worker decide needs either", t.contains("jobRuns(borrowOn(ctx), oneAheadOn(ctx))"));
        check("bundle carries borrow", t.contains("\"pBorrow\"") && t.contains("isBorrowEnabled(ctx)"));
        check("worker reads borrow", t.contains("workerBorrow"));
        check("guard needs either", t.contains("!settingOn(ctx) || HeapGate.belowFloor()"));
        check("mode helpers", t.contains("runBorrow(borrowOn(ctx))") && t.contains("runDetect(oneAheadOn(ctx))"));
        int mode = t.indexOf("Log.i(TAG, \"mode borrow=");
        check("mode line", mode > 0 && t.indexOf("oneahead=\"", mode) > mode);
        String modeLine = mode < 0 ? "" : t.substring(mode, t.indexOf("\n", mode));
        check("mode line no link", !modeLine.toLowerCase().contains("http")
                && !modeLine.contains("p.url") && !modeLine.contains("curUrl"));
        check("borrow skipped when off", t.contains("wantBorrow ? borrow("));
        int only = t.indexOf("if (!wantDetect) {");
        int cands = t.indexOf("List<Cand> cands = candidates(");
        int once = t.indexOf("runner.runOnce(target");
        check("borrow only ends before detection", only > 0 && cands > only && once > only);
        String branch = only < 0 ? "" : t.substring(only, t.indexOf("register(urlByHash, p.url);", only));
        check("borrow only stores proved", branch.contains("keepBorrowed"));
        check("borrow only never detects", !branch.contains("candidates(")
                && !branch.contains("runOnce") && !branch.contains("queryEpisodeStreams"));
        check("borrow limit kept", t.contains("runner.startBorrow(p.videoId)"));
        check("borrow budget kept", t.contains("borrowBudget()") && t.contains("borrowSpent("));
        String b = src(INTRO + "IntroSkipBridge.java");
        check("bridge fetch needs either", b.contains("isOneAheadEnabled(activity) && !IntroSkipPrefs.isBorrowEnabled(activity)"));
        check("bridge merge needs either", b.contains("isOneAheadEnabled(activity) || IntroSkipPrefs.isBorrowEnabled(activity)"));
        check("bridge lookup needs either", b.contains("isOneAheadEnabled(ctx) && !IntroSkipPrefs.isBorrowEnabled(ctx)"));
        check("read path needs either", t.contains("settingOn(ctx) && results(ctx).has(videoId)")
                && t.contains("!settingOn(ctx)) return null;")
                && t.contains("!settingOn(ctx)) return null;"));
        String n = src(INTRO + "NextPrep.java");
        check("nextprep prepared needs either", n.contains("isOneAheadEnabled(ctx) || IntroSkipPrefs.isBorrowEnabled(ctx)"));
        check("nextprep no read when both off", n.contains("isOneAheadEnabled(ctx) && !IntroSkipPrefs.isBorrowEnabled(ctx)) return null;"));
        String v = src("net/gtvbox/videoplayer/IntroSkip.java");
        check("vimu keeps lowest source", v.contains("OneAheadShow.isOneAhead(s.rule)"));
        check("borrowed is lowest", src(ONEAHEAD + "OneAheadShow.java").contains("source.equals(OneAheadResult.BORROWED)"));
    }

    public static void main(String[] a) throws Exception {
        table();
        settings();
        wiring();
        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
