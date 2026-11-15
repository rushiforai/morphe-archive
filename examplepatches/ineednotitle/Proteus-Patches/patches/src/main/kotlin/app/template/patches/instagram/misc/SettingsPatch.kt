/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.patches.instagram.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.getReference
import app.template.patches.shared.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/extension/InstagramActionButtons;"

private const val USER_SESSION_CLASS = "Lcom/instagram/common/session/UserSession;"
private const val MAIN_FEED_ACTION_BAR =
    "Linstagram/features/feed/mainfeed/actionbar/MainFeedActionBar;"

private object BindMainFeedActionBarFingerprint : Fingerprint(
    strings = listOf("BindMainFeedActionBar"),
    returnType = "Ljava/lang/Object;",
)

@Suppress("unused")
val instagramSettingsPatch = bytecodePatch(
    name = "Proteus settings",
    description = "Adds settings and Ghost Mode buttons to the Instagram feed action bar. " +
        "The dialog controls the runtime options of the other Instagram patches.",
    default = false,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val binding = BindMainFeedActionBarFingerprint.method
        val candidates = mutableListOf(binding)

        // Newer builds move the layout update into a method on the action bar
        // itself. Include those methods so the container search also works
        // when the binding only delegates.
        val calls = binding.instructions.mapNotNull {
            it.getReference<MethodReference>()?.takeIf { reference ->
                reference.definingClass == MAIN_FEED_ACTION_BAR &&
                    reference.returnType == "V" &&
                    USER_SESSION_CLASS in reference.parameterTypes
            }
        }.distinctBy { it.toString() }

        if (calls.isNotEmpty()) {
            val actionBarClass = mutableClassDefByOrNull(MAIN_FEED_ACTION_BAR)
            if (actionBarClass != null) {
                for (call in calls) {
                    candidates += actionBarClass.methods.filter { method ->
                        method.name == call.name &&
                            method.parameterTypes == call.parameterTypes &&
                            method.returnType == call.returnType
                    }
                }
            }
        }

        val containers = candidates.flatMap { method ->
            val code = method.instructions.toList()
            (0 until code.size - 2).mapNotNull { index ->
                val read = code[index]
                val field = read.getReference<FieldReference>()
                val visibility = code[index + 2].getReference<MethodReference>()
                if (read.opcode == Opcode.IGET_OBJECT &&
                    field?.definingClass == MAIN_FEED_ACTION_BAR &&
                    field.type == "Landroid/widget/LinearLayout;" &&
                    code[index + 1].opcode == Opcode.IF_EQZ &&
                    visibility?.name == "setVisibility" &&
                    visibility.parameterTypes == listOf("I") &&
                    visibility.returnType == "V" &&
                    code[index + 2].registersUsed.firstOrNull() ==
                    read.registersUsed.firstOrNull()
                ) {
                    method to index
                } else {
                    null
                }
            }
        }

        val (method, index) = containers.singleOrNull()
            ?: throw PatchException("Expected one main feed action button container")

        val layoutRegister = method.getInstruction(index).registersUsed.first()
        method.addInstruction(
            index + 1,
            "invoke-static/range {v$layoutRegister .. v$layoutRegister}, " +
                "$EXTENSION_CLASS_DESCRIPTOR->mainFeedActionBarButton(Landroid/view/ViewGroup;)V",
        )
    }
}
