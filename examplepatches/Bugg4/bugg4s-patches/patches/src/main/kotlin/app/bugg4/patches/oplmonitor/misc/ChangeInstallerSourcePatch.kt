package app.bugg4.patches.oplmonitor.misc

import app.bugg4.patches.oplmonitor.Constants.COMPATIBILITY_OPL_MONITOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.logging.Logger

private const val DEFAULT_INSTALLER_PACKAGE_NAME = "com.android.vending"

/**
 * [android.content.pm.InstallSourceInfo.PACKAGE_SOURCE_STORE]
 */
private const val PACKAGE_SOURCE_STORE = 2

/**
 * Call sites that report the installer source of the app.
 *
 * The app blocks itself at startup when it detects it was not installed from the
 * Play Store (PairIP license check). Spoofing the result of these calls makes the
 * app believe it was installed from an app store.
 */
private val INSTALLER_SOURCE_CALLS = arrayOf(
    "Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;",
    "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;",
    "Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;",
    "Landroid/content/pm/InstallSourceInfo;->getPackageSource()I",
)

@Suppress("unused")
val changeInstallerSourcePatch = bytecodePatch(
    name = "Change installer source",
    description = "Passes the startup license check by making the app appear installed from " +
        "an app store. Only works on Android 10 and newer. " +
        "On Android 9 and older use 'Remove license check' instead.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OPL_MONITOR)

    val installerPackageNameOption = stringOption(
        key = "packageInstallerName",
        default = DEFAULT_INSTALLER_PACKAGE_NAME,
        title = "Spoofed package installer name",
        description = "Package name of the app store the app will appear to be installed from.",
        required = true,
    )

    execute {
        val installerPackageName = installerPackageNameOption.value!!
        var spoofedCallSites = 0

        INSTALLER_SOURCE_CALLS.forEach { smali ->
            val filter = methodCall(smali)
            val returnsInt = smali.endsWith(")I")
            val expectedMoveResultOpcode =
                if (returnsInt) Opcode.MOVE_RESULT else Opcode.MOVE_RESULT_OBJECT

            Fingerprint(filters = listOf(filter)).matchAllOrNull()?.forEach { match ->
                val method = match.method
                val instructions = method.implementation?.instructions ?: return@forEach

                instructions.forEachIndexed { index, instruction ->
                    if (!filter.matches(method, instruction)) return@forEachIndexed

                    val resultIndex = index + 1
                    if (resultIndex >= instructions.count()) return@forEachIndexed

                    val resultInstruction = method.getInstruction(resultIndex)
                    if (resultInstruction.opcode != expectedMoveResultOpcode) return@forEachIndexed

                    val register = (resultInstruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(
                        resultIndex,
                        if (returnsInt) {
                            "const v$register, $PACKAGE_SOURCE_STORE"
                        } else {
                            "const-string v$register, \"$installerPackageName\""
                        },
                    )

                    spoofedCallSites++
                }
            }
        }

        if (spoofedCallSites == 0) {
            Logger.getLogger(this::class.java.name).warning(
                "No installer source checks found, the app may still fail its startup license check.",
            )
        }
    }
}
