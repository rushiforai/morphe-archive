/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.extension.music.patches.general;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class SettingsShortcutPatchTest {
    private Intent launch(Activity activity, boolean rvx) throws Exception {
        var method = SettingsShortcutPatch.class.getDeclaredMethod("openSettings", Context.class, boolean.class);
        method.setAccessible(true);
        method.invoke(null, activity, rvx);
        return Shadows.shadowOf(activity).getNextStartedActivity();
    }

    @Test
    public void tapSuppliesTheNativeRootFragment() throws Exception {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Intent intent = launch(activity, false);

            assertEquals(activity.getPackageName(), intent.getComponent().getPackageName());
            assertEquals("com.google.android.apps.youtube.music.settings.SettingsCompatActivity",
                    intent.getComponent().getClassName());
            assertEquals("com.google.android.apps.youtube.music.settings.fragment.SettingsHeadersFragment",
                    intent.getStringExtra(":android:show_fragment"));
            assertTrue(intent.getBooleanExtra(":android:no_headers", false));
            assertNull(intent.getData());
        }
    }

    @Test
    public void longPressKeepsTheExistingRvxRoute() throws Exception {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Intent intent = launch(activity, true);

            assertEquals(activity.getPackageName(), intent.getComponent().getPackageName());
            assertEquals("com.google.android.gms.common.api.GoogleApiActivity", intent.getComponent().getClassName());
            assertEquals("revanced_settings_intent", intent.getDataString());
            assertFalse(intent.hasExtra(":android:show_fragment"));
            assertFalse(intent.hasExtra(":android:no_headers"));
        }
    }

    @Test
    public void routesDoNotReuseEachOthersIntent() throws Exception {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Intent tap = launch(activity, false);
            Intent hold = launch(activity, true);
            Intent nextTap = launch(activity, false);

            assertNotSame(tap, hold);
            assertNotSame(tap, nextTap);
            assertEquals(tap.getExtras().getString(":android:show_fragment"),
                    nextTap.getExtras().getString(":android:show_fragment"));
            assertNull(nextTap.getData());
        }
    }
}
