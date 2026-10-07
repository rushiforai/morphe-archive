/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The floating ad button on a feed ad's comments, for Hide sponsored posts.
 *
 * <p>The comment sheet's indicator pill draws one plugin at a time, and Hide sponsored reels
 * already asks {@link ReelsAdFilter#holdsAdPill} about the Reels, Watch and in-stream ad buttons
 * first in the pill's check. A feed ad's comments draw two others: the permalink page's button and
 * the comment flyout's. The feed ads patch puts its own question in front of the same check, so the
 * two patches stack and either one works without the other. The Message, affiliate and visual
 * search pills aren't ads and always pass.
 */
public final class FeedAdPills {
    /** The pill plugins that draw an ad's button on a feed post's comments, by class name. */
    static final Set<String> AD_PILLS = new HashSet<>(Arrays.asList(
            "com.facebook.feedback.comments.plugins.indicatorpill.permalinkadsfloatingcta.PermalinkAdsFloatingCtaPlugin",
            "com.facebook.feedback.comments.plugins.indicatorpill.flyoutadsfloatingcta.FlyoutAdsFloatingCtaPlugin"));

    /** The diagnostic count of checks this answered no. */
    static final String AD_PILL_HELD = "Ad button checks answered no";

    private static final String SOURCE = "FeedAdPills";

    private FeedAdPills() {
    }

    /**
     * Injection point, first in the comment pill's check of whether a plugin's button shows, with
     * that plugin's class name: true answers no. A feed ad then opens its comments without the
     * floating button. Any other plugin, off, or asked before the settings are ready, and the check
     * goes on as before. Never throws.
     */
    public static boolean holdsAdPill(String plugin) {
        HookStatus.invoked(FamilyNames.SPONSORED_POSTS);
        if (!AD_PILLS.contains(plugin) || !switchedOn()) return false;

        HookStatus.counted(FamilyNames.SPONSORED_POSTS, AD_PILL_HELD);
        return true;
    }

    /** The sponsored posts switch, off while paused, unreadable, or before the settings are ready. */
    private static boolean switchedOn() {
        try {
            return Utils.settingsReady() && Settings.HIDE_SPONSORED_POSTS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SPONSORED_POSTS, "switch read", t);
            Logger.diagnosticError(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "could not read the sponsored posts switch", t);
            return false;
        }
    }
}
