/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Ghost mode: reading a chat or watching a story without telling anyone.
 *
 * <p>Every request Telegram sends passes through one private method of its connection manager, and
 * the patch has that method ask here first. With Ghost mode on, the requests that tell the server a
 * chat was read (private chats, groups, channels, secret chats, comment threads, and a voice or
 * video message played) or a story was seen are dropped before they go out, so the other side never
 * gets the receipt. Telegram's own bookkeeping on this phone runs as usual: the chat still clears
 * its unread count and the story ring still turns grey. Nothing else is touched, and a request of
 * any other kind returns at once without reading a setting.
 *
 * <p>Two more parts hold back what the account says about itself: the typing, recording and
 * uploading status a chat shows, and the online status ({@code account.updateStatus} with offline
 * off). Going offline still goes out, so the account shows as offline.
 *
 * <p>Sending a message into a chat tells the server it was read anyway, which this can't change.
 */
public final class GhostMode {
    private GhostMode() {}

    /** Requests that mark messages read or played for the people who sent them. */
    private static final Set<String> READS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.TLRPC$TL_messages_readHistory",
            "org.telegram.tgnet.TLRPC$TL_channels_readHistory",
            "org.telegram.tgnet.TLRPC$TL_messages_readMessageContents",
            "org.telegram.tgnet.TLRPC$TL_channels_readMessageContents",
            "org.telegram.tgnet.TLRPC$TL_messages_readEncryptedHistory",
            "org.telegram.tgnet.TLRPC$TL_messages_readDiscussion",
            "org.telegram.tgnet.TLRPC$TL_messages_readSavedHistory")));

    /** Requests that tell a story's poster it was seen. */
    private static final Set<String> STORIES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.tl.TL_stories$TL_stories_readStories",
            "org.telegram.tgnet.tl.TL_stories$TL_stories_incrementStoryViews")));

    /** Requests that show a chat's other side that you're typing, recording or uploading. */
    private static final Set<String> TYPING = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.TLRPC$TL_messages_setTyping",
            "org.telegram.tgnet.TLRPC$TL_messages_setEncryptedTyping")));

    /** The request that sets the account online or offline, which has a boolean field named offline. */
    private static final String STATUS = "org.telegram.tgnet.tl.TL_account$updateStatus";

    /** What a request is to Ghost mode. */
    enum Kind { READ, STORY, TYPING, ONLINE, OTHER }

    /** What a kept-back typing status's callback is told. Telegram ignores the error itself. */
    static final int ERROR_CODE = 400;
    static final String ERROR_TEXT = "GHOST_MODE";

    /**
     * Asked with every request and its callback just before Telegram sends it. True means drop it:
     * the request never goes out and its callback never runs, except a typing status's, which is
     * answered with an error. Never throws.
     */
    public static boolean drop(Object request, Object callback) {
        if (request == null) return false;
        Kind kind = kind(request.getClass().getName());
        if (kind == Kind.ONLINE && !goingOnline(request)) return false;
        if (!keepBack(kind)) return false;
        if (kind == Kind.TYPING && callback != null) answer(callback);
        return true;
    }

    /**
     * Telegram marks a chat as waiting on its typing status until the answer comes back, and sends no
     * other typing there while it waits. A kept-back one never got an answer, so with Hide typing
     * turned off again the chat stayed silent until Telegram restarted. An error answer clears the
     * mark the way a refused request does.
     */
    private static void answer(Object callback) {
        try {
            if (!RequestAnswers.error(callback, ERROR_CODE, ERROR_TEXT)) {
                HookStatus.missingMember(FamilyNames.DISABLE_ANALYTICS, "method", callback.getClass().getName(), "run");
            }
        } catch (Throwable t) {
            // Typing stays hidden without the answer; it comes back when Telegram restarts.
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode typing answer", t);
        }
    }

    /** Whether an update status request says online. Anything unreadable is treated as offline, so it goes out. */
    private static boolean goingOnline(Object request) {
        try {
            return !request.getClass().getField("offline").getBoolean(request);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode online status read", t);
            return false;
        }
    }

    /** Whether a request of this kind stays on the phone, counted when it does. */
    static boolean keepBack(Kind kind) {
        if (kind == Kind.OTHER) return false;
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        BooleanSetting part = part(kind);
        try {
            if (!Utils.settingsReady() || !Settings.GHOST_MODE.get() || !part.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, label(kind));
        return true;
    }

    private static BooleanSetting part(Kind kind) {
        switch (kind) {
            case READ: return Settings.GHOST_READS;
            case TYPING: return Settings.GHOST_TYPING;
            case ONLINE: return Settings.GHOST_ONLINE;
            default: return Settings.GHOST_STORIES;
        }
    }

    private static String label(Kind kind) {
        switch (kind) {
            case READ: return "read receipts kept back";
            case TYPING: return "typing statuses kept back";
            case ONLINE: return "online statuses kept back";
            default: return "story views kept back";
        }
    }

    /** Which kind a request class is, by its name, which Telegram's builds keep. */
    static Kind kind(String className) {
        if (READS.contains(className)) return Kind.READ;
        if (STORIES.contains(className)) return Kind.STORY;
        if (TYPING.contains(className)) return Kind.TYPING;
        if (STATUS.equals(className)) return Kind.ONLINE;
        return Kind.OTHER;
    }
}
