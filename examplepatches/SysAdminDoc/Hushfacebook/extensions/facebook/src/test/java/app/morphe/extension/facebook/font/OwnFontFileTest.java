/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.font;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.nio.file.Files;
import java.util.Arrays;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;

/**
 * What a picked font file draws: Facebook's text in it, a variable font at the weight asked for,
 * and the phone's font once the copy stops loading. Android's own text code runs here, so each
 * answer is measured and drawn rather than taken on trust.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class OwnFontFileTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for Facebook's font family enum: only the constant's name matters to the swap. */
    enum Family { OPTIMISTIC_TEXT_APP_REGULAR }

    private static final String LATIN = "Hushfacebook draws the feed";
    /** Khmer letters, which Noto Sans Khmer draws, heavier along its weight axis. */
    private static final String KHMER = "កខគឃងចឆជឈញ";

    @After
    public void restore() {
        Settings.USE_SYSTEM_FONT.resetToDefault();
        Settings.FONT_SOURCE.resetToDefault();
        OwnFont.fileChanged();
        // Each test has a files folder of its own, so a copy a typeface still maps can stay.
        FontFile.file(RuntimeEnvironment.getApplication()).delete();
    }

    /** Picks [resource] the way the settings row does: a checked copy, then its name saved. */
    private static File pick(String resource, String name) throws Exception {
        Context app = RuntimeEnvironment.getApplication();
        File copy = FontFile.file(app);
        FontFile.copy(new ByteArrayInputStream(FontFileTest.font(resource)), copy, OwnFont::loads);
        Settings.FONT_SOURCE.save(name);
        OwnFont.fileChanged();
        return copy;
    }

    private static Paint paint(Typeface typeface) {
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setTextSize(60);
        paint.setColor(Color.BLACK);
        paint.setTypeface(typeface);
        return paint;
    }

    private static float width(Typeface typeface, String text) {
        return paint(typeface).measureText(text);
    }

    /** How many pixels [text] darkens: more for a heavier weight, whatever the advances do. */
    private static int ink(Typeface typeface, String text) {
        Bitmap bitmap = Bitmap.createBitmap(1400, 120, Bitmap.Config.ARGB_8888);
        new Canvas(bitmap).drawText(text, 10, 90, paint(typeface));
        int[] pixels = new int[bitmap.getWidth() * bitmap.getHeight()];
        bitmap.getPixels(pixels, 0, bitmap.getWidth(), 0, 0, bitmap.getWidth(), bitmap.getHeight());
        return (int) Arrays.stream(pixels).filter(pixel -> Color.alpha(pixel) > 128).count();
    }

    @Test
    public void metasTextIsDrawnInThePickedFont() throws Exception {
        File copy = pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Typeface rubik = new Typeface.Builder(copy).build();
        Typeface meta = Typeface.create(Typeface.SERIF, 400, false);
        assertNotEquals("Rubik measures like the phone's font, so this proves nothing",
                width(Typeface.DEFAULT, LATIN), width(rubik, LATIN), 1f);

        Typeface drawn = OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_REGULAR, 400);
        assertEquals(width(rubik, LATIN), width(drawn, LATIN), 0.01f);
        assertEquals(ink(rubik, LATIN), ink(drawn, LATIN));
        assertSame("built again for the same weight and slant", drawn,
                OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_REGULAR, 400));

        // Rubik Regular has no bold or italic of its own, so Android draws them, and the
        // typefaces say what they were asked to be.
        Typeface bold = OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_REGULAR, 700);
        assertEquals(700, bold.getWeight());
        assertTrue("the bold isn't heavier", ink(bold, LATIN) > ink(drawn, LATIN));
        Typeface italic = OwnFont.replace(Typeface.create(Typeface.SERIF, 400, true),
                Family.OPTIMISTIC_TEXT_APP_REGULAR, 400);
        assertTrue(italic.isItalic());
    }

    /**
     * A variable font is built along its 'wght' axis. Noto Sans Khmer's early axis runs from 26 to
     * 190, so any weight past 190 is its heaviest, and that heaviest is told it's the weight asked
     * for, so Android doesn't embolden it a second time.
     */
    @Test
    public void aVariableFontIsBuiltAtTheWeightAsked() throws Exception {
        File copy = pick(FontFileTest.VARIABLE_FONT, "NotoSansKhmer-VF.ttf");
        Typeface light = OwnFont.typeface(100, false);
        Typeface heavy = OwnFont.typeface(900, false);
        assertEquals(900, heavy.getWeight());
        assertTrue("the weight axis wasn't set: " + ink(light, KHMER) + " against " + ink(heavy, KHMER),
                ink(heavy, KHMER) > ink(light, KHMER));
        assertEquals("both are the axis's heaviest", ink(heavy, KHMER), ink(OwnFont.typeface(700, false), KHMER));

        Typeface axisOnly = new Typeface.Builder(copy).setFontVariationSettings("'wght' 190").setWeight(900).build();
        assertEquals(ink(axisOnly, KHMER), ink(heavy, KHMER));
        Typeface emboldened = Typeface.create(new Typeface.Builder(copy).setFontVariationSettings("'wght' 190").build(),
                900, false);
        assertTrue("the control: Android emboldens a font it thinks is lighter",
                ink(emboldened, KHMER) > ink(axisOnly, KHMER));
    }

    /**
     * React Native text takes the heavier of the weight Facebook registered its family at and the
     * weight the text asked for, and its slant.
     */
    @Test
    public void reactNativeTextTakesTheHeavierWeight() throws Exception {
        pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Typeface registered = OwnFont.replaceReactNative(Typeface.create(Typeface.DEFAULT, 400, false),
                "Optimistic VF App Lite 700");
        assertEquals(700, registered.getWeight());
        assertSame(OwnFont.typeface(700, false), registered);
        Typeface asked = OwnFont.replaceReactNative(Typeface.create(Typeface.DEFAULT, 800, true),
                "Optimistic VF App Lite 500");
        assertEquals(800, asked.getWeight());
        assertTrue(asked.isItalic());
        assertSame(OwnFont.typeface(800, true), asked);
    }

    /**
     * A copy that stopped loading draws in the phone's font, and the switch off still means Meta's.
     * The broken copy is written where a picked one would be rather than over one: Windows, where
     * these tests run, won't write to a file a typeface still maps, which Android does. The control,
     * a copy that loads, is metasTextIsDrawnInThePickedFont, and a copy that's gone is OwnFontTest's.
     */
    @Test
    public void aCopyThatWontLoadMeansThePhonesFont() throws Exception {
        Typeface meta = Typeface.create(Typeface.SERIF, 400, false);
        Typeface phone = Typeface.create(Typeface.DEFAULT, 400, false);
        File copy = FontFile.file(RuntimeEnvironment.getApplication());
        byte[] broken = new byte[4096];
        broken[1] = 1;
        Files.write(copy.toPath(), broken);
        assertFalse(OwnFont.loads(copy));
        Settings.FONT_SOURCE.save("Broken.ttf");
        OwnFont.fileChanged();
        assertEquals(width(phone, LATIN), width(OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_REGULAR, 400), LATIN),
                0.01f);
        // At the weight and slant asked for, as with no file at all.
        assertEquals(width(Typeface.create(Typeface.DEFAULT, 700, true), LATIN), width(OwnFont.replace(
                Typeface.create(Typeface.SERIF, 400, true), Family.OPTIMISTIC_TEXT_APP_REGULAR, 700), LATIN), 0.01f);

        Settings.USE_SYSTEM_FONT.save(false);
        assertSame(meta, OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_REGULAR, 400));
    }

    /**
     * A file that starts like a font and isn't one is turned down when it's picked, by Android's own
     * font code, and the font picked before stays.
     */
    @Test
    public void aBrokenFontIsTurnedDownWhenPicked() throws Exception {
        File copy = pick(FontFileTest.VARIABLE_FONT, "NotoSansKhmer-VF.ttf");
        assertTrue(OwnFont.loads(copy));
        byte[] before = Files.readAllBytes(copy.toPath());
        byte[] broken = new byte[4096];
        broken[1] = 1;
        try {
            FontFile.copy(new ByteArrayInputStream(broken), copy, OwnFont::loads);
            fail("a broken font was taken");
        } catch (FontFile.Refused refused) {
            assertEquals(FontFile.Refusal.WONT_LOAD, refused.reason);
        }
        assertArrayEquals(before, Files.readAllBytes(copy.toPath()));
        assertTrue(OwnFont.loads(copy));
    }
}
