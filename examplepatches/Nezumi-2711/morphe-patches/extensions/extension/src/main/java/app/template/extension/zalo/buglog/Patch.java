package app.template.extension.zalo.buglog;

import java.util.HashMap;
import java.util.Map;

/**
 * Every Nezumi patch, so each bug-log line names the patch it came from. The id is the patch
 * name in kebab-case ("Keep recalled messages" is {@code keep-recalled-messages}); the Bug log
 * patch fails the build when an applied patch has no constant here, so add one with every new patch.
 *
 * <p>{@code owners} lists the extension code that belongs to the patch, relative to
 * {@code app.template.extension.zalo}: {@code "pkg."} for a package, {@code "pkg.Class"} for a
 * class (and its nested classes), {@code "pkg.Class#method"} for one method of a class several
 * patches share. Crash attribution uses it to name the patch whose extension code was on the stack;
 * anything unlisted is {@link #CORE}.
 */
public enum Patch {
    /** Shared code: settings page, UI helpers, Zalo environment lookups, the bug log itself. */
    CORE("core", "settings.", "ui.", "shared."),
    AMOLED_DARK_THEME("amoled-dark-theme", "appearance.AmoledTheme"),
    BUG_LOG("bug-log", "buglog."),
    BYPASS_CONVERSATION_PROTECTION("bypass-conversation-protection", "chat.ChatOptions#isConversationProtectionBypassed"),
    CALL_RECORDING("call-recording", "call."),
    CHAT_HEADS_INSTEAD_OF_ANDROID_BUBBLES("chat-heads-instead-of-android-bubbles", "chat.ChatHeadAction"),
    CHAT_REACTION_PICKER("chat-reaction-picker", "chat.ChatOptions#isReactionEnabled"),
    CLONE_PACKAGE("clone-package"),
    CUSTOM_FONT("custom-font", "appearance.CustomFont", "appearance.NativeFontObserver"),
    CUSTOM_SOUNDS("custom-sounds", "sound."),
    DRIVE_BACKUP_VIA_MICROG("drive-backup-via-microg", "backup."),
    HIDE_BUSINESS_BOX_IN_MESSAGES("hide-business-box-in-messages", "messages.MessagesTab#isBusinessBoxHidden"),
    HIDE_DISCOVERY_TAB("hide-discovery-tab", "navigation.DiscoveryTab"),
    HIDE_MEDIA_BOX_IN_MESSAGES("hide-media-box-in-messages", "messages.MessagesTab#isMediaBoxHidden"),
    HIDE_OA_ACCOUNTS_IN_MESSAGES("hide-oa-accounts-in-messages", "messages.OfficialAccounts"),
    HIDE_ADS_IN_MESSAGES("hide-ads-in-messages", "messages.MessagesTab#isMessageAdsHidden"),
    HIDE_DELIVERY_RECEIPTS("hide-delivery-receipts", "chat.ChatOptions#isDeliveryReceiptsHidden"),
    HIDE_FEED_ADS("hide-feed-ads", "feed.FeedAds"),
    HIDE_READ_RECEIPTS("hide-read-receipts", "chat.ChatOptions#isReadReceiptsHidden", "chat.MarkAsRead"),
    HIDE_TEXT_TYPING("hide-text-typing", "chat.ChatOptions#isTypingHidden"),
    KEEP_RECALLED_MESSAGES("keep-recalled-messages", "chat.RecalledMessages"),
    MARK_AS_READ_FROM_NOTIFICATIONS("mark-as-read-from-notifications", "chat.NotificationMarkAsRead"),
    NATIVE_SIGNATURE_FIX("native-signature-fix"),
    OPEN_LINKS_IN_EXTERNAL_BROWSER("open-links-in-external-browser", "chat.ExternalLinks"),
    SAVE_MEDIA("save-media", "media."),
    SEND_PHOTOS_IN_ORIGINAL_QUALITY("send-photos-in-original-quality"),
    UNLIMITED_QUICK_MESSAGES("unlimited-quick-messages", "quickmessage."),
    VIEW_ONLINE_STATUS_PRIVATELY("view-online-status-privately", "chat.OnlineStatus");

    static final String EXTENSION_PACKAGE = "app.template.extension.zalo.";

    public final String id;
    private final String[] owners;

    Patch(String id, String... owners) {
        this.id = id;
        this.owners = owners;
    }

    private static volatile Map<String, Patch> ownerIndex;

    /** The patch with this id, or null. */
    static Patch byId(String id) {
        for (Patch patch : values()) {
            if (patch.id.equals(id)) return patch;
        }
        return null;
    }

    /**
     * The patch owning extension code at {@code className.methodName}, or null when the class is
     * not extension code. Unlisted extension code is {@link #CORE}.
     */
    static Patch ownerOf(String className, String methodName) {
        if (className == null || !className.startsWith(EXTENSION_PACKAGE)) return null;
        Map<String, Patch> index = ownerIndex;
        if (index == null) {
            index = new HashMap<>();
            for (Patch patch : values()) {
                for (String owner : patch.owners) index.put(owner, patch);
            }
            ownerIndex = index;
        }
        String relative = className.substring(EXTENSION_PACKAGE.length());
        int nested = relative.indexOf('$');
        String outer = nested >= 0 ? relative.substring(0, nested) : relative;
        if (methodName != null) {
            Patch byMethod = index.get(outer + '#' + methodName);
            if (byMethod != null) return byMethod;
        }
        Patch byClass = index.get(outer);
        if (byClass != null) return byClass;
        for (int dot = outer.lastIndexOf('.'); dot > 0; dot = outer.lastIndexOf('.', dot - 1)) {
            Patch byPackage = index.get(outer.substring(0, dot + 1));
            if (byPackage != null) return byPackage;
        }
        return CORE;
    }
}
