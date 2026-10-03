/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** The exact allowlist, stored-set isolation, guard modes and fail-open behavior. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SuggestionsTest {
    private static final String[] PROMOTIONS = {
            "PREMIUM_UPGRADE", "PREMIUM_CHRISTMAS", "PREMIUM_RESTORE", "PREMIUM_SMSJOBS",
            "BIRTHDAY_SETUP", "BIRTHDAY_CONTACTS_TODAY", "STARS_SUBSCRIPTION_LOW_BALANCE"
    };

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void setUp() {
        Settings.HIDE_PROMOTIONAL_BANNERS.save(true);
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_PROMOTIONAL_BANNERS);
        Settings.HIDE_PROMOTIONAL_BANNERS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void eachApprovedKeyIsHiddenWithoutRemovingAnyStoredSuggestion() {
        for (String key : PROMOTIONS) {
            Set<String> stored = set("VALIDATE_PASSWORD", key, "VALIDATE_PHONE_NUMBER", "FUTURE_KEY");
            Set<String> before = new LinkedHashSet<>(stored);
            Set<String> visible = Suggestions.filterChatList(stored);
            assertNotSame(key, stored, visible);
            assertEquals(key, Arrays.asList("VALIDATE_PASSWORD", "VALIDATE_PHONE_NUMBER", "FUTURE_KEY"),
                    new ArrayList<>(visible));
            assertEquals(key + " must remain stored", before, stored);
        }
    }

    @Test
    public void mixedSuggestionsKeepTheirOrderAndThePresentationCopyIsIndependent() {
        Set<String> stored = set("PREMIUM_UPGRADE", "VALIDATE_PHONE_NUMBER", "BIRTHDAY_SETUP",
                "PREMIUM_ANNUAL", "PREMIUM_SMSJOBS", "SETUP_PASSKEY", "PREMIUM_GRACE", "VALIDATE_PASSWORD");
        Set<String> before = new LinkedHashSet<>(stored);
        Set<String> visible = Suggestions.filterChatList(Collections.unmodifiableSet(stored));
        assertEquals(Arrays.asList("VALIDATE_PHONE_NUMBER", "PREMIUM_ANNUAL", "SETUP_PASSKEY",
                "PREMIUM_GRACE", "VALIDATE_PASSWORD"), new ArrayList<>(visible));
        visible.remove("VALIDATE_PASSWORD");
        visible.add("LOCAL_ONLY");
        assertEquals(before, stored);
        assertFalse("a presentation edit must not reach storage", stored.contains("LOCAL_ONLY"));
    }

    @Test
    public void anAllPromotionalSetProducesAnEmptyCopyAndCanBeRestoredWhenTurnedOff() {
        Set<String> stored = set(PROMOTIONS);
        assertTrue(Suggestions.filterChatList(stored).isEmpty());
        assertEquals(PROMOTIONS.length, stored.size());
        Settings.HIDE_PROMOTIONAL_BANNERS.save(false);
        assertSame(stored, Suggestions.filterChatList(stored));
        assertEquals(set(PROMOTIONS), stored);
    }

    @Test
    public void unknownNullEmptyAndSimilarKeysKeepTheOriginalSetIdentity() {
        Set<String> unknown = set("VALIDATE_PASSWORD", "VALIDATE_PHONE_NUMBER", "SETUP_PASSKEY",
                "PREMIUM_GRACE", "PREMIUM_ANNUAL", "USERPIC_SETUP", "AUTOARCHIVE_POPULAR",
                "premium_upgrade", "PREMIUM_UPGRADE_EXTRA", " BIRTHDAY_SETUP", "", null);
        assertSame(unknown, Suggestions.filterChatList(unknown));
        Set<String> empty = Collections.emptySet();
        assertSame(empty, Suggestions.filterChatList(empty));
        assertNull(Suggestions.filterChatList(null));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    @Test
    public void nullAndUnknownValuesAlsoSurviveBesidePromotions() {
        Set<String> stored = set(null, "BIRTHDAY_SETUP", "UNKNOWN", "VALIDATE_PASSWORD");
        assertEquals(Arrays.asList(null, "UNKNOWN", "VALIDATE_PASSWORD"),
                new ArrayList<>(Suggestions.filterChatList(stored)));
        assertEquals(set(null, "BIRTHDAY_SETUP", "UNKNOWN", "VALIDATE_PASSWORD"), stored);
    }

    @Test
    public void theBirthdayGiftGuardChangesOnlyItsLocalUndismissedAnswer() {
        assertTrue(Suggestions.birthdayGiftBannerDismissed(false));
        assertTrue(Suggestions.birthdayGiftBannerDismissed(true));
        assertTrue(HookStatus.report().get(0).contains("birthday gift banner hidden 1"));
    }

    @Test
    public void disablingTheSwitchPreservesOriginalSetIdentityAndBirthdayMembership() {
        Settings.HIDE_PROMOTIONAL_BANNERS.save(false);
        assertStock();
    }

    @Test
    public void everyPauseReasonPreservesOriginalSetIdentityAndBirthdayMembership() {
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock();
            PauseForTests.resume();
        }
    }

    @Test
    public void unavailableSettingsPreserveOriginalSetIdentityAndBirthdayMembership() {
        SettingsContextRule.withoutContext(this::assertStock);
    }

    @Test
    public void aSwitchReadFailurePreservesTheOriginalValuesAndRecordsTheFailure() {
        SettingReadsForTests.breakReads(Settings.HIDE_PROMOTIONAL_BANNERS);
        assertStock();
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.HIDE_PROMOTIONAL_BANNERS));
    }

    @Test
    public void aFailingSetReadReturnsTheOriginalSetAndDoesNotClaimAFilter() {
        Set<String> unreadable = new AbstractSet<String>() {
            @Override public Iterator<String> iterator() { throw new IllegalStateException("unreadable"); }
            @Override public int size() { return 1; }
        };
        assertSame(unreadable, Suggestions.filterChatList(unreadable));
        assertEquals(Collections.singletonList("a working 'suggestion presentation filter' hook (it threw java.lang.IllegalStateException)"),
                HookStatus.missing(FamilyNames.HIDE_PROMOTIONAL_BANNERS));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    @Test
    public void diagnosticsCountPresentationDecisionsWithoutWritingSuggestionKeys() {
        Suggestions.filterChatList(set("BIRTHDAY_SETUP", "VALIDATE_PASSWORD", "PRIVATE_UNKNOWN_KEY"));
        Suggestions.birthdayGiftBannerDismissed(false);
        String report = HookStatus.report().get(0);
        assertTrue(report, report.contains("promotional suggestion presentation filtered 1"));
        assertTrue(report, report.contains("birthday gift banner hidden 1"));
        assertFalse(report, report.contains("BIRTHDAY_SETUP"));
        assertFalse(report, report.contains("VALIDATE_PASSWORD"));
        assertFalse(report, report.contains("PRIVATE_UNKNOWN_KEY"));
    }

    private void assertStock() {
        Set<String> stored = set("BIRTHDAY_SETUP", "PREMIUM_UPGRADE", "VALIDATE_PHONE_NUMBER");
        Set<String> before = new LinkedHashSet<>(stored);
        assertSame(stored, Suggestions.filterChatList(stored));
        assertEquals(before, stored);
        assertFalse(Suggestions.birthdayGiftBannerDismissed(false));
        assertTrue(Suggestions.birthdayGiftBannerDismissed(true));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    private static Set<String> set(String... keys) {
        return new LinkedHashSet<>(Arrays.asList(keys));
    }
}
