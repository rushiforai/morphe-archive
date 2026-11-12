package app.template.patches.screenrecording

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.template.patches.shared.cert.extractApkCertificatePatch
import app.template.patches.shared.firebase.spoofFirebaseCertHashPatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch

private val SCREEN_RECORDING_APP = Compatibility(
    name = "Screen Recording App",
    packageName = "de.twokit.screen.recording.app",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xE53935,
    targets = listOf(AppTarget(version = "1.11")),
)

/**
 * Constructor of f3.c: reads "iapPurchasedPro" into field g.
 */
private object IapPurchasedProConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "Ljava/lang/String;"),
    strings = listOf("iapPurchasedPro", "screen_recording_app"),
)

/**
 * Preview onCreate (public final).
 */
private object PreviewIapGateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf("iapPurchasedPro"),
)

/**
 * Finds getBoolean("iapPurchasedPro") and returns the insert index
 * (right after move-result) and the destination register.
 */
private fun findInsertAfterIapGetBoolean(
    instructions: List<Instruction>,
): Pair<Int, Int>? {
    var i = 0
    val n = instructions.size
    while (i < n) {
        val insn = instructions[i]
        if (insn is ReferenceInstruction) {
            val ref = insn.reference
            if (ref is StringReference && ref.string == "iapPurchasedPro") {
                var j = i + 1
                while (j < n) {
                    val next = instructions[j]
                    if (next.opcode.name.startsWith("move-result")) {
                        val reg = if (next is OneRegisterInstruction) next.registerA else 0
                        return Pair(j + 1, reg)
                    }
                    j++
                }
                return null
            }
        }
        i++
    }
    return null
}

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock pro",
    description = "Unlocks pro features.",
    default = true,
) {
    compatibleWith(SCREEN_RECORDING_APP)

    dependsOn(
        disablePairipPatch,
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
    )
    execute {
        // --- Constructor (flag central g) ---
        val ctor = IapPurchasedProConstructorFingerprint.method
        val ctorList: List<Instruction> =
            ArrayList(ctor.implementation!!.instructions)
        val ctorHit = findInsertAfterIapGetBoolean(ctorList)
            ?: error("iapPurchasedPro getBoolean not found in constructor")
        ctor.addInstructions(
            ctorHit.first,
            """
                const/4 v${ctorHit.second}, 0x1
            """,
        )

        // --- Previews ---
        val previewMatches = PreviewIapGateFingerprint.matchAll()
        var k = 0
        val m = previewMatches.size
        while (k < m) {
            val mth = previewMatches[k].method
            val list: List<Instruction> =
                ArrayList(mth.implementation!!.instructions)
            val hit = findInsertAfterIapGetBoolean(list)
            if (hit != null) {
                mth.addInstructions(
                    hit.first,
                    """
                        const/4 v${hit.second}, 0x1
                    """,
                )
            }
            k++
        }
    }
}
