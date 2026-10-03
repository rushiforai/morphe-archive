import e.e.a.ShortsRules;

public final class ShortsRulesTest {
    private static void expect(int expected, float x, float y, float density, boolean multi) {
        int actual = ShortsRules.direction(x, y, density, multi);
        if (actual != expected) throw new AssertionError(expected + " != " + actual);
    }
    public static void main(String[] args) {
        expect(0, 0, -111, 1, false); // a short pull must not change videos
        expect(1, 0, -112, 1, false);
        expect(-1, 0, 224, 2, false);
        expect(0, 0, -200, 2, false); // same distance policy on a denser screen
        expect(0, 100, -150, 1, false); // diagonal gestures belong to the normal player
        expect(0, 0, -300, 1, true); // pinch / multiple fingers must not switch
        expect(0, 150, 0, 1, false);
        if (!ShortsRules.videoId("ss46507138") || ShortsRules.videoId("sm9")
            || ShortsRules.videoId("ss1?x=y") || ShortsRules.videoId(null)) throw new AssertionError("feed ID filtering");
        String pattern = "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$";
        if (!"sm9".equals("https://www.nicovideo.jp/watch/sm9".replaceAll(pattern, "$1$2"))) throw new AssertionError("normal URL");
        if (!"ss46507138".equals("https://www.nicovideo.jp/shorts/ss46507138?ref=test".replaceAll(pattern, "$1$2"))) throw new AssertionError("short URL");
        System.out.println("Shorts gesture and URL checks passed");
    }
}
