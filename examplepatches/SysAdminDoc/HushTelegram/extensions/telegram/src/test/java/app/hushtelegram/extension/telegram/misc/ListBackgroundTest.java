/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RuntimeShader;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.util.ReflectionHelpers;

/**
 * The picture behind the lists (#88): which colors getColor hands out marked, that every way of
 * turning it off hands Telegram's own colors back, and that the keyer lays the picture under the
 * marked page colors and nothing else.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ListBackgroundTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stand-in ids for windowBackgroundWhite, windowBackgroundGray and graySection, then a key that stays. */
    private static final int WHITE = 1, GRAY = 2, SECTION = 3, ACTION_BAR = 4;
    private static final int DAY_WHITE = 0xFFFFFFFF, DAY_GRAY = 0xFFF0F0F0, DAY_SECTION = 0xFFF2F3F5, DAY_BAR = 0xFF527DA3;

    private Context context;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        HookStatus.clear();
        ListBackground.ids = new int[]{WHITE, GRAY, SECTION};
    }

    @After public void tearDown() {
        PauseForTests.resume();
        Settings.LIST_BACKGROUND.resetToDefault();
        Settings.LIST_BACKGROUND_DIM.resetToDefault();
        ListBackgroundForTests.forget(context);
        HookStatus.clear();
    }

    private void on() {
        Settings.LIST_BACKGROUND.save(true);
        ListBackgroundForTests.keepPicture(context);
    }

    /** Whether getColor's answers for the day theme come back marked, all three pages alike. */
    private static boolean marked() {
        boolean white = ListBackground.mark(WHITE, DAY_WHITE) != DAY_WHITE;
        assertEquals(white, ListBackground.mark(GRAY, DAY_GRAY) != DAY_GRAY);
        assertEquals(white, ListBackground.mark(SECTION, DAY_SECTION) != DAY_SECTION);
        assertEquals("only the pages", DAY_BAR, ListBackground.mark(ACTION_BAR, DAY_BAR));
        return white;
    }

    @Test public void offByDefaultOrWithoutAPictureEveryColorStaysTelegrams() {
        assertFalse(Settings.LIST_BACKGROUND.get());
        assertEquals(40, (int) Settings.LIST_BACKGROUND_DIM.get());
        ListBackground.refreshing();
        assertFalse(marked());

        // The switch on with no picture saved yet changes nothing either.
        Settings.LIST_BACKGROUND.save(true);
        ListBackground.refreshing();
        assertFalse(marked());
        // And a picture with the switch off.
        Settings.LIST_BACKGROUND.save(false);
        ListBackgroundForTests.keepPicture(context);
        ListBackground.refreshing();
        assertFalse(marked());
        assertFalse(String.join("\n", HookStatus.report()).contains("marked"));
    }

    @Test public void onWithAPictureOnlyThePageColorsComeBackMarked() {
        on();
        ListBackground.refreshing();
        // Three steps toward the middle: blue for the rows, red for the gray, green for sections.
        assertEquals(0xFFFFFFFC, ListBackground.mark(WHITE, DAY_WHITE));
        assertEquals(0xFFEDF0F0, ListBackground.mark(GRAY, DAY_GRAY));
        assertEquals(0xFFF2F0F5, ListBackground.mark(SECTION, DAY_SECTION));
        assertEquals(DAY_BAR, ListBackground.mark(ACTION_BAR, DAY_BAR));
        // What the keyer looks for is what getColor handed out.
        assertEquals(0xFFFFFFFC, ListBackground.marked(0));
        assertEquals(0xFFEDF0F0, ListBackground.marked(1));
        assertEquals(0xFFF2F0F5, ListBackground.marked(2));
        // Asked again, the same answer, and a new theme's page color is taken on.
        assertEquals(0xFFFFFFFC, ListBackground.mark(WHITE, DAY_WHITE));
        assertEquals(0xFF1F1F21, ListBackground.mark(WHITE, 0xFF1F1F1E));
        assertEquals(0xFF1F1F21, ListBackground.marked(0));
        assertTrue(String.join("\n", HookStatus.report()).contains("page colors marked for the picture"));
    }

    /**
     * Three steps in one channel, never the alpha and never clipped, each page its own channel. A step
     * of rounding either way on two of them, or on one and the color unmarked, never meets.
     */
    @Test public void theMarkersAreThreeStepsOffAndStayApartThroughRounding() {
        assertEquals(ListBackground.PAGES.length, ListBackground.CHANNELS.length);
        assertEquals(ListBackground.PAGES.length, ListBackground.KEEP.length);
        assertEquals(3, ListBackground.STEP);
        for (int color : new int[]{DAY_WHITE, DAY_GRAY, 0xFF000000, 0xFF1F1F1E, 0x80123456, 0xFF7F8081}) {
            int[] seen = new int[ListBackground.PAGES.length + 1];
            seen[ListBackground.PAGES.length] = color;
            for (int page = 0; page < ListBackground.PAGES.length; page++) {
                int marked = ListBackground.moved(color, page);
                seen[page] = marked;
                assertEquals(color >>> 24, marked >>> 24);
                for (int shift = 0; shift < 24; shift += 8) {
                    int apart = Math.abs(((color >> shift) & 0xFF) - ((marked >> shift) & 0xFF));
                    assertEquals(shift == ListBackground.CHANNELS[page] ? 3 : 0, apart);
                }
            }
            for (int i = 0; i < seen.length; i++) {
                for (int j = i + 1; j < seen.length; j++) {
                    int widest = 0;
                    for (int shift = 0; shift < 24; shift += 8) {
                        widest = Math.max(widest, Math.abs(((seen[i] >> shift) & 0xFF) - ((seen[j] >> shift) & 0xFF)));
                    }
                    assertTrue(String.format("%08X and %08X", seen[i], seen[j]), widest >= 3);
                }
            }
        }
    }

    @Test public void theSwitchThePictureAndAPauseEachTakeTheMarkersOff() {
        on();
        ListBackground.refreshing();
        assertTrue(marked());
        Settings.LIST_BACKGROUND.save(false);
        ListBackground.refreshing();
        assertFalse(marked());

        Settings.LIST_BACKGROUND.save(true);
        ListBackground.refreshing();
        assertTrue(marked());
        SavedPicture.remove(context, SavedPicture.LIST_BACKGROUND);
        ListBackground.refreshing();
        assertFalse(marked());

        ListBackgroundForTests.keepPicture(context);
        ListBackground.refreshing();
        assertTrue(marked());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        ListBackground.refreshing();
        assertFalse(marked());
    }

    /** The settings page's change marks or unmarks at once, without waiting for Telegram to refresh. */
    @Test public void aChangeOnTheSettingsPageTakesAtOnce() {
        on();
        ListBackground.changed();
        assertTrue(marked());
        Settings.LIST_BACKGROUND.save(false);
        ListBackground.changed();
        assertFalse(marked());
    }

    @Test public void aPageKeyTelegramDoesNotKnowIsNeverMarked() {
        on();
        ListBackground.ids = new int[]{WHITE, -1, SECTION};
        ListBackground.refreshing();
        assertEquals(0xFFFFFFFC, ListBackground.mark(WHITE, DAY_WHITE));
        assertEquals(DAY_GRAY, ListBackground.mark(GRAY, DAY_GRAY));
        assertFalse(String.join("\n", HookStatus.report()).contains("threw"));
    }

    /** Unpatched there are no key ids at all: each one is reported and nothing Telegram asks about is marked. */
    @Test public void withoutTelegramsKeyIdsTheMissIsReported() {
        on();
        ListBackground.ids = null;
        ListBackground.refreshing();
        assertFalse(marked());
        assertTrue(String.join("\n", HookStatus.report()).contains("windowBackgroundWhite"));
    }

    @Test public void theDimRowOffersAFewStepsAndABackupTakesOnlyThose() {
        assertArrayEquals(new int[]{20, 40, 60, 80}, ListBackground.DIM_STEPS);
        assertTrue(ListBackground.dimOffered(40));
        assertTrue(ListBackground.dimOffered(80));
        assertFalse(ListBackground.dimOffered(0));
        assertFalse(ListBackground.dimOffered(50));
        assertFalse(ListBackground.dimOffered(90));
    }

    /** Android 11 has no runtime shaders, so a holder never gets an effect even with the markers on. */
    @Test public void belowAndroid13NoHolderGetsTheKeyer() throws Exception {
        on();
        ListBackground.refreshing();
        assertFalse(ListBackground.supported());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            FrameLayout holder = new FrameLayout(controller.get());
            controller.get().setContentView(holder);
            holder.layout(0, 0, 120, 200);
            assertTrue(ListBackground.onScreen(holder));
            ListBackground.dress(holder);
            settle();
            ListBackground.dress(holder);
            assertFalse(ListBackground.dressed(holder));
        }
    }

    /**
     * On Android 13 a holder in the main window gets the keyer once the picture is decoded at its
     * size, a holder in no window doesn't, and turning it off takes the keyer away again.
     */
    @Test @Config(sdk = 33, shadows = RuntimeShaderEffectShadow.class) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void onAndroid13TheMainWindowsHoldersGetTheKeyerAndLoseItAgain() throws Exception {
        Uri gallery = Uri.parse("content://media.test/picture/88");
        shadowOf(context.getContentResolver()).registerInputStream(gallery, new ByteArrayInputStream(png(60, 100)));
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, gallery, SavedPicture.LIST_BACKGROUND));
        Settings.LIST_BACKGROUND.save(true);
        ListBackground.changed();
        assertTrue(marked());
        assertTrue(ListBackground.supported());

        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            FrameLayout holder = new FrameLayout(controller.get());
            controller.get().setContentView(holder);
            holder.layout(0, 0, 120, 200);
            FrameLayout elsewhere = new FrameLayout(context);
            elsewhere.layout(0, 0, 120, 200);
            assertTrue(ListBackground.onScreen(holder));
            assertFalse(ListBackground.onScreen(elsewhere));

            ListBackground.dress(holder);
            ListBackground.dress(elsewhere);
            assertFalse("nothing until the picture is decoded", ListBackground.dressed(holder));
            settle();
            ListBackground.dress(holder);
            ListBackground.dress(elsewhere);
            assertTrue(ListBackground.dressed(holder));
            assertFalse("a sheet's or dialog's holder stays as it is", ListBackground.dressed(elsewhere));
            assertTrue(String.join("\n", HookStatus.report()).contains("list holders showing the picture 1"));

            // A bar fade in a page color, or a blend of two, draws nothing inside the holder only.
            int white = ListBackground.marked(0), gray = ListBackground.marked(1);
            int between = Color.rgb((Color.red(white) + Color.red(gray)) / 2, (Color.green(white) + Color.green(gray)) / 2,
                    (Color.blue(white) + Color.blue(gray)) / 2);
            View bar = new View(controller.get());
            holder.addView(bar);
            ColorDrawable fade = new ColorDrawable(0);
            bar.setBackground(fade);
            assertEquals(white & 0x00FFFFFF, ListBackground.fade(fade, white));
            assertEquals(between & 0x00FFFFFF, ListBackground.fade(fade, between));
            assertEquals("a step of rounding", (gray + 1) & 0x00FFFFFF, ListBackground.fade(fade, gray + 1));
            assertEquals("not a page color", DAY_BAR, ListBackground.fade(fade, DAY_BAR));
            assertEquals("the color unmarked", DAY_WHITE, ListBackground.fade(fade, DAY_WHITE));
            assertTrue(String.join("\n", HookStatus.report()).contains("bar fades left out over the picture 1"));
            View sheet = new View(controller.get());
            elsewhere.addView(sheet);
            ColorDrawable sheetFade = new ColorDrawable(0);
            sheet.setBackground(sheetFade);
            assertEquals("outside the holder", white, ListBackground.fade(sheetFade, white));
            assertEquals("drawn by no view", white, ListBackground.fade(new ColorDrawable(0), white));
            assertEquals("not a drawable", white, ListBackground.fade(new Object(), white));

            Settings.LIST_BACKGROUND.save(false);
            ListBackground.changed();
            assertFalse(marked());
            assertEquals("off", white, ListBackground.fade(fade, white));
            ListBackground.dress(holder);
            assertFalse(ListBackground.dressed(holder));
        }
    }

    /**
     * The keyer itself, run by Skia: a page drawn in its marked color shows the picture under the
     * page color at the dim, then that page's own color at what it keeps. The same color unmarked,
     * text in another color and a lone marked pixel come through exactly as drawn.
     */
    @Test @Config(sdk = 33) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theKeyerLaysThePictureUnderOnlyTheMarkedPages() {
        on();
        ListBackground.refreshing();
        int white = ListBackground.mark(WHITE, DAY_WHITE);
        int gray = ListBackground.mark(GRAY, DAY_GRAY);
        int section = ListBackground.mark(SECTION, DAY_SECTION);

        int width = 12, height = 6;
        Bitmap drawn = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        drawn.eraseColor(Color.BLACK);
        for (int y = 0; y < 4; y++) {
            for (int x = 0; x < 4; x++) drawn.setPixel(x, y, white);
            for (int x = 4; x < 8; x++) drawn.setPixel(x, y, y < 2 ? gray : section);
            for (int x = 8; x < 12; x++) drawn.setPixel(x, y, DAY_WHITE);
        }
        // Below a row of plain white, with text all around it.
        drawn.setPixel(9, 4, white);
        int blue = 0xFF0000FF;
        Bitmap picture = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        picture.eraseColor(blue);

        RuntimeShader keyer = ListBackground.keyer(picture, width, height, 40);
        BitmapShader content = new BitmapShader(drawn, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        content.setFilterMode(BitmapShader.FILTER_MODE_NEAREST);
        keyer.setInputShader("content", content);
        Bitmap shown = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Paint paint = new Paint();
        paint.setShader(keyer);
        canvasRunningShaders(shown).drawRect(0, 0, width, height, paint);

        assertNear(composite(blue, white, white, 40, 0x66), shown.getPixel(1, 1));
        assertNear(composite(blue, white, gray, 40, 0x26), shown.getPixel(5, 0));
        assertNear(composite(blue, white, section, 40, 0x80), shown.getPixel(6, 3));
        assertNotEquals("the picture shows through", white, shown.getPixel(1, 1));
        assertEquals("the same color unmarked, as a sheet draws it", DAY_WHITE, shown.getPixel(9, 1));
        assertEquals("text", Color.BLACK, shown.getPixel(1, 5));
        assertEquals("a lone marked pixel", white, shown.getPixel(9, 4));

        // A glass bar's fade of a page color over itself leaves rows a step off in one channel or another.
        Bitmap faded = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        faded.eraseColor(Color.BLACK);
        int[] whiteRows = {white, white - 0x10000, white + 1, white - 0x100, white - 1, white};
        int[] grayRows = {gray, gray + 0x100, gray - 1, gray + 0x10000, gray, gray};
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < 4; x++) faded.setPixel(x, y, whiteRows[y]);
            for (int x = 4; x < 8; x++) faded.setPixel(x, y, grayRows[y]);
            // Two steps off is something else drawn there.
            for (int x = 8; x < 12; x++) faded.setPixel(x, y, white - 2);
        }
        BitmapShader fadedContent = new BitmapShader(faded, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        fadedContent.setFilterMode(BitmapShader.FILTER_MODE_NEAREST);
        keyer.setInputShader("content", fadedContent);
        paint.setShader(keyer);
        canvasRunningShaders(shown).drawRect(0, 0, width, height, paint);
        for (int y = 0; y < height; y++) {
            assertNear("white row " + y, composite(blue, white, whiteRows[y], 40, 0x66), shown.getPixel(1, y));
            assertNear("gray row " + y, composite(blue, white, grayRows[y], 40, 0x26), shown.getPixel(5, y));
            assertEquals("two steps off, row " + y, white - 2, shown.getPixel(9, y));
        }

        // A deeper dim lays more of the page color over the picture.
        RuntimeShader deeper = ListBackground.keyer(picture, width, height, 80);
        deeper.setInputShader("content", content);
        paint.setShader(deeper);
        canvasRunningShaders(shown).drawRect(0, 0, width, height, paint);
        assertNear(composite(blue, white, white, 80, 0x66), shown.getPixel(1, 1));
    }

    /**
     * A canvas on [bitmap] that runs a RuntimeShader on Skia's CPU. Android's own software canvas
     * turns one down, since on the phone only the hardware canvas a holder draws with gets it.
     */
    private static Canvas canvasRunningShaders(Bitmap bitmap) {
        Canvas canvas = new Canvas(bitmap);
        ReflectionHelpers.callInstanceMethod(canvas, "setHwFeaturesInSwModeEnabled",
                ReflectionHelpers.ClassParameter.from(boolean.class, true));
        return canvas;
    }

    /** The picture under [page] at [dim] percent, then [marked] over that keeping [keep] out of 255. */
    private static int composite(int picture, int page, int marked, int dim, int keep) {
        double d = dim / 100.0, k = keep / 255.0;
        int result = 0xFF000000;
        for (int shift = 0; shift < 24; shift += 8) {
            double under = ((picture >> shift) & 0xFF) * (1 - d) + ((page >> shift) & 0xFF) * d;
            long channel = Math.round(under * (1 - k) + ((marked >> shift) & 0xFF) * k);
            result |= (int) channel << shift;
        }
        return result;
    }

    private static void assertNear(int expected, int actual) {
        assertNear("", expected, actual);
    }

    private static void assertNear(String what, int expected, int actual) {
        for (int shift = 0; shift < 32; shift += 8) {
            int want = (expected >> shift) & 0xFF, got = (actual >> shift) & 0xFF;
            assertTrue(String.format("%s expected %08X, got %08X", what, expected, actual), Math.abs(want - got) <= 2);
        }
    }

    /** A PNG [width] by [height], red over blue. */
    private static byte[] png(int width, int height) {
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Paint paint = new Paint();
        paint.setColor(Color.RED);
        canvas.drawRect(0, 0, width, height / 2f, paint);
        paint.setColor(Color.BLUE);
        canvas.drawRect(0, height / 2f, width, height, paint);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
        return out.toByteArray();
    }

    private static void settle() throws Exception {
        for (int i = 0; i < 3; i++) {
            Utils.awaitBackgroundTasksForTests();
            shadowOf(Looper.getMainLooper()).idle();
        }
    }
}
