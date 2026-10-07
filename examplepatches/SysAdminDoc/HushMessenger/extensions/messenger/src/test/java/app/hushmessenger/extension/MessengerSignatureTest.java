package app.hushmessenger.extension;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.Process;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowBinder;
import org.robolectric.shadows.ShadowPackageManager;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MessengerSignatureTest {
    private static final int FACEBOOK_UID = 10_588;
    private static final Signature MANAGER_KEY = new Signature(new byte[] {1, 2, 3});
    private static final Signature OTHER_KEY = new Signature(new byte[] {4, 5, 6});

    private ShadowPackageManager packages;

    @Before public void setUp() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        packages = shadowOf(RuntimeEnvironment.getApplication().getPackageManager());
        reset();
        install(RuntimeEnvironment.getApplication().getPackageName(), Process.myUid(), MANAGER_KEY);
    }

    @After public void tearDown() {
        ShadowBinder.reset();
        reset();
    }

    private static void reset() {
        MessengerSignature.ownSigners = null;
        MessengerSignature.ownPackage = null;
        for (int i = 0; i < MessengerSignature.CALLER_OUTCOMES.length; i++) MessengerSignature.callerCounts.set(i, 0);
    }

    private PackageInfo install(String name, int uid, Signature signer) {
        PackageInfo info = new PackageInfo();
        info.packageName = name;
        info.applicationInfo = new ApplicationInfo();
        info.applicationInfo.packageName = name;
        info.applicationInfo.uid = uid;
        SigningInfo signing = Shadow.newInstanceOf(SigningInfo.class);
        shadowOf(signing).setSignatures(new Signature[] {signer});
        info.signingInfo = signing;
        info.signatures = new Signature[] {signer};
        packages.installPackage(info);
        return info;
    }

    /** Facebook installed under its own uid and signed with {@code signer}, now calling Messenger. */
    private PackageInfo callingFacebook(Signature signer) {
        PackageInfo facebook = install(MessengerSignature.FACEBOOK, FACEBOOK_UID, signer);
        packages.setPackagesForUid(FACEBOOK_UID, MessengerSignature.FACEBOOK);
        ShadowBinder.setCallingUid(FACEBOOK_UID);
        return facebook;
    }

    private static int count(int outcome) {
        return MessengerSignature.callerCounts.get(outcome);
    }

    private static void assertMetaCertificate(List<Signature> signers) throws Exception {
        assertNotNull(signers);
        assertEquals(1, signers.size());
        byte[] der = signers.get(0).toByteArray();
        StringBuilder hex = new StringBuilder();
        for (byte b : java.security.MessageDigest.getInstance("SHA-256").digest(der)) hex.append(String.format("%02x", b));
        assertTrue(MessengerSignature.META_SIGNERS.contains(hex.toString()));
    }

    @Test public void messengerItselfAlwaysGetsMetasCertificate() throws Exception {
        MessengerSignature.ownPackage = "com.facebook.orca";
        PackageInfo messenger = new PackageInfo();
        messenger.packageName = "com.facebook.orca";
        assertMetaCertificate(MessengerSignature.originalSigners(messenger));
        assertNull(MessengerSignature.originalSigners(null));
    }

    @Test public void aCloneAnswersForItsOwnNameAndNotForTheMessengerBesideIt() throws Exception {
        MessengerSignature.ownPackage = "com.facebook.orca.hush";
        PackageInfo clone = new PackageInfo();
        clone.packageName = "com.facebook.orca.hush";
        assertMetaCertificate(MessengerSignature.originalSigners(clone));
        PackageInfo messenger = new PackageInfo();
        messenger.packageName = "com.facebook.orca";
        assertNull(MessengerSignature.originalSigners(messenger));
    }

    @Test public void theOwnPackageComesFromTheProcessName() {
        String own = RuntimeEnvironment.getApplication().getPackageName();
        assertEquals(own, android.app.Application.getProcessName());
        assertEquals(own, MessengerSignature.ownPackage());
        assertEquals(own, MessengerSignature.ownPackage);
        PackageInfo self = new PackageInfo();
        self.packageName = own;
        assertNotNull(MessengerSignature.originalSigners(self));
        PackageInfo messenger = new PackageInfo();
        messenger.packageName = MessengerSignature.PACKAGE;
        assertNull(MessengerSignature.originalSigners(messenger));
    }

    @Test public void sameKeyFacebookCallingMessengerIsAnsweredAsMetaSigned() throws Exception {
        PackageInfo facebook = callingFacebook(MANAGER_KEY);
        assertMetaCertificate(MessengerSignature.originalSigners(facebook));
        assertEquals(1, count(MessengerSignature.TRUSTED));
        assertEquals("trusted=1, signer_differs=0, meta_signed_build=0, not_family=0, error=0", MessengerSignature.callerSummary());
    }

    @Test public void facebookWithAnotherSignerKeepsItsRealSigners() {
        PackageInfo facebook = callingFacebook(OTHER_KEY);
        assertNull(MessengerSignature.originalSigners(facebook));
        assertEquals(1, count(MessengerSignature.SIGNER_DIFFERS));
        assertEquals(0, count(MessengerSignature.TRUSTED));
    }

    @Test public void facebookCarryingThisKeyPlusAnotherIsNotTheSameSigner() {
        PackageInfo facebook = callingFacebook(MANAGER_KEY);
        shadowOf(facebook.signingInfo).setSignatures(new Signature[] {MANAGER_KEY, OTHER_KEY});
        packages.installPackage(facebook);
        assertNull(MessengerSignature.originalSigners(facebook));
        assertEquals(1, count(MessengerSignature.SIGNER_DIFFERS));
        assertEquals(0, count(MessengerSignature.TRUSTED));
    }

    @Test public void aProcessWithoutTheSettingsProviderStillChecksTheCaller() throws Exception {
        Settings.appContext = null;
        try {
            assertMetaCertificate(MessengerSignature.originalSigners(callingFacebook(MANAGER_KEY)));
            assertEquals(1, count(MessengerSignature.TRUSTED));
        } finally {
            Settings.initialize(RuntimeEnvironment.getApplication());
        }
    }

    @Test public void packageInfoWithoutApplicationInfoIsLeftAlone() {
        PackageInfo facebook = callingFacebook(MANAGER_KEY);
        facebook.applicationInfo = null;
        assertNull(MessengerSignature.originalSigners(facebook));
        for (int i = 0; i < MessengerSignature.CALLER_OUTCOMES.length; i++) assertEquals(0, MessengerSignature.callerCounts.get(i));
    }

    @Test public void readsOutsideACallFromFacebookAreNeverChanged() {
        PackageInfo facebook = install(MessengerSignature.FACEBOOK, FACEBOOK_UID, MANAGER_KEY);
        packages.setPackagesForUid(FACEBOOK_UID, MessengerSignature.FACEBOOK);
        // Messenger reading Facebook for itself: the calling uid is its own.
        ShadowBinder.setCallingUid(Process.myUid());
        assertNull(MessengerSignature.originalSigners(facebook));
        // Another app is calling while Messenger reads Facebook: that isn't the caller's identity.
        ShadowBinder.setCallingUid(12_345);
        assertNull(MessengerSignature.originalSigners(facebook));
        for (int i = 0; i < MessengerSignature.CALLER_OUTCOMES.length; i++) assertEquals(0, MessengerSignature.callerCounts.get(i));
    }

    @Test public void aSharedUidWithAnyOtherPackageIsRefused() {
        PackageInfo facebook = callingFacebook(MANAGER_KEY);
        packages.setPackagesForUid(FACEBOOK_UID, MessengerSignature.FACEBOOK, "com.example.lookalike");
        assertNull(MessengerSignature.originalSigners(facebook));
        packages.setPackagesForUid(FACEBOOK_UID);
        assertNull(MessengerSignature.originalSigners(facebook));
        assertEquals(2, count(MessengerSignature.NOT_FAMILY));
    }

    @Test public void onlyFacebookByItsExactNameIsConsidered() {
        PackageInfo lookalike = install("com.facebook.katana.x", FACEBOOK_UID, MANAGER_KEY);
        packages.setPackagesForUid(FACEBOOK_UID, "com.facebook.katana.x");
        ShadowBinder.setCallingUid(FACEBOOK_UID);
        assertNull(MessengerSignature.originalSigners(lookalike));
        for (int i = 0; i < MessengerSignature.CALLER_OUTCOMES.length; i++) assertEquals(0, MessengerSignature.callerCounts.get(i));
    }

    @Test public void aBuildStillCarryingMetasKeyStepsAside() throws Exception {
        MessengerSignature.ownPackage = "com.facebook.orca";
        Signature meta = MessengerSignature.originalSigners(namedMessenger()).get(0);
        MessengerSignature.ownPackage = null;
        install(RuntimeEnvironment.getApplication().getPackageName(), Process.myUid(), meta);
        PackageInfo facebook = callingFacebook(meta);
        assertNull(MessengerSignature.originalSigners(facebook));
        assertEquals(1, count(MessengerSignature.META_SIGNED_BUILD));
    }

    @Test public void missingPackageInfoFailsClosed() throws Exception {
        PackageInfo facebook = callingFacebook(MANAGER_KEY);
        packages.removePackage(MessengerSignature.FACEBOOK);
        assertNull(MessengerSignature.originalSigners(facebook));
        assertEquals(1, count(MessengerSignature.ERROR));
    }

    @Test public void currentSignersLeaveOutRotationHistory() throws Exception {
        PackageInfo info = install("com.example.rotated", 10_777, MANAGER_KEY);
        shadowOf(info.signingInfo).setPastSigningCertificates(new Signature[] {OTHER_KEY, MANAGER_KEY});
        packages.installPackage(info);
        PackageManager manager = RuntimeEnvironment.getApplication().getPackageManager();
        assertEquals(MessengerSignature.currentSigners(manager, RuntimeEnvironment.getApplication().getPackageName()),
            MessengerSignature.currentSigners(manager, "com.example.rotated"));
    }

    private static PackageInfo namedMessenger() {
        PackageInfo messenger = new PackageInfo();
        messenger.packageName = "com.facebook.orca";
        return messenger;
    }
}
