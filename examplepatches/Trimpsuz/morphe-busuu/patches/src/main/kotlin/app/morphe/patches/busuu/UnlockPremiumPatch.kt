package app.morphe.patches.busuu

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.busuu.Constants.COMPATIBILTIY

@Suppress("unused")
val spoofPremiumStatus = bytecodePatch(
    name = "Spoof premium status",
    description = "Spoofs premium status",
) {
    compatibleWith(COMPATIBILTIY)

    execute {
        IsPremiumAccountFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}

@Suppress("unused")
val spoofPremiumPlus = bytecodePatch(
    name = "Spoof premium plus status",
    description = "Spoofs premium plus status",
) {
    compatibleWith(COMPATIBILTIY)

    execute {
        val targetClass = FeatureAccessClassFingerprint.originalClassDef
        val method = GetAccessFingerprint.match(targetClass).method

        method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        PremiumPlusFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        LessonsUnlockedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}