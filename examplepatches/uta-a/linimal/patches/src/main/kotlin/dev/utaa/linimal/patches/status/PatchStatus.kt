package dev.utaa.linimal.patches.status

/** 埋め込み patch-status レポートに書き込む安定した識別子。 */
enum class FeatureId(val value: String) {
    STATUS("linimal.status"),
    COMPONENT_REGISTRATION("linimal.component-registration"),
    EXTENSION("linimal.extension"),
    BOOTSTRAP("linimal.bootstrap"),
    SETTINGS("linimal.settings"),
    PREMIUM("linimal.premium"),
    PREMIUM_SETTINGS_ROW("linimal.premium-settings-row"),
    PREMIUM_PREVIEW_PROMOTION("linimal.premium-preview-promotion"),
    PREVIEW_SCROLL("linimal.preview-scroll"),
    AMOLED_THEME("linimal.amoled-theme"),
    SMART_CHANNEL_ADS("linimal.smart-channel-ads"),
    HOME_TOP_AD("linimal.home-top-ad"),
    AGENT_I_HOME_HEADER("linimal.agent-i-home-header"),
    AGENT_I_CHAT_INFORMATION("linimal.agent-i-chat-information"),
    AGENT_I_WALLET_HEADER("linimal.agent-i-wallet-header"),
    AGENT_I_SETTINGS("linimal.agent-i-settings"),
    AGENT_I_CHAT_COMPOSER("linimal.agent-i-chat-composer"),
    AGENT_I_CHAT_LIST_SEARCH("linimal.agent-i-chat-list-search"),
    LINE_AI_MESSAGE_CONTEXT_MENU("linimal.line-ai-message-context-menu"),
    LINE_AI_GALLERY_VIEWER("linimal.line-ai-gallery-viewer"),
    SHOPPING("linimal.shopping"),
    NEWS("linimal.news"),
    WALLET("linimal.wallet"),
    MINI("linimal.mini"),
    HOME_RECOMMENDATIONS("linimal.home-recommendations"),
    HOME_TRENDING("linimal.home-trending"),
    HOME_FEED_POST_CARDS("linimal.home-feed-post-cards"),
    HOME_FEATURED_COLLECTIONS("linimal.home-featured-collections"),
    HOME_FEED_LOADING_INDICATOR("linimal.home-feed-loading-indicator"),
    HOME_RECENT_HISTORY("linimal.home-recent-history"),
    CHAT_CALENDAR("linimal.chat-calendar"),
    CHAT_LINE_GIFT("linimal.chat-line-gift"),
    CHAT_LINE_PAY("linimal.chat-line-pay"),
    EXTERNAL_BROWSER("linimal.external-browser"),
    READ_RECEIPTS_MAIN_CHAT("linimal.read-receipts-main-chat"),
    READ_WITHOUT_RECEIPT("linimal.read-without-receipt"),
    NOTIFICATION_READ_WITHOUT_RECEIPT("linimal.chat.notification-read-without-receipt"),
    CHAT_LIST_HEADER_AI_FRIENDS("linimal.chat-list-header-ai-friends"),
    CHAT_LIST_HEADER_CALENDAR("linimal.chat-list-header-calendar"),
    CHAT_LIST_HEADER_OPEN_CHAT("linimal.chat-list-header-open-chat"),
    PUSH_NOTIFICATIONS("linimal.push-notifications"),
    GOOGLE_DRIVE_BACKUP("linimal.google-drive-backup"),
    PROBE("linimal.probe"),
    LINIMAL("linimal.core"),
}

enum class PatchId(val value: String, val featureId: FeatureId) {
    PATCH_STATUS_RESOURCE("linimal.patch.status-resource", FeatureId.STATUS),
    COMPONENT_REGISTRATION("linimal.patch.component-registration", FeatureId.COMPONENT_REGISTRATION),
    EXTENSION_MERGE("linimal.patch.extension-merge", FeatureId.EXTENSION),
    BOOTSTRAP("linimal.patch.bootstrap", FeatureId.BOOTSTRAP),
    SETTINGS_RESOURCE("linimal.patch.settings-resource", FeatureId.SETTINGS),
    SETTINGS_ENTRY("linimal.patch.settings-entry", FeatureId.SETTINGS),
    PREMIUM_UNSEND("linimal.patch.premium-unsend", FeatureId.PREMIUM),
    PREMIUM_SETTINGS_ROW("linimal.patch.premium-settings-row", FeatureId.PREMIUM_SETTINGS_ROW),
    PREMIUM_PREVIEW_PROMOTION(
        "linimal.patch.premium-preview-promotion",
        FeatureId.PREMIUM_PREVIEW_PROMOTION,
    ),
    PREVIEW_SCROLL("linimal.patch.preview-scroll", FeatureId.PREVIEW_SCROLL),
    AMOLED_THEME_COLORS("linimal.patch.amoled-theme-colors", FeatureId.AMOLED_THEME),
    MAIN_TAB_SHOPPING("linimal.patch.main-tab-shopping", FeatureId.SHOPPING),
    MAIN_TAB_NEWS("linimal.patch.main-tab-news", FeatureId.NEWS),
    MAIN_TAB_WALLET("linimal.patch.main-tab-wallet", FeatureId.WALLET),
    MAIN_TAB_MINI("linimal.patch.main-tab-mini", FeatureId.MINI),
    CHAT_MENU_CALENDAR("linimal.patch.chat-menu-calendar", FeatureId.CHAT_CALENDAR),
    CHAT_MENU_LINE_GIFT("linimal.patch.chat-menu-line-gift", FeatureId.CHAT_LINE_GIFT),
    CHAT_MENU_LINE_PAY("linimal.patch.chat-menu-line-pay", FeatureId.CHAT_LINE_PAY),
    AGENT_I_HOME_HEADER(
        "linimal.patch.agent-i-home-header",
        FeatureId.AGENT_I_HOME_HEADER,
    ),
    AGENT_I_CHAT_INFORMATION_ENTRY(
        "linimal.patch.agent-i-chat-information-entry",
        FeatureId.AGENT_I_CHAT_INFORMATION,
    ),
    AGENT_I_WALLET_HEADER(
        "linimal.patch.agent-i-wallet-header",
        FeatureId.AGENT_I_WALLET_HEADER,
    ),
    AGENT_I_SETTINGS(
        "linimal.patch.agent-i-settings",
        FeatureId.AGENT_I_SETTINGS,
    ),
    AGENT_I_CHAT_COMPOSER(
        "linimal.patch.agent-i-chat-composer",
        FeatureId.AGENT_I_CHAT_COMPOSER,
    ),
    AGENT_I_CHAT_LIST_SEARCH(
        "linimal.patch.agent-i-chat-list-search",
        FeatureId.AGENT_I_CHAT_LIST_SEARCH,
    ),
    LINE_AI_MESSAGE_CONTEXT_MENU(
        "linimal.patch.line-ai-message-context-menu",
        FeatureId.LINE_AI_MESSAGE_CONTEXT_MENU,
    ),
    LINE_AI_IMAGE_SIDE_MENU(
        "linimal.patch.line-ai-image-side-menu",
        FeatureId.LINE_AI_MESSAGE_CONTEXT_MENU,
    ),
    LINE_AI_GALLERY_VIEWER(
        "linimal.patch.line-ai-gallery-viewer",
        FeatureId.LINE_AI_GALLERY_VIEWER,
    ),
    HOME_CONTENTS_RECOMMENDATION("linimal.patch.home-contents-recommendation", FeatureId.HOME_RECOMMENDATIONS),
    HOME_MATOME_SINGLE_MODULE("linimal.patch.home-matome-single-module", FeatureId.HOME_TRENDING),
    HOME_FEED_POST_CARDS("linimal.patch.home-feed-post-cards", FeatureId.HOME_FEED_POST_CARDS),
    HOME_FEATURED_COLLECTIONS(
        "linimal.patch.home-featured-collections",
        FeatureId.HOME_FEATURED_COLLECTIONS,
    ),
    HOME_FEED_LOADING_INDICATOR(
        "linimal.patch.home-feed-loading-indicator",
        FeatureId.HOME_FEED_LOADING_INDICATOR,
    ),
    HOME_RECENT_HISTORY("linimal.patch.home-recent-history", FeatureId.HOME_RECENT_HISTORY),
    SMART_CHANNEL_ADS("linimal.patch.smart-channel-ads", FeatureId.SMART_CHANNEL_ADS),
    HOME_TOP_AD_MODULE_GATE(
        "linimal.patch.home-top-ad-module-gate",
        FeatureId.HOME_TOP_AD,
    ),
    HOME_TOP_AD_CATALOG_GATE(
        "linimal.patch.home-top-ad-catalog-gate",
        FeatureId.HOME_TOP_AD,
    ),
    HOME_GCS_AD_MODULE_GATE(
        "linimal.patch.home-gcs-ad-module-gate",
        FeatureId.HOME_TOP_AD,
    ),
    EXTERNAL_BROWSER_CHAT_TEXT_LINK(
        "linimal.patch.external-browser-chat-text-link",
        FeatureId.EXTERNAL_BROWSER,
    ),
    READ_RECEIPTS_MAIN_CHAT_GATE(
        "linimal.patch.read-receipts-main-chat-gate",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_RECEIPTS_MAIN_CHAT_PENDING_QUEUE_CLEAR(
        "linimal.patch.read-receipts-main-chat-pending-queue-clear",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_RECEIPTS_MAIN_CHAT_MANUAL_CALLER(
        "linimal.patch.read-receipts-main-chat-manual-caller",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_RECEIPTS_MAIN_CHAT_SUPPLIER_REGISTRATION(
        "linimal.patch.read-receipts-main-chat-supplier-registration",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_RECEIPTS_MAIN_CHAT_SUPPLIER_PREPARATION(
        "linimal.patch.read-receipts-main-chat-supplier-preparation",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_RECEIPTS_MAIN_CHAT_MARK_ALL_AS_READ(
        "linimal.patch.read-receipts-main-chat-mark-all-as-read",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_RECEIPTS_MAIN_CHAT_CONTEXT_MENU_READ(
        "linimal.patch.read-receipts-main-chat-context-menu-read",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_RECEIPTS_MAIN_CHAT_CHAT_SUBTAB_READ(
        "linimal.patch.read-receipts-main-chat-chat-subtab-read",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_RECEIPTS_MAIN_CHAT_NOTIFICATION_READ(
        "linimal.patch.read-receipts-main-chat-notification-read",
        FeatureId.READ_RECEIPTS_MAIN_CHAT,
    ),
    READ_WITHOUT_RECEIPT_MENU_LABEL_RESOURCE(
        "linimal.patch.read-without-receipt-menu-label-resource",
        FeatureId.READ_WITHOUT_RECEIPT,
    ),
    READ_WITHOUT_RECEIPT_COMPOSE_MENU_ROW(
        "linimal.patch.read-without-receipt-compose-menu-row",
        FeatureId.READ_WITHOUT_RECEIPT,
    ),
    READ_WITHOUT_RECEIPT_PREVIEW_MENU_ROW(
        "linimal.patch.read-without-receipt-preview-menu-row",
        FeatureId.READ_WITHOUT_RECEIPT,
    ),
    READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK(
        "linimal.patch.read-without-receipt-mark-as-read-block",
        FeatureId.READ_WITHOUT_RECEIPT,
    ),
    READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK(
        "linimal.patch.read-without-receipt-local-read-block",
        FeatureId.READ_WITHOUT_RECEIPT,
    ),
    READ_WITHOUT_RECEIPT_SESSION(
        "linimal.patch.read-without-receipt-session",
        FeatureId.READ_WITHOUT_RECEIPT,
    ),
    READ_WITHOUT_RECEIPT_SEND(
        "linimal.patch.read-without-receipt-send",
        FeatureId.READ_WITHOUT_RECEIPT,
    ),
    READ_WITHOUT_RECEIPT_MANUAL_READ(
        "linimal.patch.read-without-receipt-manual-read",
        FeatureId.READ_WITHOUT_RECEIPT,
    ),
    NOTIFICATION_READ_WITHOUT_RECEIPT_ENTRY(
        "linimal.patch.notification-read-without-receipt-entry",
        FeatureId.NOTIFICATION_READ_WITHOUT_RECEIPT,
    ),
    NOTIFICATION_READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK(
        "linimal.patch.notification-read-without-receipt-mark-as-read-block",
        FeatureId.NOTIFICATION_READ_WITHOUT_RECEIPT,
    ),
    NOTIFICATION_READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK(
        "linimal.patch.notification-read-without-receipt-local-read-block",
        FeatureId.NOTIFICATION_READ_WITHOUT_RECEIPT,
    ),
    NOTIFICATION_READ_WITHOUT_RECEIPT_SESSION(
        "linimal.patch.notification-read-without-receipt-session",
        FeatureId.NOTIFICATION_READ_WITHOUT_RECEIPT,
    ),
    NOTIFICATION_READ_WITHOUT_RECEIPT_SEND(
        "linimal.patch.notification-read-without-receipt-send",
        FeatureId.NOTIFICATION_READ_WITHOUT_RECEIPT,
    ),
    NOTIFICATION_READ_WITHOUT_RECEIPT_MANUAL_READ(
        "linimal.patch.notification-read-without-receipt-manual-read",
        FeatureId.NOTIFICATION_READ_WITHOUT_RECEIPT,
    ),
    CHAT_LIST_HEADER_AI_FRIENDS(
        "linimal.patch.chat-list-header-ai-friends",
        FeatureId.CHAT_LIST_HEADER_AI_FRIENDS,
    ),
    CHAT_LIST_HEADER_CALENDAR(
        "linimal.patch.chat-list-header-calendar",
        FeatureId.CHAT_LIST_HEADER_CALENDAR,
    ),
    CHAT_LIST_HEADER_OPEN_CHAT(
        "linimal.patch.chat-list-header-open-chat",
        FeatureId.CHAT_LIST_HEADER_OPEN_CHAT,
    ),
    FIS_CERTIFICATE_HEADER("linimal.patch.fis-certificate-header", FeatureId.PUSH_NOTIFICATIONS),
    GOOGLE_AUTH_MICROG_MANIFEST("linimal.patch.google-auth-microg-manifest", FeatureId.GOOGLE_DRIVE_BACKUP),
    GOOGLE_AUTH_TOKEN_ROUTING("linimal.patch.google-auth-token-routing", FeatureId.GOOGLE_DRIVE_BACKUP),
    GOOGLE_AUTH_ACCOUNT_PICKER_ROUTING("linimal.patch.google-auth-account-picker-routing", FeatureId.GOOGLE_DRIVE_BACKUP),
    GOOGLE_AUTH_SIGN_IN_ROUTING("linimal.patch.google-auth-sign-in-routing", FeatureId.GOOGLE_DRIVE_BACKUP),
    GOOGLE_AUTH_FAILURE_DIAGNOSTICS("linimal.patch.google-auth-failure-diagnostics", FeatureId.GOOGLE_DRIVE_BACKUP),
    NO_OP_PROBE("linimal.patch.no-op-probe", FeatureId.PROBE),
    LINIMAL("linimal.patch.linimal", FeatureId.LINIMAL),
}

enum class PatchStatus {
    OK,
    PARTIAL,
    TARGET_NOT_FOUND,
    DISABLED,
    ERROR,
}

/**
 * 内部パッチ 1 件の build-time 結果。カウントは、そのパッチが意図的に検索した対象だけを示します。
 * そのため no-op パッチでは expected と actual の対象数がともに 0 になります。
 */
data class PatchStatusRecord(
    val patchId: PatchId,
    val featureId: FeatureId = patchId.featureId,
    val status: PatchStatus,
    val expectedTargetCount: Int,
    val actualTargetCount: Int,
    val reason: String? = null,
) {
    init {
        require(featureId == patchId.featureId) { "featureId must match patchId" }
        require(expectedTargetCount >= 0) { "expectedTargetCount must not be negative" }
        require(actualTargetCount >= 0) { "actualTargetCount must not be negative" }
    }
}
