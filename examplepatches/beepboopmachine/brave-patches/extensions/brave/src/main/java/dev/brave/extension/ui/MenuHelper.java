package dev.brave.extension.ui;

import android.util.Log;
import java.lang.reflect.Method;

public class MenuHelper {
    private static final String TAG = "Brave_MenuHelper";

    public static final int[] BLOAT_MENU_IDS = new int[] {
        0x7f0102e0, // Wallet
        0x7f01028b, // Leo AI
        0x7f010296, // Brave Rewards
        0x7f01028e, // Brave News
        0x7f010d77, // VPN checkbox
        0x7f010d78, // VPN promo
        0x7f010d79, // VPN row
        0x7f010d7d  // VPN
    };

    private static final String[] BLOAT_PREF_KEYS = new String[] {
        "brave_news_v2",
        "brave_wallet",
        "brave_vpn",
        "brave_leo",
        "brave_account"
    };

    /**
     * Safely strips bloat menu items from AppMenuModel (b1b) via hq2.d0(b1b, int[]).
     */
    public static void removeBloatMenuItems(Object menuModelList) {
        if (menuModelList == null) return;
        try {
            Class<?> hq2Class = Class.forName("hq2");
            for (Method m : hq2Class.getDeclaredMethods()) {
                if ("d0".equals(m.getName())) {
                    m.setAccessible(true);
                    m.invoke(null, menuModelList, BLOAT_MENU_IDS);
                    return;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed removing bloat menu items", t);
        }
    }

    /**
     * Safely removes bloat preferences from features_section and root preference hierarchy.
     */
    public static void removeBloatPreferences(Object fragment) {
        if (fragment == null) return;
        try {
            Method findPrefMethod = null;
            Method removePrefMethod = null;
            for (Method m : fragment.getClass().getMethods()) {
                if ("F4".equals(m.getName()) && m.getParameterTypes().length == 1) {
                    findPrefMethod = m;
                } else if ("T4".equals(m.getName()) && m.getParameterTypes().length == 1) {
                    removePrefMethod = m;
                }
            }

            if (findPrefMethod == null) return;

            Object featuresSection = findPrefMethod.invoke(fragment, "features_section");
            if (featuresSection != null) {
                Method groupRemove = null;
                for (Method m : featuresSection.getClass().getMethods()) {
                    if (("c1".equals(m.getName()) || "e1".equals(m.getName()) || "removePreference".equals(m.getName()))
                            && m.getParameterTypes().length == 1) {
                        groupRemove = m;
                        break;
                    }
                }

                for (String key : BLOAT_PREF_KEYS) {
                    try {
                        Object pref = findPrefMethod.invoke(fragment, key);
                        if (pref != null && groupRemove != null) {
                            groupRemove.invoke(featuresSection, pref);
                        }
                    } catch (Throwable ignored) {}
                }
            }

            if (removePrefMethod != null) {
                for (String key : BLOAT_PREF_KEYS) {
                    try {
                        removePrefMethod.invoke(fragment, key);
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable ignored) {}
    }
}
