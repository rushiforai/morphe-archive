/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

import java.io.File;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * Send photo in the menu of the link preview above the message box (#101). The row sits right above
 * Remove preview. A tap gets the preview's picture onto the phone if it isn't there yet and sends it
 * to the chat as a normal photo, replying to whatever the draft replies to. What's typed in the box
 * becomes its caption when it fits one; text too long for a caption stays in the box and the photo
 * goes alone. Telegram's own Remove preview then closes the menu and takes the preview away.
 */
public final class LinkPreviewPhoto {
    private LinkPreviewPhoto() {}

    /** The chat mode of Telegram's scheduled messages screen, where a send would go out right away. */
    private static final int SCHEDULED_SCREEN = 1;

    private static final String FILE_NAME = "photo.jpg";

    /** Telegram's side, swapped out by tests. The real one calls the stubs the patch writes. */
    interface Telegram {
        /** A new menu row with the gallery icon, styled like the page's other rows. */
        View row(Object page, Context context, CharSequence title);

        /** The chat screen the page belongs to, or null when the menu is open somewhere else. */
        Object chat(Object page);

        /** The link preview the draft has right now, or null. */
        Object webPage(Object chat);

        Object photo(Object webPage);

        /** The photo's size Telegram would show on this screen, or null when it has none to load. */
        Object bestSize(Object photo);

        File path(int account, Object size, int cache);

        /** Starts Telegram's download of the size. False when it has nowhere to load it from. */
        boolean load(int account, Object size, Object photo, Object webPage);

        int account(Object chat);

        long dialog(Object chat);

        int chatMode(Object chat);

        /** The message being edited in the box, or null. */
        Object editing(Object chat);

        Object reply(Object chat);

        Object thread(Object chat);

        Object quote(Object chat);

        Object arguments(Object chat);

        long monoPeer(Object chat);

        boolean photoAllowed(int account, long dialog);

        int captionLimit(int account);

        /** Telegram's formatting read out of text[0], which it leaves holding the plain text to send. */
        ArrayList<?> entities(int account, CharSequence[] text);

        CharSequence text(Object chat);

        void clearText(Object chat);

        void clearReply(Object chat);

        boolean sendPhoto(int account, long dialog, String path, String caption, ArrayList<?> entities,
                          Object reply, Object thread, Object quote, Object arguments, long monoPeer);

        /** Whether the menu holding the row is still on screen. */
        boolean shown(View row);
    }

    static Telegram telegram = new Telegram() {
        @Override public View row(Object page, Context context, CharSequence title) { return LinkPreviewPhoto.row(page, context, title); }

        @Override public Object chat(Object page) { return LinkPreviewPhoto.chat(page); }

        @Override public Object webPage(Object chat) { return LinkPreviewPhoto.webPage(chat); }

        @Override public Object photo(Object webPage) { return LinkPreviewPhoto.photo(webPage); }

        @Override public Object bestSize(Object photo) { return LinkPreviewPhoto.bestSize(photo); }

        @Override public File path(int account, Object size, int cache) { return LinkPreviewPhoto.path(account, size, cache); }

        @Override public boolean load(int account, Object size, Object photo, Object webPage) {
            return LinkPreviewPhoto.load(account, size, photo, webPage);
        }

        @Override public int account(Object chat) { return LinkPreviewPhoto.account(chat); }

        @Override public long dialog(Object chat) { return LinkPreviewPhoto.dialog(chat); }

        @Override public int chatMode(Object chat) { return LinkPreviewPhoto.chatMode(chat); }

        @Override public Object editing(Object chat) { return LinkPreviewPhoto.editing(chat); }

        @Override public Object reply(Object chat) { return LinkPreviewPhoto.reply(chat); }

        @Override public Object thread(Object chat) { return LinkPreviewPhoto.thread(chat); }

        @Override public Object quote(Object chat) { return LinkPreviewPhoto.quote(chat); }

        @Override public Object arguments(Object chat) { return LinkPreviewPhoto.arguments(chat); }

        @Override public long monoPeer(Object chat) { return LinkPreviewPhoto.monoPeer(chat); }

        @Override public boolean photoAllowed(int account, long dialog) { return LinkPreviewPhoto.photoAllowed(account, dialog); }

        @Override public int captionLimit(int account) { return LinkPreviewPhoto.captionLimit(account); }

        @Override public ArrayList<?> entities(int account, CharSequence[] text) { return LinkPreviewPhoto.entities(account, text); }

        @Override public CharSequence text(Object chat) { return LinkPreviewPhoto.text(chat); }

        @Override public void clearText(Object chat) { LinkPreviewPhoto.clearText(chat); }

        @Override public void clearReply(Object chat) { LinkPreviewPhoto.clearReply(chat); }

        @Override public boolean sendPhoto(int account, long dialog, String path, String caption, ArrayList<?> entities,
                                           Object reply, Object thread, Object quote, Object arguments, long monoPeer) {
            return LinkPreviewPhoto.sendPhoto(account, dialog, path, caption, entities, reply, thread, quote, arguments, monoPeer);
        }

        @Override public boolean shown(View row) { return row.isAttachedToWindow(); }
    };

    /** The picture is copied out here, off Telegram's main thread. Tests swap in a direct one. */
    static Executor work = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushTelegram LinkPreviewPhoto");
        thread.setDaemon(true);
        return thread;
    });

    /** How long the picture may take to download before it's given up on. Tests shorten it. */
    static long waitMs = 20L * 1000;

    private static final long POLL_MS = 500;

    /**
     * Called right after the link preview page adds its Remove preview row. Puts Send photo above
     * that row when the switch is on and this draft's preview has a picture the chat can take.
     */
    public static void menuBuilt(Object page, Object removeRow) {
        if (!MessageMenu.on(Settings.LINK_PREVIEW_PHOTO)) return;
        try {
            if (!(removeRow instanceof View)) return;
            View remove = (View) removeRow;
            if (!(remove.getParent() instanceof ViewGroup)) return;
            ViewGroup menu = (ViewGroup) remove.getParent();
            Object chat = telegram.chat(page);
            if (!offered(chat)) return;
            Context context = remove.getContext();
            View row = telegram.row(page, context, L10n.t(context, "Send photo"));
            ViewGroup.LayoutParams size = remove.getLayoutParams();
            menu.addView(row, menu.indexOfChild(remove), new LinearLayout.LayoutParams(size.width, size.height));
            row.setOnClickListener(new Tap(page, row, remove));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "link preview photo row", failure);
        }
    }

    /** Not on the scheduled screen, where this would send now, and not while a message is being edited. */
    private static boolean offered(Object chat) {
        if (chat == null || telegram.chatMode(chat) == SCHEDULED_SCREEN || telegram.editing(chat) != null) return false;
        if (size(telegram.webPage(chat)) == null) return false;
        return telegram.photoAllowed(telegram.account(chat), telegram.dialog(chat));
    }

    /** The size of the preview's picture to send, or null when the preview has none. */
    private static Object size(Object webPage) {
        Object photo = webPage == null ? null : telegram.photo(webPage);
        return photo == null ? null : telegram.bestSize(photo);
    }

    /** The picture when it's on the phone and has something in it, or null. */
    private static File onPhone(int account, Object size) {
        for (int cache = 1; cache >= 0; cache--) {
            File file = telegram.path(account, size, cache);
            if (file != null && file.isFile() && file.length() > 0) return file;
        }
        return null;
    }

    /** One Send photo row and the send it may have under way. Everything here runs on the main thread. */
    private static final class Tap implements View.OnClickListener {
        private final Object page;
        private final View row;
        private final View remove;
        private boolean busy;

        Tap(Object page, View row, View remove) {
            this.page = page;
            this.row = row;
            this.remove = remove;
        }

        @Override public void onClick(View view) {
            if (busy) return;
            try {
                // The link can change while the menu is open, so the picture is read again here.
                Object chat = telegram.chat(page);
                Object webPage = chat == null ? null : telegram.webPage(chat);
                Object size = size(webPage);
                if (size == null) {
                    say(noPhoto());
                    return;
                }
                busy = true;
                int account = telegram.account(chat);
                File file = onPhone(account, size);
                if (file != null) {
                    copy(chat, file);
                } else if (telegram.load(account, size, telegram.photo(webPage), webPage)) {
                    await(chat, account, size, waitMs);
                } else {
                    gaveUp(noPhoto());
                }
            } catch (Throwable failure) {
                failed(failure);
            }
        }

        /** Looks for the download every so often until it lands, the menu closes or time runs out. */
        private void await(Object chat, int account, Object size, long left) {
            Utils.runOnMainThreadDelayed(() -> {
                try {
                    if (!telegram.shown(row)) {
                        busy = false;
                        return;
                    }
                    File file = onPhone(account, size);
                    if (file != null) copy(chat, file);
                    else if (left <= POLL_MS) gaveUp(noPhoto());
                    else await(chat, account, size, left - POLL_MS);
                } catch (Throwable failure) {
                    failed(failure);
                }
            }, POLL_MS);
        }

        /** Telegram may clear its cache file at any time, so it gets a copy of its own to send. */
        private void copy(Object chat, File file) {
            Context context = row.getContext();
            work.execute(() -> {
                try {
                    File copy = MessageMenu.renamed(context, file, FILE_NAME);
                    Utils.runOnMainThread(() -> send(chat, copy));
                } catch (Throwable failure) {
                    Utils.runOnMainThread(() -> failed(failure));
                }
            });
        }

        private void send(Object chat, File file) {
            try {
                if (!telegram.shown(row)) {
                    busy = false;
                    return;
                }
                int account = telegram.account(chat);
                Caption caption = Caption.of(account, chat);
                boolean sent = telegram.sendPhoto(account, telegram.dialog(chat), file.getAbsolutePath(),
                        caption == null ? null : caption.text, caption == null ? null : caption.entities,
                        telegram.reply(chat), telegram.thread(chat), telegram.quote(chat),
                        telegram.arguments(chat), telegram.monoPeer(chat));
                if (!sent) {
                    gaveUp(notSent());
                    return;
                }
                if (caption != null) telegram.clearText(chat);
                telegram.clearReply(chat);
                remove.performClick();
                busy = false;
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "link preview photo sent");
            } catch (Throwable failure) {
                failed(failure);
            }
        }

        private void failed(Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "link preview photo", failure);
            gaveUp(notSent());
        }

        private String noPhoto() {
            return L10n.t(row.getContext(), "Couldn't get the photo. Try again.");
        }

        private String notSent() {
            return L10n.t(row.getContext(), "Couldn't send the photo. Try again.");
        }

        private void gaveUp(String message) {
            busy = false;
            say(message);
        }

        private void say(String message) {
            MessageMenu.feedback(row.getContext(), message);
        }
    }

    /** What's typed in the box, ready to go out as a caption. */
    private static final class Caption {
        final String text;
        final ArrayList<?> entities;

        private Caption(String text, ArrayList<?> entities) {
            this.text = text;
            this.entities = entities;
        }

        /** The box's text with its formatting, or null when it's empty or too long for a caption. */
        static Caption of(int account, Object chat) {
            CharSequence typed = telegram.text(chat);
            if (typed == null) return null;
            int start = 0;
            int end = typed.length();
            while (start < end && Character.isWhitespace(typed.charAt(start))) start++;
            while (end > start && Character.isWhitespace(typed.charAt(end - 1))) end--;
            if (start == end) return null;
            // A piece of the text, so Telegram's reading of it never touches the box itself.
            CharSequence[] text = {typed.subSequence(start, end)};
            ArrayList<?> entities = telegram.entities(account, text);
            String plain = text[0] == null ? "" : text[0].toString();
            if (plain.isEmpty() || plain.length() > telegram.captionLimit(account)) return null;
            return new Caption(plain, entities);
        }
    }

    /** Replaced when patching. */
    public static View row(Object page, Context context, CharSequence title) { return null; }

    /** Replaced when patching. */
    public static Object chat(Object page) { return null; }

    /** Replaced when patching. */
    public static Object webPage(Object chat) { return null; }

    /** Replaced when patching. */
    public static Object photo(Object webPage) { return null; }

    /** Replaced when patching. */
    public static Object bestSize(Object photo) { return null; }

    /** Replaced when patching. */
    public static File path(int account, Object size, int cache) { return null; }

    /** Replaced when patching. */
    public static boolean load(int account, Object size, Object photo, Object webPage) { return false; }

    /** Replaced when patching. */
    public static int account(Object chat) { return 0; }

    /** Replaced when patching. */
    public static long dialog(Object chat) { return 0; }

    /** Replaced when patching. */
    public static int chatMode(Object chat) { return 0; }

    /** Replaced when patching. */
    public static Object editing(Object chat) { return null; }

    /** Replaced when patching. */
    public static Object reply(Object chat) { return null; }

    /** Replaced when patching. */
    public static Object thread(Object chat) { return null; }

    /** Replaced when patching. */
    public static Object quote(Object chat) { return null; }

    /** Replaced when patching. */
    public static Object arguments(Object chat) { return null; }

    /** Replaced when patching. */
    public static long monoPeer(Object chat) { return 0; }

    /** Replaced when patching. */
    public static boolean photoAllowed(int account, long dialog) { return false; }

    /** Replaced when patching. */
    public static int captionLimit(int account) { return 0; }

    /** Replaced when patching. */
    public static ArrayList<?> entities(int account, CharSequence[] text) { return null; }

    /** Replaced when patching. */
    public static CharSequence text(Object chat) { return null; }

    /** Replaced when patching. */
    public static void clearText(Object chat) {}

    /** Replaced when patching. */
    public static void clearReply(Object chat) {}

    /** Replaced when patching. */
    public static boolean sendPhoto(int account, long dialog, String path, String caption, ArrayList<?> entities,
                                    Object reply, Object thread, Object quote, Object arguments, long monoPeer) {
        return false;
    }
}
