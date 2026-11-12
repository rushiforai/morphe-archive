package app.spicetify.extension.spotify.theme;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.util.reflector.Reflector.reflector;

import android.app.Activity;
import android.app.Application;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.FrameLayout;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.annotation.RealObject;
import org.robolectric.shadows.ShadowResources;
import org.robolectric.util.reflector.Direct;
import org.robolectric.util.reflector.ForType;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE) // Android's own decoder, which refuses what isn't an image
public class ThemeBackgroundTest {
    static final int MAIN_CONTENT = 0x7f0b0042;

    /** Spotify's main activity holds a main_content view, a resource this test app doesn't have. */
    @Implements(Resources.class)
    public static class SpotifyIds extends ShadowResources {
        @RealObject private Resources resources;

        @Implementation
        protected int getIdentifier(String name, String type, String defPackage) {
            if (name.equals("main_content") && type.equals("id")) return MAIN_CONTENT;
            return reflector(Original.class, resources).getIdentifier(name, type, defPackage);
        }

        @ForType(Resources.class)
        interface Original {
            @Direct
            int getIdentifier(String name, String type, String defPackage);
        }
    }

    private final Application context = RuntimeEnvironment.getApplication();
    private final File file = new File(context.getFilesDir(), "spicetify_background");

    @Before
    public void forgetTheDecodedImage() {
        // Static, so a test never draws an image another test decoded.
        ThemeBackground.cached = null;
    }

    @After
    public void removeTheImage() throws IOException {
        ThemeBackground.replace(context, null);
        context.deleteSharedPreferences("spicetify_theme");
    }

    @Test
    public void doesNothingWhenNoBackgroundFileIsSaved() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        Drawable before = activity.getWindow().getDecorView().getBackground();

        ThemeBackground.applyTo(activity);

        assertSame(before, activity.getWindow().getDecorView().getBackground());
    }

    @Test
    @Config(shadows = SpotifyIds.class)
    public void drawsTheImageBehindSpotifysMainContent() throws IOException {
        save(png(8, 4));
        Activity activity = spotify();
        View content = activity.findViewById(android.R.id.content);
        Drawable window = activity.getWindow().getDecorView().getBackground();

        ThemeBackground.applyTo(activity);

        // Spotify paints android:id/content black above the window, so it's cleared.
        assertNull(content.getBackground());
        assertNotNull(activity.findViewById(MAIN_CONTENT).getBackground());
        assertNotSame(window, activity.getWindow().getDecorView().getBackground());
    }

    @Test
    @Config(shadows = SpotifyIds.class)
    public void anActivityWithoutMainContentKeepsItsBackground() throws IOException {
        save(png(8, 4));
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        View content = activity.findViewById(android.R.id.content);
        content.setBackgroundColor(Color.BLACK);
        Drawable window = activity.getWindow().getDecorView().getBackground();

        ThemeBackground.applyTo(activity);

        assertNotNull(content.getBackground());
        assertSame(window, activity.getWindow().getDecorView().getBackground());
    }

    @Test
    @Config(shadows = SpotifyIds.class)
    public void theImageIsDimmedAndBlurredOnlyWhenBlurIsOn() throws IOException {
        Activity activity = spotify();
        // An image with the screen's shape, black on the left and white on the right, so nothing is cropped.
        int width = activity.getResources().getDisplayMetrics().widthPixels / 10;
        int height = activity.getResources().getDisplayMetrics().heightPixels / 10;
        Bitmap halves = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(halves);
        canvas.drawColor(Color.BLACK);
        Paint white = new Paint();
        white.setColor(Color.WHITE);
        canvas.drawRect(width / 2f, 0, width, height, white);
        ByteArrayOutputStream encoded = new ByteArrayOutputStream();
        halves.compress(Bitmap.CompressFormat.PNG, 100, encoded);
        save(encoded.toByteArray());
        assertFalse(ThemeBackground.blurEnabled(context));

        ThemeBackground.applyTo(activity);
        Bitmap sharp = drawn(activity, width, height);
        // Half black over the image, so text stays readable.
        assertEquals(0, Color.red(sharp.getPixel(width / 2 - 1, height / 2)));
        int dimmed = Color.red(sharp.getPixel(width / 2, height / 2));
        assertTrue("dimmed white was " + dimmed, dimmed > 120 && dimmed < 135);

        ThemeBackground.setBlur(context, true);
        assertTrue(ThemeBackground.blurEnabled(context));
        ThemeBackground.applyTo(activity);
        Bitmap blurred = drawn(activity, width, height);
        assertTrue(Color.red(blurred.getPixel(width / 2 - 1, height / 2)) > 0);
        assertTrue(Color.red(blurred.getPixel(width / 2, height / 2)) < dimmed);
        // Far from the edge, the halves keep their colors.
        assertEquals(0, Color.red(blurred.getPixel(0, height / 2)));
        assertEquals(dimmed, Color.red(blurred.getPixel(width - 1, height / 2)));
    }

    @Test
    public void aLandscapeImageIsSavedAtAboutScreenSizeUncropped() throws IOException {
        int bound = Math.max(context.getResources().getDisplayMetrics().widthPixels, context.getResources().getDisplayMetrics().heightPixels);
        // Wider than the screen is tall, as Hazy's and CyberNight's images are on a phone held upright.
        BitmapFactory.Options fitted = ThemeBackground.bounds(ThemeBackground.fit(context, png(bound * 4, bound * 9 / 4)));
        assertEquals(bound, fitted.outWidth);
        assertEquals(Math.round(bound * 9 / 16f), fitted.outHeight, 1);
        // An image that already fits is saved as it is.
        byte[] small = png(bound / 2, bound / 3);
        assertSame(small, ThemeBackground.fit(context, small));
        try {
            ThemeBackground.fit(context, "<html>Not Found</html>".getBytes(StandardCharsets.UTF_8));
            fail("Bytes that aren't an image were fitted");
        } catch (IOException expected) {
            assertEquals("Not an image Android can read", expected.getMessage());
        }
    }

    @Test
    public void decodesAtMostAboutScreenSizeAndWithinTheMemoryCap() {
        // A phone held upright, 1220x2712: Galaxy's and Hazy's images decode whole. CyberNight's would take
        // 52 MB and 8K 133 MB, so both decode at half size, 13 MB and 33 MB, within the 32 MiB cap.
        assertEquals(1, ThemeBackground.sampleSize(1200, 675, 2712));
        assertEquals(1, ThemeBackground.sampleSize(2880, 1620, 2712));
        assertEquals(2, ThemeBackground.sampleSize(4800, 2700, 2712));
        assertEquals(2, ThemeBackground.sampleSize(7680, 4320, 2712));
        assertEquals(4, ThemeBackground.sampleSize(8000, 8000, 2712));
        // Halved while the longer side stays at or above the bound.
        assertEquals(2, ThemeBackground.sampleSize(1600, 900, 470));
        assertEquals(1, ThemeBackground.sampleSize(0, 0, 470));
    }

    @Test
    @Config(shadows = SpotifyIds.class)
    public void aLargeSavedImageStillDecodesNearScreenSize() throws IOException {
        // Saved as it came, not through fit: the decode is bounded anyway.
        save(png(1600, 900));
        ThemeBackground.applyTo(spotify());
        assertEquals(800, ThemeBackground.cached.getWidth());
        assertEquals(450, ThemeBackground.cached.getHeight());
    }

    @Test
    @Config(shadows = SpotifyIds.class)
    public void theImageFillsWindowsOfEitherShape() throws IOException {
        // Red, green and blue thirds side by side.
        Bitmap stripes = Bitmap.createBitmap(60, 20, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(stripes);
        Paint paint = new Paint();
        int[] colors = {Color.RED, Color.GREEN, Color.BLUE};
        for (int i = 0; i < 3; i++) {
            paint.setColor(colors[i]);
            canvas.drawRect(i * 20, 0, i * 20 + 20, 20, paint);
        }
        save(encode(stripes));
        Activity activity = spotify();
        ThemeBackground.applyTo(activity);

        // A window wider than the image shows all three, a tall one the middle. Each is filled edge to edge,
        // and neither is cropped to the first window's shape. Half black over each, so a full channel reads about 127.
        Bitmap wide = drawn(activity, 120, 20);
        assertTrue(Color.red(wide.getPixel(5, 10)) > 100 && Color.green(wide.getPixel(5, 10)) == 0);
        assertTrue(Color.blue(wide.getPixel(115, 10)) > 100 && Color.green(wide.getPixel(115, 10)) == 0);
        Bitmap tall = drawn(activity, 20, 60);
        for (int y : new int[] {2, 30, 57}) {
            assertTrue(Color.green(tall.getPixel(10, y)) > 100);
            assertEquals(0, Color.red(tall.getPixel(10, y)));
        }
    }

    @Test
    @Config(shadows = SpotifyIds.class)
    public void anotherImageReplacesTheDecodedOne() throws IOException {
        save(solid(Color.RED));
        Activity activity = spotify();
        ThemeBackground.applyTo(activity);
        assertTrue(Color.red(drawn(activity, 8, 8).getPixel(4, 4)) > 100);

        save(solid(Color.BLUE));
        ThemeBackground.applyTo(activity);
        Bitmap drawn = drawn(activity, 8, 8);
        assertEquals(0, Color.red(drawn.getPixel(4, 4)));
        assertTrue(Color.blue(drawn.getPixel(4, 4)) > 100);
    }

    @Test
    @Config(shadows = SpotifyIds.class, qualifiers = "w600dp-h1000dp")
    public void theBlurWorksOnASmallCopy() throws IOException {
        save(png(1000, 600));
        Activity activity = spotify();
        ThemeBackground.applyTo(activity);
        assertEquals(1000, ThemeBackground.cached.getWidth());

        ThemeBackground.setBlur(context, true);
        ThemeBackground.applyTo(activity);
        assertEquals(540, ThemeBackground.cached.getWidth());
        assertEquals(324, ThemeBackground.cached.getHeight());
    }

    @Test
    public void blurSpreadsAnEdgeAndKeepsFlatAreas() {
        Bitmap edge = Bitmap.createBitmap(40, 10, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(edge);
        canvas.drawColor(Color.BLACK);
        Paint white = new Paint();
        white.setColor(Color.WHITE);
        canvas.drawRect(20, 0, 40, 10, white);

        Bitmap blurred = ThemeBackground.blur(edge, 2);

        int left = Color.red(blurred.getPixel(19, 5));
        int right = Color.red(blurred.getPixel(20, 5));
        assertTrue("left of the edge was " + left, left > 0 && left < 128);
        assertTrue("right of the edge was " + right, right > 128 && right < 255);
        // Three box blurs of radius 2 reach six pixels past the edge, and no further.
        assertTrue(Color.red(blurred.getPixel(14, 5)) > 0);
        assertEquals(0, Color.red(blurred.getPixel(13, 5)));
        // The edges of the image clamp, so its far ends keep their colors, and it stays opaque.
        assertEquals(Color.BLACK, blurred.getPixel(0, 5));
        assertEquals(Color.WHITE, blurred.getPixel(39, 0));
    }

    @Test
    public void stageAndReplacePutTheImageInPlaceAndNoneRemovesIt() throws IOException {
        byte[] png = png(8, 4);
        File staged = ThemeBackground.stage(context, png);
        assertFalse(ThemeBackground.hasImage(context));

        ThemeBackground.replace(context, staged);
        assertTrue(ThemeBackground.hasImage(context));
        assertArrayEquals(png, Files.readAllBytes(file.toPath()));
        assertFalse(staged.exists());

        ThemeBackground.replace(context, null);
        assertFalse(ThemeBackground.hasImage(context));
    }

    @Test
    public void stageRefusesBytesThatArentAnImageAndKeepsTheSavedOne() throws IOException {
        byte[] png = png(8, 4);
        save(png);
        try {
            ThemeBackground.stage(context, "<html>Not Found</html>".getBytes(StandardCharsets.UTF_8));
            fail("Bytes that aren't an image were staged");
        } catch (IOException expected) {
            assertEquals("Not an image Android can read", expected.getMessage());
        }
        assertArrayEquals(png, Files.readAllBytes(file.toPath()));
    }

    /** An image of this size, encoded as a PNG. */
    public static byte[] png(int width, int height) {
        return encode(Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888));
    }

    private static byte[] encode(Bitmap bitmap) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
        return out.toByteArray();
    }

    private static byte[] solid(int color) {
        Bitmap bitmap = Bitmap.createBitmap(8, 8, Bitmap.Config.ARGB_8888);
        bitmap.eraseColor(color);
        return encode(bitmap);
    }

    private void save(byte[] image) throws IOException {
        ThemeBackground.replace(context, ThemeBackground.stage(context, image));
    }

    /** An activity laid out like Spotify's main one, with android:id/content painted black. */
    private static Activity spotify() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        FrameLayout main = new FrameLayout(activity);
        main.setId(MAIN_CONTENT);
        activity.setContentView(main);
        activity.findViewById(android.R.id.content).setBackgroundColor(Color.BLACK);
        return activity;
    }

    /** What main_content's background draws at this size. */
    private static Bitmap drawn(Activity activity, int width, int height) {
        Drawable background = activity.findViewById(MAIN_CONTENT).getBackground();
        background.setBounds(0, 0, width, height);
        Bitmap drawn = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        background.draw(new Canvas(drawn));
        return drawn;
    }
}
