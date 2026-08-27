package morningentree.morphe.patches.aiolauncher.premium

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import morningentree.morphe.patches.aiolauncher.shared.Constants
import morningentree.morphe.util.getReference
import morningentree.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Premium",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val clinit = PremiumPrefsClinitFingerprint.method
        val prefsClass = PremiumPrefsClinitFingerprint.originalClassDef

        val clinitInstructions = clinit.instructions.toList()
        val premiumKeyIndex = clinitInstructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                it.getReference<StringReference>()?.string == "premium"
        }
        if (premiumKeyIndex < 0) throw PatchException("Could not locate the \"premium\" pref key")

        val premiumField = clinitInstructions.drop(premiumKeyIndex)
            .firstOrNull { it.opcode == Opcode.SPUT_OBJECT }
            ?.getReference<FieldReference>()
            ?: throw PatchException("Could not locate the premium delegate field")

        val prefsMutableClass = mutableClassDefBy(prefsClass)

        val premiumGetter = prefsMutableClass.methods.firstOrNull { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.instructionsOrNull.orEmpty().any { instruction ->
                    instruction.opcode == Opcode.SGET_OBJECT &&
                        instruction.getReference<FieldReference>()?.let { field ->
                            field.name == premiumField.name &&
                                field.definingClass == premiumField.definingClass
                        } == true
                }
        } ?: throw PatchException("Could not find the premium getter")

        premiumGetter.returnEarly(true)

        prefsMutableClass.methods.firstOrNull { method ->
            method.name != premiumGetter.name &&
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.instructionsOrNull.orEmpty().any { instruction ->
                    instruction.opcode == Opcode.INVOKE_STATIC &&
                        instruction.getReference<MethodReference>()?.let { reference ->
                            reference.name == premiumGetter.name &&
                                reference.definingClass == prefsClass.type
                        } == true
                }
        }?.returnEarly(true)
    }
}
