package semicoloncolonel.mobilestream.patches.yahoonews.misc

import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants

// Yahoo News signs in with Yahoo's own OAuth, so it works without GmsCore.
// Push notifications and Firebase use Google Play services, so this moves
// them to GmsCore for phones without Play services. Off by default. See
// GmsCoreSupportBuilder for the details.
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "Yahoo News",
    packageName = "com.yahoo.mobile.client.android.yahoo",
    clonePackageName = "app.mobilestream.yahoonews",
    // SHA-1 of the Play app signing certificate.
    signature = "bef32362c09f50807e025fad8e1f78a8c34a3805",
    launcherActivity = "Lcom/yahoo/mobile/client/android/yahoo/MainActivity;",
    category = "Setup",
)
