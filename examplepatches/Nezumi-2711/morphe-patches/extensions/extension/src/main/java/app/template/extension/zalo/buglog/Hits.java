package app.template.extension.zalo.buglog;

/**
 * Hook breadcrumbs. The Bug log patch inserts {@code invoke-static {}, Hits->camelCaseId()V} at the
 * start of every Zalo method a patch hooks; a call with no arguments needs no free register, so it
 * cannot clobber Zalo's. Each logs {@code I/<id>/Hook hook fired} once per process, which tells the
 * developer whether a patch's hook ran at all. One method per {@link Patch} except {@link Patch#CORE};
 * the name is the id in camelCase ({@code keep-recalled-messages} is {@code keepRecalledMessages}).
 */
public final class Hits {
    private Hits() { }

    public static void amoledDarkTheme() {
        NezumiLog.hit(Patch.AMOLED_DARK_THEME);
    }

    public static void bugLog() {
        NezumiLog.hit(Patch.BUG_LOG);
    }

    public static void bypassConversationProtection() {
        NezumiLog.hit(Patch.BYPASS_CONVERSATION_PROTECTION);
    }

    public static void callRecording() {
        NezumiLog.hit(Patch.CALL_RECORDING);
    }

    public static void chatHeadsInsteadOfAndroidBubbles() {
        NezumiLog.hit(Patch.CHAT_HEADS_INSTEAD_OF_ANDROID_BUBBLES);
    }

    public static void chatReactionPicker() {
        NezumiLog.hit(Patch.CHAT_REACTION_PICKER);
    }

    public static void clonePackage() {
        NezumiLog.hit(Patch.CLONE_PACKAGE);
    }

    public static void customFont() {
        NezumiLog.hit(Patch.CUSTOM_FONT);
    }

    public static void customSounds() {
        NezumiLog.hit(Patch.CUSTOM_SOUNDS);
    }

    public static void driveBackupViaMicrog() {
        NezumiLog.hit(Patch.DRIVE_BACKUP_VIA_MICROG);
    }

    public static void hideBusinessBoxInMessages() {
        NezumiLog.hit(Patch.HIDE_BUSINESS_BOX_IN_MESSAGES);
    }

    public static void hideDiscoveryTab() {
        NezumiLog.hit(Patch.HIDE_DISCOVERY_TAB);
    }

    public static void hideMediaBoxInMessages() {
        NezumiLog.hit(Patch.HIDE_MEDIA_BOX_IN_MESSAGES);
    }

    public static void hideOaAccountsInMessages() {
        NezumiLog.hit(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES);
    }

    public static void hideAdsInMessages() {
        NezumiLog.hit(Patch.HIDE_ADS_IN_MESSAGES);
    }

    public static void hideDeliveryReceipts() {
        NezumiLog.hit(Patch.HIDE_DELIVERY_RECEIPTS);
    }

    public static void hideFeedAds() {
        NezumiLog.hit(Patch.HIDE_FEED_ADS);
    }

    public static void hideReadReceipts() {
        NezumiLog.hit(Patch.HIDE_READ_RECEIPTS);
    }

    public static void hideTextTyping() {
        NezumiLog.hit(Patch.HIDE_TEXT_TYPING);
    }

    public static void keepRecalledMessages() {
        NezumiLog.hit(Patch.KEEP_RECALLED_MESSAGES);
    }

    public static void markAsReadFromNotifications() {
        NezumiLog.hit(Patch.MARK_AS_READ_FROM_NOTIFICATIONS);
    }

    public static void nativeSignatureFix() {
        NezumiLog.hit(Patch.NATIVE_SIGNATURE_FIX);
    }

    public static void openLinksInExternalBrowser() {
        NezumiLog.hit(Patch.OPEN_LINKS_IN_EXTERNAL_BROWSER);
    }

    public static void saveMedia() {
        NezumiLog.hit(Patch.SAVE_MEDIA);
    }

    public static void sendPhotosInOriginalQuality() {
        NezumiLog.hit(Patch.SEND_PHOTOS_IN_ORIGINAL_QUALITY);
    }

    public static void unlimitedQuickMessages() {
        NezumiLog.hit(Patch.UNLIMITED_QUICK_MESSAGES);
    }

    public static void viewOnlineStatusPrivately() {
        NezumiLog.hit(Patch.VIEW_ONLINE_STATUS_PRIVATELY);
    }
}
