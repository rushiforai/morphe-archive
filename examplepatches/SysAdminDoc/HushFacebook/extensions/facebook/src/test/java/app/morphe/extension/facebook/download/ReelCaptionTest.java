/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.ClipboardManager;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Issue #240: a reel's caption is cut off behind See more and can't be copied. The caption's render
 * hands its whole text to {@link ReelCaption#remember} and the reel's More sheet gets a Copy caption
 * row from {@link ReelCaption#forVideo}, only for a reel whose caption was seen, and only while the
 * switch is on and Hushfacebook isn't paused.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelCaptionTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String CAPTION = "First line\nSecond line that Facebook hides behind See more #reels";

    @Before
    @After
    public void clean() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.COPY_REEL_CAPTION.resetToDefault();
        ReelCaption.forgetAll();
    }

    private static ReelCaption row(String videoId) {
        return ReelCaption.forVideo(RuntimeEnvironment.getApplication(), videoId);
    }

    private static String line() {
        List<String> lines = HookStatus.report();
        assertEquals(lines.toString(), 1, lines.size());
        return lines.get(0);
    }

    @Test
    public void aReelWhoseCaptionWasSeenGetsTheRowAndItCopiesTheWholeCaption() {
        ReelCaption.keep("2233445566778899", CAPTION);
        ReelCaption row = row("2233445566778899");
        assertNotNull(row);
        row.run();
        ClipboardManager clipboard = RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class);
        assertEquals(CAPTION, clipboard.getPrimaryClip().getItemAt(0).getText().toString());
        assertTrue(line(), line().contains(ReelCaption.ROW_ADDED + " 1"));
    }

    @Test
    public void anotherReelsCaptionIsNeverOffered() {
        ReelCaption.keep("2233445566778899", CAPTION);
        assertNull(row("9988776655443322"));
        assertNull(row(null));
        assertTrue(line(), line().contains(ReelCaption.ROW_NO_CAPTION + " 2"));
    }

    @Test
    public void theSwitchAndAPauseEachLeaveTheSheetAlone() {
        ReelCaption.keep("2233445566778899", CAPTION);
        Settings.COPY_REEL_CAPTION.save(false);
        assertNull(row("2233445566778899"));
        Settings.COPY_REEL_CAPTION.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertNull(row("2233445566778899"));
        PauseForTests.resume();
        assertNotNull(row("2233445566778899"));
    }

    @Test
    public void aCaptionWithoutAReelIsCountedAndNotKept() {
        ReelCaption.remember(new Object(), CAPTION);
        ReelCaption.remember(null, CAPTION);
        ReelCaption.remember(new Object(), null);
        assertTrue(line(), line().contains(ReelCaption.CAPTION_NO_ID + " 2"));
    }

    @Test
    public void onlyTheNewestCaptionsAreKept() {
        for (int i = 0; i <= ReelCaption.KEPT; i++) ReelCaption.keep(String.valueOf(1_000_000_000L + i), "caption " + i);
        assertNull("the oldest caption stayed", ReelCaption.captionFor("1000000000"));
        assertEquals("caption " + ReelCaption.KEPT,
                ReelCaption.captionFor(String.valueOf(1_000_000_000L + ReelCaption.KEPT)));
    }
}
