/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import android.text.SpannableString;

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
 * Show full post text: with the switch on, the text Facebook cut for See more is answered with
 * null, the answer Facebook gets for text that already fits, and counted. Off, paused or with
 * nothing cut, Facebook's answer stands.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FullPostTextTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.SHOW_FULL_POST_TEXT.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.FULL_POST_TEXT + ":")) return line;
        }
        return null;
    }

    @Test
    public void offByDefaultTheCutStands() {
        assertFalse("the switch doesn't start off", Settings.SHOW_FULL_POST_TEXT.get());
        SpannableString cut = new SpannableString("A long post... See more");
        assertSame(cut, FullPostText.cut(cut));
        assertEquals(FamilyNames.FULL_POST_TEXT + ": invoked 1, 1 found, 0 missing", statusLine());
    }

    @Test
    public void onTheWholeTextShows() {
        Settings.SHOW_FULL_POST_TEXT.save(true);
        assertNull("the post's text is still cut", FullPostText.cut(new SpannableString("A long post... See more")));
        assertNull("text that fits was given a cut", FullPostText.cut(null));
        assertEquals(FamilyNames.FULL_POST_TEXT + ": invoked 2, 1 found, 0 missing. Counted: "
                + FullPostText.KEPT_WHOLE + " 1", statusLine());
    }

    @Test
    public void pausedTheCutStands() {
        Settings.SHOW_FULL_POST_TEXT.save(true);
        SpannableString cut = new SpannableString("A long post... See more");
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertSame("a Hushfacebook paused by " + reason + " still showed the whole text", cut, FullPostText.cut(cut));
            PauseForTests.resume();
        }
        assertEquals(FamilyNames.FULL_POST_TEXT + ": invoked 2, 1 found, 0 missing", statusLine());
    }
}
