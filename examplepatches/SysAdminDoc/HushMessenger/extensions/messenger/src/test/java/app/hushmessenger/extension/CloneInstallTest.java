package app.hushmessenger.extension;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.ProviderInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowPackageManager;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/** A clone install runs the same extension under another package name, with its manifest moved to match. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class CloneInstallTest {
    private static final String MESSENGER = "com.facebook.orca";
    private static final String CLONE = "com.facebook.orca.hush";

    private static Context runningAs(String packageName) {
        return new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public String getPackageName() { return packageName; }
        };
    }

    /** What the patched manifest of {@code packageName} declares for the settings provider. */
    private static void install(String packageName, String authority, String provider) {
        ShadowPackageManager packages = shadowOf(RuntimeEnvironment.getApplication().getPackageManager());
        PackageInfo info = new PackageInfo();
        info.packageName = packageName;
        info.applicationInfo = new ApplicationInfo();
        info.applicationInfo.packageName = packageName;
        packages.installPackage(info);
        ProviderInfo settings = new ProviderInfo();
        settings.packageName = packageName;
        settings.name = provider;
        settings.authority = authority;
        settings.applicationInfo = info.applicationInfo;
        packages.addOrUpdateProvider(settings);
    }

    @Test public void theExtensionsOwnBuildFindsItsProvider() {
        Context app = RuntimeEnvironment.getApplication();
        assertEquals(app.getPackageName() + ".hush.settings", app.getPackageName() + HostScreens.SETTINGS_AUTHORITY_SUFFIX);
        assertTrue(HostScreens.settingsProviderFound(app));
    }

    @Test public void aCloneFindsItsProviderUnderItsOwnNameAndNeverTheOneBesideIt() {
        install(MESSENGER, MESSENGER + HostScreens.SETTINGS_AUTHORITY_SUFFIX, SettingsProvider.class.getName());
        assertTrue(HostScreens.settingsProviderFound(runningAs(MESSENGER)));
        // Messenger's provider answers only to Messenger's name, so the clone doesn't take it for its own.
        assertFalse(HostScreens.settingsProviderFound(runningAs(CLONE)));

        install(CLONE, CLONE + HostScreens.SETTINGS_AUTHORITY_SUFFIX, SettingsProvider.class.getName());
        assertTrue(HostScreens.settingsProviderFound(runningAs(CLONE)));
        assertTrue(HostScreens.settingsProviderFound(runningAs(MESSENGER)));
    }

    @Test public void anotherProviderUnderTheCloneAuthorityDoesNotCount() {
        install(CLONE, CLONE + HostScreens.SETTINGS_AUTHORITY_SUFFIX, "other.Provider");
        assertFalse(HostScreens.settingsProviderFound(runningAs(CLONE)));
        // The clone's authority declared by some other app.
        install("com.example.other", "com.example.copy" + HostScreens.SETTINGS_AUTHORITY_SUFFIX, SettingsProvider.class.getName());
        assertFalse(HostScreens.settingsProviderFound(runningAs("com.example.copy")));
    }

    @Test public void theCloneVouchesOnlyForItselfWhileMessengerKeepsItsAnswer() {
        try {
            MessengerSignature.ownPackage = CLONE;
            PackageInfo clone = new PackageInfo();
            clone.packageName = CLONE;
            assertNotNull(MessengerSignature.originalSigners(clone));
            PackageInfo messenger = new PackageInfo();
            messenger.packageName = MESSENGER;
            assertNull(MessengerSignature.originalSigners(messenger));

            MessengerSignature.ownPackage = MESSENGER;
            assertNotNull(MessengerSignature.originalSigners(messenger));
            assertNull(MessengerSignature.originalSigners(clone));
        } finally {
            MessengerSignature.ownPackage = null;
        }
    }
}
