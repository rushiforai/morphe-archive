package app.morphe.extension.tiktok.privacy;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.security.MessageDigest;
import java.util.Locale;

/**
 * What TikTok's own signature and installer reads get back once "Look like the store app" is on.
 * The extension answers TikTok's own package with TikTok's certificate and the Play Store, and
 * leaves every other read, and a paused build, untouched.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class StoreIdentityTest {
    /** The digest Morphe Manager holds a picked APK to, so a bad edit to the constant is caught. */
    private static final String TIKTOK_SIGNER_SHA256 =
            "9041803e91bcb814b4b4399fb5c85a91640b755e5e8ba76813814bf4cf2ab5ba";

    private Context context;
    private String ownPackage;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        ownPackage = context.getPackageName();
        Settings.STORE_IDENTITY.save(true);
    }

    @After public void tearDown() {
        Settings.STORE_IDENTITY.save(Settings.STORE_IDENTITY.defaultValue);
    }

    @Test public void theEmbeddedCertificateIsTikToks() throws Exception {
        byte[] der = StoreIdentity.signatures()[0].toByteArray();
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(der);
        StringBuilder hex = new StringBuilder();
        for (byte b : digest) hex.append(String.format(Locale.US, "%02x", b));
        assertEquals(TIKTOK_SIGNER_SHA256, hex.toString());
    }

    @Test public void aSignatureReadOfTikTokGetsTikToksCertificate() {
        PackageManager pm = context.getPackageManager();
        PackageInfo info = StoreIdentity.packageInfo(pm, ownPackage, PackageManager.GET_SIGNATURES);
        assertNotNull("a read of its own certificate should be answered", info);
        assertArrayEquals(StoreIdentity.signatures()[0].toByteArray(), info.signatures[0].toByteArray());
    }

    @Test public void aReadWithoutSignatureFlagsIsLeftAlone() {
        PackageManager pm = context.getPackageManager();
        assertNull(StoreIdentity.packageInfo(pm, ownPackage, 0));
    }

    @Test public void aReadOfAnotherPackageIsLeftAlone() {
        PackageManager pm = context.getPackageManager();
        assertNull(StoreIdentity.packageInfo(pm, "com.example.other", PackageManager.GET_SIGNATURES));
    }

    @Test public void pausedOrOffItAnswersNothing() {
        PackageManager pm = context.getPackageManager();
        Settings.STORE_IDENTITY.save(false);
        assertNull(StoreIdentity.packageInfo(pm, ownPackage, PackageManager.GET_SIGNATURES));
    }

    @Test public void theInstallerOfTikTokReadsAsThePlayStore() {
        PackageManager pm = context.getPackageManager();
        pm.setInstallerPackageName(ownPackage, "com.morphe.manager");
        assertEquals(StoreIdentity.STORE, StoreIdentity.installerFor(pm, ownPackage));
    }

    @Test public void anotherPackageGetsTheRealCallWithWhatItThrows() {
        PackageManager pm = context.getPackageManager();
        // Not TikTok's own package, so it gets exactly what the real call gives, a throw included.
        assertEquals(outcome(() -> pm.getInstallerPackageName("com.example.other")),
                outcome(() -> StoreIdentity.installerFor(pm, "com.example.other")));
        Settings.STORE_IDENTITY.save(false);
        assertEquals(outcome(() -> pm.getInstallerPackageName("com.example.other")),
                outcome(() -> StoreIdentity.installerFor(pm, "com.example.other")));
    }

    /** What a call returned, or the kind of exception it threw. */
    private static Object outcome(java.util.concurrent.Callable<String> call) {
        try {
            return "returned " + call.call();
        } catch (Exception thrown) {
            return thrown.getClass();
        }
    }

    @Test public void offTheInstallerReadsAsItReallyIs() {
        PackageManager pm = context.getPackageManager();
        pm.setInstallerPackageName(ownPackage, "com.morphe.manager");
        Settings.STORE_IDENTITY.save(false);
        assertEquals("com.morphe.manager", StoreIdentity.installerFor(pm, ownPackage));
    }
}
