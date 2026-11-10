package app.morphe.patches.addatimes.user

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/addatimes/patches/AnonymousUserPatch;"

fun anonymousUserPatch(
    patchName: String,
    compatibility: Compatibility,
    sharedExtensionPatch: BytecodePatch,
    onCreateFingerprint: Fingerprint,
) = bytecodePatch(
    name = patchName,
    description = "Log in as anonymous user.",
    default = true,
) {
    compatibleWith(compatibility)

    dependsOn(sharedExtensionPatch)

    execute {
        onCreateFingerprint.matchSingle().method.apply {
            addInstruction(
                0,
                BuilderInstruction35c(
                    Opcode.INVOKE_STATIC,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference(EXTENSION_CLASS, name, parameters, returnType),
                ),
            )
        }
    }
}
