/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Every patch in this source, and what Pause does to it.
 *
 * <p>Pause and safe mode work through the switches: while either is on, every feature switch
 * answers off and the hook behind it takes Threads' own path. The hook's code is still there,
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
    HIDE_SUGGESTED_USERS(FamilyNames.HIDE_SUGGESTED_USERS, "hideSuggestedUsers", null,
            Settings.HIDE_SUGGESTED_USERS),
    RETURN_REFRESH(FamilyNames.RETURN_REFRESH, "returnRefresh", null,
            Settings.BLOCK_RETURN_REFRESH, Settings.RETURN_REFRESH_NO_LIMIT),
    VIDEO_AUTOPLAY(FamilyNames.VIDEO_AUTOPLAY, "disableVideoAutoplay", null,
            Settings.DISABLE_VIDEO_AUTOPLAY),
    MAX_IMAGE_QUALITY(FamilyNames.MAX_IMAGE_QUALITY, "maxImageQuality", null,
            Settings.MAX_IMAGE_QUALITY),
    SANITIZE_SHARING_LINKS(FamilyNames.SANITIZE_SHARING_LINKS, "sanitizeSharingLinks", null,
            Settings.SANITIZE_SHARING_LINKS),
    EXTERNAL_BROWSER(FamilyNames.EXTERNAL_BROWSER, "openLinksExternally", null,
            Settings.OPEN_LINKS_EXTERNALLY),
    DISABLE_ANALYTICS(FamilyNames.DISABLE_ANALYTICS, "disableAnalytics", null,
            Settings.DISABLE_ANALYTICS),
    SCREENSHOT_DETECTION(FamilyNames.SCREENSHOT_DETECTION, "disableScreenshotDetection", null,
            Settings.DISABLE_SCREENSHOT_DETECTION),
    SAVE_MEDIA(FamilyNames.SAVE_MEDIA, "saveMedia", null,
            Settings.SAVE_MEDIA, Settings.DOWNLOAD_COMPATIBLE),
    PURE_BLACK(FamilyNames.PURE_BLACK, "pureBlack", null,
            Settings.PURE_BLACK),
    HIDE_INSTAGRAM_BUTTON(FamilyNames.HIDE_INSTAGRAM_BUTTON, "hideInstagramButton", null,
            Settings.HIDE_INSTAGRAM_BUTTON),
    // A manifest can't be switched at run time: the permission is gone from the APK whether or not
    // HushThreads is paused.
    REMOVE_AD_ID(FamilyNames.REMOVE_AD_ID, "removeAdId", "the removed advertising ID permission"),
    RESTORE_TRUST(FamilyNames.RESTORE_TRUST, "restoreTrust", "the re-signed build fix"),
    VERSION_CODE(FamilyNames.VERSION_CODE, "versionCode", "the raised version code"),
    REMOVE_SHARE_TARGETS(FamilyNames.REMOVE_SHARE_TARGETS, "removeShareTargets", "the removed share sheet entry"),
    TRUST_USER_CERTIFICATES(FamilyNames.TRUST_USER_CERTIFICATES, "trustUserCertificates", "the user certificate trust");

    /** The patch's name in Morphe Manager. */
    public final String patchName;

    /** The {@link SettingsStatus} method the patch switches on. */
    final String statusMethod;

    /**
     * What of this patch stays in while HushThreads is paused, or null when nothing does. One
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


    /**
     * The patches Morphe Manager leaves out of its default selection. Each one goes in when you
     * patch with no switch to leave Threads as it ships: Change version code raises the version
     * every later build has to keep, Remove share targets takes entries out of the manifest, and
     * Trust user-added certificates lets your own certificates past Android's checks. Everything
     * else is in the default selection, with any switch a patch brought in from this list starting
     * off.
     */
    private static final EnumSet<PatchFamily> OPT_IN =
            EnumSet.of(VERSION_CODE, REMOVE_SHARE_TARGETS, TRUST_USER_CERTIFICATES);

    /**
     * Manager's defaults, held to patches-list.json by PatchFamilyTest (Hushfacebook 814acd23), so a
     * new patch fails it until patches-list.json and {@link #OPT_IN} agree on it.
     */
    static final Set<PatchFamily> DEFAULT_SELECTION = Collections.unmodifiableSet(EnumSet.complementOf(OPT_IN));

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

    /** Missing default patches in family declaration order (Hushfacebook 814acd23). */
    static List<String> missingDefaults(Set<PatchFamily> inBuild) {
        List<String> names = new ArrayList<>();
        for (PatchFamily family : values()) {
            if (DEFAULT_SELECTION.contains(family) && !inBuild.contains(family)) names.add(family.patchName);
        }
        return names;
    }

    /**
     * What of these families stays in while HushThreads is paused, as a sentence in the phone's
     * language, or null when a pause turns every one of them off. The list leads the sentence, so
     * its first letter is raised the way that language does it.
     *
     * <p>Each item is followed by its patch's name in brackets, the name Morphe Manager lists it
     * under, which stays English there. "The removed advertising ID permission" is found in Manager
     * as Remove the advertising ID, and nothing in the item's own words said so.
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
            if (inBuild.contains(family)) lines.add(family.reportLine(paused));
            else absent.add(family.patchName);
        }
        if (inBuild.contains(DISABLE_ANALYTICS)) {
            int mask = SettingsStatus.analyticsAddressMask();
            if (mask <= 0 || (mask & ~7) != 0) {
                lines.add("analytics addresses: coverage not recorded");
            } else {
                List<String> matched = new ArrayList<>();
                List<String> missing = new ArrayList<>();
                String[] kinds = {"PIGEON", "DEFAULT", "MQTT"};
                for (int i = 0; i < kinds.length; i++) {
                    ((mask & (1 << i)) != 0 ? matched : missing).add(kinds[i]);
                }
                lines.add("analytics addresses: matched=" + String.join(", ", matched)
                        + "; missing=" + (missing.isEmpty() ? "none" : String.join(", ", missing)));
            }
        }
        if (!absent.isEmpty()) lines.add("not in this build: " + String.join(", ", absent));
        List<String> defaults = missingDefaults(inBuild);
        if (!defaults.isEmpty()) lines.add("left out of Manager's default selection: " + String.join(", ", defaults));
        return lines;
    }


    /**
     * "on", "disabled by its switch" or "disabled while paused", then the saved switches. A
     * family with two switches is on while either is: each hides its own kind of post.
     */
    private String reportLine(boolean paused) {
        StringBuilder line = new StringBuilder(patchName).append(": ");
        if (switches.isEmpty()) {
            return line.append("no switch, stays in while paused: ").append(staysWhilePaused).toString();
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
        if (staysWhilePaused != null) line.append("; stays in while paused: ").append(staysWhilePaused);
        return line.toString();
    }

    /**
     * Registers the [PATCHES] report section, and tells Hook status which families no pause
     * reaches, so a paused export marks only the ones a switch runs. Registering twice keeps one.
     */
    public static void registerDiagnostics() {
        LogBufferManager.registerReportSection(REPORT);
        LogBufferManager.registerReportSection(SupportedLinks.REPORT);
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
            return reportLines(inThisBuild(), HushThreadsPause.isPaused());
        }
    };
}
