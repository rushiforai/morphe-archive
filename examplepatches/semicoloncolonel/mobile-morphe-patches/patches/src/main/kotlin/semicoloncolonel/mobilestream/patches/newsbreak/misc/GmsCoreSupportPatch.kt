package semicoloncolonel.mobilestream.patches.newsbreak.misc

import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch

// NewsBreak 26.44.1 signs in with Google through Google Sign-In.
// A re-signed copy cannot sign in with Google directly: Google answers only
// the app signed with its Play signing key. GmsCore presents the original
// package name and key instead. See GmsCoreSupportBuilder for the details.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "NewsBreak",
    packageName = "com.particlenews.newsbreak",
    clonePackageName = "app.mobilestream.newsbreak",
    // SHA-1 of the Play app signing certificate.
    signature = "95c3e2c648fc744a83fb915521787887af732f49",
    launcherActivity = "Lcom/particlemedia/feature/guide/RootActivity;",
    category = "Setup",
)
