/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.shared.patches.glassmenus;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.ColorStateListDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;

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
