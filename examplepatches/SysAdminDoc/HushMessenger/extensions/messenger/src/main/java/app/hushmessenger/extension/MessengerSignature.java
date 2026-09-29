/*
 * Adapted from Hushfacebook's FacebookSignature.java, itself forked from Andrew Liang's
 * morphe-patches (GPL-3.0). Modified for HushMessenger (Messenger), 2026.
 */
package app.hushmessenger.extension;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.Binder;
import android.os.Process;
import android.util.Base64;

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicIntegerArray;

/**
 * Helper for the Messenger "Restore screens on re-signed builds" patch.
 *
 * <p>Messenger's security code compares the signing certificate of a package with a table of Meta
 * certificates, and it does this for its own package too. A re-signed build has a different
 * certificate, so Messenger does not trust itself and some screens stay blank. The patch gives the
 * check the original certificate of Messenger when the package is Messenger.
 *
 * <p>The package name is enough to know that the package is this app. Android lets only one
 * installed app have a package name, and the patch does not rename Messenger.
 *
 * <p>The same lookup builds the identity of an app calling into Messenger, such as Facebook reading
 * Messenger's shared-key provider. A Facebook re-signed with this build's own key would fail every
 * rule Meta wrote for its original, so while Messenger reads the identity of the app on the other
 * end of the current call, and that app is Facebook carrying exactly this build's current signers,
 * the lookup answers Meta's certificate for it too. Messenger's own rules then give the answer they
 * give Meta's signed Facebook, and Meta's own grants still limit what it can reach.
 */
public final class MessengerSignature {

    private MessengerSignature() {}

    private static final String PACKAGE = "com.facebook.orca";

    /** Facebook. Meta signs it with the same certificate as Messenger. */
    static final String FACEBOOK = "com.facebook.katana";

    /** The original Meta signing certificate (shared across all Meta apps), DER in Base64. */
    private static final String CERTIFICATE =
        "MIICaDCCAdECBEqcRhAwDQYJKoZIhvcNAQEEBQAwejELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRIwEAYDVQQH"
        + "EwlQYWxvIEFsdG8xGDAWBgNVBAoTD0ZhY2Vib29rIE1vYmlsZTERMA8GA1UECxMIRmFjZWJvb2sxHTAbBgNVBAMT"
        + "FEZhY2Vib29rIENvcnBvcmF0aW9uMCAXDTA5MDgzMTIxNTIxNloYDzIwNTAwOTI1MjE1MjE2WjB6MQswCQYDVQQG"
        + "EwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCVBhbG8gQWx0bzEYMBYGA1UEChMPRmFjZWJvb2sgTW9iaWxlMREw"
        + "DwYDVQQLEwhGYWNlYm9vazEdMBsGA1UEAxMURmFjZWJvb2sgQ29ycG9yYXRpb24wgZ8wDQYJKoZIhvcNAQEBBQAD"
        + "gY0AMIGJAoGBAMIH1R3464yX2TugyMEALJKPqwDcG0L8peZumcwwI+0tIU2CK8WejjXdz19Ex66K3lDX4MQ09QDm"
        + "wTH0ooNPmH/EZAYRXeIBjruw1aPCYb2XWBzP73avxxNabVnohV7NfqzI+HN+eUxgp2HFNrcrEfrI5gP12hotVKoQ"
        + "O4oTwNvBAgMBAAEwDQYJKoZIhvcNAQEEBQADgYEAXum+i8uyUGSNO3QSkKgqHJ3C52oK8vIijx2fnEAHUpxEanAX"
        + "XFqQDVFBgShm20a+ZVniFBYWSDmYIR9KZzFJ+yIyoQ0kdmOyapAx4V+EvBx00UH/mKAtdvhbLIqyVxtkabIy2Odo"
        + "p/fKBPer5Kd1YVkWwHlAZWtYcXRXtCvZKKI=";

    /**
     * SHA-256 of Meta's Messenger signers: the certificate above and the one it rotated to for
     * Android 13 and newer. A build whose own signers include either still carries Meta's key.
     */
    static final Set<String> META_SIGNERS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
        "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1",
        "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27")));

    /** Why a Facebook call was or wasn't vouched for, in the order Copy setup lists them. */
    static final String[] CALLER_OUTCOMES = {"trusted", "signer_differs", "meta_signed_build", "not_family", "error"};
    static final int TRUSTED = 0, SIGNER_DIFFERS = 1, META_SIGNED_BUILD = 2, NOT_FAMILY = 3, ERROR = 4;
    static final AtomicIntegerArray callerCounts = new AtomicIntegerArray(CALLER_OUTCOMES.length);

    private static volatile List<Signature> original;

    /** This build's own current signers, read once: a running app's certificate can't change. */
    static volatile Set<String> ownSigners;

    /**
     * The original signers of Messenger if {@code info} is Messenger itself, or of Facebook if
     * {@code info} is the same-key Facebook now calling Messenger; otherwise {@code null} to keep
     * the signers that the system reports.
     */
    public static List<Signature> originalSigners(PackageInfo info) {
        if (info == null) return null;
        if (PACKAGE.equals(info.packageName)) return original();
        if (FACEBOOK.equals(info.packageName) && isSameKeyCaller(info)) return original();
        return null;
    }

    private static List<Signature> original() {
        List<Signature> signers = original;
        if (signers == null) {
            signers = Collections.singletonList(new Signature(Base64.decode(CERTIFICATE, Base64.DEFAULT)));
            original = signers;
        }
        return signers;
    }

    /**
     * Whether {@code info} is the identity of the app on the other end of the current Binder call,
     * that app's uid holds only Facebook, and Facebook's current signers equal this build's. Reads
     * Messenger makes for itself, or for any app other than the caller, never qualify. Everything
     * is read through PackageManager directly, so the answer above can't feed back into it. Any
     * error answers false and keeps Messenger's own refusal.
     */
    static boolean isSameKeyCaller(PackageInfo info) {
        int caller = Binder.getCallingUid();
        if (caller == Process.myUid() || info.applicationInfo == null || info.applicationInfo.uid != caller) return false;
        try {
            Context context = Settings.appContext;
            if (context == null) return outcome(ERROR);
            PackageManager packages = context.getPackageManager();
            String[] names = packages.getPackagesForUid(caller);
            if (names == null || names.length == 0) return outcome(NOT_FAMILY);
            for (String name : names) if (!FACEBOOK.equals(name)) return outcome(NOT_FAMILY);

            Set<String> ours = ownSigners;
            if (ours == null) {
                ours = currentSigners(packages, context.getPackageName());
                if (ours.isEmpty()) return outcome(ERROR);
                ownSigners = ours;
            }
            // A build that still carries Meta's key trusts Meta's Facebook as it is.
            if (!Collections.disjoint(ours, META_SIGNERS)) return outcome(META_SIGNED_BUILD);
            if (!ours.equals(currentSigners(packages, FACEBOOK))) return outcome(SIGNER_DIFFERS);
            return outcome(TRUSTED);
        } catch (Throwable error) {
            android.util.Log.e("HushMessenger", "Can't check the calling Facebook's signer", error);
            return outcome(ERROR);
        }
    }

    /** Counts the outcome, and logs it the first time it happens in this process. */
    private static boolean outcome(int which) {
        if (callerCounts.incrementAndGet(which) == 1) {
            android.util.Log.i("HushMessenger", "Facebook caller check: " + CALLER_OUTCOMES[which]);
        }
        return which == TRUSTED;
    }

    /** SHA-256 of each current signer, without the rotation history. Empty when there's none. */
    static Set<String> currentSigners(PackageManager packages, String packageName) throws Exception {
        SigningInfo signing = packages.getPackageInfo(packageName, PackageManager.GET_SIGNING_CERTIFICATES).signingInfo;
        Signature[] current = signing == null ? null : signing.getApkContentsSigners();
        Set<String> hashes = new HashSet<>();
        if (current == null) return hashes;
        MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
        for (Signature signature : current) {
            if (signature == null) continue;
            StringBuilder hex = new StringBuilder();
            for (byte b : sha256.digest(signature.toByteArray())) hex.append(String.format("%02x", b));
            hashes.add(hex.toString());
        }
        return hashes;
    }

    /** One line for Copy setup, such as "trusted=2, signer_differs=0, ...". */
    static String callerSummary() {
        StringBuilder line = new StringBuilder();
        for (int i = 0; i < CALLER_OUTCOMES.length; i++) {
            if (i > 0) line.append(", ");
            line.append(CALLER_OUTCOMES[i]).append('=').append(callerCounts.get(i));
        }
        return line.toString();
    }
}
