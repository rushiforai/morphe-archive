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

import androidx.annotation.Nullable;

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Lets a Meta family app re-signed with this build's own key pass Facebook's SameKey caller rule, so
 * a Messenger patched with the same Manager key can sign in through a patched Facebook.
 *
 * <p>Facebook guards some content providers (its sign-in store, {@code UserValuesProvider} among
 * them) with a SameKey rule: a cross-process caller is allowed only when it carries the same signing
 * certificate as Facebook itself. Restore screens on re-signed builds answers Facebook its original
 * Meta certificate whenever it reads its own package's signers, so that rule builds its trusted set
 * from Meta's certificate rather than this build's. A Messenger re-signed with the user's Manager key
 * carries that key, not Meta's, so the rule refuses it and single sign-on fails with a
 * SecurityException.
 *
 * <p>One evaluator judges every rule Facebook's providers use: anyone, a list of trusted apps, Meta's
 * family signatures, a named Facebook permission, and SameKey. The patch hands this method the rule
 * being checked next to Facebook's SameKey singleton, and only a SameKey check is widened. The other
 * rules never asked for Facebook's own key, so a same-key caller gets exactly Facebook's answer there.
 *
 * <p>Under the SameKey rule, the caller is let in only if both hold: its package is one of the Meta
 * family apps by an exact name, and the certificate it carries now equals the one this build carries.
 * A caller with another signer, a name that only looks like a family app's, an unknown or absent
 * caller, and an isolated process under its own uid all keep Facebook's refusal. A build that still
 * carries Meta's key, as a Root Mount install does, reads its own signers as they are, so Facebook's
 * rule already trusts that key and this method steps aside entirely.
 *
 * <p>Only someone holding the user's Manager key can sign an app to this certificate, so a
 * same-certificate caller is one the user built and installed themselves. That is the trust the
 * SameKey rule means to place: the caller and Facebook come from the same signer.
 */
@SuppressWarnings("unused")
public final class FamilySignatureTrust {
    private FamilySignatureTrust() {
    }

    /**
     * The Meta family apps that share sign-in, by their exact package names. A name has to match one
     * of these exactly; a lookalike such as {@code com.facebook.orca.x} is not one of them. The
     * signing certificate is what makes the caller safe to trust; this list keeps the widening to the
     * apps Facebook treats as family.
     */
    static final Set<String> FAMILY_PACKAGES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "com.facebook.katana",   // Facebook
            "com.facebook.orca",     // Messenger
            "com.facebook.mlite",    // Messenger Lite
            "com.facebook.lite",     // Facebook Lite
            "com.instagram.android", // Instagram
            "com.instagram.lite"     // Instagram Lite
    )));

    /**
     * The SHA-256 of Facebook's original signing certificate, the one Restore screens answers with.
     * A build whose own signers include it isn't re-signed.
     */
    static final String META_FACEBOOK_SHA256 = "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1";

    /**
     * This build's own current signers, read on the first SameKey check that finds any. Android
     * can't change a running app's certificate without starting a new process, so every later check
     * reads only the caller's.
     */
    static volatile Set<String> ownSigners;

    /**
     * Whether the app now calling a guarded Facebook component should be let in as a same-key family
     * app. True only when [policy] is Facebook's SameKey rule, the very object [sameKey] the patch
     * reads from Facebook's SameKey singleton, this build is re-signed, the caller's package is one
     * of {@link #FAMILY_PACKAGES} by an exact name, and its current signing certificate equals this
     * build's. Any other rule, any missing fact, any other signer or name, and any error answer
     * false, so the check keeps Facebook's own answer.
     */
    public static boolean accept(@Nullable Context context, @Nullable Object policy, @Nullable Object sameKey) {
        // Identity, not equals(): Facebook's rule classes answer equals() for any instance of their
        // class, and only the singleton is the SameKey rule. Every other rule leaves here, uncounted.
        if (sameKey == null || policy != sameKey) return false;
        HookStatus.invoked(FamilyNames.INSTALL_BESIDE_META_APPS);
        try {
            if (context == null) return false;
            PackageManager packages = context.getPackageManager();
            if (packages == null) return false;

            Set<String> ours = ownSigners;
            if (ours == null) {
                ours = currentSigners(packages, context.getPackageName());
                if (ours.isEmpty()) return false;
                ownSigners = ours;
            }
            // Not re-signed: Facebook reads its own key as it is, so its rule already trusts callers
            // carrying it, and anything this let in beyond that would be a widening of Meta's rule.
            if (ours.contains(META_FACEBOOK_SHA256)) return false;

            // The caller's uid is the one whose provider access is being checked. Resolving it to a
            // package tells an isolated or unknown caller apart: those run under a uid PackageManager
            // knows no package for, and get nothing back.
            String[] callerPackages = packages.getPackagesForUid(Binder.getCallingUid());
            if (callerPackages == null || callerPackages.length == 0) return false;

            String family = null;
            for (String candidate : callerPackages) {
                if (FAMILY_PACKAGES.contains(candidate)) {
                    family = candidate;
                    break;
                }
            }
            if (family == null) return false;

            if (!ours.equals(currentSigners(packages, family))) return false;

            HookStatus.bound(FamilyNames.INSTALL_BESIDE_META_APPS, "shared sign-in for " + family);
            return true;
        } catch (Throwable failure) {
            // Fail closed: a caller this can't vouch for keeps Facebook's own refusal.
            HookStatus.threw(FamilyNames.INSTALL_BESIDE_META_APPS, "shared sign-in", failure);
            Logger.printException(() -> "Could not tell whether the caller shares this build's key", failure);
            return false;
        }
    }

    /**
     * The SHA-256 of each of [packageName]'s current signing certificates, read through
     * PackageManager with GET_SIGNING_CERTIFICATES. That's the current signers, or the history when
     * there's a single rotated signer. Two apps signed with one key answer the same set. The
     * extension runs on API 28 and up, where the signing info is what PackageManager fills in.
     */
    private static Set<String> currentSigners(PackageManager packages, String packageName) throws Exception {
        PackageInfo info = packages.getPackageInfo(packageName, PackageManager.GET_SIGNING_CERTIFICATES);
        SigningInfo signing = info.signingInfo;
        if (signing == null) return Collections.emptySet();
        Signature[] current = signing.getApkContentsSigners();
        if (current == null || current.length == 0) current = signing.getSigningCertificateHistory();
        return hashes(current);
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
