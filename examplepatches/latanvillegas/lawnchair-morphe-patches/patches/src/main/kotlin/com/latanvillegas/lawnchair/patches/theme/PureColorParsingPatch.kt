package com.latanvillegas.lawnchair.patches.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Finds ColorOption.Companion.fromString() without relying on R8 class/method names.
 * The stock method contains all three stable serialized option names.
 */
private object ColorOptionFromStringFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("system_accent", "wallpaper_primary", "default", "custom"),
)

@Suppress("unused")
val pureColorParsingPatch = bytecodePatch(
    name = "Pure black and white color parsing",
    description = "Adds persistent pure_black and pure_white color values to Lawnchair's color option parser.",
) {
    compatibleWith(
        Compatibility(
            name = "Lawnchair Nightly",
            packageName = "app.lawnchair.nightly",
            appIconColor = 0x8BC34A,
        ),
    )

    execute {
        val method = ColorOptionFromStringFingerprint.method

        // R8 renames CustomColor on every build. Discover its type from the stock
        // fromString() implementation instead of hard-coding APK #5155's Lbe0;.
        val customColorType = method.instructions
            .firstNotNullOfOrNull { instruction ->
                if (instruction.opcode != Opcode.NEW_INSTANCE) return@firstNotNullOfOrNull null
                ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
            }
            ?: throw PatchException("Lawnchair pure colors: CustomColor allocation was not found.")

        // fromString() already has two local registers in the supported Lawnchair builds.
        // Return existing CustomColor objects so no new DEX classes are required.
        method.addInstructionsWithLabels(
            0,
            """
                const-string v0, "pure_black"
                invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :check_pure_white
                new-instance v0, $customColorType
                const v1, -0x1000000
                invoke-direct {v0, v1}, $customColorType-><init>(I)V
                return-object v0

                :check_pure_white
                const-string v0, "pure_white"
                invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                new-instance v0, $customColorType
                const/4 v1, -0x1
                invoke-direct {v0, v1}, $customColorType-><init>(I)V
                return-object v0
            """,
            ExternalLabel("original", method.getInstruction(0)),
        )
    }
}
