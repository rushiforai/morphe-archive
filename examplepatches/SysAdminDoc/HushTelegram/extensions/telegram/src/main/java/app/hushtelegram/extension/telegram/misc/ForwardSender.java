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
 * still turn it back off before sending. Telegram keeps the option behind Premium for article
 * messages, and those forwards stay as Telegram sets them.
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
            if (!fresh(params)) return;
            int[] types = new int[messages.size()];
            for (int i = 0; i < types.length; i++) types[i] = type(messages.get(i));
            if (!hides(premium(messages.get(0)), article(), types)) {
                HookStatus.counted(FamilyNames.FORWARD_HIDE_SENDER, "left for Premium");
                return;
            }
            hide(params);
            HookStatus.counted(FamilyNames.FORWARD_HIDE_SENDER, "sender hidden");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FORWARD_HIDE_SENDER, "forward", failure);
        }
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
}
