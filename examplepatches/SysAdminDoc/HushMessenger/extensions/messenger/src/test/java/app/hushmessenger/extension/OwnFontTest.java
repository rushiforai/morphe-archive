package app.hushmessenger.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.StaticLayout;
import android.text.TextPaint;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowLog;
import static org.junit.Assert.*;

/**
 * What the font swap makes of each typeface: Meta's Optimistic families become the chosen font, Roboto Mono and the
 * other creative families stay, and the phone's sans-serif takes a picked file. Android's own text code runs here, so a
 * picked file's answers are measured and drawn rather than taken on trust.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class OwnFontTest {
    /** Every constant of Messenger 582's font family enum, as build 346415706 names them. */
    enum Family {
        AVENY_T_REGULAR, FACEBOOK_NARROW, FACEBOOK_SANS_HEAVY_ITALIC, OPTIMISTIC_DISPLAY_APP, OPTIMISTIC_DISPLAY_APP_MEDIUM,
        OPTIMISTIC_TEXT_APP_REGULAR, OPTIMISTIC_TEXT_APP_MEDIUM, OPTIMISTIC_TEXT_APP_BOLD, OPTIMISTIC_AI, OPTIMISTIC_AI_1_BETA,
        OPTIMISTIC_AI_2_BETA, OPTIMISTIC_AI_3_BETA, OPTIMISTIC_VF_APP_LITE, FACEBOOK_SANS_VARIABLE, OLD_STANDARD_TT_REGULAR,
        SF_UI_TEXT_REGULAR, AVENIR_NEXT_BOLD_ITALIC, MONTSERRAT_EXTRA_BOLD, MONTSERRAT_EXTRA_BOLD_ITALIC, OLD_STANDARD_TT_BOLD,
        OLD_STANDARD_TT_ITALIC, ROBOTO_LIGHT, ROBOTO_LIGHT_ITALIC, SFUI_TEXT_REGULAR, SFUI_TEXT_REGULAR_ITALIC, BARLOW_SEMI_BOLD,
        COURIER_PRIME_BOLD, MONTSERRAT_REGULAR, ROBOTO_MONO_REGULAR, ARAPEY_ITALIC, BUBBLE_REGULAR, SERIF_REGULAR
    }

    private static final List<Family> OPTIMISTIC = Arrays.asList(Family.OPTIMISTIC_DISPLAY_APP, Family.OPTIMISTIC_DISPLAY_APP_MEDIUM,
        Family.OPTIMISTIC_TEXT_APP_REGULAR, Family.OPTIMISTIC_TEXT_APP_MEDIUM, Family.OPTIMISTIC_TEXT_APP_BOLD, Family.OPTIMISTIC_AI,
        Family.OPTIMISTIC_AI_1_BETA, Family.OPTIMISTIC_AI_2_BETA, Family.OPTIMISTIC_AI_3_BETA, Family.OPTIMISTIC_VF_APP_LITE);

    private static final String LATIN = "HushMessenger draws the chats";
    /** Khmer letters, which Noto Sans Khmer draws, heavier along its weight axis. */
    private static final String KHMER = "កខគឃងចឆជឈញ";

    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    @Before public void reset() throws Exception {
        FontFile.testFolder = folder.newFolder();
        OwnFont.fileCheck = OwnFontTest::loadsCopy;
        Context app = RuntimeEnvironment.getApplication();
        // Cleared before Settings starts, so nothing from an earlier test's switches carries over.
        app.getSharedPreferences("hushmessenger", Context.MODE_PRIVATE).edit().clear().commit();
        Settings.initialize(app);
        OwnFont.forget();
    }

    @After public void restore() {
        Settings.preferences.edit().clear().commit();
        OwnFont.forget();
        FontFile.testFolder = null;
        OwnFont.fileCheck = OwnFont::loads;
    }

    /**
     * {@link OwnFont#loads} on a copy of [file]. Robolectric's native fonts map the file they load, and Windows won't
     * rename a mapped file, so the copy the check passes has to stay unloaded until it's moved in.
     */
    static boolean loadsCopy(File file) {
        try {
            File probe = File.createTempFile("probe", ".ttf", FontFile.testFolder);
            Files.copy(file.toPath(), probe.toPath(), StandardCopyOption.REPLACE_EXISTING);
            return OwnFont.loads(probe);
        } catch (IOException failure) {
            throw new UncheckedIOException(failure);
        }
    }

    /** Picks [resource] the way the settings row does: a checked copy, then its name saved. */
    static File pick(String resource, String name) throws Exception {
        File copy = FontFile.file(RuntimeEnvironment.getApplication());
        FontFile.copy(new ByteArrayInputStream(FontFileTest.font(resource)), copy, OwnFontTest::loadsCopy);
        Settings.preferences.edit().putString(OwnFont.NAME_KEY, name).commit();
        OwnFont.forget();
        return copy;
    }

    private static Paint paint(Typeface typeface) {
        return paint(typeface, 60);
    }

    private static TextPaint paint(Typeface typeface, float size) {
        TextPaint paint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        paint.setTextSize(size);
        paint.setColor(Color.BLACK);
        paint.setTypeface(typeface);
        return paint;
    }

    static float width(Typeface typeface, String text) {
        return paint(typeface).measureText(text);
    }

    private static float width(Typeface typeface, String text, float size) {
        return paint(typeface, size).measureText(text);
    }

    /** How many pixels [text] darkens: more for a heavier weight, whatever the advances do. */
    private static int ink(Typeface typeface, String text) {
        return ink(typeface, text, 60);
    }

    private static int ink(Typeface typeface, String text, float size) {
        Bitmap bitmap = Bitmap.createBitmap(1400, 120, Bitmap.Config.ARGB_8888);
        new Canvas(bitmap).drawText(text, 10, 90, paint(typeface, size));
        int[] pixels = new int[bitmap.getWidth() * bitmap.getHeight()];
        bitmap.getPixels(pixels, 0, bitmap.getWidth(), 0, 0, bitmap.getWidth(), bitmap.getHeight());
        return (int) Arrays.stream(pixels).filter(pixel -> Color.alpha(pixel) > 128).count();
    }

    @Test public void theWarmUpReadsTheFileOnlyWhileTheSwitchIsInEffect() throws Exception {
        pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        CrashGuard.resetForTests();
        HostScreens.started = true;
        try {
            OwnFont.warm();
            assertNull("Switch off", org.robolectric.util.ReflectionHelpers.getStaticField(OwnFont.class, "picked"));
            Settings.preferences.edit().putBoolean(OwnFont.KEY, true).putBoolean("paused", true).commit();
            OwnFont.warm();
            assertNull("Paused", org.robolectric.util.ReflectionHelpers.getStaticField(OwnFont.class, "picked"));
            Settings.preferences.edit().putBoolean("paused", false).commit();
            // A picked file that crashed the font loader is what safe mode has to keep from loading again.
            org.robolectric.util.ReflectionHelpers.setStaticField(CrashGuard.class, "safeModeActive", true);
            OwnFont.warm();
            assertNull("Safe mode", org.robolectric.util.ReflectionHelpers.getStaticField(OwnFont.class, "picked"));
            org.robolectric.util.ReflectionHelpers.setStaticField(CrashGuard.class, "safeModeActive", false);
            OwnFont.warm();
            assertNotNull("In effect", org.robolectric.util.ReflectionHelpers.getStaticField(OwnFont.class, "picked"));
            assertNotNull(OwnFont.picked());
        } finally {
            CrashGuard.resetForTests();
        }
    }

    @Test public void onlyTheOptimisticFamiliesAreMetasInterfaceFont() {
        for (Family family : Family.values()) {
            assertEquals(family.name(), OPTIMISTIC.contains(family), OwnFont.isOptimistic(family.name()));
            assertEquals(family.name(), family == Family.ROBOTO_LIGHT || family == Family.ROBOTO_LIGHT_ITALIC,
                OwnFont.isRobotoLight(family.name()));
        }
        assertFalse(OwnFont.isOptimistic(null));
        assertFalse(OwnFont.isRobotoLight(null));
    }

    @Test public void optimisticBecomesThePhonesFontAtTheHeavierWeight() {
        Typeface meta = Typeface.create(Typeface.SERIF, 400, false);
        assertSame(Typeface.create(Typeface.DEFAULT, 700, false), OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_BOLD.name(), 700));
        // No weight asked: the repository's own typeface says it.
        assertSame(Typeface.create(Typeface.DEFAULT, 400, false), OwnFont.replace(meta, Family.OPTIMISTIC_DISPLAY_APP.name(), -1));
        // Meta's medium file stays medium when a style asks for less, and keeps its slant.
        Typeface medium = Typeface.create(Typeface.SERIF, 500, true);
        assertSame(Typeface.create(Typeface.DEFAULT, 500, true), OwnFont.replace(medium, Family.OPTIMISTIC_TEXT_APP_MEDIUM.name(), 400));
        assertSame(Typeface.create(Typeface.DEFAULT, 400, false), OwnFont.typeface(0, false));
        assertSame(Typeface.create(Typeface.DEFAULT, 400, true), OwnFont.typeface(1001, true));
    }

    @Test public void robotoMonoAndTheOtherFamiliesStayMessengers() {
        Typeface mono = Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL);
        for (Family family : Family.values()) {
            if (OPTIMISTIC.contains(family)) continue;
            assertSame(family.name(), mono, OwnFont.replace(mono, family.name(), 700));
        }
    }

    @Test public void nothingIsMadeOfNothing() {
        assertNull(OwnFont.replace(null, Family.OPTIMISTIC_TEXT_APP_BOLD.name(), 700));
        assertSame(Typeface.SERIF, OwnFont.replace(Typeface.SERIF, null, 700));
        assertNull(OwnFont.pickedInstead(null));
        assertNull("no file picked, so no typeface stays none", OwnFont.replacePhoneFont(null));
        assertNull(OwnFont.picked());
    }

    @Test public void thePhonesSansSerifIsKnownByNameAndByTypeface() {
        for (String name : new String[] {"sans-serif", "SANS-SERIF-MEDIUM", "sans-serif-black", "roboto", "roboto-regular", "Roboto-Light"})
            assertTrue(name, OwnFont.isPhoneSans(name));
        for (String other : new String[] {null, "", "serif", "monospace", "sans-serif-monospace", "sans-serif-condensed",
                "sans-serif-smallcaps", "roboto-flex", "san-serif-condensed", "sans-serifx", "Optimistic Text"})
            assertFalse(String.valueOf(other), OwnFont.isPhoneSans(other));

        Typeface medium = Typeface.create("sans-serif-medium", Typeface.NORMAL);
        for (Typeface phone : new Typeface[] {null, Typeface.DEFAULT, Typeface.DEFAULT_BOLD, Typeface.SANS_SERIF,
                Typeface.defaultFromStyle(Typeface.BOLD_ITALIC), medium, Typeface.create(medium, Typeface.ITALIC),
                Typeface.create(Typeface.DEFAULT, 600, false), Typeface.create("sans-serif-light", Typeface.NORMAL)})
            assertTrue(String.valueOf(phone), OwnFont.isPhoneTypeface(phone));
        for (Typeface other : new Typeface[] {Typeface.SERIF, Typeface.MONOSPACE, Typeface.create(Typeface.MONOSPACE, Typeface.BOLD),
                Typeface.create("sans-serif-monospace", Typeface.NORMAL)})
            assertFalse(OwnFont.isPhoneTypeface(other));
    }

    @Test public void withNoFilePickedThePhonesFontStays() {
        Typeface regular = Typeface.create("sans-serif", Typeface.NORMAL);
        assertSame(regular, OwnFont.replacePhoneFont(regular));
        assertSame(Typeface.DEFAULT_BOLD, OwnFont.replacePhoneFont(Typeface.DEFAULT_BOLD));
        assertSame(regular, OwnFont.pickedInstead(regular));
        Typeface mono = Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL);
        assertSame(mono, OwnFont.replace(mono, Family.ROBOTO_LIGHT.name(), 300));
    }

    @Test public void optimisticTextIsDrawnInThePickedFont() throws Exception {
        File copy = pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Typeface rubik = new Typeface.Builder(copy).build();
        Typeface meta = Typeface.create(Typeface.SERIF, 400, false);
        assertNotEquals("Rubik measures like the phone's font, so this proves nothing",
            width(Typeface.DEFAULT, LATIN), width(rubik, LATIN), 1f);

        Typeface drawn = OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_REGULAR.name(), 400);
        assertEquals(width(rubik, LATIN), width(drawn, LATIN), 0.01f);
        assertEquals(ink(rubik, LATIN), ink(drawn, LATIN));
        assertSame("built once for the same weight and slant", drawn, OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_REGULAR.name(), 400));

        // Rubik Regular has no bold or italic of its own, so Android draws them.
        Typeface bold = OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_BOLD.name(), 700);
        assertEquals(700, bold.getWeight());
        assertTrue("the bold isn't heavier", ink(bold, LATIN) > ink(drawn, LATIN));
        assertTrue(OwnFont.replace(Typeface.create(Typeface.SERIF, 400, true), Family.OPTIMISTIC_TEXT_APP_REGULAR.name(), 400).isItalic());
        // Messenger's Roboto Light assets are the phone's font in all but name, so they take the file too.
        assertSame(OwnFont.typeface(300, false), OwnFont.replace(Typeface.create(Typeface.SERIF, 300, false), Family.ROBOTO_LIGHT.name(), 300));
        Typeface mono = Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL);
        assertSame(mono, OwnFont.replace(mono, Family.ROBOTO_MONO_REGULAR.name(), 400));
    }

    @Test public void thePhonesSansSerifTakesThePickedFontAtItsWeightAndSlant() throws Exception {
        Typeface regular = Typeface.create("sans-serif", Typeface.NORMAL);
        Typeface boldItalic = Typeface.create(Typeface.DEFAULT, 700, true);
        File copy = pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Typeface rubik = new Typeface.Builder(copy).build();
        Typeface drawn = OwnFont.replacePhoneFont(regular);
        assertEquals(width(rubik, LATIN), width(drawn, LATIN), 0.01f);
        assertEquals(ink(rubik, LATIN), ink(drawn, LATIN));
        Typeface heavy = OwnFont.replacePhoneFont(boldItalic);
        assertEquals(700, heavy.getWeight());
        assertTrue(heavy.isItalic());
        assertSame(OwnFont.typeface(700, true), heavy);
        assertSame("none means Android's default", OwnFont.typeface(400, false), OwnFont.replacePhoneFont(null));
        Typeface medium = Typeface.create("sans-serif-medium", Typeface.NORMAL);
        assertSame(OwnFont.typeface(medium.getWeight(), false), OwnFont.replacePhoneFont(medium));

        for (Typeface other : new Typeface[] {Typeface.SERIF, Typeface.create(Typeface.MONOSPACE, Typeface.BOLD),
                Typeface.create("sans-serif-monospace", Typeface.NORMAL)})
            assertSame("another family stays", other, OwnFont.replacePhoneFont(other));
    }

    /** The file is read once a run, like the switch, so text laid out before and after a change never mixes fonts. */
    @Test public void thePickedFileHoldsUntilARestart() throws Exception {
        pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Typeface picked = OwnFont.typeface(400, false);
        assertNotSame(Typeface.create(Typeface.DEFAULT, 400, false), picked);
        Settings.preferences.edit().putString(OwnFont.NAME_KEY, "").commit();
        assertSame(picked, OwnFont.typeface(400, false));
        OwnFont.forget();
        assertSame(Typeface.create(Typeface.DEFAULT, 400, false), OwnFont.typeface(400, false));
        assertNull(OwnFont.picked());
    }

    /**
     * A variable font is built along its 'wght' axis. Noto Sans Khmer's early axis runs from 26 to 190, so any weight past
     * 190 is its heaviest, and that heaviest is told it's the weight asked for, so Android doesn't embolden it again.
     */
    @Test public void aVariableFontIsBuiltAtTheWeightAsked() throws Exception {
        File copy = pick(FontFileTest.VARIABLE_FONT, "NotoSansKhmer-VF.ttf");
        Typeface light = OwnFont.typeface(100, false);
        Typeface heavy = OwnFont.typeface(900, false);
        assertEquals(900, heavy.getWeight());
        assertTrue("the weight axis wasn't set: " + ink(light, KHMER) + " against " + ink(heavy, KHMER),
            ink(heavy, KHMER) > ink(light, KHMER));
        assertEquals("both are the axis's heaviest", ink(heavy, KHMER), ink(OwnFont.typeface(700, false), KHMER));

        Typeface axisOnly = new Typeface.Builder(copy).setFontVariationSettings("'wght' 190").setWeight(900).build();
        assertEquals(ink(axisOnly, KHMER), ink(heavy, KHMER));
        Typeface emboldened = Typeface.create(new Typeface.Builder(copy).setFontVariationSettings("'wght' 190").build(), 900, false);
        assertTrue("the control: Android emboldens a font it thinks is lighter", ink(emboldened, KHMER) > ink(axisOnly, KHMER));
    }

    /**
     * A copy that stopped loading draws in the phone's font. The broken copy is written where a picked one would be rather
     * than over one: Windows won't write to a file a typeface still maps, which Android does.
     */
    @Test public void aCopyThatWontLoadMeansThePhonesFont() throws Exception {
        Typeface meta = Typeface.create(Typeface.SERIF, 400, false);
        Typeface phone = Typeface.create(Typeface.DEFAULT, 400, false);
        File copy = FontFile.file(RuntimeEnvironment.getApplication());
        byte[] broken = new byte[4096];
        broken[1] = 1;
        Files.write(copy.toPath(), broken);
        assertFalse(OwnFont.loads(copy));
        Settings.preferences.edit().putString(OwnFont.NAME_KEY, "Broken.ttf").commit();
        OwnFont.forget();
        assertSame(phone, OwnFont.replace(meta, Family.OPTIMISTIC_TEXT_APP_REGULAR.name(), 400));
        assertSame(Typeface.create(Typeface.DEFAULT, 700, true),
            OwnFont.replace(Typeface.create(Typeface.SERIF, 400, true), Family.OPTIMISTIC_TEXT_APP_REGULAR.name(), 700));
        assertSame(phone, OwnFont.replacePhoneFont(phone));
        assertNull(OwnFont.picked().base);
    }

    @Test public void aCopyThatsGoneMeansThePhonesFont() {
        Settings.preferences.edit().putString(OwnFont.NAME_KEY, "Missing.ttf").commit();
        OwnFont.forget();
        assertSame(Typeface.create(Typeface.DEFAULT, 500, false),
            OwnFont.replace(Typeface.create(Typeface.SERIF, 500, false), Family.OPTIMISTIC_TEXT_APP_MEDIUM.name(), 400));
        assertSame(Typeface.DEFAULT, OwnFont.replacePhoneFont(Typeface.DEFAULT));
    }

    /** A file that starts like a font and isn't one is turned down by Android's own font code, and the one before stays. */
    @Test public void aBrokenFontIsTurnedDownWhenPicked() throws Exception {
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

    private static final String CJK = "汉字测试中文";

    /** The units per em of the font whose directory is at [start]. */
    private static int unitsPerEm(byte[] font, int start) {
        return ByteBuffer.wrap(font).getShort(FontFileTest.table(font, start, "head") + 18) & 0xFFFF;
    }

    /** The size the font as it comes is drawn at to match its copy sized to [scale] percent and drawn at 60 px. */
    private static float drawnAt(byte[] font, int start, int scale) {
        int upem = unitsPerEm(font, start);
        return 60f * upem / Math.round(upem * 100f / scale);
    }

    private static void choose(int scale, int shift) {
        Settings.preferences.edit().putInt(OwnFont.SCALE_KEY, scale).putInt(OwnFont.SHIFT_KEY, shift).commit();
        OwnFont.forget();
    }

    /** #48: a size draws the picked file as Messenger's text would look that much larger or smaller. */
    @Test public void aSizeDrawsThePickedFileLargerOrSmaller() throws Exception {
        Typeface rubik = new Typeface.Builder(pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf")).build();
        byte[] font = FontFileTest.font(FontFileTest.STATIC_FONT);
        choose(125, 0);
        Typeface larger = OwnFont.typeface(400, false);
        float drawn = drawnAt(font, 0, 125);
        assertTrue("the control: 75 px is visibly larger", ink(rubik, LATIN, drawn) > ink(rubik, LATIN, 60) * 1.4);
        assertEquals(width(rubik, LATIN, drawn), width(larger, LATIN, 60), 0.01f);
        assertEquals(ink(rubik, LATIN, drawn), ink(larger, LATIN, 60));
        assertEquals("a weight Android draws keeps the size", width(OwnFont.typeface(700, false), LATIN, 60),
            width(Typeface.create(rubik, 700, false), LATIN, drawn), 0.01f);

        choose(80, 0);
        Typeface smaller = OwnFont.typeface(400, false);
        assertEquals(width(rubik, LATIN, drawnAt(font, 0, 80)), width(smaller, LATIN, 60), 0.01f);
        assertEquals(ink(rubik, LATIN, drawnAt(font, 0, 80)), ink(smaller, LATIN, 60));
    }

    /** #48: a move lowers the text inside its line. The line keeps its height and the letters don't change. */
    @Test public void aMoveLowersTheTextAndTheLineKeepsItsHeight() throws Exception {
        Typeface rubik = new Typeface.Builder(pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf")).build();
        int upem = unitsPerEm(FontFileTest.font(FontFileTest.STATIC_FONT), 0);
        choose(100, 10);
        Typeface lower = OwnFont.typeface(400, false);
        float moved = Math.round(upem * 10 / 100f) * 60f / upem;
        Paint.FontMetrics plain = paint(rubik).getFontMetrics(), shifted = paint(lower).getFontMetrics();
        assertEquals(plain.ascent - moved, shifted.ascent, 0.01f);
        assertEquals(plain.descent - moved, shifted.descent, 0.01f);
        assertEquals(plain.top - moved, shifted.top, 0.01f);
        assertEquals(plain.bottom - moved, shifted.bottom, 0.01f);
        StaticLayout before = layout(rubik), after = layout(lower);
        assertEquals("the line keeps its height", before.getHeight(), after.getHeight());
        assertEquals(before.getLineBaseline(0) + Math.round(moved), after.getLineBaseline(0));
        assertEquals("the letters don't change", ink(rubik, LATIN), ink(lower, LATIN));
        assertEquals(width(rubik, LATIN), width(lower, LATIN), 0.01f);

        choose(100, -10);
        assertEquals("up is the other way", plain.ascent + moved, paint(OwnFont.typeface(400, false)).getFontMetrics().ascent, 0.01f);
    }

    private static StaticLayout layout(Typeface typeface) {
        return StaticLayout.Builder.obtain(LATIN, 0, LATIN.length(), paint(typeface, 60), 2000).build();
    }

    /** Noto Sans CJK's outlines are CFF, and they scale from the head table's units per em like TrueType's. */
    @Test public void aCollectionsCffFontIsSizedToo() throws Exception {
        Typeface cjk = new Typeface.Builder(pick(FontFileTest.COLLECTION, "NotoSansCJK-Regular.ttc")).build();
        byte[] font = FontFileTest.font(FontFileTest.COLLECTION);
        choose(125, 0);
        Typeface larger = OwnFont.typeface(400, false);
        float drawn = drawnAt(font, ByteBuffer.wrap(font).getInt(12), 125);
        assertTrue("the control: the larger size is visibly larger", ink(cjk, CJK, drawn) > ink(cjk, CJK, 60) * 1.4);
        float sized = width(cjk, CJK, drawn), got = width(larger, CJK, 60);
        StringBuilder logged = new StringBuilder();
        for (ShadowLog.LogItem item : ShadowLog.getLogsForTag("HushMessenger")) logged.append(" | ").append(item.msg);
        assertEquals("sized " + sized + ", as it comes " + width(cjk, CJK, 60) + ", drawn " + got + logged, sized, got, 0.01f);
        assertEquals(ink(cjk, CJK, drawn), ink(larger, CJK, 60));
    }

    /** #48: a sized copy that Android won't load leaves the picked file as it comes, not the phone's font. */
    @Test public void aSizedCopyThatWontLoadIsThePickedFileAsItComes() throws Exception {
        File copy = pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Typeface rubik = new Typeface.Builder(copy).build();
        // A file under the copy's own name and length is taken as finished, so this broken one is what gets loaded.
        byte[] broken = new byte[(int) copy.length()];
        broken[1] = 1;
        File sized = new File(copy.getParentFile(), FontFile.ADJUSTED + "-125-" + FontFile.SHIFT_MOST + "-"
            + Long.toHexString(copy.lastModified()) + "-" + copy.length());
        Files.write(sized.toPath(), broken);
        assertEquals("the control: the broken copy is the one sizing hands back", sized, FontFile.adjusted(copy, 125, 0));
        choose(125, 0);
        Typeface used = OwnFont.typeface(400, false);
        assertEquals(copy, OwnFont.picked().file);
        assertEquals(width(rubik, LATIN, 60), width(used, LATIN, 60), 0.01f);
        assertEquals(ink(rubik, LATIN), ink(used, LATIN));
    }

    /** #48: back at 100% with no move, the sized copies go. */
    @Test public void noSizeOrMoveRemovesTheSizedCopies() throws Exception {
        File copy = pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        File sized = FontFile.adjusted(copy, 125, 4);
        assertNotNull(sized);
        choose(100, 0);
        assertNotNull(OwnFont.typeface(400, false));
        assertEquals(copy, OwnFont.picked().file);
        assertFalse(sized.exists());
    }

    @Test public void aSavedSizeOrMoveOffTheStepsIsTheFontAsItComes() {
        assertEquals(100, OwnFont.scale(Settings.preferences));
        assertEquals(0, OwnFont.shift(Settings.preferences));
        Settings.preferences.edit().putInt(OwnFont.SCALE_KEY, 200).putInt(OwnFont.SHIFT_KEY, -30).commit();
        assertEquals(100, OwnFont.scale(Settings.preferences));
        assertEquals(0, OwnFont.shift(Settings.preferences));
        Settings.preferences.edit().putInt(OwnFont.SCALE_KEY, 70).putInt(OwnFont.SHIFT_KEY, -20).commit();
        assertEquals(70, OwnFont.scale(Settings.preferences));
        assertEquals(-20, OwnFont.shift(Settings.preferences));
    }
}
