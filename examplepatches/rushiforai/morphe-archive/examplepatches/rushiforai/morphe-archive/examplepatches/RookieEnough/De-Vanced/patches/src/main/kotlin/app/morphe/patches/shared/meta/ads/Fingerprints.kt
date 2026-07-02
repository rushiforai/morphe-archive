/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/shared/meta/ads/Fingerprints.kt
 */
package app.morphe.patches.shared.meta.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Upstream (ReVanced) fingerprint: SponsoredContentController.insertItem
 *
 * Threads Hide Ads / Twitch ad patches rely on this shared method that returns Z.
 */
internal object AdInjectorMethodFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Z",
    parameters = listOf("L", "L"),
    custom = { method, classDef ->
        method.name == "insertItem" && classDef.type.endsWith("/SponsoredContentController;")
    },
)

