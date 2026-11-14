package app.morphe.patches.all.spoof.installer

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val spoofInstallSourcePatch = bytecodePatch(
    name = "Spoof install source",
    description = "Makes the app believe it was installed from a chosen store " +
        "(Play Store by default).",
    default = false,
) {
    val installerOption = stringOption(
        key = "installer",
        default = "com.android.vending",
        values = mapOf(
            "Google Play Store" to "com.android.vending",
            "Aurora Store" to "com.aurora.store",
            "Samsung Galaxy Store" to "com.sec.android.app.samsungapps",
            "F-Droid" to "org.fdroid.fdroid",
            "Amazon Appstore" to "com.amazon.venezia",
            "Huawei AppGallery" to "com.huawei.appmarket",
            "Xiaomi GetApps" to "com.xiaomi.market",
            "ADB / sideload" to "com.android.shell",
        ),
        title = "Install source",
        description = "The installer package to report.",
        required = true,
    )

    execute {
        val installer = installerOption.value!!
        listOf(
            "Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;",
            "Landroid/content/pm/InstallSourceInfo;->getOriginatingPackageName()Ljava/lang/String;",
        ).forEach { smali ->
            methodCall(smali).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val ri = index + 1
                val ins = getInstruction(ri)
                if (ins.opcode != Opcode.MOVE_RESULT_OBJECT) return@matchAllMethodIndicesForEach
                val reg = (ins as OneRegisterInstruction).registerA
                replaceInstruction(ri, "const-string v$reg, \"$installer\"")
            }
        }
        methodCall("Landroid/content/pm/InstallSourceInfo;->getPackageSource()I")
            .matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val ri = index + 1
                val ins = getInstruction(ri)
                if (ins.opcode != Opcode.MOVE_RESULT) return@matchAllMethodIndicesForEach
                val reg = (ins as OneRegisterInstruction).registerA
                replaceInstruction(ri, "const/4 v$reg, 0x2")
            }
    }
}
