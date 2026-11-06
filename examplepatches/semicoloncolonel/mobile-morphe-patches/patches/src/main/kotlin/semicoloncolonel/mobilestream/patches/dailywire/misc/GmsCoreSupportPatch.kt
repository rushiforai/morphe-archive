package semicoloncolonel.mobilestream.patches.dailywire.misc

import semicoloncolonel.mobilestream.patches.dailywire.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch

// The Daily Wire 3.5.21 needs an account before it shows anything. Its
// "Sign in with Google" asks Credential Manager for a Google ID token and
// trades it with Auth0 for a Daily Wire session. A re-signed copy cannot get
// that token directly: Google answers only the app signed with its Play
// signing key. GmsCore presents the original package name and key instead.
// See GmsCoreSupportBuilder for the details.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "The Daily Wire",
    packageName = "com.dailywire.thedailywire",
    clonePackageName = "app.mobilestream.dailywire",
    // SHA-1 of the Play app signing certificate.
    signature = "49433d1a926549130f489b50a1b87074c5aae072",
    launcherActivity = "Lcom/dailywire/thedailywire/app/ui/activity/DWActivity;",
)
