/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photoshopmix/Fingerprints.kt
 */
package app.morphe.patches.photoshopmix

import app.morphe.patcher.Fingerprint

internal object IsLoggedInMethodFingerprint : Fingerprint(
    definingClass = "/CreativeCloudSource;",
    name = "isLoggedIn",
    returnType = "Z",
)

internal object CcLibButtonClickHandlerMethodFingerprint : Fingerprint(
    definingClass = "/PSMixFragment;",
    name = "ccLibButtonClickHandler",
)

internal object LightroomButtonClickHandlerMethodFingerprint : Fingerprint(
    definingClass = "/PSMixFragment;",
    name = "lightroomButtonClickHandler",
)

internal object CcButtonClickHandlerMethodFingerprint : Fingerprint(
    definingClass = "/PSMixFragment;",
    name = "ccButtonClickHandler",
)

