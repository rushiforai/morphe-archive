package app.ipusnas.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21s
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31i
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * WindowManager.LayoutParams.FLAG_SECURE (0x2000).
 */
private const val FLAG_SECURE = 0x2000

/**
 * Both readers set FLAG_SECURE in their onCreate, blocking screenshots and
 * recordings:
 *  - PDF: Radaee's [com.radaee.reader.PDFViewAct] (guarded by a "debug"
 *    build-config check that never holds in production builds).
 *  - EPUB: FolioReader's [com.folioreader.ui.activity.FolioActivity].
 *
 * Neutralize the flag by zeroing the 0x2000 constant fed into
 * [android.view.Window.setFlags], turning the call into a no-op.
 */
private val pdfReaderOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/radaee/reader/PDFViewAct;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private val epubReaderOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/folioreader/ui/activity/FolioActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.nullifySecureFlag() {
    val instructions = this.instructions
    for (index in instructions.indices) {
        val instruction = instructions[index]
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL || instruction !is BuilderInstruction35c) continue
        val reference = instruction.reference as? MethodReference ?: continue
        if (reference.name != "setFlags" || reference.definingClass != "Landroid/view/Window;") continue

        var lookback = index - 1
        while (lookback >= 0 && index - lookback <= 4) {
            val candidate = instructions[lookback]
            when {
                candidate is Instruction21s && candidate.narrowLiteral == FLAG_SECURE -> {
                    replaceInstruction(lookback, "const/16 v${candidate.registerA}, 0x0")
                    break
                }
                candidate is Instruction31i && candidate.narrowLiteral == FLAG_SECURE -> {
                    replaceInstruction(lookback, "const v${candidate.registerA}, 0x0")
                    break
                }
                else -> lookback--
            }
        }
    }
}

@Suppress("unused")
val removeScreenshotRestrictionPatch = bytecodePatch(
    name = "Remove screenshot restriction",
    description = "Disables the FLAG_SECURE window flag in the PDF and EPUB readers so screenshots and screen recordings are allowed.",
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        pdfReaderOnCreateFingerprint.method.nullifySecureFlag()
        epubReaderOnCreateFingerprint.method.nullifySecureFlag()
    }
}