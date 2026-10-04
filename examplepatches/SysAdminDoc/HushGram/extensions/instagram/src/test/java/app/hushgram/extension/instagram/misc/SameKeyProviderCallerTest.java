/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import static org.junit.Assert.assertFalse;
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
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowBinder;
import org.robolectric.shadows.ShadowPackageManager;
import org.robolectric.shadows.ShadowSigningInfo;

import java.util.ArrayList;
import java.util.List;

import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/** The real provider entry point, including Binder identity and current PackageManager records. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class SameKeyProviderCallerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String INSTAGRAM = "com.instagram.android";
    private static final Signature OUR_KEY = new Signature("308201a0b1c2d3");
    private static final Signature OTHER_KEY = new Signature("3040e5f6a7b8c9");
    private Context context;
    private ShadowPackageManager packages;
    private int callerUid;

    @Before
    public void setUp() {
        context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public String getPackageName() { return INSTAGRAM; }
        };
        packages = shadowOf(context.getPackageManager());
        callerUid = (Process.myUid() / 100000) * 100000 + 12345;
        callAs(callerUid);
        packages.installPackage(info(INSTAGRAM, Process.myUid(), OUR_KEY));
        installCaller(InstagramSignature.THREADS, OUR_KEY);
        InstagramSignature.ownSigners = null;
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        ShadowBinder.setCallingIdentityForCurrentThread(null);
        InstagramSignature.ownSigners = null;
        HookStatus.clear();
    }

    private static void callAs(int uid) {
        ShadowBinder.setCallingIdentityForCurrentThread(ShadowBinder.CallingIdentity.newBuilder()
                .setUid(uid).setPid(Process.myPid() + 1).build());
    }

    private static PackageInfo info(String name, int uid, Signature... current) {
        PackageInfo result = new PackageInfo();
        result.packageName = name;
        result.applicationInfo = new ApplicationInfo();
        result.applicationInfo.packageName = name;
        result.applicationInfo.uid = uid;
        if (current.length > 0) result.signingInfo = signing(current, null);
        return result;
    }

    private static SigningInfo signing(Signature[] current, Signature[] history) {
        SigningInfo result = new SigningInfo();
        ShadowSigningInfo shadow = Shadow.extract(result);
        shadow.setSignatures(current);
        if (history != null) shadow.setPastSigningCertificates(history);
        return result;
    }

    private void installCaller(String name, Signature... current) {
        packages.installPackage(info(name, callerUid, current));
        packages.setPackagesForUid(callerUid, name);
    }

    private boolean accepted() { return InstagramSignature.isSameKeyFamilyProviderCaller(context); }

    @Test
    public void exactlyNamedFamilyCallersWithCurrentMatchingKeysAreAccepted() {
        for (String name : new String[]{InstagramSignature.THREADS, InstagramSignature.FACEBOOK, InstagramSignature.MESSENGER}) {
            installCaller(name, OUR_KEY);
            assertTrue(name, accepted());
        }
    }

    @Test
    public void aColdProviderReadsItsOwnContextWithoutSettingsOrCachedSigners() {
        InstagramSignature.ownSigners = new Signature[]{OTHER_KEY};
        SettingsContextRule.withoutContext(() -> {
            assertFalse(Utils.settingsReady());
            assertTrue(accepted());
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> assertTrue(accepted()));
    }

    @Test
    public void everyCurrentSignerMustMatchAndSigningHistoryEarnsNoTrust() {
        packages.installPackage(info(INSTAGRAM, Process.myUid(), OUR_KEY, OTHER_KEY));
        installCaller(InstagramSignature.THREADS, OTHER_KEY, OUR_KEY);
        assertTrue("signer order doesn't matter", accepted());
        installCaller(InstagramSignature.THREADS, OUR_KEY);
        assertFalse("a subset", accepted());
        packages.installPackage(info(INSTAGRAM, Process.myUid(), OUR_KEY));
        installCaller(InstagramSignature.THREADS, OUR_KEY, OTHER_KEY);
        assertFalse("an extra signer", accepted());
        PackageInfo rotated = info(InstagramSignature.THREADS, callerUid, OTHER_KEY);
        rotated.signingInfo = signing(new Signature[]{OTHER_KEY}, new Signature[]{OUR_KEY, OTHER_KEY});
        packages.installPackage(rotated);
        assertFalse("a matching old signer", accepted());
    }

    @Test
    public void metaSignedBuildsKeepTheNativePolicy() {
        List<Signature> meta = new ArrayList<>(InstagramSignature.originalSigners(info(INSTAGRAM, Process.myUid(), OUR_KEY)));
        meta.addAll(InstagramSignature.familySigners(InstagramSignature.THREADS, new Signature[]{OUR_KEY}, new Signature[]{OUR_KEY}));
        meta.addAll(InstagramSignature.familySigners(InstagramSignature.FACEBOOK, new Signature[]{OUR_KEY}, new Signature[]{OUR_KEY}));
        for (Signature certificate : meta) {
            packages.installPackage(info(INSTAGRAM, Process.myUid(), certificate));
            installCaller(InstagramSignature.THREADS, certificate);
            assertFalse("a Meta certificate", accepted());
            packages.installPackage(info(INSTAGRAM, Process.myUid(), OUR_KEY, certificate));
            installCaller(InstagramSignature.THREADS, OUR_KEY, certificate);
            assertFalse("a Meta certificate among several signers", accepted());
        }
    }

    @Test
    public void anotherKeyOrUnlistedPackageIsRefused() {
        installCaller(InstagramSignature.THREADS, OTHER_KEY);
        assertFalse(accepted());
        for (String name : new String[]{"com.instagram.barcelona.clone", "com.facebook.lite", INSTAGRAM, "com.example.app"}) {
            installCaller(name, OUR_KEY);
            assertFalse(name, accepted());
        }
    }

    @Test
    public void callerUidMustIdentifyOneUnambiguousNamedPackage() {
        packages.setPackagesForUid(callerUid, InstagramSignature.THREADS, "com.example.app");
        assertFalse("a shared uid", accepted());
        packages.setPackagesForUid(callerUid);
        assertFalse("an empty package list", accepted());
        callAs(callerUid + 1);
        assertFalse("an unknown uid", accepted());
    }

    @Test
    public void callerAndSelfPackageRecordsMustAgreeWithTheirUids() {
        packages.installPackage(info(InstagramSignature.THREADS, callerUid + 1, OUR_KEY));
        packages.setPackagesForUid(callerUid, InstagramSignature.THREADS);
        assertFalse("caller uid disagrees", accepted());
        installCaller(InstagramSignature.THREADS, OUR_KEY);
        packages.installPackage(info(INSTAGRAM, Process.myUid() + 1, OUR_KEY));
        assertFalse("self uid disagrees", accepted());
        packages.installPackage(info(INSTAGRAM, Process.myUid(), OUR_KEY));
        PackageInfo caller = info(InstagramSignature.THREADS, callerUid, OUR_KEY);
        caller.applicationInfo.packageName = "com.example.app";
        packages.installPackage(caller);
        assertFalse("caller application name disagrees", accepted());
    }

    @Test
    public void aCallerInAnotherAndroidUserIsRefused() {
        int otherUser = callerUid + 100000;
        packages.installPackage(info(InstagramSignature.THREADS, otherUser, OUR_KEY));
        packages.setPackagesForUid(otherUser, InstagramSignature.THREADS);
        callAs(otherUser);
        assertFalse(accepted());
    }

    @Test
    public void oldSignatureArraysAndUnreadableCurrentSignersEarnNoTrust() {
        for (String name : new String[]{INSTAGRAM, InstagramSignature.THREADS}) {
            PackageInfo missing = info(name, name.equals(INSTAGRAM) ? Process.myUid() : callerUid);
            missing.signatures = new Signature[]{OUR_KEY};
            packages.installPackage(missing);
            assertFalse("only old signatures for " + name, accepted());
            packages.installPackage(info(INSTAGRAM, Process.myUid(), OUR_KEY));
            installCaller(InstagramSignature.THREADS, OUR_KEY);
            PackageInfo invalid = info(name, name.equals(INSTAGRAM) ? Process.myUid() : callerUid, OUR_KEY);
            invalid.signingInfo = signing(new Signature[]{null}, null);
            packages.installPackage(invalid);
            assertFalse("a null current signer for " + name, accepted());
            packages.installPackage(info(INSTAGRAM, Process.myUid(), OUR_KEY));
            installCaller(InstagramSignature.THREADS, OUR_KEY);
        }
    }

    @Test
    public void missingPackagesAndContextFailuresKeepTheNativeDecision() {
        packages.removePackage(InstagramSignature.THREADS);
        assertFalse("an unreadable caller", accepted());
        installCaller(InstagramSignature.THREADS, OUR_KEY);
        packages.removePackage(INSTAGRAM);
        assertFalse("an unreadable self", accepted());
        assertFalse(InstagramSignature.isSameKeyFamilyProviderCaller(null));
        Context unavailable = new ContextWrapper(context) {
            @Override public PackageManager getPackageManager() { throw new SecurityException("test denial"); }
        };
        assertFalse(InstagramSignature.isSameKeyFamilyProviderCaller(unavailable));
        Context unnamed = new ContextWrapper(context) {
            @Override public String getPackageName() { return "com.example.app"; }
        };
        assertFalse(InstagramSignature.isSameKeyFamilyProviderCaller(unnamed));
    }
}
