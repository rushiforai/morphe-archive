/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.coexist;

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

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Decides whether an Instagram caller or locally read provider carries this build's own key,
 * and so should be answered Instagram's Meta certificate the way Threads itself is answered its own.
 *
 * <p>Threads reads the signers of a package through one method for its caller checks. Restore
 * screens on re-signed builds rewrites that method to answer this build its original Meta certificate
 * for its own package. That single reader also gives Threads the <em>caller's</em> signers, from
 * which it builds the caller's identity. {@link
 * app.morphe.extension.hushthreads.misc.ThreadsSignature#originalSigners} asks this class there: when
 * the caller is an Instagram carrying this build's key, it answers Instagram's certificate for the
 * caller, so every one of Threads' caller rules judges it exactly as it would the Meta-signed app.
 * Threads' own code is left to make each of those decisions.
 *
 * <p>The caller is trusted only when all of these hold: its package is, by an exact name, one of
 * {@link #FAMILY_PACKAGES}, that package is the one the calling uid owns (so the read really is the
 * current IPC's caller and not this app's own read or a look at some other package), this build is
 * re-signed, and the certificate the caller carries now equals the one this build carries. A caller
 * with another signer, a name that only looks like a family app's, an unknown or absent caller, and
 * a build that still carries Meta's key all keep Threads' own answer, so nothing Threads wouldn't
 * already trust is let in.
 *
 * <p>Only someone holding the user's Manager key can sign an app to this certificate, so a
 * same-certificate caller is one the user built and installed themselves.
 */
@SuppressWarnings("unused")
public final class FamilySignatureTrust {
    private FamilySignatureTrust() {
    }

    /**
     * The Meta apps a same-key caller may be answered for, by their exact package names. A name has
     * to match exactly; a lookalike such as {@code com.instagram.android.x} is not one of them. The
     * signing certificate is what makes the caller safe to trust; this list keeps the widening to
     * the app whose Meta certificate {@link app.morphe.extension.hushthreads.misc.ThreadsSignature}
     * answers for it. Threads signs in with an Instagram account, and Instagram is the one Meta app
     * that calls into Threads for it.
     */
    static final Set<String> FAMILY_PACKAGES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "com.instagram.android" // Instagram
    )));

    /**
     * The SHA-256 of Threads' original signing certificate, the one Restore screens answers with
     * for this app.
     */
    static final String META_THREADS_SHA256 = "5367570bad488d8da6a0fab78d9766a1a4c23c3c70fac0ad2e91c8f0bd58b432";

    /**
     * The SHA-256 of every certificate Meta signs Threads with. Threads 449 rotates its signer with
     * an APK v3.1 lineage: the original certificate ({@link #META_THREADS_SHA256}, read up to API 32)
     * and a newer one read from API 33. A build whose current signer is either of these isn't
     * re-signed, so the hook steps aside, whatever Android version it runs on.
     */
    static final Set<String> META_SIGNER_DIGESTS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            META_THREADS_SHA256,
            "8f38da6b4dc34b1900353bde4630043198cbe3ef7214151f86679cd000c90500"
    )));

    /**
     * This build's own current signers, read on the first family caller or provider check that finds any. Android
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
     * error all answer false, so Threads' own answer stands. This runs whenever Restore screens on
     * re-signed builds is in the build: it rides on the same signers reader Restore screens rewrites
     * for its own package, so a build without that patch never reaches here.
     *
     * <p>Threads reads a package's signers for its own app, for the calling app, and for others it
     * looks up. Only the calling app's read is widened: a package that isn't a family name, or a
     * family name the calling uid doesn't own, leaves here uncounted, because those reads happen all
     * the time and none of them is the cross-app sign-in this stands in for.
     */
    public static boolean isSameKeyFamilyCaller(@Nullable PackageInfo callerInfo) {
        // No Pause check: like the renamed permissions, this stays in while paused.
        if (callerInfo == null) return false;
        String caller = callerInfo.packageName;
        if (caller == null || !FAMILY_PACKAGES.contains(caller)) return false;

        try {
            Context context = Utils.getContext();
            // Without a context there's nothing to check the caller against.
            if (context == null) return false;
            PackageManager packages = context.getPackageManager();
            if (packages == null) return false;

            // Only the current IPC's caller is widened: the family package has to be the one the
            // calling uid owns, and that uid can't be our own. Framework lookups may throw too.
            int callingUid = Binder.getCallingUid();
            if (callingUid == Process.myUid()) return false;
            if (!owns(packages, callingUid, caller)) return false;

            // Count only a verified family caller, under the patch that carries the hook.
            HookStatus.invoked(FamilyNames.RESTORE_TRUST);
            Set<String> ours = ownSigners;
            if (ours == null) {
                ours = currentSigners(packages, context.getPackageName());
                if (ours.isEmpty()) return no(caller, "error: our own signers were unreadable");
                ownSigners = ours;
            }
            // Not re-signed, as a Root Mount install isn't: Threads reads its own key as it is and
            // already trusts a caller carrying it, so there's nothing to stand in for. Either of Meta's
            // rotated certificates means this build is genuine, whichever one Android reports as current.
            if (!Collections.disjoint(ours, META_SIGNER_DIGESTS)) return no(caller, "this build carries Meta's key");

            // The caller's real current signers, read past the Restore screens spoof: from the raw
            // SigningInfo the framework put in the caller's PackageInfo, or straight from
            // PackageManager when that's absent. Restore screens rewrites Threads' own signers
            // reader, not the PackageInfo object and not PackageManager, so both reads are the truth.
            Set<String> callerSigners = signersOf(callerInfo);
            if (callerSigners.isEmpty()) callerSigners = currentSigners(packages, caller);
            if (!ours.equals(callerSigners)) return no(caller, "caller signer differs");

            HookStatus.bound(FamilyNames.RESTORE_TRUST, "shared sign-in for " + caller);
            HookStatus.counted(FamilyNames.RESTORE_TRUST, "shared sign-in");
            Logger.printDebug(() -> "Coexist: " + caller + " carries this build's key, treating it as Meta's own");
            return true;
        } catch (Throwable failure) {
            // Fail closed: a caller this can't vouch for keeps Threads' own refusal.
            HookStatus.threw(FamilyNames.RESTORE_TRUST, "shared sign-in", failure);
            Logger.printException(() -> "Could not tell whether the caller shares this build's key", failure);
            return false;
        }
    }

    /**
     * A local lookup of the installed Instagram peer for Threads' outbound sign-in provider reader.
     * Incoming IPCs still use the caller policy above. Both packages must own separate, exclusive
     * uids and carry the same current non-Meta key. Read the peer's signers from PackageManager,
     * rather than trusting a supplied or stale signer list. Missing facts keep the stock answer.
     */
    public static boolean isSameKeyFamilyProvider(@Nullable PackageInfo info) {
        if (info == null || !FAMILY_PACKAGES.contains(info.packageName) || info.applicationInfo == null
                || !info.packageName.equals(info.applicationInfo.packageName)) return false;
        try {
            int self = Process.myUid();
            int peer = info.applicationInfo.uid;
            if (Process.isIsolated() || Binder.getCallingUid() != self || peer == self) return false;
            Context context = Utils.getContext();
            if (context == null) return false;
            PackageManager packages = context.getPackageManager();
            if (packages == null || !owns(packages, self, context.getPackageName())
                    || !owns(packages, peer, info.packageName)) return false;
            PackageInfo installed = packages.getPackageInfo(info.packageName, PackageManager.GET_SIGNING_CERTIFICATES);
            if (installed.applicationInfo == null || installed.applicationInfo.uid != peer
                    || !info.packageName.equals(installed.packageName)
                    || !info.packageName.equals(installed.applicationInfo.packageName)) return false;
            Set<String> ours = ownSigners;
            if (ours == null) {
                ours = currentSigners(packages, context.getPackageName());
                if (ours.isEmpty()) return false;
                ownSigners = ours;
            }
            if (!Collections.disjoint(ours, META_SIGNER_DIGESTS) || !ours.equals(signersOf(installed))) return false;
            HookStatus.invoked(FamilyNames.RESTORE_TRUST);
            HookStatus.bound(FamilyNames.RESTORE_TRUST, "same-key Instagram provider");
            HookStatus.counted(FamilyNames.RESTORE_TRUST, "shared sign-in provider");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.RESTORE_TRUST, "shared sign-in provider", failure);
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
     * hook stands in for, so it keeps Threads' answer.
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
     * in, so the Restore screens spoof, which rewrites Threads' own reader rather than this object,
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
