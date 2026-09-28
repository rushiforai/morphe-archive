/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.emoji;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.graphics.Typeface;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the emoji provider's hook answers. Null is Facebook's own emoji font: the patched provider
 * runs its own code whenever the hook says nothing. Whether it says nothing while paused or before
 * the context is PausedHooksTest's and ColdStartHooksTest's to see.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SystemEmojiTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        Settings.USE_SYSTEM_EMOJI.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void theSwitchStartsOnAndAnswersThePhonesDefaultTypeface() {
        assertTrue("picking the patch is the choice to use it", Settings.USE_SYSTEM_EMOJI.get());
        // The default family's fallback is where the phone keeps its emoji font, whichever file it is.
        assertSame(Typeface.DEFAULT, SystemEmoji.typeface());
    }

    @Test
    public void offItLeavesFacebooksEmojiFontToAnswer() {
        Settings.USE_SYSTEM_EMOJI.save(false);
        assertNull(SystemEmoji.typeface());
        // And on again, the next text laid out gets the phone's.
        Settings.USE_SYSTEM_EMOJI.save(true);
        assertSame(Typeface.DEFAULT, SystemEmoji.typeface());
    }

    /** Hook status counts every call and says the provider was reached, so a report can tell a dead hook. */
    @Test
    public void eachCallIsCountedAndAnAnswerMarksTheProviderFound() {
        HookStatus.clear();
        Settings.USE_SYSTEM_EMOJI.save(false);
        SystemEmoji.typeface();
        List<String> off = HookStatus.report();
        assertTrue(String.join("\n", off), off.contains("Use the phone's emoji: invoked 1, 0 found, 0 missing"));

        Settings.USE_SYSTEM_EMOJI.save(true);
        SystemEmoji.typeface();
        SystemEmoji.typeface();
        List<String> on = HookStatus.report();
        assertTrue(String.join("\n", on), on.contains("Use the phone's emoji: invoked 3, 1 found, 0 missing"));
    }

    /**
     * A chat's big emoji: on, the maker of Meta's emoji picture addresses hears there's no picture,
     * so the chat keeps the emoji drawn with the provider's typeface. Off, Meta's picture as before.
     */
    @Test
    public void theBigChatEmojiSkipsMetasPictureOnlyWhileTheSwitchIsOn() {
        assertTrue(SystemEmoji.skipRemoteEmoji());
        Settings.USE_SYSTEM_EMOJI.save(false);
        assertFalse(SystemEmoji.skipRemoteEmoji());
        Settings.USE_SYSTEM_EMOJI.save(true);
        assertTrue(SystemEmoji.skipRemoteEmoji());
    }

    /** The picture hook counts in the same line, and a skip marks the address maker found. */
    @Test
    public void thePictureHookIsCountedBesideTheProvider() {
        HookStatus.clear();
        Settings.USE_SYSTEM_EMOJI.save(false);
        SystemEmoji.skipRemoteEmoji();
        List<String> off = HookStatus.report();
        assertTrue(String.join("\n", off), off.contains("Use the phone's emoji: invoked 1, 0 found, 0 missing"));

        Settings.USE_SYSTEM_EMOJI.save(true);
        SystemEmoji.skipRemoteEmoji();
        SystemEmoji.typeface();
        List<String> on = HookStatus.report();
        assertTrue(String.join("\n", on), on.contains("Use the phone's emoji: invoked 3, 2 found, 0 missing"));
    }
}
