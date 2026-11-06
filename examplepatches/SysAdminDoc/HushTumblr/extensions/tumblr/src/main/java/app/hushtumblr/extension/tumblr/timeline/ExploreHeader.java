/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Explore's header, which Tumblr fills from the server's radar header: a post's image with the
 * blog that posted it, or a sponsor's image with a "Sponsored" label and the sponsor's takeover ad
 * behind a tap.
 */
public final class ExploreHeader {
    /** The header type the server gives a header a sponsor paid for. */
    static final String SPONSORED = "sponsored";
    static final String HIDDEN = "sponsored Explore header hidden";
    static final String STEP = "Explore header";

    private ExploreHeader() {}

    /**
     * Whether Hide ads keeps Tumblr from drawing {@code response}, the radar header it just
     * fetched, because a sponsor paid for it. Tumblr then leaves the header as it does when the
     * header fails to load. One that can't be read is drawn.
     */
    public static boolean hideSponsored(@Nullable Object response) {
        if (!Utils.settingsReady()) return false;
        try {
            if (!PatchFamily.Capability.EXPLORE_HEADER_AD.installed()) return false;
            HookStatus.invoked(FamilyNames.HIDE_ADS);
            if (!Settings.HIDE_ADS.get() || !isSponsored(response)) return false;
            HookStatus.counted(FamilyNames.HIDE_ADS, HIDDEN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_ADS, STEP, failure);
            return false;
        }
    }

    /**
     * A header is a sponsor's when the server types it sponsored, gives it a sponsor badge or
     * attaches a takeover ad, each read by the getter Tumblr keeps.
     */
    static boolean isSponsored(@Nullable Object response) throws ReflectiveOperationException {
        Object header = response == null ? null : read(response, "getHeader");
        if (header == null) return false;
        Object type = read(header, "getHeaderType");
        if (type instanceof String && SPONSORED.equalsIgnoreCase(((String) type).trim())) return true;
        if (read(header, "getAd") != null) return true;
        Object badge = read(header, "getSponsoredBadgeUrl");
        return badge instanceof String && !((String) badge).trim().isEmpty();
    }

    private static Object read(Object target, String getter) throws ReflectiveOperationException {
        return target.getClass().getMethod(getter).invoke(target);
    }
}
