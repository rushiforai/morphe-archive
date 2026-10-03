/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.util.Arrays;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Only the patch-written host bridge is shadowed. Settings and failure guards are real. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = ProxyPromotionsTest.ProxyScope.class,
        instrumentedPackages = "app.hushtelegram.extension.telegram.ads")
public class ProxyPromotionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final ProxyState proxy = new ProxyState(42, 42, -100, Boolean.TRUE);
    private final Candidate sponsored = new Candidate(-100);

    @Before public void setUp() {
        Settings.HIDE_SPONSORED_PROXY.resetToDefault();
        HookStatus.clear();
        ProxyScope.calls = 0;
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_SPONSORED_PROXY);
        Settings.HIDE_SPONSORED_PROXY.resetToDefault();
        HookStatus.clear();
    }

    @Test public void enabledByDefaultAndEachPresentationTargetCountsItsOwnSuppression() {
        assertTrue(Settings.HIDE_SPONSORED_PROXY.get());
        assertTrue(ProxyPromotions.hideCachedProxyDialog(proxy, sponsored));
        assertFalse(ProxyPromotions.showSelectedDialog(true, proxy, sponsored));
        assertEquals(2, ProxyScope.calls);
        assertTrue(HookStatus.report().stream().anyMatch(row -> row.contains("cached proxy dialog hidden 1")
                && row.contains("cached proxy folder entry hidden 1")));
    }

    @Test public void proxyTypeIsComparedWithTheHostConstantRatherThanAssumingZero() {
        assertTrue(ProxyPromotions.hideCachedProxyDialog(new ProxyState(19, 19, -100, Boolean.TRUE), sponsored));
        assertFalse(ProxyPromotions.hideCachedProxyDialog(new ProxyState(0, 19, -100, Boolean.TRUE), sponsored));
    }

    @Test public void offPreservesBothStockDecisionsAndNeverReadsHostScope() {
        Settings.HIDE_SPONSORED_PROXY.save(false);
        assertStock();
        assertEquals(0, ProxyScope.calls);
        assertNoSuppression();
    }

    @Test public void everyPauseReasonPreservesStockAndResumeHidesAgain() {
        Settings.HIDE_SPONSORED_PROXY.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock();
            assertNoSuppression();
            PauseForTests.resume();
        }
        assertEquals(0, ProxyScope.calls);
        assertFalse(ProxyPromotions.showSelectedDialog(true, proxy, sponsored));
    }

    @Test public void beforeSettingsAreReadyBothTargetsFailOpenWithoutHostScope() {
        Settings.HIDE_SPONSORED_PROXY.save(true);
        SettingsContextRule.withoutContext(this::assertStock);
        SettingsContextRule.beforeThePauseIsDecided(this::assertStock);
        assertEquals(0, ProxyScope.calls);
        assertNoSuppression();
    }

    @Test public void unreadableSwitchFailsOpenAndReportsTheGuardFailure() {
        SettingReadsForTests.breakReads(Settings.HIDE_SPONSORED_PROXY);
        assertStock();
        assertEquals(0, ProxyScope.calls);
        assertEquals(Arrays.asList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.HIDE_SPONSORED_PROXY));
        assertNoSuppression();
    }

    @Test public void psaOtherAndUnknownPromoKindsKeepTheirStockPresentation() {
        for (int otherType : new int[]{1, 2, 73}) {
            assertStockScope(new ProxyState(otherType, 42, -100, Boolean.TRUE), sponsored);
        }
        assertNoSuppression();
    }

    @Test public void joinedSponsorAndOrdinaryDialogsStayInTheirFolders() {
        assertStockScope(new ProxyState(42, 42, -100, Boolean.FALSE), sponsored);
        assertStockScope(proxy, new Candidate(-101));
        assertStockScope(proxy, new Candidate(100));
        assertStockScope(proxy, new Candidate(0));
        assertNoSuppression();
    }

    @Test public void cachedSponsorWithMissingChatKeepsStockReinsertion() {
        ProxyState missingChat = new ProxyState(42, 42, -100, null);
        assertStockScope(missingChat, sponsored);
        assertNoSuppression();
    }

    @Test public void nonnegativePromoIdsKeepStockReinsertion() {
        for (long id : new long[]{0, 100}) {
            assertStockScope(new ProxyState(42, 42, id, Boolean.TRUE), new Candidate(id));
        }
        assertNoSuppression();
    }

    @Test public void nullUnknownObjectsAndMissingCachedChatFailOpen() {
        assertStockScope(null, sponsored);
        assertStockScope(new Object(), sponsored);
        assertStockScope(proxy, null);
        assertStockScope(proxy, new Object());
        assertStockScope(new ProxyState(42, 42, -100, null), sponsored);
        assertNoSuppression();
    }

    @Test public void originalFalseFolderDecisionStaysFalseWithoutReadingHostScope() {
        assertFalse(ProxyPromotions.showSelectedDialog(false, new BrokenScope(), sponsored));
        assertEquals(0, ProxyScope.calls);
        assertNoSuppression();
    }

    @Test public void brokenScopeFailsOpenWithoutDisablingTheOtherTarget() {
        assertFalse(ProxyPromotions.hideCachedProxyDialog(new BrokenScope(), sponsored));
        assertTrue(ProxyPromotions.showSelectedDialog(true, new BrokenScope(), sponsored));
        assertEquals(Arrays.asList("a working 'proxy dialog scope' hook (it threw java.lang.IllegalStateException)"),
                HookStatus.missing(FamilyNames.HIDE_SPONSORED_PROXY));
        assertNoSuppression();
        assertTrue(ProxyPromotions.hideCachedProxyDialog(proxy, sponsored));
    }

    @Test public void switchingOffRestoresTheSameCachedObjectsWithoutChangingTheirState() {
        assertTrue(ProxyPromotions.hideCachedProxyDialog(proxy, sponsored));
        assertFalse(ProxyPromotions.showSelectedDialog(true, proxy, sponsored));
        Settings.HIDE_SPONSORED_PROXY.save(false);
        assertStockScope(proxy, sponsored);
        assertEquals(-100, proxy.dialogId);
        assertEquals(Boolean.TRUE, proxy.left);
        assertEquals(-100, sponsored.id);
        assertEquals(2, ProxyScope.calls);
    }

    private void assertStock() {
        assertFalse(ProxyPromotions.hideCachedProxyDialog(proxy, sponsored));
        assertTrue(ProxyPromotions.showSelectedDialog(true, proxy, sponsored));
        assertFalse(ProxyPromotions.showSelectedDialog(false, proxy, sponsored));
    }

    private static void assertStockScope(Object controller, Object dialog) {
        assertFalse(ProxyPromotions.hideCachedProxyDialog(controller, dialog));
        assertTrue(ProxyPromotions.showSelectedDialog(true, controller, dialog));
    }

    private void assertNoSuppression() {
        assertFalse(HookStatus.report().stream().anyMatch(row -> row.contains("Counted:")));
    }

    private static final class Candidate {
        final long id;
        Candidate(long id) { this.id = id; }
    }
    private static final class ProxyState {
        final int type, proxyType;
        final long dialogId;
        final Boolean left;
        ProxyState(int type, int proxyType, long dialogId, Boolean left) {
            this.type = type;
            this.proxyType = proxyType;
            this.dialogId = dialogId;
            this.left = left;
        }
    }
    private static final class BrokenScope {}

    @Implements(value = ProxyPromotions.class, isInAndroidSdk = false)
    public static class ProxyScope {
        static int calls;
        @Implementation protected static boolean isSponsoredProxyDialog(Object controller, Object dialog) {
            calls++;
            if (controller instanceof BrokenScope) throw new IllegalStateException("missing host scope");
            if (!(controller instanceof ProxyState) || !(dialog instanceof Candidate)) return false;
            ProxyState state = (ProxyState) controller;
            long id = ((Candidate) dialog).id;
            return state.type == state.proxyType && id < 0 && id == state.dialogId && Boolean.TRUE.equals(state.left);
        }
    }
}
