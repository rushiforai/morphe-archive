package app.morphe.extension.tiktok.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThrows;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.pm.PermissionInfo;
import android.content.pm.ProviderInfo;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * What a renamed copy of TikTok writes into the {@code package} field of AppLog's registration
 * header, and what it answers where TikTok names the store package to mean itself. Robolectric's
 * app runs under its own package, so here it stands for a copy that Clone app renamed: its own
 * name goes out as the store app's in the header, its own name stands in for the store package in
 * TikTok's checks for its own, and a provider authority or permission comes back as its manifest
 * declares it. A build under the store app's name, a paused one and one without a context yet
 * answer what TikTok wrote.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class BesideStoreAppTest {
    private static final String MULTIPROCESS_AUTHORITY = "com.ss.android.common.multiprocess.SHARE_PROVIDER_AUTHORITY1233";
    private static final String WALLPAPER_AUTHORITY = "com.zhiliaoapp.musically.wallpapercaller";
    private static final String WALLPAPER_PERMISSION = "com.zhiliaoapp.musically.permission.wallpaper";

    private Context context;
    private String ownPackage;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        ownPackage = context.getPackageName();
        PausedProcess.set(false);
        BesideStoreApp.resetForTests();
    }

    @After public void tearDown() {
        Utils.setContext(context);
        PausedProcess.set(false);
        BesideStoreApp.resetForTests();
    }

    @Test public void theTestAppRunsUnderAnotherPackageThanTheStoreApp() {
        assertNotEquals(BesideStoreApp.STORE_PACKAGE, ownPackage);
    }

    @Test public void aRenamedCopyRegistersUnderTheStorePackage() throws JSONException {
        JSONObject header = new JSONObject();
        assertSame("TikTok's call returns the header it wrote to",
                header, BesideStoreApp.putPackage(header, "package", ownPackage));
        assertEquals(BesideStoreApp.STORE_PACKAGE, header.getString("package"));
    }

    @Test public void theRestOfTheHeaderSaysWhatIsInstalled() throws JSONException {
        JSONObject header = new JSONObject();
        BesideStoreApp.putPackage(header, "real_package_name", ownPackage);
        BesideStoreApp.putPackage(header, "app_version", "47.1.4");
        BesideStoreApp.putPackage(header, "sig_hash", "1069fee951d60f3a194f14b337a3810d");
        assertEquals(ownPackage, header.getString("real_package_name"));
        assertEquals("47.1.4", header.getString("app_version"));
        assertEquals("1069fee951d60f3a194f14b337a3810d", header.getString("sig_hash"));
    }

    /** A build that kept TikTok's package name writes it unchanged. */
    @Test public void theStoreAppsOwnNameIsLeftAlone() throws JSONException {
        Utils.setContext(storeApp());
        assertFalse(BesideStoreApp.renamed(BesideStoreApp.STORE_PACKAGE));
        JSONObject header = new JSONObject();
        BesideStoreApp.putPackage(header, "package", BesideStoreApp.STORE_PACKAGE);
        assertEquals(BesideStoreApp.STORE_PACKAGE, header.getString("package"));
    }

    /** Only the copy's own name is swapped, never some other package that reaches the field. */
    @Test public void anotherPackageInTheFieldIsLeftAlone() throws JSONException {
        JSONObject header = new JSONObject();
        BesideStoreApp.putPackage(header, "package", "com.example.other");
        assertEquals("com.example.other", header.getString("package"));
    }

    @Test public void pausedTheCopyWritesItsOwnName() throws JSONException {
        PausedProcess.set(true);
        JSONObject header = new JSONObject();
        BesideStoreApp.putPackage(header, "package", ownPackage);
        assertEquals(ownPackage, header.getString("package"));
    }

    /** Before Hushfeed has a context the pause isn't decided, so TikTok's value goes out. */
    @Test public void withoutAContextTheCopyWritesItsOwnName() throws JSONException {
        Utils.setContext(null);
        try {
            JSONObject header = new JSONObject();
            BesideStoreApp.putPackage(header, "package", ownPackage);
            assertEquals(ownPackage, header.getString("package"));
        } finally {
            Utils.setContext(context);
        }
    }

    @Test public void aValueThatIsntTextGoesThrough() throws JSONException {
        JSONObject header = new JSONObject();
        BesideStoreApp.putPackage(header, "package", 7);
        assertEquals(7, header.getInt("package"));
        // JSONObject.put with a null value removes the field, as TikTok's own call would.
        BesideStoreApp.putPackage(header, "package", null);
        assertFalse(header.has("package"));
    }

    @Test public void aNullKeyThrowsAsTikToksCallDoes() {
        assertThrows(JSONException.class, () -> BesideStoreApp.putPackage(new JSONObject(), null, ownPackage));
    }

    /** Where TikTok checks for its own package, a renamed copy's own name stands in for the store one. */
    @Test public void aRenamedCopyIsItsOwnPackageWhereTikTokNamesTheStoreOne() {
        assertEquals(ownPackage, BesideStoreApp.ownPackage(BesideStoreApp.STORE_PACKAGE));
        // Only the store package is swapped: TikTok Asia's and any other name stay as loaded.
        assertEquals("com.ss.android.ugc.trill", BesideStoreApp.ownPackage("com.ss.android.ugc.trill"));
        assertNull(BesideStoreApp.ownPackage(null));
    }

    @Test public void theStoreAppAPauseAndNoContextKeepTheStorePackageInTheChecks() {
        Utils.setContext(storeApp());
        assertEquals(BesideStoreApp.STORE_PACKAGE, BesideStoreApp.ownPackage(BesideStoreApp.STORE_PACKAGE));
        Utils.setContext(context);
        PausedProcess.set(true);
        assertEquals(BesideStoreApp.STORE_PACKAGE, BesideStoreApp.ownPackage(BesideStoreApp.STORE_PACKAGE));
        PausedProcess.set(false);
        Utils.setContext(null);
        try {
            assertEquals(BesideStoreApp.STORE_PACKAGE, BesideStoreApp.ownPackage(BesideStoreApp.STORE_PACKAGE));
        } finally {
            Utils.setContext(context);
        }
    }

    /** Clone app's two renames: the new package in place of the store one, or in front with an underscore. */
    @Test public void aNameIsAnsweredAsTheManifestDeclaresIt() {
        Set<String> names = new HashSet<>(Arrays.asList(
                ownPackage + ".push.SHARE_PROVIDER_AUTHORITY",
                ownPackage + "_" + MULTIPROCESS_AUTHORITY,
                ownPackage + ".wallpapercaller",
                ownPackage + ".permission.wallpaper"));
        assertEquals("a name the manifest holds as it is",
                ownPackage + ".push.SHARE_PROVIDER_AUTHORITY",
                BesideStoreApp.declared(ownPackage + ".push.SHARE_PROVIDER_AUTHORITY", ownPackage, names));
        assertEquals("a name Clone app put the package in front of",
                ownPackage + "_" + MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY, ownPackage, names));
        assertEquals("an authority Clone app renamed in place",
                ownPackage + ".wallpapercaller", BesideStoreApp.declared(WALLPAPER_AUTHORITY, ownPackage, names));
        assertEquals("a permission Clone app renamed in place",
                ownPackage + ".permission.wallpaper", BesideStoreApp.declared(WALLPAPER_PERMISSION, ownPackage, names));
        assertEquals("a name the manifest doesn't hold either way",
                "com.zhiliaoapp.musically.fileprovider", BesideStoreApp.declared("com.zhiliaoapp.musically.fileprovider", ownPackage, names));
        assertEquals("the store package itself isn't an authority",
                BesideStoreApp.STORE_PACKAGE, BesideStoreApp.declared(BesideStoreApp.STORE_PACKAGE, ownPackage, names));
    }

    /** The name as the manifest holds it wins over a rename the manifest also happens to hold. */
    @Test public void aNameTheManifestHoldsAsItIsStaysAsItIs() {
        Set<String> names = new HashSet<>(Arrays.asList(MULTIPROCESS_AUTHORITY, ownPackage + "_" + MULTIPROCESS_AUTHORITY));
        assertEquals(MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY, ownPackage, names));
    }

    @Test public void theManifestsProvidersAndPermissionsAreReadOnce() {
        declareInManifest(
                ownPackage + ".push.SHARE_PROVIDER_AUTHORITY;" + ownPackage + "_" + MULTIPROCESS_AUTHORITY,
                ownPackage + ".wallpapercaller");
        assertEquals(ownPackage + "_" + MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY));
        assertEquals(ownPackage + ".wallpapercaller", BesideStoreApp.declared(WALLPAPER_AUTHORITY));
        assertEquals(ownPackage + ".permission.wallpaper", BesideStoreApp.declared(WALLPAPER_PERMISSION));
        assertEquals("a name the manifest doesn't declare", "com.zhiliaoapp.musically.fileprovider",
                BesideStoreApp.declared("com.zhiliaoapp.musically.fileprovider"));
        assertNull(BesideStoreApp.declared(null));

        // Read once: a manifest that changes under a running process isn't a thing, and the
        // provider shell asks for every name at process start.
        declareInManifest(ownPackage + ".other");
        assertEquals(ownPackage + "_" + MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY));
        BesideStoreApp.resetForTests();
        assertEquals(MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY));
    }

    @Test public void theStoreAppAPauseAndNoContextLeaveANameAsTikTokBuiltIt() {
        declareInManifest(ownPackage + "_" + MULTIPROCESS_AUTHORITY);
        Utils.setContext(storeApp());
        assertEquals(MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY));
        Utils.setContext(context);
        PausedProcess.set(true);
        assertEquals(MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY));
        PausedProcess.set(false);
        Utils.setContext(null);
        try {
            assertEquals(MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY));
        } finally {
            Utils.setContext(context);
        }
        // And unpaused, with its context back, the copy's declared name.
        assertEquals(ownPackage + "_" + MULTIPROCESS_AUTHORITY, BesideStoreApp.declared(MULTIPROCESS_AUTHORITY));
    }

    /** A context that answers the store app's package name, standing for a build that kept it. */
    private Context storeApp() {
        return new ContextWrapper(context) {
            @Override public String getPackageName() {
                return BesideStoreApp.STORE_PACKAGE;
            }
        };
    }

    /**
     * Puts providers with these authorities, and the wallpaper permission under the test's own
     * package, into the package manager as the copy's manifest would declare them.
     */
    private void declareInManifest(String... authorities) {
        PackageInfo info = new PackageInfo();
        info.packageName = ownPackage;
        info.applicationInfo = context.getApplicationInfo();
        info.providers = new ProviderInfo[authorities.length];
        for (int i = 0; i < authorities.length; i++) {
            ProviderInfo provider = new ProviderInfo();
            provider.packageName = ownPackage;
            provider.name = "com.ss.android.ugc.aweme.crash.cp.ShellProvider" + i;
            provider.authority = authorities[i];
            info.providers[i] = provider;
        }
        PermissionInfo permission = new PermissionInfo();
        permission.packageName = ownPackage;
        permission.name = ownPackage + ".permission.wallpaper";
        info.permissions = new PermissionInfo[] { permission };
        shadowOf(context.getPackageManager()).installPackage(info);
    }
}
