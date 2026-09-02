package app.shadowfight.patches.dump

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2
import app.shadowfight.patches.cheats.UnityOnCreateFingerprint

@Suppress("unused")
val sfDumpPatch = rawResourcePatch(
    name = "Shadow Fight 2 Runtime Dump",
    description = "Dumps all Unity classes/fields with ObscuredInt to logcat for hardcode. Use logcat -s ShadowDump.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val soFile = get("lib/arm64-v8a/libShadowDump.so", true)
        val soBytes = DumpSoBytes.part0() + DumpSoBytes.part1() + DumpSoBytes.part2() + DumpSoBytes.part3() + DumpSoBytes.part4() + DumpSoBytes.part5() + DumpSoBytes.part6() + DumpSoBytes.part7() + DumpSoBytes.part8() + DumpSoBytes.part9()
        soFile.writeBytes(soBytes)
    }
}

@Suppress("unused")
val sfDumpTriggerPatch = bytecodePatch(
    name = "Shadow Fight 2 Dump Trigger",
    description = "Triggers ShadowDump via UnityPlayerActivity.onCreate",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val idx = UnityOnCreateFingerprint.instructionMatches[0].index + 1
        UnityOnCreateFingerprint.method.addInstructions(idx, """
            const-string v0, "ShadowDump"
            invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
        """.trimIndent())
    }
}
