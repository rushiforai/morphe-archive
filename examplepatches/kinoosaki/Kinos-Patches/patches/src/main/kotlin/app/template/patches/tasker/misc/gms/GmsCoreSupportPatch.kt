package app.template.patches.tasker.misc.gms

import app.template.patches.shared.Constants.COMPATIBILITY_TASKER
import app.template.patches.shared.misc.gms.GmsCoreScope
import app.template.patches.shared.misc.gms.gmsCoreSupportPatch

// Tasker's Google sign-in (legacy GoogleSignIn through SignInHubActivity) and its OAuth tokens
// (GoogleAuthUtil.getToken: userinfo.email, drive.file, drive.appfolder) go through Google Play services,
// which rejects the re-signed app. Login-only: only those move to MicroG RE, which answers as the
// original app. Location, sleep and activity recognition, Maps, Google Home/Matter and push keep
// using the real Google Play services, which must stay installed. Off by default.
//
// The scope, all library strings or kept library names (the classes holding them are R8-renamed):
// - the clients bound to these start-service actions: the GoogleAuthUtil token service
//   (auth.account.authapi.START, auth.service.START) and the sign-in services
//   (auth.api.signin.service.START, signin.service.START);
// - the classes holding the GetToken component (GoogleAuthUtil's legacy path) and the
//   GOOGLE_SIGN_IN action (the sign-in intent and SignInHubActivity);
// - the kept sign-in API classes (GoogleSignInAccount, GoogleSignInOptions, SignInHubActivity),
//   whose "com.google" account type becomes MicroG RE's;
// - the methods building the "<<default account>>" placeholder (BaseGmsClient and ClientSettings).
//   Only the sign-in clients require a signed-in account, so only they use it.
@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = "net.dinglisch.android.taskerm",
    // SHA-1 of the signing certificate (CN=Lee Wilmot) of the 6.6.20 APK.
    spoofedPackageSignature = "feadd18b23781cfd4eac71118c76fb35c1ab39c7",
    mainActivityOnCreateFingerprint = TaskerOnCreateFingerprint,
    compatibility = COMPATIBILITY_TASKER,
    default = false,
    // Plugins, intents and the content provider are tied to Tasker's package name.
    allowClone = false,
    scope = GmsCoreScope(
        serviceActions = setOf(
            "com.google.android.gms.auth.account.authapi.START",
            "com.google.android.gms.auth.service.START",
            "com.google.android.gms.auth.api.signin.service.START",
            "com.google.android.gms.signin.service.START",
        ),
        anchorStrings = setOf(
            "com.google.android.gms.auth.GetToken",
            "com.google.android.gms.auth.GOOGLE_SIGN_IN",
        ),
        classPrefixes = setOf("Lcom/google/android/gms/auth/api/signin/"),
        methodAnchorStrings = setOf("<<default account>>"),
    ),
    description = "Lets you sign in with Google through MicroG RE.",
)
