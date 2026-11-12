// © https://saadbinyousaf.dev/ © //
package dev.sby.patches.foodpanda

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.registersUsed
import dev.sby.patches.shared.Constants.COMPATIBILITY_FOODPANDA

private const val EXTENSION_CLASS = "Ldev/sby/patches/extension/SignatureSpoofPatch;"

// © https://saadbinyousaf.dev/ © //
val signatureSpoofPatch = bytecodePatch(
    name = "Spoof signature (maps fix)",
    description = "Experimental. Redirects PackageManager.getPackageInfo so the app reports foodpanda's " +
        "original signing certificate, which can restore Google Maps on re-signed builds. May not work " +
        "because Google Play Services verifies the installed signature out of process.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FOODPANDA)

    // © https://saadbinyousaf.dev/ © //
    extendWith("extensions/extension.mpe")

    // © https://saadbinyousaf.dev/ © //
    execute {
        getPackageInfoFingerprint.matchAllMethodIndicesForEach(requireMatches = false) { index ->
            val instruction = getInstruction(index)
            val registers = instruction.registersUsed
            if (registers.size == 3) {
                val (manager, packageName, flags) = registers
                replaceInstruction(
                    index,
                    "invoke-static { v$manager, v$packageName, v$flags }, " +
                        "$EXTENSION_CLASS->getPackageInfo(Landroid/content/pm/PackageManager;Ljava/lang/String;I)Landroid/content/pm/PackageInfo;",
                )
            }
        }
    }
}
// © https://saadbinyousaf.dev/ © //
