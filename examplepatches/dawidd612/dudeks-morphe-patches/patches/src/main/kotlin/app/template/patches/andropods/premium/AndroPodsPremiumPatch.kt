package app.template.patches.andropods.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ANDROPODS_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

// Set Pro before the first preference render and after billing refreshes.
@Suppress("unused")
val androPodsPremiumPatch = bytecodePatch(
    name = "Premium",
    description = "Enables Pro features, including after a purchase status refresh.",
    default = true,
) {
    compatibleWith(ANDROPODS_COMPATIBILITY)

    execute {
        val purchaseResultMethod = AndroPodsPurchaseResultFingerprint.method
        val fragmentClass = AndroPodsPurchaseResultFingerprint.classDef

        // Resolve the premium field from the app's own successful-purchase write.
        // Never hard-code the obfuscated owner (a2/l in 1.5.28, l20 in 1.5.30).
        val premiumField = purchaseResultMethod.instructions
            .asSequence()
            .filter { it.opcode == Opcode.IPUT_BOOLEAN }
            .mapNotNull { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
            }
            .singleOrNull { field -> field.definingClass == fragmentClass.type }
            ?: throw PatchException(
                "AndroPods: could not uniquely resolve the premium boolean field in " +
                    "${fragmentClass.type}."
            )
        val premiumFieldDescriptor =
            "${premiumField.definingClass}->${premiumField.name}:${premiumField.type}"

        // Derive the constructor from the already fingerprinted purchase-handler class.
        // The old independent fingerprint matched an unrelated no-arg constructor after
        // AndroPods 1.5.30 changed its obfuscation and constructor implementation.
        val constructor = fragmentClass.methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.returnType == "V" &&
                method.parameters.isEmpty()
        } ?: throw PatchException(
            "AndroPods: no unique no-argument constructor found in ${fragmentClass.type}."
        )

        // Point 1: Set premium=true in the fragment constructor before return-void.
        constructor.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (returnIndex < 0) throw PatchException("AndroPods: constructor return-void not found.")
            addInstructions(
                returnIndex,
                """
                    const/4 v0, 0x1
                    iput-boolean v0, p0, $premiumFieldDescriptor
                """.trimIndent(),
            )
        }

        // Point 2: Keep premium=true whenever billing refreshes purchase state.
        purchaseResultMethod.addInstructions(
            0,
            """
                const/4 v0, 0x1
                iput-boolean v0, p0, $premiumFieldDescriptor
            """.trimIndent(),
        )
    }
}
