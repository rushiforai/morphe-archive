/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import java.io.File;
import android.widget.Toast;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.List;

/**
 * The long-press menu items that forward with a choice (Fast forward, Forward to Saved Messages),
 * each behind its own switch under Add Repeat to the message menu. {@link MessageMenu} hands them
 * the menu's lists as it finishes and the chosen number as it comes back.
 *
 * <p>Both go through Telegram's own forward with its two flags: the sender's name hidden (Telegram's
 * "forward from my name" argument) and captions dropped. They only show next to Telegram's own
 * Forward, so a chat that doesn't allow forwarding never gets them.
 */
public final class MessageMenuTools {
    private MessageMenuTools() {}

    static final int FAST_FORWARD = 0x48544d0a;
    static final int FORWARD_SAVED = 0x48544d0b;
    static final int SAVE_COVER = 0x48544d08;
    static final int SAVE_ART = 0x48544d09;
    static final int CLEAR_CACHE = 0x48544d0c;

    /** Whether the number is one of this class's. */
    static boolean owns(int option) {
        return option == FAST_FORWARD || option == FORWARD_SAVED || option == SAVE_COVER || option == SAVE_ART || option == CLEAR_CACHE;
    }

    static BooleanSetting setting(int option) {
        return option == FAST_FORWARD ? Settings.MESSAGE_MENU_FAST_FORWARD
                : option == SAVE_COVER ? Settings.MESSAGE_MENU_SAVE_COVER
                : option == SAVE_ART ? Settings.MESSAGE_MENU_SAVE_ART
                : option == CLEAR_CACHE ? Settings.MESSAGE_MENU_CLEAR_CACHE : Settings.MESSAGE_MENU_FORWARD_SAVED;
    }

    /** Whether any of this class's switches is on. */
    static boolean any() {
        return MessageMenu.on(Settings.MESSAGE_MENU_FAST_FORWARD) || MessageMenu.on(Settings.MESSAGE_MENU_FORWARD_SAVED)
                || MessageMenu.on(Settings.MESSAGE_MENU_SAVE_COVER) || MessageMenu.on(Settings.MESSAGE_MENU_SAVE_ART)
                || MessageMenu.on(Settings.MESSAGE_MENU_CLEAR_CACHE);
    }

    /** One way to forward: a label, and the two flags Telegram's forward takes. */
    static final class Way {
        final String label;
        final boolean hideSender;
        final boolean hideCaption;

        Way(String label, boolean hideSender, boolean hideCaption) {
            this.label = label;
            this.hideSender = hideSender;
            this.hideCaption = hideCaption;
        }
    }

    /**
     * Puts the items whose switches let them in just before Message details, or last. The lists stay in
     * step, so a menu whose lists already differ is left alone, and so is an empty one.
     *
     * @param forwardable whether Telegram offered its own Forward for this message
     */
    static void offer(Object chat, Object message, List<Object> icons, List<Object> items, List<Object> options, boolean forwardable) {
        if (options.isEmpty() || icons.size() != items.size() || items.size() != options.size()) return;
        List<Integer> chosen = new ArrayList<>();
        if (forwardable && MessageMenu.quickable(chat, message)) {
            ArrayList<Object> batch = MessageMenu.batch(chat, message);
            if (MessageMenu.on(Settings.MESSAGE_MENU_FAST_FORWARD) && !fastWays(message, batch).isEmpty()) chosen.add(FAST_FORWARD);
            if (MessageMenu.on(Settings.MESSAGE_MENU_FORWARD_SAVED) && savedAvailable(message)) chosen.add(FORWARD_SAVED);
        }
        if (MessageMenu.on(Settings.MESSAGE_MENU_SAVE_COVER) && savable(message) && video(message) && MediaArt.hasVideoArt(message)) chosen.add(SAVE_COVER);
        if (MessageMenu.on(Settings.MESSAGE_MENU_SAVE_ART) && savable(message) && music(message) && MediaArt.hasMusicArt(message)) chosen.add(SAVE_ART);
        if (MessageMenu.on(Settings.MESSAGE_MENU_CLEAR_CACHE) && clearable(message)) chosen.add(CLEAR_CACHE);
        int at = options.indexOf(MessageMenu.DETAILS);
        for (int option : chosen) {
            int position = at < 0 ? options.size() : at++;
            icons.add(position, option == SAVE_COVER || option == SAVE_ART ? saveIcon()
                    : option == CLEAR_CACHE ? deleteIcon() : MessageMenu.quickIcon());
            items.add(position, label(option));
            options.add(position, option);
        }
    }

    private static String label(int option) {
        return option == FAST_FORWARD ? L10n.t("Fast forward")
                : option == SAVE_COVER ? L10n.t("Save video cover")
                : option == SAVE_ART ? L10n.t("Save album art")
                : option == CLEAR_CACHE ? L10n.t("Clear from cache") : L10n.t("Forward to Saved Messages");
    }

    /** A message whose chat doesn't allow saving only gets a save item when Save to Downloads' switch for protected chats is on. */
    static boolean savable(Object message) {
        return !MessageMenu.restricted(message) || MessageMenu.on(Settings.MESSAGE_MENU_SAVE_PROTECTED);
    }

    /** Clear from cache is offered on a video or a file. */
    static boolean clearable(Object message) {
        return video(message) || MessageMenu.documentName(message) != null;
    }

    /** Whether any message in the batch carries a photo or a file, so a caption can be dropped. */
    static boolean captioned(ArrayList<Object> batch) {
        for (Object each : batch) {
            if (MessageMenu.media(each)) return true;
        }
        return false;
    }

    /** Whether Telegram lets this message's sender be hidden: its own Premium rule for articles. */
    static boolean senderHideable(Object message, ArrayList<Object> batch) {
        int[] types = new int[batch.size()];
        for (int i = 0; i < types.length; i++) types[i] = MessageMenu.type(batch.get(i));
        return ForwardSender.hides(MessageMenu.premium(message), MessageMenu.article(), types);
    }

    /** What Fast forward offers: the two things Quick forward can't do on their own. Empty when neither applies. */
    static List<Way> fastWays(Object message, ArrayList<Object> batch) {
        List<Way> ways = new ArrayList<>();
        boolean sender = senderHideable(message, batch);
        boolean caption = captioned(batch);
        if (sender) ways.add(new Way(L10n.t("Without sender name"), true, false));
        if (caption) ways.add(new Way(L10n.t("Without caption"), false, true));
        if (sender && caption) ways.add(new Way(L10n.t("Without sender name or caption"), true, true));
        return ways;
    }

    /** Forward to Saved Messages: your own chat, unless the message is already in it. */
    static boolean savedAvailable(Object message) {
        long self = MessageMenu.selfId(MessageMenu.account(message));
        return self != 0 && self != MessageMenu.dialog(message) && MessageMenu.reachable(MessageMenu.account(message), self);
    }

    /** What Forward to Saved Messages offers: as is, then each way Telegram's forward can drop something. */
    static List<Way> savedWays(Object message, ArrayList<Object> batch) {
        List<Way> ways = new ArrayList<>();
        ways.add(new Way(L10n.t("Forward as is"), MessageMenu.hidesSender(message, batch), false));
        ways.addAll(fastWays(message, batch));
        return ways;
    }

    /** Runs the chosen item. */
    static void choose(Context context, Object chat, Object message, int option) {
        ArrayList<Object> batch = MessageMenu.batch(chat, message);
        int account = MessageMenu.account(message);
        long from = MessageMenu.dialog(message);
        if (option == SAVE_COVER) {
            MediaArt.saveVideo(context, message);
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "video cover save started");
            return;
        }
        if (option == SAVE_ART) {
            MediaArt.saveMusic(context, message);
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "album art save started");
            return;
        }
        if (option == CLEAR_CACHE) {
            CacheClear.clear(context, message);
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "clear from cache started");
            return;
        }
        if (option == FAST_FORWARD) {
            List<Way> ways = fastWays(message, batch);
            Utils.runOnMainThread(() -> MessageMenu.chooseRow(context, L10n.t(context, "Fast forward"), labels(ways),
                    Settings.MESSAGE_MENU_FAST_FORWARD, index -> MessageMenu.chooseChat(context, account, from, L10n.t(context, "Forward to"),
                            Settings.MESSAGE_MENU_FAST_FORWARD, destination -> forward(context, account, destination, batch, ways.get(index), Settings.MESSAGE_MENU_FAST_FORWARD))));
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "fast forward opened");
        } else {
            long self = MessageMenu.selfId(account);
            List<Way> ways = savedWays(message, batch);
            MessageMenu.Destination saved = new MessageMenu.Destination(self, MessageMenu.title(account, self));
            Utils.runOnMainThread(() -> MessageMenu.chooseRow(context, L10n.t(context, "Forward to Saved Messages"), labels(ways),
                    Settings.MESSAGE_MENU_FORWARD_SAVED, index -> forward(context, account, saved, batch, ways.get(index), Settings.MESSAGE_MENU_FORWARD_SAVED)));
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "forward to saved messages opened");
        }
    }

    private static List<String> labels(List<Way> ways) {
        List<String> labels = new ArrayList<>();
        for (Way way : ways) labels.add(way.label);
        return labels;
    }

    static void forward(Context context, int account, MessageMenu.Destination destination, ArrayList<Object> batch, Way way, BooleanSetting guard) {
        if (!MessageMenu.on(guard)) return;
        try {
            int result = forwardWith(account, batch, destination.id, way.hideSender, way.hideCaption);
            String said = result == 0
                    ? L10n.f(context, "Forwarding to %1$s", L10n.isolate(destination.title))
                    : L10n.t(context, "Can't forward there");
            Toast.makeText(context, said, Toast.LENGTH_SHORT).show();
            if (result == 0) HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "forwarded with a choice");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "forward with a choice", failure);
            Toast.makeText(context, L10n.t(context, "Can't forward there"), Toast.LENGTH_SHORT).show();
        }
    }

    /** Whether the message is a video Telegram shows with a play button. Replaced when patching. */
    public static boolean video(Object message) { return false; }

    /** Whether the message is a song. Replaced when patching. */
    public static boolean music(Object message) { return false; }

    /** The message's thumbnail sizes, or its video cover's sizes when cover is 1. Null when there are none. Replaced when patching. */
    public static ArrayList<?> thumbs(Object message, int cover) { return null; }

    /** Telegram's copy of a thumbnail size, in its media folder or its cache folder (force 1). Replaced when patching. */
    public static File thumbFile(Object message, Object size, int force) { return null; }

    /** Asks Telegram to fetch a thumbnail size, from the video's cover when cover is 1. Replaced when patching. */
    public static void thumbLoad(Object message, Object size, int cover) {}

    /** Telegram's name for the message's file, which its cache files are named from. Null when it has none. Replaced when patching. */
    public static String attachName(Object message) { return null; }

    /** Stops a running download of the message's file. Replaced when patching. */
    public static void cancelLoad(Object message) {}

    /** One of Telegram's folders by its number (0 images, 1 audio, 2 video, 3 documents, 4 cache). Replaced when patching. */
    public static File directory(int type) { return null; }

    /** Tells the open chat the message's file is gone so the cell shows its download arrow. Replaced when patching. */
    public static void refreshMedia(Object message, String name) {}

    /** The icon beside Clear from cache. Replaced when patching. */
    public static int deleteIcon() { return 0; }

    /** The icon beside Save items. Replaced when patching. */
    public static int saveIcon() { return 0; }

    /** Telegram's own forward of the messages into the chat, sound on, now, with the sender and captions as asked. 0 for sent. Replaced when patching. */
    public static int forwardWith(int account, ArrayList<Object> messages, long dialog, boolean hideSender, boolean hideCaption) { return 1; }
}
