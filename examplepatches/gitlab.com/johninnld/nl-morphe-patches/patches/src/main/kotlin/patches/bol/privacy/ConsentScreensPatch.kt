package patches.bol.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.bol.shared.Constants.COMPATIBILITY_BOL
import patches.bol.shared.ModelValue
import patches.bol.shared.clearModelFields
import patches.bol.tracking.disableTrackingPatch

@Suppress("unused")
val hideConsentScreensPatch = bytecodePatch(
    name = "Hide consent screens",
    description = "Skips data usage, data sharing and notification opt-in onboarding. Local tracking choices stay declined and tracking is disabled. Manual notification settings and server account preferences remain unchanged.",
) {
    compatibleWith(COMPATIBILITY_BOL)
    dependsOn(disableTrackingPatch)
    execute {
        // The domain model gates onboarding AND later renewed-consent routes; a UI-only hide leaves a blocked flow.
        clearModelFields("ConsentDataInfo(version=", mapOf(
            "b" to ModelValue.False,
        ))
        val converter = Fingerprint(
            definingClass = "Lcom/bol/shop/privacy/data/remote/ConsentChoiceResponse;",
            name = "toConsentChoice", parameters = emptyList(),
        ).matchSingle().method
        val choices = Fingerprint(
            name = "<clinit>", strings = listOf("UNKNOWN", "ACCEPTED", "DECLINED"),
            custom = { method, _ -> method.definingClass == converter.returnType },
        ).matchSingle().method
        val code = choices.instructions.toList()
        val declinedIndex = code.indexOfFirst { it.getReference<StringReference>()?.string == "DECLINED" }
        val declined = code.drop(declinedIndex).first { it.opcode == Opcode.SPUT_OBJECT }
            .getReference<FieldReference>()!!
        converter.addInstructions(0, "sget-object v0, ${declined.definingClass}->${declined.name}:${declined.type}\nreturn-object v0")

        val steps = Fingerprint(name = "<clinit>",
            strings = listOf("Language", "NotificationsPermission", "Consent", "Login", "Notifications"))
            .matchSingle().method.instructions.toList()
        val notificationSteps = listOf("NotificationsPermission", "Notifications").map { label ->
            val index = steps.indexOfFirst { it.getReference<StringReference>()?.string == label }
            steps.drop(index).first { it.opcode == Opcode.SPUT_OBJECT }.getReference<FieldReference>()!!
        }
        Fingerprint(name = "<init>", strings = listOf("LANGUAGE_IMPLICITLY_SET")).matchSingle().method.apply {
            // Remove these steps before choosing the first item, after the app's own conditional removals.
            // The original first-item result is the scratch register: the original call overwrites it next.
            val firstIndex = instructions.indexOfFirst {
                it.getReference<MethodReference>()?.let { reference ->
                    reference.definingClass == "Lkotlin/collections/CollectionsKt;" &&
                        reference.name == "Q" && reference.parameterTypes == listOf("Ljava/util/List;")
                } == true
            }
            require(firstIndex >= 0) { "Missing onboarding first-step selection" }
            val list = getInstruction<FiveRegisterInstruction>(firstIndex).registerC
            val scratch = getInstruction<OneRegisterInstruction>(firstIndex + 1).registerA
            require(list != scratch && list < 16 && scratch < 16)
            addInstructionsAtControlFlowLabel(firstIndex, notificationSteps.joinToString("\n") { step ->
                "sget-object v$scratch, ${step.definingClass}->${step.name}:${step.type}\n" +
                    "invoke-virtual {v$list, v$scratch}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z"
            })
        }
    }
}
