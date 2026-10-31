package e.e.a;
import org.json.JSONObject;
import java.util.ArrayList;

public final class FollowFeedDataTest {
    private static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args)throws Exception{
        JSONObject page=new JSONObject("{\"code\":\"ok\",\"activities\":["+
            "{\"createdAt\":\"2026-10-07T10:00:00+09:00\",\"actor\":{\"name\":\"投稿者\"},\"thumbnailUrl\":\"https://example.com/image\",\"content\":{\"type\":\"video\",\"id\":\"sm9\",\"title\":\"動画\"}},"+
            "{\"content\":{\"type\":\"live\",\"id\":\"lv123\"}},"+
            "{\"content\":{\"type\":\"video\",\"id\":\"https://example.com\"}},null,"+
            "{\"content\":{\"type\":\"video\",\"id\":\"so123\"}}]}");
        ArrayList<FollowFeedData.Item> items=FollowFeedData.parse(page);
        check(items.size()==2,"ignore unrelated and malformed entries");
        check(items.get(0).title.equals("動画")&&items.get(0).actor.equals("投稿者"),"retain Unicode labels");
        check(items.get(0).thumbnail.equals("https://example.com/image"),"retain thumbnail URL");
        check(items.get(1).title.equals("so123")&&items.get(1).actor.isEmpty(),"missing optional fields");
        check(FollowFeedData.parse(new JSONObject("{\"activities\":[]}")).isEmpty(),"empty timeline");
        check(FollowFeedData.parse(new JSONObject()).isEmpty(),"missing array");
        JSONObject timeline=new JSONObject("{\"activities\":["+
            "{\"id\":\"upload-9\",\"kind\":\"videoUpload\",\"createdAt\":\"2026-10-07T10:00:00+09:00\",\"actor\":{\"type\":\"user\",\"id\":\"1\",\"iconUrl\":\"https://example.com/icon\"},\"content\":{\"type\":\"video\",\"id\":\"sm9\",\"video\":{\"duration\":232}}},"+
            "{\"id\":\"milestone-9\",\"kind\":\"videoViewCountAchievement\",\"content\":{\"type\":\"video\",\"id\":\"sm9\"}},"+
            "{\"kind\":\"shortVideoUpload\",\"content\":{\"type\":\"shortVideo\",\"id\":\"ss123\"}}]}");
        ArrayList<FollowFeedData.Item> records=FollowFeedData.parse(timeline);
        check(records.size()==3,"keep short and non-upload video activities");
        check(!records.get(0).key.equals(records.get(1).key),"distinct activity identities for the same video");
        check(records.get(0).duration==232&&FollowFeedData.duration(232).equals("3:52"),"duration overlay");
        check(FollowFeedData.duration(5401).equals("1:30:01"),"hour duration");
        check(records.get(0).author.icon.equals("https://example.com/icon"),"creator icon");
        check(records.get(0).matches(0,null)&&records.get(0).matches(1,"user:1")&&!records.get(0).matches(2,null),"upload and creator filters");
        check(!records.get(1).matches(0,null)&&records.get(1).matches(3,null),"all includes milestones only");
        check(records.get(2).matches(0,null)&&records.get(2).matches(2,null)&&!records.get(2).matches(1,null),"short upload filter");
        check(FollowFeedData.timestamp("2026-10-07T01:00:00Z")==records.get(0).time,"ISO time-zone offsets");
        check(FollowFeedData.timestamp("bad date")==0,"invalid date fallback");
        java.util.TimeZone.setDefault(java.util.TimeZone.getTimeZone("Asia/Tokyo"));
        long now=FollowFeedData.timestamp("2026-10-07T23:00:00+09:00");
        check(FollowFeedData.bucket(records.get(0).time,now)==0,"today bucket");
        check(FollowFeedData.bucket(FollowFeedData.timestamp("2026-10-06T00:00:00+09:00"),now)==1,"yesterday boundary");
        check(FollowFeedData.bucket(FollowFeedData.timestamp("2026-10-01T00:00:00+09:00"),now)==2,"week bucket");
        check(FollowFeedData.bucket(FollowFeedData.timestamp("2026-09-24T00:00:00+09:00"),now)==3,"month bucket");
        check(FollowFeedData.bucket(FollowFeedData.timestamp("2026-08-10T00:00:00+09:00"),now)==4,"older bucket");
        check(FollowFeedData.bucket(0,now)==5,"unknown date bucket");
        check(FollowFeedData.actors(new JSONObject("{\"actors\":[{\"id\":\"1\",\"type\":\"user\"},{\"id\":\"1\",\"type\":\"user\"},null]}")).size()==1,"actor deduplication");
        JSONObject messagePage=new JSONObject("{\"activities\":[{\"id\":\"milestone\",\"message\":{\"text\":\"500,000再生を達成しました\"},\"label\":{\"text\":\"動画\"},\"content\":{\"type\":\"video\",\"id\":\"sm9\"}}]}");
        FollowFeedData.Item message=FollowFeedData.parse(messagePage).get(0);
        check(message.message.equals("500,000再生を達成しました"),"preserve server milestone message rather than current count");
        check(message.label.equals("動画"),"preserve server activity label");
        System.out.println("Follow feed parsing checks passed");
    }
}
