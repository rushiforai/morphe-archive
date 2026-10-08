package app.morphe.extension.tiktok.privacy;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.pm.InstallSourceInfo;
import android.content.pm.PackageManager;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * How TikTok's Android 11 install source reads come back with "Look like the store app" on: the
 * Play Store installed it and started the install, and it came from nowhere else. Another
 * package's install source, and TikTok's with the switch off, read as they really are.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 35)
public class StoreInstallSourceTest {
    private static final String MANAGER = "app.morphe.manager";
    private static final String FILES = "com.example.files";
    private static final String OTHER = "com.example.other";

    private Context context;
    private PackageManager pm;
    private String ownPackage;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        pm = context.getPackageManager();
        ownPackage = context.getPackageName();
        shadowOf(pm).setInstallSourceInfo(ownPackage, MANAGER, null, FILES, MANAGER, null, 0);
        Settings.STORE_IDENTITY.save(true);
    }

    @After public void tearDown() {
        Settings.STORE_IDENTITY.save(Settings.STORE_IDENTITY.defaultValue);
        Settings.STORE_IDENTITY_INSTALLER.save(Settings.STORE_IDENTITY_INSTALLER.defaultValue);
    }

    @Test public void tikToksInstallSourceReadsAsThePlayStore() throws Exception {
        InstallSourceInfo info = StoreInstallSource.sourceFor(pm, ownPackage);
        assertEquals(StoreIdentity.STORE, StoreInstallSource.installingOf(info));
        assertEquals(StoreIdentity.STORE, StoreInstallSource.initiatingOf(info));
        assertNull(StoreInstallSource.originatingOf(info));
    }

    @Test public void tikToksInstallSourceReadsAsThePickedStore() throws Exception {
        Settings.STORE_IDENTITY_INSTALLER.save("com.huawei.appmarket");
        InstallSourceInfo info = StoreInstallSource.sourceFor(pm, ownPackage);
        assertEquals("com.huawei.appmarket", StoreInstallSource.installingOf(info));
        assertEquals("com.huawei.appmarket", StoreInstallSource.initiatingOf(info));
        assertNull(StoreInstallSource.originatingOf(info));
    }

    @Test public void offTikToksInstallSourceReadsAsItReallyIs() throws Exception {
        Settings.STORE_IDENTITY.save(false);
        InstallSourceInfo info = StoreInstallSource.sourceFor(pm, ownPackage);
        assertEquals(MANAGER, StoreInstallSource.installingOf(info));
        assertEquals(MANAGER, StoreInstallSource.initiatingOf(info));
        assertEquals(FILES, StoreInstallSource.originatingOf(info));
    }

    @Test public void anotherPackagesInstallSourceReadsAsItReallyIs() throws Exception {
        shadowOf(pm).setInstallSourceInfo(OTHER, MANAGER, null, FILES, MANAGER, null, 0);
        InstallSourceInfo info = StoreInstallSource.sourceFor(pm, OTHER);
        assertEquals(MANAGER, StoreInstallSource.installingOf(info));
        assertEquals(MANAGER, StoreInstallSource.initiatingOf(info));
        assertEquals(FILES, StoreInstallSource.originatingOf(info));
    }

    @Test(expected = PackageManager.NameNotFoundException.class)
    public void anUnknownPackageThrowsWhatTheRealCallThrows() throws Exception {
        StoreInstallSource.sourceFor(pm, "com.example.missing");
    }
}
