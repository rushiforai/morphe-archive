/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.shared.Utils;

import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.AwemeRawAd;
import com.ss.android.ugc.aweme.feed.model.AwemeStatistics;
import com.ss.android.ugc.aweme.feed.model.FeedItemList;
import com.ss.android.ugc.aweme.feed.model.PhotoModeImageInfo;
import com.ss.android.ugc.aweme.feed.model.PhotoModeTextInfo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Issue #4, the two hide rules on the two routes a feed page takes through the filter. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class PreferredTrackRouteTest {
    private static int nextId;

    public static final class Caption {
        public final String languageCode;
        public final int subId;
        public final boolean isOriginalCaption = false;

        Caption(String languageCode, int subId) {
            this.languageCode = languageCode;
            this.subId = subId;
        }
    }

    public static final class CaptionModel {
        public final List<Caption> captionList = new ArrayList<>();
    }

    public static final class Video {
        final CaptionModel captions = new CaptionModel();

        public CaptionModel getCaptionModel() { return captions; }
        public long getDuration() { return 30_000; }
    }

    public static final class Tts {
        public final String languageCode;

        Tts(String languageCode) { this.languageCode = languageCode; }
    }

    public static final class Audio {
        final List<Tts> dubs = new ArrayList<>();

        public List<Tts> getTtsInfos() { return dubs; }
    }

    public static final class Author {
        public String getUniqueId() { return "someone"; }
        public String getUid() { return "123"; }
        public String getSecUid() { return ""; }
    }

    public static final class Item extends Aweme {
        final String id = "route-" + nextId++;
        final Video video = new Video();
        final Audio audio = new Audio();
        final Author author = new Author();
        final AwemeStatistics stats = new AwemeStatistics();
        boolean ad;

        Item subtitle(String language) {
            video.captions.captionList.add(new Caption(language, video.captions.captionList.size() + 1));
            return this;
        }

        Item dub(String language) {
            audio.dubs.add(new Tts(language));
            return this;
        }

        @Override public boolean isAd() { return ad; }
        @Override public boolean isSoftAd() { return false; }
        @Override public AwemeRawAd getAwemeRawAd() { return null; }
        @Override public boolean isWithPromotionalMusic() { return false; }
        public String getAnchorsExtras() { return null; }
        public Object getCommerceVideoAuthInfo() { return null; }
        public Object getContentModel() { return null; }
        @Override public String getAid() { return id; }
        @Override public AwemeStatistics getStatistics() { return stats; }
        public String getDesc() { return ""; }
        public Object getAuthor() { return author; }
        public Object getVideo() { return video; }
        public Audio getAudio() { return audio; }
        public Object getTranslatedVideo() { return null; }
        public List<Object> getImageInfos() { return null; }
        public PhotoModeImageInfo getPhotoModeImageInfo() { return null; }
        public PhotoModeTextInfo getPhotoModeTextInfo() { return null; }
        public String getShareUrl() { return null; }
        public long getCreateTime() { return 0; }
    }

    private static void clear() {
        Settings.REMOVE_ADS.save(false);
        Settings.SUBTITLE_PRIORITY.save("");
        Settings.DUB_PRIORITY.save("");
        Settings.HIDE_NO_PREFERRED_SUBTITLE.save(false);
        Settings.HIDE_NO_PREFERRED_DUB.save(false);
        Settings.CREATOR_FILTER_EXCEPTIONS.save("");
    }

    @Before
    public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        clear();
    }

    @After
    public void tearDown() {
        clear();
    }

    private static void hideWithoutSubtitle(String list) {
        Settings.SUBTITLE_PRIORITY.save(list);
        Settings.HIDE_NO_PREFERRED_SUBTITLE.save(true);
    }

    private static void hideWithoutDub(String list) {
        Settings.DUB_PRIORITY.save(list);
        Settings.HIDE_NO_PREFERRED_DUB.save(true);
    }

    @SuppressWarnings("unchecked")
    private static List<Object> feedPage(Item... items) {
        FeedItemList page = new FeedItemList();
        page.items = new ArrayList<>(Arrays.asList(items));
        FeedItemsFilter.filter(page);
        return (List<Object>) (List<?>) page.items;
    }

    @SuppressWarnings("unchecked")
    private static List<Object> dramaPage(Item... items) {
        return (List<Object>) FeedItemsFilter.filterDramaFeed(new ArrayList<>(Arrays.asList(items)));
    }

    @Test
    public void onlyVideosWithAListedSubtitleStayOnBothRoutes() {
        hideWithoutSubtitle("en");
        Item english = new Item().subtitle("id").subtitle("en");
        assertEquals(List.of(english), feedPage(new Item().subtitle("id"), english, new Item()));

        Item alsoEnglish = new Item().subtitle("en");
        assertEquals(List.of(alsoEnglish), dramaPage(new Item().subtitle("id"), alsoEnglish, new Item()));
    }

    @Test
    public void onlyVideosWithAListedDubStayOnBothRoutes() {
        hideWithoutDub("en");
        Item english = new Item().dub("en");
        assertEquals(List.of(english), feedPage(new Item().dub("id"), english, new Item()));

        Item alsoEnglish = new Item().dub("en");
        assertEquals(List.of(alsoEnglish), dramaPage(new Item().dub("id"), alsoEnglish, new Item()));
    }

    /** Most videos have no tracks on some accounts, and an empty page would leave the feed stuck. */
    @Test
    public void aPageWithNoneOfThemStillLeavesOneVideo() {
        hideWithoutSubtitle("en");
        Item first = new Item();
        assertEquals(List.of(first), feedPage(first, new Item(), new Item().subtitle("id")));

        Item firstDrama = new Item();
        assertEquals(List.of(firstDrama), dramaPage(firstDrama, new Item(), new Item().subtitle("id")));
    }

    @Test
    public void thePutBackVideoIsNeverAnAd() {
        Settings.REMOVE_ADS.save(true);
        hideWithoutSubtitle("en");
        Item ad = new Item();
        ad.ad = true;
        Item plain = new Item();

        assertEquals(List.of(plain), dramaPage(ad, plain));

        Item feedAd = new Item();
        feedAd.ad = true;
        Item feedPlain = new Item();
        assertEquals(List.of(feedPlain), feedPage(feedAd, feedPlain));
    }

    @Test
    public void aPageOfNothingButAdsStaysEmpty() {
        Settings.REMOVE_ADS.save(true);
        hideWithoutSubtitle("en");
        Item ad = new Item();
        ad.ad = true;

        assertEquals(Collections.emptyList(), dramaPage(ad));
    }

    /** Like the caption language list, these are about the video and not about who posted it. */
    @Test
    public void aCreatorExceptionDoesNotPassTheTrackRules() {
        hideWithoutSubtitle("en");
        Settings.CREATOR_FILTER_EXCEPTIONS.save("@someone");
        Item english = new Item().subtitle("en");

        assertEquals(List.of(english), feedPage(new Item(), english));
    }

    @Test
    public void originalOnTheDubListKeepsEveryVideo() {
        hideWithoutDub("en, original");
        Item none = new Item();
        Item other = new Item().dub("id");

        assertEquals(List.of(none, other), feedPage(none, other));
    }

    /** Off is off: the same page object goes back, untouched. */
    @Test
    public void nothingChangesUntilTheSwitchAndTheListAreBothSet() {
        List<Object> items = new ArrayList<>(Arrays.asList(new Item(), new Item().subtitle("id")));

        assertSame(items, FeedItemsFilter.filterDramaFeed(items));

        Settings.HIDE_NO_PREFERRED_SUBTITLE.save(true);
        Settings.HIDE_NO_PREFERRED_DUB.save(true);
        assertSame("the switch alone does nothing", items, FeedItemsFilter.filterDramaFeed(items));

        Settings.HIDE_NO_PREFERRED_SUBTITLE.save(false);
        Settings.HIDE_NO_PREFERRED_DUB.save(false);
        Settings.SUBTITLE_PRIORITY.save("en");
        Settings.DUB_PRIORITY.save("en");
        assertSame("the list alone does nothing", items, FeedItemsFilter.filterDramaFeed(items));
    }
}
