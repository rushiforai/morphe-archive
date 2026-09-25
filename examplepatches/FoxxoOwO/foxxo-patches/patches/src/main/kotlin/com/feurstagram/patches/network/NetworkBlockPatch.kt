package com.feurstagram.patches.network

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION

private const val BLOCK_CLASS = "Lcom/feurstagram/extension/Block;"

// TigonServiceLayer is Instagram's network layer; the class name and the
// startRequest method are not obfuscated and stable across releases, so they
// anchor the patch without version-specific names.
internal object TigonStartRequestFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/api/tigon/TigonServiceLayer;",
    name = "startRequest",
)

@Suppress("unused")
val networkBlockPatch = bytecodePatch(
    name = "Network content blocking",
    description = "Blocks the feed, stories, explore, reels, ads, suggestions and tracking " +
        "at the network layer, gated on the runtime toggles.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith(EXTENSION)

    execute {
        TigonStartRequestFingerprint.method.apply {
            // The request URI is loaded into a register via an `iget-object` of
            // type java.net.URI inside the request-sending try block. Inject our
            // check right after it so the thrown IOException is caught as a
            // normal network failure and the blocked surface stays empty.
            val uriLoad = instructions.first {
                it.opcode == Opcode.IGET_OBJECT &&
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.type == "Ljava/net/URI;"
            }
            val uriRegister = (uriLoad as OneRegisterInstruction).registerA

            addInstructions(
                uriLoad.location.index + 1,
                "invoke-static/range { v$uriRegister .. v$uriRegister }, " +
                    "$BLOCK_CLASS->throwIfBlocked(Ljava/net/URI;)V",
            )
        }
    }
}
