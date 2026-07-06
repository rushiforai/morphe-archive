/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/nothingx/misc/logk1token/ShowK1TokenPatch.kt
 */
package app.morphe.patches.nothingx.misc.logk1token

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.nothingx.misc.extension.sharedExtensionPatch

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/nothingx/patches/ShowK1TokensPatch;"

@Suppress("unused")
val showK1TokensPatch = bytecodePatch(
    name = "Show K1 token(s)",
    description = "Shows the K1 authentication token(s) in a dialog and logs it to logcat " +
        "for pairing with GadgetBridge without requiring root access.",
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(AppCompatibilities.NOTHING_X)

    execute {
        ApplicationOnCreateMethodFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->showK1Tokens(Landroid/content/Context;)V",
        )
    }
}

