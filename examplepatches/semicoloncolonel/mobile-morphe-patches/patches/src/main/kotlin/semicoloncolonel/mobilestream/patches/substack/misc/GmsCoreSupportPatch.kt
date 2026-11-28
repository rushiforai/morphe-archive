package semicoloncolonel.mobilestream.patches.substack.misc

import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch
import semicoloncolonel.mobilestream.patches.substack.shared.Constants

// Substack 3.14.0 signs in with Google through Credential Manager and Google
// Sign-In (SignInHubActivity). A re-signed copy cannot sign in with Google
// directly: Google answers only the app signed with its Play signing key.
// GmsCore presents the original package name and key instead. Email sign-in
// does not use Google, so this is off by default. See GmsCoreSupportBuilder
// for the details.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "Substack",
    packageName = "com.substack.app",
    clonePackageName = "app.mobilestream.substack",
    // SHA-1 of the Play app signing certificate.
    signature = "fc92129e4e7e7835f11405720d80ee7b350005cd",
    launcherActivity = "Lcom/substack/app/ui/AppActivity;",
)
