/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.coexist;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.Binder;
import android.os.Process;

import androidx.annotation.Nullable;

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Decides whether the app now calling a guarded Facebook component over Binder is a Meta family app
 * re-signed with this build's own key, and so should be answered Meta's certificate the way Facebook
 * itself is on a re-signed build.
 *
 * <p>Facebook reads the signers of a package through one method for its caller checks. Restore
 * screens on re-signed builds rewrites that method to answer this build its original Meta certificate
 * for its own package, so the parts of Facebook that compare a caller against Facebook's own key
 * build their trusted set from Meta's certificate. That single reader also gives Facebook the
 * <em>caller's</em> signers, from which it builds the caller's identity. {@link
 * app.morphe.extension.facebook.misc.FacebookSignature#originalSigners} asks this class there: when
 * the caller is a Meta family app carrying this build's key, it answers Meta's certificate for the
 * caller too, so the caller's identity carries Meta's certificate and every one of Facebook's caller
 * rules judges it exactly as it would the Meta-signed app. SameKey passes because this build's own
 * signers read as Meta's as well, and the family-signature, trusted-app and Facebook-permission rules
 * see a Meta family caller. Facebook's own code is left to make each of those decisions. This is the
 * same reader and the same security boundary Restore screens uses for itself, so the answer belongs
 * to Restore screens: it runs whenever that patch is in the build, whether or not Install beside
 * Meta's apps is picked too.
 *
 * <p>The caller is trusted only when all of these hold: its package is, by an exact name, one of the
 * Meta apps signed with Facebook's own certificate, that package is the one the calling uid owns (so
 * the read really is the current IPC's caller and not this app's own read or a look at some other
 * package), this build is re-signed, and the certificate the caller carries now equals the one this
 * build carries. A caller with another signer, a name that only looks like a family app's, an unknown
 * or absent caller, and a build that still carries Meta's key all keep Facebook's own answer, so
 * nothing Facebook wouldn't already trust is let in.
 *
 * <p>Only someone holding the user's Manager key can sign an app to this certificate, so a
 * same-certificate caller is one the user built and installed themselves. That is the trust Facebook
 * already places in a Meta app: the caller and Facebook come from the same signer.
 */
@SuppressWarnings("unused")
public final class FamilySignatureTrust {
    private FamilySignatureTrust() {
    }

    /**
     * The Meta apps signed with Facebook's own certificate, by their exact package names. A name has
     * to match one of these exactly; a lookalike such as {@code com.facebook.orca.x} is not one of
     * them. The signing certificate is what makes the caller safe to trust; this list keeps the
     * widening to the apps whose Meta-signed build carries the certificate the caller is answered.
     * Messenger 580 carries the same rotated pair as Facebook 580, and Messenger Lite 338 and
     * Facebook Lite 530 the original Facebook certificate alone. Instagram and Instagram Lite are
     * Meta's too, but signed with Instagram's own certificate, so Facebook's would be a wrong answer
     * for them.
     */
    static final Set<String> FAMILY_PACKAGES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "com.facebook.katana", // Facebook
            "com.facebook.orca",   // Messenger
            "com.facebook.mlite",  // Messenger Lite
            "com.facebook.lite"    // Facebook Lite
    )));

    /**
     * The SHA-256 of Facebook's original signing certificate, the one Restore screens answers with.
     * A caller answered this certificate is judged as the Meta-signed app.
     */
    static final String META_FACEBOOK_SHA256 = "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1";

    /**
     * The SHA-256 of every certificate Meta signs Facebook with. Facebook 580 rotates its signer with
     * an APK v3.1 lineage: the original Facebook Corporation certificate ({@link #META_FACEBOOK_SHA256},
     * used up to API 32) and the newer Meta Platforms certificate, used from API 33. A build whose
     * current signer is either of these isn't re-signed, so the hook steps aside, whatever Android
     * version it runs on. 577 carries the original one only.
     */
    static final Set<String> META_SIGNER_DIGESTS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            META_FACEBOOK_SHA256,
            "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27"
    )));

    /**
     * This build's own current signers, read on the first family-caller check that finds any. Android
     * can't change a running app's certificate without starting a new process, so every later check
     * reads only the caller's.
     */
    static volatile Set<String> ownSigners;

    /**
     * Whether [callerInfo] describes a Meta family app, re-signed with this build's own key, that is
     * the app now calling a guarded component. True only when [callerInfo]'s package is one of {@link
     * #FAMILY_PACKAGES} by an exact name and is owned by the calling uid, this build is re-signed, and
     * the caller's current signing certificate equals this build's. Any missing fact, any other signer
     * or name, a caller that isn't the calling app, a build that still carries Meta's key, and any
     * error all answer false, so Facebook's own answer stands. This runs whenever Restore screens on
     * re-signed builds is in the build: it rides on the same signers reader Restore screens rewrites
     * for its own package, so a build without that patch never reaches here.
     *
     * <p>Facebook reads a package's signers for its own app, for the calling app, and for others it
     * looks up. Only the calling app's read is widened: a package that isn't a family name, or a
     * family name the calling uid doesn't own, leaves here uncounted, because those reads happen all
     * the time and none of them is the cross-app sign-in this stands in for.
     */
    public static boolean isSameKeyFamilyCaller(@Nullable PackageInfo callerInfo) {
        // No Pause check: like the renamed permissions, this stays in while paused.
        if (callerInfo == null) return false;
        String caller = callerInfo.packageName;
        if (caller == null || !FAMILY_PACKAGES.contains(caller)) return false;

        Context context = Utils.getContext();
        // The caller's identity is read while a guarded component runs, well after the application
        // has a context. Without one there's nothing to check the caller against, so leave it.
        if (context == null) return false;
        PackageManager packages = context.getPackageManager();
        if (packages == null) return false;

        // The signers read runs for this app itself, for the app calling a component over Binder, and
        // for packages Facebook looks up for other reasons. Only the current IPC's caller is widened:
        // the family package has to be the one the calling uid owns, and that uid can't be our own.
        int callingUid = Binder.getCallingUid();
        if (callingUid == Process.myUid()) return false;
        if (!owns(packages, callingUid, caller)) return false;

        // From here the family package is the app now calling in. Count the check under Restore
        // screens, the patch that carries the hook, and record why it was or wasn't treated as
        // carrying Meta's certificate: a count a report shows without Debug logging, and a line that
        // says which caller and why when Debug logging is on.
        HookStatus.invoked(FamilyNames.RESTORE_TRUST);
        try {
            Set<String> ours = ownSigners;
            if (ours == null) {
                ours = currentSigners(packages, context.getPackageName());
                if (ours.isEmpty()) return no(caller, "error: our own signers were unreadable");
                ownSigners = ours;
            }
            // Not re-signed, as a Root Mount install isn't: Facebook reads its own key as it is and
            // already trusts a caller carrying it, so there's nothing to stand in for. Either of Meta's
            // rotated certificates means this build is genuine, whichever one Android reports as current.
            if (!Collections.disjoint(ours, META_SIGNER_DIGESTS)) return no(caller, "this build carries Meta's key");

            // The caller's real current signers, read past the Restore screens spoof: from the raw
            // SigningInfo the framework put in the caller's PackageInfo, or straight from
            // PackageManager when that's absent. Restore screens rewrites Facebook's own signers
            // reader, not the PackageInfo object and not PackageManager, so both reads are the truth.
            Set<String> callerSigners = signersOf(callerInfo);
            if (callerSigners.isEmpty()) callerSigners = currentSigners(packages, caller);
            if (!ours.equals(callerSigners)) return no(caller, "caller signer differs");

            HookStatus.bound(FamilyNames.RESTORE_TRUST, "shared sign-in for " + caller);
            HookStatus.counted(FamilyNames.RESTORE_TRUST, "shared sign-in");
            Logger.printDebug(() -> "Coexist: " + caller + " carries this build's key, treating it as Meta's own");
            return true;
        } catch (Throwable failure) {
            // Fail closed: a caller this can't vouch for keeps Facebook's own refusal.
            HookStatus.threw(FamilyNames.RESTORE_TRUST, "shared sign-in", failure);
            Logger.printException(() -> "Could not tell whether the caller shares this build's key", failure);
            return false;
        }
    }

    /**
     * Whether this install still carries one of Meta's Facebook signing certificates, as a Root
     * Mount install does. Those builds do not need Restore screens to make Facebook trust its own
     * package, because Android already reports Meta's key.
     */
    public static boolean thisBuildCarriesMetaKey(@Nullable Context context) {
        if (context == null) return false;
        PackageManager packages = context.getPackageManager();
        if (packages == null) return false;
        try {
            Set<String> ours = currentSigners(packages, context.getPackageName());
            return !ours.isEmpty() && !Collections.disjoint(ours, META_SIGNER_DIGESTS);
        } catch (Throwable failure) {
            Logger.printInfo(() -> "Could not tell whether this build carries Meta's key: "
                    + failure.getClass().getName());
            return false;
        }
    }

    /** Records a refusal reason as an always-on count and, with Debug logging on, a line, then denies. */
    private static boolean no(String caller, String reason) {
        HookStatus.counted(FamilyNames.RESTORE_TRUST, reason);
        Logger.printDebug(() -> "Coexist: " + caller + " not treated as Meta's own (" + reason + ")");
        return false;
    }

    /**
     * Whether every package sharing [uid] is [packageName], as it is for the app calling this IPC.
     * A uid that owns another package too, through a shared user id, isn't the lone family app the
     * hook stands in for, so it keeps Facebook's answer.
     */
    private static boolean owns(PackageManager packages, int uid, String packageName) {
        String[] callerPackages = packages.getPackagesForUid(uid);
        if (callerPackages == null || callerPackages.length == 0) return false;
        for (String candidate : callerPackages) {
            if (!packageName.equals(candidate)) return false;
        }
        return true;
    }

    /**
     * The SHA-256 of [info]'s current signers, read straight from the SigningInfo the framework filled
     * in, so the Restore screens spoof, which rewrites Facebook's own reader rather than this object,
     * can't answer it. The current signers only, not the rotation history: a caller that has rotated
     * away from this build's key is a different signer now. Empty when the info carries no details.
     */
    private static Set<String> signersOf(PackageInfo info) throws Exception {
        SigningInfo signing = info.signingInfo;
        return signing == null ? Collections.emptySet() : hashes(signing.getApkContentsSigners());
    }

    /**
     * The SHA-256 of each of [packageName]'s current signing certificates, read through PackageManager
     * with GET_SIGNING_CERTIFICATES. The current signers only, not the history, so a rotated caller or
     * a rotated own build is told by the certificate it carries now. Two apps signed with one key
     * answer the same set. The extension runs on API 28 and up, where PackageManager fills the info in.
     */
    private static Set<String> currentSigners(PackageManager packages, String packageName) throws Exception {
        PackageInfo info = packages.getPackageInfo(packageName, PackageManager.GET_SIGNING_CERTIFICATES);
        SigningInfo signing = info.signingInfo;
        return signing == null ? Collections.emptySet() : hashes(signing.getApkContentsSigners());
    }

    private static Set<String> hashes(@Nullable Signature[] signatures) throws Exception {
        if (signatures == null || signatures.length == 0) return Collections.emptySet();
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        Set<String> hashes = new LinkedHashSet<>();
        for (Signature signature : signatures) {
            if (signature == null) continue;
            byte[] sha256 = digest.digest(signature.toByteArray());
            StringBuilder hex = new StringBuilder(sha256.length * 2);
            for (byte b : sha256) hex.append(Character.forDigit((b >> 4) & 0xf, 16)).append(Character.forDigit(b & 0xf, 16));
            hashes.add(hex.toString());
        }
        return hashes;
    }
}
