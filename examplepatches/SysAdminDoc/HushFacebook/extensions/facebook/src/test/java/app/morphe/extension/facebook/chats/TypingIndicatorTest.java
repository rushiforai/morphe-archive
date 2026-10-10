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

/**
 * Facebook telling others that you're typing, through the extension: Mailbox's flag and the two
 * "typing" runnables, each under its own switch.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TypingIndicatorTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The patch is in Morphe Manager's default selection with its switches off; these tests turn them on. */
    @Before
    public void turnTheSwitchOn() {
        Settings.HIDE_CHAT_TYPING.save(true);
        Settings.HIDE_COMMENT_TYPING.save(true);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_CHAT_TYPING.resetToDefault();
        Settings.HIDE_COMMENT_TYPING.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.TYPING_INDICATOR + ":")) return line;
        }
        return null;
    }

    @Test
    public void bothSwitchesStartOffAndOnHoldTypingBack() {
        assertFalse("the chat switch starts off", Settings.HIDE_CHAT_TYPING.defaultValue);
        assertFalse("the comment switch starts off", Settings.HIDE_COMMENT_TYPING.defaultValue);
        assertFalse("Mailbox hears not typing", TypingIndicator.chatTyping(true));
        assertFalse("not typing stays so", TypingIndicator.chatTyping(false));
        assertTrue(TypingIndicator.holdsChatTyping());
        assertTrue(TypingIndicator.holdsCommentTyping());
        String line = statusLine();
        assertNotNull(String.join("\n", HookStatus.report()), line);
        assertTrue(line, line.contains(TypingIndicator.CHAT_HELD + " 2"));
        assertTrue(line, line.contains(TypingIndicator.COMMENT_HELD + " 1"));
    }

    @Test
    public void eachSwitchHoldsOnlyItsOwn() {
        Settings.HIDE_CHAT_TYPING.save(false);
        assertTrue("Mailbox hears typing", TypingIndicator.chatTyping(true));
        assertFalse(TypingIndicator.holdsChatTyping());
        assertTrue("comments stay held", TypingIndicator.holdsCommentTyping());
        Settings.HIDE_CHAT_TYPING.save(true);
        Settings.HIDE_COMMENT_TYPING.save(false);
        assertFalse(TypingIndicator.chatTyping(true));
        assertFalse(TypingIndicator.holdsCommentTyping());
    }

    @Test
    public void pausedFacebookSendsTyping() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertTrue(TypingIndicator.chatTyping(true));
        assertFalse(TypingIndicator.holdsChatTyping());
        assertFalse(TypingIndicator.holdsCommentTyping());
        PauseForTests.resume();
        assertFalse(TypingIndicator.chatTyping(true));
    }
}
