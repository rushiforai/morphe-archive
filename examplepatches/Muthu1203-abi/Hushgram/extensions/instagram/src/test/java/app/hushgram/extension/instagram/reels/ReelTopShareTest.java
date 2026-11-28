/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.PauseForTests;

/** Double tap the top of a reel to share: the zone, the button it finds, and what it leaves alone. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class ReelTopShareTest {
    private static final int SHARE = 0x7f0b12c8;

    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private FrameLayout pager;
    private FrameLayout page;
    private View share;
    private int clicks;

    @Before
    public void prepare() {
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.REEL_TOP_SHARE.resetToDefault();
        Settings.REEL_TOP_SHARE_ZONE.resetToDefault();
        ReelTopShare.idForTests = SHARE;
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        pager = new FrameLayout(activity);
        page = new FrameLayout(activity);
        FrameLayout column = new FrameLayout(activity);
        share = new View(activity);
        share.setId(SHARE);
        share.setOnClickListener(v -> clicks++);
        // Clear mode fades the column out; the button is still there to press.
        column.setAlpha(0f);
        column.addView(share, new FrameLayout.LayoutParams(100, 100));
        page.addView(column, new FrameLayout.LayoutParams(100, 100));
        pager.addView(page, new FrameLayout.LayoutParams(1000, 2000));
        activity.setContentView(pager);
        pager.measure(View.MeasureSpec.makeMeasureSpec(1000, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(2000, View.MeasureSpec.EXACTLY));
        pager.layout(0, 0, 1000, 2000);
    }

    @After
    public void reset() {
        ReelTopShare.idForTests = null;
        Settings.REEL_TOP_SHARE.resetToDefault();
        Settings.REEL_TOP_SHARE_ZONE.resetToDefault();
    }

    @Test
    public void theZoneIsTheTopShareOfThePageWithinItsBounds() {
        assertTrue(ReelTopShare.inZone(0f, 2000, 25));
        assertTrue(ReelTopShare.inZone(499f, 2000, 25));
        assertFalse(ReelTopShare.inZone(500f, 2000, 25));
        assertFalse("no page height, no zone", ReelTopShare.inZone(10f, 0, 25));
        assertFalse(ReelTopShare.inZone(-1f, 2000, 25));
        assertTrue("held to at least 10%", ReelTopShare.inZone(150f, 2000, 1));
        assertFalse("held to at most 40%", ReelTopShare.inZone(900f, 2000, 90));
    }

    @Test
    public void offItLeavesEveryDoubleTapToInstagram() {
        assertFalse(Settings.REEL_TOP_SHARE.get());
        assertFalse(ReelTopShare.doubleTap(page, tap(100f)));
        assertEquals(0, clicks);
        assertFalse(ReelTopShare.doubleTap(null, null));
    }

    @Test
    public void onATapAtTheTopPressesTheHiddenShareButton() {
        Settings.REEL_TOP_SHARE.save(true);
        assertSame(share, ReelTopShare.findShare(page));
        assertTrue(ReelTopShare.doubleTap(page, tap(100f)));
        assertEquals(1, clicks);
    }

    @Test
    public void aTapBelowTheZoneStillLikes() {
        Settings.REEL_TOP_SHARE.save(true);
        assertFalse(ReelTopShare.doubleTap(page, tap(1500f)));
        assertEquals(0, clicks);
    }

    @Test
    public void withNoShareButtonTheLikeGoesOn() {
        Settings.REEL_TOP_SHARE.save(true);
        share.setId(View.NO_ID);
        assertNull(ReelTopShare.findShare(page));
        assertFalse(ReelTopShare.doubleTap(page, tap(100f)));
        assertEquals(0, clicks);
    }

    private static MotionEvent tap(float y) {
        long now = SystemClock.uptimeMillis();
        return MotionEvent.obtain(now, now, MotionEvent.ACTION_UP, 500f, y, 0);
    }
}
