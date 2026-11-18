/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-18.
 */
package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;
import android.graphics.Rect;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class MinimalMiniplayerMotionTest {
    private final Rect bar = new Rect(12, 1098, 564, 1177);
    private final Rect result = new Rect();

    @Before
    public void setUp() {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.39.525";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Utils.setContext(application);
    }

    @Test
    public void slideStartsAtNativeBounds() {
        Rect frame = new Rect(0, 0, 576, 324);

        MinimalMiniplayerPatch.interpolateCollapseBounds(frame, bar, result);

        assertEquals(frame, result);
    }

    @Test
    public void lateSlideClosesMostOfTheGapBeforeControlsFade() {
        Rect frame = new Rect(0, 1020, 576, 1178);

        MinimalMiniplayerPatch.interpolateCollapseBounds(frame, bar, result);

        assertEquals(new Rect(11, 1092, 565, 1177), result);
        assertEquals(new Rect(0, 1020, 576, 1178), frame);

        frame.set(0, 1098, 576, 1255);
        MinimalMiniplayerPatch.interpolateCollapseBounds(frame, bar, result);

        assertEquals(new Rect(11, 1098, 565, 1181), result);
        assertTrue(result.height() > bar.height());
    }

    @Test
    public void reversingASlideRetracesTheSameBounds() {
        Rect frame = new Rect(0, 710, 576, 960);
        MinimalMiniplayerPatch.interpolateCollapseBounds(frame, bar, result);
        Rect before = new Rect(result);

        MinimalMiniplayerPatch.interpolateCollapseBounds(new Rect(0, 1020, 576, 1178), bar, result);
        assertTrue(result.top > before.top);
        assertTrue(result.height() < before.height());

        MinimalMiniplayerPatch.interpolateCollapseBounds(frame, bar, result);
        assertEquals(before, result);
    }
}
