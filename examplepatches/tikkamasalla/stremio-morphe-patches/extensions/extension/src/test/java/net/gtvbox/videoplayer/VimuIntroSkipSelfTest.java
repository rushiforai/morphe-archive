package net.gtvbox.videoplayer;

import java.util.ArrayList;
import java.util.List;

/** Standalone tests (no JUnit): java net.gtvbox.videoplayer.VimuIntroSkipSelfTest. Exit 1 on any failure. */
public class VimuIntroSkipSelfTest {
    static int fails = 0, total = 0;
    static void ok(String name, boolean cond, String info) {
        total++; if (!cond) fails++;
        System.out.println((cond ? "ok   " : "FAIL ") + name + (info == null ? "" : "  " + info));
    }

    /** 2400 s episode: an outro near the start with no intro is dropped, never promoted. */
    static void earlyOutroNoIntroDropped() {
        int dur = 2400000;
        // IntroDB.app outro merged after the first settle, then settled with introElsewhere=true.
        List<IntroSkip.Seg> out = new ArrayList<IntroSkip.Seg>();
        IntroSkip.settleEarlyCredits(out, false, dur);
        out.add(new IntroSkip.Seg(30000, 90000, "Credits", "introdb.app"));
        IntroSkip.settleEarlyCredits(out, true, dur);
        ok("early app outro, no intro: dropped", out.isEmpty(), "size=" + out.size());
        // SkipDB fills only types still missing: its early outro is filtered before the merge.
        List<IntroSkip.Seg> skip = new ArrayList<IntroSkip.Seg>();
        skip.add(new IntroSkip.Seg(30000, 90000, "Credits", "skipdb"));
        ok("early skipdb outro, no intro: filtered",
                IntroSkip.dropEarlyOnlineCredits(skip, dur).isEmpty(), null);
    }

    /** 2400 s episode: an outro near the end with no intro is kept as Credits. */
    static void lateOutroNoIntroKept() {
        int dur = 2400000;
        List<IntroSkip.Seg> out = new ArrayList<IntroSkip.Seg>();
        out.add(new IntroSkip.Seg(2100000, 2250000, "Credits", "skipdb"));
        IntroSkip.settleEarlyCredits(out, false, dur);
        ok("late outro, no intro: kept",
                out.size() == 1 && "Credits".equals(out.get(0).name),
                "size=" + out.size());
        List<IntroSkip.Seg> skip = new ArrayList<IntroSkip.Seg>();
        skip.add(new IntroSkip.Seg(2100000, 2250000, "Credits", "skipdb"));
        ok("late skipdb outro: passes filter",
                IntroSkip.dropEarlyOnlineCredits(skip, dur).size() == 1, null);
    }

    /** Intro plus outro together: both are kept. */
    static void introPlusOutroKept() {
        int dur = 2400000;
        List<IntroSkip.Seg> out = new ArrayList<IntroSkip.Seg>();
        out.add(new IntroSkip.Seg(60000, 150000, "Intro", "introdb"));
        out.add(new IntroSkip.Seg(2100000, 2250000, "Credits", "skipdb"));
        IntroSkip.settleEarlyCredits(out, true, dur);
        ok("intro plus outro: both kept",
                out.size() == 2 && "Intro".equals(out.get(0).name) && "Credits".equals(out.get(1).name),
                "size=" + out.size());
    }

    /** TheIntroDB mislabeled the opening as Credits with no Intro anywhere: it still becomes the Intro. */
    static void theIntroDbMislabelPromotes() {
        int dur = 2400000;
        List<IntroSkip.Seg> out = new ArrayList<IntroSkip.Seg>();
        out.add(new IntroSkip.Seg(30000, 90000, "Credits", "introdb"));
        IntroSkip.settleEarlyCredits(out, false, dur);
        ok("theintrodb early credits, no intro: promoted",
                out.size() == 1 && "Intro".equals(out.get(0).name)
                        && out.get(0).start == 30000 && out.get(0).end == 90000,
                out.isEmpty() ? "dropped" : out.get(0).name + " " + out.get(0).start + "-" + out.get(0).end);
    }

    public static void main(String[] a) {
        earlyOutroNoIntroDropped();
        lateOutroNoIntroKept();
        introPlusOutroKept();
        theIntroDbMislabelPromotes();
        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
