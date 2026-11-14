/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * Telegram's own Forward out of a chat or channel that turns forwarding off (#73). With Bypass
 * channel restrictions on, Telegram offers Forward there, but its servers refuse to forward those
 * messages, so nothing would arrive. Called first in {@code SendMessagesHelper.sendMessage(ArrayList, ...)},
 * which every forward goes through (the Forward picker, the share sheet, Quick forward and Repeat),
 * it takes those messages out and sends each as a new message instead: its text, or its photo,
 * video or file from the phone, downloading a video or file first when it isn't there yet. The
 * rest go to Telegram as before. A secret chat is left alone, since Telegram sends copies there
 * itself.
 */
public final class ProtectedForward {
    private ProtectedForward() {}

    /** How a message is sent again: as text, a photo, a video, or a file (voice, music, stickers and documents). */
    enum Kind { TEXT, PHOTO, VIDEO, FILE }

    /** One message to send again, and how. */
    static final class Copy {
        final Object message;
        final Kind kind;

        Copy(Object message, Kind kind) {
            this.message = message;
            this.kind = kind;
        }
    }

    /** Telegram's side, swapped out by tests. The real one calls the stubs the patch writes. */
    interface Telegram {
        /** Whether the chat is a secret chat. */
        boolean secret(long dialog);

        /** Telegram's own answer to whether the message may not be forwarded, whatever the switch says. */
        boolean restricted(Object message);

        int type(Object message);

        int account(Object message);

        /** The message's text, or its caption. */
        String text(Object message);

        /** The document's own file name, null or empty when it has none. */
        String documentName(Object message);

        /** The message's photo or file once it's on the phone, or null. */
        File file(Object message);

        /** Starts downloading the message's document. False when it has none, as for a photo. */
        boolean load(Object message);

        boolean sendText(int account, long dialog, String text);

        boolean sendPhoto(int account, long dialog, String path, String caption);

        boolean sendVideo(int account, long dialog, String path, String caption);

        boolean sendFile(int account, long dialog, String path, String mime, String caption);
    }

    static Telegram telegram = new Telegram() {
        @Override public boolean secret(long dialog) { return ProtectedForward.secret(dialog); }

        @Override public boolean restricted(Object message) {
            ChannelRestrictions.stockAnswers(true);
            try {
                return ProtectedForward.restricted(message);
            } finally {
                ChannelRestrictions.stockAnswers(false);
            }
        }

        @Override public int type(Object message) { return ProtectedForward.type(message); }

        @Override public int account(Object message) { return ProtectedForward.account(message); }

        @Override public String text(Object message) { return ProtectedForward.text(message); }

        @Override public String documentName(Object message) { return ProtectedForward.documentName(message); }

        @Override public File file(Object message) {
            String sent = attachPath(message);
            if (sent != null && !sent.isEmpty()) {
                File original = new File(sent);
                if (original.isFile()) return original;
            }
            File cached = messageFile(message);
            return cached != null && cached.isFile() ? cached : null;
        }

        @Override public boolean load(Object message) { return ProtectedForward.load(message); }

        @Override public boolean sendText(int account, long dialog, String text) {
            return ProtectedForward.sendText(account, dialog, text);
        }

        @Override public boolean sendPhoto(int account, long dialog, String path, String caption) {
            return ProtectedForward.sendPhoto(account, dialog, path, caption);
        }

        @Override public boolean sendVideo(int account, long dialog, String path, String caption) {
            return ProtectedForward.sendVideo(account, dialog, path, caption);
        }

        @Override public boolean sendFile(int account, long dialog, String path, String mime, String caption) {
            return ProtectedForward.sendFile(account, dialog, path, mime, caption);
        }
    };

    /** Copies go out here one at a time, in the order they were picked, off Telegram's own thread. Tests swap in a direct one. */
    static Executor work = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushTelegram ProtectedForward");
        thread.setDaemon(true);
        return thread;
    });

    /** How long a video or file may take to download before it's given up on. Tests shorten it. */
    static long waitMs = 15L * 60 * 1000;

    private static final long POLL_MS = 500;

    /**
     * Called first in Telegram's forward with the messages and the chat they go to. Sends the ones
     * Telegram's servers would refuse as new messages, on {@link #work}, and answers the rest for
     * Telegram to forward: the same list when nothing was taken out, null when nothing is left.
     */
    public static ArrayList<?> held(ArrayList<?> messages, long dialog) {
        if (messages == null || messages.isEmpty()) return messages;
        try {
            if (!Utils.settingsReady() || !Settings.BYPASS_CHANNEL_RESTRICTIONS.get()) return messages;
            if (telegram.secret(dialog)) return messages;
            ArrayList<Object> rest = new ArrayList<>(messages.size());
            List<Copy> copies = new ArrayList<>();
            for (Object message : messages) {
                Kind kind = kind(telegram.type(message));
                if (kind != null && telegram.restricted(message)) copies.add(new Copy(message, kind));
                else rest.add(message);
            }
            if (copies.isEmpty()) return messages;
            int account = telegram.account(copies.get(0).message);
            work.execute(() -> sendAll(account, dialog, copies));
            HookStatus.counted(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "protected forward sent as new messages");
            return rest.isEmpty() ? null : rest;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "protected forward", failure);
            return messages;
        }
    }

    /** How Telegram's message type is sent again, or null for what can't be (polls, contacts, places, paid media). */
    static Kind kind(int type) {
        switch (type) {
            case 0: // text
            case 19: // big emoji
                return Kind.TEXT;
            case 1:
                return Kind.PHOTO;
            case 3: // video
            case 5: // round video
            case 8: // GIF
                return Kind.VIDEO;
            case 2: // voice
            case 9: // file
            case 13: // sticker
            case 14: // music
                return Kind.FILE;
            default:
                return null;
        }
    }

    private static void sendAll(int account, long dialog, List<Copy> copies) {
        Context context = Utils.getContext();
        boolean missing = false;
        boolean refused = false;
        for (Copy copy : copies) {
            try {
                Boolean sent = send(context, account, dialog, copy);
                if (sent == null) missing = true;
                else if (!sent) refused = true;
            } catch (InterruptedException stopped) {
                Thread.currentThread().interrupt();
                return;
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "protected forward send", failure);
                refused = true;
            }
        }
        if (missing) MessageMenu.feedback(context, L10n.t(context, "Open it first to download it"));
        else if (refused) MessageMenu.feedback(context, L10n.t(context, "Can't forward there"));
    }

    /** Whether Telegram took the copy, or null when its photo or file isn't on the phone. */
    private static Boolean send(Context context, int account, long dialog, Copy copy) throws Exception {
        String text = telegram.text(copy.message);
        if (copy.kind == Kind.TEXT) {
            return text != null && !text.isEmpty() && telegram.sendText(account, dialog, text);
        }
        File file = fetch(copy.message);
        if (file == null) return null;
        String name = SaveDownloads.displayName(telegram.documentName(copy.message), file.getName());
        // Sent from a copy in the cache under the document's own name, the way Forward as copy does.
        String path = MessageMenu.renamed(context, file, name).getPath();
        boolean sent;
        switch (copy.kind) {
            case PHOTO:
                sent = telegram.sendPhoto(account, dialog, path, text);
                break;
            case VIDEO:
                sent = telegram.sendVideo(account, dialog, path, text);
                break;
            default:
                sent = telegram.sendFile(account, dialog, path, MessageMenu.mimeOf(name), text);
        }
        if (sent) HookStatus.counted(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "protected media sent as new message");
        return sent;
    }

    /** The message's file, downloading it first when it's a document that isn't on the phone. */
    private static File fetch(Object message) throws InterruptedException {
        File file = telegram.file(message);
        if (file != null || !telegram.load(message)) return file;
        long until = System.currentTimeMillis() + waitMs;
        while (true) {
            file = telegram.file(message);
            if (file != null || System.currentTimeMillis() >= until) return file;
            Thread.sleep(POLL_MS);
        }
    }

    /** Whether the chat is a secret chat. True until patched, which leaves every forward to Telegram. */
    public static boolean secret(long dialog) { return true; }

    /** Whether the message's chat or the message itself doesn't allow forwarding, by the hooks' answer. Replaced when patching. */
    public static boolean restricted(Object message) { return false; }

    /** The message's type. Replaced when patching. */
    public static int type(Object message) { return -1; }

    /** The message's account. Replaced when patching. */
    public static int account(Object message) { return 0; }

    /** The message's text, or its caption. Replaced when patching. */
    public static String text(Object message) { return null; }

    /** The document's own name, null for a photo. Replaced when patching. */
    public static String documentName(Object message) { return null; }

    /** The path the message was sent from on this phone, if it was. Replaced when patching. */
    public static String attachPath(Object message) { return null; }

    /** Where Telegram keeps the message's photo or file once downloaded. Replaced when patching. */
    public static File messageFile(Object message) { return null; }

    /** Starts downloading the message's document; false when it has none. Replaced when patching. */
    public static boolean load(Object message) { return false; }

    /** Sends the text to the chat as a new message. Replaced when patching. */
    public static boolean sendText(int account, long dialog, String text) { return false; }

    /** Sends the photo at the path to the chat, with the caption. Replaced when patching. */
    public static boolean sendPhoto(int account, long dialog, String path, String caption) { return false; }

    /** Sends the video at the path to the chat, with the caption. Replaced when patching. */
    public static boolean sendVideo(int account, long dialog, String path, String caption) { return false; }

    /** Sends the file at the path to the chat as a document, with the caption. Replaced when patching. */
    public static boolean sendFile(int account, long dialog, String path, String mime, String caption) { return false; }
}
