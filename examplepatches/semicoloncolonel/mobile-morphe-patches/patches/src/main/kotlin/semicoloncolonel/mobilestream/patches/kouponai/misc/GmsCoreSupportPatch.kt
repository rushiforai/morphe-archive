package semicoloncolonel.mobilestream.patches.kouponai.misc

import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch

// Koupon 3.1.6 signs in with Google through the legacy Google Sign-In API
// (react-native-google-signin). A re-signed copy fails at once with "Google
// Sign-In Failed", before an account is picked. GmsCore presents the original
// package name and key instead. Email sign-in does not use Google, so this is
// off by default.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "Koupon",
    packageName = "com.kouponai",
    clonePackageName = "app.mobilestream.kouponai",
    // SHA-1 of the Play app signing certificate.
    signature = "db0dacd9f5f49c3259f0b64848ecbdb992c54c02",
    launcherActivity = "Lcom/kouponai/MainActivity;",
)
