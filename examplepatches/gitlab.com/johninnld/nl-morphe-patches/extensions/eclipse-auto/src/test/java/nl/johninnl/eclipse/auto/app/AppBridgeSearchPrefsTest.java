package nl.johninnl.eclipse.auto.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The search provider the car follows is the phone's own setting: the addon id the phone's Search
 * keeps in {@code search_prefs}. The app's classes are absent in a JVM test, so only the part that
 * touches nothing but preferences can run here.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class AppBridgeSearchPrefsTest {
    private final Context context = RuntimeEnvironment.getApplication();
    private final AppBridge bridge = new AppBridge(context);

    private SharedPreferences prefs() { return context.getSharedPreferences("search_prefs", 0); }

    @Test public void thePhonesStoredAddonIsTheSelection() {
        assertNull(bridge.selectedSearchProvider());
        prefs().edit().putString("active_addon_id", "provider-a").putString("selected_provider", "APPLE_MUSIC").commit();
        assertEquals("provider-a", bridge.selectedSearchProvider());
    }

    @Test public void aPickInTheCarIsWrittenWhereThePhoneReadsItAndTheBuiltInChoiceIsLeftAlone() {
        prefs().edit().putString("selected_provider", "TIDAL").commit();
        bridge.selectSearchProvider("provider-b");
        assertEquals("provider-b", prefs().getString("active_addon_id", null));
        assertEquals("the phone's built-in provider choice is not touched", "TIDAL", prefs().getString("selected_provider", null));
        assertEquals("provider-b", bridge.selectedSearchProvider());
    }

    @Test public void withoutTheAppsClassesTheProviderListIsEmptyNotAnError() {
        assertTrue(bridge.searchProviders().isEmpty());
    }
}
