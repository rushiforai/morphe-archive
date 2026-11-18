/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.shared.patches.components;

import static org.junit.Assert.*;

import android.content.pm.PackageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;

import app.morphe.extension.music.patches.components.LayoutComponentsFilter;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class MusicDownloadsShelfFilterTest {
    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "9.40.51";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, application);
    }

    private static StringFilterGroup downloadsGroup() {
        Filter filter = new LayoutComponentsFilter();
        return filter.pathCallbacks.stream()
                .filter(group -> group.setting == Settings.HIDE_YOUR_DOWNLOADS_SHELF)
                .findFirst().orElseThrow();
    }

    @Test
    public void shelfIsVisibleByDefault() {
        assertFalse(Settings.HIDE_YOUR_DOWNLOADS_SHELF.get());
        assertFalse(downloadsGroup().check("music_downloads_shelf.eml").isFiltered());
    }

    @Test
    public void optInTargetsOnlyDownloadsShelfPath() {
        Settings.HIDE_YOUR_DOWNLOADS_SHELF.save(true);
        StringFilterGroup group = downloadsGroup();
        assertTrue(group.check("root|music_downloads_shelf.eml|item").isFiltered());
        assertFalse(group.check("chip_cloud_chip.eml|Downloads").isFiltered());
        assertFalse(group.check("music_library_downloaded_playlists.eml").isFiltered());
        assertFalse(group.check("music_responsive_list_item.eml").isFiltered());

        Filter filter = new LayoutComponentsFilter();
        assertTrue(filter.identifierCallbacks.stream()
                .noneMatch(callback -> callback.setting == Settings.HIDE_YOUR_DOWNLOADS_SHELF));
    }
}
