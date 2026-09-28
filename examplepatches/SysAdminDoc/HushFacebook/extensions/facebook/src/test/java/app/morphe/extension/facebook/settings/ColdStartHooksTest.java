/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;

import com.facebook.graphql.model.GraphQLPagesYouMayLikeFeedUnit;
import com.facebook.graphql.model.GraphQLStory;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.ads.MarketplaceAdFilterForTests;
import app.morphe.extension.facebook.ads.ProfileAdFilterForTests;
import app.morphe.extension.facebook.ads.ReelsAdFilter;
import app.morphe.extension.facebook.ads.SearchAdFilterForTests;
import app.morphe.extension.facebook.chats.MessengerCardForTests;
import app.morphe.extension.facebook.composer.TagSuggestionsForTests;
import app.morphe.extension.facebook.download.MediaDownload;
import app.morphe.extension.facebook.download.PlayerSourcesForTests;
import app.morphe.extension.facebook.download.ReelDownload;
import app.morphe.extension.facebook.download.VideoMenuItemForTests;
import app.morphe.extension.facebook.emoji.SystemEmoji;
import app.morphe.extension.facebook.feed.FeedFilter;
import app.morphe.extension.facebook.feed.FeedGuardForTests;
import app.morphe.extension.facebook.feed.ProfileSuggestionsForTests;
import app.morphe.extension.facebook.feed.TypedFeedUnit;
import app.morphe.extension.facebook.font.OwnFont;
import app.morphe.extension.facebook.comments.DefaultCommentOrderForTests;
import app.morphe.extension.facebook.media.ResumePlaybackForTests;
import app.morphe.extension.facebook.media.TapToPlay;
import app.morphe.extension.facebook.media.TapToPlayForTests;
import app.morphe.extension.facebook.menu.MenuSectionsForTests;
import app.morphe.extension.facebook.menu.MenuSettingsRow;
import app.morphe.extension.facebook.misc.ExternalBrowser;
import app.morphe.extension.facebook.misc.LinkCleaner;
import app.morphe.extension.facebook.navigation.MarketplaceOnlyForTests;
import app.morphe.extension.facebook.navigation.StartTabRouteForTests;
import app.morphe.extension.facebook.notifications.NotificationKindsForTests;
import app.morphe.extension.facebook.reels.ReelDeclutter;
import app.morphe.extension.facebook.reels.SeenStateSendForTests;
import app.morphe.extension.facebook.search.MetaAiSearchForTests;
import app.morphe.extension.facebook.stories.SuggestedStoriesForTests;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * A start in which one of Facebook's early threads wins the race: every hook called before the
 * application hands Hushfacebook its context, and setContext after them.
 *
 * <p>A hook that reads a switch before its guard fails Setting's static initialiser, which needs
 * the context, and then the read setContext makes to decide the pause throws NoClassDefFoundError
 * out of the start. PausedHooksTest can't see that: its sandbox loaded the settings classes with a
 * context first, so a read there just answers. This is the only class at sdk 33, so it runs in a
 * sandbox of its own where nothing has loaded them yet, and it declares no SettingsContextRule,
 * which would load them. Give another class sdk 33 and this stops proving anything.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33)
public class ColdStartHooksTest {

    /** Stands in for GraphQLFeedStoryCategory: only the constant names matter to the guard. */
    enum Category { ORGANIC, SPONSORED, FB_SHORTS, SHOWCASE }

    /** Stands in for the showcase story type enum: only the constant names matter to the rule. */
    enum ShowcaseStoryType { SHOWCASE_SHORT_VIDEO }

    /** Stands in for Facebook's font family enum: only the constant's name matters to the swap. */
    enum FontFamily { OPTIMISTIC_TEXT_APP_BOLD }

    /** Stands in for the obfuscated ad item base class; the patch passes its binary name. */
    public static class AdBase {
    }

    public static final class VideoAd extends AdBase {
    }

    public static final class Reel {
    }

    public static final class Section {
        List<Object> items;

        Section(List<Object> items) {
            this.items = items;
        }
    }

    public static final class StoryCard {
        public Object getMedia() {
            return null;
        }
    }

    @Test
    public void everyHookBeforeTheContextLeavesTheSettingsUsable() {
        Context app = RuntimeEnvironment.getApplication();
        String ad = AdBase.class.getName();
        assertFalse("something set the context before this test", Utils.settingsReady());

        // Every hook a switch runs, with the arguments PausedHooksTest's probes use, and the
        // public feed guard as the patch calls it. Each has to take Facebook's path.
        assertFalse(FeedGuardForTests.hides(Category.SPONSORED, new Object()));
        assertFalse(FeedGuardForTests.hides(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit()));
        assertFalse(FeedGuardForTests.hidesRecommended(Category.ORGANIC, new GraphQLStory(),
                FeedGuardForTests.recommendationContext(true)));
        assertFalse(FeedGuardForTests.hides(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow()));
        assertFalse(FeedGuardForTests.hides(Category.ORGANIC, TypedFeedUnit.suggestedGroups()));
        assertFalse(FeedGuardForTests.hides(Category.ORGANIC, FeedGuardForTests.storiesRow(true)));
        assertFalse(FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY));
        assertFalse(FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY));
        assertFalse(FeedGuardForTests.hidesReels(Category.FB_SHORTS, new Object()));
        assertFalse(FeedGuardForTests.hidesShowcaseReels(Category.SHOWCASE, ShowcaseStoryType.SHOWCASE_SHORT_VIDEO));
        assertFalse(FeedFilter.hidePreEofReels());
        assertFalse(FeedGuardForTests.hides(Category.ORGANIC, new GraphQLStory(), FeedGuardForTests.detectedInfo(true)));
        assertFalse(FeedGuardForTests.hidesLabelled(Category.ORGANIC, new GraphQLStory(),
                FeedGuardForTests.detectedInfo(false), FeedGuardForTests.selfDisclosureInfo(true)));
        assertFalse("a post with listed words before the context was hidden", FeedGuardForTests.hidesByWords(
                Category.ORGANIC, new GraphQLStory(), FeedGuardForTests.postText("Big SPOILER inside")));
        assertFalse(FeedGuardForTests.hidesAiReel(new FeedGuardForTests.ReelItem(FeedGuardForTests.reelModel(true))));
        FeedGuardForTests.ReelItem flaggedReel = new FeedGuardForTests.ReelItem(FeedGuardForTests.reelModel(true));
        Section reelSection = new Section(new ArrayList<>(Arrays.asList(new Reel(), flaggedReel)));
        FeedGuardForTests.aiReelSections(Collections.singletonList(reelSection));
        assertTrue(reelSection.items.contains(flaggedReel));
        assertFalse(FeedFilter.hideEdge(Category.SPONSORED, new Object()));
        assertFalse(FeedFilter.hideSponsoredStories());
        assertFalse("a Stories tray fetched before the context lost its suggestions",
                SuggestedStoriesForTests.hidesSuggestions());
        VideoAd reelAd = new VideoAd();
        assertTrue(ReelsAdFilter.withoutAds(Arrays.asList(new Reel(), reelAd), ad).contains(reelAd));
        VideoAd sectionAd = new VideoAd();
        Section section = new Section(new ArrayList<>(Arrays.asList(new Reel(), sectionAd)));
        ReelsAdFilter.withoutAdSections(Collections.singletonList(section), ad);
        assertTrue(section.items.contains(sectionAd));
        assertFalse("a search page built before the context lost its ad", SearchAdFilterForTests.dropsAnAd());
        assertFalse("a profile row drawn before the context was left out", ProfileAdFilterForTests.hidesASponsoredStory());
        assertFalse("a Marketplace feed query sent before the context skipped its ads",
                MarketplaceAdFilterForTests.asksTheFeedToSkipAds());
        assertFalse("a Marketplace ads query sent before the context was held back",
                MarketplaceAdFilterForTests.holdsBackAnAdsQuery());
        Activity browser = Robolectric.buildActivity(Activity.class,
                new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.org/"))).create().get();
        assertFalse(ExternalBrowser.redirect(browser, browser.getIntent()));
        assertFalse(MediaDownload.saveStory(app, new StoryCard()));
        assertFalse(MediaDownload.offersSave(false));
        assertTrue("Facebook's own yes has to stand", MediaDownload.offersSave(true));
        assertFalse(ReelDownload.showsButton());
        assertNull(ReelDeclutter.filterChips(Arrays.asList(new TypedFeedUnit("XFBFBShortsRemixAttribution"))));
        assertFalse(ReelDeclutter.hideFollowButton());
        assertFalse(ReelDeclutter.hideFollowingButton());
        assertFalse(ReelDeclutter.skipHotComment());
        assertFalse(ReelDeclutter.skipSocialBubbles());
        assertFalse("a batch of watched reels sent before the context was held back", SeenStateSendForTests.heldBack());
        assertFalse(PlayerSourcesForTests.recordsAPlayer());
        assertFalse("a post menu built before the context got the video item", VideoMenuItemForTests.addsAnItem());
        assertFalse(PlayerSourcesForTests.recordsAVideoPlayer());
        assertFalse("a start before the context asked Facebook for a tab", StartTabRouteForTests.routes());
        assertFalse("a tab bar built before the context lost Home", MarketplaceOnlyForTests.hidesHome());
        assertFalse("a feed warm-up before the context was skipped", MarketplaceOnlyForTests.skipsFeedPrefetch());
        assertFalse("notifications before the context were muted", MarketplaceOnlyForTests.quietsNotifications());
        assertFalse("a comment request built before the context was given an order",
                DefaultCommentOrderForTests.asksForTheChosenOrder());
        assertFalse("a word typed before the context lost its tag suggestions", TagSuggestionsForTests.skipsAPlainWord());
        assertFalse("a list of people open before the context was closed", TagSuggestionsForTests.closesAListLeftOpen());
        assertFalse("a Chats list built before the context lost the Get Messenger card",
                MessengerCardForTests.hidesWithMessenger());
        assertFalse("a Menu built before the context lost its Upgrades", MenuSectionsForTests.hidesUpgrades());
        assertFalse("a profile built before the context lost People you may know",
                ProfileSuggestionsForTests.hidesTheCarousel());
        assertFalse("a Menu built before the context lost Also from Meta", MenuSectionsForTests.hidesServerAlsoFromMeta());
        assertTrue("a Menu list built before the context changed", MenuSettingsRow.withRow(Collections.emptyList()).isEmpty());
        assertFalse("a results page built before the context lost its Meta AI answer", MetaAiSearchForTests.hidesAnswer());
        assertFalse("a results page built before the context lost its Meta AI prompts", MetaAiSearchForTests.dropsPrompts());
        assertFalse("a suggestion parsed before the context lost its Meta AI route",
                MetaAiSearchForTests.stopsSuggestionRoute());
        // A push can start Facebook, so the notification hook can run this early.
        assertFalse("a trending video push before the context was blocked", NotificationKindsForTests.blocksTrendingVideo());
        assertFalse("a birthday push before the context was blocked", NotificationKindsForTests.blocksBirthday());
        assertTrue("a player start before the context was held",
                TapToPlay.allowStart(new Object(), TapToPlayForTests.Trigger.BY_AUTOPLAY));
        assertTrue("an older player start before the context was held",
                TapToPlay.allowLegacyStart(new Object(), TapToPlayForTests.Trigger.BY_AUTOPLAY));
        assertSame("the Autoplay setting read before the context was changed", TapToPlayForTests.Autoplay.ON,
                TapToPlay.autoplaySetting(TapToPlayForTests.Autoplay.ON));
        assertFalse("a reel built before the context was given its play button", TapToPlay.showReelPlayButton(false));
        assertFalse("a long video started before the context was moved", ResumePlaybackForTests.resumesALongVideo());
        String shared = "https://www.facebook.com/share/p/1AbCdEf/?mibextid=WC7FNe";
        assertEquals("a link shared before the context was cleaned", shared, LinkCleaner.sanitizeShared(shared));
        assertSame("a typeface resolved before the context was swapped", Typeface.SERIF,
                OwnFont.replace(Typeface.SERIF, FontFamily.OPTIMISTIC_TEXT_APP_BOLD, 700));
        Object fontBuilder = new Object();
        OwnFont.rememberVariation(fontBuilder, "'wght' 700");
        assertSame("a typeface built before the context was swapped", Typeface.SERIF,
                OwnFont.replaceBuilt(Typeface.SERIF, fontBuilder));
        assertSame("React Native text drawn before the context was swapped", Typeface.SERIF,
                OwnFont.replaceReactNative(Typeface.SERIF, "Optimistic VF App Lite 500"));
        // Facebook warms its emoji font from an app init task, which can ask the provider this early.
        assertNull("an emoji typeface asked for before the context was answered", SystemEmoji.typeface());
        assertFalse("a chat's big emoji asked for before the context lost Meta's picture", SystemEmoji.skipRemoteEmoji());

        // A hook that touched the settings above left them unusable, and this is where a real
        // start would crash. While setContext decides the pause the context is already set, so a
        // hook firing then still has to wait: a paused start must not run its patched path.
        boolean[] readyWhileDeciding = { true };
        boolean[] adKeptWhileDeciding = { false };
        PauseForTests.whileDeciding(() -> {
            readyWhileDeciding[0] = Utils.settingsReady();
            VideoAd early = new VideoAd();
            adKeptWhileDeciding[0] = ReelsAdFilter.withoutAds(Arrays.asList(new Reel(), early), ad).contains(early);
        });
        try {
            Utils.setContext(app);
        } catch (Throwable poisoned) {
            throw new AssertionError("a hook read a setting before the context was set, and setContext then threw",
                    poisoned);
        } finally {
            PauseForTests.whileDeciding(null);
        }
        assertFalse("hooks could read settings while the pause was still being decided", readyWhileDeciding[0]);
        assertTrue("a hook ran its patched path while the pause was still being decided", adKeptWhileDeciding[0]);
        assertTrue(Utils.settingsReady());
        assertTrue("the settings don't answer after a cold start", Settings.HIDE_SPONSORED_REELS.get());
    }
}
