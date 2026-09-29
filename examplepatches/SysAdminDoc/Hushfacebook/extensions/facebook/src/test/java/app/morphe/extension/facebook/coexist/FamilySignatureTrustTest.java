/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.coexist;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
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

import app.morphe.extension.facebook.misc.FacebookSignature;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Who a patched Facebook lets reach a guarded component as a same-key family app. The certificate
 * makes the caller safe: only someone holding the user's Manager key can sign an app to it, so a
 * caller carrying this build's own key is one the user built. The family name keeps the widening to
 * the apps Facebook treats as family, so a lookalike name is still refused. Only Facebook's SameKey
 * rule is widened: every other rule, and a build that still carries Meta's key, is left to Facebook.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FamilySignatureTrustTest {
    /** This build's key, and a stranger's. Any distinct certificates will do. */
    private static final String OUR_KEY = "308201a0b1c2d3";
    private static final String OTHER_KEY = "3040e5f6a7b8c9";

    /**
     * Stands in for Facebook's SameKey rule, the singleton the patch hands over next to the rule
     * each check asks about.
     */
    private static final Object SAME_KEY = new Object();

    private static final String MESSENGER = "com.facebook.orca";
    private static final String INSTAGRAM = "com.instagram.android";
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
        HookStatus.clear();
    }

    private void install(String packageName, int uid, String certificate) {
        install(packageName, uid, new Signature(certificate));
    }

    /**
     * Installs [packageName] signed with [certificate], or with no signing info when it's null.
     * Only the signing info is filled in, as PackageManager fills it for GET_SIGNING_CERTIFICATES on
     * API 28 and up, so the old signatures array can't stand in for it.
     */
    private void install(String packageName, int uid, Signature certificate) {
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
        packages.installPackage(info);
    }

    /** Installs a caller under its own uid and makes it the one now calling the provider. */
    private void caller(String packageName, String certificate) {
        caller(packageName, new Signature(certificate));
    }

    private void caller(String packageName, Signature certificate) {
        install(packageName, CALLER_UID, certificate);
        packages.setPackagesForUid(CALLER_UID, packageName);
        ShadowBinder.setCallingUid(CALLER_UID);
    }

    /** A check under Facebook's SameKey rule, the one the patch widens. */
    private boolean sameKeyCheck() {
        return FamilySignatureTrust.accept(context, SAME_KEY, SAME_KEY);
    }

    /** Facebook's original certificate, the one Restore screens answers with. */
    private Signature metaCertificate() {
        PackageInfo self = new PackageInfo();
        self.packageName = context.getPackageName();
        self.applicationInfo = new ApplicationInfo();
        self.applicationInfo.packageName = self.packageName;
        self.applicationInfo.uid = Process.myUid();
        return FacebookSignature.originalSigners(self).get(0);
    }

    private static boolean reported() {
        for (String line : HookStatus.report("")) {
            if (line.startsWith("Install beside Meta's apps:")) return true;
        }
        return false;
    }

    @Test
    public void aSameKeyMessengerIsAccepted() {
        caller(MESSENGER, OUR_KEY);
        assertTrue("a same-key Messenger should reach the guarded component", sameKeyCheck());
    }

    /** The whole family, each carrying this build's key, gets in the same way. */
    @Test
    public void everySameKeyFamilyAppIsAccepted() {
        for (String pkg : FamilySignatureTrust.FAMILY_PACKAGES) {
            ShadowBinder.reset();
            packages.removePackage(pkg);
            caller(pkg, OUR_KEY);
            assertTrue(pkg + " carries this build's key", sameKeyCheck());
        }
    }

    /**
     * Facebook's other rules (anyone, a list of trusted apps, Meta's family signatures, a named
     * Facebook permission) don't ask whether the caller carries Facebook's key, so a same-key caller
     * is left to them. A rule that only equals SameKey, the way Facebook's own equals() answers for
     * any instance of the rule's class, isn't the singleton the patch hands over, so it's left too.
     * None of them costs a package lookup or a count.
     */
    @Test
    public void everyOtherRuleIsLeftToFacebook() {
        caller(INSTAGRAM, OUR_KEY);
        Object lookalike = new Object() {
            @Override
            public boolean equals(Object other) {
                return true;
            }

            @Override
            public int hashCode() {
                return SAME_KEY.hashCode();
            }
        };
        Object[] others = {new Object(), new Object(), new Object(), new Object(), lookalike, null};
        for (Object rule : others) {
            assertFalse(rule + " is not Facebook's SameKey rule",
                    FamilySignatureTrust.accept(context, rule, SAME_KEY));
        }
        assertFalse("another rule's check isn't counted", reported());
        assertTrue("the same caller passes Facebook's SameKey rule", sameKeyCheck());
    }

    /** Without the SameKey singleton there's nothing to tell the rule by, so nothing is widened. */
    @Test
    public void aMissingSameKeyRuleIsRefused() {
        caller(MESSENGER, OUR_KEY);
        assertFalse(FamilySignatureTrust.accept(context, null, null));
        assertFalse(FamilySignatureTrust.accept(context, SAME_KEY, null));
    }

    /** A caller signed with another key is what Facebook's own check already refuses. */
    @Test
    public void aForeignSignerIsRefused() {
        caller(MESSENGER, OTHER_KEY);
        assertFalse("a Messenger signed with another key must not get in", sameKeyCheck());
    }

    /** The family names are matched exactly, so a name that only looks like one is refused. */
    @Test
    public void aLookalikePackageNameIsRefused() {
        for (String lookalike : new String[]{
                "com.facebook.orca.evil", "com.facebook.orcax", "com.facebook0orca", "com.facebook.katana.morphe"}) {
            ShadowBinder.reset();
            packages.removePackage(lookalike);
            caller(lookalike, OUR_KEY);
            assertFalse(lookalike + " is not a family app", sameKeyCheck());
        }
    }

    /** A uid with no package behind it, as an unknown or gone caller leaves, keeps the refusal. */
    @Test
    public void anUnknownCallerIsRefused() {
        ShadowBinder.setCallingUid(STRANGER_UID);
        assertFalse("a caller with no package must not get in", sameKeyCheck());
    }

    /** Without a context the check can read nothing, so it refuses. */
    @Test
    public void aNullContextIsRefused() {
        caller(MESSENGER, OUR_KEY);
        assertFalse(FamilySignatureTrust.accept(null, SAME_KEY, SAME_KEY));
    }

    /**
     * A re-signed build carries whatever key the user's Manager holds, and a family app carrying the
     * same one is accepted, whatever that key is.
     */
    @Test
    public void aFamilyAppSharingTheRunningBuildsKeyIsAccepted() {
        install(context.getPackageName(), Process.myUid(), OTHER_KEY);
        caller(MESSENGER, OTHER_KEY);
        assertTrue("a family app that shares the running build's key is trusted", sameKeyCheck());
    }

    /**
     * A build that still carries Meta's key, as a Root Mount install does, reads its own signers as
     * they are, and Facebook's SameKey rule already lets in an app carrying that key. The hook steps
     * aside there, so it can't let in anything Facebook's own rule wouldn't.
     */
    @Test
    public void aBuildCarryingMetasKeyIsLeftToFacebook() {
        Signature meta = metaCertificate();
        install(context.getPackageName(), Process.myUid(), meta);
        caller(MESSENGER, meta);
        assertFalse("Meta's own key is Facebook's rule to judge", sameKeyCheck());
    }

    /** The certificate the hook tells a Meta-signed build by is the one Restore screens answers with. */
    @Test
    public void metasCertificateIsFacebooksOriginal() throws Exception {
        byte[] sha256 = MessageDigest.getInstance("SHA-256").digest(metaCertificate().toByteArray());
        StringBuilder hex = new StringBuilder();
        for (byte b : sha256) hex.append(String.format("%02x", b));
        assertEquals(hex.toString(), FamilySignatureTrust.META_FACEBOOK_SHA256);
    }

    /**
     * Android can't change a running app's certificate without a new process, so its own signers are
     * read once. A second check reads only the caller's.
     */
    @Test
    public void theBuildsOwnSignersAreReadOnce() {
        caller(MESSENGER, OUR_KEY);
        assertTrue(sameKeyCheck());
        install(context.getPackageName(), Process.myUid(), OTHER_KEY);
        assertTrue("the second check kept the first read of this build's key", sameKeyCheck());
    }

    /** A read that found no certificate isn't kept, so the next check reads again. */
    @Test
    public void anUnreadableOwnCertificateIsReadAgain() {
        install(context.getPackageName(), Process.myUid(), (Signature) null);
        caller(MESSENGER, OUR_KEY);
        assertFalse("no certificate of its own, nothing to match", sameKeyCheck());
        install(context.getPackageName(), Process.myUid(), OUR_KEY);
        assertTrue("the next check read this build's key again", sameKeyCheck());
    }

    /** Every SameKey check is counted under the coexistence patch's name. */
    @Test
    public void callsAreCountedUnderThePatch() {
        caller(MESSENGER, OUR_KEY);
        sameKeyCheck();
        assertTrue("the hook reports under the coexistence patch", reported());
    }
}
