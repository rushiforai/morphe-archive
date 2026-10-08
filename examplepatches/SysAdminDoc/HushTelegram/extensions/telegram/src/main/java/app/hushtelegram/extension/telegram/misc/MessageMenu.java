/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.net.Uri;
import android.text.format.Formatter;
import android.util.Pair;
import android.widget.LinearLayout;
import android.widget.Toast;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.ui.CustomDialog;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.File;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Extra items in a message's long-press menu, each behind its own switch. Telegram builds that
 * menu as three lists kept in step (icons, labels and option numbers) and hands the chosen number
 * back to the chat. The items go into those lists, and their numbers are answered before
 * Telegram's own switch, which passes a number it doesn't know straight on to closing the menu.
 *
 * <p>Repeat sends the message again to the same chat through Telegram's own forward with the
 * sender hidden, the path its forward panel takes. It only shows next to Telegram's own Forward,
 * so never in a protected or secret chat, and only where the chat takes new messages. Polls,
 * to-do lists, paid media and hidden sensitive media are left out, and an article keeps
 * Telegram's Premium rule for hiding its sender.
 *
 * <p>Copy photo puts a downloaded photo on the clipboard through Telegram's own file provider,
 * the one its Share option uses. Like Repeat it only shows next to Forward, so a protected chat,
 * where Telegram hides Forward and saving, never gets it.
 *
 * <p>Message details shows the message's IDs, its dates in local time, where it was forwarded
 * from and its file's data center and size, all read from the copy Telegram already holds.
 */
public final class MessageMenu {
    private MessageMenu() {}

    /** Option numbers far past Telegram's own, which stay under a few hundred. */
    static final int REPEAT = 0x48544d01;
    static final int DETAILS = 0x48544d02;
    static final int COPY_PHOTO = 0x48544d03;

    /**
     * Asked as Telegram finishes the menu's lists.
     *
     * @param chat the chat screen
     * @param primary the message the menu opened on, unused: the chat's selected message is what a choice acts on
     */
    public static void fill(Object chat, Object primary, ArrayList<Object> icons, ArrayList<Object> items, ArrayList<Object> options) {
        boolean repeat = on(Settings.MESSAGE_MENU_REPEAT);
        boolean copy = on(Settings.MESSAGE_MENU_COPY_PHOTO);
        boolean details = on(Settings.MESSAGE_MENU_DETAILS);
        if (!repeat && !copy && !details || icons == null || items == null || options == null) return;
        try {
            Object message = selected(chat);
            if (message == null) return;
            boolean forwardable = options.contains(forwardOption());
            repeat = repeat && forwardable && repeatable(chat, message);
            copy = copy && forwardable && photo(message) && downloaded(message) != null;
            offer(icons, items, options, repeat, copy, details, forwardOption());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "message menu", failure);
        }
    }

    /** Asked first when an option is chosen. Telegram's own numbers pass by untouched. */
    public static void chosen(Object chat, int option) {
        if (option != REPEAT && option != DETAILS && option != COPY_PHOTO) return;
        try {
            Object message = selected(chat);
            if (message == null) return;
            if (option == REPEAT) {
                if (!on(Settings.MESSAGE_MENU_REPEAT)) return;
                ArrayList<Object> batch = batch(chat, message);
                // Sent once the menu has closed, the way Telegram's own forward panel sends.
                Utils.runOnMainThread(() -> send(chat, batch));
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "message repeated");
            } else if (option == COPY_PHOTO) {
                if (!on(Settings.MESSAGE_MENU_COPY_PHOTO)) return;
                Context context = activity(chat);
                File file = downloaded(message);
                if (context == null || file == null) return;
                copyPhoto(context, file);
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "photo copied");
            } else {
                if (!on(Settings.MESSAGE_MENU_DETAILS)) return;
                Context context = activity(chat);
                if (context == null) return;
                String text = describe(context, facts(message));
                Utils.runOnMainThread(() -> show(context, text));
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "message details shown");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "message menu choice", failure);
        }
    }

    /**
     * Puts the items whose switches let them in: Repeat and Copy photo right after Forward, Message
     * details last. The three lists stay in step, so a menu whose lists already differ is left
     * alone, and so is an empty one, which Telegram doesn't open at all.
     */
    static void offer(List<Object> icons, List<Object> items, List<Object> options, boolean repeat, boolean copy, boolean details, int forward) {
        if (options.isEmpty() || icons.size() != items.size() || items.size() != options.size()) return;
        int at = options.indexOf(forward);
        if (at >= 0 && copy) {
            int icon = copyIcon();
            String label = L10n.t("Copy photo");
            icons.add(at + 1, icon);
            items.add(at + 1, label);
            options.add(at + 1, COPY_PHOTO);
        }
        if (at >= 0 && repeat) {
            int icon = repeatIcon();
            String label = L10n.t("Repeat");
            icons.add(at + 1, icon);
            items.add(at + 1, label);
            options.add(at + 1, REPEAT);
        }
        if (details) {
            int icon = detailsIcon();
            String label = L10n.t("Message details");
            icons.add(icon);
            items.add(label);
            options.add(DETAILS);
        }
    }

    /** Whether Repeat fits this message, beyond Telegram offering Forward for it. */
    static boolean repeatable(Object chat, Object message) {
        if (!canSend(message)) return false;
        ArrayList<Object> batch = batch(chat, message);
        int[] types = new int[batch.size()];
        for (int i = 0; i < types.length; i++) {
            if (blocked(batch.get(i))) return false;
            types[i] = type(batch.get(i));
        }
        return ForwardSender.hides(premium(message), article(), types);
    }

    /** The photo's file once it's on the phone: the sent original first, then Telegram's own copy. */
    static File downloaded(Object message) {
        String sent = attachPath(message);
        if (sent != null && !sent.isEmpty()) {
            File original = new File(sent);
            if (original.isFile()) return original;
        }
        File cached = photoFile(message);
        return cached != null && cached.isFile() ? cached : null;
    }

    /** The picture itself on the clipboard, as a content link the app it's pasted into can read. */
    private static void copyPhoto(Context context, File file) {
        Uri uri = uri(context, file);
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (uri == null || clipboard == null) return;
        clipboard.setPrimaryClip(ClipData.newUri(context.getContentResolver(), L10n.t(context, "Copy photo"), uri));
        Toast.makeText(context, L10n.t(context, "Photo copied"), Toast.LENGTH_SHORT).show();
    }

    /** The whole album when the message is part of one, so the copy stays an album. */
    static ArrayList<Object> batch(Object chat, Object message) {
        ArrayList<Object> batch = new ArrayList<>();
        ArrayList<?> group = grouped(chat);
        if (group != null && group.contains(message)) batch.addAll(group);
        else batch.add(message);
        return batch;
    }

    /** What the details dialog shows, read from the message Telegram holds. */
    static final class Facts {
        int id;
        long chat;
        long sender;
        int date;
        int edited;
        boolean forwarded;
        String forwardName;
        long forwardFrom;
        int forwardDate;
        int dc;
        long size;
    }

    static Facts facts(Object message) {
        Facts facts = new Facts();
        facts.id = id(message);
        facts.chat = dialog(message);
        facts.sender = sender(message);
        facts.date = date(message);
        facts.edited = edited(message);
        facts.forwarded = forwarded(message);
        if (facts.forwarded) {
            facts.forwardName = forwardName(message);
            facts.forwardFrom = forwardFrom(message);
            facts.forwardDate = forwardDate(message);
        }
        facts.dc = fileDc(message);
        facts.size = documentSize(message);
        if (facts.size <= 0) {
            ArrayList<?> sizes = photoSizes(message);
            if (sizes != null) {
                for (Object size : sizes) {
                    if (size != null) facts.size = Math.max(facts.size, photoSize(size));
                }
            }
        }
        return facts;
    }

    /** One fact a line. Dates are local time with seconds; a line with nothing to say is left out. */
    static String describe(Context context, Facts facts) {
        List<String> lines = new ArrayList<>();
        lines.add(L10n.f(context, "Message ID: %1$s", Integer.toString(facts.id)));
        lines.add(L10n.f(context, "Chat ID: %1$s", Long.toString(facts.chat)));
        if (facts.sender != 0) lines.add(L10n.f(context, "Sender ID: %1$s", Long.toString(facts.sender)));
        if (facts.date > 0) lines.add(L10n.f(context, "Sent: %1$s", time(context, facts.date)));
        if (facts.edited > 0) lines.add(L10n.f(context, "Edited: %1$s", time(context, facts.edited)));
        if (facts.forwarded) {
            String from = facts.forwardName != null && !facts.forwardName.isEmpty() ? facts.forwardName
                    : facts.forwardFrom != 0 ? Long.toString(facts.forwardFrom) : null;
            if (from != null) lines.add(L10n.f(context, "Forwarded from: %1$s", L10n.isolate(from)));
            if (facts.forwardFrom != 0) lines.add(L10n.f(context, "Original sender ID: %1$s", Long.toString(facts.forwardFrom)));
            if (facts.forwardDate > 0) lines.add(L10n.f(context, "Originally sent: %1$s", time(context, facts.forwardDate)));
        }
        if (facts.dc > 0) lines.add(L10n.f(context, "File data center: %1$s", Integer.toString(facts.dc)));
        if (facts.size > 0) lines.add(L10n.f(context, "File size: %1$s", Formatter.formatFileSize(context, facts.size)));
        return String.join("\n", lines);
    }

    private static String time(Context context, int seconds) {
        return DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM, L10n.locale(context))
                .format(new Date(seconds * 1000L));
    }

    private static void show(Context context, String text) {
        try {
            Pair<Dialog, LinearLayout> dialog = CustomDialog.create(context, L10n.t(context, "Message details"), text, null, null,
                    () -> {}, null, L10n.t(context, "Copy"), () -> copy(context, text), true);
            dialog.first.show();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "message details dialog", failure);
        }
    }

    private static void copy(Context context, String text) {
        try {
            Utils.setClipboard(context, L10n.t(context, "Message details"), text);
            Toast.makeText(context, L10n.t(context, "Message details copied"), Toast.LENGTH_SHORT).show();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "message details copy", failure);
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on(BooleanSetting setting) {
        HookStatus.invoked(FamilyNames.MESSAGE_MENU_REPEAT);
        try {
            return Utils.settingsReady() && setting.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "switch", failure);
            return false;
        }
    }

    /** The message the menu is open on. Replaced when patching. */
    public static Object selected(Object chat) { return null; }

    /** The selected message's album, or null. Replaced when patching. */
    public static ArrayList<?> grouped(Object chat) { return null; }

    /** Sends the messages to the chat as Telegram's forward panel does, sender hidden. Replaced when patching. */
    public static void send(Object chat, ArrayList<Object> messages) {}

    /** The activity the chat runs in. Replaced when patching. */
    public static android.app.Activity activity(Object chat) { return null; }

    /** Telegram's number for Forward in this menu. Replaced when patching. */
    public static int forwardOption() { return -1; }

    /** The type Telegram gives article messages. Replaced when patching. */
    public static int article() { return -1; }

    /** Telegram's icons for the items. Replaced when patching. */
    public static int repeatIcon() { return 0; }
    public static int copyIcon() { return 0; }
    public static int detailsIcon() { return 0; }

    /** A photo you can see, not one the age filter keeps hidden. Replaced when patching. */
    public static boolean photo(Object message) { return false; }

    /** Where you sent the photo from, or null. Replaced when patching. */
    public static String attachPath(Object message) { return null; }

    /** Where Telegram keeps the photo once it's downloaded. Replaced when patching. */
    public static File photoFile(Object message) { return null; }

    /** A content link to the file from Telegram's own file provider. Replaced when patching. */
    public static Uri uri(Context context, File file) { return null; }

    /** Whether the message's chat takes new messages from you. Replaced when patching. */
    public static boolean canSend(Object message) { return false; }

    /** A poll, a to-do list, paid media, hidden sensitive media, a service message or an unsent one. Replaced when patching. */
    public static boolean blocked(Object message) { return true; }

    /** Whether the message's account has Premium. Replaced when patching. */
    public static boolean premium(Object message) { return false; }

    /** The message's Telegram type. Replaced when patching. */
    public static int type(Object message) { return 0; }

    /** The details, each replaced when patching. */
    public static int id(Object message) { return 0; }
    public static long dialog(Object message) { return 0L; }
    public static long sender(Object message) { return 0L; }
    public static int date(Object message) { return 0; }
    public static int edited(Object message) { return 0; }
    public static boolean forwarded(Object message) { return false; }
    public static String forwardName(Object message) { return null; }
    public static long forwardFrom(Object message) { return 0L; }
    public static int forwardDate(Object message) { return 0; }
    public static int fileDc(Object message) { return 0; }
    public static long documentSize(Object message) { return 0L; }
    public static ArrayList<?> photoSizes(Object message) { return null; }
    public static int photoSize(Object size) { return 0; }
}
