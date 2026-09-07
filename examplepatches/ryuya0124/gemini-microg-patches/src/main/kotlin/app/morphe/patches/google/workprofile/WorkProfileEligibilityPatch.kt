package app.morphe.patches.google.workprofile

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Enable the existing allow-work-profile branch; preserve other eligibility checks. */
val workProfileEligibilityPatch = bytecodePatch(
    name = "Allow Work Profile Gemini Eligibility",
    description = "Secure FolderでのWORK_PROFILE_NOT_SUPPORTED (19)を、既存のプロファイル許可分岐で回避します。",
    default = true
) {
    compatibleWith("com.google.android.googlequicksearchbox")
    execute {
        val spec = VersionHookRegistry.target(HookId.WORK_PROFILE_ELIGIBILITY, packageMetadata)
        val candidates = getAllClassesWithString(spec.anchorStrings[0])
        var patched = 0
        for (clazz in candidates) {
            check(clazz.type == spec.className) { "Unsupported eligibility class: ${clazz.type}" }
            for (method in mutableClassDefBy(clazz).methods) {
                if (method.implementation == null) continue
                val ins = method.instructions.toList()
                val strings = ins.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                if (spec.anchorStrings[0] !in strings) continue
                check(spec.anchorStrings[1] in strings)
                check(spec.matches(method))
                for ((index, instruction) in ins.withIndex()) {
                    val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                    if (instruction.opcode == Opcode.IGET_BOOLEAN && field.definingClass == clazz.type &&
                        field.name == spec.fieldName && field.type == spec.fieldType) {
                        val register = (instruction as OneRegisterInstruction).registerA
                        // Same width as iget-boolean, preserving all code offsets.
                        method.replaceInstruction(index, "const/16 v$register, 0x1")
                        patched++
                    }
                }
            }
        }
        check(patched == spec.expectedMatches) { "Expected one work-profile allowance read; found $patched" }
        println("[WorkProfileEligibility] Enabled existing work-profile allowance (error 19)")
    }
}
