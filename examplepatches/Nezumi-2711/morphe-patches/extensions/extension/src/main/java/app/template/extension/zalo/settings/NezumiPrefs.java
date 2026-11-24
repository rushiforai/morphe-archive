package app.template.extension.zalo.settings;

import android.content.Context;
import android.content.SharedPreferences;

/** Shared-preference file and keys backing every Nezumi option. */
public final class NezumiPrefs {
    private NezumiPrefs() { }

    private static final String NAME = "nezumi_settings";
    public static final String REACTION = "unlock_icon_react";
    public static final String HIDE_TYPING = "hide_text_typing";
    public static final String HIDE_READ_RECEIPTS = "hide_read_receipts";
    public static final String HIDE_DELIVERY_RECEIPTS = "hide_delivery_receipts";
    public static final String HIDE_MEDIA_BOX = "hide_media_box";
    public static final String HIDE_BUSINESS_BOX = "hide_business_box";
    public static final String HIDE_OA_MESSAGES = "hide_oa_messages";
    public static final String MUTE_OA_MESSAGES = "mute_oa_messages";
    public static final String OA_MUTED_UIDS = "oa_muted_uids:";
    public static final String OA_KNOWN_UIDS = "oa_known_uids:";
    public static final String HIDE_MESSAGE_ADS = "hide_message_ads";
    public static final String HIDE_FEED_ADS = "hide_feed_ads";
    public static final String KEEP_RECALLED_MESSAGES = "keep_recalled_messages";
    public static final String HIDE_ONLINE_STATUS = "hide_online_status";
    public static final String HIDE_DISCOVERY = "hide_discovery";
    static final String SAVED_ONLINE_SHARING = "saved_online_sharing";

    public static SharedPreferences of(Context context) {
        return context.getSharedPreferences(NAME, Context.MODE_PRIVATE);
    }

    /** Reads a boolean option; a missing context means the option is treated as off. */
    public static boolean bool(Context context, String key, boolean fallback) {
        return context != null && of(context).getBoolean(key, fallback);
    }
}
