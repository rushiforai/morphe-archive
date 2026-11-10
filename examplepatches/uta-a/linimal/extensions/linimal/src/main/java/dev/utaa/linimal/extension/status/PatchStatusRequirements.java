package dev.utaa.linimal.extension.status;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

/** Runtime で設定可能な feature と、適用に必須の build-time patch ID の契約。 */
final class PatchStatusRequirements {
    private static final Map<String, Set<String>> REQUIRED_PATCH_IDS = createRequirements();

    private PatchStatusRequirements() {
    }

    static Set<String> requiredPatchIds(String featureId) {
        return REQUIRED_PATCH_IDS.get(featureId);
    }

    private static Map<String, Set<String>> createRequirements() {
        Map<String, Set<String>> requirements = new LinkedHashMap<>();
        requirements.put("linimal.settings", ids(
                "linimal.patch.settings-resource",
                "linimal.patch.settings-entry"));
        requirements.put("linimal.premium", ids("linimal.patch.premium-unsend"));
        requirements.put("linimal.premium-settings-row", ids("linimal.patch.premium-settings-row"));
        requirements.put("linimal.premium-preview-promotion",
                ids("linimal.patch.premium-preview-promotion"));
        requirements.put("linimal.preview-scroll", ids("linimal.patch.preview-scroll"));
        requirements.put("linimal.amoled-theme", ids("linimal.patch.amoled-theme-colors"));
        requirements.put("linimal.external-browser", ids("linimal.patch.external-browser-chat-text-link"));
        requirements.put("linimal.push-notifications", ids("linimal.patch.fis-certificate-header"));
        requirements.put("linimal.google-drive-backup",
                ids("linimal.patch.google-auth-microg-manifest", "linimal.patch.google-auth-token-routing",
                        "linimal.patch.google-auth-sign-in-routing",
                        "linimal.patch.google-auth-account-picker-routing",
                        "linimal.patch.google-auth-failure-diagnostics"));
        requirements.put("linimal.agent-i-home-header", ids("linimal.patch.agent-i-home-header"));
        requirements.put("linimal.agent-i-chat-information",
                ids("linimal.patch.agent-i-chat-information-entry"));
        requirements.put("linimal.agent-i-wallet-header", ids("linimal.patch.agent-i-wallet-header"));
        requirements.put("linimal.agent-i-settings", ids("linimal.patch.agent-i-settings"));
        requirements.put("linimal.agent-i-chat-composer", ids("linimal.patch.agent-i-chat-composer"));
        requirements.put("linimal.agent-i-chat-list-search",
                ids("linimal.patch.agent-i-chat-list-search"));
        requirements.put("linimal.line-ai-message-context-menu",
                ids("linimal.patch.line-ai-message-context-menu", "linimal.patch.line-ai-image-side-menu"));
        requirements.put("linimal.line-ai-gallery-viewer", ids("linimal.patch.line-ai-gallery-viewer"));
        requirements.put("linimal.shopping", ids("linimal.patch.main-tab-shopping"));
        requirements.put("linimal.news", ids("linimal.patch.main-tab-news"));
        requirements.put("linimal.wallet", ids("linimal.patch.main-tab-wallet"));
        requirements.put("linimal.mini", ids("linimal.patch.main-tab-mini"));
        requirements.put("linimal.home-top-ad", ids(
                "linimal.patch.home-top-ad-module-gate",
                "linimal.patch.home-top-ad-catalog-gate",
                "linimal.patch.home-gcs-ad-module-gate"));
        requirements.put("linimal.home-recommendations",
                ids("linimal.patch.home-contents-recommendation"));
        requirements.put("linimal.home-trending", ids("linimal.patch.home-matome-single-module"));
        requirements.put("linimal.home-feed-post-cards", ids("linimal.patch.home-feed-post-cards"));
        requirements.put("linimal.home-featured-collections",
                ids("linimal.patch.home-featured-collections"));
        requirements.put("linimal.home-recent-history", ids("linimal.patch.home-recent-history"));
        // 読み込み表示は独立した patch。特集枠と feature を共有すると、片方の失敗で
        // もう片方の設定まで利用不可になる。
        requirements.put("linimal.home-feed-loading-indicator",
                ids("linimal.patch.home-feed-loading-indicator"));
        requirements.put("linimal.smart-channel-ads", ids("linimal.patch.smart-channel-ads"));
        requirements.put("linimal.chat-calendar", ids("linimal.patch.chat-menu-calendar"));
        requirements.put("linimal.chat-line-gift", ids("linimal.patch.chat-menu-line-gift"));
        requirements.put("linimal.chat-line-pay", ids("linimal.patch.chat-menu-line-pay"));
        requirements.put("linimal.read-receipts-main-chat", ids(
                "linimal.patch.read-receipts-main-chat-gate",
                "linimal.patch.read-receipts-main-chat-pending-queue-clear",
                "linimal.patch.read-receipts-main-chat-manual-caller",
                "linimal.patch.read-receipts-main-chat-supplier-registration",
                "linimal.patch.read-receipts-main-chat-supplier-preparation",
                "linimal.patch.read-receipts-main-chat-mark-all-as-read",
                "linimal.patch.read-receipts-main-chat-context-menu-read",
                "linimal.patch.read-receipts-main-chat-chat-subtab-read",
                "linimal.patch.read-receipts-main-chat-notification-read"));
        requirements.put("linimal.read-without-receipt", ids(
                "linimal.patch.read-without-receipt-menu-label-resource",
                "linimal.patch.read-without-receipt-compose-menu-row",
                "linimal.patch.read-without-receipt-preview-menu-row",
                "linimal.patch.read-without-receipt-mark-as-read-block",
                "linimal.patch.read-without-receipt-local-read-block",
                "linimal.patch.read-without-receipt-session",
                "linimal.patch.read-without-receipt-send",
                "linimal.patch.read-without-receipt-manual-read"));
        requirements.put("linimal.chat.notification-read-without-receipt", ids(
                "linimal.patch.notification-read-without-receipt-entry",
                "linimal.patch.notification-read-without-receipt-mark-as-read-block",
                "linimal.patch.notification-read-without-receipt-local-read-block",
                "linimal.patch.notification-read-without-receipt-session",
                "linimal.patch.notification-read-without-receipt-send",
                "linimal.patch.notification-read-without-receipt-manual-read"));
        requirements.put("linimal.chat-list-header-ai-friends",
                ids("linimal.patch.chat-list-header-ai-friends"));
        requirements.put("linimal.chat-list-header-calendar",
                ids("linimal.patch.chat-list-header-calendar"));
        requirements.put("linimal.chat-list-header-open-chat",
                ids("linimal.patch.chat-list-header-open-chat"));
        return Collections.unmodifiableMap(requirements);
    }

    private static Set<String> ids(String... patchIds) {
        return Collections.unmodifiableSet(new LinkedHashSet<>(Arrays.asList(patchIds)));
    }
}
