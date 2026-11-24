package app.template.extension.zalo.chat;

import android.content.Context;

import app.template.extension.zalo.settings.NezumiPrefs;

/** Simple on/off chat options read by the chat patches. */
public final class ChatOptions {
    private ChatOptions() { }

    public static boolean isReactionEnabled(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.REACTION, true);
    }

    public static boolean isTypingHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_TYPING, false);
    }

    public static boolean isReadReceiptsHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_READ_RECEIPTS, false);
    }

    public static boolean isDeliveryReceiptsHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_DELIVERY_RECEIPTS, false);
    }
}
