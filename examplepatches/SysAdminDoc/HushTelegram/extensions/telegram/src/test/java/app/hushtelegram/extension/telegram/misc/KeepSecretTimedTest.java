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
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class KeepSecretTimedTest {
    private static final KeepSecretTimed.Telegram REAL = KeepSecretTimed.telegram;
    private static final long CHAT = 5;
    private static final long SECRET = -8589934592L;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void fake() {
        restore();
        KeepSecretTimed.telegram = dialogId -> dialogId == SECRET;
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.KEEP_SECRET_TIMED);
        Settings.KEEP_SECRET_TIMED.resetToDefault();
        KeepSecretTimed.telegram = REAL;
        HookStatus.clear();
    }

    private static ArrayList<Integer> due() {
        return new ArrayList<>(Arrays.asList(11, 12, 13));
    }

    @Test public void startsOffSoTheTimerDeletesAsUsual() {
        assertFalse(Settings.KEEP_SECRET_TIMED.get());
        ArrayList<Integer> messages = due();
        assertSame(messages, KeepSecretTimed.task(messages, SECRET));
        assertEquals(due(), messages);
    }

    @Test public void aSecretChatsDueMessagesComeBackEmptyAndTheTasksListStaysWhole() {
        Settings.KEEP_SECRET_TIMED.save(true);
        ArrayList<Integer> messages = due();
        ArrayList<?> kept = KeepSecretTimed.task(messages, SECRET);
        assertNotSame("a new list, so the task's own still clears from storage", messages, kept);
        assertTrue(kept.isEmpty());
        assertEquals(due(), messages);
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("self-destructing secret chat messages kept"));
    }

    @Test public void ordinaryChatsAndNothingDueStayStock() {
        Settings.KEEP_SECRET_TIMED.save(true);
        ArrayList<Integer> messages = due();
        assertSame("an ordinary chat", messages, KeepSecretTimed.task(messages, CHAT));
        ArrayList<Integer> none = new ArrayList<>();
        assertSame("nothing due", none, KeepSecretTimed.task(none, SECRET));
        assertNull("no list", KeepSecretTimed.task(null, SECRET));
        assertFalse(String.join("\n", HookStatus.report()).contains("kept"));
    }

    @Test public void pausedHushTelegramLeavesTheTimerStock() {
        Settings.KEEP_SECRET_TIMED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        ArrayList<Integer> messages = due();
        assertSame(messages, KeepSecretTimed.task(messages, SECRET));
    }

    @Test public void aBrokenSwitchReadLeavesTheTimerStockAndIsReported() {
        Settings.KEEP_SECRET_TIMED.save(true);
        SettingReadsForTests.breakReads(Settings.KEEP_SECRET_TIMED);
        ArrayList<Integer> messages = due();
        assertSame(messages, KeepSecretTimed.task(messages, SECRET));
        assertFalse(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).isEmpty());
    }

    @Test public void aFailingQuestionLeavesTheTimerStockAndIsReported() {
        Settings.KEEP_SECRET_TIMED.save(true);
        KeepSecretTimed.telegram = dialogId -> { throw new IllegalStateException("moved"); };
        ArrayList<Integer> messages = due();
        assertSame(messages, KeepSecretTimed.task(messages, SECRET));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString(),
                HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("secret chat timer"));
    }

    @Test public void theUnpatchedStubSaysNoChatIsSecret() {
        assertFalse(KeepSecretTimed.secretDialog(SECRET));
    }
}
