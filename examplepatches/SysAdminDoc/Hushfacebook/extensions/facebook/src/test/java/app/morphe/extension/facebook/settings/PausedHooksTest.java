/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.widget.FrameLayout;

import com.facebook.common.util.TriState;
import com.facebook.graphql.model.GraphQLPagesYouMayLikeFeedUnit;
import com.facebook.graphql.model.GraphQLStory;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.facebook.ads.AffiliateLinks;
import app.morphe.extension.facebook.ads.MarketplaceAdFilterForTests;
import app.morphe.extension.facebook.ads.ProfileAdFilterForTests;
import app.morphe.extension.facebook.ads.ReelsAdFilter;
import app.morphe.extension.facebook.ads.SearchAdFilterForTests;
import app.morphe.extension.facebook.chats.MessengerCardForTests;
import app.morphe.extension.facebook.chats.MessengerIconForTests;
import app.morphe.extension.facebook.download.MediaDownload;
import app.morphe.extension.facebook.download.PlayerSourcesForTests;
import app.morphe.extension.facebook.download.ReelDownload;
import app.morphe.extension.facebook.download.SaveRulesForTests;
import app.morphe.extension.facebook.download.VideoMenuItemForTests;
import app.morphe.extension.facebook.emoji.SystemEmoji;
import app.morphe.extension.facebook.feed.FeedFilter;
import app.morphe.extension.facebook.feed.FeedsHeader;
import app.morphe.extension.facebook.feed.ReturnRefresh;
import app.morphe.extension.facebook.feed.FeedGuardForTests;
import app.morphe.extension.facebook.feed.MetaAiQuestions;
import app.morphe.extension.facebook.feed.PostDates;
import app.morphe.extension.facebook.feed.PostPrompts;
import app.morphe.extension.facebook.feed.ProfileSuggestionsForTests;
import app.morphe.extension.facebook.feed.TypedFeedUnit;
import app.morphe.extension.facebook.font.OwnFont;
import app.morphe.extension.facebook.comments.DefaultCommentOrderForTests;
import app.morphe.extension.facebook.composer.TagSuggestionsForTests;
import app.morphe.extension.facebook.media.QualityChoiceForTests;
import app.morphe.extension.facebook.media.ReelSpeedForTests;
import app.morphe.extension.facebook.media.ResumePlaybackForTests;
import app.morphe.extension.facebook.media.TapToPlay;
import app.morphe.extension.facebook.media.TapToPlayForTests;
import app.morphe.extension.facebook.menu.MenuSectionsForTests;
import app.morphe.extension.facebook.misc.ExternalBrowser;
import app.morphe.extension.facebook.misc.LinkCleaner;
import app.morphe.extension.facebook.navigation.BottomTabBar;
import app.morphe.extension.facebook.navigation.MarketplaceOnlyForTests;
import app.morphe.extension.facebook.navigation.ReelsTabForTests;
import app.morphe.extension.facebook.navigation.StartTabRouteForTests;
import app.morphe.extension.facebook.notifications.NotificationKindsForTests;
import app.morphe.extension.facebook.reels.DoubleTapLike;
import app.morphe.extension.facebook.reels.ReelHold;
import app.morphe.extension.facebook.reels.ReelHoldForTests;
import app.morphe.extension.facebook.reels.ReelDeclutter;
import app.morphe.extension.facebook.reels.ReelPrompts;
import app.morphe.extension.facebook.reels.SeenStateSendForTests;
import app.morphe.extension.facebook.search.MetaAiSearchForTests;
import app.morphe.extension.facebook.stories.StoryAdvance;
import app.morphe.extension.facebook.stories.StorySeen;
import app.morphe.extension.facebook.stories.SuggestedStoriesForTests;
import app.morphe.extension.facebook.updates.UpdatePrompts;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * What Pause and safe mode promise: every hook a switch runs takes Facebook's own path, and every
 * saved value stays as it is.
 *
 * <p>Each probe is one hook with its switch on. It must change Facebook's behaviour while
 * Hushfacebook runs, which is the control, and leave it alone while paused. A family that gains a
 * switch without a probe here fails the first test.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PausedHooksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for GraphQLFeedStoryCategory: only the constant names matter to the guard. */
    enum Category { ORGANIC, SPONSORED, PROMOTION, FB_SHORTS, SHOWCASE }

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

    /** A section wrapper: the screen reads the list it holds. */
    public static final class Section {
        List<Object> items;

        Section(List<Object> items) {
            this.items = items;
        }
    }

    /**
     * A story card. Hushfacebook's save asks it for its media before anything else, so a card
     * nobody asked was left to Facebook's own save.
     */
    public static final class StoryCard {
        boolean asked;

        public Object getMedia() {
            asked = true;
            return null;
        }
    }

    /** One hook with its switch on: true when it changed what Facebook would have done. */
    interface Probe {
        boolean changedFacebook();
    }

    private static final String AD = AdBase.class.getName();

    @After
    public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : settingsSwitches()) setting.resetToDefault();
        Settings.HIDDEN_WORDS.resetToDefault();
        FeedFilterCounters.clear();
        ReleaseCheckForTests.forget();
    }

    /**
     * The settings entry's own switches, which no family owns, one probe each, held to the same
     * promise as a family's: paused, or before the settings are ready, a start makes no request.
     */
    private static Map<BooleanSetting, Probe> entryProbes() {
        Map<BooleanSetting, Probe> probes = new LinkedHashMap<>();
        // Loads the check's own settings here, with the context, so a probe run without one reads
        // them rather than loading them.
        ReleaseCheck.Stored.CHECKED_AT.savedValue();
        // A Facebook start a day after the last try asks GitHub for the newest release.
        probes.put(Settings.CHECK_FOR_RELEASES, ReleaseCheckForTests::aStartAsksGitHub);
        return probes;
    }

    /**
     * The switches the download patches share, one probe each, held to the same promise: paused,
     * or before the settings are ready, a save picks what it would with the switch off.
     */
    private static Map<BooleanSetting, Probe> downloadProbes() {
        Map<BooleanSetting, Probe> probes = new LinkedHashMap<>();
        // A save takes the H.264 picture over the sharper AV1 one.
        probes.put(Settings.DOWNLOAD_COMPATIBLE, SaveRulesForTests::picksAFileOtherAppsOpen);
        return probes;
    }

    /** Adds a line to [wrong] for every entry probe that didn't answer [changes]. */
    private static void everyEntryProbe(Map<BooleanSetting, Probe> probes, boolean changes, String when,
                                        List<String> wrong) {
        for (Map.Entry<BooleanSetting, Probe> entry : probes.entrySet()) {
            if (entry.getValue().changedFacebook() != changes) {
                wrong.add(entry.getKey().key + ", " + when + (changes ? ": left Facebook alone" : ": still changed Facebook"));
            }
        }
    }

    private static Map<PatchFamily, List<Probe>> probes() {
        Map<PatchFamily, List<Probe>> probes = new EnumMap<>(PatchFamily.class);
        // A sponsored and a promoted edge at the funnel, and an ad swapped into the feed over another edge.
        probes.put(PatchFamily.SPONSORED_POSTS, Arrays.asList(
                () -> FeedGuardForTests.hides(Category.SPONSORED, new Object()),
                () -> FeedGuardForTests.hides(Category.PROMOTION, new Object()),
                () -> FeedGuardForTests.swapHides(Category.SPONSORED, new Object())));
        probes.put(PatchFamily.SUGGESTED_POSTS, Arrays.asList(
                () -> FeedGuardForTests.hides(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit()),
                // A story Facebook's own recommendation flag marks as suggested for you.
                () -> FeedGuardForTests.hidesRecommended(Category.ORGANIC, new GraphQLStory(),
                        FeedGuardForTests.recommendationContext(true)),
                () -> FeedGuardForTests.hides(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow()),
                () -> FeedGuardForTests.hides(Category.ORGANIC, TypedFeedUnit.suggestedGroups()),
                // A row of Stories from people you aren't connected to.
                () -> FeedGuardForTests.hides(Category.ORGANIC, FeedGuardForTests.storiesRow(true)),
                // Your own profile's People you may know carousel builds nothing.
                ProfileSuggestionsForTests::hidesTheCarousel));
        // Each of the feed's two Stories tray adapters returns nothing.
        probes.put(PatchFamily.STORIES_TRAY, Arrays.asList(
                () -> FeedFilter.hideStoriesTray(FeedFilter.LEGACY_TRAY),
                () -> FeedFilter.hideStoriesTray(FeedFilter.UNIFIED_TRAY)));
        // A row of reels between posts, by its category and by its showcase story type, and the
        // Reels row the pre-EOF injector builds without passing the edge guard.
        probes.put(PatchFamily.FEED_REELS, Arrays.asList(
                () -> FeedGuardForTests.hidesReels(Category.FB_SHORTS, new Object()),
                () -> FeedGuardForTests.hidesShowcaseReels(Category.SHOWCASE, ShowcaseStoryType.SHOWCASE_SHORT_VIDEO),
                FeedFilter::hidePreEofReels));
        // The refresh controller's resume callback, the feed's warm-start check and the foreground
        // auto-scroll, each the first check of a return, and the feed teardown while away.
        probes.put(PatchFamily.RETURN_REFRESH, Arrays.asList(
                () -> {
                    ReturnRefresh.uiHidden();
                    return ReturnRefresh.skip();
                },
                () -> {
                    ReturnRefresh.uiHidden();
                    return ReturnRefresh.holdWarmStart();
                },
                () -> {
                    ReturnRefresh.uiHidden();
                    return ReturnRefresh.holdAutoScroll();
                },
                ReturnRefresh::keepFeedWhileAway));
        // A story Facebook's own detection marked as made with AI, one only its creator labelled as AI,
        // and a reel whose GenAI attribution carries the detected flag, at both levels a page of reels
        // enters.
        probes.put(PatchFamily.AI_DETECTED_POSTS, Arrays.asList(
                () -> FeedGuardForTests.hides(Category.ORGANIC, new GraphQLStory(), FeedGuardForTests.detectedInfo(true)),
                () -> FeedGuardForTests.hidesLabelled(Category.ORGANIC, new GraphQLStory(),
                        FeedGuardForTests.detectedInfo(false), FeedGuardForTests.selfDisclosureInfo(true)),
                () -> FeedGuardForTests.hidesAiReel(new FeedGuardForTests.ReelItem(FeedGuardForTests.reelModel(true))),
                () -> {
                    FeedGuardForTests.ReelItem reel = new FeedGuardForTests.ReelItem(FeedGuardForTests.reelModel(true));
                    Section section = new Section(new ArrayList<>(Arrays.asList(new Reel(), reel)));
                    FeedGuardForTests.aiReelSections(Collections.singletonList(section));
                    return !section.items.contains(reel);
                }));
        // A story whose own words hold a phrase from the hide list. Paused, the list reads empty too.
        // Saved here, with the context, so a probe run without one reads it rather than loading it.
        Settings.HIDDEN_WORDS.save("spoiler");
        probes.put(PatchFamily.POST_WORDS, Collections.singletonList(
                () -> FeedGuardForTests.hidesByWords(Category.ORGANIC, new GraphQLStory(),
                        FeedGuardForTests.postText("Big SPOILER inside"))));
        // A story with a bumper is answered as one without, so no strip is drawn and no room kept.
        probes.put(PatchFamily.POST_PROMPTS, Collections.singletonList(() -> !PostPrompts.keep(true)));
        // The pill socket's yes for Meta AI's questions is answered as a no, so it draws no row for
        // them, and its default way of drawing a pill drops one typed meta_ai.
        probes.put(PatchFamily.META_AI_QUESTIONS, Arrays.asList(
                () -> !MetaAiQuestions.keep(1, MetaAiQuestions.META_AI_PILL),
                () -> MetaAiQuestions.dropsDefaultPill(MetaAiQuestions.META_AI_TYPE)));
        // A post header's yes to rotating its subtitle is answered as a no, so it keeps the one line.
        probes.put(PatchFamily.POST_DATES, Collections.singletonList(() -> !PostDates.cycling(true)));
        // The Feeds tab's yes to a title row is answered as a no, its filters go to a container
        // that's never on screen, and its posts get no room for them. The room follows what the
        // tab did with its filters, so that probe builds a tab first.
        probes.put(PatchFamily.FEEDS_HEADER, Arrays.asList(
                () -> !FeedsHeader.navBar(true),
                () -> FeedsHeader.hidesFilters(new FrameLayout(RuntimeEnvironment.getApplication())),
                () -> {
                    FeedsHeader.hidesFilters(new FrameLayout(RuntimeEnvironment.getApplication()));
                    return !FeedsHeader.roomForFilters(true);
                }));
        probes.put(PatchFamily.SPONSORED_STORIES, Collections.singletonList(FeedFilter::hideSponsoredStories));
        // A tray of a friend's bucket, a suggested one and one labelled SUGGESTED keeps only the friend's.
        probes.put(PatchFamily.SUGGESTED_STORIES, Collections.singletonList(SuggestedStoriesForTests::hidesSuggestions));
        probes.put(PatchFamily.STORY_AUTO_ADVANCE, Collections.singletonList(StoryAdvance::waitForTap));
        // The story viewer's report of the stories you viewed goes out.
        probes.put(PatchFamily.STORY_SEEN, Collections.singletonList(StorySeen::holdBack));
        probes.put(PatchFamily.SPONSORED_REELS, Arrays.asList(
                () -> {
                    VideoAd ad = new VideoAd();
                    return !ReelsAdFilter.withoutAds(Arrays.asList(new Reel(), ad), AD).contains(ad);
                },
                () -> {
                    VideoAd ad = new VideoAd();
                    Section section = new Section(new ArrayList<>(Arrays.asList(new Reel(), ad)));
                    ReelsAdFilter.withoutAdSections(Collections.singletonList(section), AD);
                    return !section.items.contains(ad);
                }));
        // A search results page leaves its SEARCH_ADS module out.
        probes.put(PatchFamily.SPONSORED_SEARCH, Collections.singletonList(SearchAdFilterForTests::dropsAnAd));
        // A timeline story with sponsored data isn't drawn on a profile.
        probes.put(PatchFamily.SPONSORED_PROFILE_POSTS,
                Collections.singletonList(ProfileAdFilterForTests::hidesASponsoredStory));
        // Marketplace's feed query asks to skip its ads, an ads-only query isn't sent, and a search
        // answer loses its ad.
        probes.put(PatchFamily.SPONSORED_MARKETPLACE, Arrays.asList(
                MarketplaceAdFilterForTests::asksTheFeedToSkipAds,
                MarketplaceAdFilterForTests::holdsBackAnAdsQuery,
                MarketplaceAdFilterForTests::dropsASearchAd));
        // A reel's product card is answered away, and so are a feed post's product footer and the
        // comment sheet's floating card.
        probes.put(PatchFamily.AFFILIATE_LINKS, Arrays.asList(
                () -> !AffiliateLinks.keepReelCard(true),
                () -> AffiliateLinks.keepFooter("footer") == null,
                () -> AffiliateLinks.keepCommentCard(new Object()) == null));
        // A Remix chip under a reel, the Follow and Following buttons beside its author, and both
        // footer queries.
        probes.put(PatchFamily.REEL_DECLUTTER, Arrays.asList(
                () -> ReelDeclutter.filterChips(Arrays.asList(new TypedFeedUnit("XFBFBShortsRemixAttribution"))) != null,
                ReelDeclutter::hideFollowButton,
                ReelDeclutter::hideFollowingButton,
                ReelDeclutter::skipHotComment,
                ReelDeclutter::skipSocialBubbles));
        // A reel that would get the interest prompt is answered as one that doesn't.
        probes.put(PatchFamily.REEL_PROMPTS, Collections.singletonList(() -> !ReelPrompts.keep(true)));
        // The Reels batcher's send of the reels you watched never reaches its executor.
        probes.put(PatchFamily.REEL_WATCH_HISTORY, Collections.singletonList(SeenStateSendForTests::heldBack));
        // A double tap on a reel finds no handler and no heart, the reel like helper finds no key and
        // sends no like from a double tap, and a feed attachment leaves its double tap unhandled.
        probes.put(PatchFamily.DOUBLE_TAP_LIKE, Arrays.asList(
                () -> DoubleTapLike.handler(new Object()) == null,
                () -> DoubleTapLike.heart(new Object()) == null,
                () -> DoubleTapLike.likeKey("reel") == null,
                () -> DoubleTapLike.holdBackLike("DOUBLE_TAP"),
                DoubleTapLike::holdBackTap));
        // A long press on a reel goes to Facebook's speed-up wherever it lands, the reel gets its
        // release listener, a hold speed of normal becomes 2x, the lift of a hold puts the speed back,
        // and that lift's speed is the one the reel had before the hold.
        // Each in a build with Hold a reel for 2x, as its patch's status says in one.
        probes.put(PatchFamily.REEL_HOLD, Arrays.asList(
                () -> ReelHoldForTests.withHold(() -> ReelHold.longPress(false)),
                () -> ReelHoldForTests.withHold(() -> ReelHold.anywhere(false)),
                () -> ReelHoldForTests.withHold(() -> ReelHold.speedUp(false)),
                () -> ReelHoldForTests.withHold(() -> ReelHold.holdSpeed(1.0) != 1.0),
                () -> ReelHoldForTests.withHold(() -> {
                    ReelHold.held();
                    return ReelHold.release(false);
                }),
                ReelHoldForTests::putsBackTheSpeedBeforeAHold));
        // A speed picked on a reel is set on the next reel the viewer starts.
        probes.put(PatchFamily.KEEP_REEL_SPEED, Collections.singletonList(ReelSpeedForTests::keepsAPickedSpeed));
        // A player's start with no tap before it is held, and Facebook's Autoplay setting reads Off.
        probes.put(PatchFamily.TAP_TO_PLAY, Arrays.asList(
                () -> {
                    TapToPlayForTests.forget();
                    return !TapToPlay.allowStart(new Object(), TapToPlayForTests.Trigger.BY_AUTOPLAY);
                },
                () -> {
                    TapToPlayForTests.forget();
                    return !TapToPlay.allowLegacyStart(new Object(), TapToPlayForTests.Trigger.BY_AUTOPLAY);
                },
                () -> TapToPlay.autoplaySetting(TapToPlayForTests.Autoplay.ON) != TapToPlayForTests.Autoplay.ON,
                () -> TapToPlay.showReelPlayButton(false)));
        // A long video left at 5:00 is saved, and its next start seeks back there.
        probes.put(PatchFamily.RESUME_LONG_VIDEOS, Collections.singletonList(ResumePlaybackForTests::resumesALongVideo));
        // A new video's first choice plays the chosen quality rather than Facebook's.
        probes.put(PatchFamily.PLAYBACK_QUALITY, Collections.singletonList(QualityChoiceForTests::playsTheChosenQuality));
        // The repository's answer for one of Meta's families, a variable-font builder's, and React
        // Native's for a family Facebook registered there.
        probes.put(PatchFamily.SYSTEM_FONT, Arrays.asList(
                () -> OwnFont.replace(Typeface.SERIF, FontFamily.OPTIMISTIC_TEXT_APP_BOLD, -1) != Typeface.SERIF,
                () -> {
                    Object builder = new Object();
                    OwnFont.rememberVariation(builder, "'wght' 700");
                    return OwnFont.replaceBuilt(Typeface.SERIF, builder) != Typeface.SERIF;
                },
                () -> OwnFont.replaceReactNative(Typeface.SERIF, "Optimistic VF App Lite 500") != Typeface.SERIF));
        // The emoji typeface provider hears the phone's default typeface instead of running its own code,
        // and the maker of Meta's emoji picture addresses hears there's no picture for a chat's big emoji.
        probes.put(PatchFamily.SYSTEM_EMOJI, Arrays.asList(
                () -> SystemEmoji.typeface() != null,
                SystemEmoji::skipRemoteEmoji));
        probes.put(PatchFamily.EXTERNAL_BROWSER, Collections.singletonList(() -> {
            Activity browser = Robolectric.buildActivity(Activity.class,
                    new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.org/"))).create().get();
            boolean left = ExternalBrowser.redirect(browser, browser.getIntent());
            boolean started = shadowOf(browser).getNextStartedActivity() != null;
            assertEquals("the answer and what the browser did disagree", left, started);
            return left;
        }));
        probes.put(PatchFamily.STORY_DOWNLOAD, Arrays.asList(
                () -> {
                    StoryCard card = new StoryCard();
                    MediaDownload.saveStory(RuntimeEnvironment.getApplication(), card);
                    return card.asked;
                },
                // The menu offers Save on someone else's story.
                () -> MediaDownload.offersSave(false),
                // The recorder runs in every player Facebook builds, not only in stories.
                PlayerSourcesForTests::recordsAPlayer));
        // Every reel's sidebar gets the Download button.
        probes.put(PatchFamily.REEL_DOWNLOAD, Collections.singletonList(ReelDownload::showsButton));
        // A video post's menu gets Download to phone, and the video recorder keeps a player.
        probes.put(PatchFamily.VIDEO_DOWNLOAD, Arrays.asList(
                VideoMenuItemForTests::addsAnItem,
                PlayerSourcesForTests::recordsAVideoPlayer));
        // A start from the launcher icon asks Facebook for the chosen tab.
        probes.put(PatchFamily.START_TAB, Collections.singletonList(StartTabRouteForTests::routes));
        // The tab bar builder is told to leave Home out.
        probes.put(PatchFamily.MARKETPLACE_ONLY, Arrays.asList(
                MarketplaceOnlyForTests::hidesHome, MarketplaceOnlyForTests::quietsNotifications,
                MarketplaceOnlyForTests::skipsFeedPrefetch));
        // The tab bar builder is told to leave the Reels tab out.
        // Facebook's push of its Reels launcher shortcut is held back too.
        probes.put(PatchFamily.REELS_TAB, Arrays.asList(ReelsTabForTests::hidesTheTab,
                ReelsTabForTests::dropsTheShortcut));
        // The tab bar's count for the Reels tab reads none.
        probes.put(PatchFamily.REELS_TAB_DOT, Collections.singletonList(ReelsTabForTests::clearsTheDot));
        // Facebook's own override of where the tab bar goes reads YES, for the bottom, where it read NO.
        probes.put(PatchFamily.BOTTOM_TAB_BAR, Collections.singletonList(
                () -> BottomTabBar.override(TriState.NO.ordinal()) == TriState.YES.ordinal()));
        // A request for a post's comments that names no order asks for the chosen one.
        probes.put(PatchFamily.DEFAULT_COMMENT_ORDER,
                Collections.singletonList(DefaultCommentOrderForTests::asksForTheChosenOrder));
        // A word without @ in a post or comment box looks nobody up, and a list of people left open
        // by an earlier @ is closed.
        probes.put(PatchFamily.TAG_SUGGESTIONS, Arrays.asList(
                TagSuggestionsForTests::skipsAPlainWord,
                TagSuggestionsForTests::closesAListLeftOpen));
        // With Messenger installed, the card's show question answers no in Chats.
        probes.put(PatchFamily.MESSENGER_CARD, Collections.singletonList(MessengerCardForTests::hidesWithMessenger));
        // With Messenger installed, a tap on the top bar's Messenger icon opens Messenger instead of Chats.
        probes.put(PatchFamily.MESSENGER_ICON, Collections.singletonList(MessengerIconForTests::opensMessenger));
        // The Menu's Upgrades and Also from Meta groups build nothing, in the section Facebook
        // draws and in the one carrying what the server sends.
        probes.put(PatchFamily.MENU_PROMOTIONS, Arrays.asList(
                MenuSectionsForTests::hidesUpgrades,
                MenuSectionsForTests::hidesAlsoFromMeta,
                MenuSectionsForTests::hidesServerUpgrades,
                MenuSectionsForTests::hidesServerAlsoFromMeta));
        // Search leaves out its Meta AI answer and its prompt modules, and a suggestion set to open
        // Meta AI opens the results.
        probes.put(PatchFamily.META_AI_SEARCH, Arrays.asList(
                MetaAiSearchForTests::hidesAnswer,
                MetaAiSearchForTests::dropsPrompts,
                MetaAiSearchForTests::stopsSuggestionRoute));
        // A push of each kind a notification switch blocks isn't posted.
        probes.put(PatchFamily.PROMO_NOTIFICATIONS, Arrays.asList(
                NotificationKindsForTests::blocksTrendingVideo,
                NotificationKindsForTests::blocksMemory,
                NotificationKindsForTests::blocksBirthday,
                NotificationKindsForTests::blocksHighlights,
                NotificationKindsForTests::blocksPeopleYouMayKnow,
                NotificationKindsForTests::blocksNearby));
        // A shared link loses what the app added to it.
        probes.put(PatchFamily.SANITIZE_SHARING_LINKS, Collections.singletonList(() -> {
            String shared = "https://www.facebook.com/share/p/1AbCdEf/?mibextid=WC7FNe";
            return !shared.equals(LinkCleaner.sanitizeShared(shared));
        }));
        // Both Meta App Manager promotion filters fail, the force-sync push is skipped, and the
        // chat filter that targets older versions fails.
        probes.put(PatchFamily.UPDATE_PROMPTS, Arrays.asList(
                UpdatePrompts::blockPromotion,
                UpdatePrompts::blockForceSync,
                () -> UpdatePrompts.blockVersionCeiling(UpdatePrompts.VERSION_CEILING_FILTER)));
        return probes;
    }

    /** Every switch the settings screen can show, read off the class so a new one can't hide. */
    static List<BooleanSetting> settingsSwitches() {
        List<BooleanSetting> switches = new ArrayList<>();
        for (Field field : Settings.class.getDeclaredFields()) {
            if (!Modifier.isStatic(field.getModifiers()) || field.getType() != BooleanSetting.class) continue;
            try {
                switches.add((BooleanSetting) field.get(null));
            } catch (IllegalAccessException unreadable) {
                throw new AssertionError(unreadable);
            }
        }
        return switches;
    }

    private static Set<PatchFamily> switched() {
        Set<PatchFamily> switched = EnumSet.noneOf(PatchFamily.class);
        for (PatchFamily family : PatchFamily.values()) {
            if (!family.switches.isEmpty()) switched.add(family);
        }
        return switched;
    }

    /** Adds a line to [wrong] for every probe that didn't answer [changes]. */
    private static void everyProbe(Map<PatchFamily, List<Probe>> probes, boolean changes, String when,
                                   List<String> wrong) {
        for (Map.Entry<PatchFamily, List<Probe>> entry : probes.entrySet()) {
            for (int i = 0; i < entry.getValue().size(); i++) {
                if (entry.getValue().get(i).changedFacebook() != changes) {
                    wrong.add(entry.getKey().patchName + ", probe " + i + ", " + when
                            + (changes ? ": left Facebook alone" : ": still changed Facebook"));
                }
            }
        }
    }

    @Test
    public void everyHookASwitchRunsTakesFacebooksOwnPathWhilePaused() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<PatchFamily, List<Probe>> probes = probes();
        assertEquals("every family with a switch needs a probe here", switched(), probes.keySet());
        Map<BooleanSetting, Probe> entry = entryProbes();
        assertEquals("every switch of the settings entry needs a probe here",
                new HashSet<>(PatchFamily.ENTRY_SWITCHES), entry.keySet());
        Map<BooleanSetting, Probe> downloads = downloadProbes();
        assertEquals("every switch the downloads share needs a probe here",
                new HashSet<>(PatchFamily.DOWNLOAD_SWITCHES), downloads.keySet());

        // Every hook is asked every time, so one run names every hook that broke the promise.
        List<String> wrong = new ArrayList<>();
        everyProbe(probes, true, "running", wrong);
        everyEntryProbe(entry, true, "running", wrong);
        everyEntryProbe(downloads, true, "running", wrong);

        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            everyProbe(probes, false, "paused by " + why, wrong);
            everyEntryProbe(entry, false, "paused by " + why, wrong);
            everyEntryProbe(downloads, false, "paused by " + why, wrong);
        }

        PauseForTests.resume();
        everyProbe(probes, true, "running again", wrong);
        everyEntryProbe(entry, true, "running again", wrong);
        everyEntryProbe(downloads, true, "running again", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    /**
     * Facebook can call a hook before its application's onCreate hands Hushfacebook the context,
     * from a thread it starts early, and again while setContext is still deciding whether this
     * start runs paused. Until both are done, every hook takes Facebook's own path whatever is
     * saved (see Utils.settingsReady). This JVM's Setting class loaded with a context, so a hook
     * that reads its switch anyway answers on here and is named. Whether a hook reads a switch
     * before its guard, which is what crashes a start, is ColdStartHooksTest's to see.
     */
    @Test
    public void untilTheSettingsAreReadyEveryHookTakesFacebooksOwnPath() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<PatchFamily, List<Probe>> probes = probes();
        assertEquals("every family with a switch needs a probe here", switched(), probes.keySet());
        Map<BooleanSetting, Probe> entry = entryProbes();
        Map<BooleanSetting, Probe> downloads = downloadProbes();

        List<String> wrong = new ArrayList<>();
        SettingsContextRule.withoutContext(() -> {
            everyProbe(probes, false, "before the context is set", wrong);
            everyEntryProbe(entry, false, "before the context is set", wrong);
            everyEntryProbe(downloads, false, "before the context is set", wrong);
        });
        // Safe mode on, as after three crashed starts: the context is set and the pause undecided.
        BaseSettings.SAFE_MODE.save(true);
        try {
            SettingsContextRule.beforeThePauseIsDecided(() -> {
                everyProbe(probes, false, "before the pause is decided", wrong);
                everyEntryProbe(entry, false, "before the pause is decided", wrong);
                everyEntryProbe(downloads, false, "before the pause is decided", wrong);
            });
        } finally {
            BaseSettings.SAFE_MODE.resetToDefault();
        }
        everyProbe(probes, true, "once they're ready", wrong);
        everyEntryProbe(entry, true, "once they're ready", wrong);
        everyEntryProbe(downloads, true, "once they're ready", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    @Test
    public void pausedEverySwitchAnswersOffAndKeepsWhatWasSaved() {
        List<BooleanSetting> switches = settingsSwitches();
        assertFalse("found no switches to check", switches.isEmpty());
        for (BooleanSetting setting : switches) setting.save(true);

        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        for (BooleanSetting setting : switches) {
            assertFalse(setting.key + " answered on while paused", setting.get());
            assertTrue(setting.key + " lost what was saved", setting.savedValue());
        }

        PauseForTests.resume();
        for (BooleanSetting setting : switches) {
            assertTrue(setting.key + " stayed off after the pause ended", setting.get());
        }
    }

    /**
     * The Pause row and the paused card say Debug logging keeps working, which is how a paused
     * start gets logged for a report.
     */
    @Test
    public void debugLoggingKeepsWorkingWhilePaused() {
        BaseSettings.DEBUG.save(true);
        try {
            for (HushfacebookPause.Reason why : HushfacebookPause.Reason.values()) {
                if (why == HushfacebookPause.Reason.NONE) continue;
                PauseForTests.pause(why);
                assertTrue("Debug logging answered off while paused by " + why, BaseSettings.DEBUG.get());
            }
        } finally {
            BaseSettings.DEBUG.resetToDefault();
        }
    }
}
