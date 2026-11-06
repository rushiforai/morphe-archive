package app.hushmessenger.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Looper;
import android.widget.EditText;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.Duration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** Your own home header (#129): words or a picture in place of the chat list's wordmark, and the wordmark when there's neither. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class HomeHeaderTest {
    private Context context;

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        HomeHeader.file(context).delete();
        HomeHeader.forget();
    }

    @After public void forget() {
        HomeHeader.file(context).delete();
        new File(context.getFilesDir(), HomeHeaderPicture.PARTIAL).delete();
        HomeHeader.forget();
    }

    private static GradientDrawable wordmark(int... colors) {
        GradientDrawable mark = colors.length == 1 ? new GradientDrawable() : new GradientDrawable(GradientDrawable.Orientation.LEFT_RIGHT, colors);
        if (colors.length == 1) mark.setColor(colors[0]);
        mark.setSize(300, 60);
        return mark;
    }

    private static void words(String typed) {
        Settings.preferences.edit().putBoolean(HomeHeader.KEY, true).putString(HomeHeader.TEXT, typed).commit();
    }

    private static byte[] png(int width, int height, int color) {
        Bitmap picture = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        picture.eraseColor(color);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        assertTrue(picture.compress(Bitmap.CompressFormat.PNG, 100, bytes));
        return bytes.toByteArray();
    }

    @Test public void theWordsAreOneTrimmedLineOfAtMostThirtyCharacters() {
        assertEquals("", HomeHeader.clean(null));
        assertEquals("", HomeHeader.clean(" \n\t "));
        assertEquals("my chats", HomeHeader.clean("  my \n\n chats\t "));
        String invisible = "a" + (char) 0x200B + "b" + (char) 0x0007 + "c";
        assertEquals("abc", HomeHeader.clean(invisible));
        String face = new String(Character.toChars(0x1F600));
        assertEquals("hi " + face, HomeHeader.clean("hi " + face));
        assertEquals("x".repeat(30), HomeHeader.clean("x".repeat(40)));
        // A space at the limit would end the words on it, so the word after it goes too.
        assertEquals("x".repeat(29), HomeHeader.clean("x".repeat(29) + " yz"));
    }

    @Test public void typedWordsAreSavedOnceTypingPausesOrThePageCloses() {
        int[] saves = {0};
        android.content.SharedPreferences.OnSharedPreferenceChangeListener counter = (preferences, key) -> {
            if (HomeHeader.TEXT.equals(key)) saves[0]++;
        };
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            EditText field = screen.get().getWindow().getDecorView().findViewWithTag("home_header_text");
            Settings.preferences.registerOnSharedPreferenceChangeListener(counter);
            for (String typed : new String[] {"m", "my", "my c", "my chats"}) field.setText(typed);
            assertEquals("nothing is saved mid-word", "", Settings.preferences.getString(HomeHeader.TEXT, ""));

            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(HomeHeaderRow.SAVE_DELAY_MILLIS));
            assertEquals("my chats", Settings.preferences.getString(HomeHeader.TEXT, ""));
            assertEquals(1, saves[0]);

            field.setText("my chats!");
            screen.pause().stop();
            assertEquals("leaving the page doesn't wait for the pause", "my chats!", Settings.preferences.getString(HomeHeader.TEXT, ""));
            assertEquals(2, saves[0]);
        } finally {
            Settings.preferences.unregisterOnSharedPreferenceChangeListener(counter);
        }
    }

    @Test public void aPageMadeAgainShowsTheSavedWordsNotItsOldOnes() {
        Settings.preferences.edit().putString(HomeHeader.TEXT, "old").commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            // Another settings page changes the words, then this one is made again, as after a rotation.
            Settings.preferences.edit().putString(HomeHeader.TEXT, "new").commit();
            screen.recreate();
            EditText field = screen.get().getWindow().getDecorView().findViewWithTag("home_header_text");
            assertEquals("new", field.getText().toString());
            screen.pause().stop();
            assertEquals("new", Settings.preferences.getString(HomeHeader.TEXT, ""));
        }
    }

    @Test public void aPageLeftUntouchedDoesntPutItsOldWordsBack() {
        Settings.preferences.edit().putString(HomeHeader.TEXT, "old").commit();
        try (var behind = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            behind.pause().stop();
            // Another settings page changes the words while this one waits behind it.
            Settings.preferences.edit().putString(HomeHeader.TEXT, "new").commit();
            behind.restart().start().resume();
            behind.pause().stop();
            assertEquals("new", Settings.preferences.getString(HomeHeader.TEXT, ""));
        }
    }

    @Test public void offPausedOrBlankKeepsTheWordmark() {
        Drawable mark = wordmark(Color.BLUE);
        assertNull(HomeHeader.dress(null));
        Settings.preferences.edit().putString(HomeHeader.TEXT, "Chats").commit();
        assertSame("Off", mark, HomeHeader.dress(mark));
        words("   ");
        assertSame("Blank", mark, HomeHeader.dress(mark));
        words("Chats");
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertSame("Paused", mark, HomeHeader.dress(mark));
        assertEquals("", HomeHeader.inUse(context));
        assertEquals(0, Settings.lastActive(HomeHeader.KEY));
    }

    @Test public void theWordsTakeTheWordmarksPlaceAndStayTheSameMarkUntilTheyChange() {
        Drawable mark = wordmark(Color.BLUE);
        words(" Chats ");
        Drawable shown = HomeHeader.dress(mark);
        assertTrue(shown instanceof HomeHeader.TextMark);
        assertEquals("Chats", ((HomeHeader.TextMark) shown).text);
        assertEquals(60, shown.getIntrinsicHeight());
        assertTrue(Settings.lastActive(HomeHeader.KEY) > 0);
        assertEquals("text\nChats", HomeHeader.inUse(context));
        // A render hands back the same drawable every time, so the header doesn't redraw for nothing.
        assertSame(shown, HomeHeader.dress(mark));
        words("Inbox");
        Drawable changed = HomeHeader.dress(mark);
        assertNotSame(shown, changed);
        assertEquals("Inbox", ((HomeHeader.TextMark) changed).text);
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void wordsTakeTheWordmarksColorOrItsGradient() {
        int[] solid = HomeHeader.look(wordmark(Color.rgb(8, 102, 255))).colors;
        assertEquals(1, solid.length);
        assertFalse(HomeHeader.apart(Color.rgb(8, 102, 255), solid[0]));

        int[] gradient = HomeHeader.look(wordmark(Color.RED, Color.BLUE)).colors;
        assertEquals(3, gradient.length);
        assertTrue(Color.red(gradient[0]) > Color.blue(gradient[0]));
        assertTrue(Color.blue(gradient[2]) > Color.red(gradient[2]));

        assertNull("a size but nothing drawn yet is a wordmark still loading", HomeHeader.look(wordmark(Color.TRANSPARENT)));
        assertArrayEquals(new int[] {HomeHeader.MESSENGER_BLUE}, HomeHeader.look(new GradientDrawable()).colors);
    }

    /** Messenger's wordmark as 586 hands it over: fetched after it's asked for, blank until then, with no state to copy. */
    private static final class Loading extends Drawable {
        private final android.graphics.Paint paint = new android.graphics.Paint();
        private boolean loaded;

        /** Its picture arrived, which Messenger's tells its callback the same way. */
        void load() {
            loaded = true;
            invalidateSelf();
        }

        @Override public void draw(Canvas canvas) {
            if (!loaded) return;
            // Letters in rows 6 to 18 of 60, well away from where a guess puts them.
            Rect at = getBounds();
            float tall = at.height() / 60f;
            paint.setColor(Color.rgb(8, 102, 255));
            canvas.drawRect(at.left, at.top + 6 * tall, at.right, at.top + 18 * tall, paint);
        }
        @Override public int getIntrinsicWidth() { return 300; }
        @Override public int getIntrinsicHeight() { return 60; }
        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public android.graphics.ColorFilter getColorFilter() { return paint.getColorFilter(); }
        @Override public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
    }

    /** [shown] drawn [width] by [height]: its first and last rows of solid ink, -1 when there's none, and the first ink's color. */
    private static int[] ink(Drawable shown, int width, int height) {
        Bitmap drawn = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        shown.setBounds(0, 0, width, height);
        shown.draw(new Canvas(drawn));
        int top = -1, bottom = -1, color = 0;
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                int pixel = drawn.getPixel(x, y);
                if (Color.alpha(pixel) < 160) continue;
                if (top < 0) {
                    top = y;
                    color = pixel;
                }
                bottom = y;
                break;
            }
        }
        drawn.recycle();
        return new int[] {top, bottom, color};
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void wordsWaitForAWordmarkStillLoadingAndTakeItsLettersOnceItArrives() {
        words("Chats");
        // Dark mode tints the wordmark white, so the words show white right away, where Messenger's letters usually sit.
        Loading dark = new Loading();
        dark.setColorFilter(new android.graphics.PorterDuffColorFilter(Color.WHITE, android.graphics.PorterDuff.Mode.SRC_IN));
        HomeHeader.TextMark shown = (HomeHeader.TextMark) HomeHeader.dress(dark);
        assertTrue(shown.waiting());
        int[] redraws = {0};
        Drawable.Callback host = new Drawable.Callback() {
            @Override public void invalidateDrawable(Drawable who) { redraws[0]++; }
            @Override public void scheduleDrawable(Drawable who, Runnable what, long when) { }
            @Override public void unscheduleDrawable(Drawable who, Runnable what) { }
        };
        shown.setCallback(host);
        int width = shown.getIntrinsicWidth() * 2;
        int[] before = ink(shown, width, 120);
        assertFalse("white, from the tint", HomeHeader.apart(Color.WHITE, before[2]));
        // The guess, rows 45 to 91 of 120.
        assertTrue("top " + before[0], before[0] >= 39 && before[0] <= 51);
        assertTrue("bottom " + before[1], before[1] >= 85 && before[1] <= 97);

        dark.load();
        assertEquals("the wordmark's news reaches the header", 1, redraws[0]);
        int[] after = ink(shown, width, 120);
        assertFalse(shown.waiting());
        assertEquals("the header measured it already", width / 2, shown.getIntrinsicWidth());
        // Its letters, rows 6 to 18 of 60, come out as rows 12 to 36 of 120, give or take the small sample's rows.
        assertTrue("top " + after[0], after[0] >= 8 && after[0] <= 16);
        assertTrue("bottom " + after[1], after[1] >= 31 && after[1] <= 39);
        assertFalse(HomeHeader.apart(Color.WHITE, after[2]));
        assertSame(host, shown.getCallback());

        // No tint, as in light mode: nothing shows until it loads, the way Messenger shows nothing, then its blue.
        Loading light = new Loading();
        HomeHeader.TextMark plain = (HomeHeader.TextMark) HomeHeader.dress(light);
        int wide = plain.getIntrinsicWidth() * 2;
        assertEquals(-1, ink(plain, wide, 120)[0]);
        light.load();
        int[] loaded = ink(plain, wide, 120);
        assertTrue("top " + loaded[0], loaded[0] >= 8 && loaded[0] <= 16);
        assertFalse(HomeHeader.apart(Color.rgb(8, 102, 255), loaded[2]));
    }

    /** Messenger's own wordmark: 60 tall with its letters in rows 24 to 44, tinted white in dark mode by a color filter. */
    private static Drawable paddedWordmark() {
        Drawable mark = new Drawable() {
            private final android.graphics.Paint paint = new android.graphics.Paint();
            @Override public void draw(Canvas canvas) {
                Rect at = getBounds();
                float tall = at.height() / 60f;
                paint.setColor(Color.rgb(8, 102, 255));
                canvas.drawRect(at.left, at.top + 24 * tall, at.right, at.top + 44 * tall, paint);
            }
            @Override public int getIntrinsicWidth() { return 300; }
            @Override public int getIntrinsicHeight() { return 60; }
            @Override public void setAlpha(int alpha) { }
            @Override public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
            @Override public android.graphics.ColorFilter getColorFilter() { return paint.getColorFilter(); }
            @Override public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
        };
        mark.setColorFilter(new android.graphics.PorterDuffColorFilter(Color.WHITE, android.graphics.PorterDuff.Mode.SRC_IN));
        return mark;
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void wordsTakeTheWordmarksDarkModeTint() {
        int[] colors = HomeHeader.look(paddedWordmark()).colors;
        assertEquals(1, colors.length);
        assertFalse("white, not the blue under the tint", HomeHeader.apart(Color.WHITE, colors[0]));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void wordsAreAsTallAsTheWordmarksLettersNotItsWholeSlot() {
        words("Chats");
        Drawable shown = HomeHeader.dress(paddedWordmark());
        assertEquals("the slot stays the wordmark's", 60, shown.getIntrinsicHeight());
        // The header hands it bounds twice the size, the way it scales the wordmark to its row.
        int width = shown.getIntrinsicWidth() * 2;
        Bitmap drawn = Bitmap.createBitmap(width, 120, Bitmap.Config.ARGB_8888);
        shown.setBounds(0, 0, width, 120);
        shown.draw(new Canvas(drawn));
        int top = -1, bottom = -1;
        for (int y = 0; y < 120; y++) {
            for (int x = 0; x < width; x++) {
                if (Color.alpha(drawn.getPixel(x, y)) < 160) continue;
                if (top < 0) top = y;
                bottom = y;
                break;
            }
        }
        assertTrue("No ink drawn", top >= 0);
        // The letters' band, rows 24 to 44 of 60, comes out as rows 48 to 88 of 120, give or take the small sample's rows.
        assertTrue("top " + top, top >= 42 && top <= 54);
        assertTrue("bottom " + bottom, bottom >= 82 && bottom <= 94);
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void samplingTheWordmarkNeverMovesTheOneOnScreen() {
        GradientDrawable shared = wordmark(Color.RED, Color.BLUE);
        shared.setBounds(5, 6, 305, 66);
        HomeHeader.look(shared);
        assertEquals(new Rect(5, 6, 305, 66), shared.getBounds());
        // One without a state to copy is drawn itself, then put back where it was.
        Drawable plain = new Drawable() {
            @Override public void draw(Canvas canvas) { canvas.drawColor(Color.GREEN); }
            @Override public int getIntrinsicWidth() { return 90; }
            @Override public int getIntrinsicHeight() { return 30; }
            @Override public void setAlpha(int alpha) { }
            @Override public void setColorFilter(android.graphics.ColorFilter filter) { }
            @Override public int getOpacity() { return android.graphics.PixelFormat.OPAQUE; }
        };
        plain.setBounds(1, 2, 91, 32);
        int[] colors = HomeHeader.look(plain).colors;
        assertEquals(new Rect(1, 2, 91, 32), plain.getBounds());
        assertEquals(1, colors.length);
        assertTrue(Color.green(colors[0]) > 200);
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void longWordsShrinkToFitAndAGradientRunsStartToEnd() {
        HomeHeader.TextMark narrow = new HomeHeader.TextMark("A much longer header", 60, 200, new HomeHeader.Look(new int[] {Color.RED}, 0f, 1f, 0f));
        assertTrue(narrow.getIntrinsicWidth() <= 200);
        assertEquals(60, narrow.getIntrinsicHeight());

        HomeHeader.Look gradient = new HomeHeader.Look(new int[] {Color.RED, Color.GREEN, Color.BLUE}, 0f, 1f, 0f);
        HomeHeader.TextMark mark = new HomeHeader.TextMark("HHHHHHHH", 60, 2000, gradient);
        int width = mark.getIntrinsicWidth();
        Bitmap drawn = Bitmap.createBitmap(width, 60, Bitmap.Config.ARGB_8888);
        mark.setBounds(0, 0, width, 60);
        mark.draw(new Canvas(drawn));
        int first = -1, last = -1;
        for (int x = 0; x < width; x++) {
            if (Color.alpha(drawn.getPixel(x, 30)) < 200) continue;
            if (first < 0) first = x;
            last = x;
        }
        assertTrue("No ink drawn", first >= 0 && last > first);
        int start = drawn.getPixel(first, 30), end = drawn.getPixel(last, 30);
        assertTrue(Color.red(start) > Color.blue(start));
        assertTrue(Color.blue(end) > Color.red(end));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void removingThePictureCanBeUndoneButNeverOverOneChosenSince() throws Exception {
        Settings.preferences.edit().putBoolean(HomeHeader.KEY, true).commit();
        OpenSections.all();
        File copy = HomeHeader.file(context);
        byte[] picture = png(40, 20, Color.RED);
        java.nio.file.Files.write(copy.toPath(), picture);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = screen.get().getWindow().getDecorView();
            android.widget.TextView undo = root.findViewWithTag("undo");
            root.findViewWithTag("home_header_remove").performClick();
            assertFalse(copy.exists());
            assertEquals("Undo Remove the picture", undo.getText().toString());
            undo.performClick();
            assertArrayEquals(picture, java.nio.file.Files.readAllBytes(copy.toPath()));
            assertEquals(android.view.View.VISIBLE, root.findViewWithTag("home_header_remove").getVisibility());
            assertFalse(new File(context.getFilesDir(), HomeHeaderPicture.PARTIAL).exists());

            // A picture chosen after the remove stays when Undo is tapped.
            root.findViewWithTag("home_header_remove").performClick();
            byte[] chosen = png(30, 30, Color.GREEN);
            java.nio.file.Files.write(copy.toPath(), chosen);
            undo.performClick();
            assertArrayEquals(chosen, java.nio.file.Files.readAllBytes(copy.toPath()));
        }
    }

    @Test public void aPictureKeepsItsShapeAtTheLettersHeightAndShrinksWhenTooWide() {
        Bitmap picture = Bitmap.createBitmap(400, 100, Bitmap.Config.ARGB_8888);
        HomeHeader.Look whole = new HomeHeader.Look(new int[] {Color.BLUE}, 0f, 1f, 0f);
        HomeHeader.PictureMark mark = new HomeHeader.PictureMark(picture, 50, 1000, whole);
        assertEquals(200, mark.getIntrinsicWidth());
        assertEquals(50, mark.getIntrinsicHeight());
        // Too wide: it gets smaller inside the slot, and the slot keeps the wordmark's height.
        HomeHeader.PictureMark capped = new HomeHeader.PictureMark(picture, 50, 100, whole);
        assertEquals(100, capped.getIntrinsicWidth());
        assertEquals(50, capped.getIntrinsicHeight());
        assertEquals(25f, capped.shown.height(), 0.01f);
        // Letters in the middle fifth of a 50 tall wordmark that start 10 in: the picture is 10 tall there.
        HomeHeader.PictureMark banded = new HomeHeader.PictureMark(picture, 50, 1000, new HomeHeader.Look(new int[] {Color.BLUE}, 0.4f, 0.6f, 10f));
        assertEquals(10f, banded.shown.left, 0.01f);
        assertEquals(20f, banded.shown.top, 0.01f);
        assertEquals(50f, banded.shown.right, 0.01f);
        assertEquals(30f, banded.shown.bottom, 0.01f);
        assertEquals(50, banded.getIntrinsicWidth());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aPictureShowsInsteadOfTheWordsUntilItsRemoved() throws Exception {
        Drawable mark = wordmark(Color.BLUE);
        words("Chats");
        File copy = HomeHeader.file(context);
        HomeHeaderPicture.copy(new ByteArrayInputStream(png(2000, 400, Color.RED)), copy, () -> true);
        assertFalse(new File(context.getFilesDir(), HomeHeaderPicture.PARTIAL).exists());
        Drawable shown = HomeHeader.dress(mark);
        assertTrue(shown instanceof HomeHeader.PictureMark);
        // Shrunk to fit 1024 by 256 when it was picked, its shape kept.
        Bitmap kept = ((HomeHeader.PictureMark) shown).picture;
        assertEquals(1024, kept.getWidth());
        assertEquals(205, kept.getHeight());
        assertTrue(HomeHeader.inUse(context).startsWith("picture\n"));
        assertSame(shown, HomeHeader.dress(mark));

        assertTrue(HomeHeaderPicture.remove(copy));
        assertFalse(copy.exists());
        Drawable words = HomeHeader.dress(mark);
        assertTrue(words instanceof HomeHeader.TextMark);
        assertTrue(HomeHeaderPicture.remove(copy));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theWarmUpDecodesThePictureSoTheFirstHeaderDoesntWait() throws Exception {
        File copy = HomeHeader.file(context);
        HomeHeaderPicture.copy(new ByteArrayInputStream(png(400, 100, Color.RED)), copy, () -> true);
        HomeHeader.warm();
        assertNull("switch off, nothing read", org.robolectric.util.ReflectionHelpers.getStaticField(HomeHeader.class, "picture"));

        words("");
        HomeHeader.warm();
        Bitmap warmed = org.robolectric.util.ReflectionHelpers.getStaticField(HomeHeader.class, "picture");
        assertNotNull(warmed);
        Drawable shown = HomeHeader.dress(wordmark(Color.BLUE));
        assertSame(warmed, ((HomeHeader.PictureMark) shown).picture);
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aPickThatsTurnedDownLeavesThePictureThatWasThere() throws Exception {
        File copy = HomeHeader.file(context);
        HomeHeaderPicture.copy(new ByteArrayInputStream(png(100, 50, Color.RED)), copy, () -> true);
        long length = copy.length();
        byte[] before = java.nio.file.Files.readAllBytes(copy.toPath());

        assertRefused(HomeHeaderPicture.Refusal.NOT_A_PICTURE, new ByteArrayInputStream("not a picture".getBytes()), copy, true);
        assertRefused(HomeHeaderPicture.Refusal.NOT_A_PICTURE, new ByteArrayInputStream(new byte[0]), copy, true);
        assertRefused(HomeHeaderPicture.Refusal.UNREADABLE, null, copy, true);
        assertRefused(HomeHeaderPicture.Refusal.UNREADABLE, new InputStream() {
            @Override public int read() throws IOException { throw new IOException("/private/path"); }
        }, copy, true);
        // A provider that never stops sending is cut off past the limit, not read to the end.
        assertRefused(HomeHeaderPicture.Refusal.TOO_LARGE, new InputStream() {
            @Override public int read() { return 0; }
            @Override public int read(byte[] buffer, int at, int count) { return count; }
        }, copy, true);
        // A pick given up on while it was copying never moves in.
        assertRefused(HomeHeaderPicture.Refusal.NOT_SAVED, new ByteArrayInputStream(png(80, 80, Color.GREEN)), copy, false);

        assertEquals(length, copy.length());
        assertArrayEquals(before, java.nio.file.Files.readAllBytes(copy.toPath()));
        assertFalse(new File(context.getFilesDir(), HomeHeaderPicture.PARTIAL).exists());
    }

    @Test public void aBigPictureFitsTheBoxWithItsShapeAndASmallOneStaysItsSize() {
        assertArrayEquals(new int[] {1024, 205}, HomeHeaderPicture.fit(2000, 400));
        assertArrayEquals(new int[] {128, 256}, HomeHeaderPicture.fit(500, 1000));
        assertArrayEquals(new int[] {64, 32}, HomeHeaderPicture.fit(64, 32));
        assertArrayEquals(new int[] {1024, 1}, HomeHeaderPicture.fit(100_000, 1));
    }

    private static void assertRefused(HomeHeaderPicture.Refusal reason, InputStream input, File copy, boolean wanted) {
        try {
            HomeHeaderPicture.copy(input, copy, () -> wanted);
            fail("Taken: " + reason);
        } catch (HomeHeaderPicture.Refused refused) {
            assertEquals(reason, refused.reason);
            assertFalse("A refusal never carries the provider's words", String.valueOf(refused.getMessage()).contains("/private"));
        }
    }
}
