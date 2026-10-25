package app.template.patches.truecaller.misc.gms

import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.misc.gms.gmsCoreSupportPatch
import app.template.patches.truecaller.misc.signature.spoofSignaturePatch

// Truecaller's Google login (social_login.google, through androidx.credentials' Play services
// provider) and its push messages (FCM) go through Google Play services, which rejects the
// re-signed app, so they need MicroG RE. On by default since 2026-10-18 (owner): without it
// Google sign-in, Drive backup and push don't work on a re-signed build. Until MicroG RE is
// installed, the extension shows a toast on every launch and opens its download page once. Pulls
// in "Spoof signature",
// because Firebase checks the app's certificate too.
// Phone number verification is attested server-side with Play Integrity; neither patch changes
// that, and nothing here targets Play Integrity.
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = "com.truecaller",
    // SHA-1 of the original signing certificate (CN=truecaller), read from the APKMirror 26.39.6
    // bundle's signing block.
    spoofedPackageSignature = "0ac1169ae6cead75264c725febd8e8d941f25e31",
    mainActivityOnCreateFingerprint = TruecallerInitOnCreateFingerprint,
    compatibility = COMPATIBILITY_TRUECALLER,
    default = true,
    dependencies = setOf(spoofSignaturePatch),
    // No clone (#50): the main provider's authority is exactly "com.truecaller", the dex hard-codes
    // content://com.truecaller, and the com.truecaller.account type would clash with stock.
    allowClone = false,
    // Truecaller's backup goes to the user's Google Drive through Google sign-in, so it only works
    // with this patch and MicroG RE; there is no client-side way around that.
    extraDescription = "Needed for Google Drive backup.",
)
