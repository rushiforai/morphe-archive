package app.shadowfight.patches.hardcode

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2
import app.shadowfight.patches.dump.UnityOnCreateFingerprint

@Suppress("unused")
val sfHardcodePatch = rawResourcePatch(
    name = "Shadow Fight 2 Unlimited Values",
    description = "Sets in-game values to unlimited.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val soFile = get("lib/arm64-v8a/libShadowHardcode.so", true)
        val soBytes = HardcodeSoBytes.part0() + HardcodeSoBytes.part1() + HardcodeSoBytes.part2() + HardcodeSoBytes.part3() + HardcodeSoBytes.part4() + HardcodeSoBytes.part5() + HardcodeSoBytes.part6() + HardcodeSoBytes.part7() + HardcodeSoBytes.part8() + HardcodeSoBytes.part9() + HardcodeSoBytes.part10() + HardcodeSoBytes.part11() + HardcodeSoBytes.part12() + HardcodeSoBytes.part13() + HardcodeSoBytes.part10() + HardcodeSoBytes.part11()
        soFile.writeBytes(soBytes)
    }
}

@Suppress("unused")
val sfHardcodeTriggerPatch = bytecodePatch(
    name = "Shadow Fight 2 Values Trigger",
    description = "Enables unlimited values.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val idx = UnityOnCreateFingerprint.instructionMatches[0].index + 1
        UnityOnCreateFingerprint.method.addInstructions(idx, """
            const-string v0, "ShadowHardcode"
            invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
        """.trimIndent())
    }
}
