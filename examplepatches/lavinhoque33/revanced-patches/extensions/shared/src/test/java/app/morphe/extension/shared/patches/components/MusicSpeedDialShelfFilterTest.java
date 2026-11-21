/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.patches.components;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;

import app.morphe.extension.music.patches.components.SpeedDialShelfFilter;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class MusicSpeedDialShelfFilterTest {
    private static final String SHELF_ID = "music_speed_dial_shelf.eml-js-fe|27cb8c57bfa90fa6";
    private static final String SHELF_PATH = SHELF_ID + "|CellType|";
    private static final byte[] EMPTY_BUFFER = new byte[0];

    @Before
    public void setUp() throws ReflectiveOperationException {
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

    @Test
    public void speedDialRemainsVisibleByDefault() {
        Filter filter = new SpeedDialShelfFilter();
        assertFalse(filters(filter, SHELF_ID, SHELF_PATH));
    }

    @Test
    public void optInRemovesOnlyTheRootSpeedDialShelf() {
        Settings.HIDE_SPEED_DIAL_SHELF.save(true);
        Filter filter = new SpeedDialShelfFilter();
        assertTrue(filters(filter, SHELF_ID, SHELF_PATH));
        assertFalse(filters(filter, SHELF_ID, SHELF_PATH + "music_speed_dial_item.eml-fe|hash|CellType|"));
        assertFalse(filters(filter, SHELF_ID, "feed.eml|hash|CellType|" + SHELF_PATH));
        assertVisible(filter, "music_speed_dial_shelf_internal.eml-fe|12d15202db0b53f5");
        assertVisible(filter, "music_grid_item_carousel.eml-fe|9e42825bb6a2156b");
        assertVisible(filter, "music_menu_item.eml|hash");
        assertTrue(filter.pathCallbacks.isEmpty());
    }

    private static void assertVisible(Filter filter, String identifier) {
        assertFalse(filters(filter, identifier, identifier + "|CellType|"));
    }

    private static boolean filters(Filter filter, String identifier, String path) {
        for (StringFilterGroup group : filter.identifierCallbacks) {
            var match = group.check(identifier);
            if (match.isFiltered() && filter.isFiltered(null, identifier, "", path, EMPTY_BUFFER,
                    group, Filter.FilterContentType.IDENTIFIER, match.getMatchedIndex())) {
                return true;
            }
        }

        return false;
    }
}
