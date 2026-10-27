/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.net.Uri;
import android.text.format.Formatter;
import android.util.Pair;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
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
    static final int QUICK_FORWARD = 0x48544d04;

    /** How many chats Quick forward lists, Saved Messages first. */
    static final int QUICK_CHATS = 5;
    /** How far down the chat list Quick forward looks for them. */
    private static final int QUICK_SCAN = 200;

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
        boolean quick = on(Settings.MESSAGE_MENU_QUICK_FORWARD);
        boolean history = KeepEdits.on();
        if (!repeat && !copy && !details && !quick && !history || icons == null || items == null || options == null) return;
        try {
            Object message = selected(chat);
            if (message == null) return;
            // Keep edit history shows a message's earlier text in Message details, with or without that switch.
            details = details || history && !earlier(message).isEmpty();
            boolean forwardable = options.contains(forwardOption());
            repeat = repeat && forwardable && repeatable(chat, message);
            copy = copy && forwardable && photo(message) && downloaded(message) != null;
            quick = quick && forwardable && quickable(chat, message);
            offer(icons, items, options, repeat, copy, details, quick, forwardOption());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "message menu", failure);
        }
    }

    /** Asked first when an option is chosen. Telegram's own numbers pass by untouched. */
    public static void chosen(Object chat, int option) {
        if (option != REPEAT && option != DETAILS && option != COPY_PHOTO && option != QUICK_FORWARD) return;
        Context context = null;
        try {
            if (!Utils.settingsReady()) return;
            BooleanSetting setting = option == REPEAT ? Settings.MESSAGE_MENU_REPEAT
                    : option == DETAILS ? Settings.MESSAGE_MENU_DETAILS
                    : option == COPY_PHOTO ? Settings.MESSAGE_MENU_COPY_PHOTO : Settings.MESSAGE_MENU_QUICK_FORWARD;
            if (!on(setting) && !(option == DETAILS && KeepEdits.on())) return;
            context = Utils.getContext();
            Context host = activity(chat);
            if (host != null) context = host;
            Object message = selected(chat);
            if (message == null) {
                feedback(context, failureMessage(context, option));
                return;
            }
            if (option == REPEAT) {
                ArrayList<Object> batch = batch(chat, message);
                // Sent once the menu has closed, the way Telegram's own forward panel sends.
                Context target = context;
                Utils.runOnMainThread(() -> repeat(target, chat, batch));
            } else if (option == QUICK_FORWARD) {
                ArrayList<Object> batch = batch(chat, message);
                int account = account(message);
                long from = dialog(message);
                boolean hide = hidesSender(message, batch);
                Context target = context;
                Utils.runOnMainThread(() -> chooseChat(target, account, from, batch, hide));
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "quick forward opened");
            } else if (option == COPY_PHOTO) {
                File file = downloaded(message);
                if (file == null) {
                    feedback(context, L10n.t(context, "Couldn't copy that. Try again."));
                    return;
                }
                copyPhoto(context, file);
            } else {
                String text = describe(context, facts(message));
                Context target = context;
                Utils.runOnMainThread(() -> show(target, text));
                HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "message details shown");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "message menu choice", failure);
            feedback(context, failureMessage(context, option));
        }
    }

    private static String failureMessage(Context context, int option) {
        return option == COPY_PHOTO ? L10n.t(context, "Couldn't copy that. Try again.")
                : option == QUICK_FORWARD ? L10n.t(context, "Can't forward there")
                : L10n.t(context, "Couldn't complete that action. Try again.");
    }

    private static void feedback(Context context, String message) {
        if (context == null) return;
        Utils.runOnMainThreadNowOrLater(() ->
                Toast.makeText(context, message, Toast.LENGTH_SHORT).show());
    }

    private static void repeat(Context context, Object chat, ArrayList<Object> batch) {
        if (!on(Settings.MESSAGE_MENU_REPEAT)) return;
        try {
            send(chat, batch);
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "message repeated");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "repeat message", failure);
            feedback(context, L10n.t(context, "Couldn't complete that action. Try again."));
        }
    }

    /**
     * Puts the items whose switches let them in: Quick forward, Repeat and Copy photo right after
     * Forward in that order, Message details last. The three lists stay in step, so a menu whose lists already differ is left
     * alone, and so is an empty one, which Telegram doesn't open at all.
     */
    static void offer(List<Object> icons, List<Object> items, List<Object> options, boolean repeat, boolean copy, boolean details, boolean quick, int forward) {
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
        if (at >= 0 && quick) {
            int icon = quickIcon();
            String label = L10n.t("Quick forward");
            icons.add(at + 1, icon);
            items.add(at + 1, label);
            options.add(at + 1, QUICK_FORWARD);
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

    /** Whether Quick forward fits this message: nothing in its batch Telegram won't forward, and not a secret chat. */
    static boolean quickable(Object chat, Object message) {
        if (secret(dialog(message))) return false;
        for (Object each : batch(chat, message)) {
            if (blocked(each)) return false;
        }
        return true;
    }

    /** Sender names stay shown unless Hide sender names when forwarding is on, and Telegram's own rule for articles still holds. */
    static boolean hidesSender(Object message, ArrayList<Object> batch) {
        if (!ForwardSender.on()) return false;
        int[] types = new int[batch.size()];
        for (int i = 0; i < types.length; i++) types[i] = type(batch.get(i));
        return ForwardSender.hides(premium(message), article(), types);
    }

    /** A chat Quick forward can offer. */
    static final class Destination {
        final long id;
        final String title;

        Destination(long id, String title) {
            this.id = id;
            this.title = title;
        }
    }

    /**
     * Saved Messages, then the chats at the top of the list that take new messages, up to
     * {@link #QUICK_CHATS}. Secret chats, forums and anywhere Telegram wouldn't let you write are left
     * out, and so is the chat the message is already in.
     */
    static List<Destination> destinations(int account, long from) {
        List<Destination> found = new ArrayList<>();
        long self = selfId(account);
        if (self != 0 && self != from && reachable(account, self)) found.add(new Destination(self, title(account, self)));
        ArrayList<?> dialogs = dialogs(account);
        if (dialogs == null) return found;
        int scanned = 0;
        for (Object dialog : dialogs) {
            if (found.size() >= QUICK_CHATS || scanned++ >= QUICK_SCAN) break;
            if (dialog == null) continue;
            long id = dialogId(dialog);
            if (id == 0 || id == from || id == self || secret(id) || !reachable(account, id)) continue;
            String name = title(account, id);
            if (name != null && !name.isEmpty()) found.add(new Destination(id, name));
        }
        return found;
    }

    /** The list of chats to forward to, a row each. */
    private static void chooseChat(Context context, int account, long from, ArrayList<Object> batch, boolean hide) {
        if (!on(Settings.MESSAGE_MENU_QUICK_FORWARD)) return;
        try {
            List<Destination> where = destinations(account, from);
            if (where.isEmpty()) {
                Toast.makeText(context, L10n.t(context, "No chat to forward to"), Toast.LENGTH_SHORT).show();
                return;
            }
            LinearLayout rows = new LinearLayout(context);
            rows.setOrientation(LinearLayout.VERTICAL);
            Pair<Dialog, LinearLayout> dialog = CustomDialog.createWithContent(context,
                    L10n.t(context, "Forward to"), rows, () -> {});
            Context themed = dialog.second.getContext();
            int pad = Math.round(16 * themed.getResources().getDisplayMetrics().density);
            for (Destination destination : where) {
                Button row = new Button(themed, null, 0);
                row.setText(destination.title);
                row.setAllCaps(false);
                row.setTextSize(16f);
                row.setTextColor(Utils.getAppForegroundColor());
                row.setTextDirection(View.TEXT_DIRECTION_LOCALE);
                row.setLayoutDirection(themed.getResources().getConfiguration().getLayoutDirection());
                row.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
                row.setSingleLine(false);
                row.setMaxLines(Integer.MAX_VALUE);
                row.setEllipsize(null);
                row.setPadding(pad, pad / 2, pad, pad / 2);
                int height = Math.round(48 * themed.getResources().getDisplayMetrics().density);
                row.setMinHeight(height);
                row.setMinimumHeight(height);
                row.setFocusable(true);
                row.setBackground(destinationBackground(themed));
                row.setOnClickListener((View view) -> {
                    dialog.first.dismiss();
                    forward(context, account, destination, batch, hide);
                });
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                params.topMargin = rows.getChildCount() == 0 ? 0 : pad / 2;
                rows.addView(row, params);
            }
            dialog.first.show();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "quick forward list", failure);
            feedback(context, L10n.t(context, "Can't forward there"));
        }
    }

    private static RippleDrawable destinationBackground(Context context) {
        int foreground = Utils.getAppForegroundColor();
        float density = context.getResources().getDisplayMetrics().density;
        StateListDrawable states = new StateListDrawable();
        for (int state : new int[]{android.R.attr.state_focused, android.R.attr.state_hovered, 0}) {
            GradientDrawable fill = new GradientDrawable();
            fill.setColor(Utils.getCancelOrNeutralButtonBackgroundColor());
            fill.setCornerRadius(8 * density);
            if (state != 0) fill.setStroke(Math.round((state == android.R.attr.state_focused ? 2 : 1) * density), foreground);
            states.addState(state == 0 ? new int[0] : new int[]{state}, fill);
        }
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(8 * density);
        return new RippleDrawable(ColorStateList.valueOf((foreground & 0x00ffffff) | 0x33000000), states, mask);
    }

    private static void forward(Context context, int account, Destination destination, ArrayList<Object> batch, boolean hide) {
        if (!on(Settings.MESSAGE_MENU_QUICK_FORWARD)) return;
        try {
            int result = forwardTo(account, batch, destination.id, hide);
            String said = result == 0
                    ? L10n.f(context, "Forwarding to %1$s", L10n.isolate(destination.title))
                    : L10n.t(context, "Can't forward there");
            Toast.makeText(context, said, Toast.LENGTH_SHORT).show();
            if (result == 0) HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "quick forwarded");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "quick forward", failure);
            feedback(context, L10n.t(context, "Can't forward there"));
        }
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
        try {
            Uri uri = uri(context, file);
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (uri == null || clipboard == null) {
                feedback(context, L10n.t(context, "Couldn't copy that. Try again."));
                return;
            }
            clipboard.setPrimaryClip(ClipData.newUri(context.getContentResolver(), L10n.t(context, "Copy photo"), uri));
            Toast.makeText(context, L10n.t(context, "Photo copied"), Toast.LENGTH_SHORT).show();
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "photo copied");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "photo copy", failure);
            feedback(context, L10n.t(context, "Couldn't copy that. Try again."));
        }
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
        List<KeepEdits.Version> earlier = new ArrayList<>();
    }

    /** What Keep edit history kept for the message, oldest first. */
    static List<KeepEdits.Version> earlier(Object message) {
        return KeepEdits.earlier(selfId(account(message)), dialog(message), id(message));
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
        facts.earlier = earlier(message);
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
        for (KeepEdits.Version version : facts.earlier) {
            lines.add(L10n.f(context, "Before the edit at %1$s: %2$s", time(context, version.replaced), L10n.isolate(version.text)));
        }
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
            feedback(context, L10n.t(context, "Couldn't complete that action. Try again."));
        }
    }

    private static void copy(Context context, String text) {
        try {
            Utils.setClipboard(context, L10n.t(context, "Message details"), text);
            Toast.makeText(context, L10n.t(context, "Message details copied"), Toast.LENGTH_SHORT).show();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "message details copy", failure);
            feedback(context, L10n.t(context, "Couldn't copy that. Try again."));
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
    public static int quickIcon() { return 0; }
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

    /** The account the message belongs to. Replaced when patching. */
    public static int account(Object message) { return 0; }

    /** The signed-in account's own user ID, which is the chat Saved Messages lives in. Replaced when patching. */
    public static long selfId(int account) { return 0L; }

    /** The account's chat list, most recent first, or null. Replaced when patching. */
    public static ArrayList<?> dialogs(int account) { return null; }

    /** A chat list entry's ID. Replaced when patching. */
    public static long dialogId(Object dialog) { return 0L; }

    /** Whether the ID is a secret chat's. Replaced when patching. */
    public static boolean secret(long dialog) { return true; }

    /** Whether the account can write to the chat, and it isn't a forum. Replaced when patching. */
    public static boolean reachable(int account, long dialog) { return false; }

    /** The chat's name, Telegram's own Saved Messages label for your own. Replaced when patching. */
    public static String title(int account, long dialog) { return null; }

    /** Telegram's own forward of the messages into the chat, sound on, now. Returns its result, 0 for sent. Replaced when patching. */
    public static int forwardTo(int account, ArrayList<Object> messages, long dialog, boolean hideSender) { return 1; }

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
