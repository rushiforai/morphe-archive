/*
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
package app.hushpinterest.extension.pinterest.settings;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushpinterest.extension.pinterest.ads.HookTargets;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * Every patch in this source, and what Pause does to it.
 *
 * <p>Pause and safe mode work through the switches: while either is on, every feature switch
 * answers off and the hook behind it takes Pinterest's own path. The hook's code is still there,
 * only its answer changes, and Debug logging keeps its saved value. An edit made when you patched
 * has no switch to ask: a removed manifest permission or a rewritten signer check stays in until
 * you patch again, so each such patch says what of it stays.
 *
 * <p>The settings screen and the diagnostic report read this list, so they can't disagree about
 * it. A family is found in this build by the name of its {@link SettingsStatus} method, the same
 * name the patch uses to switch that method on.
 */
public enum PatchFamily {
    HIDE_ADS(FamilyNames.HIDE_ADS, "hideAds", null,
            Settings.HIDE_ADS),
    HIDE_AI_PINS(FamilyNames.HIDE_AI_PINS, "hideAiPins", null,
            Settings.HIDE_AI_PINS, Settings.HIDE_AI_SELF_DESCRIBED),
    HIDE_SHOPPING(FamilyNames.HIDE_SHOPPING, "hideShopping", null, Settings.HIDE_SHOPPING),
    FILTER_FEED(FamilyNames.FILTER_FEED, "filterFeed", null, Settings.HIDE_VIDEO_PINS, Settings.HIDE_SAVED_PINS),
    KEEP_HOME_FEED(FamilyNames.KEEP_HOME_FEED, "keepHomeFeed", null, Settings.KEEP_HOME_FEED),
    DISABLE_ANALYTICS(FamilyNames.DISABLE_ANALYTICS, "disableAnalytics",
            "Firebase and Google Analytics collection is turned off", Settings.DISABLE_ANALYTICS),
    STRIP_LINK_TRACKING(FamilyNames.STRIP_LINK_TRACKING, "stripLinkTracking", null, Settings.STRIP_LINK_TRACKING,
            Settings.PLAIN_PIN_LINKS),
    HIDE_ADVERTISING_ID(FamilyNames.HIDE_ADVERTISING_ID, "hideAdvertisingId", null, Settings.HIDE_ADVERTISING_ID),
    /** Manifest permissions removed when patching: no switch, so Pause can't reach it. */
    REMOVE_AD_TRACKING_PERMISSIONS(FamilyNames.REMOVE_AD_TRACKING_PERMISSIONS, "removeAdTrackingPermissions",
            "Pinterest's access to the ad ID and Android's ad services is removed"),
    /** Signature spoofing metadata added to the manifest when patching: no switch either. */
    SPOOF_SIGNATURE(FamilyNames.SPOOF_SIGNATURE, "spoofSignature",
            "Pinterest's original signature is added to the app"),
    /** Google sign-in and push sent to microG-RE when patching: no switch, nothing to pause. */
    GMS_CORE_SUPPORT(FamilyNames.GMS_CORE_SUPPORT, "gmsCoreSupport",
            "Google sign-in and push notifications go through microG-RE"),
    DOWNLOAD_PINS(FamilyNames.DOWNLOAD_PINS, "downloadPins", null, Settings.DOWNLOAD_PINS, Settings.SAVE_IN_PINTEREST_FOLDER,
            Settings.DOWNLOAD_UNMETERED_ONLY, Settings.DOWNLOAD_NO_ROAMING, Settings.COPY_IMAGE, Settings.SHARE_IMAGE,
            Settings.SAVE_DOWNLOADED_PINS, Settings.DOWNLOAD_SAVED_PINS),
    DOWNLOAD_BOARD(FamilyNames.DOWNLOAD_BOARD, "downloadBoard", null, Settings.DOWNLOAD_BOARD),
    LONG_PRESS_DOWNLOAD(FamilyNames.LONG_PRESS_DOWNLOAD, "longPressDownload", null, Settings.LONG_PRESS_DOWNLOAD,
            Settings.LONG_PRESS_HIDE_SAVE, Settings.LONG_PRESS_HIDE_SEND, Settings.LONG_PRESS_HIDE_SEARCH),
    EXTERNAL_BROWSER(FamilyNames.EXTERNAL_BROWSER, "externalBrowser", null, Settings.EXTERNAL_BROWSER),
    SYSTEM_SHARE(FamilyNames.SYSTEM_SHARE, "systemShare", null, Settings.SYSTEM_SHARE),
    HIDE_SCREENSHOT_SHARE(FamilyNames.HIDE_SCREENSHOT_SHARE, "hideScreenshotShare", null, Settings.HIDE_SCREENSHOT_SHARE),
    HIDE_ASSISTANT(FamilyNames.HIDE_ASSISTANT, "hideAssistant", null, Settings.HIDE_ASSISTANT),
    HIDE_SEARCH_HISTORY(FamilyNames.HIDE_SEARCH_HISTORY, "hideSearchHistory", null, Settings.HIDE_SEARCH_HISTORY),
    HIDE_NAVIGATION_BUTTONS(FamilyNames.HIDE_NAVIGATION_BUTTONS, "hideNavigationButtons", null,
            Settings.HIDE_NAV_CREATE, Settings.HIDE_NAV_NOTIFICATIONS, Settings.HIDE_NAV_SEARCH),
    HIDE_HEADER_BUTTONS(FamilyNames.HIDE_HEADER_BUTTONS, "hideHeaderButtons", null, Settings.HIDE_HEADER_BUTTONS),
    AMOLED_BLACK(FamilyNames.AMOLED_BLACK, "amoledBlack", null, Settings.BLACK_BOTTOM_BAR,
            Settings.BLACK_COMMENTS, Settings.BLACK_PIN_MENU),
    HIDE_CLOSEUP_BUTTONS(FamilyNames.HIDE_CLOSEUP_BUTTONS, "hideCloseupButtons", null,
            Settings.HIDE_CLOSEUP_BACK, Settings.HIDE_CLOSEUP_LENS, Settings.HIDE_CLOSEUP_SEARCH_LABEL),
    HIDE_PIN_MENU_ITEMS(FamilyNames.HIDE_PIN_MENU_ITEMS, "hidePinMenuItems", null,
            Settings.HIDE_PIN_MENU_COLLAGE, Settings.HIDE_PIN_MENU_VISUAL_SEARCH, Settings.HIDE_PIN_MENU_PIN_BOOST),
    HIDE_COMMENTS(FamilyNames.HIDE_COMMENTS, "hideComments", null, Settings.HIDE_COMMENTS, Settings.HIDE_SUGGESTED_REPLIES),
    HIDE_TOPIC_SUGGESTIONS(FamilyNames.HIDE_TOPIC_SUGGESTIONS, "hideTopicSuggestions", null, Settings.HIDE_TOPIC_SUGGESTIONS),
    QUIET_EMAIL_REMINDER(FamilyNames.QUIET_EMAIL_REMINDER, "quietEmailReminder", null, Settings.QUIET_EMAIL_REMINDER),
    HIDE_SURVEY_PROMPTS(FamilyNames.HIDE_SURVEY_PROMPTS, "hideSurveyPrompts", null, Settings.HIDE_SURVEY_PROMPTS),
    HIDE_SAVE_TOASTS(FamilyNames.HIDE_SAVE_TOASTS, "hideSaveToasts", null, Settings.HIDE_SAVE_TOASTS),
    ORIGINAL_IMAGES(FamilyNames.ORIGINAL_IMAGES, "originalImages", null, Settings.ORIGINAL_IMAGES),
    SHOW_POSTED_DATE(FamilyNames.SHOW_POSTED_DATE, "showPostedDate", null, Settings.SHOW_POSTED_DATE),
    DISABLE_UPDATE_NAG(FamilyNames.DISABLE_UPDATE_NAG, "disableUpdateNag", null, Settings.DISABLE_UPDATE_NAG),
    FIX_PUSH_NOTIFICATIONS(FamilyNames.FIX_PUSH_NOTIFICATIONS, "fixPushNotifications", null, Settings.FIX_PUSH_NOTIFICATIONS);

    /** The patch's name in Morphe Manager. */
    public final String patchName;

    /** The {@link SettingsStatus} method the patch switches on. */
    final String statusMethod;

    /**
     * What of this patch stays in while HushPinterest is paused, or null when nothing does. One
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

    /** The families whose switches the Feed page holds. The page and its home row both read this. */
    static final Set<PatchFamily> FEED_PAGE = Collections.unmodifiableSet(EnumSet.of(HIDE_ADS, HIDE_AI_PINS, HIDE_SHOPPING,
            FILTER_FEED, KEEP_HOME_FEED));
    static final Set<PatchFamily> PRIVACY_PAGE = Collections.unmodifiableSet(EnumSet.of(DISABLE_ANALYTICS, STRIP_LINK_TRACKING,
            HIDE_ADVERTISING_ID, REMOVE_AD_TRACKING_PERMISSIONS, SPOOF_SIGNATURE, GMS_CORE_SUPPORT));
    static final Set<PatchFamily> ACTIONS_PAGE = Collections.unmodifiableSet(EnumSet.of(DOWNLOAD_PINS, DOWNLOAD_BOARD,
            LONG_PRESS_DOWNLOAD, SYSTEM_SHARE));
    static final Set<PatchFamily> INTERFACE_PAGE = Collections.unmodifiableSet(EnumSet.of(HIDE_SCREENSHOT_SHARE,
            HIDE_ASSISTANT, HIDE_SEARCH_HISTORY, HIDE_NAVIGATION_BUTTONS, HIDE_HEADER_BUTTONS, AMOLED_BLACK, HIDE_CLOSEUP_BUTTONS,
            HIDE_PIN_MENU_ITEMS, HIDE_COMMENTS, HIDE_TOPIC_SUGGESTIONS, QUIET_EMAIL_REMINDER, HIDE_SURVEY_PROMPTS,
            HIDE_SAVE_TOASTS, ORIGINAL_IMAGES, SHOW_POSTED_DATE));

    /** Each independent hook, its owning family and the flag set only after it was inserted. */
    public enum Capability {
        FEED_ADS(HIDE_ADS, "feedAds", "promoted pins in lists"),
        AD_VIEWS(HIDE_ADS, "adViews", "ad-only views"),
        GOOGLE_ADS(HIDE_ADS, "googleAds", "Google ad SDK start"),
        FEED_AI_PINS(HIDE_AI_PINS, "feedAiPins", "AI-labeled pins in lists"),
        FEED_SHOPPING(HIDE_SHOPPING, "feedShopping", "Hide shopping and product pins"),
        FEED_VIDEO_PINS(FILTER_FEED, "feedVideoPins", "Hide video pins"),
        FEED_MUTED_WORDS(FILTER_FEED, "feedMutedWords", "Muted words"),
        FEED_SAVED_PINS(FILTER_FEED, "feedSavedPins", "Hide pins you've already saved"),
        HOME_FEED(KEEP_HOME_FEED, "homeFeed", "Keep Home feed"),
        ANALYTICS_TASKS(DISABLE_ANALYTICS, "analyticsTasks", "Analytics launch tasks"),
        ANALYTICS_UPLOADS(DISABLE_ANALYTICS, "analyticsUploads", "Analytics uploads"),
        LINK_TRACKING(STRIP_LINK_TRACKING, "linkTracking", "Strip link tracking"),
        PLAIN_PIN_LINKS(STRIP_LINK_TRACKING, "plainPinLinks", "Plain pin links"),
        ADVERTISING_ID(HIDE_ADVERTISING_ID, "advertisingId", "Hide advertising ID"),
        BROWSER_ID(HIDE_ADVERTISING_ID, "browserId", "Block Store browser ID"),
        PIN_DOWNLOADS(DOWNLOAD_PINS, "pinDownloads", "Download pins"),
        COPY_IMAGE(DOWNLOAD_PINS, "copyImage", "Copy image"),
        SHARE_IMAGE(DOWNLOAD_PINS, "shareImage", "Share image"),
        SAVE_AND_DOWNLOAD(DOWNLOAD_PINS, "saveAndDownload", "Save and download"),
        BOARD_MENU(DOWNLOAD_BOARD, "boardMenu", "board menus"),
        BOARD_PINS(DOWNLOAD_BOARD, "boardPins", "loaded board pins"),
        LONG_PRESS_MENU(LONG_PRESS_DOWNLOAD, "longPressMenu", "Long-press download"),
        LONG_PRESS_CHOICES(LONG_PRESS_DOWNLOAD, "longPressChoices", "hiding Pinterest's long-press buttons"),
        VISIT_LINKS(EXTERNAL_BROWSER, "visitLinks", "Open links in your browser"),
        PIN_SHARE(SYSTEM_SHARE, "pinShare", "System share sheet"),
        SCREENSHOT_SHARE(HIDE_SCREENSHOT_SHARE, "screenshotShare", "No screenshot share menu"),
        ASSISTANT_ENTRIES(HIDE_ASSISTANT, "assistantEntries", "Hide Assistant"),
        SEARCH_HISTORY(HIDE_SEARCH_HISTORY, "searchHistory", "Hide search history"),
        RECENT_SEARCH_ROWS(HIDE_SEARCH_HISTORY, "recentSearchRows", "Recent searches under the search bar"),
        RECENT_SEARCH_HEADING(HIDE_SEARCH_HISTORY, "recentSearchHeading", "Recent searches heading on the search page"),
        NAVIGATION_BUTTONS(HIDE_NAVIGATION_BUTTONS, "navigationButtons", "Hide navigation buttons"),
        HEADER_BUTTONS(HIDE_HEADER_BUTTONS, "headerButtons", "Hide header buttons"),
        BOTTOM_BAR(AMOLED_BLACK, "blackBottomBar", "Black bottom bar"),
        BLACK_COMMENTS(AMOLED_BLACK, "blackComments", "Black comments"),
        BLACK_PIN_MENU(AMOLED_BLACK, "blackPinMenu", "Black pin menu"),
        CLOSEUP_BUTTONS(HIDE_CLOSEUP_BUTTONS, "closeupButtons", "Hide closeup buttons"),
        CLOSEUP_SEARCH_LABEL(HIDE_CLOSEUP_BUTTONS, "closeupSearchLabel", "Hide Search image label"),
        PIN_MENU_ITEMS(HIDE_PIN_MENU_ITEMS, "pinMenuItems", "Filter pin menu"),
        COMMENTS(HIDE_COMMENTS, "comments", "Hide comments"),
        SUGGESTED_REPLIES(HIDE_COMMENTS, "suggestedReplies", "Hide suggested replies"),
        TOPIC_SUGGESTIONS(HIDE_TOPIC_SUGGESTIONS, "topicSuggestions", "Hide topic suggestions"),
        EMAIL_REMINDER(QUIET_EMAIL_REMINDER, "emailReminder", "Quiet email reminders"),
        SURVEY_PROMPTS(HIDE_SURVEY_PROMPTS, "surveyPrompts", "Hide survey prompts"),
        SAVE_TOASTS(HIDE_SAVE_TOASTS, "saveToasts", "Hide save toasts"),
        IMAGE_CHOOSER(ORIGINAL_IMAGES, "imageChooser", "collage images"),
        CLOSEUP_IMAGE(ORIGINAL_IMAGES, "closeupImage", "pin closeups"),
        POSTED_DATE(SHOW_POSTED_DATE, "postedDate", "Show posted date"),
        UPDATE_NAG(DISABLE_UPDATE_NAG, "updateNag", "Disable update nag"),
        SIGN_IN_FAILURE(GMS_CORE_SUPPORT, "signInFailure", "Google sign-in failure message"),
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

    /**
     * Keeps the usual description for complete builds and names precise coverage for partial ones.
     * A capability whose separate targets the patch recorded ({@link HookTargets}) counts as
     * complete only when every one of them went in whole; otherwise each target is named in its own
     * right, so one list holder out of three never reads as the whole feed.
     */
    String coverageSummary(String completeSummary) {
        List<String> covered = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        boolean complete = true;
        for (Capability capability : expectedCapabilities()) {
            if (!capability.installed()) {
                complete = false;
                missing.add(L10n.t(capability.label));
                continue;
            }
            List<HookTargets.Target> targets = HookTargets.of(capability);
            if (HookTargets.allComplete(targets)) {
                covered.add(L10n.t(capability.label));
                continue;
            }
            complete = false;
            for (HookTargets.Target target : targets) {
                (target.hooked == 0 ? missing : covered).add(target.summaryLabel());
            }
        }
        if (complete) return completeSummary;
        if (covered.isEmpty()) return L10n.f("This build doesn't include the parts that handle %1$s.", L10n.join(missing));
        return L10n.f("This build handles %1$s. It's missing the parts for %2$s.", L10n.join(covered), L10n.join(missing));
    }

    private String coverageReportLine() {
        List<String> covered = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        for (Capability capability : expectedCapabilities()) {
            if (!capability.installed()) missing.add(capability.label);
            else covered.add(HookTargets.allComplete(HookTargets.of(capability)) ? capability.label : capability.label + " (partial)");
        }
        String line = patchName + " coverage: " + (covered.isEmpty() ? "none" : String.join(", ", covered));
        return missing.isEmpty() ? line : line + "; missing: " + String.join(", ", missing);
    }

    /**
     * One line per installed capability whose targets the patch records, naming each target and
     * how much of it went in, then what that capability has no hook for at all.
     */
    private List<String> targetReportLines() {
        List<String> lines = new ArrayList<>();
        for (Capability capability : expectedCapabilities()) {
            if (!HookTargets.tracks(capability) || !capability.installed()) continue;
            List<HookTargets.Target> targets = HookTargets.of(capability);
            List<String> parts = new ArrayList<>();
            for (HookTargets.Target target : targets) parts.add(target.reportText());
            String line = patchName + " targets for " + capability.label + ": "
                    + (parts.isEmpty() ? "not recorded" : String.join(", ", parts));
            List<String> uncovered = HookTargets.notCovered(capability);
            lines.add(uncovered.isEmpty() ? line : line + "; no hook of its own: " + String.join(", ", uncovered));
        }
        return lines;
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
     * What of these families stays in while HushPinterest is paused, as a sentence in the phone's
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
                        + "again and leave out the patch in parentheses after it.",
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
                lines.addAll(family.targetReportLines());
            }
        }
        return lines;
    }


    /**
     * "on", "disabled by its switch" or "disabled while paused", then the saved switches. A
     * family with two switches is on while either is: each hides its own kind of post.
     */
    private String reportLine(boolean paused) {
        StringBuilder line = new StringBuilder(patchName).append(": ");
        if (switches.isEmpty()) {
            return line.append("no switch, stays in while paused: ").append(effectiveStaysWhilePaused()).toString();
        }
        boolean anyOn = false;
        for (BooleanSetting setting : switches) anyOn |= setting.savedValue();
        // Filter feed's list is on while it holds anything. How many, never the words themselves.
        int muted = this == FILTER_FEED ? MutedWordsSetting.entries(Settings.MUTED_WORDS.savedValue()).size() : 0;
        anyOn |= muted > 0;
        line.append(paused ? "disabled while paused (saved " : anyOn ? "on (" : "disabled by its switch (");
        for (int i = 0; i < switches.size(); i++) {
            if (i > 0) line.append(", ");
            BooleanSetting setting = switches.get(i);
            line.append(setting.key).append(setting.savedValue() ? "=on" : "=off");
        }
        if (this == FILTER_FEED) line.append(", ").append(Settings.MUTED_WORDS.key).append('=').append(muted);
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
        LogBufferManager.registerReportSection(GoogleSignInReadiness.REPORT);
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
            return reportLines(inThisBuild(), HushPinterestPause.isPaused());
        }
    };
}
