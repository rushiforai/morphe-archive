package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/** The borrowing rule on synthetic audio. Plain main: prints FAIL lines and a TOTAL. */
public final class OneAheadBorrowTest {
    private static int pass, fail;

    private static void check(String name, boolean ok) {
        if (ok) pass++; else { fail++; System.out.println("FAIL " + name); }
    }

    private static final int SR = Track.SR;

    /** Reproducible programme audio: every second is its own noise burst, shaped so the level moves. */
    private static float[] programme(long seed, double seconds) {
        Random r = new Random(seed);
        float[] x = new float[(int) (seconds * SR)];
        double lvl = 0.2;
        for (int i = 0; i < x.length; i++) {
            if (i % (SR / 4) == 0) lvl = 0.05 + 0.3 * r.nextDouble();
            x[i] = (float) (lvl * (r.nextDouble() * 2 - 1));
        }
        return x;
    }

    private static float[] cat(float[]... parts) {
        int n = 0;
        for (float[] p : parts) n += p.length;
        float[] out = new float[n];
        int at = 0;
        for (float[] p : parts) { System.arraycopy(p, 0, out, at, p.length); at += p.length; }
        return out;
    }

    private static float[] cut(float[] x, double from, double to) {
        return Arrays.copyOfRange(x, (int) (from * SR), (int) (to * SR));
    }

    private static final class Fake implements OneAheadBorrow.Audio {
        final float[] pcm;
        final List<String> langs;
        int windows;
        Fake(float[] pcm, String... langs) { this.pcm = pcm; this.langs = Arrays.asList(langs); }
        @Override public double duration() { return pcm.length / (double) SR; }
        @Override public List<String> languages() { return langs; }
        @Override public void use(String language) { }
        @Override public float[] window(double start, double length) {
            windows++;
            int a = (int) (start * SR), b = Math.min(pcm.length, (int) ((start + length) * SR));
            return a >= b ? new float[0] : Arrays.copyOfRange(pcm, a, b);
        }
        @Override public void release() { }
    }

    private static final OneAheadBorrow.Named INTRO = new OneAheadBorrow.Named("OP", 90, 180, false);
    private static final OneAheadBorrow.Named CREDITS = new OneAheadBorrow.Named("credits", 1330, 1420, false);
    private static final List<OneAheadBorrow.Named> ALL = Arrays.asList(INTRO, CREDITS);

    private static OneAheadBorrow.Proof prove(float[] donor, float[] target, OneAheadBorrow.Named seg, List<OneAheadBorrow.Named> all) throws Exception {
        return OneAheadBorrow.prove(new Fake(donor, "eng"), new Fake(target, "eng"), seg, all, new Correlator());
    }

    private static boolean near(double a, double b) { return Math.abs(a - b) <= 0.02; }

    public static void main(String[] args) throws Exception {
        float[] show = programme(1, 1450);

        // A proof that passes: 1.7 s more at the target's head moves both marks by 1.7 s.
        float[] lead = cat(programme(2, 1.7), show);
        OneAheadBorrow.Proof p = prove(show, lead, INTRO, ALL);
        check("proof passes, intro " + p.refused, p.refused == null && near(p.start, 91.7) && near(p.end, 181.7));
        p = prove(show, lead, CREDITS, ALL);
        check("proof passes, credits " + p.refused, p.refused == null && near(p.start, 1331.7) && near(p.end, 1421.7));

        // Both edges lock, the far side does not: a shared theme on another episode is refused without the anchor.
        float[] other = programme(3, 1450);
        System.arraycopy(show, 90 * SR, other, 90 * SR, 90 * SR);
        p = prove(show, other, INTRO, ALL);
        check("edge-only refused: " + p.refused, "anchor".equals(p.refused));
        // The anchor must also agree: a second copy of the same programme shifted past the slack cannot pass.
        float[] farOff = cat(cut(show, 0, 900), programme(4, 2), cut(show, 900, 1448));
        p = prove(show, farOff, INTRO, ALL);
        check("anchor at another offset refused: " + p.refused, p.refused != null && p.refused.startsWith("anchor"));
        // One edge only: the end of the window is other audio.
        float[] halfEdge = cat(cut(show, 0, 150), programme(5, 1300));
        p = prove(show, halfEdge, INTRO, ALL);
        check("start edge alone refused: " + p.refused, "end-edge".equals(p.refused));

        // Different lengths: the search window opens by the length difference.
        float[] longer = cat(programme(6, 25), show);
        p = prove(show, longer, INTRO, ALL);
        check("target 25 s longer at head " + p.refused, p.refused == null && near(p.start, 115) && near(p.end, 205));
        p = prove(longer, show, new OneAheadBorrow.Named("OP", 115, 205, false), Arrays.asList(new OneAheadBorrow.Named("OP", 115, 205, false)));
        check("donor 25 s longer at head " + p.refused, p.refused == null && near(p.start, 90) && near(p.end, 180));
        float[] tailed = cat(show, programme(7, 40));
        p = prove(show, tailed, INTRO, ALL);
        check("target 40 s longer at the end " + p.refused, p.refused == null && near(p.start, 90) && near(p.end, 180));
        // A cut inside the episode moves the far side from the segment: refused, it is another edit.
        float[] edit = cat(cut(show, 0, 700), programme(8, 40), cut(show, 700, 1450));
        p = prove(show, edit, INTRO, ALL);
        check("other edit refused: " + p.refused, "anchor".equals(p.refused) || "anchor-offset".equals(p.refused));

        // Clamp at the end of the file: the predicted end is past the target's end.
        OneAheadBorrow.Named toEnd = new OneAheadBorrow.Named("credits", 1330, 1450, false);
        float[] shortEnd = cat(programme(9, 1), cut(show, 0, 1445));
        p = prove(show, shortEnd, toEnd, Arrays.asList(INTRO, toEnd));
        check("clamped to the file " + p.refused, p.refused == null && near(p.start, 1331) && p.end == 1446.0);
        // A donor chapter that runs out with its file does not bound a target that goes on.
        p = prove(show, tailed, toEnd, Arrays.asList(INTRO, toEnd));
        check("end of donor file, target goes on: " + p.refused, "end-of-file".equals(p.refused));

        // Identity from the file's own name.
        check("SxxExx", OneAheadBorrow.sameEpisode("Show.S01E05.1080p.WEB.mkv", 1, 5));
        check("other episode in a pack", !OneAheadBorrow.sameEpisode("Show.S01E06.1080p.WEB.mkv", 1, 5));
        check("other season", !OneAheadBorrow.sameEpisode("Show.S02E05.1080p.mkv", 1, 5));
        check("folder is ignored", !OneAheadBorrow.sameEpisode("Show.S01E05.Pack/Show.S01E06.mkv", 1, 5));
        check("1x05", OneAheadBorrow.sameEpisode("Show 1x05 Title.mkv", 1, 5));
        check("words", OneAheadBorrow.sameEpisode("Show Season 2 Episode 7.mkv", 2, 7));
        check("absolute with dash", OneAheadBorrow.sameEpisode("[Grp] Show - 07 [1080p].mkv", 1, 7));
        check("absolute: not the audio channels", !OneAheadBorrow.sameEpisode("[Grp] Show FLAC2.0 [1080p].mkv", 1, 2));
        check("absolute: only season one", !OneAheadBorrow.sameEpisode("[Grp] Show - 07.mkv", 2, 7));
        check("creditless is not the episode", !OneAheadBorrow.sameEpisode("[Grp] Show - NCOP 01.mkv", 1, 1));
        check("codec tag is not an episode", !OneAheadBorrow.sameEpisode("Show AAC5.1x265.mkv", 1, 265));
        check("title gate", OneAheadBorrow.titleOk("Grey's Anatomy", "Greys.Anatomy.S01E01.mkv"));
        check("title gate refuses", !OneAheadBorrow.titleOk("The Wire", "Wired.S01E01.mkv"));

        // Duration cluster: target first, a neighbouring cut drops out.
        List<Integer> kept = OneAheadBorrow.durationCluster(new double[]{1450, 1447, 1450, 2800});
        check("cluster keeps the close ones", kept.equals(Arrays.asList(0, 1, 2)));
        kept = OneAheadBorrow.durationCluster(new double[]{2800, 1450, 1447});
        check("target outside the cluster", !kept.contains(0));

        // Language.
        check("common language", "eng".equals(OneAheadBorrow.commonLanguage(Arrays.asList("eng", "spa"), Arrays.asList("spa", "eng"))));
        check("jpn first", "jpn".equals(OneAheadBorrow.commonLanguage(Arrays.asList("eng", "jpn"), Arrays.asList("jpn", "eng"))));
        check("no common language", OneAheadBorrow.commonLanguage(Arrays.asList("eng"), Arrays.asList("spa")) == null);
        check("unlabelled against labelled refused", OneAheadBorrow.commonLanguage(Arrays.asList(""), Arrays.asList("eng")) == null);
        check("both unlabelled", "".equals(OneAheadBorrow.commonLanguage(Arrays.asList(""), Arrays.asList(""))));

        // The whole run: uncached links are never touched, a weak name works through the proof, types stop when covered.
        final List<String> read = new ArrayList<>();
        final Fake donorAudio = new Fake(show, "eng");
        OneAheadBorrow.Files files = new OneAheadBorrow.Files() {
            @Override public List<OneAheadBorrow.Named> chapters(String url) {
                read.add(url);
                return url.contains("weak")
                        ? Arrays.asList(new OneAheadBorrow.Named("OP", 90, 180, true), CREDITS) : ALL;
            }
            @Override public OneAheadBorrow.Audio open(String url) { return donorAudio; }
        };
        List<OneAheadBorrow.Donor> donors = Arrays.asList(
                new OneAheadBorrow.Donor("http://x/uncached", "Show.S01E05.mkv", "Show", false),
                new OneAheadBorrow.Donor("http://x/neighbour", "Show.S01E06.mkv", "Show", true),
                new OneAheadBorrow.Donor("http://x/film", "Other.S01E05.mkv", "Other", true),
                new OneAheadBorrow.Donor("http://x/weak", "Show.S01E05.mkv", "Show", true),
                new OneAheadBorrow.Donor("http://x/second", "Show.S01E05.720p.mkv", "Show", true));
        Fake target = new Fake(lead, "eng");
        List<OneAheadResult.Segment> found = OneAheadBorrow.run(donors, target, 1, 5, "Show", true, true, files, m -> { });
        check("uncached and wrong files never read", !read.contains("http://x/uncached") && !read.contains("http://x/neighbour") && !read.contains("http://x/film"));
        check("both types proved, weak intro usable", found.size() == 2 && near(found.get(0).start, 91.7) && near(found.get(1).end, 1421.7));
        check("source name", OneAheadResult.BORROWED.equals(found.get(0).source));
        int windows = target.windows;
        check("stops at the first donor that covers everything", windows == 6);
        found = OneAheadBorrow.run(donors, target, 1, 5, "Show", false, true, files, m -> { });
        check("only the missing type", found.size() == 1 && "credits".equals(found.get(0).type));

        // Hand-off and display keep the source.
        OneAheadResult r = new OneAheadResult("v", 1, 1, OneAheadResult.DETECTOR_VERSION);
        r.segments.add(new OneAheadResult.Segment("intro", 10, 100, false, OneAheadResult.BORROWED));
        r.segments.add(new OneAheadResult.Segment("credits", 1000, 1100, false));
        List<OneAheadShow.Seg> segs = OneAheadShow.fromResult(r);
        check("display source", OneAheadResult.BORROWED.equals(segs.get(0).source) && OneAheadResult.SOURCE.equals(segs.get(1).source));
        OneAheadShow.Handoff h = OneAheadShow.decode(OneAheadShow.encode(5, 7, 1450, segs));
        check("hand-off source", h != null && OneAheadResult.BORROWED.equals(h.segs.get(0).source) && OneAheadResult.SOURCE.equals(h.segs.get(1).source));
        check("same wiring as the lowest source", OneAheadShow.isOneAhead(OneAheadResult.BORROWED));

        System.out.println("TOTAL pass=" + pass + " fail=" + fail);
        if (fail > 0) System.exit(1);
    }
}
