/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.mature;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.rootmute.HushAccountIdentity;
import app.hushtumblr.extension.tumblr.rootmute.MatureAccountsForTests;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutes;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AllowedMatureContentTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private long clock;
    private final List<Object> tickets = new ArrayList<>();
    private final List<Runnable> queued = new ArrayList<>();

    @Before public void setUp() {
        MatureAccountsForTests.reset();
        AllowedMatureContent.resetForTests();
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.REVEAL_ALLOWED_MATURE_CONTENT.resetToDefault();
        PauseForTests.resume();
        clock = 1_000;
        AllowedMatureContent.clockForTests = () -> clock;
        AllowedMatureContent.wallClockForTests = () -> clock;
        AllowedMatureContent.workerForTests = Runnable::run;
        AllowedMatureContent.service((HushMatureService) tickets::add);
    }
    @After public void restore() {
        Settings.REVEAL_ALLOWED_MATURE_CONTENT.resetToDefault();
        AllowedMatureContent.resetForTests();
        MatureAccountsForTests.restore();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
    }

    @Test public void defaultOffNeverReadsAndNeverChangesEitherNativeResult() {
        adult("account-a");
        assertFalse(Settings.REVEAL_ALLOWED_MATURE_CONTENT.get());
        assertTrue(AllowedMatureContent.cover(true));
        assertFalse(AllowedMatureContent.cover(false));
        assertTrue(tickets.isEmpty());
    }

    @Test public void explicitAdultAllowedResponseRevealsOnlyAtTheNextBindAndReadsOnce() {
        enabledAdult();
        for (int i = 0; i < 100; i++) assertTrue(AllowedMatureContent.cover(true));
        assertEquals(1, tickets.size());
        new NativeMatureContinuation(tickets.get(0)).resumeWith(response(200, permission(true, true)));
        for (int i = 0; i < 100; i++) assertFalse(AllowedMatureContent.cover(true));
        assertEquals(1, tickets.size());
        assertFalse(AllowedMatureContent.cover(false));
    }

    @Test public void diagnosticReportSaysWhereARevealStopped() {
        HookStatus.clear();
        enabledAdult();
        assertTrue(AllowedMatureContent.cover(true));
        HushMaturePermission value = permission(true, true);
        AllowedMatureContent.permissionParsed(value, 0);
        AllowedMatureContent.received(last(), response(200, value));
        assertFalse(AllowedMatureContent.cover(true));
        assertFalse(AllowedMatureContent.cover(true));
        String line = report();
        assertTrue(line, line.contains("settings checks sent 1") && line.contains("answers allowing mature posts 1")
                && line.contains("covers lifted 2"));

        HookStatus.clear();
        adult("account-b");
        assertTrue(AllowedMatureContent.cover(true));
        HushMaturePermission absent = permission(true, true);
        AllowedMatureContent.permissionParsed(absent, 0x10);
        AllowedMatureContent.received(last(), response(200, absent));
        AllowedMatureContent.received(last(), response(200, absent));
        line = report();
        assertTrue(line, line.contains("answers that were not readable 1") && line.contains("answers too late to use 1")
                && !line.contains("covers lifted") && !line.contains("saved answers used"));

        HookStatus.clear();
        adult("account-b");
        clock += AllowedMatureContent.RETRY_MS;
        assertTrue(AllowedMatureContent.cover(true));
        clock += AllowedMatureContent.REQUEST_MS;
        assertTrue(AllowedMatureContent.cover(true));
        assertTrue(report().contains("settings checks timed out 1"));
    }

    private static String report() { return String.join(" | ", HookStatus.report()); }

    @Test public void capturingTheServiceAsksAheadSoTheFirstLabeledCardCanBindRevealed() {
        AllowedMatureContent.resetForTests();
        AllowedMatureContent.clockForTests = () -> clock;
        AllowedMatureContent.workerForTests = Runnable::run;
        enabledAdult();
        AllowedMatureContent.service((HushMatureService) tickets::add);
        assertEquals(1, tickets.size());
        AllowedMatureContent.received(last(), response(200, permission(true, true)));
        assertFalse(AllowedMatureContent.cover(true));
        assertEquals(1, tickets.size());

        AllowedMatureContent.resetForTests();
        AllowedMatureContent.clockForTests = () -> clock;
        AllowedMatureContent.workerForTests = Runnable::run;
        Settings.REVEAL_ALLOWED_MATURE_CONTENT.save(false);
        adult("account-a");
        AllowedMatureContent.service((HushMatureService) tickets::add);
        assertEquals(1, tickets.size());
    }

    @Test public void anAllowingAnswerRefreshesBeforeItExpiresWithoutCoveringAgain() {
        enabledAdult();
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, permission(true, true)));
        clock += AllowedMatureContent.CACHE_MS - AllowedMatureContent.REFRESH_MS - 1;
        assertFalse(AllowedMatureContent.cover(true));
        assertEquals(1, tickets.size());
        clock += 2;
        assertFalse(AllowedMatureContent.cover(true));
        assertEquals(2, tickets.size());
        assertFalse(AllowedMatureContent.cover(true));
        assertEquals(2, tickets.size());
        AllowedMatureContent.received(last(), response(200, permission(true, true)));
        clock += AllowedMatureContent.REFRESH_MS;
        assertFalse(AllowedMatureContent.cover(true));
        assertEquals(2, tickets.size());

        clock += AllowedMatureContent.CACHE_MS - 2 * AllowedMatureContent.REFRESH_MS;
        assertFalse(AllowedMatureContent.cover(true));
        assertEquals(3, tickets.size());
        AllowedMatureContent.received(last(), response(200, permission(true, false)));
        assertTrue(AllowedMatureContent.cover(true));
    }

    @Test public void aKeepingAnswerWaitsOutItsRetryInsteadOfRefreshingAhead() {
        enabledAdult();
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, permission(true, false)));
        clock += AllowedMatureContent.CACHE_MS - 1;
        assertTrue(AllowedMatureContent.cover(true));
        assertEquals(1, tickets.size());
    }

    @Test public void nullableOrDeniedServerFieldsNeverUseHostMapperDefaults() {
        Settings.REVEAL_ALLOWED_MATURE_CONTENT.save(true);
        Boolean[] values = {null, false, true};
        for (Boolean show : values) for (Boolean edit : values) {
            adult("account-a");
            assertTrue(AllowedMatureContent.cover(true));
            AllowedMatureContent.received(last(), response(200, permission(show, edit)));
            assertEquals(Boolean.TRUE.equals(show) && Boolean.TRUE.equals(edit), !AllowedMatureContent.cover(true));
        }
    }

    @Test public void absentCanEditNeverBorrowsTheNativeTrueDefault() {
        enabledAdult();
        for (int mask : new int[] {0x10, 0x20, 0x30}) {
            adult("account-a");
            HushMaturePermission value = permission(true, true);
            AllowedMatureContent.permissionParsed(value, mask);
            assertTrue(AllowedMatureContent.cover(true));
            AllowedMatureContent.received(last(), response(200, value));
            assertTrue(AllowedMatureContent.cover(true));
        }
        adult("account-a");
        HushMaturePermission value = permission(true, true);
        AllowedMatureContent.permissionParsed(value, 0);
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, value));
        assertFalse(AllowedMatureContent.cover(true));
    }

    @Test public void underageMissingAgeRestrictedAndUnparsedGatesDoNotEvenReadPermissions() {
        Settings.REVEAL_ALLOWED_MATURE_CONTENT.save(true);
        for (Account account : new Account[] {
                new Account("account-a", 17, true, gate(false, 0)),
                new Account("account-a", 0, true, gate(false, 0)),
                new Account("account-a", 18, false, gate(false, 0)),
                new Account("account-a", 18, true, gate(true, 0)),
                new Account("account-a", 18, true, gate(false, 1)),
                new Account("account-a", 18, true, new Gate(false)),
                new Account("account-a", 18, true, null),
        }) {
            MatureAccountsForTests.commit(account);
            assertTrue(AllowedMatureContent.cover(true));
        }
        assertTrue(tickets.isEmpty());
        RootPostMutes.logout();
        assertTrue(AllowedMatureContent.cover(true));
        assertTrue(tickets.isEmpty());
    }

    @Test public void equalAgeObjectsCannotBorrowExplicitJsonPresenceFromEachOther() {
        Settings.REVEAL_ALLOWED_MATURE_CONTENT.save(true);
        Gate parsed = gate(false, 0);
        Gate missing = new Gate(false);
        assertEquals(parsed, missing);
        MatureAccountsForTests.commit(new Account("account-a", 25, true, missing));
        assertTrue(AllowedMatureContent.cover(true));
        assertTrue(tickets.isEmpty());
        MatureAccountsForTests.commit(new Account("account-a", 25, true, parsed));
        assertTrue(AllowedMatureContent.cover(true));
        assertEquals(1, tickets.size());
    }

    @Test public void pauseStartupMissingFamilyAndMissingCapabilityKeepTheCoverAndSavedChoice() {
        enabledAdult();
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, permission(true, true)));
        assertFalse(AllowedMatureContent.cover(true));
        for (HushTumblrPause.Reason reason : HushTumblrPause.Reason.values()) {
            if (reason == HushTumblrPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(AllowedMatureContent.cover(true));
            assertTrue(Settings.REVEAL_ALLOWED_MATURE_CONTENT.savedValue());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertTrue(AllowedMatureContent.cover(true)));
        SettingsContextRule.beforeThePauseIsDecided(() -> assertTrue(AllowedMatureContent.cover(true)));
        PatchFamilyForTests.inBuild(EnumSet.noneOf(PatchFamily.class));
        assertTrue(AllowedMatureContent.cover(true));
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertTrue(AllowedMatureContent.cover(true));
        assertEquals(1, tickets.size());
    }

    @Test public void logoutCredentialReplacementAndSameAccountRefreshRejectOldCompletions() {
        enabledAdult();
        assertTrue(AllowedMatureContent.cover(true));
        Object beforeLogout = last();
        RootPostMutes.logout();
        AllowedMatureContent.received(beforeLogout, response(200, permission(true, true)));
        assertTrue(AllowedMatureContent.cover(true));
        RootPostMutes.credentialsChanged();
        adult("account-b");
        assertTrue(AllowedMatureContent.cover(true));
        Object beforeReplacement = last();
        RootPostMutes.credentialsChanging();
        AllowedMatureContent.received(beforeReplacement, response(200, permission(true, true)));
        assertTrue(AllowedMatureContent.cover(true));
        RootPostMutes.credentialsChanged();
        adult("account-b");
        assertTrue(AllowedMatureContent.cover(true));
        Object beforeRefresh = last();
        adult("account-b");
        AllowedMatureContent.received(beforeRefresh, response(200, permission(true, true)));
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, permission(true, true)));
        assertFalse(AllowedMatureContent.cover(true));
    }

    @Test public void queuedWorkAndConcurrentAccountResponsesStayWithTheirCapturedGeneration() {
        enabledAdult();
        AllowedMatureContent.workerForTests = queued::add;
        assertTrue(AllowedMatureContent.cover(true));
        adult("account-b");
        queued.remove(0).run();
        assertTrue(tickets.isEmpty());
        assertTrue(AllowedMatureContent.cover(true));
        queued.remove(0).run();
        Object requestB = last();
        adult("account-c");
        assertTrue(AllowedMatureContent.cover(true));
        queued.remove(0).run();
        Object requestC = last();
        AllowedMatureContent.received(requestB, response(200, permission(true, true)));
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(requestC, response(200, permission(true, true)));
        assertFalse(AllowedMatureContent.cover(true));
    }

    @Test public void anExpiredAnswerLeansOnTheSavedOneOnlyUntilTheFreshCheckSaysKeep() {
        enabledAdult();
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, permission(true, true)));
        assertFalse(AllowedMatureContent.cover(true));
        clock += AllowedMatureContent.CACHE_MS;
        assertFalse(AllowedMatureContent.cover(true));
        assertEquals(2, tickets.size());
        AllowedMatureContent.received(last(), response(200, permission(false, true)));
        assertTrue(AllowedMatureContent.cover(true));
        clock += AllowedMatureContent.CACHE_MS;
        assertTrue(AllowedMatureContent.cover(true));
        assertEquals(3, tickets.size());
    }

    @Test public void theSavedAllowingAnswerOpensTheRowsBuiltRightAfterARestart() {
        HookStatus.clear();
        enabledAdult();
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, permission(true, true)));
        AllowedMatureContent.restartForTests();
        assertFalse(AllowedMatureContent.cover(true));
        AllowedMatureContent.service((HushMatureService) tickets::add);
        assertEquals(2, tickets.size());
        assertFalse(AllowedMatureContent.cover(true));
        assertTrue(report(), report().contains("saved answers used 2"));

        AllowedMatureContent.received(last(), null);
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.restartForTests();
        assertFalse(AllowedMatureContent.cover(true));

        AllowedMatureContent.restartForTests();
        adult("account-b");
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.restartForTests();
        adult("account-a");
        clock += AllowedMatureContent.REMEMBER_MS;
        assertTrue(AllowedMatureContent.cover(true));
    }

    @Test public void aKeepingOrUnreadableAnswerErasesTheSavedOne() {
        for (Object answer : new Object[] {response(200, permission(true, false)), response(403, permission(true, true))}) {
            enabledAdult();
            AllowedMatureContent.restartForTests();
            AllowedMatureContent.service((HushMatureService) tickets::add);
            AllowedMatureContent.received(last(), response(200, permission(true, true)));
            AllowedMatureContent.restartForTests();
            AllowedMatureContent.service((HushMatureService) tickets::add);
            assertFalse(AllowedMatureContent.cover(true));
            AllowedMatureContent.received(last(), answer);
            assertTrue(AllowedMatureContent.cover(true));
            AllowedMatureContent.restartForTests();
            assertTrue(AllowedMatureContent.cover(true));
        }
    }

    @Test public void failedUnexpectedAndTimedOutRequestsBackOffWithoutAReadPerCard() {
        enabledAdult();
        for (Object result : new Object[] {null, new Object(), response(403, permission(true, true)), response(200, new Object())}) {
            adult("account-a");
            assertTrue(AllowedMatureContent.cover(true));
            AllowedMatureContent.received(last(), result);
            int requests = tickets.size();
            for (int i = 0; i < 30; i++) assertTrue(AllowedMatureContent.cover(true));
            assertEquals(requests, tickets.size());
            clock += AllowedMatureContent.RETRY_MS;
            assertTrue(AllowedMatureContent.cover(true));
            assertEquals(requests + 1, tickets.size());
        }
        Object timedOut = last();
        int requests = tickets.size();
        clock += AllowedMatureContent.REQUEST_MS;
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(timedOut, response(200, permission(true, true)));
        assertTrue(AllowedMatureContent.cover(true));
        assertEquals(requests, tickets.size());
        clock += AllowedMatureContent.RETRY_MS;
        assertTrue(AllowedMatureContent.cover(true));
        assertEquals(requests + 1, tickets.size());
    }

    @Test public void disabledOrReplacedServiceCannotPublishItsEarlierResponse() {
        enabledAdult();
        assertTrue(AllowedMatureContent.cover(true));
        Object oldService = last();
        AllowedMatureContent.service((HushMatureService) tickets::add);
        AllowedMatureContent.received(oldService, response(200, permission(true, true)));
        assertTrue(AllowedMatureContent.cover(true));
        Object disabled = last();
        Settings.REVEAL_ALLOWED_MATURE_CONTENT.save(false);
        AllowedMatureContent.received(disabled, response(200, permission(true, true)));
        Settings.REVEAL_ALLOWED_MATURE_CONTENT.save(true);
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, permission(true, true)));
        assertFalse(AllowedMatureContent.cover(true));
    }

    @Test public void unreadablePermissionOrServiceRetainsTheNativeCover() {
        enabledAdult();
        AllowedMatureContent.service((HushMatureService) request -> { throw new IllegalStateException("offline"); });
        assertTrue(AllowedMatureContent.cover(true));
        assertTrue(AllowedMatureContent.cover(true));
        adult("account-a");
        AllowedMatureContent.service((HushMatureService) tickets::add);
        assertTrue(AllowedMatureContent.cover(true));
        AllowedMatureContent.received(last(), response(200, new HushMaturePermission() {
            @Override public Boolean hushShowMatureContent() { throw new IllegalStateException("unreadable"); }
            @Override public Boolean hushCanEditMatureContent() { return true; }
        }));
        assertTrue(AllowedMatureContent.cover(true));
    }

    private void enabledAdult() { Settings.REVEAL_ALLOWED_MATURE_CONTENT.save(true); adult("account-a"); }
    private void adult(String key) { MatureAccountsForTests.commit(new Account(key, 25, true, gate(false, 0))); }
    private Object last() { return tickets.get(tickets.size() - 1); }
    private static Gate gate(boolean block, int mask) {
        Gate gate = new Gate(block);
        AllowedMatureContent.ageGateParsed(gate, mask);
        return gate;
    }
    private static HushMaturePermission permission(Boolean show, Boolean edit) {
        HushMaturePermission value = new HushMaturePermission() {
            @Override public Boolean hushShowMatureContent() { return show; }
            @Override public Boolean hushCanEditMatureContent() { return edit; }
        };
        AllowedMatureContent.permissionParsed(value, 0);
        return value;
    }
    private static HushMatureResponse response(int status, Object body) {
        return new HushMatureResponse() {
            @Override public Object hushResponse() { return body; }
            @Override public int hushStatus() { return status; }
        };
    }
    private static final class Gate implements HushAgeVerification {
        final boolean block;
        Gate(boolean block) { this.block = block; }
        @Override public boolean hushBlockApp() { return block; }
        @Override public boolean equals(Object other) { return other instanceof Gate && ((Gate) other).block == block; }
        @Override public int hashCode() { return block ? 1 : 0; }
    }
    private static final class Account implements HushAccountIdentity, HushMatureAccount {
        final String key; final int age; final boolean modify; final Object gate;
        Account(String key, int age, boolean modify, Object gate) { this.key = key; this.age = age; this.modify = modify; this.gate = gate; }
        @Override public String hushAccountId() { return key; }
        @Override public int hushAge() { return age; }
        @Override public boolean hushCanModifySafeMode() { return modify; }
        @Override public Object hushAgeVerification() { return gate; }
    }
}
