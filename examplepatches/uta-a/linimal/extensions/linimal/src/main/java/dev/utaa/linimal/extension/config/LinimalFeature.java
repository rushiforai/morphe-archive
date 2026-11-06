package dev.utaa.linimal.extension.config;

/**
 * Linimal が適用できる boolean の runtime 変更。
 *
 * <p>enabled の値は常に、対応する Linimal の変更が有効であることを示します。元の LINE 機能が
 * 有効であるかどうかを示すものではありません。</p>
 *
 * <p>各要素は build-time の patch-status に記録される feature ID を持ちます。設定画面と
 * hook の読み取りは同じ ID を使い、patch が完全に適用された機能だけを有効にします。</p>
 */
public enum LinimalFeature {
    /**
     * v1 の広告設定との source/binary compatibility のための alias です。
     * 新しい hook は {@link #SMART_CHANNEL_ADS} または {@link #HOME_TOP_AD} を使用します。
     */
    @Deprecated
    ADS("linimal.smart-channel-ads"),

    /**
     * v1 の LINE AI 設定との source/binary compatibility のための alias です。
     * 新しい hook は {@link #AGENT_I_CHAT_INFORMATION} を使用します。
     */
    @Deprecated
    LINE_AI("linimal.agent-i-chat-information"),

    PREMIUM("linimal.premium"),
    VOOM("linimal.voom"),
    NEWS("linimal.news"),
    WALLET("linimal.wallet"),
    HOME_RECOMMENDATIONS("linimal.home-recommendations"),
    HOME_TRENDING("linimal.home-trending"),
    CHAT_CALENDAR("linimal.chat-calendar"),
    CHAT_LINE_GIFT("linimal.chat-line-gift"),
    CHAT_LINE_PAY("linimal.chat-line-pay"),
    EXTERNAL_BROWSER("linimal.external-browser"),

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
    HOME_FEED_POST_CARDS("linimal.home-feed-post-cards"),
    HOME_FEATURED_COLLECTIONS("linimal.home-featured-collections"),
    HOME_RECENT_HISTORY("linimal.home-recent-history"),
    PREMIUM_SETTINGS_ROW("linimal.premium-settings-row"),
    PREMIUM_PREVIEW_PROMOTION("linimal.premium-preview-promotion"),
    PREVIEW_SCROLL("linimal.preview-scroll"),
    READ_WITHOUT_RECEIPT("linimal.read-without-receipt"),
    NOTIFICATION_READ_WITHOUT_RECEIPT("linimal.chat.notification-read-without-receipt"),
    MINI("linimal.mini"),
    CHAT_LIST_HEADER_AI_FRIENDS("linimal.chat-list-header-ai-friends"),
    CHAT_LIST_HEADER_CALENDAR("linimal.chat-list-header-calendar"),
    CHAT_LIST_HEADER_OPEN_CHAT("linimal.chat-list-header-open-chat"),
    PUSH_NOTIFICATIONS("linimal.push-notifications"),
    GOOGLE_DRIVE_BACKUP("linimal.google-drive-backup");

    private final String featureId;

    LinimalFeature(String featureId) {
        this.featureId = featureId;
    }

    /**
     * build-time の patch-status に記録される feature ID を返します。
     * 非推奨の alias は、保存キーと同じく v2 の置き換え先と同じ ID を返します。
     */
    public String getFeatureId() {
        return featureId;
    }

    /**
     * 変更を反映するのにアプリの再起動が必要かどうか。画面の要素を隠す表示系の機能は、表示中の画面で
     * 要素の有無が描画の途中に変わると LINE の Compose が落ちるため、プロセスの起動時の値を使い続けます。
     * 既読や通信の振る舞いを変える機能は、その時点の値をすぐに使います。
     */
    public boolean requiresRestart() {
        switch (this) {
            case READ_WITHOUT_RECEIPT:
            case NOTIFICATION_READ_WITHOUT_RECEIPT:
            case EXTERNAL_BROWSER:
            case PUSH_NOTIFICATIONS:
            case GOOGLE_DRIVE_BACKUP:
                return false;
            default:
                return true;
        }
    }
}
