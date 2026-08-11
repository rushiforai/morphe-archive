package app.atharv.patches.olaelectric.docupload

import app.atharv.patches.olaelectric.shared.Constants.COMPATIBILITY_OLA_ELECTRIC
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val highQualityDocUploadPatch = bytecodePatch(
    name = "High quality document upload",
    description = "Raises the JPEG re-encode quality used by the camera capture-with-compression " +
        "flow from 0 to 100, and raises the 6MB per-file size limit enforced on document " +
        "uploads to 100MB, so scanned documents and high-resolution photos are no longer " +
        "degraded or rejected before upload."
) {
    compatibleWith(COMPATIBILITY_OLA_ELECTRIC)

    execute {
        // Bitmap.compress(JPEG, 0, stream) -> Bitmap.compress(JPEG, 100, stream).
        // The quality literal is the instruction immediately preceding the compress() call.
        ImagePickerCompressResultFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val compressIndex = fingerprint.instructionMatches[0].index
            val qualityLiteralIndex = compressIndex - 1
            val register = method.getInstruction<OneRegisterInstruction>(qualityLiteralIndex).registerA
            method.replaceInstruction(qualityLiteralIndex, "const/16 v$register, 0x64")
        }

        // 6.0f (6MB) reject threshold -> 100.0f (100MB), at every occurrence in the class.
        DocumentFileSizeLimitFingerprint.matchAllOrNull()?.forEach { match ->
            val index = match.instructionMatches[0].index
            val register = match.method.getInstruction<OneRegisterInstruction>(index).registerA
            match.method.replaceInstruction(index, "const/high16 v$register, 0x42c80000")
        }
    }
}
