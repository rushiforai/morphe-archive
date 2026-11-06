package dev.utaa.linimal.extension.config;

/** 内部で保存する schema の定義。キーは意図的に config package の外へ出しません。 */
final class LinimalConfigSchema {
    static final int CURRENT_VERSION = 4;

    static final String SCHEMA_VERSION_KEY = "linimal.schema.version";

    /** v1 migration source. v2 の runtime configuration には使用しません。 */
    static final String ADS_ENABLED_KEY = "linimal.ads.enabled";
    /** v1 migration source. v2 の runtime configuration には使用しません。 */
    static final String LINE_AI_ENABLED_KEY = "linimal.feature.line_ai";

    static final String SMART_CHANNEL_ADS_ENABLED_KEY = "linimal.ads.smart_channel";
    static final String HOME_TOP_AD_ENABLED_KEY = "linimal.ads.home_top";
    static final String AGENT_I_HOME_HEADER_ENABLED_KEY = "linimal.agent_i.home_header";
    static final String AGENT_I_CHAT_INFORMATION_ENABLED_KEY = "linimal.agent_i.chat_information";
    static final String AGENT_I_WALLET_HEADER_ENABLED_KEY = "linimal.agent_i.wallet_header";
    static final String AGENT_I_SETTINGS_ENABLED_KEY = "linimal.agent_i.settings";
    static final String AGENT_I_CHAT_COMPOSER_ENABLED_KEY = "linimal.agent_i.chat_composer";
    static final String AGENT_I_CHAT_LIST_SEARCH_ENABLED_KEY = "linimal.agent_i.chat_list_search";
    static final String LINE_AI_MESSAGE_CONTEXT_MENU_ENABLED_KEY =
            "linimal.agent_i.message_context_menu";
    static final String LINE_AI_GALLERY_VIEWER_ENABLED_KEY = "linimal.agent_i.gallery_viewer";
    static final String SHOPPING_ENABLED_KEY = "linimal.tab.shopping";
    static final String MINI_ENABLED_KEY = "linimal.tab.mini";

    static final String PREMIUM_ENABLED_KEY = "linimal.feature.premium";
    static final String PREMIUM_SETTINGS_ROW_ENABLED_KEY = "linimal.settings.premium_row";
    static final String PREMIUM_PREVIEW_PROMOTION_ENABLED_KEY = "linimal.preview.premium_promotion";
    static final String PREVIEW_SCROLL_ENABLED_KEY = "linimal.preview.scroll";
    static final String VOOM_ENABLED_KEY = "linimal.feature.voom";
    static final String NEWS_ENABLED_KEY = "linimal.feature.news";
    static final String WALLET_ENABLED_KEY = "linimal.feature.wallet";
    static final String HOME_RECOMMENDATIONS_ENABLED_KEY = "linimal.ui.home.recommendations";
    static final String HOME_TRENDING_ENABLED_KEY = "linimal.ui.home.trending";
    static final String HOME_FEED_POST_CARDS_ENABLED_KEY = "linimal.ui.home.feed_post_cards";
    static final String HOME_FEATURED_COLLECTIONS_ENABLED_KEY =
            "linimal.ui.home.featured_collections";
    static final String HOME_RECENT_HISTORY_ENABLED_KEY = "linimal.ui.home.recent_history";
    static final String CHAT_CALENDAR_ENABLED_KEY = "linimal.chat.tools.calendar";
    static final String CHAT_LINE_GIFT_ENABLED_KEY = "linimal.chat.tools.line_gift";
    static final String CHAT_LINE_PAY_ENABLED_KEY = "linimal.chat.tools.line_pay";
    static final String READ_WITHOUT_RECEIPT_ENABLED_KEY = "linimal.chat.read_without_receipt";
    static final String NOTIFICATION_READ_WITHOUT_RECEIPT_ENABLED_KEY =
            "linimal.chat.notification_read_without_receipt";
    static final String KEEP_UNREAD_AFTER_SEND_KEY = "linimal.chat.keep_unread_after_send";
    static final String CHAT_LIST_HEADER_AI_FRIENDS_ENABLED_KEY = "linimal.chat.header.ai_friends";
    static final String CHAT_LIST_HEADER_CALENDAR_ENABLED_KEY = "linimal.chat.header.calendar";
    static final String CHAT_LIST_HEADER_OPEN_CHAT_ENABLED_KEY = "linimal.chat.header.open_chat";
    static final String READ_RECEIPT_MODE_KEY = "linimal.privacy.read_receipts.mode";
    static final String EXTERNAL_BROWSER_ENABLED_KEY = "linimal.browser.external";
    static final String PUSH_NOTIFICATIONS_ENABLED_KEY = "linimal.notifications.push_registration";
    static final String GOOGLE_DRIVE_BACKUP_ENABLED_KEY = "linimal.backup.microg_google_auth";

    private LinimalConfigSchema() {
    }

    static String keyFor(LinimalFeature feature) {
        switch (feature) {
            case SMART_CHANNEL_ADS:
            case ADS:
                return SMART_CHANNEL_ADS_ENABLED_KEY;
            case HOME_TOP_AD:
                return HOME_TOP_AD_ENABLED_KEY;
            case AGENT_I_HOME_HEADER:
                return AGENT_I_HOME_HEADER_ENABLED_KEY;
            case AGENT_I_CHAT_INFORMATION:
            case LINE_AI:
                return AGENT_I_CHAT_INFORMATION_ENABLED_KEY;
            case AGENT_I_WALLET_HEADER:
                return AGENT_I_WALLET_HEADER_ENABLED_KEY;
            case AGENT_I_SETTINGS:
                return AGENT_I_SETTINGS_ENABLED_KEY;
            case AGENT_I_CHAT_COMPOSER:
                return AGENT_I_CHAT_COMPOSER_ENABLED_KEY;
            case AGENT_I_CHAT_LIST_SEARCH:
                return AGENT_I_CHAT_LIST_SEARCH_ENABLED_KEY;
            case LINE_AI_MESSAGE_CONTEXT_MENU:
                return LINE_AI_MESSAGE_CONTEXT_MENU_ENABLED_KEY;
            case LINE_AI_GALLERY_VIEWER:
                return LINE_AI_GALLERY_VIEWER_ENABLED_KEY;
            case SHOPPING:
                return SHOPPING_ENABLED_KEY;
            case MINI:
                return MINI_ENABLED_KEY;
            case PREMIUM:
                return PREMIUM_ENABLED_KEY;
            case PREMIUM_SETTINGS_ROW:
                return PREMIUM_SETTINGS_ROW_ENABLED_KEY;
            case PREMIUM_PREVIEW_PROMOTION:
                return PREMIUM_PREVIEW_PROMOTION_ENABLED_KEY;
            case PREVIEW_SCROLL:
                return PREVIEW_SCROLL_ENABLED_KEY;
            case VOOM:
                return VOOM_ENABLED_KEY;
            case NEWS:
                return NEWS_ENABLED_KEY;
            case WALLET:
                return WALLET_ENABLED_KEY;
            case HOME_RECOMMENDATIONS:
                return HOME_RECOMMENDATIONS_ENABLED_KEY;
            case HOME_TRENDING:
                return HOME_TRENDING_ENABLED_KEY;
            case HOME_FEED_POST_CARDS:
                return HOME_FEED_POST_CARDS_ENABLED_KEY;
            case HOME_FEATURED_COLLECTIONS:
                return HOME_FEATURED_COLLECTIONS_ENABLED_KEY;
            case HOME_RECENT_HISTORY:
                return HOME_RECENT_HISTORY_ENABLED_KEY;
            case CHAT_CALENDAR:
                return CHAT_CALENDAR_ENABLED_KEY;
            case CHAT_LINE_GIFT:
                return CHAT_LINE_GIFT_ENABLED_KEY;
            case CHAT_LINE_PAY:
                return CHAT_LINE_PAY_ENABLED_KEY;
            case READ_WITHOUT_RECEIPT:
                return READ_WITHOUT_RECEIPT_ENABLED_KEY;
            case NOTIFICATION_READ_WITHOUT_RECEIPT:
                return NOTIFICATION_READ_WITHOUT_RECEIPT_ENABLED_KEY;
            case CHAT_LIST_HEADER_AI_FRIENDS:
                return CHAT_LIST_HEADER_AI_FRIENDS_ENABLED_KEY;
            case CHAT_LIST_HEADER_CALENDAR:
                return CHAT_LIST_HEADER_CALENDAR_ENABLED_KEY;
            case CHAT_LIST_HEADER_OPEN_CHAT:
                return CHAT_LIST_HEADER_OPEN_CHAT_ENABLED_KEY;
            case EXTERNAL_BROWSER:
                return EXTERNAL_BROWSER_ENABLED_KEY;
            case PUSH_NOTIFICATIONS:
                return PUSH_NOTIFICATIONS_ENABLED_KEY;
            case GOOGLE_DRIVE_BACKUP:
                return GOOGLE_DRIVE_BACKUP_ENABLED_KEY;
            default:
                throw new AssertionError("Unhandled feature: " + feature);
        }
    }
}
