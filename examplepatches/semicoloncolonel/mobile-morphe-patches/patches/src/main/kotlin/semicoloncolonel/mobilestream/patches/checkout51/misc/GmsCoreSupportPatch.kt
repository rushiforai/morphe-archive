package semicoloncolonel.mobilestream.patches.checkout51.misc

import semicoloncolonel.mobilestream.patches.checkout51.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch

// Checkout 51 9.22.10 signs in with Google through Google Sign-In
// (GoogleSignInClient). A re-signed copy cannot sign in with Google directly:
// Google answers only the app signed with its Play signing key. GmsCore
// presents the original package name and key instead. Email sign-in works
// without it. See GmsCoreSupportBuilder for the details.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "Checkout 51",
    packageName = "com.c51",
    clonePackageName = "app.mobilestream.checkout51",
    // SHA-1 of the Play app signing certificate.
    signature = "0cc8cabd00f51f7d13f8bf21f2e7a96eaf69d520",
    launcherActivity = "Lcom/c51/feature/splash/LauncherActivity;",
    category = "Setup",
)
