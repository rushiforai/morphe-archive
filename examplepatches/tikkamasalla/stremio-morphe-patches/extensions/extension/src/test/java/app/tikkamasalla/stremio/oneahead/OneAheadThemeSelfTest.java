package app.tikkamasalla.stremio.oneahead;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Standalone tests for the theme-song backup (no JUnit): java
 * app.tikkamasalla.stremio.oneahead.OneAheadThemeSelfTest. Exit 1 on any failure.
 * No network, no Android at runtime: gate, trim, gap-only rule, episode range,
 * and uncertain mapping does nothing.
 */
public class OneAheadThemeSelfTest {
    static int fails = 0, total = 0;
    static void ok(String name, boolean cond, String info) {
        total++; if (!cond) fails++;
        System.out.println((cond ? "ok   " : "FAIL ") + name + (info == null ? "" : "  " + info));
    }

    static final int SR = OneAheadThemeMatcher.SR;

    /** A frequency sweep with harmonics: peaky autocorrelation like real music. */
    static float[] sweep(double f0, double f1, int n) {
        float[] x = new float[n];
        for (int i = 0; i < n; i++) {
            double t = i / (double) SR;
            double ph = 2 * Math.PI * (f0 * t + (f1 - f0) * t * t / (2 * n / (double) SR));
            x[i] = (float) (Math.sin(ph) + 0.5 * Math.sin(2 * ph) + 0.25 * Math.sin(0.5 * ph));
        }
        return x;
    }

    static float[] noise(long seed, int n) {
        java.util.Random r = new java.util.Random(seed);
        float[] x = new float[n];
        double lp = 0;
        for (int i = 0; i < n; i++) { lp = 0.7 * lp + 0.3 * r.nextGaussian(); x[i] = (float) (lp * 0.2); }
        return x;
    }

    static void gateTests() {
        float[] song = sweep(300, 1100, 15 * SR);
        float[] bed = noise(7, 60 * SR);
        float[] ep = bed.clone();
        System.arraycopy(song, 0, ep, 20 * SR, song.length);
        OneAheadThemeMatcher.Match hit = OneAheadThemeMatcher.matchEpx(ep, 0.0, song, 0, 0, "t");
        ok("same song passes the loose gate", hit.pass,
                "lag=" + hit.lagNcc + " med=" + hit.median + " hi=" + hit.hiN);
        ok("edge lands on the embed", Math.abs(hit.startS - 20.0) < 0.2 && Math.abs(hit.endS - 35.0) < 0.2,
                hit.startS + "-" + hit.endS);
        float[] other = sweep(1100, 300, 15 * SR);
        OneAheadThemeMatcher.Match miss = OneAheadThemeMatcher.matchEpx(ep, 0.0, other, 0, 0, "t");
        ok("another song fails the loose gate", !miss.pass,
                "lag=" + miss.lagNcc + " med=" + miss.median + " hi=" + miss.hiN);
        OneAheadThemeMatcher.Match quiet = OneAheadThemeMatcher.matchEpx(
                noise(9, 60 * SR), 0.0, noise(10, 15 * SR), 0, 0, "t");
        ok("noise against noise fails", !quiet.pass,
                "lag=" + quiet.lagNcc + " med=" + quiet.median + " hi=" + quiet.hiN);
        float[] zeros = new float[60 * SR];
        OneAheadThemeMatcher.Match silent = OneAheadThemeMatcher.matchEpx(zeros, 0.0, song, 0, 0, "t");
        ok("silence never matches", !silent.pass, null);
    }

    static void trimTests() {
        double[] te = OneAheadThemeMatcher.trimmed(1.98, 90.034);
        ok("trim removes 2 s each end", te != null
                && Math.abs(te[0] - 3.98) < 1e-9 && Math.abs(te[1] - 88.034) < 1e-9,
                te == null ? "null" : te[0] + "-" + te[1]);
        ok("4 s or less after trim is dropped", OneAheadThemeMatcher.trimmed(0, 4) == null, null);
        ok("just over 4 s survives", OneAheadThemeMatcher.trimmed(0, 5) != null, null);
    }

    static void gapOnlyTests() {
        Set<String> both = new HashSet<>(Arrays.asList("intro", "credits"));
        Set<String> one = new HashSet<>(Arrays.asList("intro"));
        ok("nothing missing when the lookup knows both",
                OneAheadThemes.missingTypes(true, true, both).isEmpty(), null);
        ok("audio result never re-matched",
                OneAheadThemes.missingTypes(false, false, both).isEmpty(), null);
        ok("lookup intro blocks the theme intro",
                OneAheadThemes.missingTypes(true, false, new HashSet<String>()).equals(Arrays.asList("credits")), null);
        ok("only the missing type is filled",
                OneAheadThemes.missingTypes(false, false, one).equals(Arrays.asList("credits")), null);
        ok("both filled when the run found nothing",
                OneAheadThemes.missingTypes(false, false, new HashSet<String>())
                        .equals(Arrays.asList("intro", "credits")), null);
    }

    static void rangeTests() {
        ok("open-ended range matches", Boolean.TRUE.equals(OneAheadThemeMatcher.epInRange("1203-", 1210)), null);
        ok("open-ended range ends", Boolean.FALSE.equals(OneAheadThemeMatcher.epInRange("1-12", 13)), null);
        ok("list plus range", Boolean.TRUE.equals(OneAheadThemeMatcher.epInRange("1-12,14", 14)), null);
        ok("missing range is unknown", OneAheadThemeMatcher.epInRange(null, 5) == null, null);
        ok("unknown episode is unknown", OneAheadThemeMatcher.epInRange("1-12", null) == null, null);
        List<OneAheadThemeMatcher.Theme> themes = new ArrayList<>();
        themes.add(new OneAheadThemeMatcher.Theme("OP", 2, "late", "1203-"));
        themes.add(new OneAheadThemeMatcher.Theme("OP", 1, "early", "1-12"));
        themes.add(new OneAheadThemeMatcher.Theme("OP", 3, "norange", null));
        themes.add(new OneAheadThemeMatcher.Theme("ED", 1, "ed", "1-99"));
        List<OneAheadThemeMatcher.Theme> ranked = OneAheadThemeMatcher.rank(themes, 1210, "OP");
        ok("in-range first, unknown middle, out-of-range last",
                ranked.size() == 3 && "late".equals(ranked.get(0).slug)
                        && "norange".equals(ranked.get(1).slug) && "early".equals(ranked.get(2).slug),
                ranked.get(0).slug + "," + ranked.get(1).slug + "," + ranked.get(2).slug);
    }

    static void mappingTests() {
        entryTests();
        mappingBody();
    }

    /** Multi-entry themes get suffixed slugs, so each episode range resolves to its own audio. */
    static void entryTests() {
        List<OneAheadThemeStore.Entry> entries = new ArrayList<>();
        entries.add(new OneAheadThemeStore.Entry("OP", 1, "OP1-e1", "1-6", "audioA"));
        entries.add(new OneAheadThemeStore.Entry("OP", 1, "OP1-e2", "7-12", "audioB"));
        entries.add(new OneAheadThemeStore.Entry("ED", 1, "ED1", "1-12", "audioC"));
        OneAheadThemeMatcher.Theme late =
                new OneAheadThemeMatcher.Theme("OP", 1, "OP1-e2", "7-12");
        OneAheadThemeStore.Entry got = OneAheadThemeStore.entryFor(late, entries);
        ok("second entry resolves to its own audio",
                got != null && "audioB".equals(got.audio), got == null ? "null" : got.audio);
        ok("unknown slug resolves to nothing",
                OneAheadThemeStore.entryFor(
                        new OneAheadThemeMatcher.Theme("OP", 1, "OP9", "1-2"), entries) == null, null);
        List<OneAheadThemeMatcher.Theme> ts = new ArrayList<>();
        for (OneAheadThemeStore.Entry e : entries) ts.add(e.theme());
        List<OneAheadThemeMatcher.Theme> ranked = OneAheadThemeMatcher.rank(ts, 9, "OP");
        ok("in-range entry ranks first with its own slug",
                ranked.size() == 2 && "OP1-e2".equals(ranked.get(0).slug)
                        && "OP1-e1".equals(ranked.get(1).slug),
                ranked.get(0).slug + "," + ranked.get(1).slug);
        OneAheadThemeStore.Entry first =
                OneAheadThemeStore.entryFor(ranked.get(0), entries);
        ok("ranked first entry keeps its own audio",
                first != null && "audioB".equals(first.audio), null);
    }

    static void mappingBody() {
        ok("tt id is uncertain", OneAheadThemes.kitsuOf("tt1234567", "tt1234567:2:14").isEmpty(), null);
        ok("kitsu meta id is certain", "42".equals(OneAheadThemes.kitsuOf("kitsu:42", "kitsu:42:5")), null);
        ok("kitsu video id backs up the meta", "42".equals(OneAheadThemes.kitsuOf(null, "kitsu:42:5")), null);
        ok("kitsu episode id wins over the meta", "200".equals(OneAheadThemes.kitsuOf("kitsu:100", "kitsu:200:5")), null);
        ok("non-numeric kitsu refused", OneAheadThemes.kitsuOf("kitsu:abc", "kitsu:abc:1").isEmpty(), null);
        ok("episode parses from kitsu id", OneAheadThemes.episodeOf("kitsu:42:5") == 5, null);
        ok("episode parses from tt id", OneAheadThemes.episodeOf("tt1234567:2:14") == 14, null);
        ok("junk id gives no episode", OneAheadThemes.episodeOf("junk") == 0, null);
    }

    public static void main(String[] a) throws Exception {
        gateTests(); trimTests(); gapOnlyTests(); rangeTests(); mappingTests();
        File dir = new File(a.length > 0 ? a[0] : "theme-test-tmp");
        dir.mkdirs();
        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
