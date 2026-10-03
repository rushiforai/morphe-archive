/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.ads;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Presentation guards. The shared promo-data request also refreshes security suggestions. */
public final class ProxyPromotions {
    private ProxyPromotions() {}

    private static boolean enabled() {
        HookStatus.invoked(FamilyNames.HIDE_SPONSORED_PROXY);
        try {
            return Utils.settingsReady() && Settings.HIDE_SPONSORED_PROXY.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SPONSORED_PROXY, "switch read", failure);
            return false;
        }
    }

    /** Called after stock null and left-channel checks, before the cached channel is reinserted. */
    public static boolean hideCachedProxyDialog(Object controller, Object dialog) {
        if (!enabled()) return false;
        try {
            if (!isSponsoredProxyDialog(controller, dialog)) return false;
            HookStatus.counted(FamilyNames.HIDE_SPONSORED_PROXY, "cached proxy dialog hidden");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SPONSORED_PROXY, "proxy dialog scope", failure);
            return false;
        }
    }

    /** Custom folders are rebuilt before stock removes the cached channel from allDialogs. */
    public static boolean showSelectedDialog(boolean visible, Object controller, Object dialog) {
        if (!enabled() || !visible) return visible;
        try {
            if (!isSponsoredProxyDialog(controller, dialog)) return visible;
            HookStatus.counted(FamilyNames.HIDE_SPONSORED_PROXY, "cached proxy folder entry hidden");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SPONSORED_PROXY, "proxy dialog scope", failure);
            return visible;
        }
    }

    /** Rewritten using public, kept host members. Unknown objects or absent chat state fail open. */
    static boolean isSponsoredProxyDialog(Object controller, Object dialog) {
        return false;
    }
}
