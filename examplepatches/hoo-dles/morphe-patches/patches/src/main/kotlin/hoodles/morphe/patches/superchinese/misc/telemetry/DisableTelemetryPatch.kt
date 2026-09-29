/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.superchinese.misc.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11n
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Blocks SuperChinese's custom telemetry reporting."
) {
    compatibleWith(Compat.SUPERCHINESE)

    dependsOn(spoofSignaturePatch)

    execute {
        LogProducerClientCtorFingerprint.apply {
            val enableParamInstr = instructionMatches.first()
            val enableParamReg = enableParamInstr.getInstruction<Instruction11n>().registerA
            method.replaceInstruction(enableParamInstr.index, """
                const/4 v$enableParamReg, 0x0
            """.trimIndent())
        }
    }
}