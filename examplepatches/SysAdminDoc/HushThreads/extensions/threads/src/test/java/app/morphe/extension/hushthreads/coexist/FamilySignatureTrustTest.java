/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.coexist;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.Process;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowApplicationPackageManager;
import org.robolectric.shadows.ShadowBinder;
import org.robolectric.shadows.ShadowPackageManager;
import org.robolectric.shadows.ShadowSigningInfo;

import java.security.MessageDigest;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.hushthreads.misc.ThreadsSignature;
import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Who a patched Threads answers a Meta certificate for when it reads a caller's signers to build the
 * caller's identity. The certificate is what makes the caller safe: only someone holding the user's
 * Manager key can sign an app to it, so a caller carrying this build's own key is one the user built.
 * The family name keeps the widening to Instagram, whose own certificate is the answer, and the
 * caller has to be the app the current IPC comes from. A foreign signer, a lookalike name, a
 * non-caller, and a build that still carries Meta's key are all left to Threads' own answer.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FamilySignatureTrustTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** This build's key, and a stranger's. Any distinct certificates will do. */
    private static final String OUR_KEY = "308201a0b1c2d3";
    private static final String OTHER_KEY = "3040e5f6a7b8c9";

    private static final String INSTAGRAM = "com.instagram.android";
    private static final int CALLER_UID = 12345;
    private static final int STRANGER_UID = 54321;

    /** The SHA-256 of Threads' original Meta certificate, APK v3.0 and the first of its v3.1 lineage. */
    private static final String THREADS_SHA256 = "5367570bad488d8da6a0fab78d9766a1a4c23c3c70fac0ad2e91c8f0bd58b432";

    /** The newer certificate of Threads' v3.1 lineage, the one Android 13 and up read as current. */
    private static final String THREADS_ROTATED_SHA256 = "8f38da6b4dc34b1900353bde4630043198cbe3ef7214151f86679cd000c90500";

    /** The SHA-256 of Instagram's original certificate. */
    private static final String INSTAGRAM_SHA256 = "5f3e50f435583c9ae626302a71f7340044087a7e2c60adacfc254205a993e305";

    private Context context;
    private ShadowPackageManager packages;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        packages = shadowOf(context.getPackageManager());
        install(context.getPackageName(), Process.myUid(), OUR_KEY);
        FamilySignatureTrust.ownSigners = null;
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        ShadowBinder.reset();
        FamilySignatureTrust.ownSigners = null;
        PauseForTests.resume();
        HookStatus.clear();
    }

    private void install(String packageName, int uid, String certificate) {
        install(packageName, uid, new Signature(certificate));
    }

    /**
     * Installs [packageName] signed with [certificate], or with no signing info when it's null. Only
     * the signing info is filled in, as PackageManager fills it for GET_SIGNING_CERTIFICATES on API 28
     * and up, so the old signatures array can't stand in for it.
     */
    private void install(String packageName, int uid, Signature certificate) {
        packages.installPackage(packageInfo(packageName, uid, certificate));
    }

    private static PackageInfo packageInfo(String packageName, int uid, Signature certificate) {
        PackageInfo info = new PackageInfo();
        info.packageName = packageName;
        if (certificate != null) {
            SigningInfo signing = new SigningInfo();
            ((ShadowSigningInfo) Shadow.extract(signing)).setSignatures(new Signature[]{certificate});
            info.signingInfo = signing;
        }
        ApplicationInfo app = new ApplicationInfo();
        app.packageName = packageName;
        app.uid = uid;
        info.applicationInfo = app;
        return info;
    }

    /** Installs a caller under its own uid, makes it the calling app, and returns its PackageInfo. */
    private PackageInfo caller(String packageName, String certificate) {
        return caller(packageName, new Signature(certificate));
    }

    private PackageInfo caller(String packageName, Signature certificate) {
        install(packageName, CALLER_UID, certificate);
        packages.setPackagesForUid(CALLER_UID, packageName);
        ShadowBinder.setCallingUid(CALLER_UID);
        return packageInfo(packageName, CALLER_UID, certificate);
    }

    /** The read Threads makes of the caller's signers while building its identity. */
    private boolean callerCheck(PackageInfo callerInfo) {
        return FamilySignatureTrust.isSameKeyFamilyCaller(callerInfo);
    }

    @Test
    public void aFailingPackageManagerLookupKeepsTheFrameworkSigners() {
        PackageInfo instagram = caller(INSTAGRAM, OUR_KEY);
        Utils.setContext(new ContextWrapper(context) {
            @Override
            public PackageManager getPackageManager() {
                throw new SecurityException("package manager unavailable");
            }
        });
        assertFalse(callerCheck(instagram));
        assertNull(ThreadsSignature.originalSigners(instagram));
        assertNull(FamilySignatureTrust.ownSigners);
    }

    @Test
    @Config(shadows = FailingUidPackages.class)
    public void aFailingUidOwnershipLookupKeepsTheFrameworkSigners() {
        PackageInfo instagram = caller(INSTAGRAM, OUR_KEY);
        assertFalse(callerCheck(instagram));
        assertNull(ThreadsSignature.originalSigners(instagram));
        assertNull(FamilySignatureTrust.ownSigners);
    }

    @Test
    @Config(shadows = FailingCallingUid.class)
    public void aFailingBinderUidLookupKeepsTheFrameworkSigners() {
        PackageInfo instagram = caller(INSTAGRAM, OUR_KEY);
        FailingCallingUid.failReads = true;
        try {
            assertFalse(callerCheck(instagram));
            assertNull(ThreadsSignature.originalSigners(instagram));
            assertNull(FamilySignatureTrust.ownSigners);
        } finally {
            FailingCallingUid.failReads = false;
        }
    }

    @Implements(className = "android.app.ApplicationPackageManager", isInAndroidSdk = false)
    public static class FailingUidPackages extends ShadowApplicationPackageManager {
        @Implementation
        @Override
        protected String[] getPackagesForUid(int uid) {
            throw new SecurityException("UID packages unavailable");
        }
    }

    @Implements(android.os.Binder.class)
    public static class FailingCallingUid extends ShadowBinder {
        static boolean failReads;

        @Implementation
        protected static int getCallingUid() {
            if (failReads) throw new SecurityException("calling UID unavailable");
            return ShadowBinder.getCallingUid();
        }
    }

    /** Threads' original certificate, the one Restore screens answers with for this app. */
    private Signature metaCertificate() {
        PackageInfo self = packageInfo(context.getPackageName(), Process.myUid(), null);
        return ThreadsSignature.originalSigners(self).get(0);
    }

    private static String sha256(Signature signature) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(signature.toByteArray());
        StringBuilder hex = new StringBuilder();
        for (byte b : digest) hex.append(String.format("%02x", b));
        return hex.toString();
    }

    private static String familyLine() {
        return statusLine(FamilyNames.RESTORE_TRUST);
    }

    private static String statusLine(String family) {
        for (String line : HookStatus.report("")) {
            if (line.startsWith(family + ":")) return line;
        }
        return null;
    }

    // -- The caller is treated as Meta's own -----------------------------------------------------

    @Test
    public void aSameKeyInstagramIsAccepted() {
        PackageInfo instagram = caller(INSTAGRAM, OUR_KEY);
        assertTrue("a same-key Instagram should be treated as Meta's own", callerCheck(instagram));
    }

    /** The whole family, each carrying this build's key, is treated the same way. */
    @Test
    public void everySameKeyFamilyAppIsAccepted() {
        for (String pkg : FamilySignatureTrust.FAMILY_PACKAGES) {
            ShadowBinder.reset();
            packages.removePackage(pkg);
            assertTrue(pkg + " carries this build's key", callerCheck(caller(pkg, OUR_KEY)));
        }
    }

    /**
     * A re-signed build carries whatever key the user's Manager holds, and a family app carrying the
     * same one is accepted, whatever that key is.
     */
    @Test
    public void aFamilyAppSharingTheRunningBuildsKeyIsAccepted() {
        install(context.getPackageName(), Process.myUid(), OTHER_KEY);
        assertTrue("a family app that shares the running build's key is trusted",
                callerCheck(caller(INSTAGRAM, OTHER_KEY)));
    }

    /**
     * ThreadsSignature answers a same-key Instagram with Instagram's own Meta certificate, and not
     * with Threads' certificate, which Threads' caller rules would never expect from Instagram.
     */
    @Test
    public void threadsSignatureAnswersInstagramsCertificateForASameKeyInstagram() throws Exception {
        PackageInfo instagram = caller(INSTAGRAM, OUR_KEY);
        List<Signature> signers = ThreadsSignature.originalSigners(instagram);
        assertNotNull("a same-key Instagram caller gets a Meta certificate", signers);
        assertEquals(1, signers.size());
        assertEquals(INSTAGRAM_SHA256, sha256(signers.get(0)));
        assertNotEquals("Instagram was answered Threads' certificate", metaCertificate(), signers.get(0));
    }

    // -- Which builds it runs in --------------------------------------------------------------

    /**
     * The reader this rides on belongs to Restore screens on re-signed builds: the family-caller
     * answer is that patch's own job, and it counts it under that patch, because the security
     * boundary (the same-key check) and the problem it solves (Restore screens rewriting Threads'
     * own signer lookup) are both Restore screens'.
     */
    @Test
    public void restoreScreensAnswersASameKeyInstagramAndCountsIt() {
        PackageInfo instagram = caller(INSTAGRAM, OUR_KEY);
        assertNotNull("Restore screens should give a same-key Instagram its Meta certificate",
                ThreadsSignature.originalSigners(instagram));
        assertTrue(callerCheck(instagram));
        assertNotNull("counted under Restore screens, which carries the hook", familyLine());
        assertTrue("the count names the caller", familyLine().contains("shared sign-in"));
    }

    /**
     * Restore screens' hook reads no Pause setting, the same as a manifest edit can't be undone at
     * run time. A same-key Instagram that calls in for the shared sign-in keeps doing so.
     */
    @Test
    public void pauseChangesNothing() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertTrue("paused by the switch", callerCheck(caller(INSTAGRAM, OUR_KEY)));
        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        assertTrue("paused by safe mode", callerCheck(caller(INSTAGRAM, OUR_KEY)));
    }

    // -- The caller keeps Threads' own answer ----------------------------------------------------

    /** A caller signed with another key is what Threads' own check already refuses. */
    @Test
    public void aForeignSignerIsRefused() {
        PackageInfo instagram = caller(INSTAGRAM, OTHER_KEY);
        assertFalse("an Instagram signed with another key must not be treated as Meta's", callerCheck(instagram));
        assertTrue("the refusal reason is counted", familyLine().contains("caller signer differs"));
    }

    /** ThreadsSignature keeps the system's signers for a foreign-signed family caller. */
    @Test
    public void threadsSignatureKeepsForeignSignersOfAFamilyCaller() {
        PackageInfo instagram = caller(INSTAGRAM, OTHER_KEY);
        assertNull("a foreign-signed caller keeps its own signers", ThreadsSignature.originalSigners(instagram));
    }

    /** The family names are matched exactly, so a name that only looks like one is left uncounted. */
    @Test
    public void aLookalikePackageNameIsRefused() {
        for (String lookalike : new String[]{
                "com.instagram.android.evil", "com.instagram.androidx", "com.instagram0android",
                "com.instagram.barcelona.morphe"}) {
            ShadowBinder.reset();
            packages.removePackage(lookalike);
            assertFalse(lookalike + " is not a family app", callerCheck(caller(lookalike, OUR_KEY)));
        }
        assertNull("a non-family read isn't counted", familyLine());
    }

    /**
     * The answer is Instagram's own certificate, which is right only for Instagram. Instagram Lite,
     * Facebook and Messenger are Meta's too but carry other certificates, so even carrying this
     * build's key they keep their own signers, uncounted.
     */
    @Test
    public void otherSameKeyMetaAppsKeepTheirOwnSigners() {
        for (String other : new String[]{"com.instagram.lite", "com.facebook.katana", "com.facebook.orca"}) {
            ShadowBinder.reset();
            packages.removePackage(other);
            PackageInfo app = caller(other, OUR_KEY);
            assertFalse(other + " isn't signed with Instagram's certificate", callerCheck(app));
            assertNull(other + " got a Meta certificate", ThreadsSignature.originalSigners(app));
        }
        assertNull("a non-family read isn't counted", familyLine());
    }

    /** Threads signs in with an Instagram account, and Instagram is the one app that calls in for it. */
    @Test
    public void theFamilyIsInstagram() {
        assertEquals(Collections.singleton(INSTAGRAM), FamilySignatureTrust.FAMILY_PACKAGES);
    }

    /** A same-key app that isn't in the family list keeps Threads' answer, uncounted. */
    @Test
    public void aNonFamilySameKeyCallerIsRefused() {
        assertFalse(callerCheck(caller("com.example.other", OUR_KEY)));
        assertNull("a non-family read isn't counted", familyLine());
    }

    /**
     * The read runs for this app's own signers and for packages Threads looks up for other reasons,
     * not only for the calling app. A family package the calling uid doesn't own is one of those, and
     * it keeps Threads' answer without a count.
     */
    @Test
    public void aFamilyPackageThatIsntTheCallerIsRefused() {
        install(INSTAGRAM, CALLER_UID, new Signature(OUR_KEY));
        packages.setPackagesForUid(STRANGER_UID, "com.example.stranger");
        ShadowBinder.setCallingUid(STRANGER_UID);
        assertFalse("Instagram isn't the calling app here",
                callerCheck(packageInfo(INSTAGRAM, CALLER_UID, new Signature(OUR_KEY))));
        assertNull("a read that isn't the caller's isn't counted", familyLine());
    }

    /** Our own read of our own signers, on our own uid, isn't a cross-app call and is left alone. */
    @Test
    public void ourOwnReadIsNotWidened() {
        install(INSTAGRAM, Process.myUid(), new Signature(OUR_KEY));
        packages.setPackagesForUid(Process.myUid(), context.getPackageName(), INSTAGRAM);
        ShadowBinder.setCallingUid(Process.myUid());
        assertFalse(callerCheck(packageInfo(INSTAGRAM, Process.myUid(), new Signature(OUR_KEY))));
        assertNull("our own read isn't counted", familyLine());
    }

    /** A uid with no package behind it, as an unknown or gone caller leaves, keeps the refusal. */
    @Test
    public void anUnknownCallerIsRefused() {
        PackageInfo instagram = packageInfo(INSTAGRAM, CALLER_UID, new Signature(OUR_KEY));
        ShadowBinder.setCallingUid(STRANGER_UID);
        assertFalse("a caller with no package must not get in", callerCheck(instagram));
        assertNull("nothing to widen, nothing counted", familyLine());
    }

    /** Without a context the check can read nothing, so it leaves Threads' answer. */
    @Test
    public void aNullContextIsRefused() {
        PackageInfo instagram = caller(INSTAGRAM, OUR_KEY);
        boolean[] answered = {true};
        SettingsContextRule.withoutContext(() -> answered[0] = callerCheck(instagram));
        assertFalse(answered[0]);
    }

    @Test
    public void aNullCallerIsRefused() {
        ShadowBinder.setCallingUid(CALLER_UID);
        assertFalse(callerCheck(null));
    }

    /**
     * A build that still carries Meta's key, as a Root Mount install does, reads its own signers as
     * they are, and Threads' rules already trust an app carrying the right Meta key. The hook steps
     * aside, so it can't let in anything Threads' own rule wouldn't.
     */
    @Test
    public void aBuildCarryingMetasKeyIsLeftToThreads() {
        Signature meta = metaCertificate();
        install(context.getPackageName(), Process.myUid(), meta);
        PackageInfo instagram = caller(INSTAGRAM, meta);
        assertFalse("Meta's own key is Threads' rule to judge", callerCheck(instagram));
        assertTrue("the no-op reason is counted", familyLine().contains("this build carries Meta's key"));
    }

    /**
     * Threads rotates its signing certificate with an APK v3.1 lineage: Android 13 and up report the
     * newer Meta certificate as current. A build carrying that one is genuine too, so the hook steps
     * aside there as it does for the original.
     */
    @Test
    public void aBuildCarryingMetasRotatedKeyIsLeftToThreads() {
        FamilySignatureTrust.ownSigners = new java.util.HashSet<>(Collections.singletonList(THREADS_ROTATED_SHA256));
        PackageInfo instagram = caller(INSTAGRAM, OUR_KEY);
        assertFalse("Meta's rotated key is Threads' rule to judge", callerCheck(instagram));
        assertTrue("the no-op reason is counted", familyLine().contains("this build carries Meta's key"));
    }

    /** Both of Meta's rotated certificates are known, so a genuine build is caught on either API level. */
    @Test
    public void bothOfMetasCertificatesAreKnown() {
        assertEquals(THREADS_SHA256, FamilySignatureTrust.META_THREADS_SHA256);
        assertTrue(FamilySignatureTrust.META_SIGNER_DIGESTS.contains(THREADS_SHA256));
        assertTrue(FamilySignatureTrust.META_SIGNER_DIGESTS.contains(THREADS_ROTATED_SHA256));
        assertFalse("Instagram's certificate isn't one Threads is signed with",
                FamilySignatureTrust.META_SIGNER_DIGESTS.contains(INSTAGRAM_SHA256));
    }

    /**
     * A uid that owns another package too, as a shared user id would, isn't the lone family app the
     * hook stands in for, so it keeps Threads' answer.
     */
    @Test
    public void aSharedUidWithAnotherPackageIsRefused() {
        install(INSTAGRAM, CALLER_UID, new Signature(OUR_KEY));
        packages.setPackagesForUid(CALLER_UID, INSTAGRAM, "com.example.tagalong");
        ShadowBinder.setCallingUid(CALLER_UID);
        assertFalse("a shared uid isn't the family app alone",
                callerCheck(packageInfo(INSTAGRAM, CALLER_UID, new Signature(OUR_KEY))));
        assertNull("a shared-uid read isn't counted", familyLine());
    }

    /** The certificate Restore screens answers for this app is Threads' original. */
    @Test
    public void metasCertificateIsThreadsOriginal() throws Exception {
        assertEquals(FamilySignatureTrust.META_THREADS_SHA256, sha256(metaCertificate()));
    }

    // -- Reads of the caller's signers ------------------------------------------------------------

    /** With no signing info on the caller's PackageInfo, the check reads it from PackageManager. */
    @Test
    public void aCallerWithoutSigningInfoIsReadFromPackageManager() {
        caller(INSTAGRAM, OUR_KEY);
        PackageInfo noSigning = new PackageInfo();
        noSigning.packageName = INSTAGRAM;
        assertTrue("the caller's real signers were read from PackageManager", callerCheck(noSigning));
    }

    /**
     * Android can't change a running app's certificate without a new process, so its own signers are
     * read once. A second check reads only the caller's.
     */
    @Test
    public void theBuildsOwnSignersAreReadOnce() {
        assertTrue(callerCheck(caller(INSTAGRAM, OUR_KEY)));
        install(context.getPackageName(), Process.myUid(), OTHER_KEY);
        assertTrue("the second check kept the first read of this build's key", callerCheck(caller(INSTAGRAM, OUR_KEY)));
    }

    /** A read that found no certificate of our own isn't kept, so the next check reads again. */
    @Test
    public void anUnreadableOwnCertificateIsReadAgain() {
        install(context.getPackageName(), Process.myUid(), (Signature) null);
        assertFalse("no certificate of its own, nothing to match", callerCheck(caller(INSTAGRAM, OUR_KEY)));
        install(context.getPackageName(), Process.myUid(), OUR_KEY);
        assertTrue("the next check read this build's key again", callerCheck(caller(INSTAGRAM, OUR_KEY)));
    }

    // -- Reporting --------------------------------------------------------------------------------

    /** A caller treated as Meta's own is counted under the patch, so a report proves it said yes. */
    @Test
    public void anAcceptedCallerIsReportedUnderThePatch() {
        callerCheck(caller(INSTAGRAM, OUR_KEY));
        String line = familyLine();
        assertNotNull("the hook reports under the coexistence patch", line);
        assertTrue(line, line.contains("Counted: ") && line.contains("shared sign-in 1"));
    }
}
