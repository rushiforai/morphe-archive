package semicoloncolonel.mobilestream.patches.yahoofinance.misc

import semicoloncolonel.mobilestream.patches.shared.misc.gms.gmsCoreSupportPatch
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants

// Yahoo sign-in offers Sign in with Google through Credential Manager, next to
// its own sign-in, so this is off by default. With it on, Google sign-in,
// price alert notifications, and Firebase go through GmsCore. See
// GmsCoreSupportBuilder for the details.
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    compatibility = Constants.COMPATIBILITY,
    appName = "Yahoo Finance",
    packageName = "com.yahoo.mobile.client.android.finance",
    clonePackageName = "app.mobilestream.yahoofinance",
    // SHA-1 of the Play app signing certificate.
    signature = "bef32362c09f50807e025fad8e1f78a8c34a3805",
    launcherActivity = "Lcom/yahoo/mobile/client/android/finance/main/MainActivity;",
    category = "Setup",
)
