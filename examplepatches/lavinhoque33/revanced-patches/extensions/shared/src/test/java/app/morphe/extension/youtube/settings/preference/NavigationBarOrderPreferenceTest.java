/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.extension.youtube.settings.preference;

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
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.utils.StringRef;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.NavigationBar.NavigationButton;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class NavigationBarOrderPreferenceTest {
    @Before
    public void setUp() throws Exception {
        var context = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = context.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = context.getApplicationInfo();
        Shadows.shadowOf(context.getPackageManager()).installPackage(packageInfo);

        Field contextField = Utils.class.getDeclaredField("context");
        contextField.setAccessible(true);
        contextField.set(null, context);
        Settings.NAVIGATION_BAR_ORDER.save("");
        NavigationBar.setServerNavigationButtonOrder(List.of(NavigationButton.HOME, NavigationButton.SHORTS,
                NavigationButton.SUBSCRIPTIONS, NavigationButton.CREATE, NavigationButton.LIBRARY));
    }

    private static boolean hasStoredOrder() {
        return Setting.preferences.preferences.contains(Settings.NAVIGATION_BAR_ORDER.key);
    }

    @Test
    public void unchangedServerOrderOkLeavesTheKeyAbsent() {
        var pending = new NavigationBarOrderPreference.PendingOrder();
        assertEquals(List.of(NavigationButton.HOME, NavigationButton.SHORTS, NavigationButton.SUBSCRIPTIONS,
                NavigationButton.CREATE, NavigationButton.LIBRARY), pending.buttons.subList(0, 5));

        assertFalse(pending.save());
        assertEquals("", Settings.NAVIGATION_BAR_ORDER.get());
        assertFalse(hasStoredOrder());
    }

    @Test
    public void resetThenOkRemovesAnExistingOverride() {
        Settings.NAVIGATION_BAR_ORDER.save("LIBRARY,HOME,SHORTS,CREATE,SUBSCRIPTIONS");
        var pending = new NavigationBarOrderPreference.PendingOrder();
        assertTrue(hasStoredOrder());

        pending.reset();
        assertTrue(pending.save());
        assertEquals("", Settings.NAVIGATION_BAR_ORDER.get());
        assertFalse(hasStoredOrder());
        assertEquals(NavigationBar.getDefaultNavigationButtonOrder(), pending.buttons);
    }

    @Test
    public void movingCreateIntoTheOldFixedDefaultPositionStillSavesAnExplicitEdit() {
        var pending = new NavigationBarOrderPreference.PendingOrder();
        pending.buttons.remove(NavigationButton.CREATE);
        pending.buttons.add(2, NavigationButton.CREATE);

        assertTrue(pending.save());
        assertTrue(hasStoredOrder());
        assertTrue(Settings.NAVIGATION_BAR_ORDER.get().startsWith("HOME,SHORTS,CREATE,SUBSCRIPTIONS,LIBRARY,"));
        assertEquals(pending.buttons, NavigationBarOrderPreference.getCurrentOrder());
    }

    @Test
    public void editingBackToServerDefaultRemovesTheOverrideWithoutReset() {
        var pending = new NavigationBarOrderPreference.PendingOrder();
        pending.buttons.remove(NavigationButton.CREATE);
        pending.buttons.add(2, NavigationButton.CREATE);
        pending.save();
        assertTrue(hasStoredOrder());

        var reopened = new NavigationBarOrderPreference.PendingOrder();
        reopened.buttons.remove(NavigationButton.CREATE);
        reopened.buttons.add(3, NavigationButton.CREATE);
        assertTrue(reopened.save());
        assertFalse(hasStoredOrder());
        assertEquals("", Settings.NAVIGATION_BAR_ORDER.get());
    }

    @Test
    public void cancelingEditsDoesNotPersistOrChangeTheNativeBaseline() {
        var pending = new NavigationBarOrderPreference.PendingOrder();
        pending.buttons.remove(NavigationButton.CREATE);
        pending.buttons.add(2, NavigationButton.CREATE);

        assertFalse(hasStoredOrder());
        assertEquals(NavigationButton.SUBSCRIPTIONS, NavigationBarOrderPreference.getCurrentOrder().get(2));
    }

    @Test
    public void unchangedFallbackBeforeAnyGuideResponseAlsoLeavesTheKeyAbsent() {
        NavigationBar.setServerNavigationButtonOrder(List.of());
        var pending = new NavigationBarOrderPreference.PendingOrder();

        assertFalse(pending.save());
        assertFalse(hasStoredOrder());
    }

    @Test
    public void oldLibraryKeysKeepTheirPositionAndNeedNoMigration() {
        Settings.NAVIGATION_BAR_ORDER.save("library,home,create,subscriptions,shorts");
        List<NavigationButton> order = NavigationBarOrderPreference.getCurrentOrder();
        assertEquals(List.of(NavigationButton.LIBRARY, NavigationButton.HOME, NavigationButton.CREATE,
                NavigationButton.SUBSCRIPTIONS, NavigationButton.SHORTS), order.subList(0, 5));
        new NavigationBarOrderPreference.PendingOrder().save();
        assertTrue(Settings.NAVIGATION_BAR_ORDER.get().startsWith("LIBRARY,HOME,CREATE,SUBSCRIPTIONS,SHORTS,"));
    }

    @Test
    public void importsIgnoreDuplicatesAndUnknownEntriesAndRetainOptionalButtons() {
        Settings.NAVIGATION_BAR_ORDER.save("library,UNKNOWN,library,create, HOME");
        List<NavigationButton> order = NavigationBarOrderPreference.getCurrentOrder();
        assertEquals(List.of(NavigationButton.LIBRARY, NavigationButton.CREATE, NavigationButton.HOME),
                order.subList(0, 3));
        assertEquals(NavigationBar.getDefaultNavigationButtonOrder().size(), order.size());
        assertEquals(order.size(), order.stream().distinct().count());
        assertTrue(order.containsAll(NavigationBar.getDefaultNavigationButtonOrder()));
    }

    @Test
    @SuppressWarnings("unchecked")
    public void youLabelDoesNotChangeThePersistedLibraryIdentity() throws Exception {
        Field stringsField = StringRef.class.getDeclaredField("strings");
        stringsField.setAccessible(true);
        Map<String, StringRef> strings = (Map<String, StringRef>) stringsField.get(null);
        strings.put("revanced_navigation_bar_order_you", StringRef.constant("You"));
        strings.put("revanced_change_start_page_entry_library", StringRef.constant("Library"));

        assertEquals("You", NavigationBarOrderPreference.getLabel(NavigationButton.LIBRARY));
        assertEquals("LIBRARY", NavigationButton.LIBRARY.name());
    }
}
