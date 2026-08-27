package morningentree.morphe.patches.smartlauncher.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import morningentree.morphe.patches.smartlauncher.misc.signature.disableSignatureCheckPatch
import morningentree.morphe.patches.smartlauncher.shared.Constants
import morningentree.morphe.util.getReference

private fun FieldReference.descriptor() = "$definingClass->$name:$type"
private fun Method.descriptor() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables Pro",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableSignatureCheckPatch)

    execute {
        PurchaseItemsCtor.apply {
            val sputInstr = method.getInstruction<Instruction21c>(instructionMatches[2].index)
            val lifetimeField = sputInstr.getReference<FieldReference>()!!
            val purchasableItemType = lifetimeField.type

            var itemGetMethod: Method? = null
            var itemSetMethod: Method? = null
            classDefForEach { classDef ->
                if (classDef.type == purchasableItemType) {
                    itemGetMethod = classDef.methods.firstOrNull {
                        it.parameterTypes.isEmpty() && it.returnType == "Z"
                    }
                    itemSetMethod = classDef.methods.firstOrNull {
                        it.returnType == "V" &&
                            it.parameterTypes.map { p -> p.toString() } ==
                            listOf("Landroid/content/Context;", "Z")
                    }
                }
            }

            val getMethod = itemGetMethod
                ?: throw PatchException("Could not find PurchasableItem get()Z")
            val setMethod = itemSetMethod
                ?: throw PatchException("Could not find PurchasableItem set(Context, Z)V")

            // The PurchaseItems singleton (static field of the class' own type).
            val singletonField = originalClassDef.staticFields.first {
                it.type == originalClassDef.type
            }

            // Set the "lifetime" item to true and broadcast the access-changed intent, but only if
            // it isn't already owned.
            method.addInstructionsWithLabels(
                method.instructions.size - 1,
                """
                    sget-object v0, ${lifetimeField.descriptor()}
                    invoke-virtual {v0}, ${getMethod.descriptor()}
                    move-result v1
                    if-nez v1, :end
                    invoke-static {}, ${GetAppFingerprint.method.descriptor()}
                    move-result-object v1
                    const/4 v2, 0x1
                    invoke-virtual {v0, v1, v2}, ${setMethod.descriptor()}
                    sget-object v0, ${singletonField.descriptor()}
                    invoke-static {v0, v1, v2}, ${HasChangedIntentFingerprint.method.descriptor()}
                """.trimIndent(),
                ExternalLabel("end", method.instructions.last()),
            )
        }
    }
}
