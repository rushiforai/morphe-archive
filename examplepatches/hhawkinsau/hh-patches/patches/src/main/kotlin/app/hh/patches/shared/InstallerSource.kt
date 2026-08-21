package app.hh.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PLAY_STORE_PACKAGE = "com.android.vending"

/** [android.content.pm.PackageInstaller.PACKAGE_SOURCE_STORE] */
private const val PACKAGE_SOURCE_STORE = 2

/**
 * Spoofs every in-app read of the install source so Play-protected apps
 * believe they were installed from the Play Store.
 *
 * Patches the return of:
 * - PackageManager.getInstallerPackageName
 * - InstallSourceInfo.getInstallingPackageName
 * - InstallSourceInfo.getInitiatingPackageName
 * - InstallSourceInfo.getPackageSource
 *
 * @return true if at least one call site was rewritten.
 */
context(_: BytecodePatchContext)
internal fun spoofPlayStoreInstaller(): Boolean {
    var changes = 0

    arrayOf(
        "Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;",
        "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;",
        "Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;",
        "Landroid/content/pm/InstallSourceInfo;->getPackageSource()I",
    ).forEach { smali ->
        val call = methodCall(smali)
        val expectedReturn = if (call.returnType == "I") {
            Opcode.MOVE_RESULT
        } else {
            Opcode.MOVE_RESULT_OBJECT
        }

        Fingerprint(filters = listOf(call)).matchAllOrNull()?.forEach { match ->
            match.method.apply {
                val invokeIndex = match.instructionMatches.first().index
                val returnIndex = invokeIndex + 1
                if (returnIndex >= (implementation?.instructions?.size ?: 0)) return@forEach

                val instruction = getInstruction(returnIndex)
                if (instruction.opcode != expectedReturn) return@forEach

                val register = (instruction as OneRegisterInstruction).registerA
                val replacement = if (call.returnType == "I") {
                    "const/4 v$register, $PACKAGE_SOURCE_STORE"
                } else {
                    "const-string v$register, \"$PLAY_STORE_PACKAGE\""
                }
                replaceInstruction(returnIndex, replacement)
                changes++
            }
        }
    }

    return changes > 0
}
