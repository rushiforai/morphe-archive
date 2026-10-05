package e.e.a;
import java.util.*;
public final class VideoInfoCountsTest {
    public static void main(String[] args) {
        Map<String,String> values = new HashMap<>();
        values.put("viewCount", "3670863"); values.put("commentCount", "179221");
        values.put("likeCount", "2749"); values.put("mylistCount", "8883"); values.put("nicoadCount", "375000");
        check(Arrays.equals(VideoInfoCounts.read(values::get), new long[]{3670863,179221,2749,8883}), "official order and full digits");
        check(VideoInfoCounts.read(values::get).length == 4, "advertising excluded even when present");
        values.remove("likeCount");
        check(Arrays.equals(VideoInfoCounts.read(values::get), new long[]{3670863,179221,-1,8883}), "missing optional fields hidden");
        values.put("likeCount", "0"); values.put("nicoadCount", "0");
        check(VideoInfoCounts.read(values::get)[2] == 0, "real zero counts visible");
        values.put("nicoadCount", "-1"); values.put("likeCount", "invalid");
        check(VideoInfoCounts.read(values::get)[2] == -1, "invalid data never fabricated");
        values.put("viewCount", Long.toString(Long.MAX_VALUE));
        check(VideoInfoCounts.read(values::get)[0] == Long.MAX_VALUE, "64-bit counters");
        System.out.println("Video information count checks passed");
    }
    static void check(boolean value,String message) { if (!value) throw new AssertionError(message); }
}
