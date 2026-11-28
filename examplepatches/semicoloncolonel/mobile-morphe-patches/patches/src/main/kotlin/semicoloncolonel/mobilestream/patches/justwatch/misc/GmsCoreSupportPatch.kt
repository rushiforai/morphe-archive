package semicoloncolonel.mobilestream.patches.justwatch.misc

import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch

// JustWatch 26.44.2 (phone) and 26.43.8 (Android TV) sign in with Google
// through the older Sign in with Google flow (SignInHubActivity). Both builds
// share the launcher activity and the Play signing key. A re-signed copy
// cannot sign in with Google directly: Google answers only the app signed
// with JustWatch's Play signing key, and the account sheet closes without
// signing in. GmsCore presents the original package name and key instead.
// See GmsCoreSupportBuilder for the details.

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "JustWatch",
    packageName = "com.justwatch.justwatch",
    clonePackageName = "app.mobilestream.justwatch",
    // SHA-1 of the Play app signing certificate.
    signature = "cfd09a2ca218cc6546c9f5b1f48b9b255623feeb",
    launcherActivity = "Lcom/justwatch/justwatch/MainActivity;",
)
