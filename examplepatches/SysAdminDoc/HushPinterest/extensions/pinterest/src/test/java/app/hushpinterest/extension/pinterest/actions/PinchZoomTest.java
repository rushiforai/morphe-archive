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
import android.os.Looper;

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

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * Pinch to zoom only (#48): with the switch on, a pinch on a pin's picture opens it full screen in
 * the viewer and Pinterest is told to load nothing. The picture comes from a table, so nothing
 * reaches the network.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class PinchZoomTest {
    private static final String ORIGINAL = "https://i.pinimg.com/originals/pinched.png";
    private static final Map<String, Object> IMAGE_PIN = Map.of("id", "456", "images", Map.of("orig", Map.of(
            "url", ORIGINAL, "width", 1200, "height", 900)));

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<String> urls = new CopyOnWriteArrayList<>();
    private Activity activity;
    private PinTransfer.Connection previousConnection;

    @Before public void setUp() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        previousConnection = CopyImage.connection;
        byte[] picture = FileHostForTests.picture(40, 30, Bitmap.CompressFormat.PNG);
        CopyImage.connection = new PinTransfer.Connection() {
            @Override public HttpURLConnection open(URI uri) throws IOException {
                urls.add(uri.toString());
                return new FileHostForTests.Answer(uri.toURL(), ORIGINAL.equals(uri.toString()) ? 200 : 404,
                        new FileHostForTests.Body(ORIGINAL.equals(uri.toString()) ? picture : new byte[0]))
                        .header("Content-Type", "image/png").header("Content-Length", String.valueOf(picture.length));
            }
        };
    }

    @After public void tearDown() throws Exception {
        Dialog open = ShadowDialog.getLatestDialog();
        if (open != null) open.dismiss();
        settle();
        CopyImage.connection = previousConnection;
        Settings.PINCH_TO_ZOOM_ONLY.resetToDefault();
        PauseForTests.resume();
        Utils.setActivity(null);
    }

    @Test public void offByDefaultPinterestHandlesThePinch() {
        assertEquals("Pinterest goes on to its similar pins", 0, PinchZoom.pinch(IMAGE_PIN));
        assertNull("no viewer", ShadowDialog.getLatestDialog());
        assertTrue(urls.isEmpty());
    }

    @Test public void withTheSwitchOnAPinchOpensThePictureFullScreenAndPinterestLoadsNothing() throws Exception {
        Settings.PINCH_TO_ZOOM_ONLY.save(true);
        assertEquals("Pinterest stops", 1, PinchZoom.pinch(IMAGE_PIN));
        Dialog shown = ShadowDialog.getLatestDialog();
        assertTrue("the viewer opens at once", shown instanceof PinViewer.Screen);
        settle();
        PinViewer.Screen screen = (PinViewer.Screen) shown;
        assertTrue(screen.isShowing());
        assertNotNull("the pin's full-size picture", screen.picture.bitmap());
        assertEquals("only that picture is fetched", List.of(ORIGINAL), urls);
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("pinch opened the picture full screen"));
    }

    @Test public void aPinWithNoPictureToShowStillLoadsNothing() {
        Settings.PINCH_TO_ZOOM_ONLY.save(true);
        assertEquals("Pinterest stops, the pinch just springs back", 1, PinchZoom.pinch(null));
        assertNull(ShadowDialog.getLatestDialog());
        assertTrue(urls.isEmpty());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("pinch kept on the pin"));
    }

    @Test public void pausedPinterestHandlesThePinch() {
        Settings.PINCH_TO_ZOOM_ONLY.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(0, PinchZoom.pinch(IMAGE_PIN));
        assertNull(ShadowDialog.getLatestDialog());
        assertTrue(urls.isEmpty());
    }

    private void settle() throws Exception {
        for (int i = 0; i < 5; i++) {
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }
}
