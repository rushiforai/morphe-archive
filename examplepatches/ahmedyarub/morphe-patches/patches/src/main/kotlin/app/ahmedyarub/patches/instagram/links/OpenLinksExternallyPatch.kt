/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Simplified: piko gates this on its settings UI. Here it is always on.
 */

package app.ahmedyarub.patches.instagram.links

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode

internal object InAppBrowserFunctionFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("Tracking.ARG_CLICK_SOURCE", "TrackingInfo.ARG_MODULE_NAME"),
)

@Suppress("unused")
val openLinksExternallyPatch = bytecodePatch(
    name = "Open links externally",
    description = "Opens links in the system browser instead of the in-app browser.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(instagramExtensionPatch)

    execute {
        InAppBrowserFunctionFingerprint.let {
            it.method.apply {
                val urlIndex = indexOfFirstInstructionOrThrow(
                    it.stringMatches[0].index,
                    Opcode.MOVE_OBJECT_FROM16,
                )

                val urlRegister = getInstruction(urlIndex).registersUsed[0]
                val freeRegister = findFreeRegister(urlIndex + 1)

                // Returning true tells the caller the link was handled, so the in-app browser
                // is not opened. A false result leaves the original path untouched.
                addInstructionsWithLabels(
                    urlIndex + 1,
                    """
                        invoke-static/range { v$urlRegister .. v$urlRegister }, $LINKS_CLASS->openExternally(Ljava/lang/String;)Z
                        move-result v$freeRegister
                        if-eqz v$freeRegister, :in_app
                        return v$freeRegister
                    """,
                    ExternalLabel("in_app", instructions[urlIndex + 1]),
                )
            }
        }
    }
}
