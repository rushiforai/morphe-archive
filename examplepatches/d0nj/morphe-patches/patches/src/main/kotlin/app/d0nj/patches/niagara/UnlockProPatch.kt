package app.d0nj.patches.niagara

import app.d0nj.patches.niagara.Constants.COMPATIBILITY_NIAGARA
import app.d0nj.patches.shared.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro features and skips the trial prompt. Account sync " +
        "and Stripe checkout still need a real purchase.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NIAGARA)

    execute {
        val recordConstructor = AccountRecordFingerprint.method
        val tripleType = recordConstructor.parameterTypes[3] as String

        val tripleClassDef = classDefByOrNull(tripleType)
            ?: throw PatchException("Account flags class $tripleType is not present in the APK")

        val booleanFields = tripleClassDef.fields.filter { it.type == "Z" }
        val looksLikeFlagsTriple = booleanFields.size == 3 &&
            tripleClassDef.fields.count() == 3 &&
            tripleClassDef.methods.any { it.name == "equals" } &&
            tripleClassDef.methods.any {
                it.name == "<init>" && it.parameterTypes == listOf("Z", "Z", "Z")
            }
        if (!looksLikeFlagsTriple) {
            throw PatchException(
                "Class $tripleType does not look like the account flags triple: expected exactly " +
                    "three boolean fields, an equals method and a (Z,Z,Z) constructor",
            )
        }

        val tripleClass = mutableClassDefBy(tripleClassDef)
        val constructor = tripleClass.methods
            .single { it.name == "<init>" && it.parameterTypes == listOf("Z", "Z", "Z") }

        constructor.apply {
            clearBody()
            addInstructions(
                0,
                buildString {
                    append("invoke-direct {p0}, Ljava/lang/Object;-><init>()V\n")
                    append("const/4 p1, 0x1\n")
                    booleanFields.forEach { field ->
                        append("iput-boolean p1, p0, $tripleType->${field.name}:Z\n")
                    }
                    append("return-void")
                },
            )
        }
    }
}
