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
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtumblr.extension.tumblr.settings;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Logger;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.preference.LogBufferManager;

/**
 * Every patch in this source, and what Pause does to it.
 *
 * <p>Pause and safe mode work through the switches: while either is on, every feature switch
 * answers off and the hook behind it takes Tumblr's own path. The hook's code is still there,
 * only its answer changes, and Debug logging keeps its saved value. An edit made when you patched
 * has no switch to ask: a removed manifest permission or a rewritten signer check stays in until
 * you patch again, so each such patch says what of it stays.
 *
 * <p>The settings screen and the diagnostic report read this list, so they can't disagree about
 * it. A family is found in this build by the name of its {@link SettingsStatus} method, the same
 * name the patch uses to switch that method on.
 */
public enum PatchFamily {
    HIDE_ADS(FamilyNames.HIDE_ADS, "hideAds", null, Settings.HIDE_ADS),
    /**
     * Tumblr's tracking flags behind a switch, and analytics switches written into the manifest when
     * patching, which Pause can't reach.
     */
    DISABLE_ANALYTICS(FamilyNames.DISABLE_ANALYTICS, "disableAnalytics",
            "Firebase and Google Analytics collection is turned off", Settings.DISABLE_ANALYTICS),
    HIDE_ADVERTISING_ID(FamilyNames.HIDE_ADVERTISING_ID, "hideAdvertisingId", null, Settings.HIDE_ADVERTISING_ID),
    /** Manifest permissions removed when patching: no switch, so Pause can't reach it. */
    REMOVE_AD_TRACKING_PERMISSIONS(FamilyNames.REMOVE_AD_TRACKING_PERMISSIONS, "removeAdTrackingPermissions",
            "Tumblr's access to the ad ID and Android's ad services is removed"),
    /** Signature spoofing metadata added to the manifest when patching: no switch either. */
    SPOOF_SIGNATURE(FamilyNames.SPOOF_SIGNATURE, "spoofSignature",
            "Tumblr's original signature is added to the app"),
    HIDE_AD_FREE_BANNER(FamilyNames.HIDE_AD_FREE_BANNER, "hideAdFreeBanner", null, Settings.HIDE_AD_FREE_BANNER),
    HIDE_TUMBLR_TV(FamilyNames.HIDE_TUMBLR_TV, "hideTumblrTv", null, Settings.HIDE_TUMBLR_TV),
    HIDE_COMMUNITIES_TAB(FamilyNames.HIDE_COMMUNITIES_TAB, "hideCommunitiesTab", null, Settings.HIDE_COMMUNITIES_TAB),
    HIDE_BLAZE_PROMPTS(FamilyNames.HIDE_BLAZE_PROMPTS, "hideBlazePrompts", null, Settings.HIDE_BLAZE_PROMPTS),
    SKIP_REVIEW_PROMPTS(FamilyNames.SKIP_REVIEW_PROMPTS, "skipReviewPrompts", null, Settings.SKIP_REVIEW_PROMPTS),
    HIDE_BLOG_NOTIFICATION_REMINDERS(FamilyNames.HIDE_BLOG_NOTIFICATION_REMINDERS, "hideBlogNotificationReminders", null,
            Settings.HIDE_BLOG_NOTIFICATION_REMINDERS),
    HIDE_GIFT_MESSAGE_POPUPS(FamilyNames.HIDE_GIFT_MESSAGE_POPUPS, "hideGiftMessagePopups", null, Settings.HIDE_GIFT_MESSAGE_POPUPS),
    LINE_BETWEEN_POSTS(FamilyNames.LINE_BETWEEN_POSTS, "lineBetweenPosts", null, Settings.LINE_BETWEEN_POSTS),
    APP_FONT(FamilyNames.APP_FONT, "appFont", null, Settings.APP_FONT),
    TURN_OFF_SCREENSHOT_SHARING(FamilyNames.TURN_OFF_SCREENSHOT_SHARING, "turnOffScreenshotSharing", null,
            Settings.TURN_OFF_SCREENSHOT_SHARING),
    DISABLE_UPDATE_PROMPTS(FamilyNames.DISABLE_UPDATE_PROMPTS, "disableUpdatePrompts", null, Settings.DISABLE_UPDATE_PROMPTS),
    HIDE_SUGGESTED_BLOGS(FamilyNames.HIDE_SUGGESTED_BLOGS, "hideSuggestedBlogs", null, Settings.HIDE_SUGGESTED_BLOGS),
    HIDE_SUGGESTED_COMMUNITIES(FamilyNames.HIDE_SUGGESTED_COMMUNITIES, "hideSuggestedCommunities", null,
            Settings.HIDE_SUGGESTED_COMMUNITIES),
    HIDE_SUGGESTED_TAGS(FamilyNames.HIDE_SUGGESTED_TAGS, "hideSuggestedTags", null, Settings.HIDE_SUGGESTED_TAGS),
    HIDE_WATCH_IT_ROWS(FamilyNames.HIDE_WATCH_IT_ROWS, "hideWatchItRows", null, Settings.HIDE_WATCH_IT_ROWS),
    HIDE_HASHTAGS(FamilyNames.HIDE_HASHTAGS, "hideHashtags", null, Settings.HIDE_HASHTAGS),
    HIDE_FOLLOW_BUTTON(FamilyNames.HIDE_FOLLOW_BUTTON, "hideFollowButton", null, Settings.HIDE_FOLLOW_BUTTON),
    HIDE_TUMBLRMART(FamilyNames.HIDE_TUMBLRMART, "hideTumblrMart", null, Settings.HIDE_TUMBLRMART),
    HIDE_NOTE_COUNTS(FamilyNames.HIDE_NOTE_COUNTS, "hideNoteCounts", null, Settings.HIDE_NOTE_COUNTS),
    HIDE_LIKE_BUTTON(FamilyNames.HIDE_LIKE_BUTTON, "hideLikeButton", null, Settings.HIDE_LIKE_BUTTON),
    HIDE_REBLOG_BUTTON(FamilyNames.HIDE_REBLOG_BUTTON, "hideReblogButton", null, Settings.HIDE_REBLOG_BUTTON),
    HIDE_COMMENT_BUTTON(FamilyNames.HIDE_COMMENT_BUTTON, "hideCommentButton", null, Settings.HIDE_COMMENT_BUTTON),
    HIDE_SHARE_BUTTON(FamilyNames.HIDE_SHARE_BUTTON, "hideShareButton", null, Settings.HIDE_SHARE_BUTTON),
    HIDE_SAVE_BUTTON(FamilyNames.HIDE_SAVE_BUTTON, "hideSaveButton", null, Settings.HIDE_SAVE_BUTTON),
    /** One hook, with a switch for each tab's badge. */
    HIDE_UNREAD_DOTS(FamilyNames.HIDE_UNREAD_DOTS, "hideUnreadDots", null, Settings.HIDE_DASHBOARD_COUNT,
            Settings.HIDE_COMMUNITIES_COUNT, Settings.HIDE_NOTIFICATIONS_COUNT),
    HIDE_REBLOGS(FamilyNames.HIDE_REBLOGS, "hideReblogs", null, Settings.HIDE_REBLOGS, Settings.KEEP_TAGGED_REBLOGS,
            Settings.KEEP_REBLOGS_WITH_CONTENT),
    HIDE_VIDEO_POSTS(FamilyNames.HIDE_VIDEO_POSTS, "hideVideoPosts", null, Settings.HIDE_VIDEO_POSTS),
    HIDE_PHOTO_POSTS(FamilyNames.HIDE_PHOTO_POSTS, "hidePhotoPosts", null, Settings.HIDE_PHOTO_POSTS),
    HIDE_TEXT_POSTS(FamilyNames.HIDE_TEXT_POSTS, "hideTextPosts", null, Settings.HIDE_TEXT_POSTS),
    HIDE_POSTS_WITH_WORDS(FamilyNames.HIDE_POSTS_WITH_WORDS, "hidePostsWithWords", null, Settings.HIDE_POSTS_WITH_WORDS,
            Settings.WORDS_CURRENT_TEXT, Settings.WORDS_REBLOG_TRAIL, Settings.WORDS_TAGS, Settings.WORDS_SUMMARY),
    HIDE_FILTERED_POSTS(FamilyNames.HIDE_FILTERED_POSTS, "hideFilteredPosts", null, Settings.HIDE_FILTERED_POSTS),
    DARK_BACKGROUND(FamilyNames.DARK_BACKGROUND, "darkBackground", null, Settings.DARK_BACKGROUND, Settings.DARK_BACKGROUND_WALLPAPER),
    HIDE_EXPLORE_TAB(FamilyNames.HIDE_EXPLORE_TAB, "hideExploreTab", null, Settings.HIDE_EXPLORE_TAB),
    HIDE_NOTIFICATIONS_TAB(FamilyNames.HIDE_NOTIFICATIONS_TAB, "hideNotificationsTab", null, Settings.HIDE_NOTIFICATIONS_TAB),
    REORDER_TABS(FamilyNames.REORDER_TABS, "reorderTabs", null, Settings.REORDER_TABS),
    FIX_PUSH_NOTIFICATIONS(FamilyNames.FIX_PUSH_NOTIFICATIONS, "fixPushNotifications", null, Settings.FIX_PUSH_NOTIFICATIONS),
    FILTER_ACTIVITY_NOTIFICATIONS(FamilyNames.FILTER_ACTIVITY_NOTIFICATIONS, "filterActivityNotifications", null,
            Settings.HIDE_NOTIFICATION_LIKES, Settings.HIDE_NOTIFICATION_REBLOGS, Settings.HIDE_NOTIFICATION_REPLIES,
            Settings.HIDE_NOTIFICATION_FOLLOWS, Settings.HIDE_NOTIFICATION_MENTIONS, Settings.HIDE_NOTIFICATION_ASKS,
            Settings.HIDE_NOTIFICATION_BOOPS),
    SHOW_POST_TIMESTAMPS(FamilyNames.SHOW_POST_TIMESTAMPS, "showPostTimestamps", null, Settings.SHOW_POST_TIMESTAMPS),
    VISIBLE_ALT_TEXT(FamilyNames.VISIBLE_ALT_TEXT, "visibleAltText", null, Settings.SHOW_IMAGE_DESCRIPTIONS),
    MUTE_ROOT_POSTS(FamilyNames.MUTE_ROOT_POSTS, "muteRootPosts", null, Settings.MUTE_ROOT_POSTS),
    SHOW_MUTUAL_MARKERS(FamilyNames.SHOW_MUTUAL_MARKERS, "showMutualMarkers", null, Settings.SHOW_MUTUAL_MARKERS),
    REVEAL_ALLOWED_MATURE_CONTENT(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, "revealAllowedMatureContent", null,
            Settings.REVEAL_ALLOWED_MATURE_CONTENT);

    /** The patch's name in Morphe Manager. */
    public final String patchName;

    /** The {@link SettingsStatus} method the patch switches on. */
    final String statusMethod;

    /**
     * What of this patch stays in while HushTumblr is paused, or null when nothing does. One
     * thing, never a plural: alone on the screen it's followed by its patch's name in brackets and
     * "It was set when you patched".
     * It says what stays in, not what the patch is called. The name follows it in brackets, so an
     * item that was the name would read it twice.
     * The English is also a key of {@link L10n}: the screen shows it translated, and the report
     * keeps it in English.
     */
    @Nullable
    public final String staysWhilePaused;

    /** The switches Pause turns off for this patch. Empty when it has none. */
    public final List<BooleanSetting> switches;

    /**
     * The switches of the settings entry itself, which no family owns: every build with this screen
     * carries them. Today that's the release check. Pause turns them off like a family's switches,
     * so the screen draws them above the Pause row with the rest.
     */
    static final List<BooleanSetting> ENTRY_SWITCHES = Collections.singletonList(Settings.CHECK_FOR_RELEASES);


    /** The families a test says this build carries, instead of asking {@link SettingsStatus}. */
    @Nullable
    static volatile Set<PatchFamily> inBuildForTests;

    /**
     * Lets a test substitute patch-time facts for this build. Cleared by setting it back to null.
     */
    @Nullable
    static volatile Map<PatchFamily, String> staysWhilePausedForTests;

    /** Overrides target facts for partial-build tests. Null uses the flags injected when patching. */
    @Nullable
    static volatile Set<Capability> capabilitiesForTests;

    /** The families the Feed page holds. The page and its home row both read this. */
    static final Set<PatchFamily> FEED_PAGE = Collections.unmodifiableSet(EnumSet.of(HIDE_FILTERED_POSTS,
            HIDE_POSTS_WITH_WORDS, HIDE_TEXT_POSTS, HIDE_PHOTO_POSTS, HIDE_VIDEO_POSTS, HIDE_REBLOGS, HIDE_WATCH_IT_ROWS,
            HIDE_SUGGESTED_TAGS, HIDE_SUGGESTED_COMMUNITIES, HIDE_SUGGESTED_BLOGS, HIDE_AD_FREE_BANNER, HIDE_ADS,
            MUTE_ROOT_POSTS));

    /** The families the Interface page holds. The page and its home row both read this. */
    static final Set<PatchFamily> INTERFACE_PAGE = Collections.unmodifiableSet(EnumSet.of(REORDER_TABS,
            HIDE_NOTIFICATIONS_TAB, HIDE_EXPLORE_TAB, DARK_BACKGROUND, HIDE_UNREAD_DOTS, HIDE_TUMBLRMART,
            TURN_OFF_SCREENSHOT_SHARING, SKIP_REVIEW_PROMPTS, HIDE_BLOG_NOTIFICATION_REMINDERS,
            HIDE_GIFT_MESSAGE_POPUPS, HIDE_BLAZE_PROMPTS, HIDE_COMMUNITIES_TAB, HIDE_TUMBLR_TV, LINE_BETWEEN_POSTS, APP_FONT));

    /** The families the Posts page holds. The page and its home row both read this. */
    static final Set<PatchFamily> POSTS_PAGE = Collections.unmodifiableSet(EnumSet.of(HIDE_SAVE_BUTTON,
            HIDE_SHARE_BUTTON, HIDE_COMMENT_BUTTON, HIDE_REBLOG_BUTTON, HIDE_LIKE_BUTTON, HIDE_NOTE_COUNTS, HIDE_FOLLOW_BUTTON,
            HIDE_HASHTAGS, SHOW_POST_TIMESTAMPS, VISIBLE_ALT_TEXT, REVEAL_ALLOWED_MATURE_CONTENT, SHOW_MUTUAL_MARKERS));

    /** The families the Privacy page holds. The page and its home row both read this. */
    static final Set<PatchFamily> PRIVACY_PAGE = Collections.unmodifiableSet(EnumSet.of(DISABLE_ANALYTICS,
            HIDE_ADVERTISING_ID, REMOVE_AD_TRACKING_PERMISSIONS, SPOOF_SIGNATURE));

    /** Each independent hook, its owning family and the flag set only after it was inserted. */
    public enum Capability {
        PRIMARY_BLOG_MUTUALS(SHOW_MUTUAL_MARKERS, "primaryBlogMutuals", "Show mutual markers"),
        TIMELINE_ADS(HIDE_ADS, "timelineAds", "Hide ads"),
        ROOT_POST_MUTES(MUTE_ROOT_POSTS, "rootPostMutes", "Mute posts locally"),
        ACCOUNT_SAFE_MATURE_REVEAL(REVEAL_ALLOWED_MATURE_CONTENT, "accountSafeMatureReveal", "Reveal allowed mature content"),
        PHOTO_ALT_TEXT_CAPTIONS(VISIBLE_ALT_TEXT, "photoAltTextCaptions", "photo image descriptions"),
        GALLERY_ALT_TEXT_CAPTIONS(VISIBLE_ALT_TEXT, "galleryAltTextCaptions", "gallery image descriptions"),
        NATIVE_POST_TIMESTAMPS(SHOW_POST_TIMESTAMPS, "nativePostTimestamps", "Show post timestamps"),
        ACTIVITY_NOTIFICATION_LIST(FILTER_ACTIVITY_NOTIFICATIONS, "activityNotificationList", "Filter activity notifications"),
        PAID_POST_HEADER(HIDE_ADS, "paidPostHeader", "Hide ads"),
        ADVERTISING_ID(HIDE_ADVERTISING_ID, "advertisingId", "Hide advertising ID"),
        ANALYTICS_FLAGS(DISABLE_ANALYTICS, "analyticsFlags", "Disable analytics"),
        AD_FREE_BANNER_FLAGS(HIDE_AD_FREE_BANNER, "adFreeBannerFlags", "Hide the ad-free banner"),
        TUMBLR_TV_FLAGS(HIDE_TUMBLR_TV, "tumblrTvFlags", "Hide Tumblr TV"),
        COMMUNITIES_TAB_FLAGS(HIDE_COMMUNITIES_TAB, "communitiesTabFlags", "Hide the Communities tab"),
        COMMUNITIES_TAB_BUTTON(HIDE_COMMUNITIES_TAB, "communitiesTabButton", "Hide the Communities tab"),
        BLAZE_PROMPT_FLAGS(HIDE_BLAZE_PROMPTS, "blazePromptFlags", "Hide Blaze prompts"),
        REVIEW_PROMPT(SKIP_REVIEW_PROMPTS, "reviewPrompt", "Skip review prompts"),
        BLOG_NOTIFICATION_REMINDER(HIDE_BLOG_NOTIFICATION_REMINDERS, "blogNotificationReminder", "Blog notification reminder"),
        GIFT_MESSAGE_POPUP(HIDE_GIFT_MESSAGE_POPUPS, "giftMessagePopup", "Gift purchase popup"),
        POST_LINE(LINE_BETWEEN_POSTS, "postLine", "Line between posts"),
        FONT_CHOICE(APP_FONT, "fontChoice", "App font"),
        SCREENSHOT_SHARING_FLAGS(TURN_OFF_SCREENSHOT_SHARING, "screenshotSharingFlags", "Turn off screenshot sharing"),
        UPDATE_PROMPT_FLAGS(DISABLE_UPDATE_PROMPTS, "updatePromptFlags", "Disable update prompts"),
        SUGGESTED_BLOG_CARDS(HIDE_SUGGESTED_BLOGS, "suggestedBlogCards", "Hide suggested blogs"),
        SUGGESTED_COMMUNITY_CARDS(HIDE_SUGGESTED_COMMUNITIES, "suggestedCommunityCards",
                "Hide suggested communities"),
        SUGGESTED_TAG_CARDS(HIDE_SUGGESTED_TAGS, "suggestedTagCards", "Hide suggested tags"),
        WATCH_IT_ROWS(HIDE_WATCH_IT_ROWS, "watchItRows", "Hide Watch it rows"),
        POST_TAGS(HIDE_HASHTAGS, "postTags", "Hide hashtags"),
        FOLLOW_BUTTON(HIDE_FOLLOW_BUTTON, "followButton", "Hide the Follow button"),
        // Two hooks, so the coverage line names each part rather than the patch.
        PREMIUM_DIAMOND(HIDE_TUMBLRMART, "premiumDiamond", "the Premium diamond"),
        TUMBLRMART_BUTTONS(HIDE_TUMBLRMART, "tumblrMartButtons", "TumblrMart buttons"),
        NOTE_COUNTS(HIDE_NOTE_COUNTS, "noteCounts", "Hide note counts"),
        LIKE_BUTTON(HIDE_LIKE_BUTTON, "likeButton", "Hide the like button"),
        REBLOG_BUTTON(HIDE_REBLOG_BUTTON, "reblogButton", "Hide the reblog button"),
        COMMENT_BUTTON(HIDE_COMMENT_BUTTON, "commentButton", "Hide the comment button"),
        SHARE_BUTTON(HIDE_SHARE_BUTTON, "shareButton", "Hide the share button"),
        SAVE_BUTTON(HIDE_SAVE_BUTTON, "saveButton", "Hide the Save button"),
        UNREAD_DOTS(HIDE_UNREAD_DOTS, "unreadDots", "Hide unread dots"),
        REBLOG_POSTS(HIDE_REBLOGS, "reblogPosts", "Hide reblogs"),
        VIDEO_POSTS(HIDE_VIDEO_POSTS, "videoPosts", "Hide video posts"),
        PHOTO_POSTS(HIDE_PHOTO_POSTS, "photoPosts", "Hide photo posts"),
        TEXT_POSTS(HIDE_TEXT_POSTS, "textPosts", "Hide text posts"),
        POST_WORDS(HIDE_POSTS_WITH_WORDS, "postWords", "Hide posts with these words"),
        FILTERED_POSTS(HIDE_FILTERED_POSTS, "filteredPosts", "Hide filtered posts"),
        THEME_BACKGROUND(DARK_BACKGROUND, "themeBackground", "Dark background color"),
        EXPLORE_TAB(HIDE_EXPLORE_TAB, "exploreTab", "Hide the Explore tab"),
        NOTIFICATIONS_TAB(HIDE_NOTIFICATIONS_TAB, "notificationsTab", "Hide the Notifications tab"),
        TAB_ORDER(REORDER_TABS, "tabOrder", "Reorder the bottom bar"),
        FIREBASE_CERTIFICATE(FIX_PUSH_NOTIFICATIONS, "firebaseCertificate", "Fix push notifications");

        public final PatchFamily family;
        final String statusMethod;
        public final String label;

        Capability(PatchFamily family, String statusMethod, String label) {
            this.family = family;
            this.statusMethod = statusMethod;
            this.label = label;
        }

        /** A patch-time fact, independent of whether its switch is on or the app is paused. */
        public boolean installed() {
            Set<Capability> forced = capabilitiesForTests;
            if (forced != null) return forced.contains(this);
            Set<PatchFamily> forcedBuild = inBuildForTests;
            // Existing whole-family tests represent complete builds unless they specify targets.
            if (forcedBuild != null) return forcedBuild.contains(family);
            try {
                return Boolean.TRUE.equals(SettingsStatus.class.getMethod(statusMethod).invoke(null));
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Logger.printException(() -> "Could not ask whether " + label + " is covered in this build", failure);
                return false;
            }
        }
    }

    /** All independently tracked targets this family is expected to cover, in declaration order. */
    public Set<Capability> expectedCapabilities() {
        Set<Capability> expected = EnumSet.noneOf(Capability.class);
        for (Capability capability : Capability.values()) {
            if (capability.family == this) expected.add(capability);
        }
        return Collections.unmodifiableSet(expected);
    }

    /** An immutable snapshot of the targets whose hooks were inserted into this build. */
    public Set<Capability> installedCapabilities() {
        Set<Capability> installed = EnumSet.noneOf(Capability.class);
        for (Capability capability : expectedCapabilities()) {
            if (capability.installed()) installed.add(capability);
        }
        return Collections.unmodifiableSet(installed);
    }

    /** Keeps the usual description for complete builds and names precise coverage for partial ones. */
    String coverageSummary(String completeSummary) {
        List<String> covered = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        for (Capability capability : expectedCapabilities()) {
            (capability.installed() ? covered : missing).add(L10n.t(capability.label));
        }
        if (missing.isEmpty()) return completeSummary;
        if (covered.isEmpty()) return L10n.f("This build doesn't include the parts that handle %1$s.", L10n.join(missing));
        return L10n.f("This build handles %1$s. It's missing the parts for %2$s.", L10n.join(covered), L10n.join(missing));
    }

    private String coverageReportLine() {
        List<String> covered = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        for (Capability capability : expectedCapabilities()) {
            (capability.installed() ? covered : missing).add(capability.label);
        }
        String line = patchName + " coverage: " + (covered.isEmpty() ? "none" : String.join(", ", covered));
        return missing.isEmpty() ? line : line + "; missing: " + String.join(", ", missing);
    }

    @Nullable
    private String effectiveStaysWhilePaused() {
        Map<PatchFamily, String> forced = staysWhilePausedForTests;
        if (forced != null && forced.containsKey(this)) return forced.get(this);
        return staysWhilePaused;
    }

    PatchFamily(String patchName, String statusMethod, @Nullable String staysWhilePaused,
                BooleanSetting... switches) {
        this.patchName = patchName;
        this.statusMethod = statusMethod;
        this.staysWhilePaused = staysWhilePaused;
        this.switches = Collections.unmodifiableList(Arrays.asList(switches));
    }

    /** Whether this patch was selected for this build. */
    public boolean inBuild() {
        Set<PatchFamily> forced = inBuildForTests;
        if (forced != null) return forced.contains(this);
        try {
            return Boolean.TRUE.equals(SettingsStatus.class.getMethod(statusMethod).invoke(null));
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Could not ask whether " + patchName + " is in this build", failure);
            return false;
        }
    }

    /** The families this build carries, in declaration order. */
    public static Set<PatchFamily> inThisBuild() {
        Set<PatchFamily> found = EnumSet.noneOf(PatchFamily.class);
        for (PatchFamily family : values()) {
            if (family.inBuild()) found.add(family);
        }
        return found;
    }

    /**
     * What of these families stays in while HushTumblr is paused, as a sentence in the phone's
     * language, or null when a pause turns every one of them off. The list leads the sentence, so
     * its first letter is raised the way that language does it.
     *
     * <p>Each item is followed by its patch's name in brackets, the name Morphe Manager lists it
     * under, which stays English there, since nothing in the item's own words says which patch in
     * Manager it came from.
     */
    @Nullable
    static String staysWhilePausedSummary(Set<PatchFamily> inBuild) {
        List<String> parts = new ArrayList<>();
        for (PatchFamily family : values()) {
            String stays = family.effectiveStaysWhilePaused();
            if (inBuild.contains(family) && stays != null) {
                parts.add(L10n.t(stays) + " (" + L10n.isolate(family.patchName) + ")");
            }
        }
        if (parts.isEmpty()) return null;
        return L10n.capitalize(L10n.quantity(parts.size(),
                "%1$s. It was set when you patched, so Pause can't turn it off. To rule it out, patch again "
                        + "and leave out that patch.",
                "%1$s. They were set when you patched, so Pause can't turn them off. To rule one out, patch "
                        + "again and leave out the patch in brackets after it.",
                L10n.join(parts)));
    }

    /**
     * One line per family in this build, saying whether a switch runs it, what the switch is set
     * to and what stays in while paused, then the families this build doesn't carry.
     */
    static List<String> reportLines(Set<PatchFamily> inBuild, boolean paused) {
        List<String> lines = new ArrayList<>();
        List<String> absent = new ArrayList<>();
        for (PatchFamily family : values()) {
            if (inBuild.contains(family)) lines.add(family.reportLine(paused));
            else absent.add(family.patchName);
        }
        if (!absent.isEmpty()) lines.add("not in this build: " + String.join(", ", absent));
        for (PatchFamily family : values()) {
            if (inBuild.contains(family) && !family.expectedCapabilities().isEmpty()) {
                lines.add(family.coverageReportLine());
            }
        }
        return lines;
    }


    /**
     * "on", "disabled by its switch" or "disabled while paused", then the saved switches. A
     * Independent switches can each enable their family. Dependent options keep their saved
     * values in the report but cannot enable a family whose master switch is off.
     */
    private String reportLine(boolean paused) {
        StringBuilder line = new StringBuilder(patchName).append(": ");
        if (switches.isEmpty()) {
            return line.append("no switch, stays in while paused: ").append(effectiveStaysWhilePaused()).toString();
        }
        boolean anyOn = false;
        if (this == HIDE_REBLOGS) anyOn = Settings.HIDE_REBLOGS.savedValue();
        else if (this == HIDE_POSTS_WITH_WORDS) anyOn = Settings.HIDE_POSTS_WITH_WORDS.savedValue();
        else for (BooleanSetting setting : switches) anyOn |= setting.savedValue();
        line.append(paused ? "disabled while paused (saved " : anyOn ? "on (" : "disabled by its switch (");
        for (int i = 0; i < switches.size(); i++) {
            if (i > 0) line.append(", ");
            BooleanSetting setting = switches.get(i);
            line.append(setting.key).append(setting.savedValue() ? "=on" : "=off");
        }
        line.append(')');
        String stays = effectiveStaysWhilePaused();
        if (stays != null) line.append("; stays in while paused: ").append(stays);
        return line.toString();
    }

    /**
     * Registers the [PATCHES] report section, and tells Hook status which families no pause
     * reaches, so a paused export marks only the ones a switch runs. Registering twice keeps one.
     */
    public static void registerDiagnostics() {
        LogBufferManager.registerReportSection(REPORT);
        LogBufferManager.registerReportSection(PushReadiness.REPORT);
        for (PatchFamily family : values()) {
            if (family.switches.isEmpty()) HookStatus.runsWhilePaused(family.patchName);
        }
    }

    /** The [PATCHES] section of the diagnostic report. */
    static final LogBufferManager.ReportSection REPORT = new LogBufferManager.ReportSection() {
        @Override
        public String title() {
            return "PATCHES";
        }

        @Override
        public List<String> lines() {
            return reportLines(inThisBuild(), HushTumblrPause.isPaused());
        }
    };
}
