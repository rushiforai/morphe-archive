/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-18.
 */

package app.morphe.extension.youtube.patches.player;

import static app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType.MINIMAL;
import static app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType.MINIMAL_BAR;
import static app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType.MINIMAL_BAR_2;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.ui.glass.GlassCapsuleDrawable;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class GlassMinimalMiniplayerTest {
    @Test
    public void landscapeMatchesTheCapsuleOnWideWindows() {
        Rect bounds = new Rect(36, 100, 764, 156);
        GlassMinimalMiniplayer.fitLandscapeSpan(bounds, 502, 410, 360, 480);
        assertEquals(new Rect(159, 100, 661, 156), bounds);
    }

    @Test
    public void landscapeMinimumDoesNotCrossEitherInset() {
        Rect bounds = new Rect(36, 100, 764, 156);
        GlassMinimalMiniplayer.fitLandscapeSpan(bounds, 204, 84, 360, 480);
        assertEquals(new Rect(36, 100, 396, 156), bounds);

        bounds.set(36, 100, 764, 156);
        GlassMinimalMiniplayer.fitLandscapeSpan(bounds, 204, 710, 360, 480);
        assertEquals(new Rect(404, 100, 764, 156), bounds);
    }

    @Test
    public void landscapeCapsWidthWithoutCapsuleAndFitsNarrowWindows() {
        Rect bounds = new Rect(36, 100, 764, 156);
        GlassMinimalMiniplayer.fitLandscapeSpan(bounds, 0, bounds.centerX(), 360, 480);
        assertEquals(new Rect(160, 100, 640, 156), bounds);

        bounds.set(36, 100, 283, 156);
        GlassMinimalMiniplayer.fitLandscapeSpan(bounds, 204, 114, 360, 480);
        assertEquals(new Rect(36, 100, 283, 156), bounds);
    }

    @Test
    public void onlyMinimalTypesWithAnEnabledGlassNavigationBarCanShowTheToggle() {
        for (MiniplayerType type : MiniplayerType.values()) {
            final boolean minimal = type == MINIMAL || type == MINIMAL_BAR || type == MINIMAL_BAR_2;
            assertEquals(minimal, GlassMinimalMiniplayer.isAvailable(type, true, true));
            assertFalse(GlassMinimalMiniplayer.isAvailable(type, true, false));
            assertFalse(GlassMinimalMiniplayer.isAvailable(type, false, true));
        }
    }

    @Test
    public void onlyTheWatchPlayerTimebarIsClippedWhenShortsUsesTheSameViewClass() {
        var context = RuntimeEnvironment.getApplication();
        FrameLayout root = new FrameLayout(context);
        FrameLayout player = new FrameLayout(context);
        FrameLayout watchWrapper = new FrameLayout(context);
        FrameLayout shortsWrapper = new FrameLayout(context);
        root.addView(player);
        root.addView(watchWrapper);
        root.addView(shortsWrapper);
        watchWrapper.setId(101);
        shortsWrapper.setId(201);

        View nativeSeekbar = new View(context);
        View overlaySeekbar = new View(context);
        View shortsSeekbar = new View(context);
        player.addView(nativeSeekbar);
        watchWrapper.addView(overlaySeekbar);
        shortsWrapper.addView(shortsSeekbar);

        assertTrue(GlassMinimalMiniplayer.isWatchSeekbar(nativeSeekbar, player, 100, 101, 102));
        assertTrue(GlassMinimalMiniplayer.isWatchSeekbar(overlaySeekbar, player, 100, 101, 102));
        assertFalse(GlassMinimalMiniplayer.isWatchSeekbar(shortsSeekbar, player, 100, 101, 102));
    }

    @Test
    public void olderMinimalTypeOnlyChangesWhenGlassIsEnabled() {
        assertSame(MINIMAL, GlassMinimalMiniplayer.resolveType(MINIMAL, false));
        assertSame(MINIMAL_BAR, GlassMinimalMiniplayer.resolveType(MINIMAL, true));
        assertSame(MINIMAL_BAR_2, GlassMinimalMiniplayer.resolveType(MINIMAL_BAR_2, true));
        assertSame(MiniplayerType.MODERN_4, GlassMinimalMiniplayer.resolveType(MiniplayerType.MODERN_4, false));
    }

    @Test
    public void expandingThePlayerRestoresItsOutlineAndBackground() throws Exception {
        var context = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = context.getPackageName();
        info.versionName = "21.45.90";
        info.applicationInfo = context.getApplicationInfo();
        Shadows.shadowOf(context.getPackageManager()).installPackage(info);
        var appContext = Utils.class.getDeclaredField("context");
        appContext.setAccessible(true);
        appContext.set(null, context);

        View container = new View(context);
        ColorDrawable originalBackground = new ColorDrawable(Color.BLUE);
        container.setBackground(originalBackground);
        View player = new View(context);
        player.setOutlineProvider(ViewOutlineProvider.BOUNDS);
        GlassMinimalMiniplayer glass = new GlassMinimalMiniplayer(container, false);

        glass.update(player, true);
        glass.roundVideo(player, new Rect(0, 0, Dim.dp(100), Dim.dp(48)), Dim.dp(360), Dim.dp(56), Dim.dp6);
        assertTrue(container.getBackground() instanceof GlassCapsuleDrawable);
        assertTrue(player.getClipToOutline());

        glass.update(player, false);
        assertSame(originalBackground, container.getBackground());
        assertSame(ViewOutlineProvider.BOUNDS, player.getOutlineProvider());
        assertFalse(player.getClipToOutline());
    }
}
