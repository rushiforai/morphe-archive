/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/** Facebook telling the sender that you've read a chat, through the extension's one question. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReadReceiptsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The patch is in Morphe Manager's default selection with its switch off; these tests turn it on. */
    @Before
    public void turnTheSwitchOn() {
        Settings.HIDE_READ_RECEIPTS.save(true);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_READ_RECEIPTS.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.READ_RECEIPTS + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOffAndOnHoldsReadsBack() {
        assertFalse("the switch starts off", Settings.HIDE_READ_RECEIPTS.defaultValue);
        assertTrue(ReadReceipts.holdsChatRead());
        assertTrue(ReadReceipts.holdsChatRead());
        String line = statusLine();
        assertNotNull(String.join("\n", HookStatus.report()), line);
        assertTrue(line, line.contains(ReadReceipts.READ_HELD + " 2"));
    }

    @Test
    public void offOrPausedFacebookSendsTheRead() {
        Settings.HIDE_READ_RECEIPTS.save(false);
        assertFalse(ReadReceipts.holdsChatRead());
        Settings.HIDE_READ_RECEIPTS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(ReadReceipts.holdsChatRead());
        PauseForTests.resume();
        assertTrue(ReadReceipts.holdsChatRead());
    }
}
