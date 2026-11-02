package app.morphe.patches.bongobdandroidtv.content

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.bongobdandroidtv.extension.sharedExtensionPatch
import app.morphe.patches.bongobdandroidtv.shared.Constants.COMPATIBILITY_BONGOANDROIDTV
import app.morphe.patches.shared.morphe.okhttp3.Request
import app.morphe.patches.shared.morphe.okhttp3.Response
import app.morphe.patches.shared.patches.dex.obfuscateExtensionClassPatch
import app.morphe.patches.shared.patches.dex.obfuscateExtensionMethodReferencePatch
import app.morphe.util.getReference
import app.morphe.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/bongo/patches/AccessContentPatch;"

@Suppress("unused")
val accessContentPatch =
    bytecodePatch(
        name = "Access content",
        description = "Enables access to content.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_BONGOANDROIDTV)

        dependsOn(
            sharedExtensionPatch,
            obfuscateExtensionClassPatch(
                Response.toString() to RequestFingerprint,
            ),
            obfuscateExtensionMethodReferencePatch(
                Request.toString() to "header" to HeaderFingerprint,
                Response.toString() to "request" to RequestFingerprint,
            ),
        )

        execute {
            GetVideoDetailsDataMethodCallFingerprint.matchAllMethodIndicesForEach {
                val instruction = getInstruction<FiveRegisterInstruction>(it)
                val reference = instruction.getReference<MethodReference>()!!

                replaceInstruction(
                    it,
                    BuilderInstruction35c(
                        Opcode.INVOKE_STATIC,
                        instruction.registerCount,
                        instruction.registerC,
                        instruction.registerD,
                        instruction.registerE,
                        instruction.registerF,
                        instruction.registerG,
                        ImmutableMethodReference(
                            EXTENSION_CLASS,
                            reference.name,
                            listOf(reference.definingClass) + reference.parameterTypes,
                            reference.returnType,
                        ),
                    ),
                )
            }
        }
    }
