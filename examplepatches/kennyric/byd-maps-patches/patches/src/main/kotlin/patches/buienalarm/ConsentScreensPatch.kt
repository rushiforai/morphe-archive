package patches.buienalarm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Skips the cookie onboarding and automatic ad/Premium choice screens after disabling tracking. Does not accept or reject consent; manual Privacy settings remain available.",
) {
    compatibleWith(buienalarm)
    dependsOn(originalInput, disableTracking)
    execute {
        val cookies = Fingerprint(
            definingClass = "Lorg/yoki/android/buienalarm/activity/FirstRunActivity;",
            returnType = "V", parameters = emptyList(),
            filters = listOf(methodCall(name = "setCurrentItem", parameters = listOf("I"), returnType = "V")),
        ).method
        val cookieSteps = cookies.instructions.withIndex().filter {
            it.value.opcode == Opcode.CONST_4 && (it.value as NarrowLiteralInstruction).narrowLiteral == 5
        }
        check(cookieSteps.size == 1) { "Expected one cookie onboarding transition" }
        val index = cookieSteps.single().index
        val register = cookies.getInstruction<OneRegisterInstruction>(index).registerA
        cookies.replaceInstruction(index, "const/4 v$register, 0x6")

        // The app's false path publishes ConsentNotRequired and completes the
        // existing callback flow. Removing only a Didomi call could hang it.
        val collection = Fingerprint(returnType = "Z", parameters = listOf("L"),
            strings = listOf("Didomi not ready yet; skipping shouldConsentBeCollected check"))
        val gate = Fingerprint(definingClass = collection.originalClassDef.type,
            returnType = "Z", parameters = emptyList()).method
        var callers = 0
        classDefForEach { cls ->
            cls.methods.forEach { method ->
                callers += method.implementation?.instructions?.count { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == gate.definingClass && ref.name == gate.name &&
                        ref.parameterTypes.isEmpty() && ref.returnType == "Z"
                } ?: 0
            }
        }
        check(callers == 2) { "Expected the two known automatic consent callers, found $callers" }
        Fingerprint(returnType = "Ljava/lang/Object;", parameters = emptyList(),
            strings = listOf("Trying to show consent", "Consent not required")).method
        // This separate manual preferences listener must still exist unchanged.
        Fingerprint(definingClass = "Lw77;", returnType = "Z",
            parameters = listOf("Landroidx/preference/Preference;"),
            filters = listOf(methodCall(definingClass = "Lio/didomi/sdk/Didomi;", name = "showPreferences\$default"))).method
        gate.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
