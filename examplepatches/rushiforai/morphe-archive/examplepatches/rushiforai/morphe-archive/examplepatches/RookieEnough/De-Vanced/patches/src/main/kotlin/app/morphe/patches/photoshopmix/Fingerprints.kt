/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photoshopmix/Fingerprints.kt
 */
package app.morphe.patches.photoshopmix

import app.morphe.patcher.Fingerprint

internal object IsLoggedInMethodFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        method.name == "isLoggedIn" && classDef.endsWith("/CreativeCloudSource;")
    },
)

internal object CcLibButtonClickHandlerMethodFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "ccLibButtonClickHandler" && classDef.endsWith("/PSMixFragment;")
    },
)

internal object LightroomButtonClickHandlerMethodFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "lightroomButtonClickHandler" && classDef.endsWith("/PSMixFragment;")
    },
)

internal object CcButtonClickHandlerMethodFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "ccButtonClickHandler" && classDef.endsWith("/PSMixFragment;")
    },
)

