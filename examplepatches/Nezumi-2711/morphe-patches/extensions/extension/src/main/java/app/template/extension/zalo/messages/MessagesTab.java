package app.template.extension.zalo.messages;

import android.content.Context;

import app.template.extension.zalo.settings.NezumiPrefs;

/** Options that hide entries from the Messages tab list. */
public final class MessagesTab {
    private MessagesTab() { }

    public static boolean isMediaBoxHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_MEDIA_BOX, false);
    }

    public static boolean isBusinessBoxHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_BUSINESS_BOX, false);
    }

    public static boolean isMessageAdsHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_MESSAGE_ADS, false);
    }
}
