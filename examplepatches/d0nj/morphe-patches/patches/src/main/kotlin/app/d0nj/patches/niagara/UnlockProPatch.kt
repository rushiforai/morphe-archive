package app.d0nj.patches.niagara

import app.d0nj.patches.shared.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Makes the entitlement holder always report Pro in Niagara Launcher. " +
        "Unlocks all Pro features and bypasses the 7-day trial prompt. " +
        "Server-backed features (account sync, Stripe checkout) are not affected.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            packageName = "bitpit.launcher",
            name = "Niagara Launcher",
            appIconColor = 0x1E88E5,
            targets = listOf(AppTarget(version = null)),
        ),
    )

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
