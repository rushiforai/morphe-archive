package app.xfilter.extension;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PostFilterTest {

    // Builders for X 12.19.1's GraphQL timeline shape.

    private static JSONObject tweet(String text, boolean following, boolean blue, String verifiedType) throws Exception {
        JSONObject userLegacy = new JSONObject().put("screen_name", "Alice").put("following", following);
        if (verifiedType != null) userLegacy.put("verified_type", verifiedType);
        JSONObject user = new JSONObject().put("__typename", "User").put("is_blue_verified", blue).put("legacy", userLegacy);
        JSONObject legacy = new JSONObject()
                .put("full_text", text)
                .put("lang", "en")
                .put("in_reply_to_status_id_str", JSONObject.NULL)
                .put("entities", new JSONObject().put("hashtags", new JSONArray()).put("urls", new JSONArray()));
        return new JSONObject()
                .put("__typename", "Tweet")
                .put("core", new JSONObject().put("user_result", new JSONObject().put("result", user)))
                .put("legacy", legacy);
    }

    private static JSONObject tweet(String text) throws Exception {
        return tweet(text, true, false, null);
    }

    private static JSONObject timelineTweet(JSONObject tweet) throws Exception {
        return new JSONObject().put("__typename", "TimelineTweet")
                .put("tweetResult", new JSONObject().put("result", tweet));
    }

    private static JSONObject item(String id, JSONObject tweet) throws Exception {
        return new JSONObject().put("entryId", id).put("sortIndex", "1")
                .put("content", new JSONObject().put("__typename", "TimelineTimelineItem").put("content", timelineTweet(tweet)));
    }

    private static JSONObject module(String id, JSONObject... tweets) throws Exception {
        JSONArray items = new JSONArray();
        for (int i = 0; i < tweets.length; i++) {
            items.put(new JSONObject().put("entryId", id + "-tweet-" + i)
                    .put("item", new JSONObject().put("content", timelineTweet(tweets[i]))));
        }
        return new JSONObject().put("entryId", id)
                .put("content", new JSONObject().put("__typename", "TimelineTimelineModule").put("items", items));
    }

    private static JSONObject cursor(String id) throws Exception {
        return new JSONObject().put("entryId", id)
                .put("content", new JSONObject().put("__typename", "TimelineTimelineCursor").put("value", "x"));
    }

    private static List<String> ids(JSONArray entries) {
        List<String> out = new ArrayList<>();
        for (int i = 0; i < entries.length(); i++) out.add(entries.optJSONObject(i).optString("entryId"));
        return out;
    }

    private static PostFilter.Rules rules(Object... kv) {
        Map<String, Object> m = new HashMap<>();
        for (int i = 0; i < kv.length; i += 2) m.put((String) kv[i], kv[i + 1]);
        return PostFilter.Rules.from(m);
    }

    private static final PostFilter.Rules ALL = rules(
            PostFilter.REPOSTS, true,
            PostFilter.BLUE_NOT_FOLLOWED, true,
            PostFilter.WHO_TO_FOLLOW, true,
            PostFilter.CONTAINS, "Crypto\n\n",
            PostFilter.STARTS_WITH, "gm",
            PostFilter.ENDS_WITH, "WORLD",
            PostFilter.REGEX, "\\d+ dollars\n(unclosed",
            PostFilter.MIN_LENGTH, "3",
            PostFilter.MAX_LENGTH, "40",
            PostFilter.MUTED_USERS, "@spammer");

    @Test
    public void homeTimeline() throws Exception {
        JSONObject repostInner = tweet("original post");
        JSONObject repost = tweet("RT @x: original post");
        repost.getJSONObject("legacy").put("retweeted_status_result", new JSONObject().put("result", repostInner));

        JSONObject reply = tweet("@bob hello world https://t.co/abc");
        reply.getJSONObject("legacy").put("display_text_range", new JSONArray(Arrays.asList(5, 16)));

        JSONObject promotedHolder = item("tweet-2", tweet("buy this"));
        promotedHolder.getJSONObject("content").getJSONObject("content").put("promotedMetadata", new JSONObject());

        JSONObject muted = tweet("normal text here");
        muted.getJSONObject("core").getJSONObject("user_result").getJSONObject("result")
                .getJSONObject("legacy").put("screen_name", "Spammer");

        JSONArray entries = new JSONArray()
                .put(cursor("cursor-top-1"))
                .put(item("promoted-tweet-1", tweet("ad")))
                .put(promotedHolder)
                .put(item("tweet-3", repost))
                .put(item("tweet-4", tweet("i pay for blue", false, true, null)))
                .put(item("tweet-5", tweet("we are a business", false, true, "Business")))
                .put(item("tweet-6", tweet("Buy CRYPTO now")))
                .put(item("tweet-7", reply))
                .put(item("tweet-8", tweet("GM everyone")))
                .put(item("tweet-9", tweet("this post is definitely longer than forty characters")))
                .put(item("tweet-10", tweet("ok")))
                .put(item("tweet-11", tweet("price is 100 dollars")))
                .put(item("tweet-12", tweet("hello friends")))
                .put(item("tweet-13", muted))
                .put(module("who-to-follow-1", tweet("follow me")))
                .put(module("home-conversation-1", tweet("crypto a"), tweet("gm b")))
                .put(module("home-conversation-2", tweet("crypto c"), tweet("kept reply")))
                .put(cursor("cursor-bottom-1"));

        JSONObject root = new JSONObject().put("data", new JSONObject().put("timeline_response",
                new JSONObject().put("timeline", new JSONObject().put("instructions", new JSONArray()
                        .put(new JSONObject().put("__typename", "TimelineAddEntries").put("entries", entries))))));

        PostFilter.filterResponse(root, ALL);

        assertEquals(Arrays.asList("cursor-top-1", "tweet-5", "tweet-12", "home-conversation-2", "cursor-bottom-1"), ids(entries));
        JSONArray kept = entries.getJSONObject(3).getJSONObject("content").getJSONArray("items");
        assertEquals(Arrays.asList("home-conversation-2-tweet-1"), ids(kept));
    }

    @Test
    public void repliesKeepFocalPost() throws Exception {
        JSONArray entries = new JSONArray()
                .put(item("tweet-100", tweet("crypto focal post")))
                .put(module("conversationthread-1", tweet("crypto reply")))
                .put(module("conversationthread-2", tweet("nice reply")))
                .put(module("tweetdetailrelatedtweets-1", tweet("related")));
        // Key-style union, the other form the app's parser accepts.
        JSONObject root = new JSONObject().put("data", new JSONObject().put("timeline_response",
                new JSONObject().put("instructions", new JSONArray()
                        .put(new JSONObject().put("addEntries", new JSONObject().put("entries", entries))))));

        PostFilter.filterResponse(root, ALL);

        assertEquals(Arrays.asList("tweet-100", "conversationthread-2", "tweetdetailrelatedtweets-1"), ids(entries));
    }

    @Test
    public void profileOnlyDropsFeedItems() throws Exception {
        JSONArray entries = new JSONArray()
                .put(item("promoted-tweet-1", tweet("ad")))
                .put(item("tweet-1", tweet("crypto on my profile")));
        JSONObject root = new JSONObject().put("data", new JSONObject().put("user_result",
                new JSONObject().put("result", new JSONObject().put("timeline_response", new JSONObject()
                        .put("timeline", new JSONObject().put("instructions", new JSONArray()
                                .put(new JSONObject().put("__typename", "TimelineAddEntries").put("entries", entries))))))));

        PostFilter.filterResponse(root, ALL);

        assertEquals(Arrays.asList("tweet-1"), ids(entries));
    }

    @Test
    public void nonTimelineStreamsPassThrough() throws Exception {
        for (String body : new String[]{"", "[1]", "{\"errors\":[]}", "{\"data\":{\"viewer\":{\"id\":1}}}"}) {
            byte[] in = body.getBytes(StandardCharsets.UTF_8);
            byte[] out = readFully(PostFilter.filter(new ByteArrayInputStream(in)));
            assertArrayEquals(body, in, out);
        }
    }

    private static byte[] readFully(InputStream in) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int b;
        while ((b = in.read()) != -1) out.write(b);
        return out.toByteArray();
    }

    @Test
    public void scopeSwitchesAndDefaults() throws Exception {
        JSONArray entries = new JSONArray().put(item("tweet-1", tweet("crypto")));
        JSONObject root = new JSONObject().put("data", new JSONObject().put("search",
                new JSONObject().put("timeline_response", new JSONObject().put("timeline", new JSONObject()
                        .put("instructions", new JSONArray().put(new JSONObject().put("entries", entries)))))));

        PostFilter.filterResponse(root, rules(PostFilter.CONTAINS, "crypto", PostFilter.SCOPE_SEARCH, false));
        assertEquals(1, entries.length());

        PostFilter.filterResponse(root, rules(PostFilter.CONTAINS, "crypto"));
        assertEquals(0, entries.length());

        assertFalse(rules(PostFilter.PROMOTED, false).any);
    }
}
