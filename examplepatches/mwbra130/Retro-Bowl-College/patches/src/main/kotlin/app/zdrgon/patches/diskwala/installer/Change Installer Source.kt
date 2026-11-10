package app.zdrgon.patches.diskwala.installer

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.zdrgon.patches.diskwala.shared.Constants
import java.util.logging.Logger

/**
 * True for calls that read the installer package name as a String:
 * PackageManager.getInstallerPackageName and the InstallSourceInfo getters.
 * These are exactly the call sites the official Morphe "Change installer
 * source" library patch rewrites.
 *
 * Why DiskWala keeps this: installer identity is read all over the
 * app (22 call sites across the dexes, mostly ad SDKs). PairIP's own
 * local installer check exists in 27.3 too, but its branch is dead
 * in this build — LicenseClient.localCheckEnabled is never enabled,
 * so performLocalInstallerCheck never runs; the launch block
 * Matsen hit with v1.52.0 was PairIP's ONLINE license check, which
 * the "Bypass PairIP ..." patches handle. This spoof is kept on as
 * a pre-selected companion so every installer read in the app
 * consistently reports Google Play on a re-signed build.
 */
private fun Instruction.isInstallerGetterCall(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = getReference<MethodReference>() ?: return false
    if (reference.returnType != "Ljava/lang/String;") return false
    return when (reference.definingClass) {
        "Landroid/content/pm/PackageManager;" ->
            reference.name == "getInstallerPackageName" && reference.parameterTypes.size == 1

        "Landroid/content/pm/InstallSourceInfo;" ->
            reference.parameterTypes.isEmpty() && reference.name in setOf(
                "getInitiatingPackageName",
                "getInstallingPackageName",
                "getOriginatingPackageName",
            )

        else -> false
    }
}

@Suppress("unused")
val changeInstallerSourcePatch = bytecodePatch(
    name = "Change installer source",
    description = "Spoofs the installer source so the app appears to be installed from Google Play everywhere it is read. Pre-selected companion for the DiskWala patch set — keep it on.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_DISKWALA)

    val packageInstallerName = stringOption(
        key = "packageInstallerName",
        default = "com.android.vending",
        values = mapOf(
            "Google Play" to "com.android.vending",
            "Samsung Galaxy Store" to "com.sec.android.app.samsungapps",
            "Amazon Appstore" to "com.amazon.venezia",
            "Huawei AppGallery" to "com.huawei.appmarket",
            "Xiaomi GetApps" to "com.xiaomi.mipicks",
        ),
        title = "Spoofed package installer name",
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        val targetInstaller = packageInstallerName.value ?: "com.android.vending"
        var patchedCount = 0

        classDefForEach { classDef ->
            val hasTarget = classDef.methods.any { method ->
                method.instructionsOrNull?.any { it.isInstallerGetterCall() } == true
            }
            if (!hasTarget) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                val insns = method.instructionsOrNull?.toList() ?: return@forEach
                insns.forEachIndexed { index, insn ->
                    if (!insn.isInstallerGetterCall()) return@forEachIndexed
                    val moveResult = insns.getOrNull(index + 1) as? OneRegisterInstruction
                        ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEachIndexed
                    method.replaceInstruction(
                        index + 1,
                        "const-string v${moveResult.registerA}, \"$targetInstaller\"",
                    )
                    patchedCount++
                }
            }
        }

        if (patchedCount == 0) {
            throw PatchException("No installer-source call sites found in this version.")
        }
        logger.info("DiskWala: spoofed $patchedCount installer-source call site(s) to $targetInstaller.")
    }
}
