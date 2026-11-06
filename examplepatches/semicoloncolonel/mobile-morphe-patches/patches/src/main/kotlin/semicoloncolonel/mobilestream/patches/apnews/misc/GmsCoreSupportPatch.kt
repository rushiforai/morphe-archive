package semicoloncolonel.mobilestream.patches.apnews.misc

import semicoloncolonel.mobilestream.patches.apnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch

// AP News 6.31.2 signs in with Google through Credential Manager.
// A re-signed copy cannot sign in with Google directly: Google answers only
// the app signed with its Play signing key. GmsCore presents the original
// package name and key instead. See GmsCoreSupportBuilder for the details.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "AP News",
    packageName = "mnn.Android",
    clonePackageName = "app.mobilestream.apnews",
    // SHA-1 of the Play app signing certificate.
    signature = "6148a95e802cde3d9eca3b20339a233b0bd4837d",
    launcherActivity = "Lcom/apnews/app/activity/MainActivity;",
)
