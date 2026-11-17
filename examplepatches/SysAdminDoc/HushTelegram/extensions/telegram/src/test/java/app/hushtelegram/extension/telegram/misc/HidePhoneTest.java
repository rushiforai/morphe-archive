/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HidePhoneTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_PHONE_NUMBER);
        Settings.HIDE_PHONE_NUMBER.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultNumbersShowAsTelegramFormatsThem() {
        assertFalse(Settings.HIDE_PHONE_NUMBER.get());
        assertFalse(HidePhone.on());
        assertEquals("+15551234567", HidePhone.shown(null, "+15551234567"));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_PHONE_NUMBER));
    }

    @Test public void onlyAnAccountsOwnNumberMatches() {
        String[] accounts = {null, "15551234567", "447700900123"};
        assertTrue(HidePhone.own("+1 555 123 4567", i -> accounts[i], 3));
        assertTrue(HidePhone.own("447700900123", i -> accounts[i], 3));
        assertFalse(HidePhone.own("+1 555 123 4568", i -> accounts[i], 3));
        assertFalse(HidePhone.own("+44 7700 900123", i -> accounts[i], 2));
        assertFalse(HidePhone.own("", i -> accounts[i], 3));
        assertFalse(HidePhone.own(null, i -> accounts[i], 3));
    }

    @Test public void theMaskKeepsThePlusAndTheSpacing() {
        assertEquals("+• ••• ••• ••••", HidePhone.mask("+1 555 123 4567"));
    }

    @Test public void theStillYourNumberCardGetsTheNumberItAsksAbout() throws InterruptedException {
        String card = HidePhone.cover("+1 555 123 4567");
        assertEquals("+• ••• ••• ••••", card);
        assertEquals("+1 555 123 4567", HidePhone.asked(card));
        // Once only: anything else covered later stays covered.
        assertEquals(card, HidePhone.asked(card));

        // A second account's number covers the same way; the card gets the one just formatted.
        HidePhone.cover("+1 555 123 4567");
        String other = HidePhone.cover("+1 999 888 7777");
        assertEquals(card, other);
        assertEquals("+1 999 888 7777", HidePhone.asked(other));

        // Something other than the number just covered, or nothing covered, comes back as it is.
        HidePhone.cover("+1 555 123 4567");
        assertEquals("+• ••• ••••", HidePhone.asked("+• ••• ••••"));
        assertEquals("+1 555 123 4567", HidePhone.asked("+1 555 123 4567"));
        assertNull(HidePhone.asked(null));

        // Another thread's covered number never reaches this one.
        Thread elsewhere = new Thread(() -> HidePhone.cover("+1 555 123 4567"));
        elsewhere.start();
        elsewhere.join();
        assertEquals(card, HidePhone.asked(card));
    }

    /** Telegram's NotificationCenter as far as a redraw reaches it. */
    public static final class Centers {
        public static int updateInterfaces = 7;
        public static int mainUserInfoChanged = 9;
        static final Map<Integer, Centers> MADE = new HashMap<>();
        final List<String> posted = new ArrayList<>();

        public static Centers getInstance(int account) { return MADE.computeIfAbsent(account, made -> new Centers()); }

        public void postNotificationName(int id, Object... args) { posted.add(id + Arrays.toString(args)); }
    }

    @Test public void aFlipRedrawsTheNumbersAlreadyOnScreen() throws Exception {
        // The switch is watched from the first number Telegram shows.
        assertFalse(HidePhone.on());
        Settings.HIDE_PHONE_NUMBER.save(true);
        ShadowLooper.idleMainLooper();
        assertTrue(String.join("\n", HookStatus.report()).contains("switch flipped"));

        // Another switch's write redraws nothing.
        HookStatus.clear();
        Settings.HIDE_ADS.save(!Settings.HIDE_ADS.get());
        Settings.HIDE_ADS.resetToDefault();
        ShadowLooper.idleMainLooper();
        assertFalse(String.join("\n", HookStatus.report()).contains("switch flipped"));

        // Each signed-in account's screens hear that the interface and the account's own info changed,
        // the first with the mask of what changed that its readers cast.
        Centers.MADE.clear();
        HidePhone.redraw(Centers.class, Arrays.asList(new Accounts.Entry(0, "First"), new Accounts.Entry(2, "Third")));
        assertEquals(2, Centers.MADE.size());
        assertEquals(Arrays.asList("7[0]", "9[]"), Centers.MADE.get(0).posted);
        assertEquals(Arrays.asList("7[0]", "9[]"), Centers.MADE.get(2).posted);
    }

    @Test public void pausingOrAnEarlyStartLeavesNumbersAlone() {
        Settings.HIDE_PHONE_NUMBER.save(true);
        assertTrue(HidePhone.on());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), HidePhone.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(HidePhone.on()));
        SettingReadsForTests.breakReads(Settings.HIDE_PHONE_NUMBER);
        assertFalse(HidePhone.on());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_PHONE_NUMBER).isEmpty());
    }
}
