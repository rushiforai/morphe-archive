/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.coexist;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
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
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowBinder;
import org.robolectric.shadows.ShadowPackageManager;
import org.robolectric.shadows.ShadowSigningInfo;

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import app.morphe.extension.facebook.misc.FacebookSignature;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Who a patched Facebook answers Meta's certificate for when it reads a caller's signers to build the
 * caller's identity. The certificate is what makes the caller safe: only someone holding the user's
 * Manager key can sign an app to it, so a caller carrying this build's own key is one the user built.
 * The family name keeps the widening to the apps Facebook treats as family, and the caller has to be
 * the app the current IPC comes from. A foreign signer, a lookalike name, a non-caller, and a build
 * that still carries Meta's key are all left to Facebook's own answer.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FamilySignatureTrustTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** This build's key, and a stranger's. Any distinct certificates will do. */
    private static final String OUR_KEY = "308201a0b1c2d3";
    private static final String OTHER_KEY = "3040e5f6a7b8c9";

    private static final String MESSENGER = "com.facebook.orca";
    private static final String INSTAGRAM = "com.instagram.android";
    private static final String INSTAGRAM_LITE = "com.instagram.lite";
    private static final int CALLER_UID = 12345;
    private static final int STRANGER_UID = 54321;

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

    /** The read Facebook makes of the caller's signers while building its identity. */
    private boolean callerCheck(PackageInfo callerInfo) {
        return FamilySignatureTrust.isSameKeyFamilyCaller(callerInfo);
    }

    /** Facebook's original certificate, the one Restore screens answers with. */
    private Signature metaCertificate() {
        PackageInfo self = packageInfo(context.getPackageName(), Process.myUid(), null);
        return FacebookSignature.originalSigners(self).get(0);
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
    public void aSameKeyMessengerIsAccepted() {
        PackageInfo messenger = caller(MESSENGER, OUR_KEY);
        assertTrue("a same-key Messenger should be treated as Meta's own", callerCheck(messenger));
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
        assertTrue("a family app that shares the running build's key is trusted", callerCheck(caller(MESSENGER, OTHER_KEY)));
    }

    /** FacebookSignature answers Meta's certificate for a same-key family caller, as for this app. */
    @Test
    public void facebookSignatureAnswersMetaForASameKeyFamilyCaller() {
        PackageInfo messenger = caller(MESSENGER, OUR_KEY);
        List<Signature> signers = FacebookSignature.originalSigners(messenger);
        assertNotNull("a same-key Messenger caller gets Facebook's certificate", signers);
        assertEquals(metaCertificate(), signers.get(0));
    }

    // -- Which builds it runs in --------------------------------------------------------------

    /**
     * The reader this rides on belongs to Restore screens on re-signed builds alone: the family-caller
     * answer is that patch's own job, not something Install beside Meta's apps switches on. A build
     * carrying Restore screens without Install beside still answers a same-key Messenger Meta's
     * certificate, and counts it under Restore screens, because the security boundary (the same-key
     * check) and the problem it solves (Restore screens rewriting Facebook's own signer lookup) are
     * both Restore screens', and a same-key Facebook and Messenger pair needs nothing else to coexist.
     */
    @Test
    public void withRestoreScreensAloneASameKeyMessengerGetsMetasCertificate() {
        PackageInfo messenger = caller(MESSENGER, OUR_KEY);
        assertNotNull("Restore screens alone should give a same-key Messenger Facebook's certificate",
                FacebookSignature.originalSigners(messenger));
        assertTrue(callerCheck(messenger));
        assertNotNull("counted under Restore screens, which carries the hook", familyLine());
        assertTrue("the count names the caller", familyLine().contains("shared sign-in"));
    }

    /**
     * Restore screens' hook reads no Pause setting, the same as Install beside's manifest can't be
     * undone at run time. A same-key Messenger that signs in through Facebook keeps doing so.
     */
    @Test
    public void pauseChangesNothing() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertTrue("paused by the switch", callerCheck(caller(MESSENGER, OUR_KEY)));
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertTrue("paused by safe mode", callerCheck(caller(MESSENGER, OUR_KEY)));
    }

    // -- The caller keeps Facebook's own answer --------------------------------------------------

    /** A caller signed with another key is what Facebook's own check already refuses. */
    @Test
    public void aForeignSignerIsRefused() {
        PackageInfo messenger = caller(MESSENGER, OTHER_KEY);
        assertFalse("a Messenger signed with another key must not be treated as Meta's", callerCheck(messenger));
        assertTrue("the refusal reason is counted", familyLine().contains("caller signer differs"));
    }

    /** FacebookSignature keeps the system's signers for a foreign-signed family caller. */
    @Test
    public void facebookSignatureKeepsForeignSignersOfAFamilyCaller() {
        PackageInfo messenger = caller(MESSENGER, OTHER_KEY);
        assertNull("a foreign-signed caller keeps its own signers", FacebookSignature.originalSigners(messenger));
    }

    /** The family names are matched exactly, so a name that only looks like one is left uncounted. */
    @Test
    public void aLookalikePackageNameIsRefused() {
        for (String lookalike : new String[]{
                "com.facebook.orca.evil", "com.facebook.orcax", "com.facebook0orca", "com.facebook.katana.morphe"}) {
            ShadowBinder.reset();
            packages.removePackage(lookalike);
            assertFalse(lookalike + " is not a family app", callerCheck(caller(lookalike, OUR_KEY)));
        }
        assertNull("a non-family read isn't counted", familyLine());
    }

    /**
     * The answer is Facebook's own certificate, which is right only for an app Meta signs with it.
     * Instagram and Instagram Lite are Meta's too but carry Instagram's own certificate, so even
     * carrying this build's key they keep their own signers, uncounted.
     */
    @Test
    public void aSameKeyInstagramKeepsItsOwnSigners() {
        for (String instagram : new String[]{INSTAGRAM, INSTAGRAM_LITE}) {
            ShadowBinder.reset();
            packages.removePackage(instagram);
            PackageInfo app = caller(instagram, OUR_KEY);
            assertFalse(instagram + " isn't signed with Facebook's certificate", callerCheck(app));
            assertNull(instagram + " got Facebook's certificate", FacebookSignature.originalSigners(app));
        }
        assertNull("a non-family read isn't counted", familyLine());
    }

    /**
     * The family is the apps Meta signs with Facebook's own certificate: Facebook, Messenger (the
     * same rotated pair as Facebook 580), Messenger Lite and Facebook Lite (the original certificate).
     */
    @Test
    public void theFamilyIsTheAppsSignedWithFacebooksCertificate() {
        assertEquals(new HashSet<>(Arrays.asList(
                "com.facebook.katana", MESSENGER, "com.facebook.mlite", "com.facebook.lite")),
                FamilySignatureTrust.FAMILY_PACKAGES);
    }

    /** A same-key app that isn't in the family list keeps Facebook's answer, uncounted. */
    @Test
    public void aNonFamilySameKeyCallerIsRefused() {
        assertFalse(callerCheck(caller("com.example.other", OUR_KEY)));
        assertNull("a non-family read isn't counted", familyLine());
    }

    /**
     * The read runs for this app's own signers and for packages Facebook looks up for other reasons,
     * not only for the calling app. A family package the calling uid doesn't own is one of those, and
     * it keeps Facebook's answer without a count.
     */
    @Test
    public void aFamilyPackageThatIsntTheCallerIsRefused() {
        install(MESSENGER, CALLER_UID, new Signature(OUR_KEY));
        packages.setPackagesForUid(STRANGER_UID, "com.example.stranger");
        ShadowBinder.setCallingUid(STRANGER_UID);
        assertFalse("Messenger isn't the calling app here", callerCheck(packageInfo(MESSENGER, CALLER_UID, new Signature(OUR_KEY))));
        assertNull("a read that isn't the caller's isn't counted", familyLine());
    }

    /** Our own read of our own signers, on our own uid, isn't a cross-app call and is left alone. */
    @Test
    public void ourOwnReadIsNotWidened() {
        install(MESSENGER, Process.myUid(), new Signature(OUR_KEY));
        packages.setPackagesForUid(Process.myUid(), context.getPackageName(), MESSENGER);
        ShadowBinder.setCallingUid(Process.myUid());
        assertFalse(callerCheck(packageInfo(MESSENGER, Process.myUid(), new Signature(OUR_KEY))));
        assertNull("our own read isn't counted", familyLine());
    }

    /** A uid with no package behind it, as an unknown or gone caller leaves, keeps the refusal. */
    @Test
    public void anUnknownCallerIsRefused() {
        PackageInfo messenger = packageInfo(MESSENGER, CALLER_UID, new Signature(OUR_KEY));
        ShadowBinder.setCallingUid(STRANGER_UID);
        assertFalse("a caller with no package must not get in", callerCheck(messenger));
        assertNull("nothing to widen, nothing counted", familyLine());
    }

    /** Without a context the check can read nothing, so it leaves Facebook's answer. */
    @Test
    public void aNullContextIsRefused() {
        PackageInfo messenger = caller(MESSENGER, OUR_KEY);
        boolean[] answered = {true};
        SettingsContextRule.withoutContext(() -> answered[0] = callerCheck(messenger));
        assertFalse(answered[0]);
    }

    @Test
    public void aNullCallerIsRefused() {
        ShadowBinder.setCallingUid(CALLER_UID);
        assertFalse(callerCheck(null));
    }

    /**
     * A build that still carries Meta's key, as a Root Mount install does, reads its own signers as
     * they are, and Facebook's rules already trust an app carrying that key. The hook steps aside, so
     * it can't let in anything Facebook's own rule wouldn't.
     */
    @Test
    public void aBuildCarryingMetasKeyIsLeftToFacebook() {
        Signature meta = metaCertificate();
        install(context.getPackageName(), Process.myUid(), meta);
        PackageInfo messenger = caller(MESSENGER, meta);
        assertFalse("Meta's own key is Facebook's rule to judge", callerCheck(messenger));
        assertTrue("the no-op reason is counted", familyLine().contains("this build carries Meta's key"));
    }

    /**
     * Facebook 580 rotates its signing certificate: Android 13 and up report the newer Meta Platforms
     * certificate as current. A build carrying that one is genuine too, so the hook steps aside there
     * as it does for the original.
     */
    @Test
    public void aBuildCarryingMetasRotatedKeyIsLeftToFacebook() {
        String rotated = "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27";
        FamilySignatureTrust.ownSigners = new java.util.HashSet<>(java.util.Collections.singletonList(rotated));
        PackageInfo messenger = caller(MESSENGER, OUR_KEY);
        assertFalse("Meta's rotated key is Facebook's rule to judge", callerCheck(messenger));
        assertTrue("the no-op reason is counted", familyLine().contains("this build carries Meta's key"));
    }

    /** Both of Meta's rotated certificates are known, so a genuine build is caught on either API level. */
    @Test
    public void bothOfMetasCertificatesAreKnown() {
        assertTrue(FamilySignatureTrust.META_SIGNER_DIGESTS.contains(FamilySignatureTrust.META_FACEBOOK_SHA256));
        assertTrue(FamilySignatureTrust.META_SIGNER_DIGESTS.contains(
                "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27"));
    }

    /**
     * A uid that owns another package too, as a shared user id would, isn't the lone family app the
     * hook stands in for, so it keeps Facebook's answer.
     */
    @Test
    public void aSharedUidWithAnotherPackageIsRefused() {
        install(MESSENGER, CALLER_UID, new Signature(OUR_KEY));
        packages.setPackagesForUid(CALLER_UID, MESSENGER, "com.example.tagalong");
        ShadowBinder.setCallingUid(CALLER_UID);
        assertFalse("a shared uid isn't the family app alone", callerCheck(packageInfo(MESSENGER, CALLER_UID, new Signature(OUR_KEY))));
        assertNull("a shared-uid read isn't counted", familyLine());
    }

    /** The certificate the hook answers a same-key family caller with is the one Restore screens answers. */
    @Test
    public void metasCertificateIsFacebooksOriginal() throws Exception {
        byte[] sha256 = MessageDigest.getInstance("SHA-256").digest(metaCertificate().toByteArray());
        StringBuilder hex = new StringBuilder();
        for (byte b : sha256) hex.append(String.format("%02x", b));
        assertEquals(hex.toString(), FamilySignatureTrust.META_FACEBOOK_SHA256);
    }

    // -- Reads of the caller's signers ------------------------------------------------------------

    /** With no signing info on the caller's PackageInfo, the check reads it from PackageManager. */
    @Test
    public void aCallerWithoutSigningInfoIsReadFromPackageManager() {
        caller(MESSENGER, OUR_KEY);
        PackageInfo noSigning = new PackageInfo();
        noSigning.packageName = MESSENGER;
        assertTrue("the caller's real signers were read from PackageManager", callerCheck(noSigning));
    }

    /**
     * Android can't change a running app's certificate without a new process, so its own signers are
     * read once. A second check reads only the caller's.
     */
    @Test
    public void theBuildsOwnSignersAreReadOnce() {
        assertTrue(callerCheck(caller(MESSENGER, OUR_KEY)));
        install(context.getPackageName(), Process.myUid(), OTHER_KEY);
        assertTrue("the second check kept the first read of this build's key", callerCheck(caller(MESSENGER, OUR_KEY)));
    }

    /** A read that found no certificate of our own isn't kept, so the next check reads again. */
    @Test
    public void anUnreadableOwnCertificateIsReadAgain() {
        install(context.getPackageName(), Process.myUid(), (Signature) null);
        assertFalse("no certificate of its own, nothing to match", callerCheck(caller(MESSENGER, OUR_KEY)));
        install(context.getPackageName(), Process.myUid(), OUR_KEY);
        assertTrue("the next check read this build's key again", callerCheck(caller(MESSENGER, OUR_KEY)));
    }

    // -- Reporting --------------------------------------------------------------------------------

    /** A caller treated as Meta's own is counted under the patch, so a report proves it said yes. */
    @Test
    public void anAcceptedCallerIsReportedUnderThePatch() {
        callerCheck(caller(MESSENGER, OUR_KEY));
        String line = familyLine();
        assertNotNull("the hook reports under the coexistence patch", line);
        assertTrue(line, line.contains("Counted: ") && line.contains("shared sign-in 1"));
    }
}
