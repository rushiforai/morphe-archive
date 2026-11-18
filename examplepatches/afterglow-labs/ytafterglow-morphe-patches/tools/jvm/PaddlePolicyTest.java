import java.util.Arrays;
import java.util.Collections;
import app.afterglow.extension.playback.PaddlePolicy;

public final class PaddlePolicyTest {
    private static int checks;
    private static void check(String name, Object expected, Object actual) {
        checks++;
        if (!expected.equals(actual)) throw new AssertionError(name + ": " + actual + " != " + expected);
    }
    public static void main(String[] args) {
        for (String style : new String[] {"YOUTUBE", "YOUTUBE_LARGE_CONTROLS", "DIBS"}) {
            check(style + " singleton", true, PaddlePolicy.singletonVod(style, "video", "", null));
            check(style + " explicit playlist", false, PaddlePolicy.singletonVod(style, "video", "PLone", null));
            check(style + " mix", false, PaddlePolicy.singletonVod(style, "video", "RDvideo", null));
            check(style + " explicit queue", false, PaddlePolicy.singletonVod(style, "video", "", Arrays.asList("video", "next")));
            check(style + " one matching item", true, PaddlePolicy.singletonVod(style, "video", null, Collections.singletonList("video")));
            check(style + " stale queue", false, PaddlePolicy.singletonVod(style, "video", "", Collections.singletonList("old")));
            check(style + " empty queue", true, PaddlePolicy.singletonVod(style, "video", "", Collections.emptyList()));
        }
        for (String style : new String[] {null, "", "LIVE", "LIVE_DVR", "REMOTE", "REMOTE_LIVE",
                "REMOTE_LIVE_DVR", "AD", "AD_LARGE_CONTROLS", "SEEKABLE_AD", "PREROLL",
                "POSTROLL", "TRAILER", "REMOTE_TRAILER", "HIDDEN", "STATION", "unknown"}) {
            check("preserve " + style, false, PaddlePolicy.singletonVod(style, "video", "", null));
        }
        check("missing video", false, PaddlePolicy.singletonVod("YOUTUBE", null, "", null));
        check("empty video", false, PaddlePolicy.singletonVod("YOUTUBE", "", "", null));
        for (boolean original : new boolean[] {false, true}) {
            check("OFF next " + original, original, PaddlePolicy.nextPaddles(original, PaddlePolicy.NATIVE));
            check("OFF seek " + original, original, PaddlePolicy.seekPaddles(original, PaddlePolicy.NATIVE));
            check("ON replaces next " + original, false, PaddlePolicy.nextPaddles(original, PaddlePolicy.SEEK));
            check("ON seek " + original, true, PaddlePolicy.seekPaddles(original, PaddlePolicy.SEEK));
            check("hide replaces next " + original, false, PaddlePolicy.nextPaddles(original, PaddlePolicy.HIDDEN));
            check("hide seek " + original, false, PaddlePolicy.seekPaddles(original, PaddlePolicy.HIDDEN));
        }
        for (boolean enabled : new boolean[] {false, true}) {
            for (boolean hidden : new boolean[] {false, true}) {
                check("ineligible preserves native", PaddlePolicy.NATIVE, PaddlePolicy.mode(enabled, false, hidden));
                check("eligible chooses only requested mode", enabled ? hidden ? PaddlePolicy.HIDDEN : PaddlePolicy.SEEK : PaddlePolicy.NATIVE,
                        PaddlePolicy.mode(enabled, true, hidden));
            }
        }
        System.out.println(checks + " paddle policy checks passed");
    }
}
