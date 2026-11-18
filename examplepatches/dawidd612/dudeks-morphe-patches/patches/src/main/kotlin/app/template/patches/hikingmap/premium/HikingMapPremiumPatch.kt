package app.template.patches.hikingmap.premium

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val hikingMapPremiumPatch = bytecodePatch(
    name = "Local Premium",
    description = "Enables local Premium checks for navigation, offline map controls and ads. " +
        "Does not activate a subscription on your account. Experimental; device testing needed.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Mapa Turystyczna",
            description = "Hiking routes, trail maps and GPS navigation.",
            packageName = "pl.mapa_turystyczna.app",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0x62A744,
            targets = listOf(AppTarget(version = "1.16.6", versionCode = 153)),
        ),
    )

    execute {
        // Keep the real account/order model intact. Making its isActive method
        // return true with a null currentOrder crashes the refresh analytics.
        PremiumInfoFingerprint.method
        val access = PremiumAccessFingerprint.method
        val flow = PremiumFlowFingerprint.method
        if ((access.implementation?.registerCount ?: 0) < 2) {
            throw PatchException("Mapa Turystyczna: no local register in the access check.")
        }

        val instructions = flow.instructions.toList()
        val callIndex = instructions.indices.singleOrNull { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Lzh4;" && reference.name == "a" &&
                reference.returnType == "Z" && reference.parameterTypes.isEmpty()
        } ?: throw PatchException("Mapa Turystyczna: expected one Premium flow check.")
        val result = instructions.getOrNull(callIndex + 1)
        val boxing = (instructions.getOrNull(callIndex + 2) as? ReferenceInstruction)
            ?.reference as? MethodReference
        if (result?.opcode != Opcode.MOVE_RESULT || boxing?.definingClass != "Ljava/lang/Boolean;" ||
            boxing.name != "valueOf"
        ) {
            throw PatchException("Mapa Turystyczna: Premium flow result layout changed.")
        }
        val register = (result as OneRegisterInstruction).registerA

        access.replaceBody("const/4 v0, 0x1\nreturn v0")
        // This collector also serves unrelated flows. Change only the boolean
        // emitted for Premium, preserving its coroutine state and other branches.
        flow.replaceInstruction(callIndex + 1, "const/16 v$register, 0x1")
    }
}
