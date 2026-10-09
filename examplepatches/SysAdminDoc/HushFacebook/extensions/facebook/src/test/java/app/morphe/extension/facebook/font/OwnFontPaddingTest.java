/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.font;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.graphics.Typeface;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Issue #96: with `Use the system font` on, some phones' fonts lost the tails of y, g and p in
 * Facebook, because they declare far less descent than their letters use and Facebook lays its text
 * out without font padding. The padding goes on for those fonts only, while the switch is on, and
 * only for the phone's font or the picked file.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class OwnFontPaddingTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    @After
    public void clean() {
        OwnFont.OVERFLOWS.clear();
        HookStatus.clear();
        Settings.USE_SYSTEM_FONT.resetToDefault();
    }

    private static TextPaint paint(Typeface face) {
        TextPaint paint = new TextPaint();
        paint.setTypeface(face);
        return paint;
    }

    /** Measured at 100 px. Roboto keeps its letters inside; the reporter's font draws 20 px below its descent. */
    @Test
    public void lettersPastTheLineBoxByMoreThanTwoPercentOverflow() {
        assertFalse("Roboto", OwnFont.reachesPast(-92.8f, 24.4f, -73, 21));
        assertFalse("MiSans", OwnFont.reachesPast(-104.4f, 28.2f, -74, 23));
        assertFalse("within the slack", OwnFont.reachesPast(-90f, 20f, -91, 22));
        assertTrue("tails below the descent", OwnFont.reachesPast(-95f, 2f, -74, 22));
        assertTrue("ascenders above the ascent", OwnFont.reachesPast(-60f, 25f, -75, 21));
    }

    @Test
    public void aFontThatOverflowsIsPaddedOnlyWhileTheSwitchIsOn() {
        OwnFont.OVERFLOWS.put(Typeface.DEFAULT, true);
        Settings.USE_SYSTEM_FONT.save(false);
        assertFalse("switch off", OwnFont.needsPad(paint(Typeface.DEFAULT)));

        Settings.USE_SYSTEM_FONT.save(true);
        assertTrue("the phone's font", OwnFont.needsPad(paint(Typeface.DEFAULT)));
        assertTrue("no typeface draws in the phone's", OwnFont.needsPad(paint(null)));
        assertFalse("no paint", OwnFont.needsPad(null));
    }

    @Test
    public void aFontThatFitsOrIsntThePhonesKeepsFacebooksLayout() {
        Settings.USE_SYSTEM_FONT.save(true);
        OwnFont.OVERFLOWS.put(Typeface.DEFAULT, false);
        assertFalse("fits", OwnFont.needsPad(paint(Typeface.DEFAULT)));

        OwnFont.OVERFLOWS.put(Typeface.SERIF, true);
        assertFalse("a font of the story's or Meta's", OwnFont.needsPad(paint(Typeface.SERIF)));
    }

    /** The builder obtained last on this thread carries its paint's answer to the padding choice, and only that builder. */
    @Test
    public void theBuilderObtainedLastIsPaddedForItsPaint() {
        Settings.USE_SYSTEM_FONT.save(true);
        OwnFont.OVERFLOWS.put(Typeface.DEFAULT, true);
        StaticLayout.Builder other = OwnFont.obtain("Playback speed", 0, 14, paint(Typeface.SERIF), 400);
        assertFalse("a font that isn't the phone's", OwnFont.padsFor(other));

        StaticLayout.Builder builder = OwnFont.obtain("Playback speed", 0, 14, paint(Typeface.DEFAULT), 400);
        assertTrue(OwnFont.padsFor(builder));
        assertFalse("a builder obtained before", OwnFont.padsFor(other));
        assertSame("the same builder comes back", builder, OwnFont.setIncludePad(builder, false));

        Settings.USE_SYSTEM_FONT.save(false);
        assertFalse("switch off", OwnFont.padsFor(builder));
    }

    @Test
    public void aTextViewWithoutPaddingTakesItForAnOverflowingFont() {
        TextView view = new TextView(RuntimeEnvironment.getApplication());
        view.setTypeface(Typeface.DEFAULT);
        view.setIncludeFontPadding(false);
        OwnFont.OVERFLOWS.put(Typeface.DEFAULT, true);

        Settings.USE_SYSTEM_FONT.save(false);
        OwnFont.textView(view);
        assertFalse("switch off", view.getIncludeFontPadding());

        Settings.USE_SYSTEM_FONT.save(true);
        OwnFont.textView(view);
        assertTrue(view.getIncludeFontPadding());
    }

    /** Each typeface is measured once, and the report counts what the measure found. */
    @Test
    public void eachTypefaceIsMeasuredOnceAndCounted() {
        boolean first = OwnFont.overflows(Typeface.MONOSPACE);
        assertEquals(first, OwnFont.overflows(Typeface.MONOSPACE));
        List<String> lines = HookStatus.report();
        assertEquals(lines.toString(), 1, lines.size());
        assertTrue(lines.get(0), lines.get(0).contains((first ? OwnFont.PADDED : OwnFont.FITS) + " 1"));
    }
}
