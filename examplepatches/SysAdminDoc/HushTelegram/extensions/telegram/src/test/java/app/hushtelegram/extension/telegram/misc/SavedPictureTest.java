/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Looper;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * The pictures kept for the lists and the chat list banner: copied in from the gallery, replaced
 * only by a picture, removed, and a damaged file let go so Telegram's look comes back.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SavedPictureTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String NAME = SavedPicture.LIST_BACKGROUND;
    private Context context;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        SavedPicture.remove(context, NAME);
    }

    @After public void tearDown() {
        SavedPicture.remove(context, NAME);
        SavedPicture.remove(context, SavedPicture.CHAT_LIST_BANNER);
    }

    /** A PNG [width] by [height], red on the left half and blue on the right. */
    private static byte[] png(int width, int height) {
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Paint paint = new Paint();
        paint.setColor(Color.RED);
        canvas.drawRect(0, 0, width / 2f, height, paint);
        paint.setColor(Color.BLUE);
        canvas.drawRect(width / 2f, 0, width, height, paint);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
        return out.toByteArray();
    }

    private Uri offered(String id, byte[] bytes) {
        return offered(id, new ByteArrayInputStream(bytes));
    }

    private Uri offered(String id, InputStream stream) {
        Uri uri = Uri.parse("content://media.test/picture/" + id);
        shadowOf(context.getContentResolver()).registerInputStream(uri, stream);
        return uri;
    }

    private static void settle() throws Exception {
        for (int i = 0; i < 3; i++) {
            Utils.awaitBackgroundTasksForTests();
            shadowOf(Looper.getMainLooper()).idle();
        }
    }

    @Test public void aPictureIsCopiedInAndDecodesFillingTheSizeAsked() {
        assertFalse(SavedPicture.present(context, NAME));
        int before = SavedPicture.generation(NAME);
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, offered("1", png(400, 200)), NAME));
        assertTrue(SavedPicture.present(context, NAME));
        assertTrue("a save is a new picture to draw", SavedPicture.generation(NAME) > before);
        File file = SavedPicture.file(context, NAME);
        assertTrue(file.getPath(), file.getPath().startsWith(context.getNoBackupFilesDir().getPath()));
        assertFalse("no part file left", new File(file.getParentFile(), NAME + ".part").exists());

        // A tall screen gets the middle of a wide picture, scaled to fill it: red left, blue right.
        Bitmap shown = SavedPicture.decode(file, 100, 200);
        assertNotNull(shown);
        assertEquals(100, shown.getWidth());
        assertEquals(200, shown.getHeight());
        assertEquals(Color.RED, shown.getPixel(10, 100));
        assertEquals(Color.BLUE, shown.getPixel(90, 100));
        // The other picture is kept apart.
        assertFalse(SavedPicture.present(context, SavedPicture.CHAT_LIST_BANNER));
    }

    @Test public void anotherPictureReplacesItAndSomethingElseLeavesItAlone() throws Exception {
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, offered("1", png(400, 200)), NAME));
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, offered("2", png(30, 60)), NAME));
        File file = SavedPicture.file(context, NAME);
        android.graphics.BitmapFactory.Options bounds = new android.graphics.BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        android.graphics.BitmapFactory.decodeFile(file.getPath(), bounds);
        assertEquals(30, bounds.outWidth);

        int before = SavedPicture.generation(NAME);
        byte[] text = "not a picture".getBytes(StandardCharsets.UTF_8);
        assertEquals(SavedPicture.Saved.NOT_A_PICTURE, SavedPicture.save(context, offered("3", text), NAME));
        assertEquals("the picture before stays", before, SavedPicture.generation(NAME));
        bounds.outWidth = 0;
        android.graphics.BitmapFactory.decodeFile(file.getPath(), bounds);
        assertEquals(30, bounds.outWidth);
        assertFalse(new File(file.getParentFile(), NAME + ".part").exists());
    }

    @Test public void aFileTooLargeForAPhotoIsRefusedWithoutReplacingThePicture() {
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, offered("1", png(40, 40)), NAME));
        InputStream endless = new InputStream() {
            private long left = SavedPicture.MAX_BYTES + 1;
            @Override public int read() { return left-- > 0 ? 0 : -1; }
            @Override public int read(byte[] buffer, int offset, int length) {
                if (left <= 0) return -1;
                int n = (int) Math.min(length, left);
                left -= n;
                return n;
            }
        };
        assertEquals(SavedPicture.Saved.TOO_LARGE, SavedPicture.save(context, offered("big", endless), NAME));
        assertTrue(SavedPicture.present(context, NAME));
        assertEquals(40, SavedPicture.decode(SavedPicture.file(context, NAME), 40, 40).getWidth());
    }

    @Test public void aSourceThatCantBeReadSavesNothing() {
        Uri missing = Uri.parse("content://media.test/picture/none");
        assertEquals(SavedPicture.Saved.FAILED, SavedPicture.save(context, missing, NAME));
        assertFalse(SavedPicture.present(context, NAME));
    }

    @Test public void removingItLeavesNothingAndANewGeneration() {
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, offered("1", png(40, 40)), NAME));
        int before = SavedPicture.generation(NAME);
        assertTrue(SavedPicture.remove(context, NAME));
        assertFalse(SavedPicture.present(context, NAME));
        assertFalse(SavedPicture.file(context, NAME).exists());
        assertTrue(SavedPicture.generation(NAME) > before);
        assertTrue("removing nothing is fine", SavedPicture.remove(context, NAME));
        assertFalse(SavedPicture.remove(null, NAME));
    }

    @Test public void aShownPictureDecodesOffTheMainThreadAndOnceForASize() throws Exception {
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, offered("1", png(400, 200)), NAME));
        AtomicInteger landed = new AtomicInteger(), broken = new AtomicInteger();
        SavedPicture.Shown shown = new SavedPicture.Shown(NAME, landed::incrementAndGet, broken::incrementAndGet);
        assertNull("nothing until the worker has it", shown.bitmap(context, 50, 80));
        settle();
        assertEquals(1, landed.get());
        Bitmap first = shown.bitmap(context, 50, 80);
        assertNotNull(first);
        assertEquals(50, first.getWidth());
        assertSame("kept for the same size", first, shown.bitmap(context, 50, 80));
        settle();
        assertEquals(1, landed.get());

        // A new picture is decoded again.
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, offered("2", png(30, 30)), NAME));
        assertNull(shown.bitmap(context, 50, 80));
        settle();
        assertNotSame(first, shown.bitmap(context, 50, 80));
        assertEquals(0, broken.get());

        // Gone: nothing to draw, and no decode asked for.
        SavedPicture.remove(context, NAME);
        assertNull(shown.bitmap(context, 50, 80));
        assertNull(shown.bitmap(null, 50, 80));
        assertNull(shown.bitmap(context, 0, 80));
    }

    /** A file that was damaged after it was saved goes, and the screen is told, so Telegram's look comes back. */
    @Test public void aDamagedFileFallsBackToNoPicture() throws Exception {
        File file = SavedPicture.file(context, NAME);
        File folder = file.getParentFile();
        assertTrue(folder.mkdirs() || folder.isDirectory());
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write("damaged".getBytes(StandardCharsets.UTF_8));
        }
        AtomicInteger landed = new AtomicInteger(), broken = new AtomicInteger();
        SavedPicture.Shown shown = new SavedPicture.Shown(NAME, landed::incrementAndGet, broken::incrementAndGet);
        assertTrue(shown.present(context));
        assertNull(shown.bitmap(context, 50, 80));
        settle();
        assertEquals(1, broken.get());
        assertEquals(0, landed.get());
        assertFalse(SavedPicture.present(context, NAME));
        assertFalse(shown.present(context));
        assertNull(shown.bitmap(context, 50, 80));
    }

    @Test public void drawingFillsTheBoundsFromThePicturesMiddle() {
        Bitmap wide = Bitmap.createBitmap(200, 100, Bitmap.Config.ARGB_8888);
        Canvas source = new Canvas(wide);
        Paint paint = new Paint();
        paint.setColor(Color.GREEN);
        source.drawRect(0, 0, 50, 100, paint);
        paint.setColor(Color.YELLOW);
        source.drawRect(50, 0, 150, 100, paint);
        paint.setColor(Color.GREEN);
        source.drawRect(150, 0, 200, 100, paint);
        Bitmap out = Bitmap.createBitmap(100, 100, Bitmap.Config.ARGB_8888);
        SavedPicture.drawFilling(new Canvas(out), wide, new Rect(0, 0, 100, 100), new Paint());
        // Only the yellow middle shows on a square.
        assertEquals(Color.YELLOW, out.getPixel(5, 50));
        assertEquals(Color.YELLOW, out.getPixel(95, 50));
    }
}
