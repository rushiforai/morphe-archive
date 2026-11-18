package io.github.sabopura.morphe.extension.twitch.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.util.EnumSet;
import java.util.Set;

import io.github.sabopura.morphe.extension.twitch.app.NewHomeSections.Part;

public class NewHomeSectionsTest {
    private static final Set<Part> ALL = EnumSet.allOf(Part.class), NONE = EnumSet.noneOf(Part.class);

    /** The Following tab's sections as Twitch 31.9.0 receives them, cut down to what the home reads. */
    private static final String TAB = "{\"data\":{\"user\":{\"id\":\"1\","
            + "\"follows\":{\"edges\":[{\"cursor\":\"c\",\"__typename\":\"FollowEdge\"}]},"
            + "\"followedGames\":{\"nodes\":[{\"id\":\"509658\",\"displayName\":\"雑談\"},{\"id\":\"2\"}],\"__typename\":\"FollowedGameConnection\"},"
            + "\"viewedVideos\":{\"edges\":[{\"node\":{\"id\":\"v1\",\"title\":\"\\\"quoted\\\" / title\"}}]},"
            + "\"followedLiveUsers\":{\"edges\":[{\"node\":{\"id\":\"9\",\"stream\":{\"id\":\"s\",\"viewersCount\":12}}}]}}},"
            + "\"extensions\":{\"durationMilliseconds\":41,\"operationName\":\"MwebFollowingTabSections\"}}";

    private static final String OFFLINE = "{\"data\":{\"user\":{\"id\":\"1\",\"follows\":{"
            + "\"pageInfo\":{\"hasNextPage\":true,\"endCursor\":\"e\"},\"edges\":["
            + "{\"cursor\":\"a\",\"node\":{\"id\":\"10\",\"lastBroadcast\":{\"id\":\"b\"},\"stream\":null}},"
            + "{\"cursor\":\"b\",\"node\":{\"id\":\"11\",\"lastBroadcast\":{\"id\":\"c\"},\"stream\":{\"id\":\"s\"}}},"
            + "{\"cursor\":\"c\",\"node\":{\"id\":\"12\",\"lastBroadcast\":{\"id\":null},\"stream\":null}}]}},"
            + "\"currentUser\":{\"id\":\"1\",\"followedVideos\":{\"edges\":[{\"node\":{\"id\":\"v\"}}]}}}}";

    private static final String BUTTON = "{\"data\":{\"subscriptionProduct\":{\"id\":\"p\",\"self\":{\"benefit\":null},"
            + "\"offers\":[{\"id\":\"o\",\"eligibility\":{\"isEligible\":true}}]}},"
            + "\"extensions\":{\"operationName\":\"TurboUpsellButton\"}}";

    private static JSONObject user(String body) throws JSONException {
        return new JSONObject(body).getJSONObject("data").getJSONObject("user");
    }

    @Test
    public void aHiddenSectionIsEmptiedAndTheOthersAreKept() throws JSONException {
        JSONObject user = user(NewHomeSections.without(TAB, EnumSet.of(Part.CATEGORIES)));
        assertEquals(0, user.getJSONObject("followedGames").getJSONArray("nodes").length());
        assertEquals("FollowedGameConnection", user.getJSONObject("followedGames").getString("__typename"));
        assertEquals(1, user.getJSONObject("viewedVideos").getJSONArray("edges").length());
        assertEquals(1, user.getJSONObject("followedLiveUsers").getJSONArray("edges").length());
        assertEquals(1, user.getJSONObject("follows").getJSONArray("edges").length());
    }

    @Test
    public void everySectionOfTheTabCanBeHiddenAtOnce() throws JSONException {
        JSONObject user = user(NewHomeSections.without(TAB, ALL));
        assertEquals(0, user.getJSONObject("followedGames").getJSONArray("nodes").length());
        assertEquals(0, user.getJSONObject("viewedVideos").getJSONArray("edges").length());
        // The live channels are what the tab is for, and "is anyone followed" keeps its answer.
        assertEquals(12, user.getJSONObject("followedLiveUsers").getJSONArray("edges").getJSONObject(0)
                .getJSONObject("node").getJSONObject("stream").getInt("viewersCount"));
        assertEquals("c", user.getJSONObject("follows").getJSONArray("edges").getJSONObject(0).getString("cursor"));
    }

    @Test
    public void whatIsNotHiddenComesBackAsItWas() throws JSONException {
        String changed = NewHomeSections.without(TAB, EnumSet.of(Part.VIDEOS));
        JSONObject after = new JSONObject(changed);
        assertEquals("雑談", after.getJSONObject("data").getJSONObject("user").getJSONObject("followedGames")
                .getJSONArray("nodes").getJSONObject(0).getString("displayName"));
        assertEquals(41, after.getJSONObject("extensions").getInt("durationMilliseconds"));
        assertEquals("MwebFollowingTabSections", after.getJSONObject("extensions").getString("operationName"));
        assertEquals(0, user(changed).getJSONObject("viewedVideos").getJSONArray("edges").length());
    }

    @Test
    public void nothingToHideLeavesTheBodyAlone() throws JSONException {
        assertNull(NewHomeSections.without(TAB, NONE));
        // The offline list and the button are other answers; this one has none of them.
        assertNull(NewHomeSections.without(TAB, EnumSet.of(Part.OFFLINE, Part.AD_FREE)));
        String empty = "{\"data\":{\"user\":{\"followedLiveUsers\":{\"edges\":[]},\"followedGames\":{\"nodes\":[]},\"viewedVideos\":{\"edges\":[]}}}}";
        assertNull(NewHomeSections.without(empty, ALL));
    }

    @Test
    public void theSameListsAskedForByAnotherScreenAreLeftAlone() throws JSONException {
        // Without the live channels beside them this is not the Following tab's question.
        String browse = "{\"data\":{\"user\":{\"id\":\"1\",\"followedGames\":{\"nodes\":[{\"id\":\"2\"}]},\"viewedVideos\":{\"edges\":[{\"node\":{\"id\":\"v\"}}]}}}}";
        assertNull(NewHomeSections.without(browse, ALL));
        String feedCard = "{\"data\":{\"currentUser\":{\"id\":\"1\",\"viewedVideos\":{\"edges\":[{\"node\":{\"id\":\"v\"}}]}}}}";
        assertNull(NewHomeSections.without(feedCard, ALL));
    }

    @Test
    public void queriesAnsweredTogetherAreEachLookedAt() throws JSONException {
        String other = "{\"data\":{\"requestInfo\":{\"countryCodeAlpha2\":\"JP\"}}}";
        JSONArray answers = new JSONArray(NewHomeSections.without("[" + other + "," + TAB + "," + OFFLINE + "]", ALL));
        assertEquals(3, answers.length());
        assertEquals("JP", answers.getJSONObject(0).getJSONObject("data").getJSONObject("requestInfo").getString("countryCodeAlpha2"));
        JSONObject tab = answers.getJSONObject(1).getJSONObject("data").getJSONObject("user");
        assertEquals(0, tab.getJSONObject("followedGames").getJSONArray("nodes").length());
        assertEquals(0, tab.getJSONObject("viewedVideos").getJSONArray("edges").length());
        assertEquals(1, answers.getJSONObject(2).getJSONObject("data").getJSONObject("user").getJSONObject("follows").getJSONArray("edges").length());
        assertNull(NewHomeSections.without("[" + other + "]", ALL));
    }

    @Test
    public void offlineChannelsLeaveTheListAndLiveOnesStay() throws JSONException {
        JSONObject root = new JSONObject(NewHomeSections.without(OFFLINE, EnumSet.of(Part.OFFLINE)));
        JSONObject follows = root.getJSONObject("data").getJSONObject("user").getJSONObject("follows");
        assertEquals(1, follows.getJSONArray("edges").length());
        assertEquals("11", follows.getJSONArray("edges").getJSONObject(0).getJSONObject("node").getString("id"));
        // No further page is asked for: it would only bring more channels to drop.
        assertFalse(follows.getJSONObject("pageInfo").getBoolean("hasNextPage"));
        assertEquals("e", follows.getJSONObject("pageInfo").getString("endCursor"));
        assertEquals(1, root.getJSONObject("data").getJSONObject("currentUser").getJSONObject("followedVideos").getJSONArray("edges").length());
    }

    @Test
    public void aPageWithoutOfflineChannelsIsLeftAlone() throws JSONException {
        String live = "{\"data\":{\"user\":{\"follows\":{\"pageInfo\":{\"hasNextPage\":true},\"edges\":["
                + "{\"node\":{\"id\":\"11\",\"lastBroadcast\":{\"id\":\"c\"},\"stream\":{\"id\":\"s\"}}}]}}}}";
        assertNull(NewHomeSections.without(live, EnumSet.of(Part.OFFLINE)));
        assertNull(NewHomeSections.without(OFFLINE, EnumSet.of(Part.CATEGORIES, Part.VIDEOS, Part.AD_FREE)));
    }

    @Test
    public void aFollowedAccountThatIsGoneDoesNotKeepTheOfflineList() throws JSONException {
        // Twitch answers null for the channel of a deleted or suspended account.
        String page = "{\"data\":{\"user\":{\"follows\":{\"pageInfo\":{\"hasNextPage\":false},\"edges\":["
                + "{\"cursor\":\"a\",\"node\":null},"
                + "{\"cursor\":\"b\",\"node\":{\"id\":\"10\",\"lastBroadcast\":{\"id\":\"b\"},\"stream\":null}},"
                + "{\"cursor\":\"c\",\"node\":{\"id\":\"11\",\"lastBroadcast\":{\"id\":\"c\"},\"stream\":{\"id\":\"s\"}}}]}}}}";
        JSONArray edges = user(NewHomeSections.without(page, EnumSet.of(Part.OFFLINE))).getJSONObject("follows").getJSONArray("edges");
        assertEquals(1, edges.length());
        assertEquals("11", edges.getJSONObject(0).getJSONObject("node").getString("id"));
        // Nothing but gone accounts tells nothing about what the list is: left alone.
        assertNull(NewHomeSections.without("{\"data\":{\"user\":{\"follows\":{\"edges\":[{\"cursor\":\"a\",\"node\":null}]}}}}", ALL));
    }

    @Test
    public void aBodyWithMoreThanOneValueIsLeftAlone() throws JSONException {
        assertNull(NewHomeSections.without(TAB + "\n" + TAB, ALL));
        assertNull(NewHomeSections.without(TAB + " x", ALL));
        // Space after the value is still one value.
        assertEquals(0, user(NewHomeSections.without(TAB + " \r\n", ALL)).getJSONObject("followedGames").getJSONArray("nodes").length());
    }

    private static byte[] bytes(String text) {
        return text.getBytes(StandardCharsets.UTF_8);
    }

    @Test
    public void aBodyWithNothingHiddenIsTheSameArray() throws JSONException {
        byte[] tab = bytes(TAB), feed = bytes("{\"data\":{\"feedItems\":{\"edges\":[]}}}"), image = {(byte) 0x89, 'P', 'N', 'G'};
        assertSame(tab, NewHomeSections.without(tab, part -> false));
        // Hidden, but this answer has none of it.
        assertSame(tab, NewHomeSections.without(tab, part -> part == Part.OFFLINE || part == Part.AD_FREE));
        assertSame(feed, NewHomeSections.without(feed, part -> true));
        assertSame(image, NewHomeSections.without(image, part -> true));
        assertNull(NewHomeSections.without((byte[]) null, part -> true));
        byte[] empty = {};
        assertSame(empty, NewHomeSections.without(empty, part -> true));
        // The name is there but the section is already empty: nothing to write back.
        byte[] bare = bytes("{\"data\":{\"user\":{\"followedLiveUsers\":{\"edges\":[]},\"followedGames\":{\"nodes\":[]}}}}");
        assertSame(bare, NewHomeSections.without(bare, part -> true));
    }

    @Test
    public void aHiddenPartIsCutFromTheBytesAndTheRestSurvives() throws JSONException {
        byte[] changed = NewHomeSections.without(bytes(TAB), part -> part == Part.VIDEOS);
        JSONObject user = user(new String(changed, StandardCharsets.UTF_8));
        assertEquals(0, user.getJSONObject("viewedVideos").getJSONArray("edges").length());
        assertEquals("雑談", user.getJSONObject("followedGames").getJSONArray("nodes").getJSONObject(0).getString("displayName"));
        // Bytes go in and out as UTF-8: the changed body is not longer than the cut explains.
        assertTrue(changed.length < bytes(TAB).length);
    }

    @Test(expected = JSONException.class)
    public void aBrokenBodyWithAHiddenPartIsReported() throws JSONException {
        NewHomeSections.without(bytes("{\"data\":{\"user\":{\"followedGames\":{\"nodes\":[{\"id\":"), part -> true);
    }

    @Test
    public void aChannelPageThatNamesItsLastBroadcastIsNotAList() throws JSONException {
        String profile = "{\"data\":{\"channelByLogin\":{\"id\":\"5\",\"lastBroadcast\":{\"id\":\"b\"},\"stream\":null},"
                + "\"user\":{\"id\":\"5\",\"lastBroadcast\":{\"id\":\"b\"},\"stream\":null}}}";
        assertNull(NewHomeSections.without(profile, ALL));
    }

    @Test
    public void theAdFreeButtonIsLeftWithoutAnOffer() throws JSONException {
        JSONObject product = new JSONObject(NewHomeSections.without(BUTTON, EnumSet.of(Part.AD_FREE)))
                .getJSONObject("data").getJSONObject("subscriptionProduct");
        assertEquals(0, product.getJSONArray("offers").length());
        assertEquals("p", product.getString("id"));
        // Whether the viewer already has the plan is not touched: Twitch's ad decisions read it.
        assertTrue(product.getJSONObject("self").isNull("benefit"));
        assertNull(NewHomeSections.without(BUTTON, EnumSet.of(Part.CATEGORIES, Part.VIDEOS, Part.OFFLINE)));
    }

    @Test
    public void offersAskedForByAnotherScreenAreKept() throws JSONException {
        assertNull(NewHomeSections.without(BUTTON.replace("TurboUpsellButton", "SubscribeButton"), ALL));
        assertNull(NewHomeSections.without(BUTTON.replace(",\"extensions\":{\"operationName\":\"TurboUpsellButton\"}", ""), ALL));
    }

    @Test
    public void answersOfAnotherShapeAreLeftAlone() throws JSONException {
        assertNull(NewHomeSections.without("{\"errors\":[{\"message\":\"service timeout\"}]}", ALL));
        assertNull(NewHomeSections.without("{\"data\":null}", ALL));
        assertNull(NewHomeSections.without("{\"data\":{\"user\":null}}", ALL));
        assertNull(NewHomeSections.without("{\"data\":{\"user\":{\"followedLiveUsers\":null,\"followedGames\":null,"
                + "\"viewedVideos\":{\"edges\":null},\"follows\":{\"edges\":[null]}}}}", ALL));
        assertNull(NewHomeSections.without("{\"data\":{\"subscriptionProduct\":null},\"extensions\":{\"operationName\":\"TurboUpsellButton\"}}", ALL));
        assertNull(NewHomeSections.without("[1,\"two\",null]", ALL));
        assertNull(NewHomeSections.without("\"text\"", ALL));
    }

    @Test(expected = JSONException.class)
    public void aBrokenBodyIsReportedNotGuessedAt() throws JSONException {
        NewHomeSections.without("{\"data\":{\"user\":{\"followedGames\":{\"nodes\":[{\"id\":", ALL);
    }

    private static boolean holds(String body, Part part) {
        return NewHomeSections.holds(body.getBytes(StandardCharsets.UTF_8), part.marker);
    }

    @Test
    public void aPartIsFoundByItsQuotedName() {
        assertTrue(holds(TAB, Part.CATEGORIES));
        assertTrue(holds(TAB, Part.VIDEOS));
        assertFalse(holds(TAB, Part.OFFLINE));
        assertFalse(holds(TAB, Part.AD_FREE));
        assertTrue(holds(OFFLINE, Part.OFFLINE));
        assertTrue(holds(BUTTON, Part.AD_FREE));
        assertTrue(holds("\"viewedVideos\"", Part.VIDEOS));
        assertTrue(holds("{\"a\":1,\"viewedVideos\"", Part.VIDEOS));
    }

    @Test
    public void aLongerOrShorterNameIsNotThePart() {
        assertFalse(holds("{\"viewedVideosCount\":3}", Part.VIDEOS));
        assertFalse(holds("{\"unviewedVideos\":3}", Part.VIDEOS));
        assertFalse(holds("{\"viewedVideo\":3}", Part.VIDEOS));
        assertFalse(holds("{\"subscriptionProducts\":[]}", Part.AD_FREE));
        assertFalse(holds("viewedVideos", Part.VIDEOS));
        assertFalse(holds("\"viewedVideos", Part.VIDEOS));
        assertFalse(holds("", Part.VIDEOS));
        assertFalse(holds("\"", Part.VIDEOS));
    }
}
