package semicoloncolonel.mobilestream.patches.slickdeals.misc

import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch
import semicoloncolonel.mobilestream.patches.slickdeals.shared.Constants

// Slickdeals 6.36.0 signs in with Google through Credential Manager
// (GetGoogleIdOption). A re-signed copy cannot sign in with Google directly:
// Google answers only the app signed with its Play signing key, and the
// re-signed copy reports "User cancelled" after an account is picked (issue
// 81). GmsCore presents the original package name and key instead. Password
// and email-code sign-in do not use Google, so this is off by default. See
// GmsCoreSupportBuilder for the details.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "Slickdeals",
    packageName = "net.slickdeals.android",
    clonePackageName = "app.mobilestream.slickdeals",
    // SHA-1 of the Play app signing certificate.
    signature = "7c85324a56253080343b9a2a8bf00372f56d0ccd",
    launcherActivity = "Lnet/slickdeals/android/MainActivity;",
)
