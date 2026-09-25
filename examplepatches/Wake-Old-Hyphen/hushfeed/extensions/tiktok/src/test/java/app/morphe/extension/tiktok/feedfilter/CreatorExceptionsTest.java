/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.seen.SeenVideoHistory;
import app.morphe.extension.tiktok.settings.Settings;

import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.AwemeRawAd;
import com.ss.android.ugc.aweme.feed.model.AwemeStatistics;
import com.ss.android.ugc.aweme.feed.model.FeedItemList;
import com.ss.android.ugc.aweme.feed.model.PhotoModeImageInfo;
import com.ss.android.ugc.aweme.feed.model.PhotoModeTextInfo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The creators whose posts get past the preference filters.
 *
 * <p>Every case goes in through {@link FeedItemsFilter#filter(FeedItemList)}, the way a feed
 * response reaches the filter, with one filter switched on at a time: an excepted creator's
 * post stays, another creator's identical post goes, and a post that says nobody posted it
 * goes. The hard filters run the same way and hide the excepted creator regardless. The
 * fixture answers every getter the filters read with a plain value, so a filter that starts
 * reading something new fails here instead of being kept quiet by the filter's own catch.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CreatorExceptionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String UNSET_RANGE = "0-" + Long.MAX_VALUE;
    private static final String HANDLE = "poster";
    private static final String UID = "123456";
    private static final String SEC_UID = "MS4wLjABAAAAposterSec";
    /** A display name with no space, so only the rule that names never count keeps it out. */
    private static final String NICKNAME = "Posterino";

    /** The account a post came from, with the getters TikTok's User model has. */
    public static final class Author {
        String handle = HANDLE;
        String uid = UID;
        String secUid = SEC_UID;
        String nickname = NICKNAME;
        int verificationType;

        public String getUniqueId() { return handle; }
        public String getUid() { return uid; }
        public String getSecUid() { return secUid; }
        public String getNickname() { return nickname; }
        public int getVerificationType() { return verificationType; }
    }

    /** Counts that pass every range a case sets; a trip lowers one of them. */
    public static final class Stats extends AwemeStatistics {
        long views = 5_000, likes = 5_000, comments = 5_000, favourites = 5_000, shares = 5_000;

        @Override public long getPlayCount() { return views; }
        @Override public long getDiggCount() { return likes; }
        @Override public long getCommentCount() { return comments; }
        @Override public long getCollectCount() { return favourites; }
        @Override public long getShareCount() { return shares; }
    }

    public static final class Duration {
        final long duration;
        Duration(long duration) { this.duration = duration; }
        public long getDuration() { return duration; }
    }

    public static final class Labelled {
        public final Object aigcLabelType;
        Labelled(int type) { aigcLabelType = type; }
    }

    public static final class Mix {
        public final String mixId = "mix-1";
    }

    public static final class Music {
        public String getMid() { return "77"; }
    }

    public static final class Paid {
        public final Object category = 1L;
    }

    /** A post whose every read has a plain answer, so only the trip set on it can hide it. */
    public static class Item extends Aweme {
        final String aid;
        Author author = new Author();
        boolean ad, promotionalMusic, liveReplay, story, paidContent;
        long liveId;
        int awemeType;
        String shareUrl, region;
        String desc = "";
        List<Object> images;
        List<?> anchors;
        Object aigcInfo, mixInfo, music, mPaidContentInfo, commercialVideoInfo;
        long createTime;
        long durationMs = 500;
        Stats stats = new Stats();

        Item(String aid) { this.aid = aid; }

        @Override public String getAid() { return aid; }
        @Override public int getAwemeType() { return awemeType; }
        @Override public boolean isAd() { return ad; }
        @Override public boolean isSoftAd() { return false; }
        @Override public AwemeRawAd getAwemeRawAd() { return null; }
        @Override public boolean isLiveReplay() { return liveReplay; }
        @Override public long getLiveId() { return liveId; }
        @Override public String getLiveType() { return null; }
        @Override public boolean isWithPromotionalMusic() { return promotionalMusic; }
        @Override public boolean getIsTikTokStory() { return story; }
        @Override public List getImageInfos() { return images; }
        @Override public PhotoModeImageInfo getPhotoModeImageInfo() { return null; }
        @Override public PhotoModeTextInfo getPhotoModeTextInfo() { return null; }
        @Override public AwemeStatistics getStatistics() { return stats; }
        @Override public String getShareUrl() { return shareUrl; }
        public Object getAuthor() { return author; }
        public String getDesc() { return desc; }
        public String getRegion() { return region; }
        public List<?> getAnchors() { return anchors; }
        public String getAnchorsExtras() { return null; }
        public Object getContentModel() { return null; }
        public Object getAigcInfo() { return aigcInfo; }
        public Object getMixInfo() { return mixInfo; }
        public Object getMusic() { return music; }
        public Object getMPaidContentInfo() { return mPaidContentInfo; }
        public Object getCommercialVideoInfo() { return commercialVideoInfo; }
        public boolean isPaidContent() { return paidContent; }
        public long getCreateTime() { return createTime; }
        public Object getVideo() { return new Duration(durationMs); }
    }

    /** One filter: its name on the feed path, the switch that turns it on, the post that trips it. */
    private static final class Case {
        final String filter;
        final Runnable enable;
        final Consumer<Item> trip;

        Case(String filter, Runnable enable, Consumer<Item> trip) {
            this.filter = filter;
            this.enable = enable;
            this.trip = trip;
        }
    }

    /** Built after the context is set: a Setting touched from a static initialiser throws. */
    private static List<Case> subjectiveCases() {
        long nowSeconds = System.currentTimeMillis() / 1000L;
        return List.of(
                new Case("StoryFilter", () -> Settings.HIDE_STORY.save(true), item -> item.story = true),
                new Case("ImageVideoFilter", () -> Settings.HIDE_IMAGE.save(true),
                        item -> item.images = List.of(new Object())),
                new Case("LocationBadgeFilter", () -> Settings.FILTER_LOCATION_VIDEOS.save(true),
                        item -> item.anchors = List.of(new LocationBadgeFilterTest.Anchor("anchor_poi"))),
                new Case("AiGeneratedFilter", () -> Settings.HIDE_AI_GENERATED.save(true),
                        item -> item.aigcInfo = new Labelled(2)),
                new Case("VerifiedFilter", () -> Settings.HIDE_VERIFIED.save(true),
                        item -> item.author.verificationType = 1),
                new Case("PlaylistFilter", () -> Settings.HIDE_PLAYLIST_VIDEOS.save(true),
                        item -> item.mixInfo = new Mix()),
                new Case("PublicationAgeFilter", () -> Settings.MAX_PUBLICATION_AGE_DAYS.save(7),
                        item -> item.createTime = nowSeconds - 30L * 86_400L),
                new Case("QualityFilter", () -> Settings.MAX_VIDEO_SECONDS.save(1),
                        item -> item.durationMs = 5_000),
                new Case("ViewCountFilter", () -> range(Settings.MIN_MAX_VIEWS), item -> item.stats.views = 5),
                new Case("LikeCountFilter", () -> range(Settings.MIN_MAX_LIKES), item -> item.stats.likes = 5),
                new Case("CommentCountFilter", () -> range(Settings.MIN_MAX_COMMENTS),
                        item -> item.stats.comments = 5),
                new Case("FavouriteCountFilter", () -> range(Settings.MIN_MAX_FAVOURITES),
                        item -> item.stats.favourites = 5),
                new Case("ShareCountFilter", () -> range(Settings.MIN_MAX_SHARES), item -> item.stats.shares = 5));
    }

    private static List<Case> hardCases() {
        return List.of(
                new Case("AdsFilter", () -> Settings.REMOVE_ADS.save(true), item -> item.ad = true),
                new Case("LiveFilter", () -> Settings.HIDE_LIVE.save(true), item -> item.liveId = 42),
                new Case("ShopFilter", () -> Settings.HIDE_SHOP.save(true),
                        item -> item.shareUrl = "https://www.tiktok.com/x?placeholder_product_id=1"),
                new Case("SoundFilter", () -> {
                    Settings.HIDE_BLOCKED_SOUNDS.save(true);
                    Settings.BLOCKED_SOUND_IDS.save("77");
                }, item -> item.music = new Music()),
                new Case("PaidPartnershipFilter", () -> Settings.HIDE_PAID_PARTNERSHIP.save(true),
                        item -> item.commercialVideoInfo = "paid partnership"),
                new Case("SeriesFilter", () -> Settings.HIDE_SERIES.save(true), item -> item.paidContent = true),
                new Case("DramaFilter", () -> Settings.HIDE_MINI_DRAMAS.save(true),
                        item -> item.mPaidContentInfo = new Paid()),
                new Case("InsertedCardFilter", () -> Settings.HIDE_INSERTED_CARDS.save(true),
                        item -> item.awemeType = 105),
                new Case("SeenVideoFilter", () -> Settings.HIDE_SEEN_VIDEOS.save(true),
                        item -> SeenVideoHistory.onPlayProgressChange(item.aid, 9_000, 10_000)),
                new Case("KeywordFilter", () -> Settings.BLOCKED_CAPTION_WORDS.save("sponsored"),
                        item -> item.desc = "a sponsored post"),
                new Case("CreatorFilter", () -> Settings.BLOCKED_CREATORS.save("@" + HANDLE), item -> { }),
                new Case("CreatorFilter", () -> Settings.LOCAL_HIDDEN_CREATORS.save(UID), item -> { }),
                new Case("PromotionalMusicFilter", () -> Settings.HIDE_PROMOTIONAL_MUSIC.save(true),
                        item -> item.promotionalMusic = true),
                new Case("LiveReplayFilter", () -> Settings.HIDE_LIVE_REPLAYS.save(true),
                        item -> item.liveReplay = true));
    }

    private static void range(StringSetting setting) {
        setting.save("1000-" + Long.MAX_VALUE);
        FeedItemsFilter.rebuildRangeFiltersForTests();
    }

    private static BooleanSetting[] switches() {
        return new BooleanSetting[]{
                Settings.REMOVE_ADS, Settings.HIDE_LIVE, Settings.HIDE_STORY, Settings.HIDE_IMAGE,
                Settings.HIDE_SHOP, Settings.HIDE_BLOCKED_SOUNDS, Settings.HIDE_PAID_PARTNERSHIP,
                Settings.FILTER_LOCATION_VIDEOS, Settings.HIDE_AI_GENERATED, Settings.HIDE_VERIFIED,
                Settings.HIDE_SERIES, Settings.HIDE_MINI_DRAMAS, Settings.HIDE_PLAYLIST_VIDEOS,
                Settings.HIDE_INSERTED_CARDS, Settings.HIDE_SEEN_VIDEOS, Settings.HIDE_PROMOTIONAL_MUSIC,
                Settings.HIDE_LIVE_REPLAYS,
        };
    }

    private static StringSetting[] lists() {
        return new StringSetting[]{
                Settings.BLOCKED_CAPTION_WORDS, Settings.BLOCKED_CREATORS, Settings.LOCAL_HIDDEN_CREATORS,
                Settings.CREATOR_FILTER_EXCEPTIONS, Settings.BLOCKED_SOUND_IDS, Settings.BLOCKED_SOUND_NAMES,
        };
    }

    private static StringSetting[] ranges() {
        return new StringSetting[]{
                Settings.MIN_MAX_VIEWS, Settings.MIN_MAX_LIKES, Settings.MIN_MAX_COMMENTS,
                Settings.MIN_MAX_FAVOURITES, Settings.MIN_MAX_SHARES,
        };
    }

    private static IntegerSetting[] limits() {
        return new IntegerSetting[]{
                Settings.MAX_VIDEO_SECONDS, Settings.MAX_PUBLICATION_AGE_DAYS,
                Settings.MAX_VIEWS_PER_LIKE, Settings.MAX_VIEWS_PER_COMMENT,
        };
    }

    private static void quiet() {
        for (BooleanSetting setting : switches()) setting.save(false);
        for (StringSetting setting : lists()) setting.save("");
        for (StringSetting setting : ranges()) setting.save(UNSET_RANGE);
        for (IntegerSetting setting : limits()) setting.save(0);
        FeedItemsFilter.rebuildRangeFiltersForTests();
        SeenVideoHistory.clear();
        FeedItemsFilter.resetDiagnosticsForTests();
    }

    @Before
    public void setUp() {
        BaseSettings.DEBUG.save(false);
        quiet();
    }

    @After
    public void tearDown() {
        for (BooleanSetting setting : switches()) setting.resetToDefault();
        for (StringSetting setting : lists()) setting.resetToDefault();
        for (StringSetting setting : ranges()) setting.resetToDefault();
        for (IntegerSetting setting : limits()) setting.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        FeedItemsFilter.rebuildRangeFiltersForTests();
        SeenVideoHistory.clear();
        FeedItemsFilter.resetDiagnosticsForTests();
    }

    private static Item tripped(String aid, Case which) {
        Item item = new Item(aid);
        which.trip.accept(item);
        return item;
    }

    private static FeedItemList page(Item... items) {
        FeedItemList list = new FeedItemList();
        list.items = new ArrayList<>(Arrays.asList(items));
        return list;
    }

    /** The aids left on a page after the filter, in order, with no filter having thrown. */
    private static List<String> survivors(FeedItemList list) {
        FeedItemsFilter.filter(list);
        try {
            java.lang.reflect.Field errors = FeedItemsFilter.class.getDeclaredField("filterExceptionLogCount");
            errors.setAccessible(true);
            assertEquals("a filter swallowed an unstubbed getter or another runtime failure", 0,
                    ((AtomicInteger) errors.get(null)).get());
        } catch (ReflectiveOperationException exception) {
            throw new AssertionError(exception);
        }
        List<String> aids = new ArrayList<>();
        for (Object item : list.items) aids.add(((Aweme) item).getAid());
        return aids;
    }

    @Test
    public void everyPreferenceFilterLetsAnExceptedCreatorThrough() {
        for (Case which : subjectiveCases()) {
            quiet();
            which.enable.run();
            Settings.CREATOR_FILTER_EXCEPTIONS.save("@" + HANDLE.toUpperCase());
            // A plain post rides along so the page is never emptied: a page the quality filter
            // alone empties gets its nearest post back by design, exception or not, and the
            // QualityFilter case would pass on that alone.
            assertEquals(which.filter + " hid a post the exception should have kept",
                    List.of("kept", "plain"), survivors(page(tripped("kept", which), new Item("plain"))));
        }
    }

    @Test
    public void everyPreferenceFilterStillHidesEveryoneElse() {
        for (Case which : subjectiveCases()) {
            quiet();
            which.enable.run();
            Settings.CREATOR_FILTER_EXCEPTIONS.save(HANDLE);
            Item other = tripped("other", which);
            other.author.handle = "someone_else";
            other.author.uid = "999";
            other.author.secUid = "MS4wLjABAAAAother";
            Item plain = new Item("plain");
            plain.author.handle = "someone_else";
            plain.author.uid = "999";
            plain.author.secUid = "MS4wLjABAAAAother";
            assertEquals(which.filter + " did not run beside the exception",
                    List.of("plain"), survivors(page(other, plain)));
        }
    }

    @Test
    public void aPostThatSaysNobodyPostedItIsHiddenLikeAnyOther() {
        for (Case which : subjectiveCases()) {
            quiet();
            which.enable.run();
            Settings.CREATOR_FILTER_EXCEPTIONS.save(HANDLE + ", " + UID + ", " + SEC_UID + ", " + NICKNAME);
            // An author with no ids at all, only a display name, which is never an id. A plain
            // post rides along so the page is never emptied, since a page the quality filter
            // alone empties gets its nearest post back by design.
            Item nameless = tripped("nameless", which);
            nameless.author.handle = "";
            nameless.author.uid = "";
            nameless.author.secUid = "";
            assertEquals(which.filter + " kept a post whose creator has no id to except",
                    List.of("plain"), survivors(page(nameless, new Item("plain"))));
        }
        // No author object at all: a LIVE preview or an end card shape.
        quiet();
        Settings.HIDE_STORY.save(true);
        Settings.CREATOR_FILTER_EXCEPTIONS.save(HANDLE + ", " + UID + ", " + SEC_UID);
        Item anonymous = tripped("anonymous", subjectiveCases().get(0));
        anonymous.author = null;
        assertEquals(List.of("plain"), survivors(page(anonymous, new Item("plain"))));
    }

    @Test
    public void everyHardFilterStillHidesAnExceptedCreator() {
        for (Case which : hardCases()) {
            quiet();
            which.enable.run();
            Settings.CREATOR_FILTER_EXCEPTIONS.save(HANDLE + ", " + UID + ", " + SEC_UID);
            assertEquals(which.filter + " let an excepted creator past a hard block",
                    List.of(), survivors(page(tripped("hidden", which))));
        }
        // The region filter reads its lists once, when the feed path is built, so it is checked
        // where it can be built: the loop gives a hard filter no chance to ask about the creator.
        Settings.REGION_NEVER_FROM.save("RU");
        Item russian = new Item("ru");
        russian.region = "RU";
        RegionFilter region = new RegionFilter();
        assertTrue(region.getEnabled() && region.getFiltered(russian));
        assertFalse(CreatorExceptions.isSubjective(region));
    }

    @Test
    public void theListNamesACreatorByHandleUidOrSecUidAndNeverByDisplayName() {
        Settings.HIDE_STORY.save(true);
        Case story = subjectiveCases().get(0);
        String[] kept = {" @POSTER ", UID, SEC_UID, "@" + HANDLE + "\nsomeone_else", "someone_else, " + HANDLE};
        for (String list : kept) {
            Settings.CREATOR_FILTER_EXCEPTIONS.save(list);
            assertEquals("the list " + list.replace("\n", "\\n") + " should have kept the story",
                    List.of("s"), survivors(page(tripped("s", story))));
        }
        String[] hidden = {NICKNAME, NICKNAME.toLowerCase(), "Poster Person", "/" + HANDLE + "/", "/^post/",
                "", " , ", "post", HANDLE + "x"};
        for (String list : hidden) {
            Settings.CREATOR_FILTER_EXCEPTIONS.save(list);
            assertEquals("the list " + list + " should have matched nobody",
                    List.of(), survivors(page(tripped("s", story))));
        }
    }

    @Test
    public void anEmptyAuthorFallsBackToTheItemsOwnAuthorUid() {
        Settings.HIDE_STORY.save(true);
        Settings.CREATOR_FILTER_EXCEPTIONS.save(UID);
        Item byUid = new Item("uid-only") {
            public String getAuthorUid() { return UID; }
        };
        byUid.story = true;
        byUid.author = null;
        assertEquals(List.of("uid-only"), survivors(page(byUid)));
        // The block list reads the same fallback: an item with no author but a known uid is blocked.
        Settings.HIDE_STORY.save(false);
        Settings.CREATOR_FILTER_EXCEPTIONS.save("");
        assertEquals(List.of("uid-only"), survivors(page(byUid)));
        Settings.BLOCKED_CREATORS.save(UID);
        assertEquals(List.of(), survivors(page(byUid)));
    }

    @Test
    public void aChangedListRescansAPageTheFilterHasAlreadySeen() {
        BaseSettings.DEBUG.save(true);
        Settings.HIDE_STORY.save(true);
        Settings.CREATOR_FILTER_EXCEPTIONS.save(HANDLE);
        FeedItemList page = page(tripped("story", subjectiveCases().get(0)));
        FeedItemsFilter.filter(page);
        FeedItemsFilter.filter(page);
        assertEquals(1, page.items.size());
        String summary = FeedItemsFilter.rotateProbeSummaryForTests(System.currentTimeMillis() + 10_000L);
        assertNotNull(summary);
        assertTrue(summary, summary.contains("cacheHits=1"));
        assertTrue(summary, summary.contains("scans=1"));

        Settings.CREATOR_FILTER_EXCEPTIONS.save("someone_else");
        FeedItemsFilter.filter(page);
        assertEquals("the page kept the story after its exception was taken away", 0, page.items.size());
    }

    @Test
    public void everyFilterOnTheFeedPathIsClassifiedOnceAndTheSetsHoldNothingElse() {
        Set<Class<?>> onPath = new HashSet<>();
        for (IFilter filter : FeedItemsFilter.allFiltersForTests()) {
            Class<?> type = filter.getClass();
            onPath.add(type);
            boolean subjective = CreatorExceptions.SUBJECTIVE.contains(type);
            boolean hard = CreatorExceptions.HARD.contains(type);
            assertTrue(type.getSimpleName() + " is in neither set: say whether an exception passes it",
                    subjective || hard);
            assertFalse(type.getSimpleName() + " is in both sets", subjective && hard);
        }
        for (Class<?> type : CreatorExceptions.SUBJECTIVE) {
            assertTrue(type.getSimpleName() + " is classified but no longer on the feed path", onPath.contains(type));
        }
        for (Class<?> type : CreatorExceptions.HARD) {
            assertTrue(type.getSimpleName() + " is classified but no longer on the feed path", onPath.contains(type));
        }
        // The documented set. A filter moving between the two is a README change as well.
        Set<String> subjective = new TreeSet<>();
        for (Class<?> type : CreatorExceptions.SUBJECTIVE) subjective.add(type.getSimpleName());
        assertEquals(new TreeSet<>(List.of("AiGeneratedFilter", "CommentCountFilter", "FavouriteCountFilter",
                "ImageVideoFilter", "LikeCountFilter", "LocationBadgeFilter", "PlaylistFilter",
                "PublicationAgeFilter", "QualityFilter", "ShareCountFilter", "StoryFilter",
                "VerifiedFilter", "ViewCountFilter")), subjective);
    }

    @Test
    public void theEditorRefusesPatternsAndDisplayNamesAndTakesHandlesAndIds() {
        String pattern = CreatorExceptions.entryProblem("alice, /^news_/");
        assertNotNull(pattern);
        assertTrue(pattern, pattern.contains("a pattern can't be one") && pattern.contains("/^news_/"));
        String name = CreatorExceptions.entryProblem("alice, Poster Person");
        assertNotNull(name);
        assertTrue(name, name.contains("not a display name") && name.contains("Poster Person"));
        assertNull(CreatorExceptions.entryProblem("@alice, 123456, " + SEC_UID));
        assertNull(CreatorExceptions.entryProblem(""));
        assertNull(CreatorExceptions.entryProblem(null));
        // The editor's duplicate check and the feed's match read an entry the same way.
        assertTrue(AdvancedFeedRules.hasCreatorEntry("@POSTER, other", " poster "));
        assertEquals("poster", AdvancedFeedRules.normalizedCreator(" @Poster "));
    }

    @Test
    public void theRowNamesTheEntriesABlockListAlsoHolds() {
        Settings.BLOCKED_CREATORS.save("@Alice, /^news_/");
        Settings.LOCAL_HIDDEN_CREATORS.save(UID);
        assertEquals(List.of("alice", UID, "news_daily"),
                CreatorExceptions.alsoBlocked("alice, bob, " + UID + ", news_daily"));
        String note = CreatorExceptions.conflictNote("alice, bob, " + UID + ", news_daily");
        assertNotNull(note);
        assertTrue(note, note.startsWith("Also on a block list, so still hidden: ")
                && note.contains("alice, " + UID + ", news_daily"));
        assertNull(CreatorExceptions.conflictNote("bob, carol"));
        Settings.BLOCKED_CREATORS.save("");
        Settings.LOCAL_HIDDEN_CREATORS.save("");
        assertNull(CreatorExceptions.conflictNote("alice, bob, " + UID + ", news_daily"));
    }

    @Test
    public void theRowNamesTheEntriesThatArrivedUnusable() {
        // A backup carries the list as typed elsewhere; the editor's refusal never saw it.
        Settings.BLOCKED_CREATORS.save("bob");
        String list = "alice, /^news_/, Poster Person, bob";
        assertEquals(List.of("/^news_/", "Poster Person"), CreatorExceptions.inertEntries(list));
        String note = CreatorExceptions.conflictNote(list);
        assertNotNull(note);
        String[] lines = note.split("\n");
        assertEquals(2, lines.length);
        assertTrue(lines[0], lines[0].startsWith("Also on a block list, so still hidden: ") && lines[0].contains("bob"));
        assertTrue(lines[1], lines[1].startsWith("Not a handle or id, so ignored: ")
                && lines[1].contains("/^news_/, Poster Person"));
        Settings.BLOCKED_CREATORS.save("");
        String alone = CreatorExceptions.conflictNote(list);
        assertNotNull(alone);
        assertTrue(alone, alone.startsWith("Not a handle or id, so ignored: ") && !alone.contains("\n"));
        // And they match nobody on the feed: the names parsed out of the list leave them out.
        assertEquals(java.util.Set.of("alice", "bob"), CreatorExceptions.names(list));
    }
}
