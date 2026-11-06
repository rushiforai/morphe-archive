package app.zdrgon.patches.mp3tagger.installer

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
import app.zdrgon.patches.mp3tagger.shared.Constants
import java.util.logging.Logger

/**
 * True for calls that read the installer package name as a String:
 * PackageManager.getInstallerPackageName and the InstallSourceInfo getters.
 * These are exactly the call sites the official Morphe "Change installer
 * source" library patch rewrites.
 *
 * Why Smart MP3 Tagger needs this: 26.8.130 ships PairIP (application +
 * licensecheck in classes2.dex) and its LOCAL installer check is LIVE —
 * LicenseClient.checkLicense runs from the PairIP Application's
 * attachBaseContext and from LicenseContentProvider.onCreate at every
 * startup, and performLocalInstallerCheck reads the installing package
 * name through these calls and rejects a re-signed build that was not
 * installed from a real app store. Without this rewrite the patched app
 * never gets past the license check, so this patch is REQUIRED alongside
 * "Enable Lifetime Pro" — both ship default-on.
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
    description = "Spoofs the installer source so the app appears to be installed from Google Play. Required for Smart MP3 Tagger: its PairIP local installer check is live, so a re-signed build fails the license check without it — keep it on.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_SMART_MP3_TAGGER)

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
        logger.info("Smart MP3 Tagger: spoofed $patchedCount installer-source call site(s) to $targetInstaller.")
    }
}
