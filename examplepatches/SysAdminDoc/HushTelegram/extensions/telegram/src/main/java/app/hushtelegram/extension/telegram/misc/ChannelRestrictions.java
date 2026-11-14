/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

import java.util.ArrayList;

/**
 * Bypasses content restrictions (no forwards, no saving, no copying) on channels and chats.
 * Hooks the places Telegram checks: {@code MessagesController.isChatNoForwards},
 * {@code MessagesController.isPeerNoForwards}, the static check of a private chat's full profile,
 * and every place the app branches on a message's or a chat's own {@code noforwards} field: the
 * selection, the message menu, the share button, shared media and the photo viewer. When the switch
 * is on, all of them answer false so forwarding, copying and saving work as if the restriction was
 * never set. The existing Allow screenshots patch handles FLAG_SECURE
 * separately, except in stories (see {@link #storyAllowed}). Its Open restricted channels switch
 * also drops the restriction reason Telegram shows for copyright or local law blocks.
 */
public final class ChannelRestrictions {
    private ChannelRestrictions() {
    }

    /** Set on a thread while the extension asks Telegram for its own answer (see {@link #stockAnswers}). */
    private static final ThreadLocal<Boolean> STOCK = new ThreadLocal<>();

    /**
     * While on, the two forwarding checks give this thread Telegram's own answer even with the
     * switch on, so {@link ProtectedForward} can tell which messages Telegram's servers will refuse
     * to forward. Turn it off again in a finally block.
     */
    static void stockAnswers(boolean on) {
        if (on) STOCK.set(Boolean.TRUE);
        else STOCK.remove();
    }

    private static boolean askingStock() {
        return STOCK.get() != null;
    }

    /**
     * Called where Telegram asks whether a chat forbids forwarding, where it asks the same of a
     * private chat's full profile, and where a screen branches on a chat's own noforwards flag
     * (#73). Returns 0 (false) when the switch is on, letting the stock answer through otherwise.
     */
    public static int isChatNoForwards(int stockAnswer) {
        if (stockAnswer == 0 || askingStock()) return stockAnswer;
        try {
            if (!Utils.settingsReady() || !Settings.BYPASS_CHANNEL_RESTRICTIONS.get()) return stockAnswer;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "switch read", t);
            return stockAnswer;
        }
        HookStatus.counted(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "chat restriction bypassed");
        return 0;
    }

    /**
     * Called where Telegram asks whether a peer forbids forwarding, and wherever the app branches
     * on a message's own noforwards flag (#73). Returns 0 (false) when the switch is on.
     */
    public static int noForwards(int stockAnswer) {
        if (stockAnswer == 0 || askingStock()) return stockAnswer;
        try {
            if (!Utils.settingsReady() || !Settings.BYPASS_CHANNEL_RESTRICTIONS.get()) return stockAnswer;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "switch read", t);
            return stockAnswer;
        }
        HookStatus.counted(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "message restriction bypassed");
        return 0;
    }

    /**
     * Called with each answer the story viewer gets to whether a story may be shared, saved or
     * screenshot, which the story or its channel can turn off (#52). Returns 1 (true) when the
     * switch is on, so a protected story gets the same menu, share and screenshots as any other.
     * Telegram asks this one method for all of them, so screenshots of these stories come with it.
     */
    public static int storyAllowed(int stockAnswer) {
        if (stockAnswer != 0) return stockAnswer;
        try {
            if (!Utils.settingsReady() || !Settings.BYPASS_CHANNEL_RESTRICTIONS.get()) return stockAnswer;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "switch read", t);
            return stockAnswer;
        }
        HookStatus.counted(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "story restriction bypassed");
        return 1;
    }

    /**
     * Called first in {@code MessagesController.getRestrictionReason}, which every check of a chat,
     * user or message restricted for copyright or local law goes through (#58): opening a channel,
     * its profile, a message's text and media. With the switch on the answer is no reason at all,
     * so Telegram opens and shows them as it would anywhere they aren't restricted. Telegram skips
     * its "sensitive" reason by itself and keeps doing so. An empty list is every ordinary chat,
     * so it goes to Telegram's own answer uncounted.
     *
     * @param reasons the chat's, user's or message's restriction reasons
     * @return whether to answer that nothing is restricted
     */
    public static boolean ignoreRestrictionReason(ArrayList<?> reasons) {
        if (reasons == null || reasons.isEmpty()) return false;
        try {
            if (!Utils.settingsReady() || !Settings.OPEN_RESTRICTED_CHATS.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "restriction reason ignored");
        return true;
    }
}
