package dev.dyno0311.patches.apps.camscanner.watermark

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.dyno0311.patches.apps.camscanner.camScannerCompatibility

/**
 * com.intsig.camscanner.share.rights.ShareRightsUtil.checkWatermarkHidden(Function0)Z
 *
 * Single decision point for "the Scanned with CamScanner watermark is hidden". The result is consumed by
 * PDF_Util.createPdf (the isWatermarkDismiss argument that gates the drawText/drawImage watermark block),
 * SharePdf, ShareFreeWatermarkControl and PdfEditingActivity. The method also logs "checkWatermarkHidden"
 * and reads the server flag free_watermark_switch; forcing true hides the mark without touching native code.
 */
internal object WatermarkHiddenFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/camscanner/share/rights/ShareRightsUtil;",
    returnType = "Z",
    parameters = listOf("Lkotlin/jvm/functions/Function0;"),
    strings = listOf("checkWatermarkHidden -> watermarkFreeSwitch = ")
)

@Suppress("unused")
val removeWatermarkPatch = bytecodePatch(
    default = false,
    name = "Remove PDF watermark",
    description = "Stops the Scanned with CamScanner watermark from being drawn into exported and shared PDFs. " +
        "The local document is otherwise produced by the same native PDF engine, unmodified."
) {
    compatibleWith(camScannerCompatibility)

    execute {
        WatermarkHiddenFingerprint.method.returnEarly(true)
    }
}
