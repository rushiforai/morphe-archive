/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */

package psylos.morphe.patches.soundcloud.cast

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import hoodles.morphe.patches.soundcloud.shared.Constants
import psylos.morphe.patches.soundcloud.shared.HideCastPatchStatusFingerprint
import psylos.morphe.patches.soundcloud.shared.PRIVATE_EXTENSION
import psylos.morphe.patches.soundcloud.shared.soundcloudPrivateSettingsPatch

private const val HOOK = "${PRIVATE_EXTENSION}CastIconHook;"

@Suppress("unused")
val hideCastIconPatch = bytecodePatch(
    name = "Hide Cast icon",
    description = "Adds a setting that hides SoundCloud's Cast icon in menu and view variants.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(soundcloudPrivateSettingsPatch)

    execute {
        // Makes the matching control visible in the shared settings dialog.
        HideCastPatchStatusFingerprint.method.returnEarly(true)

        CastMenuInstallerFingerprint.method.apply {
            val optionalIndex = indexOfFirstInstructionOrThrow {
                val reference =
                    (this as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Lcom/soundcloud/java/optional/Optional;" &&
                    reference.name == "g"
            }
            addInstructions(
                optionalIndex,
                """
                    invoke-static {}, $HOOK->shouldShowCast()Z
                    move-result p2
                    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;
                """.trimIndent(),
            )
        }

        CastViewInstallerFingerprint.method.apply {
            val dialogFactoryIndex = indexOfFirstInstructionOrThrow {
                val reference =
                    (this as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroidx/mediarouter/app/MediaRouteButton;" &&
                    reference.name == "setDialogFactory"
            }
            addInstructions(
                dialogFactoryIndex + 1,
                "invoke-static {p1}, $HOOK->applyCastButtonVisibility(Landroid/view/View;)V",
            )
        }
    }
}
