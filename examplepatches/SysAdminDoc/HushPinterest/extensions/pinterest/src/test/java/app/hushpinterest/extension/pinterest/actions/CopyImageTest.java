/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AppOpsManager;
import android.app.Application;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Looper;
import android.os.Process;
import android.provider.OpenableColumns;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowAppOpsManager;
import org.robolectric.shadows.ShadowToast;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.time.Duration;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.Function;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * Copy image (#11): the fetch within limits, the checks on type and bytes, the clip it sets, and the
 * provider that serves it. Every answer comes from a table; nothing reaches the network, and the
 * clock is the test's own.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CopyImageTest {
    private static final String ORIGINAL = "https://i.pinimg.com/originals/source.png";
    private static final Map<String, Object> IMAGE_PIN = Map.of("id", "123", "images", Map.of("orig", Map.of(
            "url", ORIGINAL, "width", 3000, "height", 2000)));
    private static final String TOAST_FAILED = "Couldn't copy the image. Check your connection and try again.";
    private static final String TOAST_KEPT = "The image wasn't copied, since the clipboard may have changed.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Application app;
    private ContentResolver resolver;
    private Table table;
    private final AtomicLong now = new AtomicLong(1_000_000L);
    private PinTransfer.Connection previousConnection;
    private java.util.function.LongSupplier previousClock;
    private ActivityController<Activity> screen;

    @Before public void setUp() {
        app = RuntimeEnvironment.getApplication();
        resolver = app.getContentResolver();
        ProviderInfo info = new ProviderInfo();
        info.authority = app.getPackageName() + ".hushpinterest.share";
        info.name = SharePreviewProvider.class.getName();
        info.packageName = app.getPackageName();
        info.grantUriPermissions = true;
        Shadows.shadowOf(app.getPackageManager()).addOrUpdateProvider(info);
        Robolectric.buildContentProvider(SharePreviewProvider.class).create(info);
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.COPY_IMAGE));
        Settings.DOWNLOAD_PINS.save(true);
        Settings.COPY_IMAGE.save(true);
        table = new Table();
        previousConnection = CopyImage.connection;
        previousClock = CopyImage.clock;
        CopyImage.connection = table;
        CopyImage.clock = now::get;
        ShadowToast.reset();
        File dir = CopiedImages.dir(app);
        File[] left = dir == null ? null : dir.listFiles();
        if (left != null) for (File file : left) file.delete();
        // A tap happens on a Pinterest screen that has focus, the only time Android lets it read
        // the clipboard.
        screen = Robolectric.buildActivity(Activity.class).setup().windowFocusChanged(true);
        Utils.setActivity(screen.get());
        assertTrue(screen.get().hasWindowFocus());
    }

    @After public void tearDown() {
        Utils.setActivity(null);
        screen.pause().stop().destroy();
        CopyImage.connection = previousConnection;
        CopyImage.clock = previousClock;
        Settings.COPY_IMAGE.save(false);
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
    }

    @Test public void anImageIsFetchedWholeKeptInTheOwnedFolderAndPutOnTheClipboardAsAPicture() throws Exception {
        byte[] png = FileHostForTests.picture(40, 30, Bitmap.CompressFormat.PNG);
        table.picture(ORIGINAL, "image/png", png);
        clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));

        CopyImage.Mark tapped = tap();
        CopyImage.Fetch fetched = CopyImage.fetch(app, media());
        assertEquals(CopyImage.Result.COPIED, fetched.result);
        assertEquals("image/png", fetched.mime);
        assertNotNull(fetched.file);
        assertEquals(CopiedImages.dir(app), fetched.file.getParentFile());
        assertTrue(fetched.file.getName(), fetched.file.getName().matches("[0-9a-f]{32}\\.png"));
        assertArrayEquals(png, Files.readAllBytes(fetched.file.toPath()));
        assertEquals("nothing reaches the clipboard until the file is in place", "kept text", copiedText());

        FileHostForTests.Answer asked = table.asked.get(0);
        assertEquals(ORIGINAL, asked.address());
        assertEquals("GET", asked.method());
        assertNull("the whole file, not a range", asked.getRequestProperty("Range"));
        assertFalse(asked.followsRedirects());
        assertTrue(asked.disconnected);

        assertEquals(CopyImage.Result.COPIED, CopyImage.publish(app, fetched, tapped));
        ClipData clip = clipboard().getPrimaryClip();
        assertEquals(1, clip.getItemCount());
        Uri uri = clip.getItemAt(0).getUri();
        assertEquals("content://" + app.getPackageName() + ".hushpinterest.share/clip/" + fetched.file.getName(), uri.toString());
        assertEquals(1, clip.getDescription().getMimeTypeCount());
        assertEquals("image/png", clip.getDescription().getMimeType(0));
        assertEquals("image/png", resolver.getType(uri));
        assertEquals(Arrays.asList("image/png"), Arrays.asList(resolver.getStreamTypes(uri, "image/*")));
        try (InputStream in = resolver.openInputStream(uri)) {
            assertArrayEquals(png, in.readAllBytes());
        }
        try (Cursor row = resolver.query(uri, null, null, null, null)) {
            assertTrue(row.moveToFirst());
            assertEquals(fetched.file.getName(), row.getString(row.getColumnIndexOrThrow(OpenableColumns.DISPLAY_NAME)));
            assertEquals(png.length, row.getLong(row.getColumnIndexOrThrow(OpenableColumns.SIZE)));
        }
        assertEquals("Image copied.", ShadowToast.getTextOfLatestToast());
        assertEquals(1, ShadowToast.shownToastCount());
    }

    @Test public void aJpgTypeHeaderOverJpegBytesIsAJpeg() throws Exception {
        byte[] jpeg = FileHostForTests.picture(40, 30, Bitmap.CompressFormat.JPEG);
        table.picture(ORIGINAL, "image/jpg", jpeg);
        CopyImage.Fetch fetched = CopyImage.fetch(app, media());
        assertEquals(CopyImage.Result.COPIED, fetched.result);
        assertEquals("image/jpeg", fetched.mime);
        assertTrue(fetched.file.getName().endsWith(".jpg"));
    }

    @Test public void webpAndGifBytesAreKnownByTheirFirstBytes() {
        byte[] webp = "RIFF\u0000\u0000\u0000\u0000WEBPVP8 ".getBytes(StandardCharsets.ISO_8859_1);
        assertEquals("image/webp", CopyImage.sniff(webp, webp.length));
        assertEquals("image/gif", CopyImage.sniff("GIF89a\u0001\u0000".getBytes(StandardCharsets.ISO_8859_1), 8));
        assertEquals("image/gif", CopyImage.sniff("GIF87a\u0001\u0000".getBytes(StandardCharsets.ISO_8859_1), 8));
        assertNull(CopyImage.sniff("RIFF\u0000\u0000\u0000\u0000WAVEfmt ".getBytes(StandardCharsets.ISO_8859_1), 16));
        assertNull(CopyImage.sniff("<html>".getBytes(StandardCharsets.ISO_8859_1), 6));
        assertNull(CopyImage.sniff(new byte[]{(byte) 0xff, (byte) 0xd8}, 2));
        assertNull(CopyImage.sniff(new byte[0], 0));
    }

    @Test public void aStandInSizeIsReplacedByTheOriginalTheMediaHostHas() throws Exception {
        try (MediaHostForTests media = MediaHostForTests.install()) {
            media.answer(MediaHostForTests.ORIGINALS + ".jpg", 200, "image/jpeg");
            byte[] jpeg = FileHostForTests.picture(40, 30, Bitmap.CompressFormat.JPEG);
            table.picture(MediaHostForTests.ORIGINALS + ".jpg", "image/jpeg", jpeg);
            Map<String, Object> pin = Map.of("id", "123", "images", Map.of("736x", Map.of("url", MediaHostForTests.STAND_IN)));
            CopyImage.Fetch fetched = CopyImage.fetch(app, PinMedia.resolve(pin));
            assertEquals(CopyImage.Result.COPIED, fetched.result);
            assertEquals(MediaHostForTests.ORIGINALS + ".jpg", table.asked.get(0).address());
            assertArrayEquals(jpeg, Files.readAllBytes(fetched.file.toPath()));
        }
    }

    @Test public void aFileDeclaredOverTheLimitIsTurnedAwayBeforeAnyOfItIsRead() throws Exception {
        FileHostForTests.Body body = new FileHostForTests.Body(FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG));
        table.answer(ORIGINAL, url -> new FileHostForTests.Answer(url, 200, body).header("Content-Type", "image/png")
                .header("Content-Length", String.valueOf(CopyImage.MAX_BYTES + 1)));
        clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));
        CopyImage.Fetch fetched = CopyImage.fetch(app, media());
        assertEquals(CopyImage.Result.TOO_LARGE, fetched.result);
        assertEquals(0, body.served);
        assertNull(fetched.file);
        assertEquals(0, ownedFiles());
        CopyImage.publish(app, fetched, tap());
        assertEquals("That image is too big to copy.", ShadowToast.getTextOfLatestToast());
        assertEquals("kept text", copiedText());
    }

    @Test public void aTypeThatIsntAPictureIsTurnedAwayWithoutReadingTheBody() throws Exception {
        for (String type : new String[]{"text/html", "application/xml", "application/octet-stream", "image/svg+xml", "video/mp4", null}) {
            ShadowToast.reset();
            FileHostForTests.Body body = new FileHostForTests.Body(FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG));
            table.answer(ORIGINAL, url -> {
                FileHostForTests.Answer answer = new FileHostForTests.Answer(url, 200, body);
                return type == null ? answer : answer.header("Content-Type", type);
            });
            clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));
            CopyImage.Fetch fetched = CopyImage.fetch(app, media());
            assertEquals(String.valueOf(type), CopyImage.Result.NOT_IMAGE, fetched.result);
            assertEquals(String.valueOf(type), 0, body.served);
            assertEquals(0, ownedFiles());
            CopyImage.publish(app, fetched, tap());
            assertEquals("Pinterest didn't send a usable image.", ShadowToast.getTextOfLatestToast());
            assertEquals("kept text", copiedText());
        }
    }

    @Test public void aPictureTypeOverBytesThatAreNotThatPictureIsTurnedAway() throws Exception {
        byte[] jpeg = FileHostForTests.picture(16, 16, Bitmap.CompressFormat.JPEG);
        byte[] png = FileHostForTests.picture(16, 16, Bitmap.CompressFormat.PNG);
        byte[][] bodies = {"<html>not a picture</html>".getBytes(StandardCharsets.UTF_8), jpeg, new byte[0]};
        String[] declared = {"image/png", "image/png", "image/png"};
        for (int i = 0; i < bodies.length; i++) {
            table.picture(ORIGINAL, declared[i], bodies[i]);
            CopyImage.Fetch fetched = CopyImage.fetch(app, media());
            assertEquals("case " + i, CopyImage.Result.NOT_IMAGE, fetched.result);
            assertEquals("case " + i, 0, ownedFiles());
        }
        table.picture(ORIGINAL, "image/jpeg", png);
        assertEquals("a PNG called a JPEG", CopyImage.Result.NOT_IMAGE, CopyImage.fetch(app, media()).result);
        assertEquals(0, ownedFiles());
    }

    @Test public void aHostThatTakesTooLongGivesATimeoutAndLeavesTheClipboardAlone() throws Exception {
        clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));
        table.answer(ORIGINAL, url -> new FileHostForTests.Answer(url, 200, new FileHostForTests.Body(new byte[0]))
                .failing(new SocketTimeoutException("slow")));
        CopyImage.Fetch refused = CopyImage.fetch(app, media());
        assertEquals(CopyImage.Result.TIMED_OUT, refused.result);
        CopyImage.publish(app, refused, tap());
        assertEquals("Copying the image took too long. Try again.", ShadowToast.getTextOfLatestToast());
        assertEquals("kept text", copiedText());

        // A body that trickles in past the 30 second budget.
        byte[] png = FileHostForTests.padded(FileHostForTests.picture(40, 30, Bitmap.CompressFormat.PNG), 200_000);
        table.answer(ORIGINAL, url -> new FileHostForTests.Answer(url, 200,
                new FileHostForTests.Body(png, 4096, () -> now.addAndGet(5_000))).header("Content-Type", "image/png"));
        CopyImage.Fetch slow = CopyImage.fetch(app, media());
        assertEquals(CopyImage.Result.TIMED_OUT, slow.result);
        assertEquals("the half-written file is deleted", 0, ownedFiles());
        assertEquals("kept text", copiedText());
    }

    @Test public void aFailedOrRefusedFetchSaysSoAndChangesNothing() throws Exception {
        clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));
        table.answer(ORIGINAL, url -> new FileHostForTests.Answer(url, 200, new FileHostForTests.Body(new byte[0]))
                .failing(new IOException("connection reset")));
        CopyImage.Fetch reset = CopyImage.fetch(app, media());
        assertEquals(CopyImage.Result.FAILED, reset.result);
        CopyImage.publish(app, reset, tap());
        assertEquals(TOAST_FAILED, ShadowToast.getTextOfLatestToast());

        for (int status : new int[]{403, 404, 500, 301, 206}) {
            ShadowToast.reset();
            table.answer(ORIGINAL, url -> new FileHostForTests.Answer(url, status, new FileHostForTests.Body(
                    FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG))).header("Content-Type", "image/png"));
            CopyImage.Fetch refused = CopyImage.fetch(app, media());
            assertEquals("status " + status, CopyImage.Result.FAILED, refused.result);
            CopyImage.publish(app, refused, tap());
            assertEquals(TOAST_FAILED, ShadowToast.getTextOfLatestToast());
        }
        assertEquals(0, ownedFiles());
        assertEquals("kept text", copiedText());
    }

    @Test public void anEncodedBodyIsRefused() throws Exception {
        table.answer(ORIGINAL, url -> new FileHostForTests.Answer(url, 200, new FileHostForTests.Body(
                FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG))).header("Content-Type", "image/png")
                .header("Content-Encoding", "gzip"));
        assertEquals(CopyImage.Result.FAILED, CopyImage.fetch(app, media()).result);
        assertEquals(0, ownedFiles());
    }

    @Test public void aSecondCopyReplacesTheFirstClipAndItsFile() throws Exception {
        byte[] first = FileHostForTests.picture(40, 30, Bitmap.CompressFormat.PNG);
        byte[] second = FileHostForTests.picture(30, 40, Bitmap.CompressFormat.JPEG);
        table.picture(ORIGINAL, "image/png", first);
        CopyImage.Mark askedOne = tap();
        CopyImage.Fetch one = CopyImage.fetch(app, media());
        CopyImage.settle(one, CopyImage.publish(app, one, askedOne));
        Uri firstUri = clipboard().getPrimaryClip().getItemAt(0).getUri();
        assertTrue(one.file.isFile());

        table.picture(ORIGINAL, "image/jpeg", second);
        CopyImage.Mark askedTwo = tap();
        CopyImage.Fetch two = CopyImage.fetch(app, media());
        assertTrue("the newest clip stays readable while the next copy fetches", one.file.isFile());
        CopyImage.Result shown = CopyImage.publish(app, two, askedTwo);
        assertTrue("setting the clip on the main thread deletes nothing", one.file.isFile());
        CopyImage.settle(two, shown);
        Uri secondUri = clipboard().getPrimaryClip().getItemAt(0).getUri();
        assertNotEquals(firstUri, secondUri);
        assertEquals("image/jpeg", clipboard().getPrimaryClip().getDescription().getMimeType(0));
        assertFalse(one.file.exists());
        assertTrue(two.file.isFile());
        assertEquals(1, ownedFiles());
        try (InputStream in = resolver.openInputStream(secondUri)) {
            assertArrayEquals(second, in.readAllBytes());
        }
        try {
            resolver.openInputStream(firstUri).close();
            fail("the replaced picture is gone");
        } catch (FileNotFoundException expected) {
            // The first clip's file was deleted with the second copy.
        }
    }

    @Test public void onlyFilesTheFeatureOwnsAreCleaned() throws Exception {
        File dir = CopiedImages.dir(app);
        File stranger = new File(dir, "holiday.png");
        File notes = new File(dir, "notes.txt");
        File shortName = new File(dir, "0123456789abcdef.png");
        File stale = new File(dir, "0123456789abcdef0123456789abcdef.part");
        File old = new File(dir, "fedcba9876543210fedcba9876543210.jpg");
        for (File file : new File[]{stranger, notes, shortName, stale, old}) Files.write(file.toPath(), new byte[]{1});
        table.picture(ORIGINAL, "image/png", FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG));
        CopyImage.Mark asked = tap();
        CopyImage.Fetch fetched = CopyImage.fetch(app, media());
        assertFalse("a part left by a dead copy goes", stale.exists());
        CopyImage.settle(fetched, CopyImage.publish(app, fetched, asked));
        assertFalse("an older copy goes", old.exists());
        assertTrue(stranger.exists());
        assertTrue(notes.exists());
        assertTrue(shortName.exists());
        assertEquals(1, ownedFiles());
        assertTrue(fetched.file.isFile());
    }

    @Test public void switchedOffOrPausedMeansNoRowNoStartAndNoClip() throws Exception {
        PinMedia.Resolution image = media();
        assertTrue(CopyImage.offered(image));
        Settings.COPY_IMAGE.save(false);
        assertFalse(CopyImage.offered(image));
        assertFalse(CopyImage.start(IMAGE_PIN, app));
        Settings.COPY_IMAGE.save(true);
        Settings.DOWNLOAD_PINS.save(false);
        assertFalse("Download pins off takes Copy image with it", CopyImage.offered(image));
        Settings.DOWNLOAD_PINS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
        assertFalse("a build without the patch has no Copy image", CopyImage.offered(image));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.COPY_IMAGE));
        assertFalse("and Download pins must be patched in too", CopyImage.offered(image));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.COPY_IMAGE));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(CopyImage.offered(image));
        assertFalse(CopyImage.start(IMAGE_PIN, app));
        PauseForTests.resume();
        assertTrue(CopyImage.offered(image));
        assertTrue("nothing was asked of the network", table.asked.isEmpty());
    }

    @Test public void aVideoOrAnUnusablePinGetsNoRow() {
        PinMedia.Resolution video = PinMedia.resolve(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "large", Map.of("url", "https://v.pinimg.com/large.mp4", "width", 1920, "height", 1080)))));
        assertNotNull(video.source);
        assertFalse(CopyImage.offered(video));
        assertFalse(CopyImage.offered(null));
        assertFalse(CopyImage.offered(PinMedia.resolve(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://example.invalid/x.png"))))));
        assertFalse(CopyImage.start(Map.of("id", "123"), app));
    }

    @Test public void switchedOffWhileItFetchedDiscardsThePictureAndSetsNoClip() throws Exception {
        table.picture(ORIGINAL, "image/png", FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG));
        clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));
        CopyImage.Mark asked = tap();
        CopyImage.Fetch fetched = CopyImage.fetch(app, media());
        Settings.COPY_IMAGE.save(false);
        assertEquals(CopyImage.Result.SKIPPED, CopyImage.publish(app, fetched, asked));
        CopyImage.settle(fetched, CopyImage.Result.SKIPPED);
        assertFalse(fetched.file.exists());
        assertEquals("kept text", copiedText());
        assertEquals(0, ShadowToast.shownToastCount());
    }

    @Test public void aTapRunsTheWholeCopyAndToastsOnlyAfterTheClipIsSet() throws Exception {
        byte[] png = FileHostForTests.picture(40, 30, Bitmap.CompressFormat.PNG);
        table.picture(ORIGINAL, "image/png", png);
        assertTrue(CopyImage.start(IMAGE_PIN, app));
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        // The tidy-up after the clip runs on a worker, and the next copy waits for it.
        Utils.awaitBackgroundTasksForTests();
        ClipData clip = clipboard().getPrimaryClip();
        assertNotNull(clip);
        Uri uri = clip.getItemAt(0).getUri();
        assertEquals("image/png", clip.getDescription().getMimeType(0));
        try (InputStream in = resolver.openInputStream(uri)) {
            assertArrayEquals(png, in.readAllBytes());
        }
        assertEquals("Image copied.", ShadowToast.getTextOfLatestToast());

        // Failure through the same path.
        ShadowToast.reset();
        table.answer(ORIGINAL, url -> new FileHostForTests.Answer(url, 404, new FileHostForTests.Body(new byte[0])));
        assertTrue(CopyImage.start(IMAGE_PIN, app));
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Utils.awaitBackgroundTasksForTests();
        assertEquals(TOAST_FAILED, ShadowToast.getTextOfLatestToast());
        assertEquals("the failed copy left the last clip alone", uri, clipboard().getPrimaryClip().getItemAt(0).getUri());
        assertTrue(new File(CopiedImages.dir(app), uri.getLastPathSegment()).isFile());
    }

    @Test public void aSecondTapWhileACopyIsUnderwayIsToldSoUntilTheFirstIsTidied() throws Exception {
        byte[] png = FileHostForTests.picture(40, 30, Bitmap.CompressFormat.PNG);
        table.picture(ORIGINAL, "image/png", png);
        assertTrue(CopyImage.start(IMAGE_PIN, app));
        assertFalse(CopyImage.start(IMAGE_PIN, app));
        assertEquals("Still copying the last image.", ShadowToast.getTextOfLatestToast());

        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Utils.awaitBackgroundTasksForTests();
        assertNotNull(clipboard().getPrimaryClip());
        assertEquals("one tap, one fetch", 1, table.asked.size());
        assertTrue("free again once the first copy is tidied", CopyImage.start(IMAGE_PIN, app));
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Utils.awaitBackgroundTasksForTests();
        assertEquals(1, ownedFiles());
    }

    @Test public void aCopyMadeWhileThePictureLoadsIsKeptAndThePictureDropped() throws Exception {
        ClipData text = ClipData.newPlainText("note", "copied while it loaded");
        ClipData picture = new ClipData(new ClipDescription("Photo", new String[]{"image/jpeg"}),
                new ClipData.Item(Uri.parse("content://another.app/photo.jpg")));
        // The same label and type as the clip at the tap: only Android's stamp tells them apart.
        ClipData sameShape = ClipData.newPlainText("before", "another text");
        for (ClipData newer : new ClipData[]{text, picture, sameShape}) {
            ShadowToast.reset();
            clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));
            copyWhile(() -> {
                Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(5));
                clipboard().setPrimaryClip(newer);
            });
            ClipData clip = clipboard().getPrimaryClip();
            String which = String.valueOf(newer.getDescription().getLabel());
            assertEquals(which, newer.getDescription().getMimeType(0), clip.getDescription().getMimeType(0));
            assertEquals(which, String.valueOf(newer.getItemAt(0).getText()), String.valueOf(clip.getItemAt(0).getText()));
            assertEquals(which, newer.getItemAt(0).getUri(), clip.getItemAt(0).getUri());
            assertEquals(which, TOAST_KEPT, ShadowToast.getTextOfLatestToast());
            assertEquals(which + ": the dropped picture is deleted", 0, ownedFiles());
        }
        assertEquals(3, table.asked.size());

        // Nothing copied meanwhile: the next tap puts the picture over the same clip as usual.
        clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));
        copyWhile(() -> { });
        assertCopiedPicture();
    }

    @Test public void aClipboardItCantReadIsLeftAloneAndThePictureDropped() throws Exception {
        // Cleared while the picture loaded, which is also how Android answers once it stops letting
        // Pinterest read.
        clipboard().setPrimaryClip(ClipData.newPlainText("before", "kept text"));
        copyWhile(() -> clipboard().clearPrimaryClip());
        assertFalse(clipboard().hasPrimaryClip());
        assertEquals(TOAST_KEPT, ShadowToast.getTextOfLatestToast());
        assertEquals(0, ownedFiles());

        // Empty at the tap, then Pinterest lost focus: an empty answer could hide a newer copy.
        ShadowToast.reset();
        copyWhile(() -> screen.windowFocusChanged(false));
        assertFalse(clipboard().hasPrimaryClip());
        assertEquals(TOAST_KEPT, ShadowToast.getTextOfLatestToast());
        assertEquals(0, ownedFiles());

        // No Pinterest screen known at all.
        ShadowToast.reset();
        screen.windowFocusChanged(true);
        Utils.setActivity(null);
        copyWhile(() -> { });
        assertFalse(clipboard().hasPrimaryClip());
        assertEquals(TOAST_KEPT, ShadowToast.getTextOfLatestToast());
        assertEquals(0, ownedFiles());

        // Focused, but the clipboard app op turns Pinterest away (`appops set ... READ_CLIPBOARD
        // ignore`, or a phone's own clipboard permission): Android answers empty there too.
        Utils.setActivity(screen.get());
        ShadowToast.reset();
        ShadowAppOpsManager ops = Shadows.shadowOf((AppOpsManager) app.getSystemService(Context.APP_OPS_SERVICE));
        ops.setMode("android:read_clipboard", Process.myUid(), app.getPackageName(), AppOpsManager.MODE_IGNORED);
        copyWhile(() -> { });
        assertFalse(clipboard().hasPrimaryClip());
        assertEquals(TOAST_KEPT, ShadowToast.getTextOfLatestToast());
        assertEquals(0, ownedFiles());
        ops.setMode("android:read_clipboard", Process.myUid(), app.getPackageName(), AppOpsManager.MODE_ALLOWED);

        // The same empty clipboard while Pinterest has focus and may read takes the picture.
        copyWhile(() -> { });
        assertCopiedPicture();
    }

    @Test public void theProviderServesOnlyTheOwnedFolderAndOnlyToReaders() throws Exception {
        File dir = CopiedImages.dir(app);
        File picture = new File(dir, "0123456789abcdef0123456789abcdef.png");
        Files.write(picture.toPath(), FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG));
        File outside = new File(app.getCacheDir(), "secret.png");
        Files.write(outside.toPath(), new byte[]{1, 2, 3});
        File part = new File(dir, "0123456789abcdef0123456789abcdef.part");
        Files.write(part.toPath(), new byte[]{1});
        String base = "content://" + app.getPackageName() + ".hushpinterest.share/";

        assertEquals("image/png", resolver.getType(Uri.parse(base + "clip/" + picture.getName())));
        resolver.openInputStream(Uri.parse(base + "clip/" + picture.getName())).close();
        for (String bad : new String[]{"clip/secret.png", "clip/" + part.getName(), "clip/..%2Fsecret.png",
                "clip/%2E%2E/secret.png", "clip/fedcba9876543210fedcba9876543210.png", "clip",
                "clip/" + picture.getName() + "/extra", "clip/0123456789ABCDEF0123456789ABCDEF.png"}) {
            Uri uri = Uri.parse(base + bad);
            assertNull(bad, resolver.getType(uri));
            try {
                resolver.openInputStream(uri).close();
                fail("served " + bad);
            } catch (FileNotFoundException | SecurityException expected) {
                // Refused.
            }
        }
        for (String mode : new String[]{"w", "rw", "wt", "rwt"}) {
            try {
                resolver.openFileDescriptor(Uri.parse(base + "clip/" + picture.getName()), mode).close();
                fail("opened for " + mode);
            } catch (SecurityException expected) {
                // Read-only.
            }
        }
        assertTrue(outside.exists());
        assertNull("the picture's address is a clip address only", SharePreviewProvider.clipUri(app, "secret.png"));
        assertNull(SharePreviewProvider.clipUri(app, part.getName()));
        assertNotNull(SharePreviewProvider.clipUri(app, picture.getName()));
    }

    private PinMedia.Resolution media() {
        PinMedia.Resolution media = PinMedia.resolve(IMAGE_PIN);
        assertNotNull(media);
        assertNotNull(media.source);
        return media;
    }

    private ClipboardManager clipboard() {
        return (ClipboardManager) app.getSystemService(Context.CLIPBOARD_SERVICE);
    }

    /** What start() notes when the row is tapped. */
    private CopyImage.Mark tap() {
        return CopyImage.Mark.read(app);
    }

    /**
     * Taps Copy image with a fetch that waits until [meanwhile] has run on the main thread, then
     * lets the copy finish, tidy-up included.
     */
    private void copyWhile(Runnable meanwhile) throws Exception {
        byte[] png = FileHostForTests.picture(40, 30, Bitmap.CompressFormat.PNG);
        CountDownLatch fetching = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        table.answer(ORIGINAL, url -> {
            fetching.countDown();
            try {
                if (!release.await(10, TimeUnit.SECONDS)) throw new AssertionError("the fetch was never released");
            } catch (InterruptedException interrupted) {
                throw new AssertionError(interrupted);
            }
            return new FileHostForTests.Answer(url, 200, new FileHostForTests.Body(png))
                    .header("Content-Type", "image/png").header("Content-Length", String.valueOf(png.length));
        });
        assertTrue(CopyImage.start(IMAGE_PIN, app));
        assertTrue("the fetch started", fetching.await(10, TimeUnit.SECONDS));
        meanwhile.run();
        release.countDown();
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Utils.awaitBackgroundTasksForTests();
    }

    private void assertCopiedPicture() throws IOException {
        ClipData clip = clipboard().getPrimaryClip();
        assertNotNull(clip);
        assertEquals("image/png", clip.getDescription().getMimeType(0));
        try (InputStream in = resolver.openInputStream(clip.getItemAt(0).getUri())) {
            assertTrue(in.readAllBytes().length > 0);
        }
        assertEquals("Image copied.", ShadowToast.getTextOfLatestToast());
        assertEquals(1, ownedFiles());
    }

    private String copiedText() {
        ClipData clip = clipboard().getPrimaryClip();
        return clip == null ? null : String.valueOf(clip.getItemAt(0).getText());
    }

    private int ownedFiles() {
        File dir = CopiedImages.dir(app);
        return dir == null ? 0 : CopiedImages.count(dir);
    }

    /** Answers the fetch from a table. An address with no answer gets a 404. */
    private static final class Table implements PinTransfer.Connection {
        private final Map<String, Function<URL, FileHostForTests.Answer>> answers = new java.util.concurrent.ConcurrentHashMap<>();
        final List<FileHostForTests.Answer> asked = new CopyOnWriteArrayList<>();

        void answer(String url, Function<URL, FileHostForTests.Answer> answer) {
            answers.put(url, answer);
        }

        void picture(String url, String type, byte[] bytes) {
            answer(url, address -> new FileHostForTests.Answer(address, 200, new FileHostForTests.Body(bytes))
                    .header("Content-Type", type).header("Content-Length", String.valueOf(bytes.length)));
        }

        @Override public java.net.HttpURLConnection open(java.net.URI uri) throws IOException {
            Function<URL, FileHostForTests.Answer> answer = answers.get(uri.toString());
            FileHostForTests.Answer opened = answer == null
                    ? new FileHostForTests.Answer(uri.toURL(), 404, new FileHostForTests.Body(new byte[0]))
                    : answer.apply(uri.toURL());
            asked.add(opened);
            return opened;
        }
    }
}
