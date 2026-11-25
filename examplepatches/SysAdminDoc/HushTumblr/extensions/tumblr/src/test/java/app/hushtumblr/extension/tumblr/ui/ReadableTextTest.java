/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.EnumSet;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * #24: the related tags under a trending topic are cut in half at a bigger text size, and the text
 * typed when searching a blog can't be read over a bright header.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReadableTextTest {
    /** Tumblr's fixed tag height, 23.5 dp, on a screen with two pixels to the dp. */
    private static final int FIXED = 47;

    /** The tint Tumblr gives the box: white text at 20%. */
    private static final int TUMBLRS_TINT = 0x33FFFFFF;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Context context;

    @Before
    public void aBuildWithThePatch() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        HookStatus.clear();
        context = Utils.getContext();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.FIX_HARD_TO_READ_TEXT.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void theFixStartsOnAndNeedsNoRestart() {
        assertTrue(Settings.FIX_HARD_TO_READ_TEXT.defaultValue);
        assertFalse("each row and screen reads it as it's built", Settings.FIX_HARD_TO_READ_TEXT.rebootApp);
    }

    @Test
    public void aRelatedTagGrowsToFitItsTextAndNeverGetsShorterThanTumblrs() {
        TextView tag = new TextView(context);
        assertEquals(ViewGroup.LayoutParams.WRAP_CONTENT, ReadableText.relatedTagHeight(tag, FIXED));
        assertEquals("Tumblr's height is the least a tag gets", FIXED, tag.getMinHeight());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(ReadableText.TAG_FITTED + " 1"));
    }

    @Test
    public void withTheSwitchOffATagKeepsTumblrsFixedHeight() {
        Settings.FIX_HARD_TO_READ_TEXT.save(false);
        TextView tag = new TextView(context);
        int before = tag.getMinHeight();
        assertEquals(FIXED, ReadableText.relatedTagHeight(tag, FIXED));
        assertEquals(before, tag.getMinHeight());
    }

    @Test
    public void whatIsNoTagOrHasNoHeightIsLeftAlone() {
        assertEquals(FIXED, ReadableText.relatedTagHeight(new View(context), FIXED));
        assertEquals(FIXED, ReadableText.relatedTagHeight(null, FIXED));
        TextView tag = new TextView(context);
        assertEquals("a height that isn't a size is Tumblr's to keep", 0, ReadableText.relatedTagHeight(tag, 0));
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT,
                ReadableText.relatedTagHeight(tag, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    @Test
    public void aBlogsSearchBoxGetsAShadeThatStandsAgainstItsText() {
        GradientDrawable box = new GradientDrawable();
        box.setColor(0x33FFFFFF);
        assertEquals("white text gets a dark box", ReadableText.DARK_BOX,
                ReadableText.blogSearchBox(box, 0xFFFFFFFF, TUMBLRS_TINT));
        assertEquals("the shape is solid, so the tint alone decides the shade", 0xFFFFFFFF,
                box.getColor().getDefaultColor());
        assertEquals("dark text gets a light box", ReadableText.LIGHT_BOX,
                ReadableText.blogSearchBox(new GradientDrawable(), 0xFF000000, 0x33000000));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(ReadableText.BOX_SHADED + " 2"));
    }

    @Test
    public void withTheSwitchOffTheBoxKeepsTumblrsTint() {
        Settings.FIX_HARD_TO_READ_TEXT.save(false);
        GradientDrawable box = new GradientDrawable();
        box.setColor(0x33FFFFFF);
        assertEquals(TUMBLRS_TINT, ReadableText.blogSearchBox(box, 0xFFFFFFFF, TUMBLRS_TINT));
        assertEquals(0x33FFFFFF, box.getColor().getDefaultColor());
    }

    @Test
    public void aBoxThatIsNoShapeKeepsTumblrsTint() {
        assertEquals(TUMBLRS_TINT, ReadableText.blogSearchBox(new ColorDrawable(0x33FFFFFF), 0xFFFFFFFF, TUMBLRS_TINT));
        assertEquals(TUMBLRS_TINT, ReadableText.blogSearchBox(null, 0xFFFFFFFF, TUMBLRS_TINT));
    }

    @Test
    public void lightAndDarkTextAreToldApart() {
        assertTrue(ReadableText.light(0xFFFFFFFF));
        assertTrue("yellow reads as light", ReadableText.light(0xFFFFEB3B));
        assertFalse(ReadableText.light(0xFF000000));
        assertFalse("navy reads as dark", ReadableText.light(0xFF001935));
        assertTrue("how see-through a color is doesn't change which it is", ReadableText.light(0x00FFFFFF));
    }

    @Test
    public void aPausedHushTumblrAndABuildWithoutThePatchChangeNothing() {
        TextView tag = new TextView(context);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals(FIXED, ReadableText.relatedTagHeight(tag, FIXED));
        assertEquals(TUMBLRS_TINT, ReadableText.blogSearchBox(new GradientDrawable(), 0xFFFFFFFF, TUMBLRS_TINT));
        PauseForTests.resume();

        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertEquals(FIXED, ReadableText.relatedTagHeight(tag, FIXED));
        assertEquals(TUMBLRS_TINT, ReadableText.blogSearchBox(new GradientDrawable(), 0xFFFFFFFF, TUMBLRS_TINT));
    }
}
