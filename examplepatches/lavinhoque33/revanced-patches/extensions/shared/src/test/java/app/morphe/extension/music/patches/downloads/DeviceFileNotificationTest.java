/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.NotificationManager;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Looper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class DeviceFileNotificationTest {
    @Test
    public void earlierNotificationOpensItsOwnFileAfterAnotherDownloadCompletes() throws Exception {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "9.45.51";
        info.applicationInfo = app.getApplicationInfo();
        shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
        var manager = shadowOf(app.getSystemService(NotificationManager.class));
        manager.setNotificationsEnabled(true);

        Uri first = Uri.parse("content://media/external/audio/media/123");
        Uri second = Uri.parse("content://media/external/audio/media/124");
        LocalDownloadManager.showDownloadNotification("a", "First", 100, false, "Saved",
                new LocalDownloadManager.Saved(first, true, "audio/mp4"));
        LocalDownloadManager.showDownloadNotification("b", "Second", 100, false, "Saved",
                new LocalDownloadManager.Saved(second, true, "audio/ogg"));
        LocalDownloadManager.showDownloadNotification("batch", "Album", 100, false, "Two files saved");
        shadowOf(Looper.getMainLooper()).idle();

        var notification = manager.getNotification("a".hashCode());
        assertNotNull(notification);
        notification.actions[0].actionIntent.send();
        Intent view = shadowOf(app).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, view.getAction());
        assertEquals(first, view.getData());
        assertEquals(first, view.getClipData().getItemAt(0).getUri());
        assertEquals("audio/mp4", view.getType());
        assertTrue((view.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0);
        assertEquals(0, view.getFlags() & Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        assertNull(manager.getNotification("batch".hashCode()).contentIntent);
    }
}
