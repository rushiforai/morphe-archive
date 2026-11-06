/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.DownloadManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.view.View;
import android.widget.FrameLayout;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowApplication;
import org.robolectric.shadows.ShadowDownloadManager;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** Save video: the long-press menu on a post video saves the file it plays into Downloads. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VideoSavesTest {
    private static final String ADDRESS = "https://va.media.tumblr.com/tumblr_s0m3v1d30_720.mp4";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private ActivityController<Activity> controller;
    private Activity activity;

    @Before public void setUp() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.SHARE_VIDEO_LINKS.save(true);
        PauseForTests.resume();
        HookStatus.clear();
        ShadowAlertDialog.reset();
        ShadowToast.reset();
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
    }

    @After public void restore() {
        controller.close();
        Settings.SHARE_VIDEO_LINKS.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        HookStatus.clear();
        VideoSaves.forgetForTests();
    }

    @Test public void theMenuOffersSaveForAWebAddressOnly() {
        assertTrue(VideoLinks.press(null).onLongClick(controlsFor(ADDRESS)));
        assertEquals(Arrays.asList("Share video link", "Copy video link", "Save video"), menuItems());
        ShadowAlertDialog.reset();
        assertTrue(VideoLinks.press(null).onLongClick(controlsFor("content://media/external/video/42")));
        assertEquals("a local address has nothing to download", Arrays.asList("Share video link", "Copy video link"), menuItems());
    }

    @Test public void saveQueuesTheVideoIntoDownloadsUnderItsOwnName() {
        View controls = controlsFor("https://va.media.tumblr.com/tumblr_an0ld3rv1d30_480.mp4");
        // A recycled row saves what it plays now.
        VideoLinks.bind(containerOf(controls), ADDRESS);
        VideoLinks.press(null).onLongClick(controls);
        shadowOf(ShadowAlertDialog.getLatestAlertDialog()).clickOnItem(2);
        ShadowLooper.idleMainLooper();
        ShadowDownloadManager downloads = shadowOf(downloadManager());
        assertEquals(1, downloads.getRequestCount());
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(downloads.getRequest(0));
        assertEquals(ADDRESS, request.getUri().toString());
        assertEquals("video/mp4", request.getMimeType());
        assertEquals(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED, request.getNotificationVisibility());
        // The shared Download folder, not Tumblr's own files folder that goes when Tumblr does.
        assertEquals(Uri.withAppendedPath(Uri.fromFile(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)),
                "tumblr_s0m3v1d30_720.mp4"), request.getDestination());
        assertEquals("Saving to Downloads", ShadowToast.getTextOfLatestToast());
        assertNull("no storage prompt on Android 10 and newer", shadowOf(activity).getLastRequestedPermission());
    }

    @Test public void aToastSaysWhenTheSaveIsDoneOrFailed() {
        long first = saveFromMenu(ADDRESS);
        long second = saveFromMenu("https://va.media.tumblr.com/tumblr_s3c0nd_720.mp4");
        ShadowApplication.Wrapper listener = completionListener();
        assertEquals(VideoSaves.SENDER_PERMISSION, listener.broadcastPermission);

        ShadowToast.reset();
        listener.broadcastReceiver.onReceive(application(), finished(12345));
        ShadowLooper.idleMainLooper();
        assertNull("someone else's download says nothing", ShadowToast.getTextOfLatestToast());

        status(first, DownloadManager.STATUS_SUCCESSFUL);
        listener.broadcastReceiver.onReceive(application(), finished(first));
        ShadowLooper.idleMainLooper();
        assertEquals("Video saved to Downloads", ShadowToast.getTextOfLatestToast());
        assertNotNull("still listening for the second save", completionListenerOrNull());

        status(second, DownloadManager.STATUS_FAILED);
        listener.broadcastReceiver.onReceive(application(), finished(second));
        ShadowLooper.idleMainLooper();
        assertEquals("Couldn't save the video", ShadowToast.getTextOfLatestToast());
        assertNull("stops listening once nothing is saving", completionListenerOrNull());
    }

    @Test @Config(sdk = Build.VERSION_CODES.TIRAMISU)
    public void android13AndNewerHearTheDownloadServiceFromOutsideTheApp() {
        saveFromMenu(ADDRESS);
        assertEquals(Context.RECEIVER_EXPORTED, completionListener().flags);
        assertEquals(VideoSaves.SENDER_PERMISSION, completionListener().broadcastPermission);
    }

    @Test @Config(sdk = Build.VERSION_CODES.P)
    public void android9AsksForStorageAndSavesOnceItsAllowed() throws Exception {
        shadowOf(application()).denyPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        tapSave(ADDRESS);
        assertEquals(0, shadowOf(downloadManager()).getRequestCount());
        assertNotNull(shadowOf(activity).getLastRequestedPermission());
        assertTrue(Arrays.asList(shadowOf(activity).getLastRequestedPermission().requestedPermissions)
                .contains(Manifest.permission.WRITE_EXTERNAL_STORAGE));
        assertNull("Android's own prompt does the asking", ShadowToast.getTextOfLatestToast());

        shadowOf(application()).grantPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        backFromThePrompt();
        assertEquals("allowed, the save goes ahead with no second tap", 1, shadowOf(downloadManager()).getRequestCount());
        assertEquals("Saving to Downloads", ShadowToast.getTextOfLatestToast());
        assertTrue("Android 8 and 9 only show it in the gallery when asked to scan it",
                scannable(shadowOf(downloadManager()).getRequest(0)));

        backFromThePrompt();
        assertEquals("one save for one tap", 1, shadowOf(downloadManager()).getRequestCount());
    }

    @Test @Config(sdk = Build.VERSION_CODES.P)
    public void android9SaysSoWhenStorageIsRefused() {
        shadowOf(application()).denyPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        tapSave(ADDRESS);
        backFromThePrompt();
        assertEquals(0, shadowOf(downloadManager()).getRequestCount());
        assertEquals("Couldn't save the video", ShadowToast.getTextOfLatestToast());

        // Allowed later from Android's settings, the refused save stays refused.
        ShadowToast.reset();
        shadowOf(application()).grantPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        backFromThePrompt();
        assertEquals(0, shadowOf(downloadManager()).getRequestCount());
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test @Config(sdk = Build.VERSION_CODES.P)
    public void android9SavesTheLastVideoTappedWhileThePromptWasUp() {
        shadowOf(application()).denyPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        tapSave("https://va.media.tumblr.com/tumblr_f1rst_720.mp4");
        tapSave(ADDRESS);
        shadowOf(application()).grantPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        backFromThePrompt();
        ShadowDownloadManager downloads = shadowOf(downloadManager());
        assertEquals(1, downloads.getRequestCount());
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(downloads.getRequest(0));
        assertEquals(ADDRESS, request.getUri().toString());
    }

    @Test @Config(sdk = Build.VERSION_CODES.P)
    public void android9LetsGoOfAScreenClosedUnderThePrompt() throws Exception {
        shadowOf(application()).denyPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        int before = lifecycleCallbacks();
        tapSave(ADDRESS);
        assertEquals("waiting on the prompt", before + 1, lifecycleCallbacks());
        controller.pause().stop().destroy();
        assertEquals("nothing holds on to the closed screen", before, lifecycleCallbacks());
        assertEquals(0, shadowOf(downloadManager()).getRequestCount());
    }

    @Test public void theFileNameIsTheAddresssOwnMadeSafe() {
        assertEquals("tumblr_s0m3v1d30_720.mp4", VideoSaves.fileName(ADDRESS));
        assertEquals("tumblr_abc_480.mp4", VideoSaves.fileName("https://va.media.tumblr.com/tumblr_abc_480.mp4?play_key=xyz"));
        assertEquals("a_b_c.mp4", VideoSaves.fileName("https://example.com/v/a%20b:c"));
        assertEquals("tumblr_video.mp4", VideoSaves.fileName("https://va.media.tumblr.com/"));
        assertEquals("clip.webm", VideoSaves.fileName("https://example.com/clip.webm"));
        assertEquals("video/webm", VideoSaves.mimeType("clip.webm"));
        assertEquals("hidden.mp4", VideoSaves.fileName("https://example.com/..hidden"));
        assertTrue(VideoSaves.fileName("https://example.com/" + new String(new char[300]).replace('\0', 'x')).length() <= 104);
        String ys = new String(new char[95]).replace('\0', 'y');
        assertEquals("a long name cut at a dot isn't hidden", ys + ".mp4", VideoSaves.fileName("https://example.com/x." + ys + ".mp4"));
        assertFalse(VideoSaves.savable(null));
        assertFalse(VideoSaves.savable("file:///sdcard/v.mp4"));
        assertTrue(VideoSaves.savable("HTTPS://va.media.tumblr.com/x.mp4"));
    }

    private void tapSave(String address) {
        VideoLinks.press(null).onLongClick(controlsFor(address));
        shadowOf(ShadowAlertDialog.getLatestAlertDialog()).clickOnItem(2);
        ShadowLooper.idleMainLooper();
    }

    /** Android's storage prompt is a screen of its own, so Tumblr's pauses under it and resumes after. */
    private void backFromThePrompt() {
        controller.pause().resume();
        ShadowLooper.idleMainLooper();
    }

    private long saveFromMenu(String address) {
        int before = shadowOf(downloadManager()).getRequestCount();
        VideoLinks.press(null).onLongClick(controlsFor(address));
        shadowOf(ShadowAlertDialog.getLatestAlertDialog()).clickOnItem(2);
        ShadowLooper.idleMainLooper();
        assertEquals(before + 1, shadowOf(downloadManager()).getRequestCount());
        // Robolectric numbers downloads from 0.
        return before;
    }

    private void status(long id, int status) {
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(shadowOf(downloadManager()).getRequest(id));
        request.setStatus(status);
    }

    private static Intent finished(long id) {
        return new Intent(DownloadManager.ACTION_DOWNLOAD_COMPLETE).putExtra(DownloadManager.EXTRA_DOWNLOAD_ID, id);
    }

    private ShadowApplication.Wrapper completionListener() {
        ShadowApplication.Wrapper found = completionListenerOrNull();
        assertNotNull("no download listener registered", found);
        return found;
    }

    private ShadowApplication.Wrapper completionListenerOrNull() {
        for (ShadowApplication.Wrapper registration : shadowOf(application()).getRegisteredReceivers()) {
            if (registration.intentFilter.hasAction(DownloadManager.ACTION_DOWNLOAD_COMPLETE)) return registration;
        }
        return null;
    }

    /** Robolectric's request shadow doesn't report this, so read the framework's own flag. */
    private static boolean scannable(DownloadManager.Request request) throws Exception {
        Field flag = DownloadManager.Request.class.getDeclaredField("mScannable");
        flag.setAccessible(true);
        return flag.getBoolean(request);
    }

    private static int lifecycleCallbacks() throws Exception {
        Field list = Application.class.getDeclaredField("mActivityLifecycleCallbacks");
        list.setAccessible(true);
        return ((List<?>) list.get(application())).size();
    }

    private DownloadManager downloadManager() {
        return (DownloadManager) application().getSystemService(Context.DOWNLOAD_SERVICE);
    }

    private static Application application() {
        return RuntimeEnvironment.getApplication();
    }

    private List<String> menuItems() {
        AlertDialog menu = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull(menu);
        List<String> texts = new ArrayList<>();
        for (CharSequence item : shadowOf(menu).getItems()) texts.add(item.toString());
        return texts;
    }

    private View controlsFor(String address) {
        FrameLayout container = new FrameLayout(activity);
        View controls = new View(activity);
        container.addView(controls);
        VideoLinks.bind(container, address);
        return controls;
    }

    private static View containerOf(View controls) {
        return (View) controls.getParent();
    }
}
