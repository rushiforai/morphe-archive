/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import static org.junit.Assert.assertEquals;
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
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowPackageManager;
import org.robolectric.shadows.ShadowSigningInfo;

import java.security.MessageDigest;
import java.util.Base64;
import java.util.List;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * What the signer reader answers. This app gets Instagram's two Meta certificates, as before. A
 * Threads, Facebook or Messenger signed with this build's own key gets that app's Meta certificate,
 * so Instagram opens it and takes it as a share or sign-in caller (#22). Any other key, package or
 * unreadable fact keeps Instagram's own answer, and nothing here throws into Instagram.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class InstagramSignatureTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** This build's key, a stranger's and a third. Any distinct certificates will do. */
    private static final Signature OUR_KEY = new Signature("308201a0b1c2d3");
    private static final Signature OTHER_KEY = new Signature("3040e5f6a7b8c9");
    private static final Signature THIRD_KEY = new Signature("30500a1b2c3d4e");

    private static final int FAMILY_UID = 12345;

    /** The SHA-256 of each Meta certificate, hex and as Instagram 449's trust table holds it. */
    private static final String INSTAGRAM_SHA256 = "5f3e50f435583c9ae626302a71f7340044087a7e2c60adacfc254205a993e305";
    private static final String INSTAGRAM_ROTATED_SHA256 = "3a10c50c";
    private static final String THREADS_SHA256 = "5367570bad488d8da6a0fab78d9766a1a4c23c3c70fac0ad2e91c8f0bd58b432";
    private static final String THREADS_TABLE = "U2dXC61IjY2moPq3jZdmoaTCPDxw-sCtLpHI8L1YtDI";
    private static final String FACEBOOK_SHA256 = "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1";
    private static final String FACEBOOK_TABLE = "4_nh4M-Z0OVqBVumXiQbM5n3zqUkMmsM3W7BMn7Q_cE";

    private Context context;
    private ShadowPackageManager packages;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        packages = shadowOf(context.getPackageManager());
        InstagramSignature.ownSigners = null;
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        InstagramSignature.ownSigners = null;
        HookStatus.clear();
    }

    /** A PackageInfo whose SigningInfo holds [current], as PackageManager fills it on API 28 and up. */
    private static PackageInfo packageInfo(String packageName, int uid, Signature... current) {
        PackageInfo info = new PackageInfo();
        info.packageName = packageName;
        if (current.length > 0) info.signingInfo = signingInfo(current, null);
        ApplicationInfo app = new ApplicationInfo();
        app.packageName = packageName;
        app.uid = uid;
        info.applicationInfo = app;
        return info;
    }

    private static SigningInfo signingInfo(Signature[] current, Signature[] history) {
        SigningInfo signing = new SigningInfo();
        ShadowSigningInfo shadow = Shadow.extract(signing);
        shadow.setSignatures(current);
        if (history != null) shadow.setPastSigningCertificates(history);
        return signing;
    }

    /** The system's PackageInfo for this app, signed with [current]. */
    private PackageInfo thisApp(Signature... current) {
        return packageInfo(context.getPackageName(), Process.myUid(), current);
    }

    private static PackageInfo family(String packageName, Signature... current) {
        return packageInfo(packageName, FAMILY_UID, current);
    }

    /** Instagram reads its own signers through the hook, which keeps the real ones it sees. */
    private void seeOwnSigners(Signature... current) {
        assertNotNull(InstagramSignature.originalSigners(thisApp(current)));
    }

    private static String sha256(Signature signature) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(signature.toByteArray());
        StringBuilder hex = new StringBuilder();
        for (byte b : digest) hex.append(String.format("%02x", b));
        return hex.toString();
    }

    /** The SHA-256 the way Instagram's identity code writes it: base64url without padding. */
    private static String tableEntry(Signature signature) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(signature.toByteArray());
        return Base64.getUrlEncoder().withoutPadding().encodeToString(digest);
    }

    private static String trustLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.RESTORE_TRUST + ":")) return line;
        }
        return null;
    }

    private void assertAnswers(String packageName, String sha256, String tableEntry) throws Exception {
        List<Signature> signers = InstagramSignature.originalSigners(family(packageName, OUR_KEY));
        assertNotNull(packageName + " carries this build's key", signers);
        assertEquals(1, signers.size());
        assertEquals(packageName, sha256, sha256(signers.get(0)));
        assertEquals(packageName, tableEntry, tableEntry(signers.get(0)));
    }

    // -- This app ----------------------------------------------------------------------------------

    /** Unchanged: this app gets Instagram's original certificate and the one it rotated to. */
    @Test
    public void thisAppStillGetsInstagramsTwoCertificates() throws Exception {
        List<Signature> signers = InstagramSignature.originalSigners(thisApp(OUR_KEY));
        assertNotNull(signers);
        assertEquals(2, signers.size());
        assertEquals(INSTAGRAM_SHA256, sha256(signers.get(0)));
        assertTrue(sha256(signers.get(1)).startsWith(INSTAGRAM_ROTATED_SHA256));
        String line = trustLine();
        assertNotNull(line);
        assertTrue(line, line.contains("invoked 1,"));
        assertTrue("no family app check ran: " + line, !line.contains("Counted"));

        // With no signers in the PackageInfo there's nothing to keep, and the answer is the same.
        InstagramSignature.ownSigners = null;
        assertEquals(signers, InstagramSignature.originalSigners(thisApp()));
        assertNull(InstagramSignature.ownSigners);

        // Nor with only the old signatures array, which after a rotation holds the oldest signer.
        PackageInfo signaturesOnly = thisApp();
        signaturesOnly.signatures = new Signature[]{OUR_KEY};
        assertEquals(signers, InstagramSignature.originalSigners(signaturesOnly));
        assertNull(InstagramSignature.ownSigners);
    }

    /**
     * A record that only names this app, with no ApplicationInfo for the uid check, gets the same
     * answer but seeds nothing: anyone can build one. The family check reads this build's signers
     * from PackageManager instead, so the record's key earns a family app no trust.
     */
    @Test
    public void aRecordThatOnlyNamesThisAppSeedsNoSigners() {
        PackageInfo named = new PackageInfo();
        named.packageName = "com.instagram.android";
        named.signingInfo = signingInfo(new Signature[]{OTHER_KEY}, null);
        assertEquals(2, InstagramSignature.originalSigners(named).size());
        assertNull("a name-only record seeds this build's signers", InstagramSignature.ownSigners);

        packages.installPackage(thisApp(OUR_KEY));
        assertNull("the name-only record's key", InstagramSignature.originalSigners(family(InstagramSignature.THREADS, OTHER_KEY)));
        assertNotNull("this build's real key", InstagramSignature.originalSigners(family(InstagramSignature.THREADS, OUR_KEY)));
    }

    // -- Family apps signed with this build's key --------------------------------------------------

    @Test
    public void aSameKeyThreadsGetsThreadsMetaCertificate() throws Exception {
        seeOwnSigners(OUR_KEY);
        assertAnswers(InstagramSignature.THREADS, THREADS_SHA256, THREADS_TABLE);
        String line = trustLine();
        assertTrue(line, line.contains("same-key family app 1"));
    }

    @Test
    public void aSameKeyFacebookOrMessengerGetsFacebooksMetaCertificate() throws Exception {
        seeOwnSigners(OUR_KEY);
        assertAnswers(InstagramSignature.FACEBOOK, FACEBOOK_SHA256, FACEBOOK_TABLE);
        assertAnswers(InstagramSignature.MESSENGER, FACEBOOK_SHA256, FACEBOOK_TABLE);
    }

    /** Before Instagram has read its own signers, they come from PackageManager. */
    @Test
    public void ownSignersAreReadFromPackageManagerWhenNotSeenYet() throws Exception {
        packages.installPackage(thisApp(OUR_KEY));
        assertAnswers(InstagramSignature.THREADS, THREADS_SHA256, THREADS_TABLE);
        assertNotNull(InstagramSignature.ownSigners);
    }

    /** A record without SigningInfo is read again from PackageManager, which confirms this key. */
    @Test
    public void aMissingSigningInfoIsReadAgainFromPackageManager() {
        seeOwnSigners(OUR_KEY);
        packages.installPackage(family(InstagramSignature.THREADS, OUR_KEY));
        PackageInfo threads = family(InstagramSignature.THREADS);
        threads.signatures = new Signature[]{OUR_KEY};
        assertNotNull(InstagramSignature.originalSigners(threads));
    }

    /**
     * Without SigningInfo, Android fills the signatures array with the oldest signer of a rotated
     * app. A Threads that rotated away from this build's key still shows it there, and
     * PackageManager's current signer is what counts.
     */
    @Test
    public void anOldSignaturesEntryDoesNotOutlastARotation() {
        seeOwnSigners(OUR_KEY);
        PackageInfo installed = family(InstagramSignature.THREADS);
        installed.signingInfo = signingInfo(new Signature[]{OTHER_KEY}, new Signature[]{OUR_KEY, OTHER_KEY});
        packages.installPackage(installed);
        PackageInfo threads = family(InstagramSignature.THREADS);
        threads.signatures = new Signature[]{OUR_KEY};
        assertNull(InstagramSignature.originalSigners(threads));
        String line = trustLine();
        assertTrue(line, line.contains("family app with another key 1"));
    }

    /** A record without SigningInfo that can't be read again earns no trust, whatever its signatures say. */
    @Test
    public void aMissingSigningInfoThatCantBeReadAgainGivesNoTrust() {
        seeOwnSigners(OUR_KEY);
        PackageInfo threads = family(InstagramSignature.THREADS);
        threads.signatures = new Signature[]{OUR_KEY};

        // Before HushGram's start there's no context to ask.
        Object[] answer = {"unanswered"};
        SettingsContextRule.withoutContext(() -> answer[0] = InstagramSignature.originalSigners(threads));
        assertNull(answer[0]);

        // PackageManager doesn't know it: the failure is reported, and nothing is trusted.
        assertNull(InstagramSignature.originalSigners(threads));
        String missing = HookStatus.missing(FamilyNames.RESTORE_TRUST).toString();
        assertTrue(missing, missing.contains(InstagramSignature.FAMILY_HOOK));

        // PackageManager knows the package but not its signers.
        packages.installPackage(family(InstagramSignature.THREADS));
        assertNull(InstagramSignature.originalSigners(threads));
        String line = trustLine();
        assertTrue(line, line.contains("family app with another key 2"));
    }

    /** A family app judged by its current signer: rotated to this key, it's ours; away from it, it isn't. */
    @Test
    public void aRotatedFamilyAppIsJudgedByItsCurrentSigner() {
        seeOwnSigners(OUR_KEY);
        PackageInfo toOurs = family(InstagramSignature.THREADS);
        toOurs.signingInfo = signingInfo(new Signature[]{OUR_KEY}, new Signature[]{OTHER_KEY, OUR_KEY});
        assertNotNull("rotated to this build's key", InstagramSignature.originalSigners(toOurs));

        PackageInfo away = family(InstagramSignature.THREADS);
        away.signingInfo = signingInfo(new Signature[]{OTHER_KEY}, new Signature[]{OUR_KEY, OTHER_KEY});
        assertNull("rotated away from this build's key", InstagramSignature.originalSigners(away));
    }

    /** With several signers every one has to match, in any order, and no more. */
    @Test
    public void severalSignersHaveToMatchExactly() {
        seeOwnSigners(OUR_KEY, OTHER_KEY);
        String threads = InstagramSignature.THREADS;
        assertNotNull(InstagramSignature.originalSigners(family(threads, OTHER_KEY, OUR_KEY)));
        assertNull("one of two", InstagramSignature.originalSigners(family(threads, OUR_KEY)));
        assertNull("one swapped", InstagramSignature.originalSigners(family(threads, OUR_KEY, THIRD_KEY)));
        assertNull("one more", InstagramSignature.originalSigners(family(threads, OUR_KEY, OTHER_KEY, THIRD_KEY)));

        // The same, straight from the arrays.
        Signature[] ours = {OUR_KEY, OTHER_KEY};
        assertNotNull(InstagramSignature.familySigners(threads, new Signature[]{OTHER_KEY, OUR_KEY}, ours));
        assertNull(InstagramSignature.familySigners(threads, new Signature[]{OUR_KEY}, ours));
        assertNull(InstagramSignature.familySigners(threads, new Signature[]{OUR_KEY, null}, ours));
        assertNull(InstagramSignature.familySigners(threads, new Signature[]{OUR_KEY, OTHER_KEY}, new Signature[]{OUR_KEY}));
    }

    // -- Instagram's own answer stands --------------------------------------------------------------

    @Test
    public void aFamilyAppWithAnotherKeyIsLeftToInstagram() {
        seeOwnSigners(OUR_KEY);
        for (String name : new String[]{InstagramSignature.THREADS, InstagramSignature.FACEBOOK, InstagramSignature.MESSENGER}) {
            assertNull(name, InstagramSignature.originalSigners(family(name, OTHER_KEY)));
            // A record with no signers is read again, and PackageManager has none either.
            packages.installPackage(family(name));
            assertNull(name + " with no signers", InstagramSignature.originalSigners(family(name)));
        }
        String line = trustLine();
        assertTrue(line, line.contains("family app with another key 6"));
    }

    /** Only the three names, exactly. Lookalikes and other Meta apps keep Instagram's answer, uncounted. */
    @Test
    public void anyOtherPackageIsLeftToInstagram() {
        seeOwnSigners(OUR_KEY);
        HookStatus.clear();
        for (String name : new String[]{"com.example.other", "com.instagram.lite", "com.facebook.lite",
                "com.facebook.katana.x", "com.instagram.barcelonax", "com.facebook.orca2", "com.instagram.android"}) {
            assertNull(name, InstagramSignature.originalSigners(family(name, OUR_KEY)));
        }
        assertNull(InstagramSignature.originalSigners(null));
        assertNull(InstagramSignature.familySigners(null, new Signature[]{OUR_KEY}, new Signature[]{OUR_KEY}));
        assertNull("nothing counted", trustLine());
    }

    /**
     * A build that still carries one of Instagram's Meta certificates isn't re-signed. A family app
     * signed by Meta passes Instagram's own check, so the hook steps aside, even for a matching key.
     */
    @Test
    public void aMetaSignedBuildLeavesFamilyAppsToInstagram() {
        List<Signature> instagram = InstagramSignature.originalSigners(thisApp(OUR_KEY));
        for (Signature meta : instagram) {
            InstagramSignature.ownSigners = null;
            seeOwnSigners(meta);
            assertNull(InstagramSignature.originalSigners(family(InstagramSignature.THREADS, meta)));
            assertNull(InstagramSignature.originalSigners(family(InstagramSignature.FACEBOOK, meta)));
        }
        String line = trustLine();
        assertTrue(line, line.contains("family app, Meta-signed build 4"));
    }

    /** Without this build's own signers there's nothing to compare with, so no trust. */
    @Test
    public void unknownOwnSignersGiveNoTrust() {
        PackageInfo threads = family(InstagramSignature.THREADS, OUR_KEY);

        // Before HushGram's start: no context and nothing seen yet.
        Object[] answer = {"unanswered"};
        SettingsContextRule.withoutContext(() -> answer[0] = InstagramSignature.originalSigners(threads));
        assertNull(answer[0]);

        // PackageManager knows the package but not its signers.
        packages.installPackage(thisApp());
        assertNull(InstagramSignature.originalSigners(threads));
        assertNull(InstagramSignature.ownSigners);
        String line = trustLine();
        assertTrue(line, line.contains("family app, own signers unknown 2"));

        // An unreadable read isn't kept, so the next check reads again.
        packages.installPackage(thisApp(OUR_KEY));
        assertNotNull(InstagramSignature.originalSigners(threads));
    }

    // -- Failures ---------------------------------------------------------------------------------

    /** A certificate that throws on read is reported under the patch and keeps Instagram's answer. */
    @Test
    public void aThrowingSignerIsReportedAndLeftToInstagram() {
        seeOwnSigners(OUR_KEY);
        Signature broken = new Signature("3001") {
            @Override
            public byte[] toByteArray() {
                throw new IllegalStateException("unreadable certificate");
            }
        };
        assertNull(InstagramSignature.originalSigners(family(InstagramSignature.THREADS, broken)));
        String missing = HookStatus.missing(FamilyNames.RESTORE_TRUST).toString();
        assertTrue(missing, missing.contains(InstagramSignature.FAMILY_HOOK));
    }

    /** A PackageManager that throws is reported too, and the answer for this app is untouched. */
    @Test
    public void aThrowingPackageManagerIsReportedAndLeftToInstagram() {
        Utils.setContext(new ContextWrapper(context) {
            @Override
            public PackageManager getPackageManager() {
                throw new SecurityException("package manager unavailable");
            }
        });
        assertNull(InstagramSignature.originalSigners(family(InstagramSignature.THREADS, OUR_KEY)));
        String missing = HookStatus.missing(FamilyNames.RESTORE_TRUST).toString();
        assertTrue(missing, missing.contains(InstagramSignature.FAMILY_HOOK));
        assertEquals(2, InstagramSignature.originalSigners(thisApp(OUR_KEY)).size());
    }
}
