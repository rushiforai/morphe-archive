/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Show View profile on Marketplace sellers. A seller's Marketplace page is React Native, and its
 * action bar (MarketplaceProfileActionBar) offers View profile, which opens the seller's regular
 * Facebook profile, only while Facebook's experiment flag {@link #FLAG} reads true for the account.
 * Then the button sits beside the More button and in the More sheet too. Read false, the page has
 * Follow, Message and More, and View profile is in neither place, which is how a seller's regular
 * profile went missing for #68's reporter.
 *
 * <p>The page asks for the flag by name through Facebook's config module for React Native,
 * MobileConfigNativeModule, whose getBool and getBoolWithoutLogging come here first. While the
 * switch is on this answers true for that one name, and the module returns it without asking
 * Facebook's store. Every other name goes on to Facebook unchanged, and so does that one while the
 * switch is off, Hushfacebook is paused or the settings aren't ready. Nothing here may throw into
 * Facebook's JavaScript thread.
 *
 * <p>The module can also read a flag by its stable id, the config key and param key the bundle's
 * rn_params.txt gives the name, in its four by-id boolean reads. They come here first too, and the
 * same flag by its id, {@link #FLAG_SPEC}, gets the same answer.
 */
public final class MarketplaceSellerProfile {
    /** The experiment flag a seller's Marketplace page reads, by the name the page asks for it. */
    static final String FLAG = "qe_marketplace_commerce_profile_page:contextual_view_header_enabled";

    /**
     * {@link #FLAG}'s stable id, config key 49154 and param key 15 on 577, 580 and 581, folded into
     * one long the way the module folds the two doubles it is handed: the config key in the high half.
     */
    static final long FLAG_SPEC = (49154L << 32) | 15L;

    /** Counted under the patch's name each time the seller page is told the flag is on. */
    static final String ANSWERED = "seller page given View profile";

    private static final String FAMILY = FamilyNames.SELLER_VIEW_PROFILE;

    private static volatile boolean logged;

    private MarketplaceSellerProfile() {
    }

    /**
     * Injection point, first in each of the config module's by-name boolean reads: true to answer
     * true for [name] without asking Facebook, false to let Facebook's store answer.
     */
    public static boolean answerTrue(@Nullable String name) {
        if (!FLAG.equals(name)) return false;
        return answer("seller page flag");
    }

    /**
     * Injection point, first in each of the config module's by-id boolean reads, handed the config
     * and param keys as the module got them: true to answer true for {@link #FLAG_SPEC} without
     * asking Facebook, false to let Facebook's store answer.
     */
    public static boolean answerTrueForSpec(double configKey, double paramKey) {
        if (spec(configKey, paramKey) != FLAG_SPEC) return false;
        return answer("seller page flag by id");
    }

    /** The two keys folded as the module's own helper folds them before it reads the store. */
    static long spec(double configKey, double paramKey) {
        return ((long) configKey << 32) | (long) paramKey;
    }

    private static boolean answer(String anchor) {
        try {
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || !Settings.SHOW_SELLER_VIEW_PROFILE.get()) return false;
            HookStatus.bound(FAMILY, anchor);
            HookStatus.counted(FAMILY, ANSWERED);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Show View profile on Marketplace sellers: a seller page asked, and View profile is on");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, anchor, failure);
            return false;
        }
    }
}
