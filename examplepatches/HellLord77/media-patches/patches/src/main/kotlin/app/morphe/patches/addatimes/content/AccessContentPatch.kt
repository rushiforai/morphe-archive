package app.morphe.patches.addatimes.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.morphe.okhttp3.OkHttpClient
import app.morphe.util.matchSingle
import app.morphe.util.p0Register
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/addatimes/interceptors/PlayVideoInterceptor;"

fun accessContentPatch(
    name: String,
    compatibility: Compatibility,
    sharedExtensionPatch: BytecodePatch,
) = bytecodePatch(
    name = name,
    description = "Enables access to content.",
    default = true,
) {
    compatibleWith(compatibility)

    dependsOn(sharedExtensionPatch)

    execute {
        OkHttpClient.Builder.BuildFingerprint.matchSingle().method.apply {
            addInstructions(
                0,
                listOf(
                    BuilderInstruction21c(
                        Opcode.NEW_INSTANCE,
                        0,
                        ImmutableTypeReference(EXTENSION_CLASS),
                    ),
                    BuilderInstruction35c(
                        Opcode.INVOKE_DIRECT,
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        ImmutableMethodReference(
                            EXTENSION_CLASS,
                            "<init>",
                            emptyList(),
                            Type.void,
                        ),
                    ),
                    BuilderInstruction35c(
                        Opcode.INVOKE_VIRTUAL,
                        2,
                        p0Register,
                        0,
                        0,
                        0,
                        0,
                        OkHttpClient.Builder.AddInterceptorFingerprint
                            .matchSingle()
                            .originalMethod,
                    ),
                ),
            )
        }
    }
}
