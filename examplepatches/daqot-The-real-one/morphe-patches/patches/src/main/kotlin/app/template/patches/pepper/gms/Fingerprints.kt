package app.template.patches.pepper.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess

/**
 * isAvailableOnDevice() of the Credential Manager provider of the Android framework.
 *
 * The app signs in with Google through Credential Manager, which uses this provider on
 * Android 14 and newer. It hands the request to the credential service of the system,
 * which asks Google Play services directly instead of going through the Google Play services
 * library of the app, so GmsCore never gets the request. The method name is kept, as
 * Credential Manager loads its providers by reflection.
 */
internal object FrameworkCredentialProviderAvailabilityFingerprint : Fingerprint(
    name = "isAvailableOnDevice",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(definingClass = "this", type = "Landroid/credentials/CredentialManager;"),
    )
)

/**
 * Reads the credential the Google Play services provider of Credential Manager got.
 *
 * On Android 14 and newer it expects the response as GetCredentialResponse of the
 * Android framework, but MicroG-RE always answers with a bundle, the format of Android 13
 * and older, so the credential is dropped as "No provider data returned".
 */
internal object HandleGetCredentialResponseFingerprint : Fingerprint(
    definingClass = "Landroidx/credentials/playservices/controllers/ResponseUtils\$Companion;",
    name = "handleGetCredentialResponse",
    returnType = "V",
    filters = listOf(
        fieldAccess(smali = "Landroid/os/Build\$VERSION;->SDK_INT:I"),
    )
)

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pepper/apps/android/presentation/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
