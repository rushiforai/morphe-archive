package app.shadowfight.patches.crash

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2
import app.shadowfight.patches.dump.UnityOnCreateFingerprint

@Suppress("unused")
val sfCrashPatch = rawResourcePatch(
    name = "Shadow Fight 2 Crash Log",
    description = "Saves crash info to a file if the game crashes.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val soFile = get("lib/arm64-v8a/libShadowCrash.so", true)
        val soBytes = CrashSoBytes.part0() + CrashSoBytes.part1() + CrashSoBytes.part2() + CrashSoBytes.part3() + CrashSoBytes.part4() + CrashSoBytes.part5() + CrashSoBytes.part6()
        soFile.writeBytes(soBytes)
    }
}

@Suppress("unused")
val sfCrashTriggerPatch = bytecodePatch(
    name = "Shadow Fight 2 Crash Trigger",
    description = "Enables crash logging.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val idx = UnityOnCreateFingerprint.instructionMatches[0].index + 1
        UnityOnCreateFingerprint.method.addInstructions(idx, """
            const-string v0, "ShadowCrash"
            invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
        """.trimIndent())
    }
}
