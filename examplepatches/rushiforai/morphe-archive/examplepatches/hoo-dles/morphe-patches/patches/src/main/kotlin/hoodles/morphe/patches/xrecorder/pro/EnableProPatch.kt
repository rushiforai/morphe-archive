package hoodles.morphe.patches.xrecorder.pro

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getMutableMethod
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import hoodles.morphe.patches.xrecorder.misc.signature.spoofSignaturePatch

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro"
) {
    compatibleWith(Compatibility(
       name = "XRecorder",
       packageName = "videoeditor.videorecorder.screenrecorder",
       appIconColor = 0xf76219,
       targets = listOf(AppTarget("2.5.1.1"))
    ))

    dependsOn(spoofSignaturePatch)

    execute {
        GetProUsageFingerprint.instructionMatches.first()
            .getInstruction<ReferenceInstruction>()
            .getReference<MethodReference>()!!
            .getMutableMethod()
            .returnEarly(true)

        SetDisableAdsUsageFingerprint.apply {
            val defaultNoAdsIndex = instructionMatches.first().index
            val valueReg = instructionMatches.first().getInstruction<OneRegisterInstruction>().registerA

            method.replaceInstruction(defaultNoAdsIndex, """
                const/4 v${valueReg}, 0x1
            """.trimIndent())
        }
    }
}