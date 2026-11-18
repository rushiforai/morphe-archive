/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.util.Base64;

import com.google.protobuf.CodedOutputStream;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class OpenSystemShareSheetPatchTest {
    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.39.525";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, application);
        Utils.setActivity(null);
        Settings.CHANGE_SHARE_SHEET.save(true);
        Settings.REPLACE_LINKS_WITH_SHORTENER.save(false);
    }

    private static byte[] field(int number, String value) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        output.writeString(number, value);
        output.flush();
        return bytes.toByteArray();
    }

    private static byte[] endpoint(int entityField, String id) throws Exception {
        return field(1, Base64.encodeToString(field(entityField, id), Base64.NO_WRAP));
    }

    private static void assertChooser(Intent chooser, boolean newTask, String url) {
        assertNotNull(chooser);
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        assertEquals(newTask, (chooser.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertTrue((chooser.getFlags() & Intent.FLAG_ACTIVITY_NO_USER_ACTION) != 0);
        Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertNotNull(send);
        assertEquals(url, send.getStringExtra(Intent.EXTRA_TEXT));
    }

    @Test
    public void sharesVideoInCurrentActivityTask() throws Exception {
        try (var activity = Robolectric.buildActivity(Activity.class).setup()) {
            Utils.setActivity(activity.get());

            assertTrue(OpenSystemShareSheetPatch.openSystemShareSheet(endpoint(1, "video_123")));
            assertChooser(Shadows.shadowOf(activity.get()).getNextStartedActivity(), false,
                    "https://www.youtube.com/watch?v=video_123");
        }
    }

    @Test
    public void fallsBackToApplicationTaskWithoutActivity() throws Exception {
        assertTrue(OpenSystemShareSheetPatch.openSystemShareSheet(endpoint(2, "PL123")));
        assertChooser(Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity(), true,
                "https://www.youtube.com/playlist?list=PL123");
    }

    @Test
    public void fallsBackToApplicationTaskForFinishingActivity() throws Exception {
        try (var activity = Robolectric.buildActivity(Activity.class).setup()) {
            Utils.setActivity(activity.get());
            activity.get().finish();

            assertTrue(OpenSystemShareSheetPatch.openSystemShareSheet(endpoint(1, "video_123")));
            assertChooser(Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity(), true,
                    "https://www.youtube.com/watch?v=video_123");
        }
    }

    @Test
    public void mixWithoutVideoUsesNativeShareInsteadOfInvalidPlaylistLink() throws Exception {
        assertFalse(OpenSystemShareSheetPatch.openSystemShareSheet(endpoint(2, "RD123")));
        assertFalse(OpenSystemShareSheetPatch.openSystemShareSheet(endpoint(2, "RDAMVM123")));
        assertNull(Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity());
    }

    @Test
    public void disabledSettingLeavesNativeShareUntouched() throws Exception {
        Settings.CHANGE_SHARE_SHEET.save(false);
        assertFalse(OpenSystemShareSheetPatch.openSystemShareSheet(endpoint(1, "video_123")));
        assertNull(Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity());
    }
}
