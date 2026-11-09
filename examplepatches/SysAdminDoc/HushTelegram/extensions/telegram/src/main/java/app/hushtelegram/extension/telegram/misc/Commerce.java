/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.util.Pair;

import java.util.ArrayList;
import java.util.List;

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

    /**
     * Gets Telegram's own answer to whether Wallet is available, just before Settings adds the
     * Wallet row and its divider. False skips both, the same list an account without Wallet gets.
     */
    public static boolean showWalletRow(boolean available) {
        if (!available || !enabled()) return available;
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Settings Wallet row hidden");
        return false;
    }

    /**
     * The same answer for the attach menu, just before it gives the Wallet button a place. False
     * numbers the other buttons the way an account without Wallet gets them.
     */
    public static boolean showAttachWallet(boolean available) {
        if (!available || !enabled()) return available;
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "attach menu Wallet button hidden");
        return false;
    }

    /**
     * Asked at the start of the chat list menu's Wallet entry. False skips straight past it, and
     * the menu carries on the way it does after adding Wallet.
     */
    public static boolean showMenuWallet(boolean available) {
        if (!available || !enabled()) return available;
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "chat list menu Wallet item hidden");
        return false;
    }

    /**
     * Telegram's Wallet answer just before a profile's menu offers Send Gram. False builds the menu
     * the way an account without Wallet gets it.
     */
    public static boolean showProfileSendGram(boolean available) {
        if (!available || !enabled()) return available;
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "profile menu Send Gram item hidden");
        return false;
    }

    /**
     * Telegram's answer to whether purchases are blocked, just before a profile's menu adds Send a
     * Gift for a person or a channel. Non-zero is blocked, which leaves the item out.
     */
    public static boolean profileGiftMenuBlocked(int blocked) {
        if (blocked != 0) return true;
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "profile menu Send a Gift item hidden");
        return true;
    }

    /** The same answer for the popup a tapped TON address opens. Copy address and the rest stay. */
    public static boolean showAddressSendGram(boolean available) {
        if (!available || !enabled()) return available;
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "TON link Send Gram item hidden");
        return false;
    }

    /** The same answer for a Gram transfer's message menu. The transfer itself is untouched. */
    public static boolean showTransferSendGram(boolean available) {
        if (!available || !enabled()) return available;
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Gram transfer Send Gram item hidden");
        return false;
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

    /**
     * Asked in place of Telegram's own question whether Premium is blocked for an account, but only
     * where stickers are listed (the filters for packs and the keyboard's favorites and recents)
     * and before the Premium sticker tooltip. Telegram's yes stands. For an account without
     * Premium the answer becomes yes too, so Premium stickers are left out the way Telegram leaves
     * them out where Premium can't be bought. An account with Premium keeps every sticker.
     */
    public static boolean premiumStickersBlocked(Object controller) {
        if (controller == null) return false;
        boolean blocked = premiumBlocked(controller);
        if (blocked || !enabled()) return blocked;
        try {
            if (premiumAccount(controller)) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "Premium account read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Premium stickers left out");
        return true;
    }

    /**
     * Asked before a chat plays a sticker's effect, whether it plays by itself or on a tap. True
     * skips it for a Premium sticker on an account without Premium; the sticker itself still shows.
     */
    public static boolean skipPremiumEffect(Object message) {
        if (message == null || !enabled()) return false;
        try {
            if (!premiumSticker(message) || messageAccountPremium(message)) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "Premium sticker read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Premium sticker effect skipped");
        return true;
    }

    /**
     * Handed the emoji keyboard's packs once Telegram has sorted them, before the tab strip and the
     * rows read them. For an account without Premium, a pack whose emoji need Premium (or the
     * Premium part Telegram split off a pack) is taken out, so the tab lists only emoji that can be
     * sent. A view that shows every emoji without Premium, and an account with Premium, keep all.
     */
    public static void dropLockedEmojiPacks(Object view, List<?> packs) {
        if (view == null || packs == null || packs.isEmpty() || !enabled()) return;
        List<Object> locked = new ArrayList<>();
        try {
            if (emojiViewPremium(view)) return;
            for (Object pack : packs) {
                if (pack != null && !emojiPackFree(pack)) locked.add(pack);
            }
            if (locked.isEmpty()) return;
            packs.removeAll(locked);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "Premium emoji pack read", t);
            return;
        }
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Premium emoji packs left out");
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

    /** Rewritten to ask the MessagesController its own premiumFeaturesBlocked(). */
    static boolean premiumBlocked(Object controller) {
        return false;
    }

    /** Rewritten to read whether the MessagesController's account has Premium. */
    static boolean premiumAccount(Object controller) {
        return true;
    }

    /** Rewritten to ask the MessageObject whether it's a Premium sticker. */
    static boolean premiumSticker(Object message) {
        return false;
    }

    /** Rewritten to read whether the MessageObject's account has Premium. */
    static boolean messageAccountPremium(Object message) {
        return true;
    }

    /** Rewritten to read whether the emoji view's account has Premium or the view shows every emoji anyway. */
    static boolean emojiViewPremium(Object view) {
        return true;
    }

    /** Rewritten to read the emoji pack's free flag. */
    static boolean emojiPackFree(Object pack) {
        return true;
    }
}
