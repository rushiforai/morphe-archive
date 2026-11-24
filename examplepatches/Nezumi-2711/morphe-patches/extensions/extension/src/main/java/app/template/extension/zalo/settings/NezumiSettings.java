package app.template.extension.zalo.settings;

import android.view.View;

/**
 * Entry points that add the Nezumi's Settings row to Zalo's own settings screens.
 * Each patch calls the attach method for its feature; the page groups whatever was attached.
 */
public final class NezumiSettings {
    private NezumiSettings() { }

    public static void attachReaction(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_REACTION);
    }

    public static void attachTyping(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_TYPING);
    }

    public static void attachReadReceipts(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_READ_RECEIPTS);
    }

    public static void attachDeliveryReceipts(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_DELIVERY_RECEIPTS);
    }

    public static void attachMediaBox(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_MEDIA_BOX);
    }

    public static void attachBusinessBox(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_BUSINESS_BOX);
    }

    public static void attachOAMessages(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_OA_MESSAGES);
    }

    public static void attachMessageAds(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_MESSAGE_ADS);
    }

    public static void attachFeedAds(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_FEED_ADS);
    }

    public static void attachRecalledMessages(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_RECALLED_MESSAGES);
    }

    public static void attachOnlineStatus(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_ONLINE_STATUS);
    }

    public static void attachDiscovery(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_DISCOVERY);
    }

    public static void attachCustomFont(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_CUSTOM_FONT);
    }

    public static void attachCustomSounds(View root, View anchor) {
        NezumiSettingsPage.attach(root, anchor, NezumiSettingsPage.FEATURE_CUSTOM_SOUNDS);
    }
}
