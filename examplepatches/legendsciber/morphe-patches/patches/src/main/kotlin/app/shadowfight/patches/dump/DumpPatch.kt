package app.shadowfight.patches.dump

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2

@Suppress("unused")
val sfDumpPatch = rawResourcePatch(
    name = "Shadow Fight 2 Runtime Dump",
    description = "Dumps all Unity classes/fields with ObscuredInt to logcat and files. Use logcat -s ShadowDump or cat shizuku-terminal/shadowdump-log.txt",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val soFile = get("assets/libShadowDump.so", true)
        val soBytes = DumpSoBytes.part0() + DumpSoBytes.part1() + DumpSoBytes.part2() + DumpSoBytes.part3() + DumpSoBytes.part4() + DumpSoBytes.part5() + DumpSoBytes.part6() + DumpSoBytes.part7() + DumpSoBytes.part8() + DumpSoBytes.part9() + DumpSoBytes.part10() + DumpSoBytes.part11()
        soFile.writeBytes(soBytes)
        val dexFile = get("classes9.dex", true)
        val dexBytes = DumpHelperBytes.part0() + DumpHelperBytes.part1()
        dexFile.writeBytes(dexBytes)
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
            invoke-static {p0}, Lhelper/DumpHelper;->load(Landroid/content/Context;)V
        """.trimIndent())
    }
}
