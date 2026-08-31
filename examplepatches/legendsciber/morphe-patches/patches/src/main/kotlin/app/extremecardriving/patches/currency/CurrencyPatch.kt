package app.extremecardriving.patches.currency

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.extremecardriving.patches.shared.Constants.COMPATIBILITY_ECD

@Suppress("unused")
val ecdAddNativeLib = rawResourcePatch(
    name = "Extreme Car Driving Add Native Lib",
    description = "Adds libcurrencyhack.so to the APK lib directory.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ECD)

    execute {
        val soFile = get("lib/arm64-v8a/libcurrencyhack.so", true)
        val bytes = SoBytes.part0() + SoBytes.part1() + SoBytes.part2() + SoBytes.part3() + SoBytes.part4() + SoBytes.part5() + SoBytes.part6() + SoBytes.part7() + SoBytes.part8() + SoBytes.part9() + SoBytes.part10() + SoBytes.part11() + SoBytes.part12()
        soFile.writeBytes(bytes)
    }
}

@Suppress("unused")
val ecdCurrencyPatch = bytecodePatch(
    name = "Extreme Car Driving Unlimited Currencies",
    description = "Sets all in-game currencies (diamonds, coins, upgrade points) to 999,999,999 via IL2CPP API.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ECD)

    execute {
        OnCreateFingerprint.method.addInstructions(0, """
            const-string v0, "currencyhack"
            invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
        """.trimIndent())
    }
}
