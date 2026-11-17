/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Locale;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {ForwardDatesTest.Messages.class}, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class ForwardDatesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for Telegram's messages: an Integer is a forward first sent then. The fixture test checks the real read. */
    @Implements(value = ForwardDates.class, isInAndroidSdk = false)
    public static class Messages {
        @Implementation protected static int sentAt(Object message) {
            return message instanceof Integer ? (Integer) message : 0;
        }
    }

    /** 12 March 2024, 14:05 UTC. */
    private static final int SENT = 1_710_252_300;
    private static final String FORWARDED = "Forwarded from";

    private Locale locale;

    @Before public void reset() {
        locale = Locale.getDefault();
        Locale.setDefault(Locale.US);
        restore();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.FORWARD_DATES);
        Settings.FORWARD_DATES.resetToDefault();
        HookStatus.clear();
        if (locale != null) Locale.setDefault(locale);
    }

    @Test public void offByDefaultTheHeaderIsTelegramsOwn() {
        assertFalse(Settings.FORWARD_DATES.get());
        assertEquals(FORWARDED, ForwardDates.header(SENT, FORWARDED));
        assertNull(ForwardDates.compact(SENT, null));
    }

    @Test public void onTheForwardsFirstDateGoesAfterForwardedFromAndInTheCompactHeader() {
        Settings.FORWARD_DATES.save(true);
        String shown = ForwardDates.header(SENT, FORWARDED);
        assertEquals(FORWARDED + " · " + JoinDates.when(context(), SENT), shown);
        assertTrue(shown, shown.contains("2024"));
        // Compact chats get the date alone, in the text slot Telegram leaves empty after the sender.
        assertEquals(JoinDates.when(context(), SENT), String.valueOf(ForwardDates.compact(SENT, null)));
        assertEquals(JoinDates.when(context(), SENT), String.valueOf(ForwardDates.compact(SENT, "")));
        // Another forward shows its own date.
        assertEquals(FORWARDED + " · " + JoinDates.when(context(), SENT + 86_400), ForwardDates.header(SENT + 86_400, FORWARDED));
    }

    @Test public void aMessageThatIsntAForwardOrHasNoDateKeepsTelegramsText() {
        Settings.FORWARD_DATES.save(true);
        assertEquals(FORWARDED, ForwardDates.header(0, FORWARDED));
        assertEquals(FORWARDED, ForwardDates.header("not a message", FORWARDED));
        assertEquals(FORWARDED, ForwardDates.header(null, FORWARDED));
        assertNull(ForwardDates.header(SENT, null));
        assertEquals("", ForwardDates.header(SENT, ""));
        assertNull(ForwardDates.compact(0, null));
        assertNull(ForwardDates.compact(null, null));
        // Text Telegram puts in the compact header itself stays.
        assertEquals("a reply's snippet", ForwardDates.compact(SENT, "a reply's snippet"));
    }

    @Test public void pauseAnEarlyStartOrAnUnreadableSwitchKeepsTelegramsHeader() {
        Settings.FORWARD_DATES.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), FORWARDED, ForwardDates.header(SENT, FORWARDED));
            assertNull(reason.name(), ForwardDates.compact(SENT, null));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertEquals(FORWARDED, ForwardDates.header(SENT, FORWARDED));
            assertNull(ForwardDates.compact(SENT, null));
        });
        SettingReadsForTests.breakReads(Settings.FORWARD_DATES);
        assertEquals(FORWARDED, ForwardDates.header(SENT, FORWARDED));
        assertNull(ForwardDates.compact(SENT, null));
        assertFalse(HookStatus.missing(FamilyNames.SHOW_LOCAL_IDS).isEmpty());
    }

    private static Context context() { return RuntimeEnvironment.getApplication(); }
}
