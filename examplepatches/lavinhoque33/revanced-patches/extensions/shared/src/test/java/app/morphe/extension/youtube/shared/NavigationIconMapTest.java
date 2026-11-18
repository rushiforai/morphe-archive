/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.shared;

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
import java.util.EnumMap;
import java.util.Map;

import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class NavigationIconMapTest {
    private enum Icon { HOME, NOTIFICATIONS }

    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, application);
    }

    @Test
    public void missingIconCopiesImmutableMapAndPreservesExistingEntries() {
        Map<Icon, Integer> original = Map.of(Icon.HOME, 42);
        Map<?, ?> repaired = NavigationBar.withCairoNotificationFilledIcon(original, Icon.NOTIFICATIONS);

        assertNotSame(original, repaired);
        assertEquals(42, repaired.get(Icon.HOME));
        assertTrue(repaired.containsKey(Icon.NOTIFICATIONS));
        assertFalse(original.containsKey(Icon.NOTIFICATIONS));
        assertEquals(2, repaired.size());
    }

    @Test
    public void existingIconReturnsOriginalWithoutCopyOrReplacement() {
        Map<Icon, Integer> original = Map.of(Icon.HOME, 42, Icon.NOTIFICATIONS, 99);
        Map<?, ?> repaired = NavigationBar.withCairoNotificationFilledIcon(original, Icon.NOTIFICATIONS);

        assertSame(original, repaired);
        assertEquals(99, repaired.get(Icon.NOTIFICATIONS));
    }

    @Test
    public void legacyEnumMapHookStillMutatesInPlaceAndPreservesExistingIcon() {
        EnumMap<Icon, Integer> original = new EnumMap<>(Icon.class);
        original.put(Icon.HOME, 42);
        NavigationBar.setCairoNotificationFilledIcon(original, Icon.NOTIFICATIONS);
        assertTrue(original.containsKey(Icon.NOTIFICATIONS));
        assertEquals(Integer.valueOf(42), original.get(Icon.HOME));

        original.put(Icon.NOTIFICATIONS, 99);
        NavigationBar.setCairoNotificationFilledIcon(original, Icon.NOTIFICATIONS);
        assertEquals(Integer.valueOf(99), original.get(Icon.NOTIFICATIONS));
    }
}
