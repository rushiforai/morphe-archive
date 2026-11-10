package dev.utaa.linimal.extension.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Android framework を起動せず hook の fail-open な値変換を検証します。 */
public final class FeatureHooksTest {
    private enum MainTab {
        HOME,
        TIMELINE,
        NEWS,
        NEWS_ROW,
        WALLET,
        MINI,
        OTHER
    }

    private enum ShoppingTab {
        COMMERCE,
        COMMERCE_TW
    }

    private enum ChatItemType {
        CALENDAR,
        GIFT,
        PAY,
        OTHER
    }

    private static final class ChatItem {
        private final ChatItemType type;

        ChatItem(ChatItemType type) {
            this.type = type;
        }
    }

    /** item の種別とは無関係な static field を持つ、難読化済みクラスにありがちな形です。 */
    private static final class ChatItemWithStaticDefault {
        private static final ChatItemType DEFAULT_TYPE = ChatItemType.PAY;

        private final ChatItemType type;

        ChatItemWithStaticDefault(ChatItemType type) {
            this.type = type;
        }
    }

    /** 同じ enum 型の instance field が 2 つあり、種別を一意に決められない形です。 */
    private static final class AmbiguousChatItem {
        private final ChatItemType first;
        private final ChatItemType second;

        AmbiguousChatItem(ChatItemType first, ChatItemType second) {
            this.first = first;
            this.second = second;
        }
    }

    private static MainTabHooks.HiddenTabs hidden(boolean news, boolean wallet, boolean shopping, boolean mini) {
        return new MainTabHooks.HiddenTabs(news, wallet, shopping, mini);
    }

    /** VOOM はサービス終了に伴い、設定によらず常に隠します。 */
    @Test
    public void timelineButtonIsAlwaysHiddenAndOtherButtonsKeepTheirOriginalPosition() {
        MainTabHooks.HiddenTabs allOff = hidden(false, false, false, false);
        Integer timeline = 2;
        Integer news = 3;

        assertNull(MainTabHooks.visibleButtonPositionForState(MainTab.TIMELINE, timeline, allOff));
        assertSame(news, MainTabHooks.visibleButtonPositionForState(MainTab.NEWS, news, allOff));
        assertSame(news, MainTabHooks.visibleButtonPositionForState(MainTab.HOME, news, allOff));
        assertNull(MainTabHooks.visibleButtonPositionForState(MainTab.NEWS, null, allOff));
    }

    @Test
    public void eachSettingHidesOnlyItsOwnButtons() {
        assertNull(MainTabHooks.visibleButtonPositionForState(
                MainTab.NEWS, 3, hidden(true, false, false, false)));
        assertNull(MainTabHooks.visibleButtonPositionForState(
                MainTab.NEWS_ROW, 3, hidden(true, false, false, false)));
        assertNull(MainTabHooks.visibleButtonPositionForState(
                MainTab.WALLET, 4, hidden(false, true, false, false)));
        assertNull(MainTabHooks.visibleButtonPositionForState(
                ShoppingTab.COMMERCE, 2, hidden(false, false, true, false)));
        assertNull(MainTabHooks.visibleButtonPositionForState(
                ShoppingTab.COMMERCE_TW, 2, hidden(false, false, true, false)));
        assertNull(MainTabHooks.visibleButtonPositionForState(
                MainTab.MINI, 4, hidden(false, false, false, true)));

        MainTabHooks.HiddenTabs onlyNews = hidden(true, false, false, false);
        assertEquals(Integer.valueOf(4), MainTabHooks.visibleButtonPositionForState(MainTab.WALLET, 4, onlyNews));
        assertEquals(Integer.valueOf(4), MainTabHooks.visibleButtonPositionForState(MainTab.MINI, 4, onlyNews));
        assertEquals(Integer.valueOf(2), MainTabHooks.visibleButtonPositionForState(
                ShoppingTab.COMMERCE, 2, onlyNews));
        assertEquals(Integer.valueOf(1), MainTabHooks.visibleButtonPositionForState(MainTab.OTHER, 1, onlyNews));
    }

    /** 設定を読めない（未初期化の）場合も、VOOM だけは隠し、他は元のままにします。 */
    @Test
    public void unavailableConfigStillHidesOnlyTheTimelineButton() {
        assertNull(MainTabHooks.visibleButtonPosition(MainTab.TIMELINE, 2));
        assertEquals(Integer.valueOf(3), MainTabHooks.visibleButtonPosition(MainTab.NEWS, 3));
        assertEquals(Integer.valueOf(4), MainTabHooks.visibleButtonPosition(MainTab.WALLET, 4));
        assertEquals(Integer.valueOf(7), MainTabHooks.visibleButtonPosition(null, 7));
    }

    @Test
    public void walletTooltipIsOnlyKeptWhileTheWalletButtonIsShown() {
        assertTrue(MainTabHooks.keepsWalletTooltip(true));
        assertFalse(MainTabHooks.keepsWalletTooltip(false));
    }

    @Test
    public void restoredPositionOfAHiddenTabFallsBackToTheFirstPage() {
        List<MainTab> tabs = Arrays.asList(
                MainTab.HOME, MainTab.OTHER, MainTab.TIMELINE, MainTab.NEWS, MainTab.WALLET);
        MainTabHooks.HiddenTabs newsHidden = hidden(true, false, false, false);

        assertEquals(0, MainTabHooks.visibleTabPositionForState(tabs, 2, newsHidden));
        assertEquals(0, MainTabHooks.visibleTabPositionForState(tabs, 3, newsHidden));
        assertEquals(4, MainTabHooks.visibleTabPositionForState(tabs, 4, newsHidden));
        assertEquals(1, MainTabHooks.visibleTabPositionForState(tabs, 1, newsHidden));
        assertEquals(3, MainTabHooks.visibleTabPositionForState(tabs, 3, hidden(false, false, false, false)));
    }

    @Test
    public void restoredPositionOutsideTheListIsLeftToLine() {
        List<MainTab> tabs = Arrays.asList(MainTab.HOME, MainTab.NEWS);
        MainTabHooks.HiddenTabs newsHidden = hidden(true, false, false, false);

        assertEquals(5, MainTabHooks.visibleTabPositionForState(tabs, 5, newsHidden));
        assertEquals(-1, MainTabHooks.visibleTabPositionForState(tabs, -1, newsHidden));
        assertEquals(1, MainTabHooks.visibleTabPositionForState(null, 1, newsHidden));
        assertEquals(1, MainTabHooks.visibleTabPositionForState(Arrays.asList("HOME", "NEWS"), 1, newsHidden));
    }

    @Test
    public void unavailableConfigHidesOnlyTheTimelineTabOnRestore() {
        List<MainTab> tabs = Arrays.asList(MainTab.HOME, MainTab.TIMELINE, MainTab.NEWS);

        assertEquals(0, MainTabHooks.visibleTabPosition(tabs, 1));
        assertEquals(2, MainTabHooks.visibleTabPosition(tabs, 2));
        assertEquals(3, MainTabHooks.visibleTabPosition(tabs, 3));
    }

    @Test
    public void requestedHiddenTabOpensTheHomeTab() {
        MainTabHooks.HiddenTabs newsHidden = hidden(true, false, false, false);

        assertSame(MainTab.HOME, MainTabHooks.visibleTabForState(MainTab.NEWS, MainTab.HOME, newsHidden));
        assertSame(MainTab.HOME, MainTabHooks.visibleTabForState(MainTab.TIMELINE, MainTab.HOME, newsHidden));
        assertSame(MainTab.WALLET, MainTabHooks.visibleTabForState(MainTab.WALLET, MainTab.HOME, newsHidden));
        assertSame(MainTab.OTHER, MainTabHooks.visibleTabForState(MainTab.OTHER, MainTab.HOME, newsHidden));
    }

    @Test
    public void requestedTabIsKeptWhenThereIsNoUsableHomeTab() {
        MainTabHooks.HiddenTabs newsHidden = hidden(true, false, false, false);

        assertSame(MainTab.NEWS, MainTabHooks.visibleTabForState(MainTab.NEWS, null, newsHidden));
        assertSame(MainTab.NEWS, MainTabHooks.visibleTabForState(MainTab.NEWS, MainTab.NEWS_ROW, newsHidden));
        assertNull(MainTabHooks.visibleTabForState(null, MainTab.HOME, newsHidden));
        assertSame(MainTab.TIMELINE, MainTabHooks.visibleTab(MainTab.TIMELINE, null));
        assertSame(MainTab.HOME, MainTabHooks.visibleTab(MainTab.TIMELINE, MainTab.HOME));
    }

    @Test
    public void chatMenuUsesEnumFieldShapeRatherThanTheConcreteItemClass() {
        assertTrue(ChatMenuHooks.shouldHideForEnabledStates(
                ChatMenuHooks.findMenuItemType(new ChatItem(ChatItemType.CALENDAR)), true, false, false));
        assertTrue(ChatMenuHooks.shouldHideForEnabledStates("GIFT", false, true, false));
        assertTrue(ChatMenuHooks.shouldHideForEnabledStates("PAY", false, false, true));
        assertFalse(ChatMenuHooks.shouldHideForEnabledStates("OTHER", true, true, true));
    }

    @Test
    public void chatMenuIgnoresStaticFieldsWhenResolvingTheItemType() {
        // static field は item ごとの値ではないため、field の宣言順に関係なく instance field だけを見ます。
        assertTrue("CALENDAR".equals(ChatMenuHooks.findMenuItemType(
                new ChatItemWithStaticDefault(ChatItemType.CALENDAR))));
    }

    @Test
    public void chatMenuFailsOpenWhenTheItemTypeIsAmbiguous() {
        assertNull(ChatMenuHooks.findMenuItemType(
                new AmbiguousChatItem(ChatItemType.CALENDAR, ChatItemType.PAY)));
        assertTrue("GIFT".equals(ChatMenuHooks.findMenuItemType(
                new AmbiguousChatItem(ChatItemType.GIFT, ChatItemType.GIFT))));
    }

    @Test
    public void lineAiOnlyChangesAnEnabledOriginalValueWhenSuppressionIsOn() {
        assertTrue(LineAiHooks.adjustVisibilityForSuppression(true, false));
        assertFalse(LineAiHooks.adjustVisibilityForSuppression(true, true));
        assertFalse(LineAiHooks.adjustVisibilityForSuppression(false, true));
    }

    @Test
    public void smartChannelOnlySuppressesWhenCleanupCanSucceed() {
        Object renderer = new Object();
        assertTrue(SmartChannelHooks.shouldSuppressWith(true, null, ignored -> false));
        assertTrue(SmartChannelHooks.shouldSuppressWith(true, renderer, ignored -> true));
        assertFalse(SmartChannelHooks.shouldSuppressWith(true, renderer, ignored -> false));
        assertFalse(SmartChannelHooks.shouldSuppressWith(false, renderer, ignored -> true));

        assertNull(SmartChannelHooks.rendererForBindingWith(
                true, renderer, ignored -> true));
        assertSame(renderer, SmartChannelHooks.rendererForBindingWith(
                true, renderer, ignored -> false));
        assertSame(renderer, SmartChannelHooks.rendererForBindingWith(
                false, renderer, ignored -> true));
    }

    @Test
    public void tabPositionLookupDoesNotMutateTheCallerList() {
        List<MainTab> mutable = new ArrayList<>(Arrays.asList(MainTab.HOME, MainTab.WALLET));

        MainTabHooks.visibleTabPositionForState(mutable, 1, hidden(false, true, false, false));

        assertTrue(mutable.equals(Arrays.asList(MainTab.HOME, MainTab.WALLET)));
    }
}
