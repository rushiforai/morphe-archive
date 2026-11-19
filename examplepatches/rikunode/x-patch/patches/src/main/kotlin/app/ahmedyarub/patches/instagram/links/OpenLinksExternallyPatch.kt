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
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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
        InAppBrowserFunctionFingerprint.method.apply {
            // The in-app browser method holds the wrapped link (l.instagram.com/?u=<url>) in a
            // String field of its own class, which it then parses and reads the "u" query from.
            // Earlier versions exposed that string via a move-object/from16 right after the
            // tracking-info string; on 448 that register is the TrackingInfo Bundle instead, so
            // openExternally was handed a Bundle and the whole method failed to verify (crashing
            // on any link tap). Anchor on the URL field read instead: the last String field of
            // this method's own class read before it queries the "u" parameter is the link.
            val browserClass = parameterTypes[1].toString()

            val queryIndex = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    instruction.getReference<MethodReference>()?.name == "getQueryParameter"
            }
            if (queryIndex < 0) throw PatchException("The in-app browser method never reads a query parameter")

            val urlReadIndex = (0 until queryIndex).lastOrNull { index ->
                val instruction = instructions.elementAt(index)
                instruction.opcode == Opcode.IGET_OBJECT &&
                    instruction.getReference<FieldReference>()?.let { field ->
                        field.type == "Ljava/lang/String;" && field.definingClass == browserClass
                    } == true
            } ?: throw PatchException("Could not find the link field read in the in-app browser method")

            val urlRegister = getInstruction<TwoRegisterInstruction>(urlReadIndex).registerA
            val freeRegister = findFreeRegister(urlReadIndex + 1)

            // openExternally returns true when it launched the system browser, in which case we
            // return true so the in-app browser is skipped; false leaves the original path intact.
            addInstructionsWithLabels(
                urlReadIndex + 1,
                """
                    invoke-static/range { v$urlRegister .. v$urlRegister }, $LINKS_CLASS->openExternally(Ljava/lang/String;)Z
                    move-result v$freeRegister
                    if-eqz v$freeRegister, :in_app
                    return v$freeRegister
                """,
                ExternalLabel("in_app", instructions.elementAt(urlReadIndex + 1)),
            )
        }
    }
}
