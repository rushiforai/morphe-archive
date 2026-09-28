package com.latanvillegas.lawnchair.patches.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Finds ColorOptionsKt.<clinit>() structurally across R8-renamed Lawnchair Nightlies. */
private object ColorOptionsClinitFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    custom = custom@ { method, classDef ->
        val listFields = classDef.staticFields.count { it.type == "Ljava/util/List;" }
        val instructions = method.implementation?.instructions?.toList() ?: return@custom false
        val allocations = instructions.count { it.opcode == Opcode.NEW_INSTANCE }
        listFields == 3 && allocations >= 12 && instructions.any { it.opcode == Opcode.NEW_ARRAY }
    },
)

@Suppress("unused")
val pureColorOptionsUiPatch = bytecodePatch(
    name = "Pure black and white color options",
    description = "Shows pure black and pure white as selectable Lawnchair color options.",
) {
    compatibleWith(
        Compatibility(
            name = "Lawnchair Nightly",
            packageName = "app.lawnchair.nightly",
            appIconColor = 0x8BC34A,
        ),
    )

    execute {
        val method = ColorOptionsClinitFingerprint.method
        val instructions = method.instructions

        // In ColorOptions.<clinit>, the first NEW_INSTANCE is CustomColor. This remains
        // stable even when R8 renames the class itself.
        val customColorType = instructions.firstNotNullOfOrNull { instruction ->
            if (instruction.opcode != Opcode.NEW_INSTANCE) return@firstNotNullOfOrNull null
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
        } ?: throw PatchException("Lawnchair pure colors UI: CustomColor type was not found.")

        // Verified against Nightly #5155 and #5171: ColorOptions has a FILLED_NEW_ARRAY
        // for the preset CustomColor list, then the first real NEW_ARRAY is the dynamic
        // ColorOption array [SystemAccent, WallpaperPrimary]. Avoid heuristics based on
        // a fixed instruction window; R8 changes the surrounding scheduling frequently.
        val arrayIndex = instructions.indexOfFirst { it.opcode == Opcode.NEW_ARRAY }
        if (arrayIndex <= 0) {
            throw PatchException("Lawnchair pure colors UI: dynamic color array was not found.")
        }

        val newArray = instructions[arrayIndex] as? TwoRegisterInstruction
            ?: throw PatchException("Lawnchair pure colors UI: unexpected new-array instruction.")
        val arrayRegister = newArray.registerA
        val sizeRegister = newArray.registerB

        // In the actual #5171 DEX this is exactly:
        //   const/4 v0, 0x2
        //   new-array v1, v0, [Lfe0;
        // Require the preceding instruction to write the NEW_ARRAY size register.
        val sizeInstruction = instructions[arrayIndex - 1]
        val sizeIndex = if ((sizeInstruction as? OneRegisterInstruction)?.registerA == sizeRegister) {
            arrayIndex - 1
        } else {
            throw PatchException("Lawnchair pure colors UI: array size initializer register did not match.")
        }

        method.replaceInstruction(sizeIndex, "const/4 v$sizeRegister, 0x4")

        // Only consider APUT_OBJECT instructions belonging to this array. This avoids
        // accidentally selecting entries from a later two-element array in the clinit.
        val aputs = instructions.indices.drop(arrayIndex + 1)
            .filter { index ->
                val instruction = instructions[index]
                instruction.opcode == Opcode.APUT_OBJECT &&
                    (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction)?.registerB == arrayRegister
            }
            .take(2)
            .toList()

        if (aputs.size != 2) {
            throw PatchException("Lawnchair pure colors UI: stock dynamic entries were not found.")
        }
        val secondAput = aputs.last()

        val scratchObject = if (arrayRegister == 5 || sizeRegister == 5) 6 else 5
        val scratchValue = if (scratchObject == 6 || arrayRegister == 6 || sizeRegister == 6) 7 else 6

        method.addInstructions(
            secondAput + 1,
            """
                new-instance v$scratchObject, $customColorType
                const v$scratchValue, -0x1000000
                invoke-direct {v$scratchObject, v$scratchValue}, $customColorType-><init>(I)V
                const/4 v$scratchValue, 0x2
                aput-object v$scratchObject, v$arrayRegister, v$scratchValue

                new-instance v$scratchObject, $customColorType
                const/4 v$scratchValue, -0x1
                invoke-direct {v$scratchObject, v$scratchValue}, $customColorType-><init>(I)V
                const/4 v$scratchValue, 0x3
                aput-object v$scratchObject, v$arrayRegister, v$scratchValue

                const/4 v$sizeRegister, 0x2
            """,
        )
    }
}
