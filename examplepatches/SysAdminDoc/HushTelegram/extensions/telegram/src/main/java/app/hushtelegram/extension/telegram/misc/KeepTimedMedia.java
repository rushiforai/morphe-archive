/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Keep view-once and timed media, a switch under Keep deleted messages (#9). A view-once or
 * self-destructing photo, video, voice or video message someone sends you in an ordinary chat stays
 * in that chat on this phone after you open it, and opens again as often as you like.
 *
 * <p>Telegram starts the timer when the media opens: it sets the message's destroy time, tells the
 * server the media was opened, and queues a task that empties it from storage once the timer ends.
 * View-once media is marked expired the moment its viewer opens, and playing a voice or video
 * message marks it played on the server. With the switch on, each of those places answers as it
 * does for media with no timer. The viewer opens without a countdown, the server never hears the
 * media was opened (so the sender doesn't see it opened, and the server keeps it too), and storage
 * never empties it. A timed voice or video message keeps its unplayed dot for the same reason.
 * Secret chats stay stock. Storage only knows the chat, so timed media you sent stays stored on this
 * phone too, and shows again when you reopen the chat after the other side opened it.
 */
public final class KeepTimedMedia {
    private KeepTimedMedia() {}

    /** Telegram's side, swapped out by tests. The real one calls the stubs the patch writes. */
    interface Telegram {
        /** Whether someone else sent the message and it's view-once or self-destructing media. */
        boolean receivedTimedMedia(Object message);

        /** Whether the message is in a secret chat, or can't tell which chat it's in. */
        boolean secretChat(Object message);

        /** Whether the chat is a secret chat. */
        boolean secretDialog(long dialogId);
    }

    static Telegram telegram = new Telegram() {
        @Override
        public boolean receivedTimedMedia(Object message) {
            return KeepTimedMedia.receivedTimedMedia(message);
        }

        @Override
        public boolean secretChat(Object message) {
            return KeepTimedMedia.secretChat(message);
        }

        @Override
        public boolean secretDialog(long dialogId) {
            return KeepTimedMedia.secretDialog(dialogId);
        }
    };

    /**
     * Called first thing where a chat starts timed media's timer, where it expires view-once media,
     * and where a played voice or video message is marked played. True returns as Telegram does for
     * media with no timer.
     */
    public static boolean hold(Object message) {
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        try {
            if (message == null || !on() || !telegram.receivedTimedMedia(message) || telegram.secretChat(message)) return false;
            HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "timed media kept");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "timed media", failure);
            return false;
        }
    }

    /**
     * Called first thing by Telegram's one method that empties expired timed media from a chat's
     * stored messages, including when another of your devices opened it. True leaves it stored.
     */
    public static boolean keepStored(long dialogId) {
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        try {
            if (!on() || telegram.secretDialog(dialogId)) return false;
            HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "timed media left in storage");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "stored timed media", failure);
            return false;
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        return Utils.settingsReady() && Settings.KEEP_TIMED_MEDIA.get();
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** Not {@code isOut()}, and {@code isSecretMedia()}. */
    public static boolean receivedTimedMedia(Object message) { return false; }

    /** {@code messageOwner} missing, or {@code DialogObject.isEncryptedDialog(getDialogId())}. */
    public static boolean secretChat(Object message) { return true; }

    /** {@code DialogObject.isEncryptedDialog(dialogId)}. */
    public static boolean secretDialog(long dialogId) { return true; }
}
