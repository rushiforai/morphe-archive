/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.util.Pair;

import java.util.ArrayList;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Removes sales entry points while keeping purchase, entitlement and account code intact. */
public final class Commerce {
    private Commerce() {}

    /** Only the five verified Settings row appends call this method. */
    public static boolean addSettingsRow(ArrayList<Object> rows, Object row) {
        if (rows != null && row != null && enabled()) {
            HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Settings sales row hidden");
            return false;
        }
        return rows.add(row);
    }

    /** Filters the stock presence decision before the cached tab strip is compared and rebuilt. */
    public static boolean showGiftsTab(boolean visible) {
        if (!visible || !enabled()) return visible;
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Gifts tab hidden");
        return false;
    }

    /** Fresh and edit-mode candidates use the same guard, so the editor cannot put Gifts back. */
    public static boolean addProfileTab(ArrayList<Object> rows, Object tab) {
        if (rows != null && tab instanceof Pair && enabled()) {
            Pair<?, ?> candidate = (Pair<?, ?>) tab;
            try {
                int gifts = giftTabId();
                if (gifts < 0) {
                    HookStatus.missingMember(FamilyNames.HIDE_COMMERCE, "build fact",
                            Commerce.class.getName(), "giftTabId");
                } else if (candidate.first instanceof Integer && candidate.second instanceof CharSequence
                        && ((Integer) candidate.first).intValue() == gifts) {
                    HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Gifts tab candidate hidden");
                    return false;
                }
            } catch (Throwable t) {
                HookStatus.threw(FamilyNames.HIDE_COMMERCE, "Gifts tab identity", t);
            }
        }
        // A failure in Telegram's own append must still propagate to its caller.
        return rows.add(tab);
    }

    /** Receives the footer button index and its stock visibility; animation stays with Telegram. */
    public static boolean showChannelGiftButton(int button, boolean visible) {
        if (!visible || !enabled()) return visible;
        try {
            int gifts = giftButtonIndex();
            if (gifts < 0) {
                HookStatus.missingMember(FamilyNames.HIDE_COMMERCE, "build fact",
                        Commerce.class.getName(), "giftButtonIndex");
            } else if (button == gifts) {
                HookStatus.counted(FamilyNames.HIDE_COMMERCE, "channel Gift button hidden");
                return false;
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "channel Gift button identity", t);
        }
        return visible;
    }

    private static boolean enabled() {
        HookStatus.invoked(FamilyNames.HIDE_COMMERCE);
        try {
            return Utils.settingsReady() && Settings.HIDE_COMMERCE.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "switch read", t);
            return false;
        }
    }

    /** Rewritten from the kept TL_profileTabGifts-to-tab-ID mapper in the host. */
    static int giftTabId() {
        return -1;
    }

    /** Rewritten from the footer's Gift accessibility branch and matching icon-array slot. */
    static int giftButtonIndex() {
        return -1;
    }
}
