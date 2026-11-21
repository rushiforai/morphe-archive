/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.pm.PackageInfo;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.FullscreenVideoScalePatch.VideoScaleMode;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class FullscreenVideoScaleTest {
    private ActivityController<Activity> activity;
    private FrameLayout root;
    private View player;

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "21.45.90";
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);

        activity = Robolectric.buildActivity(Activity.class).setup().visible();
        Utils.setActivity(activity.get());
        root = new FrameLayout(activity.get());
        player = new View(activity.get());
        root.addView(player, 320, 180);
        activity.get().setContentView(root);
        activity.get().getWindow().getDecorView().layout(0, 0, 800, 480);
        root.layout(0, 0, 800, 480);
        player.layout(0, 0, 320, 180);
        Settings.FULLSCREEN_VIDEO_SCALE.save(VideoScaleMode.DEFAULT);
        PlayerType.setFromString("WATCH_WHILE_FULLSCREEN");
    }

    @After
    public void tearDown() {
        Settings.FULLSCREEN_VIDEO_SCALE.save(VideoScaleMode.DEFAULT);
        PlayerType.setFromString("NONE");
        FullscreenVideoScalePatch.onPlayerViewLayout(player);
        Utils.setActivity(null);
        activity.close();
    }

    @Test
    public void defaultLeavesAnOngoingNativeAnimationAlone() {
        player.setPivotX(7f);
        player.setPivotY(11f);
        player.setScaleX(0.8f);
        player.setScaleY(0.9f);
        player.setTranslationX(19f);
        player.setTranslationY(-6f);

        FullscreenVideoScalePatch.onPlayerViewLayout(player);

        assertEquals(7f, player.getPivotX(), 0f);
        assertEquals(11f, player.getPivotY(), 0f);
        assertEquals(0.8f, player.getScaleX(), 0f);
        assertEquals(0.9f, player.getScaleY(), 0f);
        assertEquals(19f, player.getTranslationX(), 0f);
        assertEquals(-6f, player.getTranslationY(), 0f);
    }

    @Test
    public void leavingStretchRestoresItsWorkButKeepsNewNativeTranslation() {
        player.setScaleX(0.8f);
        root.setClipChildren(true);
        assertFalse(player.isPivotSet());
        Settings.FULLSCREEN_VIDEO_SCALE.save(VideoScaleMode.STRETCH);
        FullscreenVideoScalePatch.onPlayerViewLayout(player);
        assertTrue(player.getScaleX() > 1f);
        assertFalse(root.getClipChildren());

        // The host has started its exit animation before its player-type callback reaches RVX.
        player.setTranslationX(27f);
        PlayerType.setFromString("WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN");
        FullscreenVideoScalePatch.onPlayerViewLayout(player);

        assertEquals(27f, player.getTranslationX(), 0f);
        assertEquals(0.8f, player.getScaleX(), 0f);
        assertFalse(player.isPivotSet());
        assertTrue(root.getClipChildren());
    }

    @Test
    public void returningFromZoomToDefaultReleasesTheHostView() {
        player.setPivotX(33f);
        player.setPivotY(17f);
        Settings.FULLSCREEN_VIDEO_SCALE.save(VideoScaleMode.ZOOM);
        FullscreenVideoScalePatch.onPlayerViewLayout(player);
        assertTrue(player.getScaleX() > 1f);
        assertEquals(player.getScaleX(), player.getScaleY(), 0.001f);

        Settings.FULLSCREEN_VIDEO_SCALE.save(VideoScaleMode.DEFAULT);
        FullscreenVideoScalePatch.onPlayerViewLayout(player);
        assertEquals(1f, player.getScaleX(), 0f);
        assertEquals(1f, player.getScaleY(), 0f);
        assertEquals(33f, player.getPivotX(), 0f);
        assertEquals(17f, player.getPivotY(), 0f);

        player.setTranslationY(22f);
        FullscreenVideoScalePatch.onPlayerViewLayout(player);
        assertEquals(22f, player.getTranslationY(), 0f);
    }

    @Test
    public void defaultRestoresThePreviousTargetNotItsReplacement() {
        player.setScaleX(0.75f);
        Settings.FULLSCREEN_VIDEO_SCALE.save(VideoScaleMode.STRETCH);
        FullscreenVideoScalePatch.onPlayerViewLayout(player);
        assertTrue(player.getScaleX() > 1f);

        View replacement = new View(activity.get());
        root.addView(replacement, 320, 180);
        replacement.layout(0, 0, 320, 180);
        replacement.setScaleX(0.6f);
        Settings.FULLSCREEN_VIDEO_SCALE.save(VideoScaleMode.DEFAULT);
        FullscreenVideoScalePatch.onPlayerViewLayout(replacement);

        assertEquals(0.75f, player.getScaleX(), 0f);
        assertEquals(0.6f, replacement.getScaleX(), 0f);
    }

    @Test
    public void zoomFollowsTheWindowWhenAndroidMovesItDuringATransition() {
        Settings.FULLSCREEN_VIDEO_SCALE.save(VideoScaleMode.ZOOM);
        FullscreenVideoScalePatch.onPlayerViewLayout(player);
        float left = player.getTranslationX();
        float top = player.getTranslationY();

        View decor = activity.get().getWindow().getDecorView();
        decor.setTranslationX(37f);
        decor.setTranslationY(23f);
        FullscreenVideoScalePatch.onPlayerViewLayout(player);

        assertEquals(left, player.getTranslationX(), 0f);
        assertEquals(top, player.getTranslationY(), 0f);
    }
}
