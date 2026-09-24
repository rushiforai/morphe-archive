package app.morphe.patches.bisbi

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string


// ============================================================
// FINGERPRINT (assinatura do mod)
// ============================================================

object BisbiVersionFingerprint : Fingerprint(
    filters = listOf(
        string("Bisbi 1.0.2")
    )
)


// ============================================================
// PREMIUM + MOD SIGNATURE (patch único)
// ============================================================

val testPremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Forces the Premium state source before it is recalculated " +
        "and adds the mod author signature below the Bisbi version.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Bisbi",
            packageName = "com.nouxi.bisbi",
            targets = listOf(AppTarget(version = "1.0.2"))
        )
    )

    execute {
        // --- Premium ---
        val premiumClass = mutableClassDefBy(
            classDefBy("LK5/i;")
        )

        val premiumMethod = premiumClass.methods.firstOrNull {
            it.name == "b" &&
            it.returnType == "V" &&
            it.parameterTypes.isEmpty()
        } ?: throw IllegalStateException(
            "LK5/i->b()V não encontrado"
        )

        premiumMethod.addInstructions(
            0,
            """
                const/4 v0, 0x1
                sput-boolean v0, LK5/i;->c:Z
            """
        )

        // --- Mod Signature (sempre aplicada junto) ---
        BisbiVersionFingerprint.method.replaceInstruction(
            BisbiVersionFingerprint.instructionMatches.first().index,
            """
                const-string v1, "Bisbi 1.0.2\nMod by @Wagg13"
            """
        )
    }
}
