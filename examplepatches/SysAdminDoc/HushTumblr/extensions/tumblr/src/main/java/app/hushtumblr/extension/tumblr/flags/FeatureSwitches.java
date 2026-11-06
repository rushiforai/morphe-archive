/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.flags;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;

/**
 * Turns some of Tumblr's own features off by answering its feature check.
 *
 * <p>Every boolean feature check in Tumblr ends in one method: it reads the server's value for the
 * flag, compares it with "true", logs the answer and returns it. The patch puts {@link #isEnabled}
 * right after that comparison, so a family whose switch is on can answer off for the flags it
 * claims here. Tumblr keeps the first answer for each flag until it restarts, so a switch that
 * only works this way is a restart-needing setting, and the settings screen shows its shared
 * restart line and toast when it changes.
 *
 * <p>Tumblr checks flags while it starts, before HushTumblr has a context. Nothing here loads the
 * settings until {@link Utils#settingsReady()} says it may: the table names each family by its
 * {@link PatchFamily} constant and its patch name, both plain text, and until then every flag gets
 * Tumblr's own answer. Reading Tumblr 46.5.0.109 found no claimed flag asked that early: every
 * reader sits in code the app's onCreate or a later screen starts. A claimed flag that is asked
 * early anyway, with Tumblr's answer on, is counted under its family as {@link #READ_EARLY}, so the
 * diagnostics report shows it.
 */
public final class FeatureSwitches {
    private FeatureSwitches() {}

    /**
     * The count a claimed flag asked before the settings are ready lands under. Tumblr keeps its
     * first answer, so that flag stays on until the next start whatever the switch says.
     */
    static final String READ_EARLY = "flag read before HushTumblr started";

    /** The family that forces a flag off: its {@link PatchFamily} constant and its patch name. */
    static final class Claim {
        final String family;
        final String patchName;

        Claim(String family, String patchName) {
            this.family = family;
            this.patchName = patchName;
        }
    }

    /** Each claimed flag, by the constant name Tumblr's feature enum keeps for it. */
    private static final Map<String, Claim> CLAIMS = claims();

    private static Map<String, Claim> claims() {
        Map<String, Claim> claims = new HashMap<>();
        // Tumblr's own requests to its ad networks, and the pop-up and full-screen ads the timeline
        // filter can't see. Ads the server puts in a page come whatever these say. The last two are
        // the full-screen ad shown on opening a blog (47.0.0.108). With the first off, Tumblr's
        // interstitial manager logs "Skipping: flag off" before it asks for or shows one, and never
        // sets the ad source up; every blog open, from the dashboard, a reblog or anywhere else, goes
        // through that check. The second only ends earlier the route that blog opens from
        // notifications, messages and notes take into the manager.
        claim(claims, "HIDE_ADS", FamilyNames.HIDE_ADS,
                "MAKE_ADX_REQUESTS", "MAKE_APS_AD_REQUESTS", "MAKE_DISPLAY_IO_REQUEST",
                "MAKE_DISPLAY_IO_INTERSCROLLER_REQUEST", "MAKE_FAN_REQUESTS", "MAKE_NIMBUS_CLIENT_AD_REQUESTS",
                "GOOGLE_BANNER_ADS", "GOOGLE_NATIVE_ADS", "GOOGLE_REWARDED_ADS", "SMART_BANNER_ADS",
                "RENDER_NIMBUS_ADS", "RENDER_VUNGLE_ADS", "RENDER_DISPLAY_IO_INTERSCROLLER_S2S_ADS",
                "MAKE_NIMBUS_INTERSTITIAL_CLIENT_AD_REQUESTS", "INTERSTITIAL_ADS_BLOG_OPENING_TRIGGERS");
        // Tumblr's own tracking: LiveRamp's ID on its requests, Open Measurement and Moat ad
        // measurement, its log of which flags you were shown, and its network, performance and ad
        // supply logging. The two Moat flags have no reader in 46.5.0.109 and are here for the
        // builds that read them.
        claim(claims, "DISABLE_ANALYTICS", FamilyNames.DISABLE_ANALYTICS,
                "LIVERAMP_ATS", "ENABLE_OM_SDK", "MOAT_VIDEO_AD_BEACONING",
                "LITTLE_SISTER_MOAT_LOGGING", "SEND_FEATURE_EXPOSED_ANALYTICS",
                "SEND_NETWORK_USAGE_DATA", "MOBILE_PERFORMANCE_LOGGING", "SUPPLY_LOGGING");
        // The banner selling Ad-Free Browsing that Tumblr's tabbed dashboard shows.
        claim(claims, "HIDE_AD_FREE_BANNER", FamilyNames.HIDE_AD_FREE_BANNER,
                "AD_FREE_CTA_BANNER");
        // The Tumblr TV tab in the bottom bar (RootActivity's tab list), and the jump to Tumblr TV
        // at the end of sign-up.
        claim(claims, "HIDE_TUMBLR_TV", FamilyNames.HIDE_TUMBLR_TV,
                "TUMBLR_TV_MOBILE_NAV", "TUMBLR_TV_ONBOARDING_REDIRECT");
        // The Communities tips in the post editor (CanvasActivity). The tab's own flag,
        // COMMUNITIES_TAB_BAR_ITEM, is left to Tumblr on purpose. Off, the tab leaves RootActivity's
        // list, and the bottom bar then skips the one method that decides the tab's button and finds
        // its badge: the button stays on the bar with nothing behind it, and the next unread count is
        // written to a badge that was never found. BottomBarTabs hides the button instead.
        claim(claims, "HIDE_COMMUNITIES_TAB", FamilyNames.HIDE_COMMUNITIES_TAB,
                "COMMUNITIES_TOOLTIPS");
        // Blaze, paying Tumblr to promote a post: the entry points in your blog's header and on the
        // dashboard and notifications, the nudge after you post, and the settings and landing page
        // banners. The landing page banner has no reader in 46.5.0.109.
        claim(claims, "HIDE_BLAZE_PROMPTS", FamilyNames.HIDE_BLAZE_PROMPTS,
                "BLAZE_DASHBOARD_ENTRYPOINT_IN_USER_BLOG_HEADER",
                "BLAZE_DASHBOARD_ENTRYPOINT_NEAR_PREMIUM", "BLAZE_NUDGE_AFTER_POST",
                "SHOW_BLAZE_SETTINGS_BANNER", "TUMBLR_BLAZE_LANDING_PAGE_BANNER");
        // Screenshots: Tumblr watches for one in its screens, then opens its share sheet, which
        // offers to save the post as an image. The sign-up, the watcher and the callback all read
        // this one flag.
        claim(claims, "TURN_OFF_SCREENSHOT_SHARING", FamilyNames.TURN_OFF_SCREENSHOT_SHARING,
                "SCREENSHOT_INTERCEPTION");
        // Tumblr's own update check, which asks Google Play for a newer Tumblr and opens Play's
        // update prompt. With the flag off it logs "not today" and stops there.
        claim(claims, "DISABLE_UPDATE_PROMPTS", FamilyNames.DISABLE_UPDATE_PROMPTS,
                "IN_APP_UPDATE");
        return Collections.unmodifiableMap(claims);
    }

    /** Adds [flags] to [claims] for one family. A flag claimed twice is a mistake in this table. */
    private static void claim(Map<String, Claim> claims, String family, String patchName, String... flags) {
        Claim claim = new Claim(family, patchName);
        for (String flag : flags) {
            if (claims.put(flag, claim) != null) throw new IllegalStateException(flag + " is claimed twice");
        }
    }

    /** Every claimed flag, sorted. */
    static Set<String> claimedFlags() {
        return Collections.unmodifiableSet(new TreeSet<>(CLAIMS.keySet()));
    }

    /** The claim on [flag], or null when no family claims it. */
    static Claim claimOn(String flag) {
        return CLAIMS.get(flag);
    }

    /**
     * Placed right after Tumblr's feature check compares a flag's server value with "true". Answers
     * false for a flag that a family in this build claims while that family's switch is on, and
     * Tumblr's own answer otherwise: for every other flag, before the settings are ready, while
     * paused, and when anything here fails. Never throws.
     */
    public static boolean isEnabled(Enum<?> feature, boolean server) {
        Claim claim = null;
        try {
            if (feature == null) return server;
            claim = CLAIMS.get(feature.name());
            if (claim == null) return server;
            if (!Utils.settingsReady()) {
                // Counting reads no setting, so it's safe this early.
                if (server) HookStatus.counted(claim.patchName, READ_EARLY);
                return server;
            }
            // The hook is in every build with one flag-backed patch, so a claim of a family this
            // build leaves out is passed over before it's counted as that family's.
            PatchFamily family = PatchFamily.valueOf(claim.family);
            if (!family.inBuild()) return server;
            HookStatus.invoked(claim.patchName);
            if (!server || !anyOn(family)) return server;
            HookStatus.counted(claim.patchName, "Tumblr feature turned off");
            return false;
        } catch (Throwable failure) {
            // Only a claimed flag gets past the table lookup, so a failure always has a family.
            if (claim != null) HookStatus.threw(claim.patchName, "feature flag", failure);
            return server;
        }
    }

    /**
     * Whether any switch that can turn [family] on answers on. An option such as Keep Blaze posts
     * can't. Paused, every one answers off.
     */
    private static boolean anyOn(PatchFamily family) {
        for (BooleanSetting setting : family.enablers()) {
            if (setting.get()) return true;
        }
        return false;
    }
}
