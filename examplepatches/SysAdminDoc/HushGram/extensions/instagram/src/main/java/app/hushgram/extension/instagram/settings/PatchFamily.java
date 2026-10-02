/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.hushgram.extension.instagram.settings;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BooleanSetting;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.preference.LogBufferManager;

/**
 * Every patch in this source, and what Pause does to it.
 *
 * <p>Pause and safe mode work through the switches: while either is on, every feature switch
 * answers off and the hook behind it takes Instagram's own path. The hook's code is still there,
 * only its answer changes, and Debug logging keeps its saved value. A patch with no switch works
 * entirely when you patch, so it stays in until you patch again, and it says what stays.
 *
 * <p>The settings screen and the diagnostic report read this list, so they can't disagree about
 * it. A family is found in this build by the name of its {@link SettingsStatus} method, the same
 * name the patch uses to switch that method on.
 */
public enum PatchFamily {
    HIDE_ADS(FamilyNames.HIDE_ADS, "hideAds", null, Settings.HIDE_ADS),
    SANITIZE_SHARING_LINKS(FamilyNames.SANITIZE_SHARING_LINKS, "sanitizeSharingLinks", null,
            Settings.SANITIZE_SHARING_LINKS),
    EXTERNAL_BROWSER(FamilyNames.EXTERNAL_BROWSER, "externalBrowser", null, Settings.OPEN_LINKS_EXTERNALLY),
    DISABLE_ANALYTICS(FamilyNames.DISABLE_ANALYTICS, "disableAnalytics", null, Settings.DISABLE_ANALYTICS),
    BUILD_EXPIRED_POPUP(FamilyNames.BUILD_EXPIRED_POPUP, "buildExpiredPopup", null,
            Settings.REMOVE_BUILD_EXPIRED_POPUP),
    RESTORE_TRUST(FamilyNames.RESTORE_TRUST, "restoreTrust", "the re-signed build fix"),
    REMOVE_AD_ID(FamilyNames.REMOVE_AD_ID, "removeAdId", "the removed advertising ID permissions"),
    REEL_WATCH_HISTORY(FamilyNames.REEL_WATCH_HISTORY, "reelWatchHistory", null,
            Settings.DONT_SEND_REEL_WATCH_HISTORY),
    STORY_AUTO_ADVANCE(FamilyNames.STORY_AUTO_ADVANCE, "storyAutoAdvance", null,
            Settings.BLOCK_STORY_AUTO_ADVANCE),
    STORY_SEEN(FamilyNames.STORY_SEEN, "storySeen", null, Settings.VIEW_STORIES_ANONYMOUSLY),
    STORIES_TRAY(FamilyNames.STORIES_TRAY, "storiesTray", null, Settings.HIDE_SUGGESTED_STORIES,
            Settings.HIDE_STORIES_TRAY),
    STORY_RING(FamilyNames.STORY_RING, "storyRingSize", null, Settings.STORY_RING),
    FEED_REELS(FamilyNames.FEED_REELS, "feedReels", null, Settings.HIDE_FEED_REELS),
    FEED_SUGGESTIONS(FamilyNames.FEED_SUGGESTIONS, "feedSuggestions", null, Settings.HIDE_SUGGESTED_ACCOUNTS,
            Settings.HIDE_SUGGESTED_POSTS, Settings.HIDE_THREADS_POSTS),
    FOLLOWING_FEED(FamilyNames.FOLLOWING_FEED, "followingFeed", null, Settings.START_ON_FOLLOWING,
            Settings.ONLY_FOLLOWING),
    META_AI(FamilyNames.META_AI, "metaAi", null, Settings.HIDE_META_AI_SEARCH, Settings.HIDE_META_AI_POSTS),
    EXPLORE_GRID(FamilyNames.EXPLORE_GRID, "exploreGrid", null, Settings.HIDE_EXPLORE_GRID),
    SHARE_SHEET(FamilyNames.SHARE_SHEET, "shareSheet", null, Settings.HIDE_SHARE_SHEET_GROUP),
    REPOST_BUTTON(FamilyNames.REPOST_BUTTON, "repostButton", null, Settings.HIDE_REPOST_BUTTON),
    BOTTOM_SPACE(FamilyNames.BOTTOM_SPACE, "bottomSpace", null, Settings.REMOVE_BOTTOM_SPACE),
    FRIENDSHIP_STATUS(FamilyNames.FRIENDSHIP_STATUS, "friendshipStatus", null, Settings.SHOW_FRIENDSHIP_STATUS),
    REEL_DECLUTTER(FamilyNames.REEL_DECLUTTER, "reelDeclutter", null, Settings.HIDE_REEL_FOLLOW_BUTTON,
            Settings.HIDE_REEL_CHIPS, Settings.HIDE_REEL_SOCIAL_FOOTER),
    REEL_DOWNLOAD(FamilyNames.REEL_DOWNLOAD, "reelDownload", null, Settings.DOWNLOAD_REELS),
    DOUBLE_TAP_LIKE(FamilyNames.DOUBLE_TAP_LIKE, "doubleTapLike", null, Settings.TURN_OFF_DOUBLE_TAP_LIKE,
            Settings.TURN_OFF_DOUBLE_TAP_LIKE_ON_POSTS, Settings.TURN_OFF_DOUBLE_TAP_LIKE_ON_REELS),
    REELS_TAB(FamilyNames.REELS_TAB, "reelsTab", null, Settings.HIDE_REELS_TAB),
    KEEP_REEL_SPEED(FamilyNames.KEEP_REEL_SPEED, "keepReelSpeed", null, Settings.KEEP_REEL_SPEED),
    STORY_DOWNLOAD(FamilyNames.STORY_DOWNLOAD, "storyDownload", null, Settings.DOWNLOAD_STORIES),
    VIDEO_DOWNLOAD(FamilyNames.VIDEO_DOWNLOAD, "videoDownload", null, Settings.DOWNLOAD_VIDEOS, Settings.DOWNLOAD_PHOTOS),
    TAP_TO_PLAY(FamilyNames.TAP_TO_PLAY, "tapToPlay", null, Settings.TAP_TO_PLAY),
    RESUME_LONG_VIDEOS(FamilyNames.RESUME_LONG_VIDEOS, "resumeLongVideos", null, Settings.RESUME_LONG_VIDEOS),
    PLAYBACK_QUALITY(FamilyNames.PLAYBACK_QUALITY, "defaultPlaybackQuality", null,
            Settings.DEFAULT_PLAYBACK_QUALITY),
    TRANSLATED_START(FamilyNames.TRANSLATED_START, "translatedStart", "the start-up fix for x86 devices"),
    DEVELOPER_OPTIONS(FamilyNames.DEVELOPER_OPTIONS, "developerOptions", null, Settings.OPEN_DEVELOPER_OPTIONS),
    PURE_BLACK(FamilyNames.PURE_BLACK, "pureBlack", "the pure black dark mode");

    /** The name Morphe Manager lists the patch under. */
    public final String patchName;

    /** The {@link SettingsStatus} method the patch switches on. */
    final String statusMethod;

    /**
     * What of this patch stays in while HushGram is paused, in English, or null when a pause turns
     * all of it off. The English is also a key of {@link L10n}: the screen shows it translated, and
     * the report keeps it in English.
     */
    @Nullable
    public final String staysWhilePaused;

    /** The switches Pause turns off for this patch. Empty when it has none. */
    public final List<BooleanSetting> switches;

    /** The families a test says this build carries, instead of asking {@link SettingsStatus}. */
    @Nullable
    static volatile Set<PatchFamily> inBuildForTests;

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
     * What of these families stays in while HushGram is paused, as a sentence in the phone's
     * language, or null when a pause turns every one of them off. Each item is followed by its
     * patch's name in brackets, the name Morphe Manager lists it under.
     */
    @Nullable
    static String staysWhilePausedSummary(Set<PatchFamily> inBuild) {
        List<String> parts = new ArrayList<>();
        for (PatchFamily family : values()) {
            if (inBuild.contains(family) && family.staysWhilePaused != null) {
                parts.add(L10n.t(family.staysWhilePaused) + " (" + L10n.isolate(family.patchName) + ")");
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
            if (inBuild.contains(family)) {
                lines.add(family.reportLine(paused));
                if (family == DISABLE_ANALYTICS || family == SANITIZE_SHARING_LINKS || family == TRANSLATED_START) {
                    try {
                        String encoded = (String) SettingsStatus.class.getMethod(family.statusMethod + "Coverage").invoke(null);
                        lines.add("  " + coverageLine(encoded));
                    } catch (ReflectiveOperationException | RuntimeException failure) {
                        lines.add("  patch target coverage unavailable");
                    }
                }
            }
            else absent.add(family.patchName);
        }
        if (!absent.isEmpty()) lines.add("not in this build: " + String.join(", ", absent));
        return lines;
    }

    /** The same fixed-label metadata the fixture tools read from this APK's DEX. */
    static String coverageLine(String encoded) {
        if (encoded == null || encoded.isEmpty() || encoded.length() > 32768) {
            return "patch target coverage unavailable";
        }
        try {
            String[] parts = encoded.split("\\|", -1);
            if (parts.length != 5 || !parts[0].equals("1")) throw new IllegalArgumentException();
            int matched = Integer.parseInt(parts[1]);
            int expected = Integer.parseInt(parts[2]);
            List<String> targets = Arrays.asList(parts[3].split(",", -1));
            List<String> missing = parts[4].isEmpty() ? Collections.emptyList() : Arrays.asList(parts[4].split(",", -1));
            if (matched < 1 || expected < matched || expected > 256 || targets.size() != expected
                    || missing.size() != expected - matched || new HashSet<>(targets).size() != expected
                    || new HashSet<>(missing).size() != missing.size() || !targets.containsAll(missing)) {
                throw new IllegalArgumentException();
            }
            for (String label : targets) {
                if (!label.matches("[a-z][a-z0-9 -]{0,63}")) throw new IllegalArgumentException();
            }
            return "patch targets matched " + matched + "/" + expected
                    + (missing.isEmpty() ? " (complete)" : " (partial); missing: " + String.join(", ", missing))
                    + ". Patch-time matches do not prove live endpoint suppression.";
        } catch (IllegalArgumentException failure) {
            return "patch target coverage unavailable";
        }
    }

    /** "on", "disabled by its switch" or "disabled while paused", then the saved switches. */
    private String reportLine(boolean paused) {
        StringBuilder line = new StringBuilder(patchName).append(": ");
        if (switches.isEmpty()) {
            return line.append("no switch, stays in while paused: ").append(staysWhilePaused).toString();
        }
        boolean anyOn = false;
        // A switch with switches under it acts only through them, and one under a switch that's off
        // does nothing, whatever it holds.
        Set<Object> parents = new HashSet<>();
        for (BooleanSetting setting : switches) parents.addAll(setting.getParentSettings());
        for (BooleanSetting setting : switches) {
            anyOn |= setting.savedValue() && setting.isAvailable() && !parents.contains(setting);
        }
        line.append(paused ? "disabled while paused (saved " : anyOn ? "on (" : "disabled by its switch (");
        for (int i = 0; i < switches.size(); i++) {
            if (i > 0) line.append(", ");
            BooleanSetting setting = switches.get(i);
            line.append(setting.key).append(setting.savedValue() ? "=on" : "=off");
        }
        line.append(')');
        if (staysWhilePaused != null) line.append("; stays in while paused: ").append(staysWhilePaused);
        return line.toString();
    }

    /**
     * Registers the [PATCHES] report section, and tells Hook status which families no pause
     * reaches, so a paused export marks only the ones a switch runs. Registering twice keeps one.
     */
    public static void registerDiagnostics() {
        LogBufferManager.registerReportSection(REPORT);
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
            return reportLines(inThisBuild(), HushgramPause.isPaused());
        }
    };
}
