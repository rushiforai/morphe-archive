/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import app.morphe.extension.shared.SettingsContextRule;

/**
 * A photo save that comes back as AVIF is written again as a JPEG, and anything else, or a failed
 * conversion, leaves the file as it came. Android's own Bitmap code runs here, so the JPEG is real.
 * AVIF itself can't be decoded off a phone, so a decoder stands in for Android's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 31)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class PhotoFormatTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    /** The start of an AVIF file: an ftyp box naming avif. The decoder never reads past it here. */
    private static final byte[] AVIF_HEAD = "\0\0\0 ftypavif\0\0\0\0avifmif1miaf".getBytes(StandardCharsets.ISO_8859_1);

    @After
    public void tearDown() {
        PhotoFormat.decoderForTests = null;
        PhotoFormat.readsAvifForTests = null;
    }

    private File avif() throws IOException {
        File file = folder.newFile("image.part");
        Files.write(file.toPath(), AVIF_HEAD);
        return file;
    }

    @Test
    public void anAvifPhotoIsSavedAsAJpegOfTheSamePicture() throws IOException {
        File file = avif();
        PhotoFormat.decoderForTests = source -> {
            Bitmap bitmap = Bitmap.createBitmap(48, 64, Bitmap.Config.ARGB_8888);
            bitmap.eraseColor(Color.rgb(200, 40, 40));
            return bitmap;
        };
        assertEquals(PhotoFormat.JPEG, PhotoFormat.jpegFromAvif(file, PhotoFormat.AVIF));

        byte[] saved = Files.readAllBytes(file.toPath());
        assertEquals("a JPEG's start of image", 0xFF, saved[0] & 0xFF);
        assertEquals(0xD8, saved[1] & 0xFF);
        Bitmap back = BitmapFactory.decodeFile(file.getPath());
        assertNotNull("the JPEG decodes", back);
        assertEquals(48, back.getWidth());
        assertEquals(64, back.getHeight());
        int red = Color.red(back.getPixel(24, 32));
        assertTrue("the picture survives, red " + red, red > 180 && Color.green(back.getPixel(24, 32)) < 70);
        assertFalse("no work file is left beside it", new File(file.getPath() + ".jpg").exists());
    }

    @Test
    public void aConversionThatFailsLeavesTheAvifAsItCame() throws IOException {
        File file = avif();
        PhotoFormat.decoderForTests = source -> {
            throw new IOException("unreadable");
        };
        assertEquals(PhotoFormat.AVIF, PhotoFormat.jpegFromAvif(file, PhotoFormat.AVIF));
        assertArrayEquals(AVIF_HEAD, Files.readAllBytes(file.toPath()));
        assertFalse(new File(file.getPath() + ".jpg").exists());

        PhotoFormat.decoderForTests = source -> {
            throw new OutOfMemoryError("a huge photo");
        };
        assertEquals("running out of memory keeps the AVIF too", PhotoFormat.AVIF, PhotoFormat.jpegFromAvif(file, PhotoFormat.AVIF));
        assertArrayEquals(AVIF_HEAD, Files.readAllBytes(file.toPath()));
    }

    @Test
    public void otherTypesAreLeftAlone() throws IOException {
        File file = avif();
        PhotoFormat.decoderForTests = source -> {
            fail("only an AVIF is decoded");
            return null;
        };
        for (String mime : new String[] {"image/jpeg", "image/png", "image/webp", "image/heic", "video/mp4", null}) {
            assertEquals(mime, PhotoFormat.jpegFromAvif(file, mime));
        }
        assertArrayEquals(AVIF_HEAD, Files.readAllBytes(file.toPath()));
    }

    @Test
    public void android12AndLaterReadAvif() {
        assertTrue("sdk 31 is Android 12", PhotoFormat.readsAvif());
        PhotoFormat.readsAvifForTests = false;
        assertFalse(PhotoFormat.readsAvif());
    }
}
