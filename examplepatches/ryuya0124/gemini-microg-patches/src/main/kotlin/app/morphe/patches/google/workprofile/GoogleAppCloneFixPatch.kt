package app.morphe.patches.google.workprofile

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Google アプリ内のハードコードされたパッケージ名をクローン版（.morphe）へ置換するパッチ
 * （※プロセス名は switch 文のコンパイル時 hashCode と整合性を保つため ProcessNameSanitizePatch で正規化されます）
 */
val googleAppCloneFixPatch = bytecodePatch(
    name = "Google App Package Clone Support",
    description = "クローン版 Google アプリ内の完全一致パッケージ名を .morphe へリダイレクトします。",
    default = true
) {
    compatibleWith("com.google.android.googlequicksearchbox")

    execute {
        val originalPackage = VersionHookRegistry.target(HookId.PACKAGE_CLONE_REDIRECT, packageMetadata).anchorStrings.single()
        val clonedPackage = "com.google.android.googlequicksearchbox.morphe"

        val matchingClasses = getAllClassesWithString(originalPackage)
        println("[GoogleAppCloneFixPatch] Found ${matchingClasses.size} classes referencing '$originalPackage'")

        var packageReplacements = 0

        for (classDef in matchingClasses) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                val insList = method.instructions
                for (idx in insList.indices) {
                    val ins = insList[idx]
                    if (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) {
                        val ref = (ins as ReferenceInstruction).reference
                        if (ref is StringReference) {
                            val str = ref.string
                            // 完全一致パッケージ名のみ置換（プロセス名は置換せず元のまま保持）
                            if (str == originalPackage) {
                                val reg = (ins as OneRegisterInstruction).registerA
                                method.replaceInstruction(
                                    idx,
                                    """
                                        const-string v$reg, "$clonedPackage"
                                    """
                                )
                                packageReplacements++
                            }
                        }
                    }
                }
            }
        }

        VersionHookRegistry.logHook(
            HookId.PROCESS_NAME_REDIRECT,
            "Package",
            "SUCCESS",
            "Replaced $packageReplacements exact package occurrences across ${matchingClasses.size} classes"
        )
    }
}
