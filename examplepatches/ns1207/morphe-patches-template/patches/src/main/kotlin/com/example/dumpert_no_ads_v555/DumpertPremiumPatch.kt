package com.example.dumpert_no_ads_v555

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x

private val dumpertCompatibility = Compatibility(
    packageName = "nl.dumpert",
    name = "Dumpert",
    targets = listOf(
        AppTarget(
            version = "5.5.5"
        )
    )
)

private val isPremiumFingerprint = Fingerprint(
    definingClass = "Lnl/livewall/dumpert/core/account/User\$LoggedIn;",
    name = "isPremium",
    returnType = "Z"
)

val dumpertPremiumPatch = bytecodePatch(
    name = "dumpert-premium",
    description = "Schakelt Premium/Ad-vrij in voor alle gebruikers."
) {
    compatibleWith(dumpertCompatibility)

    execute {
        val method = isPremiumFingerprint.method

        method.replaceInstruction(
            0,
            BuilderInstruction11n(
                Opcode.CONST_4,
                0,
                1
            )
        )

        method.replaceInstruction(
            1,
            BuilderInstruction11x(
                Opcode.RETURN,
                0
            )
        )

        println("Dumpert premium patch applied to ${method.name}")
    }
}