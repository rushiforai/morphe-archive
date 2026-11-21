package app.aidan.patches.canvas.features

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.aidan.patches.shared.isEnabled
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

private data class PdfKitPatch(
    val libraryPath: String,
    val assertionOffset: Int,
    val assertionExpected: ByteArray,
    val assertionReplacement: ByteArray,
    val watermarkOffset: Int
)

private const val EVALUATION_WATERMARK_TEXT = "For Evaluation Purposes Only"

/**
 * Entry points of `PDFC::Forms::checkLicenseForFormsAndThrowIfMissing()` in each shipped ABI.
 * Canvas's Nutrient license grants form viewing and filling but not form editing; the native SDK
 * nevertheless calls this editing-only assertion from view-path methods (`registerFormObserver`,
 * `getFormFields`) and aborts the process when a document opens. Returning immediately keeps the
 * licensed view/fill paths working and leaves the Java-side entitlement gates unchanged.
 *
 * [watermarkOffset] points at the native "For Evaluation Purposes Only" string that the renderer
 * stamps over every page when the license is rejected, which happens for a cloned package because
 * the bundled license is bound to the original bundle identifier.
 */
private val PDFKIT_PATCHES = listOf(
    PdfKitPatch(
        libraryPath = "lib/arm64-v8a/libpspdfkit.so",
        assertionOffset = 0xd89d3c,
        // sub sp, sp, #0xa0 -> ret
        assertionExpected = byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x02, 0xd1.toByte()),
        assertionReplacement = byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte()),
        watermarkOffset = 0x175edb
    ),
    PdfKitPatch(
        libraryPath = "lib/armeabi-v7a/libpspdfkit.so",
        assertionOffset = 0x979a8c,
        // push {r4, r5, r7, lr}; add r7, sp, #8 -> bx lr; nop
        assertionExpected = byteArrayOf(0xb0.toByte(), 0xb5.toByte(), 0x02, 0xaf.toByte()),
        assertionReplacement = byteArrayOf(0x70, 0x47, 0x00, 0xbf.toByte()),
        watermarkOffset = 0x21aa49
    ),
    PdfKitPatch(
        libraryPath = "lib/x86/libpspdfkit.so",
        assertionOffset = 0xd6e608,
        // push ebp; mov ebp, esp; push ebx -> ret; nop; nop; nop
        assertionExpected = byteArrayOf(0x55, 0x89.toByte(), 0xe5.toByte(), 0x53),
        assertionReplacement = byteArrayOf(0xc3.toByte(), 0x90.toByte(), 0x90.toByte(), 0x90.toByte()),
        watermarkOffset = 0xd9a99
    ),
    PdfKitPatch(
        libraryPath = "lib/x86_64/libpspdfkit.so",
        assertionOffset = 0xd69d3c,
        // push rbp; mov rbp, rsp -> ret; nop; nop; nop
        assertionExpected = byteArrayOf(0x55, 0x48, 0x89.toByte(), 0xe5.toByte()),
        assertionReplacement = byteArrayOf(0xc3.toByte(), 0x90.toByte(), 0x90.toByte(), 0x90.toByte()),
        watermarkOffset = 0x1740a5
    )
)

private val WATERMARK_TEXT_BYTES = EVALUATION_WATERMARK_TEXT.toByteArray(Charsets.US_ASCII)
private val WATERMARK_BLANK_BYTES = ByteArray(WATERMARK_TEXT_BYTES.size) { ' '.code.toByte() }

@Suppress("unused")
val fixPdfViewerCrashPatch = rawResourcePatch(
    name = "Fix PDF Viewer Crash",
    description = "Stops the document viewer from aborting when opening any PDF. Nutrient's license grants " +
        "form viewing and filling but not form editing, yet the native library applies its editing-only " +
        "license assertion to view-path calls such as form field loading, so the process is killed.",
    default = true
) {
    category("General")
    compatibleWith(COMPATIBILITY_CANVAS)

    val removeEvaluationWatermark = booleanOption(
        key = "removeEvaluationWatermark",
        default = true,
        title = "Remove Evaluation Watermark",
        description = "Blanks the native 'For Evaluation Purposes Only' watermark. A cloned package's bundle " +
            "identifier does not match the bundled Nutrient license, so the SDK stamps the watermark over " +
            "every document."
    )

    execute {
        var patchedLibraries = 0
        for (patch in PDFKIT_PATCHES) {
            val library = get(patch.libraryPath)
            if (!library.exists()) continue

            val bytes = library.readBytes()
            var changed = false

            if (bytes.size < patch.assertionOffset + patch.assertionReplacement.size) {
                throw PatchException(
                    "${patch.libraryPath} is too small for the forms assertion patch at " +
                        "0x${patch.assertionOffset.toString(16)}"
                )
            }

            val assertionPatched =
                patch.assertionReplacement.indices.all { bytes[patch.assertionOffset + it] == patch.assertionReplacement[it] }
            if (!assertionPatched) {
                val matches = patch.assertionExpected.indices.all { bytes[patch.assertionOffset + it] == patch.assertionExpected[it] }
                if (!matches) {
                    throw PatchException(
                        "${patch.libraryPath} byte sequence mismatch at 0x${patch.assertionOffset.toString(16)}; " +
                            "the Nutrient forms license assertion changed."
                    )
                }
                System.arraycopy(
                    patch.assertionReplacement,
                    0,
                    bytes,
                    patch.assertionOffset,
                    patch.assertionReplacement.size
                )
                changed = true
            }

            if (removeEvaluationWatermark.isEnabled) {
                if (bytes.size < patch.watermarkOffset + WATERMARK_TEXT_BYTES.size) {
                    throw PatchException(
                        "${patch.libraryPath} is too small for the evaluation watermark at " +
                            "0x${patch.watermarkOffset.toString(16)}"
                    )
                }

                val watermarkRemoved =
                    WATERMARK_BLANK_BYTES.indices.all { bytes[patch.watermarkOffset + it] == WATERMARK_BLANK_BYTES[it] }
                if (!watermarkRemoved) {
                    val matches = WATERMARK_TEXT_BYTES.indices.all { bytes[patch.watermarkOffset + it] == WATERMARK_TEXT_BYTES[it] }
                    if (!matches) {
                        throw PatchException(
                            "${patch.libraryPath} evaluation watermark text mismatch at " +
                                "0x${patch.watermarkOffset.toString(16)}; the Nutrient watermark changed."
                        )
                    }
                    System.arraycopy(
                        WATERMARK_BLANK_BYTES,
                        0,
                        bytes,
                        patch.watermarkOffset,
                        WATERMARK_BLANK_BYTES.size
                    )
                    changed = true
                }
            }

            if (changed) library.writeBytes(bytes)
            patchedLibraries++
        }

        if (patchedLibraries == 0) {
            throw PatchException("No supported libpspdfkit.so ABI found; cannot fix the PDF viewer crash.")
        }
    }
}
