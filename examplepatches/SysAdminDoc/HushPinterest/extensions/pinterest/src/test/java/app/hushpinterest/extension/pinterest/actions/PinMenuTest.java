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
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Looper;
import android.text.format.Formatter;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
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
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowToast;

import java.io.IOException;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import app.hushpinterest.extension.pinterest.NativeDialogCapture;
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
        FileCheck.forgetForTests();
    }

    @After public void reset() {
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        if (dialog != null) dialog.dismiss();
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Utils.setActivity(null);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "en-rUS-w390dp-h844dp-night-xhdpi")
    public void supportedImageOffersOptionalSuppliedDetailsWithoutStartingADownload() throws Exception {
        Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.png", "width", 3000, "height", 2000))));
        PinDownloads.attach(host);
        PinDownloads.attach(host);
        assertEquals(3, host.layout.getChildCount());
        assertEquals("Download pin", ((TextView) host.layout.getChildAt(0)).getText());
        assertEquals("Copy media link", ((TextView) host.layout.getChildAt(1)).getText());
        assertEquals("Media details", ((TextView) host.layout.getChildAt(2)).getText());
        assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
        String text = details();
        assertTrue(text, text.contains("Width: 3000 pixels"));
        assertTrue(text, text.contains("Height: 2000 pixels"));
        assertTrue(text, text.contains("Link type: image/png"));
        assertTrue(text, text.contains("HushPinterest hasn't opened the file to check them."));
        assertEquals(0, host.dismissed);
        assertNoDownload();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        assertTrue(dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        NativeDialogCapture.capture("supplied-media-details", activity.getWindow().getDecorView(), dialog);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "en-rUS-w390dp-h844dp-night-xhdpi")
    public void nativeDetailsExplainAnUnusableSuppliedAddressWithoutOpeningIt() throws Exception {
        Host host = host(Map.of("id", "103", "images", Map.of("orig", Map.of(
                "url", "https://example.invalid/public-reference.png", "width", 3000, "height", 2000))));
        PinDownloads.attach(host);
        assertEquals(1, host.layout.getChildCount());
        assertTrue(host.layout.findViewWithTag(PinDownloads.ROW_TAG).performClick());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        String text = details();
        assertTrue(text, text.contains("This media link isn't a public Pinterest link."));
        assertTrue(text, text.contains("Width: 3000 pixels"));
        assertTrue(text, text.contains("Link type: Unknown"));
        assertNoDownload();
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        NativeDialogCapture.capture("supplied-media-details-unavailable", activity.getWindow().getDecorView(), dialog);
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertFalse(dialog.isShowing());
        assertEquals(0, host.dismissed);
    }

    @Test public void aPinWithDisplaySizesOnlyOffersEveryRowAndNamesTheStandInSize() {
        Host host = host(Map.of("id", "123", "images", Map.of(
                "236x", Map.of("url", "https://i.pinimg.com/236x/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg"),
                "736x", Map.of("url", MediaHostForTests.STAND_IN, "width", 736, "height", 1104))));
        PinDownloads.attach(host);
        assertEquals(3, host.layout.getChildCount());
        assertEquals("Download pin", ((TextView) host.layout.getChildAt(0)).getText());
        assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
        String text = details();
        assertTrue(text, text.contains("Width: 736 pixels"));
        assertTrue(text, text.contains("Size: 736x. Downloads look for the original first."));
        assertFalse(text, text.contains("Pinterest hasn't supplied"));
        assertNoDownload();
    }

    @Test public void aSuppliedOriginalIsNamedInTheDetails() {
        Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.png", "width", 3000, "height", 2000))));
        PinDownloads.attach(host);
        assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
        assertTrue(details().contains("Size: the original image"));
    }

    @Test public void copyMediaLinkForAStandInCopiesTheOriginalTheMediaHostHasAfterClosingTheMenu() throws Exception {
        Host host = host(Map.of("id", "123", "images", Map.of(
                "736x", Map.of("url", MediaHostForTests.STAND_IN))));
        PinDownloads.attach(host);
        try (MediaHostForTests media = MediaHostForTests.install()) {
            media.answer(MediaHostForTests.ORIGINALS + ".png", 200, "image/png");
            assertTrue(host.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
            assertEquals(1, host.dismissed);
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(MediaHostForTests.ORIGINALS + ".png", String.valueOf(clipboard().getPrimaryClip().getItemAt(0).getText()));

            media.answer(MediaHostForTests.ORIGINALS + ".png", 403, "application/xml");
            assertTrue(host.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(MediaHostForTests.STAND_IN, String.valueOf(clipboard().getPrimaryClip().getItemAt(0).getText()));
        }
        assertNoDownload();
    }

    @Test public void copyMediaLinkCopiesTheStandInAtOnceAndUpgradesItsOwnUnchangedClip() throws Exception {
        Host host = host(standInPin("123", MediaHostForTests.STAND_IN));
        PinDownloads.attach(host);
        CountDownLatch gate = new CountDownLatch(1);
        try (MediaHostForTests media = MediaHostForTests.install()) {
            media.answer(MediaHostForTests.ORIGINALS + ".png", 200, "image/png");
            hold(media, Map.of(MediaHostForTests.ORIGINALS, gate));
            try {
                assertTrue(host.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
                assertEquals(1, host.dismissed);
                assertEquals("the stand-in waited on the lookup", MediaHostForTests.STAND_IN, copied());
            } finally {
                gate.countDown();
            }
            settle();
            assertEquals(MediaHostForTests.ORIGINALS + ".png", copied());
            assertEquals("Media link", String.valueOf(clipboard().getPrimaryClip().getDescription().getLabel()));
        }
    }

    @Test public void aLateOriginalNeverReplacesAClipCopiedWhileItWasLookedUp() throws Exception {
        Host host = host(standInPin("123", MediaHostForTests.STAND_IN));
        PinDownloads.attach(host);
        ClipData[] newer = {
                ClipData.newPlainText("note", "something copied in the meantime"),
                // The same address copied again from somewhere else belongs to that copy, not this one.
                ClipData.newPlainText("Media link", MediaHostForTests.STAND_IN),
                ClipData.newRawUri("image", Uri.parse("content://media/external/images/media/7")),
        };
        try (MediaHostForTests media = MediaHostForTests.install()) {
            media.answer(MediaHostForTests.ORIGINALS + ".png", 200, "image/png");
            for (ClipData clip : newer) {
                CountDownLatch gate = new CountDownLatch(1);
                hold(media, Map.of(MediaHostForTests.ORIGINALS, gate));
                try {
                    assertTrue(host.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
                    clipboard().setPrimaryClip(clip);
                } finally {
                    gate.countDown();
                }
                settle();
                assertSame(clip.getDescription().getLabel().toString(), clip, clipboard().getPrimaryClip());
            }
        }
    }

    @Test public void aLateOriginalIsDroppedWhenTheClipboardCantBeReadOrDownloadsStop() throws Exception {
        Host host = host(standInPin("123", MediaHostForTests.STAND_IN));
        PinDownloads.attach(host);
        Map<String, Runnable> interruptions = new LinkedHashMap<>();
        // Android hands an app it won't let read the clipboard no clip at all.
        interruptions.put("unreadable", () -> clipboard().clearPrimaryClip());
        interruptions.put("off", () -> Settings.DOWNLOAD_PINS.save(false));
        interruptions.put("paused", () -> PauseForTests.pause(HushPinterestPause.Reason.SWITCH));
        try (MediaHostForTests media = MediaHostForTests.install()) {
            media.answer(MediaHostForTests.ORIGINALS + ".png", 200, "image/png");
            for (Map.Entry<String, Runnable> interruption : interruptions.entrySet()) {
                Settings.DOWNLOAD_PINS.save(true);
                PauseForTests.resume();
                CountDownLatch gate = new CountDownLatch(1);
                hold(media, Map.of(MediaHostForTests.ORIGINALS, gate));
                try {
                    assertTrue(interruption.getKey(), host.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
                    interruption.getValue().run();
                } finally {
                    gate.countDown();
                }
                settle();
                if (interruption.getKey().equals("unreadable")) assertFalse(clipboard().hasPrimaryClip());
                else assertEquals(interruption.getKey(), MediaHostForTests.STAND_IN, copied());
            }
        }
    }

    @Test public void aLaterCopyKeepsTheClipboardFromAnEarlierLookup() throws Exception {
        String otherStandIn = "https://i.pinimg.com/736x/1f/2e/3d/1f2e3d4c5b6a79881f2e3d4c5b6a7988.jpg";
        String otherOriginals = "https://i.pinimg.com/originals/1f/2e/3d/1f2e3d4c5b6a79881f2e3d4c5b6a7988";
        Host first = host(standInPin("123", MediaHostForTests.STAND_IN));
        Host second = host(standInPin("124", otherStandIn));
        Host supplied = host(Map.of("id", "125", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.png", "width", 3000, "height", 2000))));
        PinDownloads.attach(first);
        PinDownloads.attach(second);
        PinDownloads.attach(supplied);
        try (MediaHostForTests media = MediaHostForTests.install()) {
            media.answer(MediaHostForTests.ORIGINALS + ".png", 200, "image/png");
            media.answer(otherOriginals + ".png", 200, "image/png");

            // The second request's original lands first, then the first request's answer comes late.
            CountDownLatch firstGate = new CountDownLatch(1), secondGate = new CountDownLatch(1);
            hold(media, Map.of(MediaHostForTests.ORIGINALS, firstGate, otherOriginals, secondGate));
            try {
                assertTrue(first.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
                assertTrue(second.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
                assertEquals(otherStandIn, copied());
                secondGate.countDown();
                awaitCopied(otherOriginals + ".png");
            } finally {
                firstGate.countDown();
                secondGate.countDown();
            }
            settle();
            assertEquals(otherOriginals + ".png", copied());

            // A supplied original copied while a lookup waits stays copied.
            firstGate = new CountDownLatch(1);
            hold(media, Map.of(MediaHostForTests.ORIGINALS, firstGate));
            try {
                assertTrue(first.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
                assertTrue(supplied.layout.findViewWithTag(PinDownloads.COPY_TAG).performClick());
            } finally {
                firstGate.countDown();
            }
            settle();
            assertEquals("https://i.pinimg.com/originals/source.png", copied());
        }
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
        assertTrue(text, text.contains("Width: 1920 pixels, supplied by Pinterest"));
        assertTrue(text, text.contains("Height: 1080 pixels"));
        assertTrue(text, text.contains("Link type: video/mp4, supplied by Pinterest"));
        assertFalse(text, text.contains("3840"));
        assertFalse("a video's file isn't checked", text.contains("File size"));
        assertNotEquals(View.VISIBLE, ShadowAlertDialog.getLatestAlertDialog()
                .getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());
        assertNoDownload();
    }

    private static final String SOURCE = "https://i.pinimg.com/originals/source.png";

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "en-rUS-w390dp-h844dp-night-xhdpi")
    public void checkTheFileShowsWhatTheFileHoldsOnlyAfterTheTapAndSaysWhereEachValueCameFrom() throws Exception {
        try (FileHostForTests files = FileHostForTests.install()) {
            files.partial(SOURCE, "bytes 0-65535/2500000",
                    FileHostForTests.padded(FileHostForTests.picture(640, 480, Bitmap.CompressFormat.PNG), 65536));
            Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                    "url", SOURCE, "width", 3000, "height", 2000))));
            PinDownloads.attach(host);
            assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            String supplied = message(dialog);
            assertTrue(supplied, supplied.startsWith("These details come from the link and file information Pinterest "
                    + "gave the app. HushPinterest hasn't opened the file to check them."));
            assertTrue(supplied, supplied.contains("Width: 3000 pixels, supplied by Pinterest"));
            assertTrue(supplied, supplied.contains("Height: 2000 pixels, supplied by Pinterest"));
            assertTrue(supplied, supplied.contains("Link type: image/png, supplied by Pinterest"));
            assertTrue(supplied, supplied.contains("File size: Unknown"));
            assertTrue("opening the menu and the details asks nothing", files.asked.isEmpty());

            Button check = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
            assertEquals(View.VISIBLE, check.getVisibility());
            assertEquals("Check the file", String.valueOf(check.getText()));
            NativeDialogCapture.capture("supplied-media-details-check", activity.getWindow().getDecorView(), dialog);
            assertTrue(check.performClick());
            assertEquals("Checking the file", String.valueOf(check.getText()));
            assertFalse(check.isEnabled());
            assertTrue(check.performClick());
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("a second tap while it runs asks nothing more", 1, files.asked.size());
            assertTrue("the details stay open", dialog.isShowing());
            String checked = message(dialog);
            assertTrue(checked, checked.startsWith("These details were checked from the first part of the file. "
                    + "HushPinterest didn't download the whole file."));
            assertTrue(checked, checked.contains("Width: 640 pixels, checked from the file"));
            assertTrue(checked, checked.contains("Height: 480 pixels, checked from the file"));
            assertTrue(checked, checked.contains("File type: image/png, checked from the file"));
            assertTrue(checked, checked.contains("File size: " + Formatter.formatFileSize(activity, 2500000)
                    + ", checked from the file"));
            assertTrue(checked, checked.contains("Checked file: the original image"));
            assertFalse(checked, checked.contains("supplied by Pinterest"));
            assertFalse(checked, checked.contains("hasn't opened"));
            assertEquals(View.GONE, check.getVisibility());
            NativeDialogCapture.capture("checked-media-details", activity.getWindow().getDecorView(), dialog);
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            // Reopened, the details show what was checked, without asking again.
            assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            AlertDialog reopened = ShadowAlertDialog.getLatestAlertDialog();
            assertNotSame(dialog, reopened);
            assertTrue(message(reopened), message(reopened).contains("Width: 640 pixels, checked from the file"));
            assertNotEquals(View.VISIBLE, reopened.getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());
            reopened.dismiss();

            // Fifteen minutes on, it's Pinterest's details again, and the check is offered again.
            files.now.addAndGet(FileCheck.FRESH_MS);
            assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            AlertDialog expired = ShadowAlertDialog.getLatestAlertDialog();
            assertTrue(message(expired), message(expired).contains("Width: 3000 pixels, supplied by Pinterest"));
            assertEquals(View.VISIBLE, expired.getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());
            assertEquals(1, files.asked.size());
            assertEquals(0, host.dismissed);
            assertNoDownload();
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aStandInsCheckNamesTheSizeItReadAndAFailedCheckKeepsTheSuppliedDetails() throws Exception {
        try (FileHostForTests files = FileHostForTests.install(); MediaHostForTests lookup = MediaHostForTests.install()) {
            files.answer(MediaHostForTests.STAND_IN, url ->
                    new FileHostForTests.Answer(url, 500, new FileHostForTests.Body(new byte[0])));
            Host host = host(Map.of("id", "123", "images", Map.of(
                    "736x", Map.of("url", MediaHostForTests.STAND_IN, "width", 736, "height", 1104))));
            PinDownloads.attach(host);
            assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue(lookup.asked.isEmpty());
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            Button check = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
            assertTrue(check.performClick());
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            String failed = message(dialog);
            assertTrue(failed, failed.startsWith("Couldn't check the file, so these are still the details Pinterest supplied."));
            assertTrue(failed, failed.contains("Width: 736 pixels, supplied by Pinterest"));
            assertTrue(failed, failed.contains("Size: 736x. Downloads look for the original first."));
            assertTrue(failed, failed.contains("File size: Unknown"));
            assertFalse(failed, failed.contains("hasn't opened"));
            assertFalse(failed, failed.contains("checked from the file"));
            assertEquals(View.VISIBLE, check.getVisibility());
            assertTrue(check.isEnabled());
            assertEquals("Check the file", String.valueOf(check.getText()));
            assertEquals(1, files.asked.size());

            // A second try reads the same size, as a download would with the original still missing.
            files.partial(MediaHostForTests.STAND_IN, "bytes 0-65535/*",
                    FileHostForTests.padded(FileHostForTests.picture(736, 1104, Bitmap.CompressFormat.JPEG), 65536));
            assertTrue(check.performClick());
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(2, files.asked.size());
            String checked = message(dialog);
            assertTrue(checked, checked.contains("Width: 736 pixels, checked from the file"));
            assertTrue(checked, checked.contains("File type: image/jpeg, checked from the file"));
            assertTrue("a 206 without a total leaves the size unknown: " + checked, checked.contains("File size: Unknown"));
            assertTrue(checked, checked.contains("Checked file: the 736x size Pinterest supplied"));
            assertFalse(checked, checked.contains("the original image"));
            assertNoDownload();
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void checkTheFileAsksNothingOnceDownloadPinsIsOffOrPaused() throws Exception {
        try (FileHostForTests files = FileHostForTests.install()) {
            files.partial(SOURCE, "bytes 0-65535/1234567",
                    FileHostForTests.padded(FileHostForTests.picture(64, 48, Bitmap.CompressFormat.PNG), 65536));
            Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                    "url", SOURCE, "width", 3000, "height", 2000))));
            PinDownloads.attach(host);
            assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            Button check = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);

            Settings.DOWNLOAD_PINS.save(false);
            assertTrue(check.performClick());
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            String off = message(dialog);
            assertTrue(off, off.startsWith("Couldn't check the file, so these are still the details Pinterest supplied."));
            assertTrue(off, off.contains("Width: 3000 pixels, supplied by Pinterest"));

            Settings.DOWNLOAD_PINS.save(true);
            PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
            assertTrue(check.performClick());
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue(message(dialog).startsWith("Couldn't check the file"));
            assertTrue(files.asked.isEmpty());

            PauseForTests.resume();
            assertTrue(check.performClick());
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("the control: on and running, the tap asks", 1, files.asked.size());
            assertTrue(message(dialog).contains("Width: 64 pixels, checked from the file"));
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aCheckThatEndsAfterTheScreenClosesTouchesNothingButIsRemembered() throws Exception {
        try (FileHostForTests files = FileHostForTests.install()) {
            files.partial(SOURCE, "bytes 0-65535/1234567",
                    FileHostForTests.padded(FileHostForTests.picture(64, 48, Bitmap.CompressFormat.PNG), 65536));
            Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                    "url", SOURCE, "width", 3000, "height", 2000))));
            PinDownloads.attach(host);
            assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            String before = message(dialog);
            assertTrue(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick());
            activity.finish();
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(1, files.asked.size());
            assertEquals("a finishing screen's details aren't touched", before, message(dialog));

            Activity next = Robolectric.buildActivity(Activity.class).setup().get();
            Utils.setActivity(next);
            assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            AlertDialog reopened = ShadowAlertDialog.getLatestAlertDialog();
            assertTrue(message(reopened), message(reopened).contains("Width: 64 pixels, checked from the file"));
            assertEquals(1, files.asked.size());
        }
    }

    private static String message(AlertDialog dialog) {
        TextView view = dialog.findViewById(android.R.id.message);
        assertNotNull("the details have no message", view);
        return String.valueOf(view.getText());
    }

    @Test public void adaptiveOnlyPinGetsAnAccessibleExplanationAndNeverDownloadsItsThumbnail() {
        Host host = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "adaptive", Map.of("url", "https://v.pinimg.com/master.mpd"))), "images", Map.of(
                "orig", Map.of("url", "https://i.pinimg.com/originals/thumbnail.jpg"))));
        PinDownloads.attach(host);
        assertEquals(1, host.layout.getChildCount());
        View row = host.layout.findViewWithTag(PinDownloads.ROW_TAG);
        assertEquals("Download unavailable", ((TextView) row).getText());
        assertTrue(row.isEnabled());
        assertTrue(row.isFocusable());
        assertTrue(row.getContentDescription().toString().contains("only streams this video"));
        assertTrue(row.performClick());
        assertTrue(details().contains("Pinterest only streams this video. There's no file to download."));
        assertEquals(0, host.dismissed);
        assertNoDownload();
    }

    @Test public void missingDimensionsStayUnknownInTheOptionalDetails() {
        Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.jpg"))));
        PinDownloads.attach(host);
        assertTrue(host.layout.findViewWithTag("hushpinterest_pin_media_details").performClick());
        assertTrue(details().contains("Width: Unknown"));
        assertTrue(details().contains("Height: Unknown"));
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
        assertEquals("This media link isn't a public Pinterest link.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, host.dismissed);
    }

    @Test public void unavailablePinsGetNoCopyRow() {
        Host host = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "adaptive", Map.of("url", "https://v.pinimg.com/master.mpd")))));
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
        assertEquals("HushPinterest can't download this type of image.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, host.dismissed);
        assertNoDownload();
    }

    @Test public void pinterestsOwnDownloadRowFoldsOnlyWhenDownloadPinCanSaveThePin() {
        Host supported = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.jpg"))));
        View replaced = nativeDownload(supported);
        TextView copyLink = new TextView(activity);
        copyLink.setText("Copy link");
        supported.layout.addView(copyLink);
        PinDownloads.attach(supported);
        assertEquals(View.GONE, replaced.getVisibility());
        assertEquals(View.VISIBLE, copyLink.getVisibility());
        assertEquals("Download pin", ((TextView) supported.layout.getChildAt(0)).getText());

        Host adaptive = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "adaptive", Map.of("url", "https://v.pinimg.com/master.mpd")))));
        View kept = nativeDownload(adaptive);
        PinDownloads.attach(adaptive);
        assertEquals("Download unavailable", ((TextView) adaptive.layout.getChildAt(0)).getText());
        assertEquals(View.VISIBLE, kept.getVisibility());

        Host video = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "large", Map.of("url", "https://v.pinimg.com/large.mp4", "width", 1920, "height", 1080)))));
        View cover = nativeDownload(video);
        PinDownloads.attach(video);
        assertEquals("Download pin", ((TextView) video.layout.getChildAt(0)).getText());
        assertEquals("Download pin saves the video, not a still image, so Pinterest's row stays",
                View.VISIBLE, cover.getVisibility());

        Settings.DOWNLOAD_PINS.save(false);
        Host off = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.jpg"))));
        View untouched = nativeDownload(off);
        PinDownloads.attach(off);
        assertEquals(View.VISIBLE, untouched.getVisibility());
        assertEquals(1, off.layout.getChildCount());
        PinDownloads.nativeRow(null);
    }

    // #11: Copy image sits right under Download pin, for an image pin only, only when its own switch is on.
    @Test public void copyImageIsAnImageOnlyRowUnderDownloadPinThatStartsOffAndNeedsItsCapability() {
        Map<String, Object> image = Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.png")));
        Host stock = host(image);
        PinDownloads.attach(stock);
        assertNull("the switch starts off", stock.layout.findViewWithTag(PinDownloads.COPY_IMAGE_TAG));
        int stockRows = stock.layout.getChildCount();
        assertTrue(stockRows >= 1);

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.COPY_IMAGE));
        Settings.COPY_IMAGE.save(true);
        try {
            Host on = host(image);
            PinDownloads.attach(on);
            PinDownloads.attach(on);
            assertEquals(stockRows + 1, on.layout.getChildCount());
            assertEquals("Download pin", ((TextView) on.layout.getChildAt(0)).getText());
            assertEquals("Copy image", ((TextView) on.layout.getChildAt(1)).getText());
            assertSame(on.layout.getChildAt(1), on.layout.findViewWithTag(PinDownloads.COPY_IMAGE_TAG));
            assertEquals("Copy media link", ((TextView) on.layout.getChildAt(2)).getText());

            Host video = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                    "large", Map.of("url", "https://v.pinimg.com/large.mp4", "width", 1920, "height", 1080)))));
            PinDownloads.attach(video);
            assertEquals("Download pin", ((TextView) video.layout.getChildAt(0)).getText());
            assertNull("no picture to copy from a video", video.layout.findViewWithTag(PinDownloads.COPY_IMAGE_TAG));

            PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
            Host paused = host(image);
            PinDownloads.attach(paused);
            assertEquals("a paused app keeps the stock menu", 0, paused.layout.getChildCount());
            PauseForTests.resume();

            PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
            Host unpatched = host(image);
            PinDownloads.attach(unpatched);
            assertNull(unpatched.layout.findViewWithTag(PinDownloads.COPY_IMAGE_TAG));
            assertEquals(stockRows, unpatched.layout.getChildCount());

            // Download pins off: no rows at all, so none for Copy image either.
            PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.COPY_IMAGE));
            Settings.DOWNLOAD_PINS.save(false);
            Host downloadsOff = host(image);
            PinDownloads.attach(downloadsOff);
            assertEquals(0, downloadsOff.layout.getChildCount());
        } finally {
            Settings.COPY_IMAGE.save(false);
        }
    }

    @Test public void copyImageAlsoSitsUnderDownloadPinInTheOverflowSheetAndTellsTheTruthWhenItCantStart() {
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.COPY_IMAGE));
        Settings.COPY_IMAGE.save(true);
        try {
            Host sheet = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                    "url", "https://i.pinimg.com/originals/source.png"))));
            PinDownloads.attachSheet(sheet);
            assertEquals("Download pin", ((TextView) sheet.layout.getChildAt(0)).getText());
            assertEquals("Copy image", ((TextView) sheet.layout.getChildAt(1)).getText());
            // This test app declares no share provider, so the clip can't be served: say so, change nothing.
            ShadowToast.reset();
            assertTrue(sheet.layout.findViewWithTag(PinDownloads.COPY_IMAGE_TAG).performClick());
            assertEquals("Couldn't copy the image. Check your connection and try again.", ShadowToast.getTextOfLatestToast());
            assertEquals("a copy that never started leaves the menu open", 0, sheet.sheetDismissed);
        } finally {
            Settings.COPY_IMAGE.save(false);
        }
    }

    // #11: Share image sits under Copy image, for an image pin only, behind a switch of its own that starts off.
    @Test public void shareImageIsAnImageOnlyRowUnderCopyImageThatStartsOffAndNeedsItsCapability() {
        Map<String, Object> image = Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.png")));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS,
                PatchFamily.Capability.COPY_IMAGE, PatchFamily.Capability.SHARE_IMAGE));
        Settings.COPY_IMAGE.save(true);
        try {
            Host copyOnly = host(image);
            PinDownloads.attach(copyOnly);
            assertNull("the switch starts off", copyOnly.layout.findViewWithTag(PinDownloads.SHARE_IMAGE_TAG));
            int rows = copyOnly.layout.getChildCount();

            Settings.SHARE_IMAGE.save(true);
            Host on = host(image);
            PinDownloads.attach(on);
            PinDownloads.attach(on);
            assertEquals(rows + 1, on.layout.getChildCount());
            assertEquals("Download pin", ((TextView) on.layout.getChildAt(0)).getText());
            assertEquals("Copy image", ((TextView) on.layout.getChildAt(1)).getText());
            assertEquals("Share image", ((TextView) on.layout.getChildAt(2)).getText());
            assertSame(on.layout.getChildAt(2), on.layout.findViewWithTag(PinDownloads.SHARE_IMAGE_TAG));
            assertEquals("Copy media link", ((TextView) on.layout.getChildAt(3)).getText());

            Settings.COPY_IMAGE.save(false);
            Host alone = host(image);
            PinDownloads.attach(alone);
            assertEquals("without Copy image it sits right under Download pin",
                    "Share image", ((TextView) alone.layout.getChildAt(1)).getText());
            assertEquals("Copy media link", ((TextView) alone.layout.getChildAt(2)).getText());

            Host video = host(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                    "large", Map.of("url", "https://v.pinimg.com/large.mp4", "width", 1920, "height", 1080)))));
            PinDownloads.attach(video);
            assertEquals("Download pin", ((TextView) video.layout.getChildAt(0)).getText());
            assertNull("no picture to share from a video", video.layout.findViewWithTag(PinDownloads.SHARE_IMAGE_TAG));

            PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
            Host paused = host(image);
            PinDownloads.attach(paused);
            assertEquals("a paused app keeps the stock menu", 0, paused.layout.getChildCount());
            PauseForTests.resume();

            PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.COPY_IMAGE));
            Host unpatched = host(image);
            PinDownloads.attach(unpatched);
            assertNull(unpatched.layout.findViewWithTag(PinDownloads.SHARE_IMAGE_TAG));

            PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.SHARE_IMAGE));
            Settings.DOWNLOAD_PINS.save(false);
            Host downloadsOff = host(image);
            PinDownloads.attach(downloadsOff);
            assertEquals(0, downloadsOff.layout.getChildCount());
        } finally {
            Settings.SHARE_IMAGE.save(false);
            Settings.COPY_IMAGE.save(false);
        }
    }

    @Test public void shareImageAlsoSitsInTheOverflowSheetAndTellsTheTruthWhenItCantStart() {
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.SHARE_IMAGE));
        Settings.SHARE_IMAGE.save(true);
        try {
            Host sheet = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                    "url", "https://i.pinimg.com/originals/source.png"))));
            PinDownloads.attachSheet(sheet);
            assertEquals("Download pin", ((TextView) sheet.layout.getChildAt(0)).getText());
            assertEquals("Share image", ((TextView) sheet.layout.getChildAt(1)).getText());
            // This test app declares no share provider, so nothing could read the picture: say so, open nothing.
            ShadowToast.reset();
            assertTrue(sheet.layout.findViewWithTag(PinDownloads.SHARE_IMAGE_TAG).performClick());
            assertEquals("Couldn't share the image. Check your connection and try again.", ShadowToast.getTextOfLatestToast());
            assertEquals("a share that never started leaves the menu open", 0, sheet.sheetDismissed);
            assertNull(Shadows.shadowOf(activity.getApplication()).getNextStartedActivity());
        } finally {
            Settings.SHARE_IMAGE.save(false);
        }
    }

    // #2: the full-screen overflow sheet opens with header rows of its own and closes through its presenter.
    @Test public void theOverflowSheetGetsTheRowsWhereItsOwnDownloadRowWasAndClosesItself() throws Exception {
        Host sheet = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.jpg"))));
        TextView header = new TextView(activity);
        header.setText("See more like this");
        sheet.layout.addView(header);
        View replaced = nativeDownload(sheet);
        TextView share = new TextView(activity);
        share.setText("Share");
        sheet.layout.addView(share);
        PinDownloads.attachSheet(sheet);
        assertEquals(View.GONE, replaced.getVisibility());
        assertSame(header, sheet.layout.getChildAt(0));
        assertEquals("Download pin", ((TextView) sheet.layout.getChildAt(1)).getText());
        assertSame(share, sheet.layout.getChildAt(sheet.layout.getChildCount() - 1));
        int rows = sheet.layout.getChildCount();
        PinDownloads.attachSheet(sheet);
        assertEquals("a second return from the same build adds nothing", rows, sheet.layout.getChildCount());

        assertTrue(sheet.layout.findViewWithTag(PinDownloads.ROW_TAG).performClick());
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(1, sheet.sheetDismissed);
        assertEquals(0, sheet.dismissed);
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        assertEquals(1, Shadows.shadowOf(manager).getRequestCount());
    }

    @Test public void aSecondTapWhileTheMenuClosesDoesntQueueThePinAgain() throws Exception {
        Host host = host(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/originals/source.jpg"))));
        PinDownloads.attach(host);
        View row = host.layout.findViewWithTag(PinDownloads.ROW_TAG);
        assertTrue(row.performClick());
        assertTrue(row.performClick());
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(1, host.dismissed);
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        assertEquals(1, Shadows.shadowOf(manager).getRequestCount());
    }

    /** What the patch's mark does as Pinterest's menu builds its own Download image row. */
    private View nativeDownload(Host host) {
        TextView row = new TextView(activity);
        row.setText("Download image");
        PinDownloads.nativeRow(row);
        host.layout.addView(row);
        return row;
    }

    private Host host(Object pin) { return new Host(pin, new LinearLayout(activity)); }

    private ClipboardManager clipboard() {
        return (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
    }

    private String copied() {
        return String.valueOf(clipboard().getPrimaryClip().getItemAt(0).getText());
    }

    private static Map<String, Object> standInPin(String id, String url) {
        return Map.of("id", id, "images", Map.of("736x", Map.of("url", url)));
    }

    /** Holds each media host question under a gate's address until that gate opens, then answers from [media]. */
    private static void hold(MediaHostForTests media, Map<String, CountDownLatch> gates) {
        OriginalLookup.connection = uri -> {
            for (Map.Entry<String, CountDownLatch> gate : gates.entrySet()) {
                if (!uri.toString().startsWith(gate.getKey())) continue;
                try {
                    if (!gate.getValue().await(5, TimeUnit.SECONDS)) throw new IOException("gate never opened");
                } catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                    throw new IOException("interrupted at the gate");
                }
            }
            return media.open(uri);
        };
    }

    private static void settle() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** Runs main-thread posts until the clipboard holds [url], while other lookups stay held. */
    private void awaitCopied(String url) throws InterruptedException {
        long until = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (System.nanoTime() < until) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            if (url.equals(copied())) return;
            Thread.sleep(10);
        }
        fail("the clipboard never got " + url);
    }

    private String details() {
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull("supplied details weren't opened", dialog);
        assertTrue(dialog.isShowing());
        assertEquals("Media details", Shadows.shadowOf(dialog).getTitle());
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
        int sheetDismissed;
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
        @Implementation protected static Object sheetPin(Object sheet) { return ((Host) sheet).pin; }
        @Implementation protected static ViewGroup sheetView(Object sheet) { return ((Host) sheet).layout; }
        @Implementation protected static View sheetRow(Object sheet, String title) {
            TextView row = new TextView(((Host) sheet).layout.getContext());
            row.setText(title);
            return row;
        }
        @Implementation protected static void dismissSheet(Object sheet) { ((Host) sheet).sheetDismissed++; }
    }
}
