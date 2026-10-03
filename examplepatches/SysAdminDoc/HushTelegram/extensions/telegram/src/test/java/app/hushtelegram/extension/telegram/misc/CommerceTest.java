/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.util.Pair;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.util.ArrayList;
import java.util.Arrays;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Uses only patch-written identities as shadows; every visibility and append guard runs normally. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = CommerceTest.Identities.class,
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class CommerceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.HIDE_COMMERCE.resetToDefault();
        Identities.tab = 14;
        Identities.button = 1;
        Identities.broken = false;
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_COMMERCE);
        Settings.HIDE_COMMERCE.resetToDefault();
        HookStatus.clear();
    }

    @Test public void enabledByDefaultHidesEachSalesSurfaceAndCountsOnlyHides() {
        assertTrue(Settings.HIDE_COMMERCE.get());
        ArrayList<Object> rows = new ArrayList<>();
        for (int row = 0; row < 5; row++) assertFalse(Commerce.addSettingsRow(rows, new Object()));
        assertTrue(rows.isEmpty());
        assertFalse(Commerce.showGiftsTab(true));
        assertFalse(Commerce.addProfileTab(rows, Pair.create(14, "Gifts")));
        assertFalse(Commerce.showChannelGiftButton(1, true));
        String report = HookStatus.report().get(0);
        for (String count : new String[]{"Settings sales row hidden 5", "Gifts tab hidden 1",
                "Gifts tab candidate hidden 1", "channel Gift button hidden 1"}) {
            assertTrue(report, report.contains(count));
        }
    }

    @Test public void otherTabsAndChannelButtonsKeepTheirStockVisibilityAndIdentity() {
        ArrayList<Object> tabs = new ArrayList<>();
        for (int tab : new int[]{0, 1, 2, 3, 4, 5, 8, 13, 15}) {
            Pair<Integer, String> row = Pair.create(tab, "ordinary tab");
            assertTrue(Commerce.addProfileTab(tabs, row));
            assertSame(row, tabs.get(tabs.size() - 1));
        }
        for (int button : new int[]{-1, 0, 2, 3, 4, 99}) {
            assertTrue(Commerce.showChannelGiftButton(button, true));
            assertFalse(Commerce.showChannelGiftButton(button, false));
        }
        assertFalse(Commerce.showGiftsTab(false));
        assertFalse(Commerce.showChannelGiftButton(1, false));
        assertNoSuppression();
    }

    @Test public void cachedCandidatesAndFreshPresenceRestoreAfterDisabling() {
        ArrayList<Object> tabs = new ArrayList<>();
        Pair<Integer, String> gifts = Pair.create(14, "Gifts");
        assertFalse(Commerce.showGiftsTab(true));
        assertFalse(Commerce.addProfileTab(tabs, gifts));
        Settings.HIDE_COMMERCE.save(false);
        assertTrue(Commerce.showGiftsTab(true));
        assertTrue(Commerce.addProfileTab(tabs, gifts));
        assertSame(gifts, tabs.get(0));
        HookStatus.clear();
        assertStock();
        assertNoSuppression();
    }

    @Test public void everyPauseReasonKeepsTheStockRowsAndButtons() {
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock();
            assertNoSuppression();
            PauseForTests.resume();
        }
        assertFalse(Commerce.showGiftsTab(true));
    }

    @Test public void settingsNotReadyAndUnreadableSwitchBothFailOpen() {
        SettingsContextRule.withoutContext(this::assertStock);
        assertNoSuppression();
        SettingReadsForTests.breakReads(Settings.HIDE_COMMERCE);
        assertStock();
        assertNoSuppression();
        assertEquals(Arrays.asList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.HIDE_COMMERCE));
    }

    @Test public void unrecognizedRowsAndMissingOrThrowingIdentitiesAreKept() {
        ArrayList<Object> tabs = new ArrayList<>();
        for (Object tab : new Object[]{null, new Object(), Pair.create("14", "Gifts"),
                Pair.create(14L, "Gifts"), Pair.create(14, new Object())}) {
            assertTrue(Commerce.addProfileTab(tabs, tab));
            assertSame(tab, tabs.get(tabs.size() - 1));
        }
        Identities.tab = -1;
        Identities.button = -1;
        assertTrue(Commerce.addProfileTab(tabs, Pair.create(14, "Gifts")));
        assertTrue(Commerce.showChannelGiftButton(1, true));
        assertTrue(HookStatus.anyMissing());
        Identities.broken = true;
        assertTrue(Commerce.addProfileTab(tabs, Pair.create(14, "Gifts")));
        assertTrue(Commerce.showChannelGiftButton(1, true));
        assertNoSuppression();
    }

    @Test public void identitiesComeFromThePatchRatherThanFixedNumbers() {
        Identities.tab = 41;
        Identities.button = 7;
        ArrayList<Object> tabs = new ArrayList<>();
        assertTrue(Commerce.addProfileTab(tabs, Pair.create(14, "ordinary future tab")));
        assertFalse(Commerce.addProfileTab(tabs, Pair.create(41, "Gifts")));
        assertTrue(Commerce.showChannelGiftButton(1, true));
        assertFalse(Commerce.showChannelGiftButton(7, true));
    }

    @Test public void failuresOfTelegramsOwnAppendAreNotSwallowed() {
        Settings.HIDE_COMMERCE.save(false);
        ArrayList<Object> broken = new ArrayList<Object>() {
            @Override public boolean add(Object row) { throw new IllegalStateException("host append"); }
        };
        for (Runnable append : new Runnable[]{
                () -> Commerce.addSettingsRow(broken, new Object()),
                () -> Commerce.addProfileTab(broken, Pair.create(14, "Gifts"))}) {
            try {
                append.run();
                fail("stock append exception was swallowed");
            } catch (IllegalStateException expected) {
                assertEquals("host append", expected.getMessage());
            }
        }
        assertNoSuppression();
    }

    private void assertStock() {
        ArrayList<Object> rows = new ArrayList<>();
        Object row = new Object();
        assertTrue(Commerce.addSettingsRow(rows, row));
        assertSame(row, rows.get(0));
        Pair<Integer, String> gifts = Pair.create(14, "Gifts");
        assertTrue(Commerce.addProfileTab(rows, gifts));
        assertSame(gifts, rows.get(1));
        assertTrue(Commerce.showGiftsTab(true));
        assertFalse(Commerce.showGiftsTab(false));
        assertTrue(Commerce.showChannelGiftButton(1, true));
        assertFalse(Commerce.showChannelGiftButton(1, false));
    }

    private void assertNoSuppression() {
        assertFalse(HookStatus.report().stream().anyMatch(row -> row.contains("Counted:")));
    }

    @Implements(value = Commerce.class, isInAndroidSdk = false)
    public static class Identities {
        static int tab;
        static int button;
        static boolean broken;

        @Implementation protected static int giftTabId() {
            if (broken) throw new IllegalStateException("missing tab identity");
            return tab;
        }

        @Implementation protected static int giftButtonIndex() {
            if (broken) throw new IllegalStateException("missing button identity");
            return button;
        }
    }
}
