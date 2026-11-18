/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.net.Uri;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.shadows.ShadowBitmapFactory;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.nio.file.Files;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.settings.preference.CustomSeekbarThumbPreference;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 26)
public class SeekbarCustomizationTest {
    private Context context;

    @Before
    public void setUp() throws Exception {
        // Match Android's decoder: the default legacy shadow accepts arbitrary bytes as an image.
        ShadowBitmapFactory.setAllowInvalidImageData(false);
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field contextField = Utils.class.getDeclaredField("context");
        contextField.setAccessible(true);
        contextField.set(null, application);
        context = application;
        CustomSeekbarThumbPatch.resetThumb(context);
        Settings.CUSTOM_SEEKBAR_THUMB.save(false);
    }

    @Test
    public void correctsAccumulatedColumnDriftAndIncludesLastPixel() throws Exception {
        BitmapRegionDecoder decoder = decoder(1600, 900);
        Rect frame = new Rect(9 * 159, 9 * 90, 9 * 159 + 158, 9 * 90 + 89);

        SeekbarThumbnailPreviewPatch.fixStoryboardFrameRect(frame, decoder);

        assertEquals(new Rect(1440, 810, 1600, 900), frame);
        decoder.recycle();
    }

    @Test
    public void handlesPartialLastStoryboardSheet() throws Exception {
        BitmapRegionDecoder decoder = decoder(480, 180);
        Rect frame = new Rect(318, 90, 476, 179);

        SeekbarThumbnailPreviewPatch.fixStoryboardFrameRect(frame, decoder);

        assertEquals(new Rect(320, 90, 480, 180), frame);
        decoder.recycle();
    }

    @Test
    public void importsValidatedImageAndResetRemovesItsPrivateCopy() throws Exception {
        File selected = new File(context.getCacheDir(), "thumb.png");
        try (FileOutputStream out = new FileOutputStream(selected)) {
            Bitmap.createBitmap(24, 16, Bitmap.Config.ARGB_8888).compress(Bitmap.CompressFormat.PNG, 100, out);
        }

        assertTrue(CustomSeekbarThumbPatch.importThumbFile(context, Uri.fromFile(selected)));
        Settings.CUSTOM_SEEKBAR_THUMB_FILE.save("thumb.png");
        File stored = new File(context.getFilesDir(), "morphe_custom_seekbar_thumb");
        assertArrayEquals(Files.readAllBytes(selected.toPath()), Files.readAllBytes(stored.toPath()));

        CustomSeekbarThumbPatch.resetThumb(context);

        assertFalse(stored.exists());
        assertEquals("", Settings.CUSTOM_SEEKBAR_THUMB_FILE.get());
    }

    @Test
    @Config(sdk = 34)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void preservesOpaqueShapeWithinTransparentImageBounds() throws Exception {
        Bitmap selected = Bitmap.createBitmap(120, 60, Bitmap.Config.ARGB_8888);
        Paint paint = new Paint();
        paint.setColor(Color.BLUE);

        // Run A's "oval" fixture was a circle offset inside a non-square transparent canvas.
        new Canvas(selected).drawOval(70, 10, 111, 51, paint);
        Rect circle = importAndDrawThumb(selected);

        assertTrue(circle.width() > 0);
        assertEquals(circle.width(), circle.height(), 1);
        assertTrue("The transparent left margin must remain", circle.centerX() > 256);

        selected.eraseColor(Color.TRANSPARENT);
        new Canvas(selected).drawOval(10, 5, 110, 55, paint);
        Rect oval = importAndDrawThumb(selected);

        assertTrue("A genuinely non-square shape must stay non-square", oval.width() > oval.height());
        assertEquals(2, (double) oval.width() / oval.height(), 0.15);
    }

    private Rect importAndDrawThumb(Bitmap selected) throws Exception {
        File source = new File(context.getCacheDir(), "shape.png");
        try (FileOutputStream out = new FileOutputStream(source)) {
            selected.compress(Bitmap.CompressFormat.PNG, 100, out);
        }
        assertTrue(CustomSeekbarThumbPatch.importThumbFile(context, Uri.fromFile(source)));
        Settings.CUSTOM_SEEKBAR_THUMB_FILE.save(source.getName());
        Settings.CUSTOM_SEEKBAR_THUMB.save(true);
        Settings.CUSTOM_SEEKBAR_THUMB_SCALE_TYPE.save(CustomSeekbarThumbPatch.ThumbScaleType.FIT_SEEKBAR);
        CustomSeekbarThumbPatch.reloadThumb();

        Bitmap rendered = Bitmap.createBitmap(512, 256, Bitmap.Config.ARGB_8888);
        Paint stockPaint = new Paint();
        stockPaint.setColor(Color.RED);
        CustomSeekbarThumbPatch.drawCircle(
                new Canvas(rendered), 256, 128, Utils.dipToPixels(6), stockPaint);

        Rect bounds = new Rect();
        for (int y = 0; y < rendered.getHeight(); y++) {
            for (int x = 0; x < rendered.getWidth(); x++) {
                int pixel = rendered.getPixel(x, y);
                if (Color.alpha(pixel) != 0) {
                    assertEquals("Must render the imported image, not the stock red circle", 0, Color.red(pixel));
                    bounds.union(x, y, x + 1, y + 1);
                }
            }
        }
        return bounds;
    }

    @Test
    public void rejectsInvalidReplacementWithoutLosingPreviousImage() throws Exception {
        File stored = new File(context.getFilesDir(), "morphe_custom_seekbar_thumb");
        Files.write(stored.toPath(), new byte[]{1, 2, 3});
        File selected = new File(context.getCacheDir(), "invalid.png");
        Files.write(selected.toPath(), new byte[]{4, 5, 6});

        assertFalse(CustomSeekbarThumbPatch.importThumbFile(context, Uri.fromFile(selected)));
        assertArrayEquals(new byte[]{1, 2, 3}, Files.readAllBytes(stored.toPath()));
        assertFalse(new File(context.getFilesDir(), "morphe_custom_seekbar_thumb.tmp").exists());
    }

    @Test
    public void cancellationLeavesSavedSelectionUntouched() {
        Settings.CUSTOM_SEEKBAR_THUMB_FILE.save("saved.gif");

        CustomSeekbarThumbPreference.handleActivityResult(context, android.app.Activity.RESULT_CANCELED, null);

        assertEquals("saved.gif", Settings.CUSTOM_SEEKBAR_THUMB_FILE.get());
    }

    private static BitmapRegionDecoder decoder(int width, int height) throws Exception {
        ByteArrayOutputStream encoded = new ByteArrayOutputStream();
        Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888).compress(Bitmap.CompressFormat.PNG, 100, encoded);
        byte[] image = encoded.toByteArray();
        return BitmapRegionDecoder.newInstance(image, 0, image.length, false);
    }
}
