package app.fakh.patches.dodo

import app.fakh.patches.dodo.shared.Constants.COMPATIBILITY_DODO
import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.fakh.patches.shared.gms.warnWithoutGmsCore
import app.morphe.patcher.patch.bytecodePatch

private const val DODO_PACKAGE = "com.dundunstudio.autoplay"

/** SHA-1 of DoDo Music's Play App Signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val DODO_SIGNATURE = "7dd6724c683c33fbe5cb0d3332d4e5204a938c14"

/**
 * "Sign in with Google" runs Google One Tap (`Identity.getSignInClient().beginSignIn`) and hands the ID token to
 * Firebase Auth, whose token the app's own `firebase_login` endpoint exchanges for the account. Google only issues
 * that ID token to the signing certificate registered for the app, so a patched app gets DEVELOPER_ERROR (10) from
 * Play services. GmsCore presents the original certificate instead.
 */
@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Makes \"Sign in with Google\" work by signing in through microG RE (GmsCore) instead of Google Play " +
        "services, so your collection and playlists saved to your Google account come back. Needs microG RE " +
        "installed and signed in to a Google account.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DODO)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(gmsCoreSupportResourcePatch(DODO_PACKAGE, DODO_SIGNATURE))

    execute {
        redirectToGmsCore()
        warnWithoutGmsCore(
            "Lapp/fakh/extension/dodo/GmsCore;->require()V",
            "Lcom/google/android/gms/auth/api/identity/Identity;" to "getSignInClient",
        )
    }
}
