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
            Settings.HIDE_AI_PINS),
    HIDE_SHOPPING(FamilyNames.HIDE_SHOPPING, "hideShopping", null, Settings.HIDE_SHOPPING),
    DISABLE_ANALYTICS(FamilyNames.DISABLE_ANALYTICS, "disableAnalytics",
            "Firebase Analytics collection is disabled", Settings.DISABLE_ANALYTICS),
    STRIP_LINK_TRACKING(FamilyNames.STRIP_LINK_TRACKING, "stripLinkTracking", null, Settings.STRIP_LINK_TRACKING),
    DOWNLOAD_PINS(FamilyNames.DOWNLOAD_PINS, "downloadPins", null, Settings.DOWNLOAD_PINS),
    EXTERNAL_BROWSER(FamilyNames.EXTERNAL_BROWSER, "externalBrowser", null, Settings.EXTERNAL_BROWSER),
    SYSTEM_SHARE(FamilyNames.SYSTEM_SHARE, "systemShare", null, Settings.SYSTEM_SHARE),
    HIDE_SCREENSHOT_SHARE(FamilyNames.HIDE_SCREENSHOT_SHARE, "hideScreenshotShare", null, Settings.HIDE_SCREENSHOT_SHARE),
    HIDE_SEARCH_HISTORY(FamilyNames.HIDE_SEARCH_HISTORY, "hideSearchHistory", null, Settings.HIDE_SEARCH_HISTORY),
    HIDE_NAVIGATION_BUTTONS(FamilyNames.HIDE_NAVIGATION_BUTTONS, "hideNavigationButtons", null,
            Settings.HIDE_NAV_CREATE, Settings.HIDE_NAV_NOTIFICATIONS),
    HIDE_HEADER_BUTTONS(FamilyNames.HIDE_HEADER_BUTTONS, "hideHeaderButtons", null, Settings.HIDE_HEADER_BUTTONS),
    HIDE_PIN_MENU_ITEMS(FamilyNames.HIDE_PIN_MENU_ITEMS, "hidePinMenuItems", null,
            Settings.HIDE_PIN_MENU_COLLAGE, Settings.HIDE_PIN_MENU_VISUAL_SEARCH, Settings.HIDE_PIN_MENU_PIN_BOOST),
    HIDE_COMMENTS(FamilyNames.HIDE_COMMENTS, "hideComments", null, Settings.HIDE_COMMENTS),
    QUIET_EMAIL_REMINDER(FamilyNames.QUIET_EMAIL_REMINDER, "quietEmailReminder", null, Settings.QUIET_EMAIL_REMINDER),
    DISABLE_UPDATE_NAG(FamilyNames.DISABLE_UPDATE_NAG, "disableUpdateNag", null, Settings.DISABLE_UPDATE_NAG);

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
    static final Set<PatchFamily> FEED_PAGE = Collections.unmodifiableSet(EnumSet.of(HIDE_ADS, HIDE_AI_PINS, HIDE_SHOPPING));
    static final Set<PatchFamily> PRIVACY_PAGE = Collections.unmodifiableSet(EnumSet.of(DISABLE_ANALYTICS, STRIP_LINK_TRACKING));
    static final Set<PatchFamily> ACTIONS_PAGE = Collections.unmodifiableSet(EnumSet.of(DOWNLOAD_PINS, SYSTEM_SHARE));
    static final Set<PatchFamily> INTERFACE_PAGE = Collections.unmodifiableSet(EnumSet.of(HIDE_SCREENSHOT_SHARE,
            HIDE_SEARCH_HISTORY, HIDE_NAVIGATION_BUTTONS, HIDE_HEADER_BUTTONS, HIDE_PIN_MENU_ITEMS,
            HIDE_COMMENTS, QUIET_EMAIL_REMINDER));

    /** Each independent hook, its owning family and the flag set only after it was inserted. */
    public enum Capability {
        FEED_ADS(HIDE_ADS, "feedAds", "promoted pins in lists"),
        AD_VIEWS(HIDE_ADS, "adViews", "ad-only views"),
        FEED_AI_PINS(HIDE_AI_PINS, "feedAiPins", "AI-labeled pins in lists"),
        FEED_SHOPPING(HIDE_SHOPPING, "feedShopping", "Hide shopping and product pins"),
        ANALYTICS_TASKS(DISABLE_ANALYTICS, "analyticsTasks", "Analytics launch tasks"),
        ANALYTICS_UPLOADS(DISABLE_ANALYTICS, "analyticsUploads", "Analytics uploads"),
        LINK_TRACKING(STRIP_LINK_TRACKING, "linkTracking", "Strip link tracking"),
        PIN_DOWNLOADS(DOWNLOAD_PINS, "pinDownloads", "Download pins"),
        VISIT_LINKS(EXTERNAL_BROWSER, "visitLinks", "Open links in your browser"),
        PIN_SHARE(SYSTEM_SHARE, "pinShare", "System share sheet"),
        SCREENSHOT_SHARE(HIDE_SCREENSHOT_SHARE, "screenshotShare", "No screenshot share menu"),
        SEARCH_HISTORY(HIDE_SEARCH_HISTORY, "searchHistory", "Hide search history"),
        NAVIGATION_BUTTONS(HIDE_NAVIGATION_BUTTONS, "navigationButtons", "Hide navigation buttons"),
        HEADER_BUTTONS(HIDE_HEADER_BUTTONS, "headerButtons", "Hide header buttons"),
        PIN_MENU_ITEMS(HIDE_PIN_MENU_ITEMS, "pinMenuItems", "Filter pin menu"),
        COMMENTS(HIDE_COMMENTS, "comments", "Hide comments"),
        EMAIL_REMINDER(QUIET_EMAIL_REMINDER, "emailReminder", "Quiet email reminders"),
        UPDATE_NAG(DISABLE_UPDATE_NAG, "updateNag", "Disable update nag");

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
        Set<Capability> expected = expectedCapabilities();
        Set<Capability> installed = installedCapabilities();
        if (installed.size() == expected.size()) return completeSummary;
        List<String> covered = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        for (Capability capability : expected) {
            (installed.contains(capability) ? covered : missing).add(L10n.t(capability.label));
        }
        if (covered.isEmpty()) return L10n.f("This build has no coverage for %1$s.", L10n.join(missing));
        return L10n.f("This build covers %1$s. Missing coverage: %2$s.", L10n.join(covered), L10n.join(missing));
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
     * family with two switches is on while either is: each hides its own kind of post.
     */
    private String reportLine(boolean paused) {
        StringBuilder line = new StringBuilder(patchName).append(": ");
        if (switches.isEmpty()) {
            return line.append("no switch, stays in while paused: ").append(effectiveStaysWhilePaused()).toString();
        }
        boolean anyOn = false;
        for (BooleanSetting setting : switches) anyOn |= setting.savedValue();
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
            return reportLines(inThisBuild(), HushPinterestPause.isPaused());
        }
    };
}
