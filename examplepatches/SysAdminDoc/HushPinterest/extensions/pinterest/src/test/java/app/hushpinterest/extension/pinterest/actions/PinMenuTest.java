/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DownloadManager;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowToast;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/** Exercises the native-row bridge with local supplied models, without downloading a file. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = PinMenuTest.NativeMenu.class)
public class PinMenuTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Activity activity;

    @Before public void prepare() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
        Settings.DOWNLOAD_PINS.save(true);
        ShadowAlertDialog.reset();
    }

    @After public void reset() {
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        if (dialog != null) dialog.dismiss();
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Utils.setActivity(null);
    }

    @Test public void supportedImageOffersOptionalSuppliedDetailsWithoutStartingADownload() {
        Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.png", "width", 3000, "height", 2000))));
        PinDownloads.attach(host);
        PinDownloads.attach(host);
        assertEquals(3, host.layout.getChildCount());
        assertEquals("Download pin", ((TextView) host.layout.getChildAt(0)).getText());
        assertEquals("Copy media link", ((TextView) host.layout.getChildAt(1)).getText());
        assertEquals("Supplied media details", ((TextView) host.layout.getChildAt(2)).getText());
        assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
        String text = details();
        assertTrue(text, text.contains("Supplied width: 3000 pixels"));
        assertTrue(text, text.contains("Supplied height: 2000 pixels"));
        assertTrue(text, text.contains("Supplied URL type: image/png"));
        assertTrue(text, text.contains("The file hasn't been inspected."));
        assertEquals(0, host.dismissed);
        assertNoDownload();
    }

    @Test public void mp4DetailsBelongToTheSelectedSuppliedVideo() {
        Host host = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "small", Map.of("url", "https://v.pinimg.com/small.mp4", "width", 640, "height", 360),
                "large", Map.of("url", "https://v.pinimg.com/large.mp4", "width", 1920, "height", 1080),
                "adaptive", Map.of("url", "https://v.pinimg.com/master.m3u8", "width", 3840, "height", 2160)))));
        PinDownloads.attach(host);
        assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
        String text = details();
        assertTrue(text, text.contains("Supplied width: 1920 pixels"));
        assertTrue(text, text.contains("Supplied height: 1080 pixels"));
        assertTrue(text, text.contains("Supplied URL type: video/mp4"));
        assertFalse(text, text.contains("3840"));
        assertNoDownload();
    }

    @Test public void adaptiveOnlyPinGetsAnAccessibleExplanationAndNeverDownloadsItsThumbnail() {
        Host host = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "adaptive", Map.of("url", "https://v.pinimg.com/master.m3u8"))), "images", Map.of(
                "orig", Map.of("url", "https://i.pinimg.com/originals/thumbnail.jpg"))));
        PinDownloads.attach(host);
        assertEquals(1, host.layout.getChildCount());
        View row = host.layout.findViewWithTag(PinDownloads.ROW_TAG);
        assertEquals("Download unavailable", ((TextView) row).getText());
        assertTrue(row.isEnabled());
        assertTrue(row.isFocusable());
        assertTrue(row.getContentDescription().toString().contains("adaptive video stream"));
        assertTrue(row.performClick());
        assertTrue(details().contains("Pinterest supplied an adaptive video stream, but no downloadable MP4."));
        assertEquals(0, host.dismissed);
        assertNoDownload();
    }

    @Test public void missingDimensionsStayUnknownInTheOptionalDetails() {
        Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.jpg"))));
        PinDownloads.attach(host);
        assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
        assertTrue(details().contains("Supplied width: Unknown"));
        assertTrue(details().contains("Supplied height: Unknown"));
        assertNoDownload();
    }

    @Test public void unknownModelsAndBoardCoversGetNoInjectedAction() {
        for (Object model : new Object[]{null, new Object(), Map.of("id", "123"), new PinMediaTest.BoardCover()}) {
            Host host = host(model);
            PinDownloads.attach(host);
            assertEquals(0, host.layout.getChildCount());
        }
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
        assertNoDownload();
    }

    @Test public void offPauseAbsentCapabilityAndColdStartLeaveNativeMenuAlone() {
        Object pin = Map.of("id", "123", "images", Map.of());
        Settings.DOWNLOAD_PINS.save(false);
        Host off = host(pin);
        PinDownloads.attach(off);
        assertEquals(0, off.layout.getChildCount());
        Settings.DOWNLOAD_PINS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        Host paused = host(pin);
        PinDownloads.attach(paused);
        assertEquals(0, paused.layout.getChildCount());
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        Host absent = host(pin);
        PinDownloads.attach(absent);
        assertEquals(0, absent.layout.getChildCount());
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
        Host cold = host(pin);
        SettingsContextRule.withoutContext(() -> PinDownloads.attach(cold));
        assertEquals(0, cold.layout.getChildCount());
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
        assertNoDownload();
    }

    @Test public void copyMediaLinkCopiesTheSelectedSuppliedMp4AndClosesTheMenu() {
        Host host = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "small", Map.of("url", "https://v.pinimg.com/small.mp4", "width", 640, "height", 360),
                "large", Map.of("url", "https://v.pinimg.com/large.mp4", "width", 1920, "height", 1080),
                "adaptive", Map.of("url", "https://v.pinimg.com/master.m3u8", "width", 3840, "height", 2160)))));
        PinDownloads.attach(host);
        assertTrue(host.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("https://v.pinimg.com/large.mp4", String.valueOf(clipboard().getPrimaryClip().getItemAt(0).getText()));
        assertEquals("Media link copied.", ShadowToast.getTextOfLatestToast());
        assertEquals(1, host.dismissed);
        assertNoDownload();
    }

    @Test public void copyMediaLinkReadsThePinAgainAndNeverCopiesAnUnsupportedLink() {
        Map<String, Object> image = new HashMap<>();
        image.put("url", "https://i.pinimg.com/originals/source.jpg");
        Host host = host(Map.of("id", "123", "images", Map.of("orig", image)));
        PinDownloads.attach(host);
        image.put("url", "https://example.com/elsewhere.jpg");
        assertTrue(host.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertFalse(clipboard().hasPrimaryClip());
        assertEquals("The supplied media link isn't a supported public Pinterest link.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, host.dismissed);
    }

    @Test public void unavailablePinsGetNoCopyRow() {
        Host host = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "adaptive", Map.of("url", "https://v.pinimg.com/master.m3u8")))));
        PinDownloads.attach(host);
        assertEquals(1, host.layout.getChildCount());
        assertNull(host.layout.findViewWithTag(PinDownloads.COPY_TAG));
    }

    @Test public void switchingOffAfterMenuCreationPreventsDetailsAndDownloadClicks() {
        Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.jpg"))));
        PinDownloads.attach(host);
        Settings.DOWNLOAD_PINS.save(false);
        assertTrue(host.layout.findViewWithTag(PinDownloads.ROW_TAG).performClick());
        assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
        assertTrue(host.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
        assertFalse(clipboard().hasPrimaryClip());
        assertEquals(0, host.dismissed);
        assertNoDownload();
    }

    @Test public void clickingDownloadResolvesTheCurrentModelAgainBeforeStarting() {
        Map<String, Object> image = new HashMap<>();
        image.put("url", "https://i.pinimg.com/originals/source.jpg");
        Host host = host(Map.of("id", "123", "images", Map.of("orig", image)));
        PinDownloads.attach(host);
        image.put("url", "https://i.pinimg.com/originals/source.unknown");
        assertTrue(host.layout.findViewWithTag(PinDownloads.ROW_TAG).performClick());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("The supplied original image type isn't supported for download.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, host.dismissed);
        assertNoDownload();
    }

    private Host host(Object pin) { return new Host(pin, new LinearLayout(activity)); }

    private ClipboardManager clipboard() {
        return (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
    }

    private String details() {
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull("supplied details weren't opened", dialog);
        assertTrue(dialog.isShowing());
        assertEquals("Supplied media details", Shadows.shadowOf(dialog).getTitle());
        return String.valueOf(Shadows.shadowOf(dialog).getMessage());
    }

    private void assertNoDownload() {
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        assertEquals(0, Shadows.shadowOf(manager).getRequestCount());
    }

    private static final class Host {
        final Object pin;
        final ViewGroup layout;
        int dismissed;
        Host(Object pin, ViewGroup layout) { this.pin = pin; this.layout = layout; }
    }

    @Implements(value = PinDownloads.class, isInAndroidSdk = false)
    public static final class NativeMenu {
        @Implementation protected static Object menuPin(Object controller) { return ((Host) controller).pin; }
        @Implementation protected static ViewGroup menuView(Object controller) { return ((Host) controller).layout; }
        @Implementation protected static View menuRow(ViewGroup layout, String title) {
            TextView row = new TextView(layout.getContext());
            row.setText(title);
            return row;
        }
        @Implementation protected static void dismissMenu(Object controller) { ((Host) controller).dismissed++; }
    }
}
