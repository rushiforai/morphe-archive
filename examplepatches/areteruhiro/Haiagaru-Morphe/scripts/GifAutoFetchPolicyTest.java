package app.morphe.extension.chmate;

import java.util.Arrays;

public final class GifAutoFetchPolicyTest {
    static int checks;
    static void check(boolean value) { if (!value) throw new AssertionError("check " + checks); checks++; }
    public static void main(String[] args) {
        for (int mode = 0; mode < 4; mode++) {
            check(GifAutoFetchPolicy.mode(mode, false) == mode);
            check(GifAutoFetchPolicy.image(mode) == (mode == 0 || mode == 1));
            check(GifAutoFetchPolicy.gif(mode) == (mode == 0 || mode == 2));
        }
        check(GifAutoFetchPolicy.mode(-1, true) == 2);
        check(GifAutoFetchPolicy.mode(8, false) == 3);
        check(GifAutoFetchPolicy.supported("https://example.org/a.GIF?x=1#two"));
        for (String url : new String[]{"https://example.org/a.gifv", "https://example.org/a.mp4",
                "https://example.org/a.gif/page", "https://example.org/a.jpg?x=a.gif",
                "file:///a.gif", "https://user:pass@example.org/a.gif", "javascript:a.gif", "broken", null})
            check(!GifAutoFetchPolicy.supported(url));
        check(Arrays.equals(GifAutoFetchPolicy.extract("https://example.org/a.gif?x=1&amp;y=2 "
                + "https://example.org/a.gif?x=1&amp;y=2 https://example.org/a.mp4"),
                new String[]{"https://example.org/a.gif?x=1&y=2"}));
        check(GifAutoFetchPolicy.extract(null).length == 0);
        StringBuilder many = new StringBuilder(); for (int i = 0; i < 30; i++) many.append("https://example.org/").append(i).append(".gif ");
        check(GifAutoFetchPolicy.extract(many.toString()).length == 8);
        System.out.println("PASS GIF auto-fetch URL/policy " + checks + " checks");
    }
}
