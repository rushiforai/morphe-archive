/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.southstar21.extension.instagram.liquidglass;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * A sheet's glass follows the sheet's own theme, not the app's mode: Reels' sheets are dark with white text in a
 * light app, and light glass under that text left it unreadable.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class GlassSheetsThemeTest {
    private static final int WIDTH = 1000;

    private Activity activity;
    private GlassSheets sheets;

    @Before
    public void prepare() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        sheets = new GlassSheets(activity);
    }

    @Test
    public void aDarkPaintedSheetIsDarkInALightApp() {
        FrameLayout surface = sheet(new ColorDrawable(0xff262626), 0xffffffff);
        assertTrue(sheets.sheetDark(surface, WIDTH, false));
    }

    @Test
    public void aLightPaintedSheetIsLightInADarkApp() {
        FrameLayout surface = sheet(new ColorDrawable(0xffffffff), 0xff000000);
        assertFalse(sheets.sheetDark(surface, WIDTH, true));
    }

    @Test
    public void aRoundedShapeCountsAsTheSheetsColor() {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(0xff121212);
        assertTrue(sheets.sheetDark(sheet(shape, 0xff000000), WIDTH, false));
    }

    @Test
    public void aWideSolidLayerUnderAClearSurfaceDecides() {
        FrameLayout surface = new FrameLayout(activity);
        surface.setBackground(new ColorDrawable(0x00000000));
        LinearLayout layer = new LinearLayout(activity);
        layer.setBackground(new ColorDrawable(0xff000000));
        surface.addView(layer, new FrameLayout.LayoutParams(WIDTH, 400));
        lay(surface);
        assertTrue(sheets.sheetDark(surface, WIDTH, false));
    }

    @Test
    public void withNoPaintedColorMostlyWhiteTextIsADarkSheet() {
        assertTrue(sheets.sheetDark(sheet(null, 0xffffffff), WIDTH, false));
        assertFalse(sheets.sheetDark(sheet(null, 0xff111111), WIDTH, true));
    }

    @Test
    public void withNothingToGoByTheAppsModeStays() {
        FrameLayout empty = new FrameLayout(activity);
        lay(empty);
        assertTrue(sheets.sheetDark(empty, WIDTH, true));
        assertFalse(sheets.sheetDark(empty, WIDTH, false));
    }

    /** A sheet surface painted [background] holding three rows of text in [textColor]. */
    private FrameLayout sheet(android.graphics.drawable.Drawable background, int textColor) {
        FrameLayout surface = new FrameLayout(activity);
        surface.setBackground(background);
        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        for (String words : new String[]{"Exit fullscreen", "Speed", "Auto scroll"}) {
            TextView row = new TextView(activity);
            row.setText(words);
            row.setTextColor(textColor);
            rows.addView(row);
        }
        surface.addView(rows, new FrameLayout.LayoutParams(WIDTH / 2, 400));
        lay(surface);
        return surface;
    }

    private static void lay(View view) {
        view.measure(View.MeasureSpec.makeMeasureSpec(WIDTH, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY));
        view.layout(0, 0, WIDTH, 800);
    }
}
