/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.DownloadManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Environment;
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
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowDownloadManager;
import org.robolectric.shadows.ShadowToast;

import java.lang.reflect.Method;
import java.util.EnumSet;
import java.util.Map;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = PinActionsTest.PatchedSendable.class)
public class PinActionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Activity activity;
    private final Map<String, Object> pin = Map.of("id", "123456", "images", Map.of(
            "orig", Map.of("url", "https://i.pinimg.com/originals/pin.jpg")));
    private enum Source { PIN, SCREENSHOT, DOWNLOAD }

    @Before public void prepare() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS,
                PatchFamily.Capability.PIN_SHARE, PatchFamily.Capability.VISIT_LINKS));
        Settings.SYSTEM_SHARE.save(true);
        Settings.EXTERNAL_BROWSER.save(true);
        Settings.DOWNLOAD_PINS.save(true);
    }

    @After public void reset() {
        Settings.SYSTEM_SHARE.save(false);
        Settings.EXTERNAL_BROWSER.save(false);
        Settings.DOWNLOAD_PINS.save(false);
        Settings.SAVE_IN_PINTEREST_FOLDER.resetToDefault();
        Settings.DOWNLOAD_UNMETERED_ONLY.resetToDefault();
        Settings.DOWNLOAD_NO_ROAMING.resetToDefault();
        DownloadFolder.PICKED.resetToDefault();
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Utils.setActivity(null);
    }

    @Test public void systemShareUsesCanonicalPinLinkAndAndroidChooser() {
        assertTrue(SystemShare.open(pin, Source.PIN));
        Intent chooser = Shadows.shadowOf(activity).getNextStartedActivity();
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertEquals(Intent.ACTION_SEND, send.getAction());
        assertEquals("text/plain", send.getType());
        assertEquals("https://www.pinterest.com/pin/123456/", send.getStringExtra(Intent.EXTRA_TEXT));
        assertNull(send.getPackage());
    }

    @Test public void systemShareUsesLiveSendablePinLink() {
        assertTrue(SystemShare.openSendable(new Sendable("123456", 0), Source.PIN));
        Intent chooser = Shadows.shadowOf(activity).getNextStartedActivity();
        Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertEquals("https://www.pinterest.com/pin/123456/", send.getStringExtra(Intent.EXTRA_TEXT));
        assertFalse(SystemShare.openSendable(new Sendable("123456", 1), Source.PIN));
        assertFalse(SystemShare.openSendable(new Sendable("board", 0), Source.PIN));
    }

    @Test public void screenshotDownloadBoardsAndDisabledShareKeepNativePath() {
        assertFalse(SystemShare.open(pin, Source.SCREENSHOT));
        assertFalse(SystemShare.open(pin, Source.DOWNLOAD));
        assertFalse(SystemShare.open(Map.of("id", "123456"), Source.PIN));
        assertFalse(SystemShare.open(new PinMediaTest.BoardCover(), Source.PIN));
        Settings.SYSTEM_SHARE.save(false);
        assertFalse(SystemShare.open(pin, Source.PIN));
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
    }

    @Test public void browserUsesRealBrowserPackageRatherThanDestinationApp() {
        ResolveInfo browser = new ResolveInfo();
        browser.activityInfo = new ActivityInfo();
        browser.activityInfo.packageName = "com.example.browser";
        browser.activityInfo.name = "com.example.browser.BrowserActivity";
        browser.activityInfo.exported = true;
        Intent probe = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com/"))
                .addCategory(Intent.CATEGORY_BROWSABLE);
        Shadows.shadowOf(activity.getPackageManager()).addResolveInfoForIntent(probe, browser);
        assertTrue(ExternalBrowser.open("https://example.org/recipe?ref=kept", pin));
        Intent visit = Shadows.shadowOf(activity).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, visit.getAction());
        assertEquals("com.example.browser", visit.getPackage());
        assertEquals("https://example.org/recipe?ref=kept", visit.getDataString());
    }

    @Test public void browserPreservesInternalAuthInvalidUrlsAndNoBrowserFallback() {
        for (String url : new String[] {"https://accounts.pinterest.com/login/", "https://pin.it/pin",
                "intent://example.org/#Intent;scheme=https;end", "file:///private", "https://user:password@example.org/"}) {
            assertFalse(url, ExternalBrowser.open(url, pin));
        }
        assertFalse(ExternalBrowser.open("https://example.org/", Map.of("id", "123")));
        assertFalse(ExternalBrowser.open("https://example.org/", pin));
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
    }

    @Test public void profileWebsitesAlwaysUseBrowserChooserAndKeepExactUrl() {
        ResolveInfo browser = new ResolveInfo();
        browser.activityInfo = new ActivityInfo();
        browser.activityInfo.packageName = "com.example.browser";
        browser.activityInfo.name = "com.example.browser.BrowserActivity";
        browser.activityInfo.exported = true;
        Shadows.shadowOf(activity.getPackageManager()).addResolveInfoForIntent(
                new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com/")).addCategory(Intent.CATEGORY_BROWSABLE), browser);
        for (String url : new String[]{"https://creator.example/portfolio?ref=kept#art", "http://creator.example/about",
                "https://creator.example./portfolio", "https://creator.example/100%25-natural"}) {
            assertTrue(url, ExternalBrowser.openProfile(url));
            Intent chooser = Shadows.shadowOf(activity).getNextStartedActivity();
            assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
            Intent target = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
            assertEquals("com.example.browser", target.getPackage());
            assertEquals(url, target.getDataString());
            assertTrue(target.hasCategory(Intent.CATEGORY_BROWSABLE));
        }
        for (String url : new String[]{"https://pinterest.com/creator", "https://www.pinterest.co.uk/user/",
                "https://pin.it/short", "https://pin.it./short", "pinterest://user/123", "intent://website", "https://example.org/sign-in",
                "https://example.org/sign_in", "https://example.org/log%20in", "https://example.org/sign/in",
                "https://example.org/signin", "https://accounts.google.com/", "https://example.org/oauth2/authorize",
                "https://myaccount.google.com/", "https://example.org/logout", "https://example.org/?code=abc123&state=xyz789",
                "https://example.org/?code=abc123", "https://example.org/?error=access_denied",
                "https://example.org/#code=abc123&state=xyz789", "https://example.org/?%63ode=abc123&state=xyz789",
                "https://example.org/my/account", "https://example.org/?client_id=123", "https://example.org/#/login",
                "https://example.org/%6cogin", "https://example.org/%256cogin", "https://user:secret@example.org/"}) {
            assertFalse(url, ExternalBrowser.openProfile(url));
        }
        Settings.EXTERNAL_BROWSER.save(false);
        assertFalse(ExternalBrowser.openProfile("https://creator.example/"));
        Settings.EXTERNAL_BROWSER.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(ExternalBrowser.openProfile("https://creator.example/"));
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertFalse(ExternalBrowser.openProfile("https://creator.example/"));
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
    }

    @Test public void profileWithoutBrowserOrActivityAndColdSettingsKeepNativeNavigation() {
        assertFalse(ExternalBrowser.openProfile("https://creator.example/"));
        SettingsContextRule.withoutContext(() -> assertFalse(ExternalBrowser.openProfile("https://creator.example/")));
        Utils.setActivity(null);
        assertFalse(ExternalBrowser.openProfile("https://creator.example/"));
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
    }

    @Test public void pauseAndColdStartPreserveEveryNativeAction() {
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(SystemShare.open(pin, Source.PIN));
        assertFalse(ExternalBrowser.open("https://example.org/", pin));
        assertFalse(PinDownloads.start(pin, activity));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> {
            assertFalse(SystemShare.open(pin, Source.PIN));
            assertFalse(ExternalBrowser.open("https://example.org/", pin));
            assertFalse(PinDownloads.start(pin, activity));
        });
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
    }

    @Test public void absentCapabilitiesPreserveEveryNativeAction() {
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertFalse(SystemShare.open(pin, Source.PIN));
        assertFalse(ExternalBrowser.open("https://example.org/", pin));
        assertFalse(PinDownloads.start(pin, activity));
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
    }

    @Test public void AndroidTenAndNewerQueueOriginalMediaInDownloadsWithCompletionNotification() throws Exception {
        assertTrue(PinDownloads.start(pin, activity));
        Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
        await.setAccessible(true);
        await.invoke(null);
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        ShadowDownloadManager downloads = Shadows.shadowOf(manager);
        assertEquals(1, downloads.getRequestCount());
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(downloads.getRequest(0));
        assertEquals("https://i.pinimg.com/originals/pin.jpg", request.getUri().toString());
        assertEquals("image/jpeg", request.getMimeType());
        assertEquals("file", request.getDestination().getScheme());
        String fileName = request.getDestination().getLastPathSegment();
        assertTrue("Destination " + request.getDestination() + ", last segment " + fileName,
                fileName != null && fileName.matches("Pinterest_123456_[0-9]+\\.jpg"));
        Uri expected = Uri.withAppendedPath(Uri.fromFile(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)), fileName);
        assertEquals("Downloads destination", expected, request.getDestination());
        assertEquals(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED, request.getNotificationVisibility());
        assertTrue(request.getRequestHeaders().isEmpty());
        // With both network limits off, Android's own defaults apply, as they did before the limits.
        assertTrue(request.getAllowedOverMetered());
        assertTrue(request.getAllowedOverRoaming());
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
    }

    /** Each network limit reaches the request on its own, and both start off. */
    @Test public void networkLimitsReachASinglePinsRequest() throws Exception {
        assertFalse(Settings.DOWNLOAD_UNMETERED_ONLY.savedValue());
        assertFalse(Settings.DOWNLOAD_NO_ROAMING.savedValue());
        Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
        await.setAccessible(true);
        ShadowDownloadManager downloads = Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE));
        boolean[][] limits = {{true, false}, {false, true}, {true, true}};
        for (int i = 0; i < limits.length; i++) {
            Settings.DOWNLOAD_UNMETERED_ONLY.save(limits[i][0]);
            Settings.DOWNLOAD_NO_ROAMING.save(limits[i][1]);
            assertTrue(PinDownloads.start(pin, activity));
            await.invoke(null);
            assertEquals(i + 1, downloads.getRequestCount());
            ShadowDownloadManager.ShadowRequest request = Shadow.extract(downloads.getRequest(i));
            assertEquals("metered allowed", !limits[i][0], request.getAllowedOverMetered());
            assertEquals("roaming allowed", !limits[i][1], request.getAllowedOverRoaming());
        }
    }

    /** #5: the folder switch sends the download to the folder Pinterest's own image save uses. */
    @Test public void saveInPinterestsFolderQueuesInPictures100PintPins() throws Exception {
        assertFalse("the folder switch starts off", Settings.SAVE_IN_PINTEREST_FOLDER.savedValue());
        Settings.SAVE_IN_PINTEREST_FOLDER.save(true);
        assertTrue(PinDownloads.start(pin, activity));
        Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
        await.setAccessible(true);
        await.invoke(null);
        ShadowDownloadManager downloads = Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE));
        assertEquals(1, downloads.getRequestCount());
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(downloads.getRequest(0));
        String fileName = request.getDestination().getLastPathSegment();
        assertTrue(String.valueOf(fileName), fileName != null && fileName.matches("Pinterest_123456_[0-9]+\\.jpg"));
        Uri expected = Uri.withAppendedPath(Uri.fromFile(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)),
                "100PINT/Pins/" + fileName);
        assertEquals(expected, request.getDestination());
        // Android's Downloads list shows only the Download folder, so the toast names this one.
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Download started. Check Pictures/100PINT/Pins.", ShadowToast.getTextOfLatestToast());
        // History keeps the folder with the request, for when Android no longer has it.
        String history = activity.getSharedPreferences(DownloadLedger.STORE, Context.MODE_PRIVATE)
                .getString(DownloadLedger.RECORDS, "").split("\n")[0];
        assertTrue(history, history.contains(",123456,") && history.endsWith(",P"));
        assertEquals(DownloadFolder.PINTEREST, DownloadFolder.of(expected.toString()));
        assertEquals(DownloadFolder.PINTEREST, DownloadFolder.of("file:///storage/emulated/0/Pictures/100PINT/Pins/" + fileName));
        assertNull(DownloadFolder.of("file:///storage/emulated/0/Download/" + fileName));
        assertNull(DownloadFolder.of(null));
        Settings.SAVE_IN_PINTEREST_FOLDER.save(false);
        assertEquals("Download started. Check Downloads.", PinDownloads.startedMessage(true, null));
        Uri back = Shadow.<ShadowDownloadManager.ShadowRequest>extract(PinDownloads.request(
                new PinMedia.Source("https://i.pinimg.com/originals/pin.jpg", "image/jpeg", ".jpg"), "pin.jpg")).getDestination();
        assertEquals(Uri.withAppendedPath(Uri.fromFile(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)), "pin.jpg"), back);
    }

    /** #5: a folder picked by hand gets the download, its toast and its history line; Pinterest's folder still wins while on. */
    @Test public void aPickedFolderQueuesThereAndPinterestsFolderStillWins() throws Exception {
        DownloadFolder.PICKED.save("Pictures/Art");
        assertTrue(PinDownloads.start(pin, activity));
        Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
        await.setAccessible(true);
        await.invoke(null);
        ShadowDownloadManager downloads = Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE));
        assertEquals(1, downloads.getRequestCount());
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(downloads.getRequest(0));
        String fileName = request.getDestination().getLastPathSegment();
        assertTrue(String.valueOf(fileName), fileName != null && fileName.matches("Pinterest_123456_[0-9]+\\.jpg"));
        assertEquals(Uri.withAppendedPath(Uri.fromFile(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)),
                "Art/" + fileName), request.getDestination());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Download started. Check Pictures/Art.", ShadowToast.getTextOfLatestToast());
        String history = activity.getSharedPreferences(DownloadLedger.STORE, Context.MODE_PRIVATE)
                .getString(DownloadLedger.RECORDS, "").split("\n")[0];
        assertTrue(history, history.contains(",123456,") && history.endsWith(",F:Pictures/Art"));
        assertEquals("Pictures/Art", DownloadFolder.of(request.getDestination().toString()));

        Settings.SAVE_IN_PINTEREST_FOLDER.save(true);
        assertEquals(DownloadFolder.PINTEREST, DownloadFolder.current());
        Settings.SAVE_IN_PINTEREST_FOLDER.save(false);
        // The top of a standard folder, and Download's own subfolders, are places too.
        DownloadFolder.PICKED.save("Download/Pins");
        PinMedia.Source source = new PinMedia.Source("https://i.pinimg.com/originals/pin.jpg", "image/jpeg", ".jpg");
        assertEquals(Uri.withAppendedPath(Uri.fromFile(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)),
                "Pins/pin.jpg"), Shadow.<ShadowDownloadManager.ShadowRequest>extract(PinDownloads.request(source, "pin.jpg")).getDestination());
        DownloadFolder.PICKED.save("DCIM");
        assertEquals(Uri.withAppendedPath(Uri.fromFile(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM)),
                "pin.jpg"), Shadow.<ShadowDownloadManager.ShadowRequest>extract(PinDownloads.request(source, "pin.jpg")).getDestination());
        // A saved value that no longer reads as a folder keeps Download.
        DownloadFolder.PICKED.save("Music/Pins");
        assertNull(DownloadFolder.current());
        assertEquals("Download started, but history wasn't saved. Check DCIM.", PinDownloads.startedMessage(false, "DCIM"));
    }

    /**
     * A picked folder with # or % in its name keeps the download. DownloadManager's service reads
     * the destination back from its text form, where a raw # starts a fragment and a raw % an escape.
     */
    @Test public void aFolderNamedWithAHashOrPercentSurvivesTheRequestsTextForm() {
        DownloadFolder.PICKED.save("Pictures/Art #2 100%");
        PinMedia.Source source = new PinMedia.Source("https://i.pinimg.com/originals/pin.jpg", "image/jpeg", ".jpg");
        Uri destination = Shadow.<ShadowDownloadManager.ShadowRequest>extract(PinDownloads.request(source, "pin.jpg")).getDestination();
        // The JVM's external storage path has the host's separators in it, so only the tail is fixed.
        String path = Uri.parse(destination.toString()).getPath();
        assertTrue(path, path.endsWith("Pictures/Art #2 100%/pin.jpg"));
        assertEquals("Pictures/Art #2 100%", DownloadFolder.of(destination.toString()));
    }

    @Test public void aStandInSizeQueuesTheOriginalTheMediaHostHasOrElseItself() throws Exception {
        Map<String, Object> standIn = Map.of("id", "123456", "images", Map.of(
                "236x", Map.of("url", "https://i.pinimg.com/236x/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg"),
                "736x", Map.of("url", MediaHostForTests.STAND_IN, "width", 736, "height", 1104)));
        Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
        await.setAccessible(true);
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        ShadowDownloadManager downloads = Shadows.shadowOf(manager);
        try (MediaHostForTests host = MediaHostForTests.install()) {
            host.answer(MediaHostForTests.ORIGINALS + ".png", 200, "image/png");
            assertTrue(PinDownloads.start(standIn, activity));
            await.invoke(null);
            assertEquals(1, downloads.getRequestCount());
            ShadowDownloadManager.ShadowRequest original = Shadow.extract(downloads.getRequest(0));
            assertEquals(MediaHostForTests.ORIGINALS + ".png", original.getUri().toString());
            assertEquals("image/png", original.getMimeType());
            assertTrue(original.getDestination().getLastPathSegment().matches("Pinterest_123456_[0-9]+\\.png"));
            assertEquals(2, host.asked.size());

            host.asked.clear();
            host.answer(MediaHostForTests.ORIGINALS + ".png", 403, "application/xml");
            assertTrue(PinDownloads.start(standIn, activity));
            await.invoke(null);
            assertEquals(2, downloads.getRequestCount());
            ShadowDownloadManager.ShadowRequest largest = Shadow.extract(downloads.getRequest(1));
            assertEquals(MediaHostForTests.STAND_IN, largest.getUri().toString());
            assertEquals("image/jpeg", largest.getMimeType());
            assertTrue(largest.getDestination().getLastPathSegment().endsWith(".jpg"));
            assertEquals(4, host.asked.size());
        }
    }

    @Test public void aSuppliedOriginalIsQueuedWithoutAskingTheMediaHost() throws Exception {
        try (MediaHostForTests host = MediaHostForTests.install()) {
            assertTrue(PinDownloads.start(Map.of("id", "123456", "images", Map.of(
                    "orig", Map.of("url", MediaHostForTests.ORIGINALS + ".jpg"),
                    "736x", Map.of("url", MediaHostForTests.STAND_IN))), activity));
            Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
            await.setAccessible(true);
            await.invoke(null);
            ShadowDownloadManager downloads = Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE));
            ShadowDownloadManager.ShadowRequest request = Shadow.extract(downloads.getRequest(0));
            assertEquals(MediaHostForTests.ORIGINALS + ".jpg", request.getUri().toString());
            assertTrue(host.asked.isEmpty());
        }
    }

    @Test public void suppliedMp4QueuesItsOwnUrlAndType() throws Exception {
        assertTrue(PinDownloads.start(Map.of("id", "123456", "videos", Map.of("video_list", Map.of(
                "mp4", Map.of("url", "https://v.pinimg.com/source.mp4", "width", 1920, "height", 1080)))), activity));
        Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
        await.setAccessible(true);
        await.invoke(null);
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        ShadowDownloadManager downloads = Shadows.shadowOf(manager);
        assertEquals(1, downloads.getRequestCount());
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(downloads.getRequest(0));
        assertEquals("https://v.pinimg.com/source.mp4", request.getUri().toString());
        assertEquals("video/mp4", request.getMimeType());
        assertTrue(request.getDestination().getLastPathSegment().endsWith(".mp4"));
        assertTrue(request.getRequestHeaders().isEmpty());
    }

    @Test public void nativeDownloadRequestRejectsUnsafeInitialAddressesAndPreservesTheSuppliedUrl() {
        for (String initial : new String[]{"http://i.pinimg.com/pin.jpg", "https://i.pinimg.com.evil.test/pin.jpg",
                "https://user:password@i.pinimg.com/pin.jpg", "file:///private", "https://127.0.0.1/pin.jpg",
                "https://i.pinimg.com:8443/pin.jpg"}) {
            try {
                PinDownloads.request(new PinMedia.Source(initial, "image/jpeg", ".jpg"), "pin.jpg");
                fail("unsafe initial address was accepted: " + initial);
            } catch (IllegalArgumentException rejected) { /* No request reaches the native service. */ }
        }
        String supplied = "https://i.pinimg.com/originals/pin.jpg?opaque=value";
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(
                PinDownloads.request(new PinMedia.Source(supplied, "image/jpeg", ".jpg"), "pin.jpg"));
        assertEquals(supplied, request.getUri().toString());
        assertTrue(request.getRequestHeaders().isEmpty());
    }

    @Test public void knownUnsupportedPinsExplainTheRefusalWithoutQueuingAndUnknownModelsStayNative() {
        assertFalse(PinDownloads.start(Map.of("id", "123", "images", Map.of()), activity));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Pinterest hasn't supplied an image to download.", ShadowToast.getTextOfLatestToast());
        assertFalse(PinDownloads.start(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                "dash", Map.of("url", "https://v.pinimg.com/master.mpd")))), activity));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Pinterest only streams this video. There's no file to download.", ShadowToast.getTextOfLatestToast());
        ShadowToast.reset();
        assertFalse(PinDownloads.start(Map.of("id", "123"), activity));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertNull(ShadowToast.getTextOfLatestToast());
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        assertEquals(0, Shadows.shadowOf(manager).getRequestCount());
    }

    /** Pinterest's sendable: the id and kind its (String, int) constructor stores, 0 for a pin. */
    private static final class Sendable {
        private final String id;
        private final int type;

        private Sendable(String id, int type) {
            this.id = id;
            this.type = type;
        }
    }

    /** The stubs as the patch writes them: a cast and one read of the constructor's field each. */
    @Implements(value = SystemShare.class, isInAndroidSdk = false)
    public static final class PatchedSendable {
        @Implementation protected static String sendableId(Object sendable) { return ((Sendable) sendable).id; }
        @Implementation protected static int sendableType(Object sendable) { return ((Sendable) sendable).type; }
    }
}
