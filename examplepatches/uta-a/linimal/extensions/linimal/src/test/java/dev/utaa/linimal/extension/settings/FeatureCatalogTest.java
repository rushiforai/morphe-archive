package dev.utaa.linimal.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import dev.utaa.linimal.extension.config.LinimalFeature;

public final class FeatureCatalogTest {
    @Test
    public void installedEntriesForPageFiltersUnknownAndDuplicateIds() {
        List<FeatureCatalog.Entry> entries = FeatureCatalog.installedEntriesForPage(
                SettingsPage.HIDE,
                Arrays.asList(
                        "linimal.wallet",
                        "unknown.feature",
                        "linimal.premium",
                        "linimal.wallet"));

        assertEquals(1, entries.size());
        assertEquals("linimal.wallet", entries.get(0).getFeatureId());
        assertEquals(SettingsPage.HIDE, entries.get(0).getPage());
    }

    @Test
    public void installedEntriesForPageReturnsNoSettingsForMissingFeatureIds() {
        assertTrue(FeatureCatalog.installedEntriesForPage(SettingsPage.HIDE, null).isEmpty());
        assertTrue(FeatureCatalog.installedEntriesForPage(
                SettingsPage.HIDE, Collections.singletonList("unknown.feature")).isEmpty());
    }

    @Test
    public void installedEntriesForPageFiltersByPageAndKeepsCatalogOrder() {
        List<FeatureCatalog.Entry> entries = FeatureCatalog.installedEntriesForPage(
                SettingsPage.AGENT_I,
                Arrays.asList(
                        "linimal.line-ai-gallery-viewer",
                        "linimal.agent-i-home-header",
                        "linimal.premium",
                        "linimal.agent-i-chat-information"));

        assertFeatureIds(entries,
                "linimal.agent-i-home-header",
                "linimal.agent-i-chat-information",
                "linimal.line-ai-gallery-viewer");
        assertEquals(SettingsPage.AGENT_I, entries.get(0).getPage());
    }

    @Test
    public void adsPageListsTheSmartChannelAndHomeAdsWithoutSections() {
        List<FeatureCatalog.Entry> entries = FeatureCatalog.installedEntriesForPage(
                SettingsPage.ADS, allCatalogFeatureIds());

        assertFeatureIds(entries,
                "linimal.smart-channel-ads",
                "linimal.home-top-ad");
        for (FeatureCatalog.Entry entry : entries) {
            assertNull(entry.getFeature().name(), entry.getSection());
        }
        assertEquals("Smart Channel の広告を表示しない", entries.get(0).getTitle());
        assertEquals("ホーム内の広告を表示しない", entries.get(1).getTitle());
    }

    @Test
    public void agentIPageGroupsTheEightEntryPointsByLocation() {
        List<FeatureCatalog.Group> groups = FeatureCatalog.installedGroupsForPage(
                SettingsPage.AGENT_I, allCatalogFeatureIds());

        assertEquals(3, groups.size());
        assertGroup(groups.get(0), SettingsSection.AGENT_I_SCREEN_HEADERS,
                "linimal.agent-i-home-header",
                "linimal.agent-i-wallet-header",
                "linimal.agent-i-chat-list-search");
        assertGroup(groups.get(1), SettingsSection.AGENT_I_CHAT,
                "linimal.agent-i-chat-information",
                "linimal.agent-i-chat-composer",
                "linimal.line-ai-message-context-menu",
                "linimal.line-ai-gallery-viewer");
        assertGroup(groups.get(2), SettingsSection.AGENT_I_SETTINGS,
                "linimal.agent-i-settings");
        assertEquals("各画面の上部", groups.get(0).getSection().getTitle());
        assertEquals("トーク", groups.get(1).getSection().getTitle());
        assertEquals("設定", groups.get(2).getSection().getTitle());
    }

    @Test
    public void hidePageGroupsEntriesByTheScreenTheyBelongTo() {
        List<FeatureCatalog.Group> groups = FeatureCatalog.installedGroupsForPage(
                SettingsPage.HIDE, allCatalogFeatureIds());

        assertEquals(4, groups.size());
        assertGroup(groups.get(0), SettingsSection.HIDE_BOTTOM_TABS,
                "linimal.shopping",
                "linimal.news",
                "linimal.wallet",
                "linimal.mini");
        assertGroup(groups.get(1), SettingsSection.HIDE_CHAT_LIST_HEADER,
                "linimal.chat-list-header-ai-friends",
                "linimal.chat-list-header-calendar",
                "linimal.chat-list-header-open-chat");
        assertGroup(groups.get(2), SettingsSection.HIDE_CHAT_PLUS_MENU,
                "linimal.chat-calendar",
                "linimal.chat-line-gift",
                "linimal.chat-line-pay");
        assertGroup(groups.get(3), SettingsSection.HIDE_HOME,
                "linimal.home-recommendations",
                "linimal.home-trending",
                "linimal.home-feed-post-cards",
                "linimal.home-featured-collections",
                "linimal.home-recent-history");
        assertEquals("下部タブ", groups.get(0).getSection().getTitle());
        assertEquals("トーク一覧の上部", groups.get(1).getSection().getTitle());
        assertEquals("トークの ＋ メニュー", groups.get(2).getSection().getTitle());
        assertEquals("ホーム", groups.get(3).getSection().getTitle());
    }

    /**
     * 小見出しが場所を示すため、項目名からは重複する接頭辞だけを外します。
     * ON が非表示を意味することを読み取れるよう、「表示しない」の言い回しは残します。
     */
    @Test
    public void hidePageTitlesDropTheLocationPrefixButKeepTheSuppressionWording() {
        List<FeatureCatalog.Group> groups = FeatureCatalog.installedGroupsForPage(
                SettingsPage.HIDE, allCatalogFeatureIds());

        List<FeatureCatalog.Entry> chatListHeader = groups.get(1).getEntries();
        assertEquals("AI Friends を表示しない", chatListHeader.get(0).getTitle());
        assertEquals("カレンダーを表示しない", chatListHeader.get(1).getTitle());
        assertEquals("オープンチャットを表示しない", chatListHeader.get(2).getTitle());
        assertEquals("トーク一覧の上部にあるオープンチャットのアイコンを表示しません。",
                chatListHeader.get(2).getSummary());

        // + メニューのカレンダーは同じ項目名になるため、説明文で区別します。
        List<FeatureCatalog.Entry> plusMenu = groups.get(2).getEntries();
        assertEquals("カレンダーを表示しない", plusMenu.get(0).getTitle());
        assertEquals("チャットの + メニューからカレンダーを取り除きます。", plusMenu.get(0).getSummary());
    }


    @Test
    public void generalPageKeepsThePremiumBrowserNotificationAndBackupEntriesWithoutSections() {
        List<FeatureCatalog.Group> groups = FeatureCatalog.installedGroupsForPage(
                SettingsPage.GENERAL, allCatalogFeatureIds());

        assertEquals(1, groups.size());
        assertGroup(groups.get(0), null,
                "linimal.premium",
                "linimal.premium-settings-row",
                "linimal.premium-preview-promotion",
                "linimal.preview-scroll",
                "linimal.external-browser",
                "linimal.push-notifications",
                "linimal.google-drive-backup");
        assertEquals("設定のプレミアムを表示しない", groups.get(0).getEntries().get(1).getTitle());
        assertEquals("プレビューの Premium の案内を表示しない", groups.get(0).getEntries().get(2).getTitle());
    }

    @Test
    public void themePageHoldsTheAmoledEntry() {
        List<FeatureCatalog.Group> groups = FeatureCatalog.installedGroupsForPage(
                SettingsPage.THEME, allCatalogFeatureIds());

        assertEquals(1, groups.size());
        assertGroup(groups.get(0), null, "linimal.amoled-theme");
        assertEquals("ダークモードの背景を黒にする", groups.get(0).getEntries().get(0).getTitle());
    }

    /** 見出しだけが残らないよう、項目がすべて消えた小見出しは Group を作りません。 */
    @Test
    public void installedGroupsForPageDropsSectionsWithoutAnyInstalledEntry() {
        List<FeatureCatalog.Group> groups = FeatureCatalog.installedGroupsForPage(
                SettingsPage.HIDE,
                Arrays.asList(
                        "linimal.news",
                        "linimal.home-trending"));

        assertEquals(2, groups.size());
        assertGroup(groups.get(0), SettingsSection.HIDE_BOTTOM_TABS, "linimal.news");
        assertGroup(groups.get(1), SettingsSection.HIDE_HOME, "linimal.home-trending");
    }

    @Test
    public void installedGroupsForPageReturnsNothingWhenNoEntryIsInstalled() {
        assertTrue(FeatureCatalog.installedGroupsForPage(SettingsPage.HIDE, null).isEmpty());
        assertTrue(FeatureCatalog.installedGroupsForPage(
                SettingsPage.HIDE, Collections.singletonList("unknown.feature")).isEmpty());
        assertTrue(FeatureCatalog.installedGroupsForPage(
                SettingsPage.ROOT, allCatalogFeatureIds()).isEmpty());
    }

    /** 同じ小見出しの項目が離れて並ぶと、見出しが二度描かれてしまうため禁止します。 */
    @Test
    public void everyPageKeepsItsSectionEntriesContiguous() {
        for (SettingsPage page : SettingsPage.values()) {
            Set<SettingsSection> closedSections = new HashSet<>();
            SettingsSection previousSection = null;
            boolean started = false;
            for (FeatureCatalog.Entry entry : FeatureCatalog.installedEntriesForPage(
                    page, allCatalogFeatureIds())) {
                if (started && entry.getSection() != previousSection) {
                    closedSections.add(previousSection);
                }
                assertTrue(page.name() + " / " + entry.getFeature().name(),
                        !closedSections.contains(entry.getSection()));
                previousSection = entry.getSection();
                started = true;
            }
        }
    }

    @Test
    public void installedEntriesForPageRejectsRootAndUnknownIds() {
        assertTrue(FeatureCatalog.installedEntriesForPage(
                SettingsPage.ROOT, Collections.singletonList("linimal.premium")).isEmpty());
        assertTrue(FeatureCatalog.installedEntriesForPage(
                null, Collections.singletonList("linimal.premium")).isEmpty());
    }

    /** deprecated な alias を除くすべての機能を、ちょうど一箇所に置きます。 */
    @Test
    public void everyConfigurableFeatureHasExactlyOneCatalogEntry() {
        for (LinimalFeature feature : LinimalFeature.values()) {
            if (isDeprecatedAlias(feature)) {
                continue;
            }
            int count = 0;
            for (FeatureCatalog.Entry entry : FeatureCatalog.entries()) {
                if (entry.getFeature() == feature) {
                    count++;
                }
            }
            assertEquals(feature.name(), 1, count);
        }
        for (FeatureCatalog.Entry entry : FeatureCatalog.entries()) {
            assertTrue(entry.getFeature().name(), !isDeprecatedAlias(entry.getFeature()));
        }
    }

    @Test
    public void everyFeatureCarriesTheFeatureIdTheCatalogUses() {
        for (LinimalFeature feature : LinimalFeature.values()) {
            String featureId = feature.getFeatureId();
            assertNotNull(feature.name(), featureId);
            assertTrue(feature.name(), featureId.startsWith("linimal."));
        }
        for (FeatureCatalog.Entry entry : FeatureCatalog.entries()) {
            assertEquals(entry.getFeature().getFeatureId(), entry.getFeatureId());
        }
    }

    @Test
    public void everyCatalogEntryBelongsToAPageThatShowsFeatureRows() {
        for (FeatureCatalog.Entry entry : FeatureCatalog.entries()) {
            SettingsPage page = entry.getPage();
            assertNotNull(entry.getFeature().name(), page);
            assertTrue(entry.getFeature().name(), page != SettingsPage.ROOT);
        }
    }

    private static boolean isDeprecatedAlias(LinimalFeature feature) {
        try {
            return LinimalFeature.class.getField(feature.name())
                    .isAnnotationPresent(Deprecated.class);
        } catch (NoSuchFieldException exception) {
            throw new AssertionError(exception);
        }
    }

    private static List<String> allCatalogFeatureIds() {
        List<String> featureIds = new ArrayList<>();
        for (FeatureCatalog.Entry entry : FeatureCatalog.entries()) {
            featureIds.add(entry.getFeatureId());
        }
        return featureIds;
    }

    private static void assertGroup(
            FeatureCatalog.Group group, SettingsSection expectedSection, String... expectedIds) {
        assertEquals(expectedSection, group.getSection());
        assertFeatureIds(group.getEntries(), expectedIds);
    }

    private static void assertFeatureIds(List<FeatureCatalog.Entry> entries, String... expectedIds) {
        assertEquals(expectedIds.length, entries.size());
        for (int index = 0; index < expectedIds.length; index++) {
            assertEquals(expectedIds[index], entries.get(index).getFeatureId());
        }
    }
}
