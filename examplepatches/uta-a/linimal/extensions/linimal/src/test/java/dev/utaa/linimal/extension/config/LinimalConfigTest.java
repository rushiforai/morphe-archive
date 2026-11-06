package dev.utaa.linimal.extension.config;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dev.utaa.linimal.extension.features.readwithoutreceipt.ReadWithoutReceiptHooks;
import dev.utaa.linimal.extension.features.PreviewScrollHooks;

public final class LinimalConfigTest {
    /** 現在の既定値で ON になる機能です。alias は置き換え先と同じ値になります。 */
    private static final Set<LinimalFeature> DEFAULT_ON_FEATURES = EnumSet.of(
            LinimalFeature.SMART_CHANNEL_ADS,
            LinimalFeature.HOME_TOP_AD,
            LinimalFeature.AGENT_I_HOME_HEADER,
            LinimalFeature.AGENT_I_CHAT_INFORMATION,
            LinimalFeature.AGENT_I_WALLET_HEADER,
            LinimalFeature.AGENT_I_SETTINGS,
            LinimalFeature.AGENT_I_CHAT_COMPOSER,
            LinimalFeature.AGENT_I_CHAT_LIST_SEARCH,
            LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU,
            LinimalFeature.LINE_AI_GALLERY_VIEWER,
            LinimalFeature.PUSH_NOTIFICATIONS,
            LinimalFeature.GOOGLE_DRIVE_BACKUP,
            LinimalFeature.ADS,
            LinimalFeature.LINE_AI);

    /**
     * 既定値を変える前に ON だった機能です。既存インストールへ書き戻す値なので、
     * 本体の凍結テーブルとは独立にここへ書き写し、変更しません。
     */
    private static final Set<LinimalFeature> LEGACY_DEFAULT_ON_FEATURES = EnumSet.of(
            LinimalFeature.ADS,
            LinimalFeature.LINE_AI,
            LinimalFeature.PREMIUM,
            LinimalFeature.VOOM,
            LinimalFeature.NEWS,
            LinimalFeature.HOME_RECOMMENDATIONS,
            LinimalFeature.HOME_TRENDING,
            LinimalFeature.CHAT_CALENDAR,
            LinimalFeature.CHAT_LINE_GIFT,
            LinimalFeature.CHAT_LINE_PAY,
            LinimalFeature.READ_WITHOUT_RECEIPT,
            LinimalFeature.SMART_CHANNEL_ADS,
            LinimalFeature.HOME_TOP_AD,
            LinimalFeature.AGENT_I_HOME_HEADER,
            LinimalFeature.AGENT_I_CHAT_INFORMATION,
            LinimalFeature.AGENT_I_WALLET_HEADER,
            LinimalFeature.AGENT_I_SETTINGS,
            LinimalFeature.AGENT_I_CHAT_COMPOSER,
            LinimalFeature.AGENT_I_CHAT_LIST_SEARCH,
            LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU,
            LinimalFeature.LINE_AI_GALLERY_VIEWER,
            LinimalFeature.SHOPPING,
            LinimalFeature.HOME_FEED_POST_CARDS,
            LinimalFeature.HOME_FEATURED_COLLECTIONS,
            LinimalFeature.PREMIUM_SETTINGS_ROW);

    /**
     * 凍結テーブルを作ったあとに追加した機能です。既存インストールにとっても新機能で保護すべき
     * 挙動が無いため、migration は書き込まず、その時点の既定値をそのまま使わせます。
     */
    private static final Set<LinimalFeature> POST_FREEZE_FEATURES = EnumSet.of(
            LinimalFeature.HOME_RECENT_HISTORY,
            LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT,
            LinimalFeature.PUSH_NOTIFICATIONS,
            LinimalFeature.GOOGLE_DRIVE_BACKUP,
            LinimalFeature.PREMIUM_PREVIEW_PROMOTION,
            LinimalFeature.PREVIEW_SCROLL);

    @Test
    public void beforeInitializationHooksPreserveOriginalBehavior() {
        LinimalConfig config = LinimalConfig.get();

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertFalse(config.isHomeTopAdSuppressionEnabled());
        assertFalse(config.isAgentIHomeHeaderSuppressionEnabled());
        assertFalse(config.isAgentIChatInformationSuppressionEnabled());
        assertFalse(config.isAgentIWalletHeaderSuppressionEnabled());
        assertFalse(config.isAgentISettingsSuppressionEnabled());
        assertFalse(config.isAgentIChatComposerSuppressionEnabled());
        assertFalse(config.isLineAiMessageContextMenuSuppressionEnabled());
        assertFalse(config.isLineAiGalleryViewerSuppressionEnabled());
        assertFalse(config.isShoppingSuppressionEnabled());
        assertFalse(config.isSuppressionEnabled(LinimalFeature.ADS));
        assertFalse(config.isSuppressionEnabled(LinimalFeature.LINE_AI));
        assertFalse(config.isPremiumSuppressionEnabled());
        assertFalse(config.isPremiumSettingsRowSuppressionEnabled());
        assertFalse(config.isPremiumPreviewPromotionSuppressionEnabled());
        assertFalse(config.isPreviewScrollEnabled());
        assertFalse(PreviewScrollHooks.allowScroll(false));
        assertTrue(PreviewScrollHooks.allowScroll(true));
        assertFalse(config.isHomeFeedPostCardsSuppressionEnabled());
        assertFalse(config.isHomeFeaturedCollectionsSuppressionEnabled());
        assertFalse(config.isNotificationReadWithoutReceiptEnabled());
        assertEquals(ReadReceiptMode.NORMAL, config.getReadReceiptMode());
    }

    /**
     * 新規インストールで ON になるのは、広告と Agent i・LINE AI の抑制、push 通知の復旧だけです。
     * ほかは LINE の元の挙動のままにし、利用者が設定画面で選びます。
     */
    @Test
    public void freshInstallEnablesOnlyTheAdAgentIAndPushNotificationDefaults() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertTrue(config.isSmartChannelAdsSuppressionEnabled());
        assertTrue(config.isHomeTopAdSuppressionEnabled());
        assertTrue(config.isAgentIHomeHeaderSuppressionEnabled());
        assertTrue(config.isAgentIChatInformationSuppressionEnabled());
        assertTrue(config.isAgentIWalletHeaderSuppressionEnabled());
        assertTrue(config.isAgentISettingsSuppressionEnabled());
        assertTrue(config.isAgentIChatComposerSuppressionEnabled());
        assertTrue(config.isAgentIChatListSearchSuppressionEnabled());
        assertTrue(config.isLineAiMessageContextMenuSuppressionEnabled());
        assertTrue(config.isLineAiGalleryViewerSuppressionEnabled());
        assertTrue(config.isSuppressionEnabled(LinimalFeature.ADS));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.LINE_AI));
        assertFalse(config.isShoppingSuppressionEnabled());
        assertFalse(config.isPremiumSuppressionEnabled());
        assertFalse(config.isPremiumSettingsRowSuppressionEnabled());
        assertFalse(config.isPremiumPreviewPromotionSuppressionEnabled());
        assertFalse(config.isPreviewScrollEnabled());
        assertFalse(config.isVoomSuppressionEnabled());
        assertFalse(config.isNewsSuppressionEnabled());
        assertFalse(config.isWalletSuppressionEnabled());
        assertFalse(config.isMiniSuppressionEnabled());
        assertFalse(config.isHomeRecommendationsSuppressionEnabled());
        assertFalse(config.isHomeTrendingSuppressionEnabled());
        assertFalse(config.isHomeFeedPostCardsSuppressionEnabled());
        assertFalse(config.isHomeFeaturedCollectionsSuppressionEnabled());
        assertFalse(config.isChatCalendarSuppressionEnabled());
        assertFalse(config.isChatLineGiftSuppressionEnabled());
        assertFalse(config.isChatLinePaySuppressionEnabled());
        assertFalse(config.isReadWithoutReceiptEnabled());
        assertFalse(config.isNotificationReadWithoutReceiptEnabled());
        assertFalse(config.isChatListHeaderAiFriendsSuppressionEnabled());
        assertFalse(config.isChatListHeaderCalendarSuppressionEnabled());
        assertFalse(config.isChatListHeaderOpenChatSuppressionEnabled());
        assertFalse(config.isExternalBrowserOverrideEnabled());
        assertEquals(ReadReceiptMode.NORMAL, config.getReadReceiptMode());
        // 一覧から漏れた機能があっても既定値が固定されるよう、全 feature を突き合わせます。
        for (LinimalFeature feature : LinimalFeature.values()) {
            assertEquals(
                    feature.name(),
                    DEFAULT_ON_FEATURES.contains(feature),
                    config.isSuppressionEnabled(feature));
        }
    }

    /**
     * 既存インストールでは、利用者がまだ触っていない機能に変更前の既定値を書き込み、
     * 既定値の変更で挙動が変わらないようにします。
     */
    @Test
    public void existingInstallKeepsTheLegacyDefaultsForEveryUntouchedFeature() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 2);

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        for (LinimalFeature feature : LinimalFeature.values()) {
            if (POST_FREEZE_FEATURES.contains(feature)) {
                // 凍結後に追加した機能は書き戻さず、現在の既定値をそのまま適用します。
                assertNull(feature.name(), backend.values.get(LinimalConfigSchema.keyFor(feature)));
                assertEquals(
                        feature.name(),
                        DEFAULT_ON_FEATURES.contains(feature),
                        config.isSuppressionEnabled(feature));
                continue;
            }
            boolean legacyDefault = LEGACY_DEFAULT_ON_FEATURES.contains(feature);
            assertEquals(feature.name(), legacyDefault, config.isSuppressionEnabled(feature));
            assertEquals(
                    feature.name(),
                    legacyDefault,
                    backend.values.get(LinimalConfigSchema.keyFor(feature)));
        }
        assertEquals(ReadReceiptMode.NORMAL, config.getReadReceiptMode());
        assertEquals("normal", backend.values.get(LinimalConfigSchema.READ_RECEIPT_MODE_KEY));
        assertEquals(
                LinimalConfigSchema.CURRENT_VERSION,
                backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
    }

    /** 明示的に設定された値は、旧既定値の書き戻しで上書きされません。 */
    @Test
    public void legacyDefaultBackfillDoesNotOverwriteValuesTheUserChose() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 2);
        backend.values.put(LinimalConfigSchema.PREMIUM_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.WALLET_ENABLED_KEY, true);
        backend.values.put(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.READ_RECEIPT_MODE_KEY, "manual");

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertFalse(config.isPremiumSuppressionEnabled());
        assertTrue(config.isWalletSuppressionEnabled());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertEquals(ReadReceiptMode.MANUAL, config.getReadReceiptMode());
        assertEquals(false, backend.values.get(LinimalConfigSchema.PREMIUM_ENABLED_KEY));
        assertEquals(true, backend.values.get(LinimalConfigSchema.WALLET_ENABLED_KEY));
        assertEquals(false, backend.values.get(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY));
        assertEquals("manual", backend.values.get(LinimalConfigSchema.READ_RECEIPT_MODE_KEY));
    }

    @Test
    public void invalidValueFailsOpenWithoutAdvancingToV3() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 2);
        backend.values.put(LinimalConfigSchema.VOOM_ENABLED_KEY, "true");

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isVoomSuppressionEnabled());
        assertEquals(2, backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.PREMIUM_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.READ_RECEIPT_MODE_KEY));
    }

    /** 二度目以降の起動では marker が現在値のため、書き込みも結果も変わりません。 */
    @Test
    public void repeatedMigrationRunsLeaveTheStoreUnchanged() {
        InMemoryBackend backend = v1Backend();
        backend.values.put(LinimalConfigSchema.ADS_ENABLED_KEY, false);

        configFor(backend);
        Map<String, Object> valuesAfterFirstRun = new HashMap<>(backend.values);
        int writesAfterFirstRun = backend.writes.size();

        LinimalConfig second = configFor(backend);

        assertEquals(valuesAfterFirstRun, backend.values);
        assertEquals(writesAfterFirstRun, backend.writes.size());
        assertFalse(second.isSmartChannelAdsSuppressionEnabled());
        assertFalse(second.isHomeTopAdSuppressionEnabled());
        assertTrue(second.isVoomSuppressionEnabled());
    }

    @Test
    public void v1AdsEnabledMigratesToBothAdLocations() {
        InMemoryBackend backend = v1Backend();
        backend.values.put(LinimalConfigSchema.ADS_ENABLED_KEY, true);

        LinimalConfig config = configFor(backend);

        assertTrue(config.isSmartChannelAdsSuppressionEnabled());
        assertTrue(config.isHomeTopAdSuppressionEnabled());
        assertEquals(true, backend.values.get(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY));
        assertEquals(true, backend.values.get(LinimalConfigSchema.HOME_TOP_AD_ENABLED_KEY));
    }

    @Test
    public void v1AdsDisabledMigratesToBothAdLocations() {
        InMemoryBackend backend = v1Backend();
        backend.values.put(LinimalConfigSchema.ADS_ENABLED_KEY, false);

        LinimalConfig config = configFor(backend);

        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertFalse(config.isHomeTopAdSuppressionEnabled());
        assertEquals(false, backend.values.get(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY));
        assertEquals(false, backend.values.get(LinimalConfigSchema.HOME_TOP_AD_ENABLED_KEY));
    }

    @Test
    public void v1LineAiEnabledMigratesToAgentIChatInformation() {
        InMemoryBackend backend = v1Backend();
        backend.values.put(LinimalConfigSchema.LINE_AI_ENABLED_KEY, true);

        LinimalConfig config = configFor(backend);

        assertAllAgentIStates(config, true);
        assertAllAgentIStoredValues(backend.values, true);
    }

    @Test
    public void v1LineAiDisabledMigratesToAgentIChatInformation() {
        InMemoryBackend backend = v1Backend();
        backend.values.put(LinimalConfigSchema.LINE_AI_ENABLED_KEY, false);

        LinimalConfig config = configFor(backend);

        assertAllAgentIStates(config, false);
        assertAllAgentIStoredValues(backend.values, false);
    }

    @Test
    public void v0MigratesToTheCurrentSchemaAndPreservesExistingValues() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 0);
        backend.values.put(LinimalConfigSchema.ADS_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.LINE_AI_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.WALLET_ENABLED_KEY, true);
        backend.values.put(LinimalConfigSchema.READ_RECEIPT_MODE_KEY, "manual");

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertFalse(config.isHomeTopAdSuppressionEnabled());
        assertAllAgentIStates(config, false);
        assertTrue(config.isShoppingSuppressionEnabled());
        assertTrue(config.isWalletSuppressionEnabled());
        assertEquals(ReadReceiptMode.MANUAL, config.getReadReceiptMode());
        assertEquals(
                LinimalConfigSchema.CURRENT_VERSION,
                backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
    }

    @Test
    public void homeFeedPostCardsAndPremiumSettingsRowKeepTheirLegacyDefaultForExistingInstalls() {
        InMemoryBackend backend = v1Backend();

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertTrue(config.isHomeFeedPostCardsSuppressionEnabled());
        assertTrue(config.isPremiumSettingsRowSuppressionEnabled());
        assertEquals(true, backend.values.get(LinimalConfigSchema.HOME_FEED_POST_CARDS_ENABLED_KEY));
        assertEquals(true, backend.values.get(LinimalConfigSchema.PREMIUM_SETTINGS_ROW_ENABLED_KEY));
    }

    @Test
    public void homeFeedPostCardsAndPremiumSettingsRowAreIndependentOfTheirNeighbouringFeatures() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        config.setSuppressionEnabled(LinimalFeature.HOME_FEED_POST_CARDS, true);
        config.setSuppressionEnabled(LinimalFeature.PREMIUM_SETTINGS_ROW, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertTrue(config.isHomeFeedPostCardsSuppressionEnabled());
        assertTrue(config.isPremiumSettingsRowSuppressionEnabled());
        assertFalse(config.isHomeRecommendationsSuppressionEnabled());
        assertFalse(config.isPremiumSuppressionEnabled());
        assertEquals(true, backend.values.get(LinimalConfigSchema.HOME_FEED_POST_CARDS_ENABLED_KEY));
        assertEquals(true, backend.values.get(LinimalConfigSchema.PREMIUM_SETTINGS_ROW_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.HOME_RECOMMENDATIONS_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.PREMIUM_ENABLED_KEY));

        config.setSuppressionEnabled(LinimalFeature.HOME_RECOMMENDATIONS, true);
        config.setSuppressionEnabled(LinimalFeature.PREMIUM, true);
        config.setSuppressionEnabled(LinimalFeature.HOME_FEED_POST_CARDS, false);
        config.setSuppressionEnabled(LinimalFeature.PREMIUM_SETTINGS_ROW, false);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertFalse(config.isSuppressionEnabled(LinimalFeature.HOME_FEED_POST_CARDS));
        assertFalse(config.isSuppressionEnabled(LinimalFeature.PREMIUM_SETTINGS_ROW));
        assertTrue(config.isHomeRecommendationsSuppressionEnabled());
        assertTrue(config.isPremiumSuppressionEnabled());
    }

    /** プレビューの Premium 案内は、ほかの Premium 系の設定と独立に保存されます。 */
    @Test
    public void premiumPreviewPromotionIsIndependentOfTheOtherPremiumFeatures() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        config.setSuppressionEnabled(LinimalFeature.PREMIUM_PREVIEW_PROMOTION, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertTrue(config.isPremiumPreviewPromotionSuppressionEnabled());
        assertFalse(config.isPremiumSuppressionEnabled());
        assertFalse(config.isPremiumSettingsRowSuppressionEnabled());
        assertEquals(true, backend.values.get(LinimalConfigSchema.PREMIUM_PREVIEW_PROMOTION_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.PREMIUM_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.PREMIUM_SETTINGS_ROW_ENABLED_KEY));

        config.setSuppressionEnabled(LinimalFeature.PREMIUM, true);
        config.setSuppressionEnabled(LinimalFeature.PREMIUM_PREVIEW_PROMOTION, false);
        config = config.restartForTesting();

        assertFalse(config.isPremiumPreviewPromotionSuppressionEnabled());
        assertTrue(config.isPremiumSuppressionEnabled());
    }

    @Test
    public void homeFeaturedCollectionsKeepsItsLegacyDefaultAndStaysIndependentOfTheOtherHomeRows() {
        InMemoryBackend backend = v1Backend();

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertTrue(config.isHomeFeaturedCollectionsSuppressionEnabled());
        assertEquals(
                true,
                backend.values.get(LinimalConfigSchema.HOME_FEATURED_COLLECTIONS_ENABLED_KEY));

        config.setSuppressionEnabled(LinimalFeature.HOME_FEATURED_COLLECTIONS, false);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertFalse(config.isHomeFeaturedCollectionsSuppressionEnabled());
        assertEquals(false, backend.values.get(LinimalConfigSchema.HOME_FEATURED_COLLECTIONS_ENABLED_KEY));
        assertTrue(config.isHomeFeedPostCardsSuppressionEnabled());
        assertTrue(config.isHomeTrendingSuppressionEnabled());
        assertTrue(config.isHomeRecommendationsSuppressionEnabled());

        config.setSuppressionEnabled(LinimalFeature.HOME_FEATURED_COLLECTIONS, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertTrue(config.isSuppressionEnabled(LinimalFeature.HOME_FEATURED_COLLECTIONS));
    }

    @Test
    public void existingValidV2ValuesTakePrecedenceOverLegacyMigrationSources() {
        InMemoryBackend backend = v1Backend();
        backend.values.put(LinimalConfigSchema.ADS_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.LINE_AI_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY, true);
        backend.values.put(LinimalConfigSchema.HOME_TOP_AD_ENABLED_KEY, true);
        backend.values.put(LinimalConfigSchema.AGENT_I_HOME_HEADER_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.AGENT_I_CHAT_INFORMATION_ENABLED_KEY, true);
        backend.values.put(LinimalConfigSchema.LINE_AI_GALLERY_VIEWER_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.SHOPPING_ENABLED_KEY, false);

        LinimalConfig config = configFor(backend);

        assertTrue(config.isSmartChannelAdsSuppressionEnabled());
        assertTrue(config.isHomeTopAdSuppressionEnabled());
        assertFalse(config.isAgentIHomeHeaderSuppressionEnabled());
        assertTrue(config.isAgentIChatInformationSuppressionEnabled());
        assertFalse(config.isLineAiGalleryViewerSuppressionEnabled());
        assertFalse(config.isShoppingSuppressionEnabled());
    }

    @Test
    public void invalidLegacyMigrationValueFailsOpenWithoutAdvancingSchema() {
        InMemoryBackend backend = v1Backend();
        backend.values.put(LinimalConfigSchema.ADS_ENABLED_KEY, "true");

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertEquals(1, backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.HOME_TOP_AD_ENABLED_KEY));
    }

    @Test
    public void invalidNewMigrationValueFailsOpenWithoutAdvancingSchema() {
        InMemoryBackend backend = v1Backend();
        backend.values.put(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY, "true");

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertEquals(1, backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.HOME_TOP_AD_ENABLED_KEY));
    }

    @Test
    public void v2MigrationWriteFailureDoesNotAdvanceSchema() {
        FailingWriteBackend backend = new FailingWriteBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 1);
        backend.values.put(LinimalConfigSchema.ADS_ENABLED_KEY, true);

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertEquals(1, backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY));
    }

    @Test
    public void migrationWithoutPersistedProgressFailsOpenInsteadOfRetryingForever() {
        IgnoringWriteBackend backend = new IgnoringWriteBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 1);

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertEquals(1, backend.writeCount);
        assertEquals(1, backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
    }

    @Test
    public void invalidReadReceiptModeFailsOpen() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.READ_RECEIPT_MODE_KEY, "automatic");

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isAgentIChatInformationSuppressionEnabled());
        assertEquals(ReadReceiptMode.NORMAL, config.getReadReceiptMode());
    }

    @Test
    public void invalidSchemaTypeFailsOpenWithoutOverwritingIt() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, "2");

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertEquals("2", backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
    }

    @Test
    public void unsupportedSchemaFailsOpenWithoutOverwritingIt() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(
                LinimalConfigSchema.SCHEMA_VERSION_KEY,
                LinimalConfigSchema.CURRENT_VERSION + 1);

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isNewsSuppressionEnabled());
        assertEquals(
                LinimalConfigSchema.CURRENT_VERSION + 1,
                backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
    }

    @Test
    public void readFailureFailsOpen() {
        LinimalConfig config = LinimalConfig.fromStoreForTesting(
                LinimalConfigStore.forTesting(new FailingReadBackend()));

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isPremiumSuppressionEnabled());
        assertEquals(ReadReceiptMode.NORMAL, config.getReadReceiptMode());
    }

    @Test
    public void genericWritesPersistAndRefreshTheTypedSnapshot() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        config.setSuppressionEnabled(LinimalFeature.SMART_CHANNEL_ADS, false);
        config.setSuppressionEnabled(LinimalFeature.HOME_TOP_AD, false);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_HOME_HEADER, false);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_INFORMATION, false);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_WALLET_HEADER, false);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_SETTINGS, false);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_COMPOSER, false);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_LIST_SEARCH, false);
        config.setSuppressionEnabled(LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU, false);
        config.setSuppressionEnabled(LinimalFeature.LINE_AI_GALLERY_VIEWER, false);
        config.setSuppressionEnabled(LinimalFeature.SHOPPING, false);

        config.setSuppressionEnabled(LinimalFeature.SMART_CHANNEL_ADS, true);
        config.setSuppressionEnabled(LinimalFeature.HOME_TOP_AD, true);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_HOME_HEADER, true);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_INFORMATION, true);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_WALLET_HEADER, true);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_SETTINGS, true);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_COMPOSER, true);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_LIST_SEARCH, true);
        config.setSuppressionEnabled(LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU, true);
        config.setSuppressionEnabled(LinimalFeature.LINE_AI_GALLERY_VIEWER, true);
        config.setSuppressionEnabled(LinimalFeature.SHOPPING, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertTrue(config.isSmartChannelAdsSuppressionEnabled());
        assertTrue(config.isHomeTopAdSuppressionEnabled());
        assertAllAgentIStates(config, true);
        assertTrue(config.isShoppingSuppressionEnabled());
        assertTrue(config.isSuppressionEnabled(LinimalFeature.SMART_CHANNEL_ADS));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.HOME_TOP_AD));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.AGENT_I_HOME_HEADER));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_INFORMATION));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.AGENT_I_WALLET_HEADER));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.AGENT_I_SETTINGS));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_COMPOSER));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_LIST_SEARCH));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.LINE_AI_GALLERY_VIEWER));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.SHOPPING));
        assertEquals(true, backend.values.get(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY));
        assertEquals(true, backend.values.get(LinimalConfigSchema.HOME_TOP_AD_ENABLED_KEY));
        assertAllAgentIStoredValues(backend.values, true);
        assertEquals(true, backend.values.get(LinimalConfigSchema.SHOPPING_ENABLED_KEY));
    }

    @Test
    public void featureAndReadReceiptModeWritesPersistAndRefreshTheTypedSnapshot() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        config.setSuppressionEnabled(LinimalFeature.PREMIUM, false);
        config.setSuppressionEnabled(LinimalFeature.WALLET, true);
        config.setReadReceiptMode(ReadReceiptMode.MANUAL);
        config.setSuppressionEnabled(LinimalFeature.EXTERNAL_BROWSER, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertFalse(config.isPremiumSuppressionEnabled());
        assertTrue(config.isWalletSuppressionEnabled());
        assertEquals(ReadReceiptMode.MANUAL, config.getReadReceiptMode());
        assertTrue(config.isExternalBrowserOverrideEnabled());
        assertEquals(false, backend.values.get(LinimalConfigSchema.PREMIUM_ENABLED_KEY));
        assertEquals(true, backend.values.get(LinimalConfigSchema.WALLET_ENABLED_KEY));
        assertEquals("manual", backend.values.get(LinimalConfigSchema.READ_RECEIPT_MODE_KEY));
        assertEquals(true, backend.values.get(LinimalConfigSchema.EXTERNAL_BROWSER_ENABLED_KEY));
    }

    @Test
    public void miniWritesUseTheirOwnKeyAndDoNotChangeTheOtherTabs() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        config.setSuppressionEnabled(LinimalFeature.MINI, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertTrue(config.isMiniSuppressionEnabled());
        assertFalse(config.isWalletSuppressionEnabled());
        assertFalse(config.isVoomSuppressionEnabled());
        assertFalse(config.isNewsSuppressionEnabled());
        assertFalse(config.isShoppingSuppressionEnabled());
        assertEquals(true, backend.values.get(LinimalConfigSchema.MINI_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.WALLET_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.VOOM_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.NEWS_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.SHOPPING_ENABLED_KEY));
    }

    @Test
    public void chatListHeaderWritesUseTheirOwnKeysAndStayIndependent() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        config.setSuppressionEnabled(LinimalFeature.CHAT_LIST_HEADER_CALENDAR, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertTrue(config.isChatListHeaderCalendarSuppressionEnabled());
        assertFalse(config.isChatListHeaderAiFriendsSuppressionEnabled());
        assertFalse(config.isChatListHeaderOpenChatSuppressionEnabled());
        // チャットの + メニューのカレンダーとは別の設定なので、こちらは既定のままです。
        assertFalse(config.isChatCalendarSuppressionEnabled());
        assertNull(backend.values.get(LinimalConfigSchema.CHAT_CALENDAR_ENABLED_KEY));
        assertEquals(
                true,
                backend.values.get(LinimalConfigSchema.CHAT_LIST_HEADER_CALENDAR_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.CHAT_LIST_HEADER_AI_FRIENDS_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.CHAT_LIST_HEADER_OPEN_CHAT_ENABLED_KEY));
    }

    @Test
    public void genericSuppressionAccessUsesTheSpecifiedExistingFeature() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        config.setSuppressionEnabled(LinimalFeature.PREMIUM, false);
        config.setSuppressionEnabled(LinimalFeature.WALLET, true);

        assertFalse(config.isSuppressionEnabled(LinimalFeature.PREMIUM));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.WALLET));
        assertEquals(false, backend.values.get(LinimalConfigSchema.PREMIUM_ENABLED_KEY));
        assertEquals(true, backend.values.get(LinimalConfigSchema.WALLET_ENABLED_KEY));
    }

    @Test
    public void legacyFeatureAliasesResolveToTheirReplacementKeys() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);

        config.setSuppressionEnabled(LinimalFeature.SMART_CHANNEL_ADS, false);
        config.setSuppressionEnabled(LinimalFeature.HOME_TOP_AD, false);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_HOME_HEADER, false);
        config.setSuppressionEnabled(LinimalFeature.AGENT_I_CHAT_INFORMATION, false);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertFalse(config.isSuppressionEnabled(LinimalFeature.ADS));
        assertFalse(config.isSuppressionEnabled(LinimalFeature.LINE_AI));

        config.setSuppressionEnabled(LinimalFeature.ADS, true);
        config.setSuppressionEnabled(LinimalFeature.LINE_AI, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertTrue(config.isSmartChannelAdsSuppressionEnabled());
        assertFalse(config.isHomeTopAdSuppressionEnabled());
        assertFalse(config.isAgentIHomeHeaderSuppressionEnabled());
        assertTrue(config.isAgentIChatInformationSuppressionEnabled());
        assertTrue(config.isSuppressionEnabled(LinimalFeature.ADS));
        assertTrue(config.isSuppressionEnabled(LinimalFeature.LINE_AI));
        assertNull(backend.values.get(LinimalConfigSchema.ADS_ENABLED_KEY));
        assertNull(backend.values.get(LinimalConfigSchema.LINE_AI_ENABLED_KEY));
    }

    @Test
    public void nullPersistedValuesAreInvalidRatherThanDefaults() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.EXTERNAL_BROWSER_ENABLED_KEY, null);

        LinimalConfig config = configFor(backend);

        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isExternalBrowserOverrideEnabled());
    }

    @Test
    public void unknownStoredReadReceiptModeIsRejectedExactly() {
        try {
            ReadReceiptMode.fromStoredValue("NORMAL");
            fail("Uppercase mode must not be accepted");
        } catch (ConfigStoreException expected) {
            // 想定どおりです。stored value は安定した厳密な schema 契約です。
        }
    }

    @Test
    public void featuresWithoutAnOkPatchStatusIgnoreStoredValues() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend, availableFeatures(LinimalFeature.PREMIUM));

        config.setSuppressionEnabled(LinimalFeature.PREMIUM, true);
        config.setSuppressionEnabled(LinimalFeature.VOOM, true);
        // 表示系の機能は、再起動後に hook へ反映されます。
        config = config.restartForTesting();

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        assertTrue(config.isPremiumSuppressionEnabled());
        assertTrue(config.isSuppressionEnabled(LinimalFeature.PREMIUM));
        assertFalse(config.isVoomSuppressionEnabled());
        assertFalse(config.isSuppressionEnabled(LinimalFeature.VOOM));
    }

    @Test
    public void writesArePersistedRegardlessOfPatchStatusSoTheyReturnWithAWorkingBuild() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend, FeatureAvailability.NONE);

        config.setSuppressionEnabled(LinimalFeature.VOOM, true);
        config.setReadReceiptMode(ReadReceiptMode.MANUAL);

        assertFalse(config.isVoomSuppressionEnabled());
        assertEquals(ReadReceiptMode.NORMAL, config.getReadReceiptMode());
        assertEquals(true, backend.values.get(LinimalConfigSchema.VOOM_ENABLED_KEY));
        assertEquals("manual", backend.values.get(LinimalConfigSchema.READ_RECEIPT_MODE_KEY));

        // patch が揃ったビルドへ入れ替えると、保存済みの設定がそのまま復活します。
        LinimalConfig restored = configFor(backend);

        assertTrue(restored.isVoomSuppressionEnabled());
        assertEquals(ReadReceiptMode.MANUAL, restored.getReadReceiptMode());
    }

    @Test
    public void unreadablePatchStatusRestoresOriginalBehaviorForEveryFeature() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend, FeatureAvailability.NONE);
        for (LinimalFeature feature : LinimalFeature.values()) {
            config.setSuppressionEnabled(feature, true);
        }
        config.setReadReceiptMode(ReadReceiptMode.MANUAL);

        assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
        for (LinimalFeature feature : LinimalFeature.values()) {
            assertFalse(feature.name(), config.isSuppressionEnabled(feature));
        }
        assertFalse(config.isExternalBrowserOverrideEnabled());
        assertFalse(config.isReadWithoutReceiptEnabled());
        assertEquals(ReadReceiptMode.NORMAL, config.getReadReceiptMode());
    }

    @Test
    public void previewScrollPersistsIndependentlyAndFailsOpenWhenUnavailable() throws Exception {
        java.lang.reflect.Field shared = LinimalConfig.class.getDeclaredField("shared");
        shared.setAccessible(true);
        LinimalConfig previous = (LinimalConfig) shared.get(null);
        try {
            InMemoryBackend backend = new InMemoryBackend();
            LinimalConfig config = configFor(backend);
            shared.set(null, config);
            assertFalse(PreviewScrollHooks.allowScroll(false));
            assertTrue(PreviewScrollHooks.allowScroll(true));

            config.setSuppressionEnabled(LinimalFeature.PREVIEW_SCROLL, true);
            assertEquals(true, backend.values.get("linimal.preview.scroll"));
            assertFalse(PreviewScrollHooks.allowScroll(false));
            assertTrue(config.isRestartPending(LinimalFeature.PREVIEW_SCROLL));
            config = config.restartForTesting();
            shared.set(null, config);
            assertTrue(PreviewScrollHooks.allowScroll(false));
            assertTrue(PreviewScrollHooks.allowScroll(true));
            assertFalse(config.isPremiumPreviewPromotionSuppressionEnabled());

            config.setSuppressionEnabled(LinimalFeature.PREMIUM_PREVIEW_PROMOTION, true);
            config.setSuppressionEnabled(LinimalFeature.PREVIEW_SCROLL, false);
            config = config.restartForTesting();
            shared.set(null, config);
            assertFalse(PreviewScrollHooks.allowScroll(false));
            assertTrue(config.isPremiumPreviewPromotionSuppressionEnabled());

            config.setSuppressionEnabled(LinimalFeature.PREVIEW_SCROLL, true);
            config = configFor(backend, availableFeatures(LinimalFeature.PREMIUM_PREVIEW_PROMOTION));
            shared.set(null, config);
            assertFalse(PreviewScrollHooks.allowScroll(false));
            assertTrue(PreviewScrollHooks.allowScroll(true));
            assertEquals(true, backend.values.get("linimal.preview.scroll"));
            config = configFor(backend);
            shared.set(null, config);
            assertTrue(PreviewScrollHooks.allowScroll(false));
        } finally {
            shared.set(null, previous);
        }
    }

    @Test
    public void previewScrollPreservesOriginalAfterStorageFailure() throws Exception {
        java.lang.reflect.Field shared = LinimalConfig.class.getDeclaredField("shared");
        shared.setAccessible(true);
        LinimalConfig previous = (LinimalConfig) shared.get(null);
        try {
            FailingWriteBackend backend = new FailingWriteBackend();
            backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, LinimalConfigSchema.CURRENT_VERSION);
            backend.values.put("linimal.preview.scroll", true);
            LinimalConfig config = configFor(backend);
            shared.set(null, config);
            assertTrue(PreviewScrollHooks.allowScroll(false));
            config.setSuppressionEnabled(LinimalFeature.PREVIEW_SCROLL, false);
            assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
            assertFalse(PreviewScrollHooks.allowScroll(false));
            assertTrue(PreviewScrollHooks.allowScroll(true));
        } finally {
            shared.set(null, previous);
        }
    }

    @Test
    public void notificationUnreadSuppressionPersistsIndependentlyOfTheMenuSetting() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);
        assertFalse(config.isNotificationReadWithoutReceiptEnabled());

        config.setSuppressionEnabled(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT, true);
        assertEquals(true, backend.values.get(
                LinimalConfigSchema.NOTIFICATION_READ_WITHOUT_RECEIPT_ENABLED_KEY));
        config = configFor(backend);
        assertTrue(config.isNotificationReadWithoutReceiptEnabled());
        assertFalse(config.isReadWithoutReceiptEnabled());

        config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, true);
        config = configFor(backend);
        assertTrue(config.isNotificationReadWithoutReceiptEnabled());
        assertTrue(config.isReadWithoutReceiptEnabled());

        config.setSuppressionEnabled(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT, false);
        assertEquals(false, backend.values.get(
                LinimalConfigSchema.NOTIFICATION_READ_WITHOUT_RECEIPT_ENABLED_KEY));
        config = configFor(backend);
        assertFalse(config.isNotificationReadWithoutReceiptEnabled());
        assertTrue(config.isReadWithoutReceiptEnabled());
    }

    @Test
    public void notificationUnreadSuppressionUsesItsOwnAvailabilityWithoutLosingSavedValues() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);
        config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, true);
        config.setSuppressionEnabled(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT, true);

        config = configFor(backend, availableFeatures(LinimalFeature.READ_WITHOUT_RECEIPT));
        assertTrue(config.isReadWithoutReceiptEnabled());
        assertFalse(config.isNotificationReadWithoutReceiptEnabled());
        assertEquals(true, backend.values.get(
                LinimalConfigSchema.NOTIFICATION_READ_WITHOUT_RECEIPT_ENABLED_KEY));

        config = configFor(backend,
                availableFeatures(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT));
        assertFalse(config.isReadWithoutReceiptEnabled());
        assertTrue(config.isNotificationReadWithoutReceiptEnabled());

        config = configFor(backend);
        assertTrue(config.isReadWithoutReceiptEnabled());
        assertTrue(config.isNotificationReadWithoutReceiptEnabled());
    }

    @Test
    public void readReceiptModeFollowsItsOwnPatchStatus() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.READ_RECEIPT_MODE_KEY, "manual");
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, LinimalConfigSchema.CURRENT_VERSION);

        // 送信を止める側だけが適用されていない状態でも、既読は LINE の元どおり自動で送信します。
        assertEquals(
                ReadReceiptMode.NORMAL,
                configFor(backend, availableFeatures(LinimalFeature.PREMIUM)).getReadReceiptMode());
        assertEquals(
                ReadReceiptMode.MANUAL,
                configFor(backend, availableFeatureIds(ReadReceiptMode.FEATURE_ID))
                        .getReadReceiptMode());
    }

    @Test
    public void disablingUnreadSuppressionClearsItsSessionBeforeItCanBeReenabled() throws Exception {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);
        config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, true);
        try {
            markUnreadSession();
            assertTrue(isUnreadSessionBlocked(config));

            config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, false);
            config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, true);

            assertFalse(isUnreadSessionBlocked(config));
        } finally {
            ReadWithoutReceiptHooks.clearSuppression();
        }
    }

    @Test
    public void disablingMenuUnreadSuppressionClearsItsSessionWhileNotificationsRemainEnabled()
            throws Exception {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);
        config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, true);
        config.setSuppressionEnabled(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT, true);
        try {
            markUnreadSession();
            assertTrue(isUnreadSessionBlocked(config));

            config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, false);
            assertTrue(config.isNotificationReadWithoutReceiptEnabled());
            config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, true);

            assertFalse(isUnreadSessionBlocked(config));
        } finally {
            ReadWithoutReceiptHooks.clearSuppression();
        }
    }

    @Test
    public void unreadSessionDoesNotReturnAfterAStorageFailureRecovers() throws Exception {
        FailingWriteBackend backend = new FailingWriteBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, LinimalConfigSchema.CURRENT_VERSION);
        backend.values.put(LinimalConfigSchema.READ_WITHOUT_RECEIPT_ENABLED_KEY, true);
        LinimalConfig config = configFor(backend);
        try {
            markUnreadSession();
            assertTrue(isUnreadSessionBlocked(config));

            config.setSuppressionEnabled(LinimalFeature.PREMIUM, true);
            assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
            config.reload();

            assertEquals(LinimalConfigHealth.OK, config.getRuntimeHealth());
            assertFalse(isUnreadSessionBlocked(config));
        } finally {
            ReadWithoutReceiptHooks.clearSuppression();
        }
    }

    /** Android の時計だけを避け、設定の書込みと実際の抑制状態を一緒に検証します。 */
    private static void markUnreadSession() throws Exception {
        java.lang.reflect.Method mark = ReadWithoutReceiptHooks.class.getDeclaredMethod(
                "markSuppressedAt", String.class, long.class);
        mark.setAccessible(true);
        mark.invoke(null, "chat-1", 10_000L);
    }

    private static boolean isUnreadSessionBlocked(LinimalConfig config) throws Exception {
        java.lang.reflect.Method check = ReadWithoutReceiptHooks.class.getDeclaredMethod(
                "shouldBlockGivenEnabled", String.class, long.class, boolean.class);
        check.setAccessible(true);
        return (Boolean) check.invoke(null, "chat-1", 10_001L, config.isReadWithoutReceiptEnabled());
    }

    @Test
    public void keepUnreadAfterSendDefaultsOffOnFreshInstallAndUpgradePreservesExistingChoices() {
        assertFalse(configFor(new InMemoryBackend()).isKeepUnreadAfterSendEnabled());
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 3);
        backend.values.put(LinimalConfigSchema.READ_WITHOUT_RECEIPT_ENABLED_KEY, true);
        backend.values.put(LinimalConfigSchema.NOTIFICATION_READ_WITHOUT_RECEIPT_ENABLED_KEY, true);
        backend.values.put(LinimalConfigSchema.SMART_CHANNEL_ADS_ENABLED_KEY, false);
        backend.values.put(LinimalConfigSchema.READ_RECEIPT_MODE_KEY, "manual");
        LinimalConfig config = configFor(backend);
        assertFalse(config.isKeepUnreadAfterSendEnabled());
        assertTrue(config.isReadWithoutReceiptEnabled());
        assertTrue(config.isNotificationReadWithoutReceiptEnabled());
        assertFalse(config.isSmartChannelAdsSuppressionEnabled());
        assertEquals(ReadReceiptMode.MANUAL, config.getReadReceiptMode());
    }

    @Test
    public void keepUnreadAfterSendPersistsIndependentlyAndRequiresAnAvailableReadSource() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);
        config.setSuppressionEnabled(LinimalFeature.READ_WITHOUT_RECEIPT, true);
        config.setSuppressionEnabled(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT, true);
        config.setKeepUnreadAfterSendEnabled(true);
        LinimalConfig reopened = configFor(backend);
        assertTrue(reopened.isKeepUnreadAfterSendEnabled());
        assertTrue(reopened.isReadWithoutReceiptEnabled());
        assertTrue(reopened.isNotificationReadWithoutReceiptEnabled());
        assertTrue(configFor(backend, availableFeatures(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT))
                .isKeepUnreadAfterSendEnabled());
        assertFalse(configFor(backend, FeatureAvailability.NONE).isKeepUnreadAfterSendEnabled());
        reopened.setKeepUnreadAfterSendEnabled(false);
        assertFalse(configFor(backend).isKeepUnreadAfterSendEnabled());
        assertTrue(configFor(backend).isNotificationReadWithoutReceiptEnabled());
    }

    @Test
    public void invalidKeepUnreadAfterSendValueFailsOpenWithoutOverwritingTheOldSchema() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 3);
        backend.values.put(LinimalConfigSchema.KEEP_UNREAD_AFTER_SEND_KEY, "true");
        LinimalConfig config = configFor(backend);
        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
        assertFalse(config.isKeepUnreadAfterSendEnabled());
        assertEquals(3, backend.values.get(LinimalConfigSchema.SCHEMA_VERSION_KEY));
    }

    @Test
    public void existingKeepUnreadAfterSendChoiceSurvivesMigrationAndFailedWritesFailOpen() {
        InMemoryBackend existing = new InMemoryBackend();
        existing.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 3);
        existing.values.put(LinimalConfigSchema.KEEP_UNREAD_AFTER_SEND_KEY, true);
        assertTrue(configFor(existing).isKeepUnreadAfterSendEnabled());
        FailingWriteBackend failing = new FailingWriteBackend();
        failing.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, LinimalConfigSchema.CURRENT_VERSION);
        failing.values.put(LinimalConfigSchema.KEEP_UNREAD_AFTER_SEND_KEY, true);
        LinimalConfig config = configFor(failing);
        assertTrue(config.isKeepUnreadAfterSendEnabled());
        config.setKeepUnreadAfterSendEnabled(false);
        assertFalse(config.isKeepUnreadAfterSendEnabled());
        assertEquals(LinimalConfigHealth.ERROR, config.getRuntimeHealth());
    }

    private static InMemoryBackend v1Backend() {
        InMemoryBackend backend = new InMemoryBackend();
        backend.values.put(LinimalConfigSchema.SCHEMA_VERSION_KEY, 1);
        return backend;
    }

    private static void assertAllAgentIStates(LinimalConfig config, boolean expected) {
        assertEquals(expected, config.isAgentIHomeHeaderSuppressionEnabled());
        assertEquals(expected, config.isAgentIChatInformationSuppressionEnabled());
        assertEquals(expected, config.isAgentIWalletHeaderSuppressionEnabled());
        assertEquals(expected, config.isAgentISettingsSuppressionEnabled());
        assertEquals(expected, config.isAgentIChatComposerSuppressionEnabled());
        assertEquals(expected, config.isAgentIChatListSearchSuppressionEnabled());
        assertEquals(expected, config.isLineAiMessageContextMenuSuppressionEnabled());
        assertEquals(expected, config.isLineAiGalleryViewerSuppressionEnabled());
    }

    private static void assertAllAgentIStoredValues(Map<String, Object> values, boolean expected) {
        assertEquals(expected, values.get(LinimalConfigSchema.AGENT_I_HOME_HEADER_ENABLED_KEY));
        assertEquals(expected, values.get(LinimalConfigSchema.AGENT_I_CHAT_INFORMATION_ENABLED_KEY));
        assertEquals(expected, values.get(LinimalConfigSchema.AGENT_I_WALLET_HEADER_ENABLED_KEY));
        assertEquals(expected, values.get(LinimalConfigSchema.AGENT_I_SETTINGS_ENABLED_KEY));
        assertEquals(expected, values.get(LinimalConfigSchema.AGENT_I_CHAT_COMPOSER_ENABLED_KEY));
        assertEquals(expected, values.get(LinimalConfigSchema.AGENT_I_CHAT_LIST_SEARCH_ENABLED_KEY));
        assertEquals(expected, values.get(LinimalConfigSchema.LINE_AI_MESSAGE_CONTEXT_MENU_ENABLED_KEY));
        assertEquals(expected, values.get(LinimalConfigSchema.LINE_AI_GALLERY_VIEWER_ENABLED_KEY));
    }

    @Test
    public void presentationChangesWaitForRestartButBehaviourChangesApplyImmediately() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);
        boolean voomBefore = config.isVoomSuppressionEnabled();

        config.setSuppressionEnabled(LinimalFeature.VOOM, !voomBefore);
        config.setSuppressionEnabled(LinimalFeature.EXTERNAL_BROWSER, true);

        // 表示中の画面を壊さないよう、表示系の hook は起動時の値を使い続けます。設定画面は保存値を表示します。
        assertEquals(voomBefore, config.isVoomSuppressionEnabled());
        assertEquals(!voomBefore, config.isSuppressionEnabled(LinimalFeature.VOOM));
        assertTrue(config.isRestartPending(LinimalFeature.VOOM));
        // 振る舞いの機能はすぐに反映し、再起動を求めません。
        assertTrue(config.isExternalBrowserOverrideEnabled());
        assertFalse(config.isRestartPending(LinimalFeature.EXTERNAL_BROWSER));

        // 元に戻せば、反映待ちの変更はなくなります。
        config.setSuppressionEnabled(LinimalFeature.VOOM, voomBefore);
        assertFalse(config.isRestartPending(LinimalFeature.VOOM));
        config.setSuppressionEnabled(LinimalFeature.VOOM, !voomBefore);

        LinimalConfig restarted = config.restartForTesting();
        assertEquals(!voomBefore, restarted.isVoomSuppressionEnabled());
        assertFalse(restarted.isRestartPending(LinimalFeature.VOOM));
    }

    @Test
    public void valuesReadBeforeASuccessfulLoadAreNotFrozen() {
        InMemoryBackend backend = new InMemoryBackend();
        LinimalConfig config = configFor(backend);
        config.setSuppressionEnabled(LinimalFeature.VOOM, true);
        // 起動直後に hook が初期化前の config（元の LINE）を読んでも、後から読めた設定が使われます。
        LinimalConfig restarted = config.restartForTesting();
        assertTrue(restarted.isVoomSuppressionEnabled());
    }

    @Test
    public void onlyBehaviourFeaturesApplyWithoutRestart() {
        for (LinimalFeature feature : LinimalFeature.values()) {
            boolean behaviour = feature == LinimalFeature.READ_WITHOUT_RECEIPT
                    || feature == LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT
                    || feature == LinimalFeature.EXTERNAL_BROWSER
                    || feature == LinimalFeature.PUSH_NOTIFICATIONS
                    || feature == LinimalFeature.GOOGLE_DRIVE_BACKUP;
            assertEquals(feature.name(), !behaviour, feature.requiresRestart());
        }
    }

    private static LinimalConfig configFor(LinimalConfigStore.PreferenceBackend backend) {
        return LinimalConfig.fromStoreForTesting(LinimalConfigStore.forTesting(backend));
    }

    private static LinimalConfig configFor(
            LinimalConfigStore.PreferenceBackend backend, FeatureAvailability availability) {
        return LinimalConfig.fromStoreForTesting(
                LinimalConfigStore.forTesting(backend), availability);
    }

    /** 指定した機能の patch だけが完全に適用されている状態を表します。 */
    private static FeatureAvailability availableFeatures(LinimalFeature... features) {
        List<String> featureIds = new ArrayList<>();
        for (LinimalFeature feature : features) {
            featureIds.add(feature.getFeatureId());
        }
        return featureIds::contains;
    }

    private static FeatureAvailability availableFeatureIds(String... featureIds) {
        return Arrays.asList(featureIds)::contains;
    }

    private static final class InMemoryBackend implements LinimalConfigStore.PreferenceBackend {
        private final Map<String, Object> values = new HashMap<>();
        private final List<Map<String, Object>> writes = new ArrayList<>();

        @Override
        public Map<String, ?> readAll() {
            return Collections.unmodifiableMap(new HashMap<>(values));
        }

        @Override
        public boolean write(Map<String, Object> updates) {
            writes.add(new HashMap<>(updates));
            values.putAll(updates);
            return true;
        }
    }

    private static final class FailingWriteBackend implements LinimalConfigStore.PreferenceBackend {
        private final Map<String, Object> values = new HashMap<>();

        @Override
        public Map<String, ?> readAll() {
            return Collections.unmodifiableMap(new HashMap<>(values));
        }

        @Override
        public boolean write(Map<String, Object> updates) {
            return false;
        }
    }

    private static final class IgnoringWriteBackend implements LinimalConfigStore.PreferenceBackend {
        private final Map<String, Object> values = new HashMap<>();
        private int writeCount;

        @Override
        public Map<String, ?> readAll() {
            return Collections.unmodifiableMap(new HashMap<>(values));
        }

        @Override
        public boolean write(Map<String, Object> updates) {
            writeCount++;
            return true;
        }
    }

    private static final class FailingReadBackend implements LinimalConfigStore.PreferenceBackend {
        @Override
        public Map<String, ?> readAll() {
            throw new IllegalStateException("Storage unavailable");
        }

        @Override
        public boolean write(Map<String, Object> updates) {
            return false;
        }
    }
}
