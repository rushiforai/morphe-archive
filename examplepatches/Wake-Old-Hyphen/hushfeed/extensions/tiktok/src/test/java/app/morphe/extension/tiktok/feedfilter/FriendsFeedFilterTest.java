package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.tiktok.settings.Settings;

import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.AwemeRawAd;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** What survives the Friends tab, which arrives as its own response rather than a feed list. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class FriendsFeedFilterTest {
    /** A video the ads filter can read. Nothing else is enabled while these tests run. */
    public static class Video extends Aweme {
        private final boolean advert;
        Video(boolean advert) { this.advert = advert; }
        @Override public String getAid() { return advert ? "ad" : "video"; }
        @Override public boolean isAd() { return advert; }
        @Override public boolean isSoftAd() { return false; }
        @Override public AwemeRawAd getAwemeRawAd() { return null; }
        @Override public boolean isWithPromotionalMusic() { return false; }
    }

    /** Stands in for FriendsFeed: the video, or a room when the card is a LIVE one. */
    public static final class Entry {
        public Aweme aweme;
        public Object roomStruct;
        Entry(Aweme aweme) { this.aweme = aweme; }
        static Entry live() {
            Entry entry = new Entry(null);
            entry.roomStruct = new Object();
            return entry;
        }
    }

    /** Stands in for FriendsFeedResponse, whose list field kept its name. */
    public static final class Response {
        public List<Entry> friendFeedData;
        Response(Entry... entries) { friendFeedData = new ArrayList<>(List.of(entries)); }
    }

    private final Map<BooleanSetting, Boolean> saved = new LinkedHashMap<>();

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        // Built here, not in a static field: reading a Setting runs the Settings class
        // initializer, which needs the context that was set on the line above.
        BooleanSetting[] others = {
                Settings.HIDE_STORY, Settings.HIDE_IMAGE, Settings.HIDE_SHOP,
                Settings.HIDE_BLOCKED_SOUNDS, Settings.HIDE_PAID_PARTNERSHIP,
                Settings.HIDE_AI_GENERATED, Settings.HIDE_VERIFIED, Settings.HIDE_SERIES,
                Settings.HIDE_PLAYLIST_VIDEOS, Settings.HIDE_INSERTED_CARDS,
                Settings.HIDE_SEEN_VIDEOS, Settings.HIDE_PROMOTIONAL_MUSIC,
                Settings.HIDE_LIVE_REPLAYS,
        };
        for (BooleanSetting setting : others) {
            saved.put(setting, setting.get());
            setting.save(false);
        }
        saved.put(Settings.REMOVE_ADS, Settings.REMOVE_ADS.get());
        saved.put(Settings.HIDE_LIVE, Settings.HIDE_LIVE.get());
        saved.put(Settings.FRIENDS_MUTUALS_ONLY, Settings.FRIENDS_MUTUALS_ONLY.get());
        Settings.FRIENDS_MUTUALS_ONLY.save(false);
    }

    @After public void tearDown() {
        for (var entry : saved.entrySet()) entry.getKey().save(entry.getValue());
    }

    @Test public void anAdvertAndALiveCardAreBothDroppedFromTheFriendsTab() {
        Settings.REMOVE_ADS.save(true);
        Settings.HIDE_LIVE.save(true);

        Entry ordinary = new Entry(new Video(false));
        Response response = new Response(ordinary, new Entry(new Video(true)), Entry.live());

        FeedItemsFilter.filterFriendsFeed(response);

        assertEquals(1, response.friendFeedData.size());
        assertSame(ordinary, response.friendFeedData.get(0));
    }

    /** A room as a selling LIVE sends it. */
    public static final class SellingRoom {
        public boolean hasCommerceGoods = true;
    }

    /** A Friends card for a LIVE that is selling goes with Hide TikTok Shop (#46), others stay. */
    @Test public void aSellingLiveCardGoesWithTheShopSwitchAlone() {
        Settings.REMOVE_ADS.save(false);
        Settings.HIDE_LIVE.save(false);
        Settings.HIDE_SHOP.save(true);
        Entry selling = Entry.live();
        selling.roomStruct = new SellingRoom();
        Entry ordinary = Entry.live();

        Response response = new Response(selling, ordinary);
        FeedItemsFilter.filterFriendsFeed(response);

        assertEquals(1, response.friendFeedData.size());
        assertSame(ordinary, response.friendFeedData.get(0));
    }

    @Test public void aLiveCardStaysWhenThatSwitchIsOff() {
        Settings.REMOVE_ADS.save(true);
        Settings.HIDE_LIVE.save(false);

        Response response = new Response(new Entry(new Video(false)), Entry.live());
        FeedItemsFilter.filterFriendsFeed(response);
        assertEquals(2, response.friendFeedData.size());
    }

    @Test public void nothingIsTouchedWhenEveryFilterIsOff() {
        Settings.REMOVE_ADS.save(false);
        Settings.HIDE_LIVE.save(false);

        Response response = new Response(new Entry(new Video(true)));
        List<Entry> before = response.friendFeedData;

        FeedItemsFilter.filterFriendsFeed(response);
        assertSame("the list is left exactly as it arrived", before, response.friendFeedData);
    }

    @Test public void aResponseWithNothingToReadIsSurvivable() {
        Settings.REMOVE_ADS.save(true);
        Settings.HIDE_LIVE.save(false);

        Response empty = new Response();
        List<Entry> before = empty.friendFeedData;
        FeedItemsFilter.filterFriendsFeed(empty);
        assertSame(before, empty.friendFeedData);

        // A shape the filter cannot read is left alone rather than throwing.
        FeedItemsFilter.filterFriendsFeed(null);
        FeedItemsFilter.filterFriendsFeed(new Object());

        // An entry carrying neither a video nor a room is kept: nothing says to drop it.
        Response odd = new Response(new Entry(null));
        FeedItemsFilter.filterFriendsFeed(odd);
        assertEquals(1, odd.friendFeedData.size());
    }

    /** Stands in for FriendsV3RepostModel: a friend's repost of someone's video. */
    public static final class Repost {
        public Aweme repostedAweme;
        public Object reposter;
        Repost(Aweme aweme) { this.repostedAweme = aweme; }
    }

    /** Stands in for FriendsV3FeedModel: the older wrapper's fields plus a repost. */
    public static final class V3Entry {
        public Aweme aweme;
        public Object roomStruct;
        public Repost repostItem;
        V3Entry(Aweme aweme) { this.aweme = aweme; }
        static V3Entry repostOf(Aweme aweme) {
            V3Entry entry = new V3Entry(null);
            entry.repostItem = new Repost(aweme);
            return entry;
        }
    }

    /** Stands in for FriendsV3FeedResponse. */
    public static final class V3Response {
        public List<V3Entry> friendsV3Feeds;
        V3Response(V3Entry... entries) { friendsV3Feeds = new ArrayList<>(List.of(entries)); }
    }

    @Test public void theV3FeedDropsAnAdvertWhetherPostedOrReposted() {
        Settings.REMOVE_ADS.save(true);
        Settings.HIDE_LIVE.save(true);
        V3Entry ordinary = new V3Entry(new Video(false));
        V3Entry repostedOrdinary = V3Entry.repostOf(new Video(false));
        V3Entry live = new V3Entry(null);
        live.roomStruct = new Object();
        V3Response response = new V3Response(ordinary, new V3Entry(new Video(true)), repostedOrdinary,
                V3Entry.repostOf(new Video(true)), live);

        FeedItemsFilter.filterFriendsV3Feed(response);

        assertEquals(List.of(ordinary, repostedOrdinary), response.friendsV3Feeds);
        FeedItemsFilter.filterFriendsV3Feed(null);
        FeedItemsFilter.filterFriendsV3Feed(new Object());
    }

    /** Stands in for TikTok's User: its uid and its follow status toward the reader. */
    public static final class Person {
        public final String uid;
        public final int followStatus;
        Person(String uid, int followStatus) { this.uid = uid; this.followStatus = followStatus; }
    }

    /** A video with an author. */
    public static final class Post extends Video {
        public final Object author;
        Post(Person author) { super(false); this.author = author; }
    }

    /** A V3 repost: whoever reposted it, and the video they reposted. */
    static V3Entry repost(Person reposter, Person author) {
        V3Entry entry = V3Entry.repostOf(new Post(author));
        entry.repostItem.reposter = reposter;
        return entry;
    }

    /** LiveRoomStruct, read through RoomFeedCellStruct.getNewLiveRoomData(). */
    public static final class Room {
        public final Object owner;
        Room(Person owner) { this.owner = owner; }
    }
    public static final class RoomCell {
        private final Room room;
        RoomCell(Person owner) { this.room = new Room(owner); }
        public Room getNewLiveRoomData() { return room; }
    }

    @Test public void mutualsOnlyKeepsFriendsTheirRepostsAndYourOwnPosts() {
        Settings.REMOVE_ADS.save(false);
        Settings.HIDE_LIVE.save(false);
        Settings.FRIENDS_MUTUALS_ONLY.save(true);
        app.morphe.extension.tiktok.SignedInUser.idForTests = "me";
        try {
            Person friend = new Person("friend", 2);
            Person followed = new Person("followed", 1);
            Person stranger = new Person("stranger", 0);
            Person me = new Person("me", 0);

            V3Entry friendsPost = new V3Entry(new Post(friend));
            V3Entry friendsRepost = repost(friend, stranger);
            V3Entry ownPost = new V3Entry(new Post(me));
            V3Entry ownRepost = repost(me, followed);
            V3Entry friendsLive = new V3Entry(null);
            friendsLive.roomStruct = new RoomCell(friend);
            V3Entry unreadable = new V3Entry(new Video(false));
            V3Entry strangersLive = new V3Entry(null);
            strangersLive.roomStruct = new RoomCell(stranger);
            V3Response response = new V3Response(friendsPost, new V3Entry(new Post(followed)),
                    friendsRepost, repost(stranger, friend), new V3Entry(new Post(stranger)), ownPost,
                    ownRepost, friendsLive, strangersLive, unreadable);

            FeedItemsFilter.filterFriendsV3Feed(response);

            assertEquals(List.of(friendsPost, friendsRepost, ownPost, ownRepost, friendsLive, unreadable),
                    response.friendsV3Feeds);

            Entry older = new Entry(new Post(friend));
            Response v2 = new Response(older, new Entry(new Post(followed)), new Entry(new Post(stranger)));
            FeedItemsFilter.filterFriendsFeed(v2);
            assertEquals(List.of(older), v2.friendFeedData);

            Settings.FRIENDS_MUTUALS_ONLY.save(false);
            V3Response off = new V3Response(new V3Entry(new Post(stranger)));
            List<V3Entry> before = off.friendsV3Feeds;
            FeedItemsFilter.filterFriendsV3Feed(off);
            assertSame("the switch off leaves the list alone", before, off.friendsV3Feeds);
        } finally {
            app.morphe.extension.tiktok.SignedInUser.idForTests = null;
        }
    }

    @Test public void everyEntryCanBeDroppedWhenTheyAllMatch() {
        Settings.REMOVE_ADS.save(true);
        Settings.HIDE_LIVE.save(false);

        Response response = new Response(new Entry(new Video(true)), new Entry(new Video(true)));
        FeedItemsFilter.filterFriendsFeed(response);
        assertTrue("a page of adverts leaves nothing, and the next page loads",
                response.friendFeedData.isEmpty());
    }
}
