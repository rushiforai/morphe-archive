/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Simplified: piko splits this into interceptUriPatch plus a settings-only DisableAnalytics
 * patch, and its Links.interceptUri multiplexes a dozen features behind preferences. Here the
 * injection and the analytics rules are one always-on patch.
 */

package app.ahmedyarub.patches.instagram.links

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Every request the app makes passes through here, and the class name is not obfuscated.
 */
internal object TigonServiceLayerStartRequestFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/api/tigon/TigonServiceLayer;",
    name = "startRequest",
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Blocks analytics requests sent to Instagram and Facebook servers.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(instagramExtensionPatch)

    execute {
        TigonServiceLayerStartRequestFingerprint.method.apply {
            // The register handed to interceptUri must provably hold a URI. piko takes the
            // last iget-object before the first if-eqz, but this method reads the proxy host
            // and port fields before it ever touches the request URI, so that selects a
            // String or a Number and the class then fails verification as it loads. The read
            // of the URI typed field is used instead.
            val uriIndex = instructions.withIndex().firstOrNull { (_, instruction) ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type ==
                    "Ljava/net/URI;"
            }?.index ?: throw PatchException("No URI field read in startRequest")

            val uriRegister = instructions[uriIndex].registersUsed[0]

            addInstructions(
                uriIndex + 1,
                "invoke-static/range { v$uriRegister .. v$uriRegister }, " +
                    "$LINKS_CLASS->interceptUri(Ljava/net/URI;)V",
            )
        }
    }
}
