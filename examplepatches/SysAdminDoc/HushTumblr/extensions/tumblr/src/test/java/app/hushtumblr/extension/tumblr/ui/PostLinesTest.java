/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.util.EnumSet;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** #10: the gap between two posts was black on black, so a post's end was hard to see. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class PostLinesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Bitmap page;
    private Canvas canvas;
    private Paint tumblrs;

    @Before
    public void aBlackPage() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        HookStatus.clear();
        page = Bitmap.createBitmap(10, 20, Bitmap.Config.ARGB_8888);
        page.eraseColor(Color.BLACK);
        canvas = new Canvas(page);
        tumblrs = new Paint();
        tumblrs.setColor(Color.RED);
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.LINE_BETWEEN_POSTS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void theSwitchStartsOff() {
        assertFalse(Settings.LINE_BETWEEN_POSTS.defaultValue);
        assertFalse("opened screens pick it up on their next draw", Settings.LINE_BETWEEN_POSTS.rebootApp);
    }

    @Test
    public void onTheSpacingGoesOverItsGaps() {
        assertEquals("off, it's Tumblr's answer", 0, PostLines.paintsGaps(0));
        assertEquals(1, PostLines.paintsGaps(1));

        Settings.LINE_BETWEEN_POSTS.save(true);

        assertEquals(1, PostLines.paintsGaps(0));
    }

    @Test
    public void aThinLineGoesThroughTheGapsMiddleAndTheRestStaysAsItWas() {
        Settings.LINE_BETWEEN_POSTS.save(true);

        PostLines.paintGap(canvas, 0f, 4f, 10f, 12f, tumblrs);

        assertEquals("above the line", Color.BLACK, page.getPixel(5, 4));
        assertEquals("below the line", Color.BLACK, page.getPixel(5, 11));
        int line = page.getPixel(5, 8);
        assertTrue("a light line on black, was " + Integer.toHexString(line), Color.red(line) > 0x40);
        assertEquals("gray, not the debug red", Color.red(line), Color.green(line));
        assertEquals("all the way across", line, page.getPixel(0, 8));
        assertEquals("all the way across", line, page.getPixel(9, 8));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("line drawn 1"));
    }

    /** Every row of a post comes through, and only its first has a gap above it. */
    @Test
    public void aRowWithNoGapGetsNoLine() {
        Settings.LINE_BETWEEN_POSTS.save(true);

        PostLines.paintGap(canvas, 0f, 7f, 10f, 7f, tumblrs);

        for (int y = 0; y < page.getHeight(); y++) assertEquals("row " + y, Color.BLACK, page.getPixel(5, y));
    }

    /** The same call site serves Tumblr's debug switch, and it paints as Tumblr wrote it. */
    @Test
    public void withTheSwitchOffAGapIsPaintedTumblrsWay() {
        PostLines.paintGap(canvas, 0f, 4f, 10f, 12f, tumblrs);

        assertEquals(Color.RED, page.getPixel(5, 4));
        assertEquals(Color.RED, page.getPixel(5, 11));
        assertEquals(Color.BLACK, page.getPixel(5, 12));
    }

    @Test
    public void aBuildWithoutTheHookKeepsTumblrsAnswer() {
        Settings.LINE_BETWEEN_POSTS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));

        assertEquals(0, PostLines.paintsGaps(0));
    }

    @Test
    public void beforeTheSettingsAreReadyItsTumblrsAnswer() {
        Settings.LINE_BETWEEN_POSTS.save(true);

        SettingsContextRule.beforeThePauseIsDecided(() -> assertEquals(0, PostLines.paintsGaps(0)));
    }
}
