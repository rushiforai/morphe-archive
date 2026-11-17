/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.os.Looper;
import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowToast;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.Function;

import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * The long-press View (#37): a pin's full-size picture full screen over Pinterest, fetched the way
 * Copy image fetches it, decoded small enough to draw, zoomable, and gone from the disk once shown.
 * Every answer comes from a table, so nothing reaches the network.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class PinViewerTest {
    private static final String ORIGINAL = "https://i.pinimg.com/originals/source.png";
    private static final Map<String, Object> IMAGE_PIN = Map.of("id", "123", "images", Map.of("orig", Map.of(
            "url", ORIGINAL, "width", 3000, "height", 2000)));

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Activity activity;
    private Table table;
    private final AtomicLong now = new AtomicLong(1_000_000L);
    private PinTransfer.Connection previousConnection;
    private java.util.function.LongSupplier previousClock;

    @Before public void setUp() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        table = new Table();
        previousConnection = CopyImage.connection;
        previousClock = CopyImage.clock;
        CopyImage.connection = table;
        CopyImage.clock = now::get;
        ShadowToast.reset();
        File[] left = CopiedImages.viewDir(activity).listFiles();
        if (left != null) for (File file : left) file.delete();
    }

    @After public void tearDown() throws Exception {
        Dialog open = ShadowDialog.getLatestDialog();
        if (open != null) open.dismiss();
        settle();
        CopyImage.connection = previousConnection;
        CopyImage.clock = previousClock;
        Utils.setActivity(null);
    }

    @Test public void aTapShowsTheFullSizePictureFullScreenAndKeepsNoCopy() throws Exception {
        table.picture(ORIGINAL, "image/png", FileHostForTests.picture(40, 30, Bitmap.CompressFormat.PNG));

        assertTrue(PinViewer.open(IMAGE_PIN, activity));
        PinViewer.Screen screen = screen();
        assertTrue("the screen opens at the tap", screen.isShowing());
        assertNull("the picture comes once it's fetched", screen.picture.bitmap());
        assertEquals(View.VISIBLE, screen.spinner.getVisibility());

        settle();
        Bitmap shown = screen.picture.bitmap();
        assertNotNull(shown);
        assertEquals(40, shown.getWidth());
        assertEquals(30, shown.getHeight());
        assertTrue(screen.isShowing());
        assertEquals(View.GONE, screen.spinner.getVisibility());
        assertEquals("the picture is the answer, no toast", 0, ShadowToast.shownToastCount());
        assertEquals("the full-size original, once", List.of(ORIGINAL), table.urls);
        assertEquals("nothing of it stays on disk", 0, CopiedImages.count(CopiedImages.viewDir(activity)));
        assertEquals("Close", String.valueOf(screen.close.getContentDescription()));
        assertTrue(screen.close.performClick());
        assertFalse(screen.isShowing());
    }

    /** A picture wider or taller than 4096 pixels is sampled down by powers of two until it fits. */
    @Test public void aHugePictureIsSampledDownSoItCanBeDrawn() throws Exception {
        assertEquals(1, PinViewer.sampleSize(3000, 2000));
        assertEquals(1, PinViewer.sampleSize(4096, 4096));
        assertEquals(2, PinViewer.sampleSize(4097, 100));
        assertEquals(2, PinViewer.sampleSize(100, 8192));
        assertEquals(4, PinViewer.sampleSize(8193, 10));
        assertEquals(8, PinViewer.sampleSize(20000, 1000));
        assertEquals(1, PinViewer.sampleSize(1, 1));

        table.picture(ORIGINAL, "image/png", FileHostForTests.picture(9000, 4, Bitmap.CompressFormat.PNG));
        assertTrue(PinViewer.open(IMAGE_PIN, activity));
        settle();
        Bitmap shown = screen().picture.bitmap();
        assertNotNull(shown);
        assertTrue("decoded at most 4096 wide, was " + shown.getWidth(), shown.getWidth() <= PinViewer.MAX_SIDE);
        assertTrue(shown.getWidth() >= 9000 / 4 - 1);
    }

    @Test public void aFailedFetchClosesTheScreenAndSaysWhy() throws Exception {
        assertTrue(PinViewer.open(IMAGE_PIN, activity));
        PinViewer.Screen missing = screen();
        settle();
        assertFalse(missing.isShowing());
        assertEquals("Couldn't open the image. Check your connection and try again.", ShadowToast.getTextOfLatestToast());

        table.picture(ORIGINAL, "image/png", "not a picture".getBytes(StandardCharsets.UTF_8));
        assertTrue(PinViewer.open(IMAGE_PIN, activity));
        PinViewer.Screen broken = screen();
        settle();
        assertFalse(broken.isShowing());
        assertEquals("Pinterest didn't send a usable image.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, CopiedImages.count(CopiedImages.viewDir(activity)));
    }

    @Test public void aSecondTapWhileOneLoadsIsToldSoAndTheNextOneWorks() throws Exception {
        table.picture(ORIGINAL, "image/png", FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG));
        assertTrue(PinViewer.open(IMAGE_PIN, activity));
        PinViewer.Screen first = screen();
        assertFalse(PinViewer.open(IMAGE_PIN, activity));
        assertEquals("Still getting the last image ready.", ShadowToast.getTextOfLatestToast());
        assertSame("no second screen", first, screen());
        settle();
        assertNotNull(first.picture.bitmap());
        first.dismiss();
        assertTrue(PinViewer.open(IMAGE_PIN, activity));
        assertNotSame(first, screen());
    }

    /** Back or Close before the picture lands: it's dropped quietly, and the next tap works. */
    @Test public void closingTheScreenBeforeThePictureLandsDropsIt() throws Exception {
        table.picture(ORIGINAL, "image/png", FileHostForTests.picture(8, 8, Bitmap.CompressFormat.PNG));
        assertTrue(PinViewer.open(IMAGE_PIN, activity));
        PinViewer.Screen screen = screen();
        screen.onBackPressed();
        assertFalse(screen.isShowing());
        settle();
        assertNull(screen.picture.bitmap());
        assertEquals(0, ShadowToast.shownToastCount());
        assertEquals(0, CopiedImages.count(CopiedImages.viewDir(activity)));
        assertTrue(PinViewer.open(IMAGE_PIN, activity));
    }

    @Test public void aVideoPinOrNoPinOpensNothing() throws Exception {
        Map<String, Object> video = Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "large", Map.of("url", "https://v.pinimg.com/large.mp4", "width", 1920, "height", 1080))));
        assertFalse(PinViewer.offered(PinMedia.resolve(video)));
        assertFalse(PinViewer.offered(null));
        assertTrue(PinViewer.offered(PinMedia.resolve(IMAGE_PIN)));
        assertFalse(PinViewer.open(video, activity));
        assertFalse(PinViewer.open(null, activity));
        assertFalse(PinViewer.open(IMAGE_PIN, null) && ShadowDialog.getLatestDialog() == null);
        settle();
        assertTrue("nothing was asked of the network for those", table.urls.stream().noneMatch(url -> url.contains(".mp4")));
    }

    /**
     * The picture starts fitted and centered. Pinching or a double tap zooms in up to six times that,
     * a drag never pulls an edge into the screen, and a double tap while zoomed fits it again.
     */
    @Test public void pinchDragAndDoubleTapStayInsideThePicture() {
        PinViewer.ZoomView view = new PinViewer.ZoomView(activity);
        view.setPicture(Bitmap.createBitmap(40, 30, Bitmap.Config.ARGB_8888));
        view.measure(View.MeasureSpec.makeMeasureSpec(400, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY));
        view.layout(0, 0, 400, 800);
        RectF fitted = view.shown();
        assertEquals(0f, fitted.left, 0.5f);
        assertEquals(400f, fitted.right, 0.5f);
        assertEquals("centered top to bottom", 800f - fitted.bottom, fitted.top, 0.5f);

        view.panBy(300, 300);
        assertEquals("a fitted picture doesn't move", fitted, view.shown());
        view.zoomBy(0.2f, 200, 400);
        assertEquals("never smaller than fitted", fitted, view.shown());

        view.zoomBy(100f, 200, 400);
        assertEquals("at most six times fitted", 400f * PinViewer.ZoomView.MOST, view.shown().width(), 1f);

        view.toggle(200, 400);
        assertEquals("a double tap while zoomed fits it again", fitted, view.shown());
        view.toggle(100, 400);
        float zoomed = view.shown().width();
        assertEquals(400f * PinViewer.ZoomView.DOUBLE_TAP, zoomed, 1f);
        view.panBy(10_000, 0);
        assertEquals("the left edge stops at the screen's", 0f, view.shown().left, 0.5f);
        view.panBy(-10_000, 0);
        assertEquals("the right edge stops at the screen's", 400f, view.shown().right, 0.5f);
        assertEquals(zoomed, view.shown().width(), 0.5f);
    }

    private PinViewer.Screen screen() {
        Dialog latest = ShadowDialog.getLatestDialog();
        assertTrue("the viewer's screen", latest instanceof PinViewer.Screen);
        return (PinViewer.Screen) latest;
    }

    private void settle() throws Exception {
        for (int i = 0; i < 5; i++) {
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private static final class Table implements PinTransfer.Connection {
        private final Map<String, Function<URL, FileHostForTests.Answer>> answers = new ConcurrentHashMap<>();
        final List<String> urls = new CopyOnWriteArrayList<>();

        void picture(String url, String type, byte[] bytes) {
            answers.put(url, address -> new FileHostForTests.Answer(address, 200, new FileHostForTests.Body(bytes))
                    .header("Content-Type", type).header("Content-Length", String.valueOf(bytes.length)));
        }

        @Override public java.net.HttpURLConnection open(java.net.URI uri) throws IOException {
            urls.add(uri.toString());
            Function<URL, FileHostForTests.Answer> answer = answers.get(uri.toString());
            return answer == null ? new FileHostForTests.Answer(uri.toURL(), 404, new FileHostForTests.Body(new byte[0]))
                    : answer.apply(uri.toURL());
        }
    }
}
