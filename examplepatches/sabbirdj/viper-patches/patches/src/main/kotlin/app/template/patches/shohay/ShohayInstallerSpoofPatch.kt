package app.template.patches.shohay

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.template.patches.shared.Constants.COMPATIBILITY_SHOHAY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.logging.Logger

/**
 * App store source (InstallSourceInfo.getPackageSource()).
 */
private const val PACKAGE_INSTALLER_PACKAGE_SOURCE_STORE = 2

/**
 * Spoofs the installer source so Shohay appears to be installed from
 * Google Play (com.android.vending).
 *
 * This is the Morphe universal "Change installer source" patch, adapted
 * for Shohay. It finds every call site in the app of:
 *
 * ```
 *  Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;
 *  Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;
 *  Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;
 *  Landroid/content/pm/InstallSourceInfo;->getPackageSource()I
 * ```
 *
 * and replaces the move-result that follows each call with a constant:
 * the String results become "com.android.vending" and getPackageSource()
 * becomes 2 (PACKAGE_SOURCE_STORE). The app then reports Play Store as
 * its installer everywhere it checks, so a manually installed (Morphe /
 * SAI) build no longer triggers "not installed from Play Store" paths.
 *
 * Based on the official Morphe implementation:
 * app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
 * (MorpheApp/morphe-patches-library).
 */
@Suppress("unused")
val shohayInstallerSpoofPatch = patch(
    name = "Spoof installer source (Play Store)",
    description = "Makes Shohay appear installed from Google Play (com.android.vending) so a manually installed build does not hit 'not installed from Play Store' paths. Same logic as the Morphe universal 'Change installer source' patch. Verified on Shohay 2.1.1.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SHOHAY)

    execute {
        var changesMade = false
        val installerPackageName = "com.android.vending"

        arrayOf(
            "Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getPackageSource()I"
        ).forEach { smali ->
            val methodCall = methodCall(smali)
            val isIntReturnType = methodCall.returnType == "I"
            val expectedReturnOpcode = if (isIntReturnType) {
                Opcode.MOVE_RESULT
            } else {
                Opcode.MOVE_RESULT_OBJECT
            }

            methodCall.matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val returnIndex = index + 1
                val instruction = getInstruction(returnIndex)

                if (instruction.opcode != expectedReturnOpcode) {
                    return@matchAllMethodIndicesForEach
                }

                val register = (instruction as OneRegisterInstruction).registerA
                val smaliInstruction = if (isIntReturnType) {
                    "const/4 v$register, $PACKAGE_INSTALLER_PACKAGE_SOURCE_STORE"
                } else {
                    "const-string v$register, \"$installerPackageName\""
                }
                replaceInstruction(returnIndex, smaliInstruction)

                changesMade = true
            }
        }

        if (!changesMade) {
            return@execute Logger.getLogger(Patch::class.java.name).info(
                "No installer source checks found, no changes applied"
            )
        }
    }
}
