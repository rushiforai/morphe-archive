/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.shared.patches.glassmenus;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.ColorStateListDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.SurfaceView;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class GlassMenuRenderingTest {
    @Test
    public void copiesOnlyThePaddedPanelInsideTheOwningWindow() {
        Rect result = new Rect();
        assertTrue(BlurRegion.copyArea(new Rect(30, 400, 270, 600), 300, 620, 40, result));
        assertEquals(new Rect(0, 360, 300, 620), result);
        assertFalse(BlurRegion.copyArea(new Rect(), 300, 620, 40, result));
    }

    @Test
    public void snapshotsYouTubeWindowsWithNestedSurfaceViewsWithoutDependingOnTheirBounds() {
        Context context = RuntimeEnvironment.getApplication();
        FrameLayout decor = new FrameLayout(context);
        FrameLayout player = new FrameLayout(context);
        decor.addView(new View(context));
        decor.addView(player);
        assertFalse(BlurRegion.requiresWindowSnapshot(decor, true));

        player.addView(new SurfaceView(context));
        assertTrue(BlurRegion.requiresWindowSnapshot(decor, true));
        assertFalse(BlurRegion.requiresWindowSnapshot(decor, false));
    }

    @Test
    public void clipsTallQualityPanelToTheActivitySurfaceInPixels() {
        Rect logicalPanel = new Rect(20, 112, 1060, 1375);
        Rect panelOnSource = new Rect(logicalPanel);
        panelOnSource.offset(0, 1100);
        Rect visiblePanel = new Rect(panelOnSource);
        Rect sample = new Rect();

        assertTrue(BlurRegion.clipToSource(visiblePanel, 1080, 2400));
        assertEquals(new Rect(20, 1212, 1060, 2400), visiblePanel);
        assertTrue(BlurRegion.copyArea(panelOnSource, 1080, 2400, 120, sample));
        assertEquals(new Rect(0, 1092, 1080, 2400), sample);
        assertTrue(sample.contains(visiblePanel));
        assertFalse(sample.contains(panelOnSource));
        visiblePanel.offset(0, -1100);
        assertEquals(new Rect(20, 112, 1060, 1300), visiblePanel);

        panelOnSource.offsetTo(20, 2400);
        assertFalse(BlurRegion.copyArea(panelOnSource, 1080, 2400, 120, sample));
        assertTrue(sample.isEmpty());
    }

    @Test
    public void mapsLetterboxedVideoCropToBothTheSurfaceAndTheDownsampledPanel() {
        Rect playerBounds = new Rect(240, 0, 2160, 1080);
        Rect sample = new Rect(650, 40, 1750, 1080);
        Rect visibleVideo = new Rect(720, 121, 1681, 1061);
        Rect crop = new Rect();

        BlurRegion.mapVideoCrop(visibleVideo, playerBounds, 1280, 720, crop);
        assertEquals(new Rect(320, 80, 961, 708), crop);

        BlurRegion.mapVideoCrop(visibleVideo, sample, 550, 520, crop);
        assertEquals(new Rect(35, 40, 516, 511), crop);
    }

    @Test
    public void onlyMarkedLandscapeGearUsesTheInnerPanelAndGlassDefaultsOff() {
        Context app = RuntimeEnvironment.getApplication();
        Utils.setContext(app);
        Context landscape = oriented(app, Configuration.ORIENTATION_LANDSCAPE);
        FrameLayout host = new FrameLayout(landscape);
        LinearLayout panel = gearPanel(landscape, host);
        FrameLayout root = (FrameLayout) panel.getParent();

        assertFalse(SharedYouTubeSettings.GLASS_MENUS.get());
        GlassMenusPatch.markLandscapePlayerGearView(root);
        assertNull(GlassMenusPatch.landscapePlayerGearPanel(host));

        SharedYouTubeSettings.GLASS_MENUS.save(true);
        assertNull(GlassMenusPatch.landscapePlayerGearPanel(host));
        GlassMenusPatch.markLandscapePlayerGearView(root);
        assertSame(panel, GlassMenusPatch.landscapePlayerGearPanel(host));
        assertSame(root, panel.getParent());

        Context portrait = oriented(app, Configuration.ORIENTATION_PORTRAIT);
        FrameLayout portraitHost = new FrameLayout(portrait);
        LinearLayout portraitPanel = gearPanel(portrait, portraitHost);
        GlassMenusPatch.markLandscapePlayerGearView((View) portraitPanel.getParent());
        assertNull(GlassMenusPatch.landscapePlayerGearPanel(portraitHost));

        SharedYouTubeSettings.GLASS_MENUS.save(false);
    }

    private static Context oriented(Context context, int orientation) {
        Configuration config = new Configuration(context.getResources().getConfiguration());
        config.orientation = orientation;
        return context.createConfigurationContext(config);
    }

    private static LinearLayout gearPanel(Context context, FrameLayout host) {
        FrameLayout root = new FrameLayout(context);
        LinearLayout panel = new LinearLayout(context);
        panel.setBackgroundColor(Color.BLACK);
        panel.setClipToOutline(true);
        root.addView(panel);
        host.addView(root);
        return panel;
    }

    @Test
    public void adjoiningFillsDoNotPaintAcrossInsetsOrDisjointAreas() {
        Rect panel = new Rect(18, 90, 282, 400);
        GlassSurface.extendJoinedPanel(panel, new Rect(18, 60, 282, 90));
        GlassSurface.extendJoinedPanel(panel, new Rect(0, 10, 300, 55));
        GlassSurface.extendJoinedPanel(panel, new Rect(0, 160, 300, 180));
        assertEquals(new Rect(18, 60, 282, 400), panel);
    }

    @Test
    public void preservesStateListsAndRipplesButRecognizesInsetSolidFills() {
        int[][] states = {{android.R.attr.state_selected}, {}};
        ColorStateList stateful = new ColorStateList(states, new int[]{Color.RED, Color.BLACK});
        assertNull(SolidColors.leafOf(new ColorStateListDrawable(stateful)));
        assertNull(SolidColors.leafOf(new RippleDrawable(stateful, new ColorDrawable(Color.BLACK), null)));

        ColorDrawable fill = new ColorDrawable(Color.BLACK);
        InsetDrawable inset = new InsetDrawable(fill, 12);
        assertSame(fill, SolidColors.leafOf(inset));
        assertEquals(Color.BLACK, SolidColors.colorOf(inset));
    }

    @Test
    public void unknownAndTranslucentDrawablesAreNotTreatedAsEmptyBackgrounds() {
        assertTrue(SolidColors.isTransparent(null));
        assertTrue(SolidColors.isTransparent(new ColorDrawable(Color.TRANSPARENT)));
        assertFalse(SolidColors.isTransparent(new ColorDrawable(0x99000000)));
        assertFalse(SolidColors.isTransparent(new RippleDrawable(
                ColorStateList.valueOf(Color.WHITE), null, null)));
    }

    @Test
    public void glassDimRestoresStockWithoutOverwritingLaterAppDimOrAddingAScrim() {
        Window window = new Dialog(RuntimeEnvironment.getApplication()).getWindow();
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(0.6f);

        GlassSurface.WindowDim dim = new GlassSurface.WindowDim(window);
        dim.apply(0.2f);
        dim.apply(0.2f);
        assertEquals(0.2f, window.getAttributes().dimAmount, 0);
        dim.restore();
        assertEquals(0.6f, window.getAttributes().dimAmount, 0);

        dim.apply(0.2f);
        window.setDimAmount(0.4f);
        dim.restore();
        assertEquals(0.4f, window.getAttributes().dimAmount, 0);

        window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        dim.apply(0.2f);
        assertEquals(0.4f, window.getAttributes().dimAmount, 0);
        assertEquals(0, window.getAttributes().flags & WindowManager.LayoutParams.FLAG_DIM_BEHIND);
    }

    @Test
    public void mountedLithoFillsAreScopedAndTranslucentReplacementsAreNotHidden() {
        Context context = RuntimeEnvironment.getApplication();
        FrameLayout panel = new FrameLayout(context);
        View host = new View(context);
        panel.addView(host);
        ColorDrawable fill = new ColorDrawable(Color.BLACK);
        host.setBackground(new InsetDrawable(fill, 4));
        LithoFills.onColor(fill, Color.BLACK);

        View unrelated = new View(context);
        ColorDrawable unrelatedFill = new ColorDrawable(Color.BLACK);
        unrelated.setBackground(unrelatedFill);
        LithoFills.onColor(unrelatedFill, Color.BLACK);

        List<Drawable> found = new ArrayList<>();
        LithoFills.visitInside(panel, (drawable, color, mountedHost) -> {
            assertSame(host, mountedHost);
            assertEquals(Color.BLACK, color);
            found.add(drawable);
        });
        assertEquals(List.of(fill), found);

        LithoFills.onColor(fill, 0x70FFFFFF);
        found.clear();
        LithoFills.visitInside(panel, (drawable, color, mountedHost) -> found.add(drawable));
        assertTrue(found.isEmpty());
    }
}
