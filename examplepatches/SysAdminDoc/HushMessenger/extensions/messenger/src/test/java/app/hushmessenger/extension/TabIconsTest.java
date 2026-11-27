package app.hushmessenger.extension;

import static org.junit.Assert.*;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.file.Files;
import java.util.Map;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowToast;

/** #186: a tab's own picture or outlined icon draws at the picked size, centered in the room Messenger's icon takes. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class TabIconsTest {
    /** The side of Messenger's own icon in these tests, in pixels. */
    private static final int SIDE = 100;

    /** Messenger's own icon: a solid glyph inside its padding, in a box of SIDE. */
    static final class Stock extends Drawable {
        private final Paint paint = new Paint();

        Stock(int color) {
            paint.setColor(color);
        }

        @Override public void draw(Canvas canvas) {
            Rect box = getBounds();
            float inset = box.width() * 0.2f;
            canvas.drawRect(box.left + inset, box.top + inset, box.right - inset, box.bottom - inset, paint);
        }

        @Override public int getIntrinsicWidth() { return SIDE; }
        @Override public int getIntrinsicHeight() { return SIDE; }
        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private Context app;

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        ShadowToast.reset();
        ChoiceFilesTest.clearFiles(app);
    }

    @After public void forget() {
        ChoiceFilesTest.clearFiles(app);
        Settings.preferences.edit().clear().commit();
    }

    private void on() {
        Settings.preferences.edit().putBoolean(TabIcons.KEY, true).commit();
    }

    private void size(String size) {
        Settings.preferences.edit().putString(TabIcons.SIZE, size).commit();
    }

    /** A picture of [width] by [height] that's see-through but for a solid [color] square at [square]. */
    private static Bitmap picture(int width, int height, Rect square, int color) {
        Bitmap made = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Paint paint = new Paint();
        paint.setColor(color);
        new Canvas(made).drawRect(square, paint);
        return made;
    }

    private void save(String tab, Bitmap picture) throws Exception {
        ByteArrayOutputStream png = new ByteArrayOutputStream();
        assertTrue(picture.compress(Bitmap.CompressFormat.PNG, 100, png));
        File file = TabIcons.file(app, tab);
        Files.write(file.toPath(), png.toByteArray());
        TabIcons.forget();
    }

    /** The icon the bar would get for [tab], as the bitmap it draws. */
    private Bitmap icon(String tab) {
        Stock stock = new Stock(Color.rgb(10, 100, 250));
        Drawable made = TabIcons.tabIcon(stock, tab);
        assertNotSame("Hush's icon, not Messenger's", stock, made);
        assertTrue(Settings.hookErrors.toString(), Settings.hookErrors.isEmpty());
        Bitmap drawn = ((BitmapDrawable) made).getBitmap();
        assertEquals("as wide as Messenger's own", SIDE, drawn.getWidth());
        assertEquals("as tall as Messenger's own", SIDE, drawn.getHeight());
        return drawn;
    }

    /** Where [bitmap] has a pixel at least half opaque. Its own count, so the code under test doesn't measure itself. */
    private static Rect extent(Bitmap bitmap) {
        int left = Integer.MAX_VALUE, top = Integer.MAX_VALUE, right = -1, bottom = -1;
        for (int y = 0; y < bitmap.getHeight(); y++) {
            for (int x = 0; x < bitmap.getWidth(); x++) {
                if (Color.alpha(bitmap.getPixel(x, y)) < 0x80) continue;
                left = Math.min(left, x);
                top = Math.min(top, y);
                right = Math.max(right, x + 1);
                bottom = Math.max(bottom, y + 1);
            }
        }
        assertTrue("draws something", right > 0);
        return new Rect(left, top, right, bottom);
    }

    private static int expected(String size) {
        return Math.round(SIDE * Integer.parseInt(size) / 100f);
    }

    private static void assertNear(String what, int expected, int actual, int slack) {
        assertTrue(what + ": expected " + expected + " but was " + actual, Math.abs(expected - actual) <= slack);
    }

    private static void assertCentered(String what, Rect drawn) {
        assertNear(what + " across", SIDE, drawn.left + drawn.right, 2);
        assertNear(what + " down", SIDE, drawn.top + drawn.bottom, 2);
    }

    @Test public void theSizeDefaultsToSixtyPercent() {
        assertEquals("60", TabIcons.picked());
        assertEquals(TabIcons.STANDARD, TabIcons.picked());
        size("80");
        assertEquals("80", TabIcons.picked());
        size("55");
        assertEquals("a size this build doesn't offer", "60", TabIcons.picked());
        assertEquals(0.7f, TabIcons.scale("70"), 0f);
        assertEquals("the largest is Messenger's whole room", "100", TabIcons.SIZES[0]);
    }

    @Test public void aFullPictureDrawsAtEachSizeCenteredInMessengersRoom() throws Exception {
        on();
        save("calls", picture(SIDE, SIDE, new Rect(0, 0, SIDE, SIDE), Color.RED));
        Rect standard = extent(icon("calls"));
        assertNear("60% until one is picked, about as big as Messenger's own glyph", expected("60"), standard.width(), 1);
        assertNear("square", expected("60"), standard.height(), 1);
        assertCentered("standard", standard);
        for (String size : TabIcons.SIZES) {
            size(size);
            Rect drawn = extent(icon("calls"));
            assertNear(size + " wide", expected(size), drawn.width(), 1);
            assertNear(size + " tall", expected(size), drawn.height(), 1);
            assertCentered(size, drawn);
        }
    }

    @Test public void aPictureIsSizedByWhatItDrawsNotTheRoomAroundIt() throws Exception {
        on();
        // A small square off in one corner of a see-through picture comes out the same as a picture that's all square.
        save("inbox", picture(SIDE, SIDE, new Rect(6, 10, 46, 50), Color.GREEN));
        Rect drawn = extent(icon("inbox"));
        assertNear("wide", expected(TabIcons.STANDARD), drawn.width(), 1);
        assertNear("tall", expected(TabIcons.STANDARD), drawn.height(), 1);
        assertCentered("moved to the middle", drawn);
        // A wide one fits by its width and keeps its shape.
        save("people", picture(120, 60, new Rect(0, 0, 120, 60), Color.BLUE));
        size("100");
        Rect wide = extent(icon("people"));
        assertNear("fills the room across", SIDE, wide.width(), 1);
        assertNear("half as tall", SIDE / 2, wide.height(), 1);
        assertCentered("wide", wide);
    }

    @Test public void theOutlinedIconsTakeTheSizeToo() {
        on();
        for (String tab : new String[] {"inbox", "people", "more"}) {
            for (String size : TabIcons.SIZES) {
                size(size);
                Rect drawn = extent(icon(tab));
                assertNear(tab + " at " + size, expected(size), Math.max(drawn.width(), drawn.height()), 2);
                assertCentered(tab + " at " + size, drawn);
            }
        }
    }

    @Test public void offMessengersOwnIconStays() {
        Stock stock = new Stock(Color.BLACK);
        assertSame(stock, TabIcons.tabIcon(stock, "inbox"));
    }

    @Test public void theRestartRowCountsANewSize() {
        assertEquals("off, nothing waits", "", TabIcons.inUse(app));
        on();
        String before = TabIcons.inUse(app);
        assertTrue(before, before.contains(TabIcons.SIZE + "=60\n"));
        size("90");
        assertNotEquals(before, TabIcons.inUse(app));
    }

    @Test public void theSizesSitUnderTheTabsAndATapSavesOne() {
        on();
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = page.get().getWindow().getDecorView();
            RadioGroup group = root.findViewWithTag("tab_icons_size_choices");
            assertNotNull(group);
            View list = root.findViewWithTag("tab_icons_list");
            assertSame("inside the switch's block, with the tabs", list.getParent(), group.getParent());
            assertEquals(TabIcons.SIZES.length, group.getChildCount());
            RadioButton standard = root.findViewWithTag(TabIcons.SIZE + "_60");
            assertTrue("60% shows until one is picked", standard.isChecked());
            View restart = root.findViewWithTag("restart_row");
            assertEquals("nothing waits yet", View.GONE, restart.getVisibility());
            RadioButton bigger = root.findViewWithTag(TabIcons.SIZE + "_80");
            assertEquals("80%", bigger.getText().toString());
            bigger.performClick();
            assertEquals("80", Settings.preferences.getString(TabIcons.SIZE, null));
            assertTrue(bigger.isChecked());
            assertFalse(standard.isChecked());
            assertEquals("Tab icons at 80% once Messenger restarts", ShadowToast.getTextOfLatestToast());
            assertEquals("the bar is built as Messenger opens", View.VISIBLE, restart.getVisibility());
        }
    }

    @Test public void aBackupCarriesTheSizeOnlyWithTheSwitch() {
        Settings.preferences.edit().putBoolean(TabIcons.KEY, true).putString(TabIcons.SIZE, "70").commit();
        String backup = ChoiceCodec.encode(Settings.preferences, Set.of(TabIcons.KEY));
        assertEquals(Map.of("paused", false, TabIcons.KEY, true, TabIcons.SIZE, "70"), ChoiceCodec.parse(backup));
        assertFalse(ChoiceCodec.encode(Settings.preferences, Set.of("stories")).contains(TabIcons.SIZE));
    }
}
