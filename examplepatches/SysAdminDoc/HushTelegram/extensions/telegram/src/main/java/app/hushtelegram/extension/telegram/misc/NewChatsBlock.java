/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Block new channels and groups, a parental control.
 *
 * <p>Two hooks ask here. Every request Telegram sends passes through one private method of its
 * connection manager, which asks {@link #drop} first: with the switch on, the requests that join a
 * channel or group, look up an invite link or add a shared folder's chats never go out. A join's
 * callback never runs. A link lookup's gets an error, the way a dead link would, so Telegram closes
 * the loading circle it put up and says it can't find the group or folder; with no answer at all
 * the circle stayed until you went back. And the chat screen asks {@link #refuseOpen} when it starts on a channel or
 * supergroup you aren't in, the preview Telegram shows before you join, as does the topic list when
 * it starts on such a forum, so that screen doesn't open. Chats you're already in, comment threads
 * and everything else stay stock. Both say why with a short toast.
 *
 * <p>The settings lock is what keeps a child from turning this off again, so the switch's row says
 * to set it.
 */
public final class NewChatsBlock {
    private NewChatsBlock() {}

    /** Requests that join a chat, or open the way to one: invite links and shared folders. */
    private static final Set<String> JOINS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.TLRPC$TL_channels_joinChannel",
            "org.telegram.tgnet.TLRPC$TL_messages_importChatInvite",
            "org.telegram.tgnet.TLRPC$TL_messages_checkChatInvite",
            "org.telegram.tgnet.tl.TL_chatlists$TL_chatlists_joinChatlistInvite",
            "org.telegram.tgnet.tl.TL_chatlists$TL_chatlists_checkChatlistInvite",
            "org.telegram.tgnet.tl.TL_chatlists$TL_chatlists_joinChatlistUpdates")));

    /** Of those, the ones Telegram sends behind a loading circle that only their answer closes. */
    private static final Set<String> LOOKUPS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.TLRPC$TL_messages_checkChatInvite",
            "org.telegram.tgnet.tl.TL_chatlists$TL_chatlists_checkChatlistInvite")));

    /** What a dropped lookup's callback is told. Telegram reads any error it doesn't know as a dead link. */
    static final int ERROR_CODE = 400;
    static final String ERROR_TEXT = "NEW_CHATS_BLOCKED";

    /**
     * Asked with every request and its callback just before Telegram sends it. True means drop it:
     * the request never goes out, and a link lookup's callback, when there is one, is answered with
     * an error. A request of any other kind returns at once without reading a setting. Never throws.
     */
    public static boolean drop(Object request, Object callback) {
        if (request == null) return false;
        String name = request.getClass().getName();
        if (!joins(name) || !refuse("joins blocked")) return false;
        if (callback != null && LOOKUPS.contains(name)) answer(callback);
        return true;
    }

    /**
     * Asked when the chat screen starts on a channel or supergroup you aren't in, or the topic list
     * on a forum you aren't in. True means the screen doesn't open. Never throws.
     */
    public static boolean refuseOpen() {
        return refuse("chats not opened");
    }

    /** Whether a request class, by the name Telegram's builds keep, joins a chat or leads to one. */
    static boolean joins(String className) {
        return JOINS.contains(className);
    }

    /** Answers a dropped lookup with an error. Telegram's lookup callbacks hand it to the main thread themselves. */
    private static void answer(Object callback) {
        try {
            if (!RequestAnswers.error(callback, ERROR_CODE, ERROR_TEXT)) {
                HookStatus.missingMember(FamilyNames.HIDE_POPULAR_APPS, "method", callback.getClass().getName(), "run");
            }
        } catch (Throwable t) {
            // The block holds without the answer; Telegram's loading circle just stays up.
            HookStatus.threw(FamilyNames.HIDE_POPULAR_APPS, "new chats block lookup answer", t);
        }
    }

    /** Whether the switch is on, counted and told when it is. */
    private static boolean refuse(String counted) {
        HookStatus.invoked(FamilyNames.HIDE_POPULAR_APPS);
        try {
            if (!Utils.settingsReady() || !Settings.BLOCK_NEW_CHATS.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_POPULAR_APPS, "new chats block switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_POPULAR_APPS, counted);
        try {
            Utils.showToastShort(L10n.t("New chats are blocked in HushTelegram settings."));
        } catch (Throwable t) {
            // The block holds without the toast.
            HookStatus.threw(FamilyNames.HIDE_POPULAR_APPS, "new chats block toast", t);
        }
        return true;
    }
}
