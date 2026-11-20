package app.tgseed.patches.symfonium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.tgseed.patches.shared.Constants.COMPATIBILITY_SYMFONIUM
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The QR "share" feature builds an image URL on a third-party service, embedding the
 * data to be encoded in the query string. Nothing about that request is necessary for
 * the app to work, so it is pointed at an unroutable placeholder instead.
 *
 * Anchor: the full URL literal is unique across all three DEX files (verified: 1 match),
 * so no class or method name is used - those are R8-renamed and rotate every release.
 */
private const val ORIGINAL_QR_URL =
    "https://api.qrserver.com/v1/create-qr-code/?size=750x750&margin=0&color=0&bgcolor=E5A00D&data="

private const val REPLACEMENT_QR_URL =
    "https://qr.invalid/create-qr-code/?data="

private val QrCodeUrlFingerprint = Fingerprint(
    filters = listOf(
        string(ORIGINAL_QR_URL)
    )
)

@Suppress("unused")
val removeThirdPartyQrServicePatch = patch(
    name = "Remove third-party QR code service",
    description = "Points the share-as-QR image URL at a local placeholder so shared content " +
        "is never sent to api.qrserver.com.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        val method = QrCodeUrlFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        val index = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
            reference?.string == ORIGINAL_QR_URL
        }
        if (index < 0) {
            throw PatchException(
                "QR service URL literal not found in ${method.definingClass}->${method.name}"
            )
        }

        // Reuse the register the original const-string wrote to; never guess one.
        val register = (instructions[index] as OneRegisterInstruction).registerA
        method.replaceInstruction(index, "const-string v$register, \"$REPLACEMENT_QR_URL\"")
    }
}
