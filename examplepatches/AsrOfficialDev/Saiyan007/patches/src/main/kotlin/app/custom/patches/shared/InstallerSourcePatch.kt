/*
 * Copyright 2026 Morphe.
 * Adapted for Saiyan007 from:
 * https://github.com/MorpheApp/morphe-patches-library/blob/main/patch-library/src/main/kotlin/app/morphe/patches/all/misc/fix/changepackageinstaller/ChangePackageInstallerPatch.kt
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.custom.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.logging.Logger

// An unnamed dependency: selecting an app patch also applies its installer fix.
internal val playStoreInstallerSourcePatch = bytecodePatch {
    execute {
        var changes = 0
        arrayOf(
            "Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getPackageSource()I",
        ).forEach { signature ->
            val call = methodCall(signature)
            val isPackageSource = call.returnType == "I"
            val resultOpcode = if (isPackageSource) Opcode.MOVE_RESULT else Opcode.MOVE_RESULT_OBJECT

            call.matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val resultIndex = index + 1
                val result = getInstruction(resultIndex)
                if (result.opcode != resultOpcode) return@matchAllMethodIndicesForEach

                val register = (result as OneRegisterInstruction).registerA
                if (isPackageSource) {
                    // PackageInstaller.PACKAGE_SOURCE_STORE; const/16 also handles v16+.
                    replaceInstruction(resultIndex, BuilderInstruction21s(Opcode.CONST_16, register, 2))
                } else {
                    replaceInstruction(resultIndex, "const-string v$register, \"com.android.vending\"")
                }
                changes++
            }
        }

        Logger.getLogger("Saiyan007").info("Updated $changes installer-source lookups to Google Play.")
    }
}
