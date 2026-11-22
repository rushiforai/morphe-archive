package dev.utaa.linimal.extension.settings;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public final class SettingsNavigationTest {
    @Test
    public void startsAtRootAndPushesOneChildPage() {
        SettingsNavigation navigation = new SettingsNavigation();

        assertEquals(SettingsPage.ROOT, navigation.getCurrentPage());
        assertTrue(navigation.push(SettingsPage.NOTIFICATIONS));
        assertEquals(SettingsPage.NOTIFICATIONS, navigation.getCurrentPage());
    }

    @Test
    public void pushRejectsRootNullDuplicateAndAdditionalDepth() {
        SettingsNavigation navigation = new SettingsNavigation();

        assertFalse(navigation.push(null));
        assertFalse(navigation.push(SettingsPage.ROOT));
        assertTrue(navigation.push(SettingsPage.HIDE));
        assertFalse(navigation.push(SettingsPage.HIDE));
        assertFalse(navigation.push(SettingsPage.ADS));
        assertEquals(SettingsPage.HIDE, navigation.getCurrentPage());
    }

    @Test
    public void popDistinguishesReturningToRootFromFinishingActivity() {
        SettingsNavigation navigation = new SettingsNavigation();
        navigation.push(SettingsPage.ADS);

        assertEquals(SettingsNavigation.PopResult.RETURNED_TO_ROOT, navigation.pop());
        assertEquals(SettingsPage.ROOT, navigation.getCurrentPage());
        assertEquals(SettingsNavigation.PopResult.FINISH_ACTIVITY, navigation.pop());
        assertEquals(SettingsPage.ROOT, navigation.getCurrentPage());
    }

    @Test
    public void restoreFallsBackToRootForInvalidPaths() {
        assertRestoresRoot(null);
        assertRestoresRoot(new String[]{});
        assertRestoresRoot(new String[]{"GENERAL"});
        assertRestoresRoot(new String[]{"UNKNOWN"});
        assertRestoresRoot(new String[]{"ROOT", "UNKNOWN"});
        assertRestoresRoot(new String[]{"ROOT", null});
        assertRestoresRoot(new String[]{"ROOT", "ROOT"});
        assertRestoresRoot(new String[]{"ROOT", "GENERAL", "HIDE"});
        // 旧構成で保存されたページ ID は解決できないため、ROOT へ倒します。
        assertRestoresRoot(new String[]{"ROOT", "TABS"});
        assertRestoresRoot(new String[]{"ROOT", "HOME"});
        assertRestoresRoot(new String[]{"ROOT", "CHAT"});
        // 削除した Patch Status ページも同じく解決できません。
        assertRestoresRoot(new String[]{"ROOT", "PATCH_STATUS"});
    }

    @Test
    public void serializeRoundTripRestoresRootAndChildPaths() {
        SettingsNavigation rootNavigation = new SettingsNavigation();
        assertArrayEquals(new String[]{"ROOT"}, rootNavigation.serialize());

        SettingsNavigation childNavigation = new SettingsNavigation();
        childNavigation.push(SettingsPage.READ_RECEIPT);
        String[] savedPath = childNavigation.serialize();

        SettingsNavigation restoredNavigation = new SettingsNavigation();
        restoredNavigation.restore(savedPath);
        assertEquals(SettingsPage.READ_RECEIPT, restoredNavigation.getCurrentPage());
        assertArrayEquals(new String[]{"ROOT", "READ_RECEIPT"}, restoredNavigation.serialize());
    }

    @Test
    public void serializationDoesNotExposeMutableNavigationState() {
        SettingsNavigation navigation = new SettingsNavigation();
        navigation.push(SettingsPage.AGENT_I);

        String[] serializedPath = navigation.serialize();
        serializedPath[1] = SettingsPage.HIDE.getId();

        assertEquals(SettingsPage.AGENT_I, navigation.getCurrentPage());
        assertArrayEquals(new String[]{"ROOT", "AGENT_I"}, navigation.serialize());
    }

    private static void assertRestoresRoot(String[] serializedPath) {
        SettingsNavigation navigation = new SettingsNavigation();
        navigation.push(SettingsPage.READ_RECEIPT);

        navigation.restore(serializedPath);

        assertEquals(SettingsPage.ROOT, navigation.getCurrentPage());
    }
}
