package app.hushmessenger.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
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
        int[] solid = HomeHeader.colors(wordmark(Color.rgb(8, 102, 255)));
        assertEquals(1, solid.length);
        assertFalse(HomeHeader.apart(Color.rgb(8, 102, 255), solid[0]));

        int[] gradient = HomeHeader.colors(wordmark(Color.RED, Color.BLUE));
        assertEquals(3, gradient.length);
        assertTrue(Color.red(gradient[0]) > Color.blue(gradient[0]));
        assertTrue(Color.blue(gradient[2]) > Color.red(gradient[2]));

        assertArrayEquals(new int[] {HomeHeader.MESSENGER_BLUE}, HomeHeader.colors(wordmark(Color.TRANSPARENT)));
        assertArrayEquals(new int[] {HomeHeader.MESSENGER_BLUE}, HomeHeader.colors(new GradientDrawable()));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void samplingTheWordmarkNeverMovesTheOneOnScreen() {
        GradientDrawable shared = wordmark(Color.RED, Color.BLUE);
        shared.setBounds(5, 6, 305, 66);
        HomeHeader.colors(shared);
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
        int[] colors = HomeHeader.colors(plain);
        assertEquals(new Rect(1, 2, 91, 32), plain.getBounds());
        assertEquals(1, colors.length);
        assertTrue(Color.green(colors[0]) > 200);
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void longWordsShrinkToFitAndAGradientRunsStartToEnd() {
        HomeHeader.TextMark narrow = new HomeHeader.TextMark("A much longer header", 60, 200, new int[] {Color.RED});
        assertTrue(narrow.getIntrinsicWidth() <= 200);
        assertEquals(60, narrow.getIntrinsicHeight());

        HomeHeader.TextMark mark = new HomeHeader.TextMark("HHHHHHHH", 60, 2000, new int[] {Color.RED, Color.GREEN, Color.BLUE});
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

    @Test public void aPictureKeepsItsShapeAtTheWordmarksHeightAndShrinksWhenTooWide() {
        Bitmap picture = Bitmap.createBitmap(400, 100, Bitmap.Config.ARGB_8888);
        HomeHeader.PictureMark mark = new HomeHeader.PictureMark(picture, 50, 1000);
        assertEquals(200, mark.getIntrinsicWidth());
        assertEquals(50, mark.getIntrinsicHeight());
        HomeHeader.PictureMark capped = new HomeHeader.PictureMark(picture, 50, 100);
        assertEquals(100, capped.getIntrinsicWidth());
        assertEquals(25, capped.getIntrinsicHeight());
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
