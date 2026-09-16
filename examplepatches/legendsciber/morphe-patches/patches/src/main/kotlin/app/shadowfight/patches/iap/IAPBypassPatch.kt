package app.shadowfight.patches.iap

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2

// 1. Native lib'i APK'ye ekle
@Suppress("unused")
val sf2AddNativeLib = rawResourcePatch(
    name = "SF2 Add Hook Native Lib",
    description = "Adds libsf2hook.so to APK for runtime IL2CPP hooking.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val soFile = get("lib/arm64-v8a/libsf2hook.so", true)
        val soBytes = SoBytes.part0() + SoBytes.part1()
        soFile.writeBytes(soBytes)
    }
}

// 2. Smali enjeksiyon: libsf2hook.so'yu yukle
// invoke-super'dan SONRA enjekte et (locals 0 oldugu icin v0 kullanilamaz, p1 serbest)
@Suppress("unused")
val sf2IAPBypass = bytecodePatch(
    name = "SF2 IAP Bypass (Runtime Hook)",
    description = "Hooks IL2CPP currency getters and ProcessPurchase at runtime via native .so for unlimited in-game currency.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val targetMethod = OnCreateFingerprint.method
        val idx = OnCreateFingerprint.instructionMatches[0].index + 1

        targetMethod.addInstructions(idx, """
            const-string p1, "sf2hook"
            invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
        """.trimIndent())
    }
}
