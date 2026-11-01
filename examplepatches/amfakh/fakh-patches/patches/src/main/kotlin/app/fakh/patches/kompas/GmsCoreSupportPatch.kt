package app.fakh.patches.kompas

import app.fakh.patches.kompas.shared.Constants.COMPATIBILITY_KOMPAS
import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.morphe.patcher.patch.bytecodePatch

private const val KOMPAS_PACKAGE = "com.ertanto.kompas.official"

/** SHA-1 of KOMPAS.com's Play App Signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val KOMPAS_SIGNATURE = "1f88d9fb04dd756302cc1804f335676079f9100f"

/**
 * "Login dengan Google" runs the legacy Google Sign-In (`GoogleSignIn.getClient` with `requestIdToken`). Google only
 * issues that ID token to the signing certificate registered for the app, so a patched app gets DEVELOPER_ERROR (10)
 * from Play services. GmsCore presents the original certificate instead.
 */
@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Makes \"Login dengan Google\" work by signing in through microG RE (GmsCore) instead of Google " +
        "Play services. Needs microG RE installed and signed in to a Google account.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_KOMPAS)
    category("Feature")
    dependsOn(gmsCoreSupportResourcePatch(KOMPAS_PACKAGE, KOMPAS_SIGNATURE))

    execute {
        redirectToGmsCore()
    }
}
