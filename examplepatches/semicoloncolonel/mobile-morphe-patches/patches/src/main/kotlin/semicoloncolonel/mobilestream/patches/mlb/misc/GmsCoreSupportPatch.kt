package semicoloncolonel.mobilestream.patches.mlb.misc

import semicoloncolonel.mobilestream.patches.mlb.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch

// MLB 26.21.0.49 signs in with Google through Google Sign-In.
// A re-signed copy cannot sign in with Google directly: Google answers only
// the app signed with its Play signing key. GmsCore presents the original
// package name and key instead. See GmsCoreSupportBuilder for the details.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "MLB",
    packageName = "com.bamnetworks.mobile.android.gameday.atbat",
    clonePackageName = "app.mobilestream.mlb",
    // SHA-1 of the Play app signing certificate.
    signature = "e358395b20c02f1efc9400fd896c1e3c30170852",
    launcherActivity = "Lmlb/atbat/activity/SplashScreenActivity;",
)
