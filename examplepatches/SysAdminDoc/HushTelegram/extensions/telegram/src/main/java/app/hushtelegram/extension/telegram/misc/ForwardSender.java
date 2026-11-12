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
 * When you start forwarding, Telegram's preview has a Hide sender's name option that starts off.
 * With the switch on it starts on, so the copies arrive without the original author, and you can
 * still turn it back off before sending. The Share sheet's send menu starts the same way. A forward
 * the chat picker sends by itself, to several chats at once, has no option to turn and goes without
 * the sender. Forwards from the picker or the Share sheet to Saved Messages keep it (#70). Telegram
 * keeps the option behind Premium for article messages, and those forwards stay as Telegram sets them.
 */
public final class ForwardSender {
    private ForwardSender() {}

    /**
     * Asked when Telegram fills the forward preview, before it stores the messages.
     *
     * @param params Telegram's preview settings
     * @param messages the messages being forwarded, or null when the forward is cleared
     */
    public static void starts(Object params, ArrayList<?> messages) {
        if (messages == null || messages.isEmpty() || !on()) return;
        try {
            // A preview that already holds messages is being refreshed, and the user's choice stands.
            if (!fresh(params) || !hideable(messages)) return;
            hide(params);
            HookStatus.counted(FamilyNames.FORWARD_HIDE_SENDER, "sender hidden");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FORWARD_HIDE_SENDER, "forward", failure);
        }
    }

    /**
     * Asked right before the chat picker forwards by itself, without a preview to change.
     *
     * @param messages the messages being forwarded
     * @param peer the chat they go to
     * @param flag Telegram's Hide sender's name flag for the send, 0 for off
     * @return the flag the send goes with
     */
    public static boolean picked(ArrayList<?> messages, long peer, int flag) {
        boolean stock = flag != 0;
        if (stock || messages == null || messages.isEmpty() || !on()) return stock;
        try {
            // Saved Messages keeps where a message came from.
            if (peer == self(messages.get(0)) || !hideable(messages)) return false;
            HookStatus.counted(FamilyNames.FORWARD_HIDE_SENDER, "sender hidden");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FORWARD_HIDE_SENDER, "picker", failure);
            return false;
        }
    }

    /** Asked as a Share sheet is made, once it holds what it shares. */
    public static void shares(Object sheet) {
        try {
            ArrayList<?> messages = shareMessages(sheet);
            if (messages == null || messages.isEmpty() || !on() || !hideable(messages)) return;
            shareHide(sheet);
            HookStatus.counted(FamilyNames.FORWARD_HIDE_SENDER, "sender hidden");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FORWARD_HIDE_SENDER, "share", failure);
        }
    }

    /**
     * Asked right before the Share sheet forwards to each chat it was given. The sheet has one
     * flag for every chat, so Saved Messages gets the sender back here.
     *
     * @param messages the messages being forwarded
     * @param peer the chat they go to
     * @param flag the sheet's Hide sender's name flag for the send, 0 for off
     * @return the flag the send goes with
     */
    public static boolean shared(ArrayList<?> messages, long peer, int flag) {
        boolean stock = flag != 0;
        if (!stock || messages == null || messages.isEmpty() || !on()) return stock;
        try {
            if (peer != self(messages.get(0))) return true;
            HookStatus.counted(FamilyNames.FORWARD_HIDE_SENDER, "sender kept for Saved Messages");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FORWARD_HIDE_SENDER, "share send", failure);
            return true;
        }
    }

    /**
     * Asked as the Share sheet's send menu opens, where Telegram ticks Show sender's name again each
     * time. What you tap in the menu still goes.
     *
     * @param show the menu's Show sender's name item
     */
    public static void sharePopup(Object sheet, Object show) {
        try {
            ArrayList<?> messages = shareMessages(sheet);
            if (messages == null || messages.isEmpty() || !on() || !hideable(messages)) return;
            shareHide(sheet);
            shareUncheck(show);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FORWARD_HIDE_SENDER, "share menu", failure);
        }
    }

    /** Whether Telegram lets these messages go without their sender, counting the ones it doesn't. */
    private static boolean hideable(ArrayList<?> messages) {
        int[] types = new int[messages.size()];
        for (int i = 0; i < types.length; i++) types[i] = type(messages.get(i));
        if (hides(premium(messages.get(0)), article(), types)) return true;
        HookStatus.counted(FamilyNames.FORWARD_HIDE_SENDER, "left for Premium");
        return false;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.FORWARD_HIDE_SENDER);
        try {
            return Utils.settingsReady() && Settings.FORWARD_HIDE_SENDER.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FORWARD_HIDE_SENDER, "switch", failure);
            return false;
        }
    }

    /** Telegram lets anyone hide the sender, except a non-Premium account forwarding an article. */
    static boolean hides(boolean premium, int article, int... types) {
        if (premium) return true;
        for (int type : types) {
            if (type == article) return false;
        }
        return true;
    }

    /** Whether the preview holds no forward yet. Replaced when patching. */
    public static boolean fresh(Object params) { return false; }

    /** Whether the message's account has Premium. Replaced when patching. */
    public static boolean premium(Object message) { return false; }

    /** The message's Telegram type. Replaced when patching. */
    public static int type(Object message) { return 0; }

    /** The type Telegram gives article messages. Replaced when patching with the app's own number. */
    public static int article() { return -1; }

    /** Turns on the preview's Hide sender's name option. Replaced when patching. */
    public static void hide(Object params) {}

    /** The ID of the message's account, which is its Saved Messages chat. Replaced when patching. */
    public static long self(Object message) { return 0L; }

    /** The messages a Share sheet forwards, or null when it shares something else. Replaced when patching. */
    public static ArrayList<?> shareMessages(Object sheet) { return null; }

    /** Turns off the Share sheet's Show sender's name flag. Replaced when patching. */
    public static void shareHide(Object sheet) {}

    /** Unticks the send menu's Show sender's name item. Replaced when patching. */
    public static void shareUncheck(Object show) {}
}
