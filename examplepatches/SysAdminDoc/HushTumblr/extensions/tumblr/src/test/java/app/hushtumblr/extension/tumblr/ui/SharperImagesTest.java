/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** Images in posts load Tumblr's 640 wide copy even when the post lists a sharper one. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SharperImagesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** One size of an image, as Tumblr's own image size answers the bridge. */
    static class Size implements HushPhotoSize {
        final String url;
        final int width;
        final int height;

        Size(String url, int width, int height) {
            this.url = url;
            this.width = width;
            this.height = height;
        }

        @Override public String getUrl() { return url; }
        @Override public int getWidth() { return width; }
        @Override public int getHeight() { return height; }
    }

    private static Size photo(int width, int height) {
        return new Size("https://64.media.tumblr.com/abc123/s" + width + "x" + height + "/def456.jpg", width, height);
    }

    private static Size gif(int width, int height) {
        return new Size("https://64.media.tumblr.com/abc123/s" + width + "x" + height + "/def456.gif", width, height);
    }

    // A tall photo's sizes as the server lists them: largest first, a square crop at the end.
    private final Size p1280 = photo(1280, 1920);
    private final Size p640 = photo(640, 960);
    private final Size p540 = photo(540, 810);
    private final Size p400 = photo(400, 600);
    private final Size p250 = photo(250, 375);
    private final Size square = photo(75, 75);
    private final List<Size> sizes = Arrays.asList(p1280, p640, p540, p400, p250, square);

    @Before public void setUp() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.SHARPER_IMAGES.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @After public void restore() {
        Settings.SHARPER_IMAGES.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        HookStatus.clear();
    }

    private String report() {
        return String.join("\n", HookStatus.report());
    }

    @Test public void startsOffSoTumblrsPickStays() {
        assertFalse(Settings.SHARPER_IMAGES.get());
        assertSame(p640, SharperImages.pick(sizes, p640, 640));
        assertFalse(report(), report().contains("Counted"));
    }

    @Test public void aSixHundredFortyRequestLoadsTheTwelveEightyCopy() {
        Settings.SHARPER_IMAGES.save(true);
        assertSame(p1280, SharperImages.pick(sizes, p640, 640));
        assertTrue(report(), report().contains("Counted: " + SharperImages.UPGRADED + " 1"));
        assertFalse(report(), report().contains(SharperImages.GIF_UPGRADED));
    }

    @Test public void pausedOrWithoutItsHookOrSettingsTumblrsPickStays() {
        Settings.SHARPER_IMAGES.save(true);
        for (HushTumblrPause.Reason reason : HushTumblrPause.Reason.values()) {
            if (reason == HushTumblrPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertSame(reason.name(), p640, SharperImages.pick(sizes, p640, 640));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertSame(p640, SharperImages.pick(sizes, p640, 640)));
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertSame(p640, SharperImages.pick(sizes, p640, 640));
    }

    @Test public void neverPastTwiceTheWidthAskedFor() {
        Settings.SHARPER_IMAGES.save(true);
        assertSame("800 wide at most", p640, SharperImages.pick(sizes, p250, 400));
        assertSame("Tumblr asked for none, so twice the pick", p400, SharperImages.pick(sizes, p250, 0));
        assertSame("only the 1280 copy is larger", p640, SharperImages.pick(Arrays.asList(p1280, p640), p640, 400));
        assertTrue(report(), report().contains(SharperImages.OVER_CAP + " 1"));
    }

    @Test public void neverPastTheMemoryCaps() {
        Settings.SHARPER_IMAGES.save(true);
        Size most = photo(2048, 3072);
        Size original = photo(2400, 3600);
        assertSame(most, SharperImages.pick(Arrays.asList(original, most, p1280), p1280, 1280));
        Size tall = photo(1280, 5000);
        Size taller = photo(2048, 8000);
        assertSame("over the pixel cap", tall, SharperImages.pick(Arrays.asList(taller, tall), tall, 1280));
    }

    @Test public void aStillStaysStillAndAGifStaysAGif() {
        Settings.SHARPER_IMAGES.save(true);
        Size small = gif(400, 300);
        Size larger = gif(800, 600);
        assertSame("a larger still", small, SharperImages.pick(Arrays.asList(photo(800, 600), small), small, 400));
        Size still = photo(400, 300);
        assertSame(still, SharperImages.pick(Arrays.asList(larger, still), still, 400));
        assertTrue(report(), report().contains(SharperImages.OTHER_KIND + " 2"));
        assertSame("a larger GIF", larger, SharperImages.pick(Arrays.asList(photo(800, 600), larger, small), small, 400));
        assertTrue(report(), report().contains(SharperImages.GIF_UPGRADED + " 1"));
        Size query = new Size("https://64.media.tumblr.com/abc123/s800x600/def456.jpg?format=gif", 800, 600);
        assertSame("the query doesn't make it a GIF", query, SharperImages.pick(Arrays.asList(query, still), still, 400));
    }

    @Test public void aGifStaysUnderItsOwnLowerCap() {
        Settings.SHARPER_IMAGES.save(true);
        Size square = gif(640, 640);
        assertSame("1280 by 1280 is past a GIF's cap", square,
                SharperImages.pick(Arrays.asList(gif(1280, 1280), square), square, 640));
        assertTrue(report(), report().contains(SharperImages.OVER_CAP + " 1"));
        Size wide = gif(640, 480);
        Size most = gif(1280, 960);
        assertSame("1280 by 960 is the most", most, SharperImages.pick(Arrays.asList(most, wide), wide, 640));
        Size stillSquare = photo(640, 640);
        Size stillLarger = photo(1280, 1280);
        assertSame("a still the same size isn't held to it", stillLarger,
                SharperImages.pick(Arrays.asList(stillLarger, stillSquare), stillSquare, 640));
    }

    @Test public void aCropInAnotherShapeIsNeverPicked() {
        Settings.SHARPER_IMAGES.save(true);
        Size crop = photo(1280, 1280);
        assertSame(p640, SharperImages.pick(Arrays.asList(crop, p640), p640, 640));
        assertTrue(report(), report().contains(SharperImages.OTHER_SHAPE + " 1"));
        assertTrue("rounding stays inside 2 percent", SharperImages.sameShape(1280, 1919, 640, 960));
        assertFalse(SharperImages.sameShape(1280, 1280, 640, 960));
    }

    @Test public void aPickNotAmongTheSizesStays() {
        Settings.SHARPER_IMAGES.save(true);
        Size elsewhere = new Size("https://64.media.tumblr.com/other/s640x960/xyz.jpg", 640, 960);
        assertSame(elsewhere, SharperImages.pick(sizes, elsewhere, 640));
        assertTrue(report(), report().contains(SharperImages.NOT_LISTED + " 1"));
    }

    @Test public void missingOrUnreadableSizesKeepTumblrsPick() {
        Settings.SHARPER_IMAGES.save(true);
        assertNull(SharperImages.pick(sizes, null, 640));
        assertSame(p640, SharperImages.pick(null, p640, 640));
        assertSame(p640, SharperImages.pick(Collections.emptyList(), p640, 640));
        Object foreign = new Object();
        assertSame(foreign, SharperImages.pick(sizes, foreign, 640));
        Size blank = new Size("", 0, 0);
        assertSame("Tumblr's empty size", blank, SharperImages.pick(sizes, blank, 640));
        assertSame("Tumblr's empty size for an image with none", blank, SharperImages.pick(Collections.emptyList(), blank, 640));
        List<Object> mixed = Arrays.asList(new Object(), null, new Size(null, 1280, 1920), p640);
        assertSame(p640, SharperImages.pick(mixed, p640, 640));
        assertTrue(report(), report().contains(SharperImages.NO_SIZES + " 3"));
        assertTrue(report(), report().contains(SharperImages.UNREADABLE + " 1"));
        assertTrue(report(), report().contains(SharperImages.BLANK + " 1"));
        assertTrue(report(), report().contains(SharperImages.ALREADY_LARGEST + " 1"));
    }

    @Test public void aSizeThatThrowsKeepsTumblrsPickAndIsReported() {
        Settings.SHARPER_IMAGES.save(true);
        Size broken = new Size("https://64.media.tumblr.com/abc123/s1280x1920/def456.jpg", 1280, 1920) {
            @Override public int getWidth() { throw new IllegalStateException("parcel"); }
        };
        assertSame(p640, SharperImages.pick(Arrays.asList(broken, p640), p640, 640));
        List<String> missing = HookStatus.missing(FamilyNames.SHARPER_IMAGES);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains(SharperImages.STEP));
    }
}
