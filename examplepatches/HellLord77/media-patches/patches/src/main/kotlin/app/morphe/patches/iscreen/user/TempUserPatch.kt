package app.morphe.patches.iscreen.user

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreen.extension.sharedExtensionPatch
import app.morphe.patches.iscreen.shared.Constants.COMPATIBILITY_ISCREEN
import app.morphe.patches.iscreen.shared.morphe.com.rockstreamer.iscreen.util.PreferenceUtil
import app.morphe.util.getReference
import app.morphe.util.matchAllMethodIndicesForEach
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/iscreen/patches/TempUserPatch;"

@Suppress("unused")
val tempUserPatch =
    bytecodePatch(
        name = "Temp user",
        description = "Log in as subscribed temp user.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_ISCREEN)

        dependsOn(sharedExtensionPatch)

        execute {
            PreferenceUtil.IsSubscribedFingerprint
                .matchSingle()
                .method
                .returnEarly(true)
            PreferenceUtil.IsTVodSubscribedFingerprint
                .matchSingle()
                .method
                .returnEarly(true)
            PreferenceUtil.IsLoginFingerprint
                .matchSingle()
                .method
                .returnEarly(true)

            GetRefreshTokenMethodCallFingerprint.matchAllMethodIndicesForEach {
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
