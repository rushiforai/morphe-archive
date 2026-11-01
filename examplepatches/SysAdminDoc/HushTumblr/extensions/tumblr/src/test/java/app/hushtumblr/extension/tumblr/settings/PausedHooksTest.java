/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.os.Looper;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;

import com.tumblr.rumblr.model.TimelineObject;
import com.tumblr.rumblr.model.TimelineObjectType;
import com.tumblr.rumblr.model.Timelineable;
import com.tumblr.rumblr.model.post.blocks.TextBlock;

import app.hushtumblr.extension.tumblr.flags.FeatureSwitches;
import app.hushtumblr.extension.tumblr.flags.FeatureSwitchesTest;
import app.hushtumblr.extension.tumblr.notifications.PushNotificationsTest;
import app.hushtumblr.extension.tumblr.notifications.ActivityNotifications;
import app.hushtumblr.extension.tumblr.notifications.HushActivityNotification;
import app.hushtumblr.extension.tumblr.mature.AllowedMatureContent;
import app.hushtumblr.extension.tumblr.mature.HushAgeVerification;
import app.hushtumblr.extension.tumblr.mature.HushMatureAccount;
import app.hushtumblr.extension.tumblr.mature.HushMaturePermission;
import app.hushtumblr.extension.tumblr.mature.HushMatureResponse;
import app.hushtumblr.extension.tumblr.mature.HushMatureService;
import app.hushtumblr.extension.tumblr.mutual.HushMutualAccount;
import app.hushtumblr.extension.tumblr.mutual.HushMutualFollower;
import app.hushtumblr.extension.tumblr.mutual.HushMutualPage;
import app.hushtumblr.extension.tumblr.mutual.HushMutualResponse;
import app.hushtumblr.extension.tumblr.mutual.HushMutualSource;
import app.hushtumblr.extension.tumblr.mutual.HushPrimaryBlog;
import app.hushtumblr.extension.tumblr.mutual.MutualMarkers;
import app.hushtumblr.extension.tumblr.privacy.AdvertisingId;
import app.hushtumblr.extension.tumblr.rootmute.HushAccountIdentity;
import app.hushtumblr.extension.tumblr.rootmute.MatureAccountsForTests;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutes;
import app.hushtumblr.extension.tumblr.timeline.HushPost;
import app.hushtumblr.extension.tumblr.timeline.HushRootPost;
import app.hushtumblr.extension.tumblr.timeline.HushTrail;
import app.hushtumblr.extension.tumblr.timeline.TimelineFilter;
import app.hushtumblr.extension.tumblr.timeline.TimelineItems;
import app.hushtumblr.extension.tumblr.ui.AltTextCaptions;
import app.hushtumblr.extension.tumblr.ui.BottomBarForTests;
import app.hushtumblr.extension.tumblr.ui.BottomBarTabsForTests;
import app.hushtumblr.extension.tumblr.ui.DarkBackgroundForTests;
import app.hushtumblr.extension.tumblr.ui.PostFooter;
import app.hushtumblr.extension.tumblr.ui.PostFooterForTests;
import app.hushtumblr.extension.tumblr.ui.PostParts;
import app.hushtumblr.extension.tumblr.ui.PostTimestamps;
import app.hushtumblr.extension.tumblr.ui.ReviewPrompts;
import app.hushtumblr.extension.tumblr.ui.OptionalNudges;
import app.hushtumblr.extension.tumblr.ui.AppFontForTests;
import app.hushtumblr.extension.tumblr.ui.PostLines;
import app.hushtumblr.extension.tumblr.ui.StoreButtons;
import app.hushtumblr.extension.tumblr.ui.HushImageContainer;
import app.hushtumblr.extension.tumblr.ui.HushImageDescription;
import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;

/**
 * What Pause and safe mode promise: every hook a switch runs takes Tumblr's own path, and every
 * saved value stays as it is.
 *
 * <p>Each probe is one hook with its switch on. It must change what Tumblr does while HushTumblr
 * runs, which is the control, and leave it alone while paused. A family that gains a switch
 * without a probe here fails the first test. Dependent options have a separate contract that
 * enables their parent and checks both their selected outcome and Tumblr's original paused path.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PausedHooksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** One hook with its switch on: true when it changed what Tumblr would have done. */
    interface Probe {
        boolean changedTumblr();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : settingsSwitches()) setting.resetToDefault();
        TextSettings.HIDDEN_WORDS.resetToDefault();
        TextSettings.ALLOWED_WORDS.resetToDefault();
        TextSettings.TAB_ORDER.resetToDefault();
        BottomBarTabsForTests.forget();
        BottomBarForTests.forget();
        PatchFamily.capabilitiesForTests = null;
        PatchFamily.inBuildForTests = null;
        ReleaseCheckForTests.forget();
        Utils.setActivity(null);
        resetHook(MutualMarkers.class);
        resetHook(AllowedMatureContent.class);
        MatureAccountsForTests.restore();
        testField(RootPostMutes.class, "fileForTests", null);
        HookStatus.clear();
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
        // A Tumblr start a day after the last try asks GitHub for the newest release.
        probes.put(Settings.CHECK_FOR_RELEASES, ReleaseCheckForTests::aStartAsksGitHub);
        return probes;
    }

    private static Map<BooleanSetting, List<Probe>> probes() {
        // Every hook is in this build, so each hook reads its family's switch.
        PatchFamily.capabilitiesForTests = EnumSet.allOf(PatchFamily.Capability.class);
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        Map<BooleanSetting, List<Probe>> probes = new LinkedHashMap<>();
        // A page with an ad comes back without it, and Tumblr's own ad requests are turned off.
        probes.put(Settings.HIDE_ADS, Arrays.asList(
                TimelineItems::aPageLosesItsAd,
                () -> !FeatureSwitches.isEnabled(FeatureSwitchesTest.flag("MAKE_ADX_REQUESTS"), true)));
        // Both getters of Google's advertising ID info answer as if the ID were deleted.
        probes.put(Settings.HIDE_ADVERTISING_ID, Arrays.asList(
                () -> !"real".equals(AdvertisingId.id("real")),
                () -> AdvertisingId.limitTracking(false)));
        // Tumblr's own tracking flags answer off.
        probes.put(Settings.DISABLE_ANALYTICS, Collections.singletonList(
                () -> !FeatureSwitches.isEnabled(FeatureSwitchesTest.flag("LIVERAMP_ATS"), true)));
        // The dashboard's Ad-Free Browsing banner flag answers off.
        probes.put(Settings.HIDE_AD_FREE_BANNER, Collections.singletonList(
                () -> !FeatureSwitches.isEnabled(FeatureSwitchesTest.flag("AD_FREE_CTA_BANNER"), true)));
        // The Tumblr TV tab's flag answers off.
        probes.put(Settings.HIDE_TUMBLR_TV, Collections.singletonList(
                () -> !FeatureSwitches.isEnabled(FeatureSwitchesTest.flag("TUMBLR_TV_MOBILE_NAV"), true)));
        // The Communities tab's button goes when the bar is built, and the post editor's Communities
        // tips flag answers off. The tab's own flag is left to Tumblr (FeatureSwitches).
        probes.put(Settings.HIDE_COMMUNITIES_TAB, Arrays.asList(
                BottomBarTabsForTests::hidesTheCommunitiesTab,
                () -> !FeatureSwitches.isEnabled(FeatureSwitchesTest.flag("COMMUNITIES_TOOLTIPS"), true)));
        // The Blaze button in your blog's header answers off.
        probes.put(Settings.HIDE_BLAZE_PROMPTS, Collections.singletonList(
                () -> !FeatureSwitches.isEnabled(FeatureSwitchesTest.flag("BLAZE_DASHBOARD_ENTRYPOINT_IN_USER_BLOG_HEADER"), true)));
        // Tumblr's rating prompt is skipped.
        probes.put(Settings.SKIP_REVIEW_PROMPTS, Collections.singletonList(ReviewPrompts::skip));
        probes.put(Settings.HIDE_BLOG_NOTIFICATION_REMINDERS,
                Collections.singletonList(OptionalNudges::hideBlogNotificationReminder));
        probes.put(Settings.HIDE_GIFT_MESSAGE_POPUPS, Collections.singletonList(
                () -> OptionalNudges.hideGiftMessage("key_has_seen_ad_free_browsing_gift_popup")));
        probes.put(Settings.LINE_BETWEEN_POSTS, Collections.singletonList(() -> PostLines.paintsGaps(0) == 1));
        probes.put(Settings.APP_FONT, Collections.singletonList(AppFontForTests::swapsAFont));
        // Tumblr's screenshot watcher answers off.
        probes.put(Settings.TURN_OFF_SCREENSHOT_SHARING, Collections.singletonList(
                () -> !FeatureSwitches.isEnabled(FeatureSwitchesTest.flag("SCREENSHOT_INTERCEPTION"), true)));
        // Tumblr's in-app update check answers off.
        probes.put(Settings.DISABLE_UPDATE_PROMPTS, Collections.singletonList(
                () -> !FeatureSwitches.isEnabled(FeatureSwitchesTest.flag("IN_APP_UPDATE"), true)));
        // A page with a suggested blog card comes back without it.
        probes.put(Settings.HIDE_SUGGESTED_BLOGS, Collections.singletonList(TimelineItems::aPageLosesItsBlogCard));
        // A page with a suggested community card comes back without it.
        probes.put(Settings.HIDE_SUGGESTED_COMMUNITIES, Collections.singletonList(TimelineItems::aPageLosesItsCommunityCard));
        // A page with a carousel of suggested tags comes back without it.
        probes.put(Settings.HIDE_SUGGESTED_TAGS, Collections.singletonList(TimelineItems::aPageLosesItsTagCarousel));
        // A page with a Watch it row comes back without it.
        probes.put(Settings.HIDE_WATCH_IT_ROWS, Collections.singletonList(TimelineItems::aPageLosesItsWatchItRow));
        // A post's tags are left out.
        probes.put(Settings.HIDE_HASHTAGS, Collections.singletonList(PostParts::hideTags));
        // A post header's Follow button is hidden.
        probes.put(Settings.HIDE_FOLLOW_BUTTON, Collections.singletonList(PostParts::hideFollowButton));
        // The Premium diamond is hidden.
        probes.put(Settings.HIDE_TUMBLRMART, Collections.singletonList(() -> StoreButtons.hideDiamond(null, null)));
        // The like, reblog and comment counts under a post are blank, and a community reaction keeps
        // its emoji without its count.
        probes.put(Settings.HIDE_NOTE_COUNTS, Arrays.asList(() -> PostFooter.noteCount(5) == 0,
                () -> "😀".equals(PostFooter.communityReactionsText("😀 5", 5))));
        // The footer under a post leaves out a button. Each answer is kept until Tumblr restarts, so
        // each probe asks as a fresh start would.
        probes.put(Settings.HIDE_LIKE_BUTTON,
                Collections.singletonList(() -> PostFooterForTests.askedAfresh(PostFooter::hideLikeButton)));
        probes.put(Settings.HIDE_REBLOG_BUTTON,
                Collections.singletonList(() -> PostFooterForTests.askedAfresh(PostFooter::hideReblogButton)));
        probes.put(Settings.HIDE_COMMENT_BUTTON,
                Collections.singletonList(() -> PostFooterForTests.askedAfresh(PostFooter::hideCommentButton)));
        probes.put(Settings.HIDE_SHARE_BUTTON,
                Collections.singletonList(() -> PostFooterForTests.askedAfresh(PostFooter::hideShareButton)));
        probes.put(Settings.HIDE_SAVE_BUTTON,
                Collections.singletonList(() -> PostFooterForTests.askedAfresh(PostFooter::hideSaveButton)));
        // The bottom bar gets no unread badge to pop in on that switch's tab.
        probes.put(Settings.HIDE_DASHBOARD_COUNT, Collections.singletonList(BottomBarForTests::hidesTheDashboardCount));
        probes.put(Settings.HIDE_COMMUNITIES_COUNT, Collections.singletonList(BottomBarForTests::hidesTheCommunitiesCount));
        probes.put(Settings.HIDE_NOTIFICATIONS_COUNT,
                Collections.singletonList(BottomBarForTests::hidesTheNotificationsCount));
        // A page with a reblog comes back without it.
        probes.put(Settings.HIDE_REBLOGS, Collections.singletonList(TimelineItems::aPageLosesItsReblog));
        // A page with a video post comes back without it.
        probes.put(Settings.HIDE_VIDEO_POSTS, Collections.singletonList(TimelineItems::aPageLosesItsVideoPost));
        // A page with a photo post comes back without it.
        probes.put(Settings.HIDE_PHOTO_POSTS, Collections.singletonList(TimelineItems::aPageLosesItsPhotoPost));
        // A page with a text post comes back without it.
        probes.put(Settings.HIDE_TEXT_POSTS, Collections.singletonList(TimelineItems::aPageLosesItsTextPost));
        // A page with a post holding the saved word comes back without it. The word is saved here,
        // with the context and unpaused; paused, the list answers empty like a switch answers off.
        TextSettings.HIDDEN_WORDS.save(TimelineItems.PROBE_WORD);
        probes.put(Settings.HIDE_POSTS_WITH_WORDS, Collections.singletonList(() -> withSwitch(
                Settings.WORDS_CURRENT_TEXT, TimelineItems::aPageLosesItsPostWithAHiddenWord)));
        // A page with a post Tumblr covers for a filtered tag comes back without it.
        probes.put(Settings.HIDE_FILTERED_POSTS, Collections.singletonList(TimelineItems::aPageLosesItsFilteredPost));
        // A theme on the Dark palette gets the patch's background style, and the design system's
        // page gray comes back as the style's color.
        probes.put(Settings.DARK_BACKGROUND, Arrays.asList(
                DarkBackgroundForTests::paintsATheme, DarkBackgroundForTests::paintsTheDesignColors));
        probes.put(Settings.DARK_BACKGROUND_WALLPAPER, Collections.singletonList(DarkBackgroundForTests::choosesTheWallpaper));
        // The Explore tab's button goes when the bar is built.
        probes.put(Settings.HIDE_EXPLORE_TAB, Collections.singletonList(BottomBarTabsForTests::hidesTheExploreTab));
        // The Notifications tab's button goes when the bar is built.
        probes.put(Settings.HIDE_NOTIFICATIONS_TAB, Collections.singletonList(BottomBarTabsForTests::hidesTheNotificationsTab));
        // The tab list puts the saved first tab first. The order is saved here like the words above;
        // paused, it answers empty and Tumblr's order stays.
        TextSettings.TAB_ORDER.save(BottomBarTabsForTests.PROBE_ORDER);
        probes.put(Settings.REORDER_TABS, Collections.singletonList(BottomBarTabsForTests::reordersTheTabs));
        // Firebase's sign-up for push notifications names Tumblr's own certificate.
        probes.put(Settings.FIX_PUSH_NOTIFICATIONS, Collections.singletonList(PushNotificationsTest::fixesACertificate));
        BooleanSetting[] notifications = {Settings.HIDE_NOTIFICATION_LIKES, Settings.HIDE_NOTIFICATION_REBLOGS,
                Settings.HIDE_NOTIFICATION_REPLIES, Settings.HIDE_NOTIFICATION_FOLLOWS,
                Settings.HIDE_NOTIFICATION_MENTIONS, Settings.HIDE_NOTIFICATION_ASKS, Settings.HIDE_NOTIFICATION_BOOPS};
        String[] types = {"Like", "Reblog", "Reply", "Follower", "NoteMention", "Ask", "Boop"};
        for (int i = 0; i < notifications.length; i++) {
            String type = types[i];
            probes.put(notifications[i], Collections.singletonList(() -> ActivityNotifications.filter(
                    Collections.singletonList((HushActivityNotification) () -> type)).isEmpty()));
        }
        probes.put(Settings.SHOW_POST_TIMESTAMPS, Collections.singletonList(() -> PostTimestamps.show(false)));
        Context context = Utils.getContext();
        probes.put(Settings.SHOW_IMAGE_DESCRIPTIONS, Arrays.asList(() -> caption(context, false), () -> caption(context, true)));
        probes.put(Settings.MUTE_ROOT_POSTS, Collections.singletonList(() -> mutedRoot(context)));
        probes.put(Settings.REVEAL_ALLOWED_MATURE_CONTENT, Collections.singletonList(PausedHooksTest::matureCover));
        probes.put(Settings.SHOW_MUTUAL_MARKERS, Collections.singletonList(() -> mutualMarker(context)));
        return probes;
    }

    private static List<BooleanSetting> dependentSwitches() {
        return Arrays.asList(Settings.KEEP_TAGGED_REBLOGS, Settings.KEEP_REBLOGS_WITH_CONTENT, Settings.WORDS_CURRENT_TEXT,
                Settings.WORDS_REBLOG_TRAIL, Settings.WORDS_TAGS, Settings.WORDS_SUMMARY);
    }

    private static Set<BooleanSetting> probedSwitches(Map<BooleanSetting, List<Probe>> probes) {
        Set<BooleanSetting> covered = new HashSet<>(probes.keySet());
        covered.addAll(dependentSwitches());
        return covered;
    }

    private static boolean withSwitch(BooleanSetting dependency, Probe probe) {
        boolean saved = dependency.savedValue();
        dependency.save(true);
        try { return probe.changedTumblr(); }
        finally { dependency.save(saved); }
    }

    private static boolean caption(Context context, boolean gallery) {
        LinearLayout parent = new LinearLayout(context);
        parent.setOrientation(LinearLayout.VERTICAL);
        FrameLayout frame = new FrameLayout(context);
        parent.addView(frame);
        HushImageContainer holder = () -> frame;
        HushImageDescription description = () -> "A red balloon over a lake";
        if (gallery) AltTextCaptions.gallery(holder, description); else AltTextCaptions.photo(holder, description);
        return parent.getChildCount() == 2;
    }

    private static boolean mutedRoot(Context context) {
        File document = null;
        try {
            MatureAccountsForTests.reset();
            document = File.createTempFile("paused-mutes-", ".json", context.getCacheDir());
            StringBuilder key = new StringBuilder();
            for (byte value : MessageDigest.getInstance("SHA-256").digest("pause-probe-account".getBytes(StandardCharsets.UTF_8)))
                key.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
            Files.write(document.toPath(), ("{\"version\":1,\"accounts\":[{\"account\":\"" + key
                    + "\",\"roots\":[\"123\"]}]}").getBytes(StandardCharsets.UTF_8));
            testField(RootPostMutes.class, "fileForTests", document);
            testField(RootPostMutes.class, "workerForTests", (Consumer<Runnable>) Runnable::run);
            MatureAccountsForTests.commit(new ProbeAccount(null));
            return RootPostMutes.shouldHide((HushRootPost) () -> "123");
        } catch (Exception unavailable) { throw new AssertionError(unavailable); }
        finally {
            MatureAccountsForTests.restore();
            testField(RootPostMutes.class, "fileForTests", null);
            if (document != null) assertTrue(document.delete());
        }
    }

    private static boolean matureCover() {
        resetHook(AllowedMatureContent.class);
        MatureAccountsForTests.reset();
        try {
            testField(AllowedMatureContent.class, "workerForTests", (Consumer<Runnable>) Runnable::run);
            HushAgeVerification gate = () -> false;
            AllowedMatureContent.ageGateParsed(gate, 0);
            MatureAccountsForTests.commit(new ProbeAccount(gate));
            int[] requests = {0};
            AllowedMatureContent.service((HushMatureService) token -> {
                requests[0]++;
                HushMaturePermission permission = new HushMaturePermission() {
                    @Override public Boolean hushShowMatureContent() { return true; }
                    @Override public Boolean hushCanEditMatureContent() { return true; }
                };
                AllowedMatureContent.permissionParsed(permission, 0);
                AllowedMatureContent.received(token, new HushMatureResponse() {
                    @Override public Object hushResponse() { return permission; }
                    @Override public int hushStatus() { return 200; }
                });
            });
            AllowedMatureContent.cover(true);
            boolean changed = !AllowedMatureContent.cover(true);
            if (requests[0] != 0) { assertEquals(1, requests[0]); assertTrue(changed); }
            return changed || requests[0] != 0;
        } finally { resetHook(AllowedMatureContent.class); MatureAccountsForTests.restore(); }
    }

    private static boolean mutualMarker(Context context) {
        resetHook(MutualMarkers.class);
        MatureAccountsForTests.reset();
        try {
            MatureAccountsForTests.commit(new ProbeAccount(null));
            testField(MutualMarkers.class, "workerForTests", (Consumer<Runnable>) Runnable::run);
            ProbeBlog friend = new ProbeBlog("friend", false);
            HushMutualFollower follower = new HushMutualFollower() {
                @Override public boolean hushMutualFollowing() { return true; }
                @Override public Object hushMutualFollowerBlog() { return friend; }
            };
            HushMutualPage page = new HushMutualPage() {
                @Override public List<?> hushMutualUsers() { return Collections.singletonList(follower); }
                @Override public Object hushMutualPagination() { return null; }
                @Override public Object hushMutualLinks() { return null; }
            };
            int[] requests = {0};
            HushMutualSource source = new HushMutualSource() {
                @Override public Object first(String host) { assertEquals("primary.tumblr.com", host); requests[0]++; return this; }
                @Override public Object next(String link) { throw new AssertionError("one page has no next link"); }
                @Override public Object execute(Object call, long timeout) {
                    return new HushMutualResponse() {
                        @Override public Object hushMutualResponse() { return page; }
                        @Override public int hushMutualStatus() { return 200; }
                    };
                }
                @Override public void cancel(Object call) {}
            };
            testCall(MutualMarkers.class, "sourceForTests", new Class<?>[]{HushMutualSource.class}, source);
            TextView name = new TextView(context);
            name.setText("friend");
            MutualMarkers.bind(name, friend, "friend");
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            boolean changed = !"friend".contentEquals(name.getText());
            if (requests[0] != 0) { assertEquals(1, requests[0]); assertTrue(changed); }
            return changed || requests[0] != 0;
        } finally { resetHook(MutualMarkers.class); MatureAccountsForTests.restore(); }
    }

    private static final class ProbeBlog implements HushPrimaryBlog {
        final String name;
        final boolean primary;
        ProbeBlog(String name, boolean primary) { this.name = name; this.primary = primary; }
        @Override public String hushMutualName() { return name; }
        @Override public String hushMutualUuid() { return name + "-uuid"; }
        @Override public boolean hushMutualPrimary() { return primary; }
    }

    private static final class ProbeAccount implements HushAccountIdentity, HushMatureAccount, HushMutualAccount {
        final Object gate;
        ProbeAccount(Object gate) { this.gate = gate; }
        @Override public String hushAccountId() { return "pause-probe-account"; }
        @Override public int hushAge() { return 25; }
        @Override public boolean hushCanModifySafeMode() { return true; }
        @Override public Object hushAgeVerification() { return gate; }
        @Override public List<?> hushMutualBlogs() { return Collections.singletonList(new ProbeBlog("primary", true)); }
    }

    // Reuse each hook's existing package-private seams without expanding the runtime API.
    private static void testField(Class<?> owner, String name, Object value) {
        try { Field field = owner.getDeclaredField(name); field.setAccessible(true); field.set(null, value); }
        catch (ReflectiveOperationException unavailable) { throw new AssertionError(unavailable); }
    }
    private static void testCall(Class<?> owner, String name, Class<?>[] parameters, Object... arguments) {
        try { Method method = owner.getDeclaredMethod(name, parameters); method.setAccessible(true); method.invoke(null, arguments); }
        catch (ReflectiveOperationException unavailable) { throw new AssertionError(unavailable); }
    }
    private static void resetHook(Class<?> owner) { testCall(owner, "resetForTests", new Class<?>[0]); }

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

    private static Set<BooleanSetting> familySwitches() {
        Set<BooleanSetting> switched = new HashSet<>();
        for (PatchFamily family : PatchFamily.values()) {
            switched.addAll(family.switches);
        }
        return switched;
    }

    /** Adds a line to [wrong] for every probe that didn't answer [changes]. */
    private static void everyProbe(Map<BooleanSetting, List<Probe>> probes, boolean changes, String when,
                                   List<String> wrong) {
        for (Map.Entry<BooleanSetting, List<Probe>> entry : probes.entrySet()) {
            for (int i = 0; i < entry.getValue().size(); i++) {
                if (entry.getValue().get(i).changedTumblr() != changes) {
                    wrong.add(entry.getKey().key + ", probe " + i + ", " + when
                            + (changes ? ": left Tumblr alone" : ": still changed Tumblr"));
                }
            }
        }
    }

    /** Adds a line to [wrong] for every entry probe that didn't answer [changes]. */
    private static void everyEntryProbe(Map<BooleanSetting, Probe> probes, boolean changes, String when,
                                        List<String> wrong) {
        for (Map.Entry<BooleanSetting, Probe> entry : probes.entrySet()) {
            if (entry.getValue().changedTumblr() != changes) {
                wrong.add(entry.getKey().key + ", " + when + (changes ? ": left Tumblr alone" : ": still changed Tumblr"));
            }
        }
    }

    @Test
    @Config(sdk = {30, 37})
    public void everyHookASwitchRunsTakesTumblrsOwnPathWhilePaused() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<BooleanSetting, List<Probe>> probes = probes();
        assertEquals("every family's switch needs a probe here", familySwitches(), probedSwitches(probes));
        Map<BooleanSetting, Probe> entry = entryProbes();
        assertEquals("every switch of the settings entry needs a probe here",
                new HashSet<>(PatchFamily.ENTRY_SWITCHES), entry.keySet());

        // Every hook is asked every time, so one run names every hook that broke the promise.
        List<String> wrong = new ArrayList<>();
        everyProbe(probes, true, "running", wrong);
        everyEntryProbe(entry, true, "running", wrong);

        for (HushTumblrPause.Reason why : new HushTumblrPause.Reason[]{
                HushTumblrPause.Reason.SWITCH, HushTumblrPause.Reason.CRASH_LOOP,
                HushTumblrPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            everyProbe(probes, false, "paused by " + why, wrong);
            everyEntryProbe(entry, false, "paused by " + why, wrong);
        }

        PauseForTests.resume();
        everyProbe(probes, true, "running again", wrong);
        everyEntryProbe(entry, true, "running again", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    /** With its switch off, each hook leaves Tumblr alone too, so a probe can't pass by luck. */
    @Test
    public void everyHookLeavesTumblrAloneWithItsSwitchOff() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(false);
        List<String> wrong = new ArrayList<>();
        everyProbe(probes(), false, "switched off", wrong);
        everyEntryProbe(entryProbes(), false, "switched off", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    @Test
    public void eachHookReadsItsOwnSwitchWhenEveryOtherSwitchIsOff() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(false);
        Map<BooleanSetting, List<Probe>> probes = probes();
        assertEquals("every family's switch needs a probe here", familySwitches(), probedSwitches(probes));
        List<String> wrong = new ArrayList<>();
        for (Map.Entry<BooleanSetting, List<Probe>> entry : probes.entrySet()) {
            entry.getKey().save(true);
            everyProbe(Collections.singletonMap(entry.getKey(), entry.getValue()), true, "its switch alone is on", wrong);
            entry.getKey().save(false);
        }
        assertEquals(Collections.emptyList(), wrong);
    }

    /** Options need their parent enabled; a retention option deliberately restores the native row. */
    @Test
    public void dependentOptionsNeedTheirParentAndRespectPauseAndStartup() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(false);
        PatchFamily.capabilitiesForTests = EnumSet.allOf(PatchFamily.Capability.class);
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        TextSettings.HIDDEN_WORDS.save(TimelineItems.PROBE_WORD);
        TextSettings.ALLOWED_WORDS.save("");
        for (BooleanSetting option : dependentSwitches()) {
            boolean retention = option == Settings.KEEP_TAGGED_REBLOGS || option == Settings.KEEP_REBLOGS_WITH_CONTENT;
            BooleanSetting parent = retention ? Settings.HIDE_REBLOGS : Settings.HIDE_POSTS_WITH_WORDS;
            List<?> page = Collections.singletonList(new TimelineObject(new OptionPost(option), false));
            parent.save(true);
            assertEquals(option.key + " off", retention ? Collections.emptyList() : page, TimelineFilter.filter(page));
            option.save(true);
            assertEquals(option.key + " on", retention ? page : Collections.emptyList(), TimelineFilter.filter(page));
            parent.save(false);
            assertSame(option.key + " cannot enable its parent", page, TimelineFilter.filter(page));
            parent.save(true);
            for (HushTumblrPause.Reason reason : HushTumblrPause.Reason.values()) {
                if (reason == HushTumblrPause.Reason.NONE) continue;
                PauseForTests.pause(reason);
                assertSame(option.key + " paused by " + reason, page, TimelineFilter.filter(page));
                assertTrue(option.key + " saved value", option.savedValue());
                PauseForTests.resume();
            }
            SettingsContextRule.withoutContext(() -> assertSame(page, TimelineFilter.filter(page)));
            SettingsContextRule.beforeThePauseIsDecided(() -> assertSame(page, TimelineFilter.filter(page)));
            assertEquals(option.key + " resumed", retention ? page : Collections.emptyList(), TimelineFilter.filter(page));
            option.save(false);
            parent.save(false);
        }
    }

    private static final class OptionPost implements Timelineable, HushPost {
        final BooleanSetting option;
        OptionPost(BooleanSetting option) { this.option = option; }
        @Override public String getId() { return "pause-option"; }
        @Override public TimelineObjectType getTimelineObjectType() { return TimelineObjectType.POST; }
        @Override public List<?> hushContent() {
            return option == Settings.WORDS_CURRENT_TEXT ? Collections.singletonList(new TextBlock(TimelineItems.PROBE_WORD))
                    : option == Settings.KEEP_REBLOGS_WITH_CONTENT ? Collections.singletonList(new TextBlock("added"))
                    : Collections.emptyList();
        }
        @Override public List<?> hushTrail() {
            return option == Settings.WORDS_REBLOG_TRAIL ? Collections.singletonList((HushTrail) () ->
                    Collections.singletonList(new TextBlock(TimelineItems.PROBE_WORD))) : Collections.emptyList();
        }
        @Override public List<?> hushTags() {
            return option == Settings.WORDS_TAGS ? Collections.singletonList(TimelineItems.PROBE_WORD)
                    : option == Settings.KEEP_TAGGED_REBLOGS ? Collections.singletonList("personal") : Collections.emptyList();
        }
        @Override public String hushSummary() { return option == Settings.WORDS_SUMMARY ? TimelineItems.PROBE_WORD : null; }
        @Override public String hushRebloggedFrom() {
            return option == Settings.KEEP_TAGGED_REBLOGS || option == Settings.KEEP_REBLOGS_WITH_CONTENT ? "100" : null;
        }
    }

    /**
     * Tumblr can call a hook before its application's onCreate hands HushTumblr the context,
     * from a thread it starts early, and again while setContext is still deciding whether this
     * start runs paused. Until both are done, every hook takes Tumblr's own path whatever is
     * saved (see Utils.settingsReady). This JVM's Setting class loaded with a context, so a hook
     * that reads its switch anyway answers on here and is named.
     */
    @Test
    public void untilTheSettingsAreReadyEveryHookTakesTumblrsOwnPath() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<BooleanSetting, List<Probe>> probes = probes();
        assertEquals("every family's switch needs a probe here", familySwitches(), probedSwitches(probes));
        Map<BooleanSetting, Probe> entry = entryProbes();

        List<String> wrong = new ArrayList<>();
        SettingsContextRule.withoutContext(() -> {
            everyProbe(probes, false, "before the context is set", wrong);
            everyEntryProbe(entry, false, "before the context is set", wrong);
        });
        // Safe mode on, as after three crashed starts: the context is set and the pause undecided.
        BaseSettings.SAFE_MODE.save(true);
        try {
            SettingsContextRule.beforeThePauseIsDecided(() -> {
                everyProbe(probes, false, "before the pause is decided", wrong);
                everyEntryProbe(entry, false, "before the pause is decided", wrong);
            });
        } finally {
            BaseSettings.SAFE_MODE.resetToDefault();
        }
        everyProbe(probes, true, "once they're ready", wrong);
        everyEntryProbe(entry, true, "once they're ready", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    @Test
    @Config(sdk = {30, 37})
    public void pausedEverySwitchAnswersOffAndKeepsWhatWasSaved() {
        List<BooleanSetting> switches = settingsSwitches();
        assertFalse("found no switches to check", switches.isEmpty());
        for (BooleanSetting setting : switches) setting.save(true);

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
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
            for (HushTumblrPause.Reason why : HushTumblrPause.Reason.values()) {
                if (why == HushTumblrPause.Reason.NONE) continue;
                PauseForTests.pause(why);
                assertTrue("Debug logging answered off while paused by " + why, BaseSettings.DEBUG.get());
            }
        } finally {
            BaseSettings.DEBUG.resetToDefault();
        }
    }
}
