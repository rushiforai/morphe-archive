package e.e.a;

import java.util.Arrays;

public final class VideoCountRulesTest {
    private static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    public static void main(String[] args) {
        for (String text : new String[]{
                "再生:16,001  コメント:877  マイリス:42  いいね:2,749",
                "Views: 16,001  Comments: 877  Mylists: 42  Likes: 2,749",
                "Views:16,001 Comments:877 My Lists:42 Likes:2,749",
                "觀看：16,001  留言：877  播放清單：42  按讚：2,749"}) {
            check(Arrays.equals(VideoCountRules.parse(text), new long[]{16001, 877, 2749, 42}), "Official order across languages");
        }
        check(Arrays.equals(VideoCountRules.parse("再生:0 コメント:0 いいね:0 マイリス:0"), new long[4]), "Zero counts stay visible");
        check(Arrays.equals(VideoCountRules.parse("再生:123 | コメ:45 | マイ:6"), new long[]{123,45,-1,6}), "Legacy cache does not invent likes");
        check("16,001".equals(VideoCountRules.format(16001)), "No ten-thousand abbreviation");
        check("9,223,372,036,854,775,807".equals(VideoCountRules.format(Long.MAX_VALUE)), "All 64-bit digits survive");
        check(VideoCountRules.parse("再生:9,223,372,036,854,775,807 コメント:0 マイリス:1 いいね:2")[0] == Long.MAX_VALUE, "No 32-bit overflow");
        for (String text : new String[]{"再生:1.6万 コメント:877 マイリス:42 いいね:2,749", "Views: 1K Comments: 1 Mylists: 1", "title", "再生:1 コメント:2 マイリス:3 trailing", "再生:1 コメント:2 マイリス:3 再生:4"}) {
            check(VideoCountRules.parse(text) == null, "Do not silently drop or fabricate digits: " + text);
        }
        check(VideoCountRules.parse(null) == null, "Empty recycled row is safe");
        System.out.println("Video count checks passed");
    }
}
