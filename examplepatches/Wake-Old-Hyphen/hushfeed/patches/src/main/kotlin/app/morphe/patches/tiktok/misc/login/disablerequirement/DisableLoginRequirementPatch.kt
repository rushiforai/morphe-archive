/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/misc/login/disablerequirement/DisableLoginRequirementPatch.kt
 */
package app.morphe.patches.tiktok.misc.login.disablerequirement

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val disableLoginRequirementPatch = bytecodePatch(
    name = "Disable login requirement",
    description = "Removes TikTok's mandatory login gate from supported flows.",
    default = true,
) {
    category("Settings")
    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        listOf(
            MandatoryLoginServiceFingerprint,
            MandatoryLoginService2Fingerprint,
        ).forEach { fp ->
            fp.method.returnEarly(false)
        }
    }
}

