package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

// Every Mask live ad breaks and Mask ads cover takes its text from
// AdBreakText, which picks a translation by the device's language once
// translate() returns true. Each Mask patch carries a "translate" option, off
// by default, that flips it on through enableAdBreakTranslation().
internal object AdBreakTranslateFingerprint : Fingerprint(
    definingClass = "Lsemicoloncolonel/mobilestream/extension/shared/misc/AdBreakText;",
    name = "translate",
    returnType = "Z",
)

// Shared text for the "translate" option so every Mask patch reads the same.
internal const val TRANSLATE_OPTION_TITLE = "Show it in your language"
internal const val TRANSLATE_OPTION_DESCRIPTION =
    "Experimental. Shows the ad break cover in your device's language when it is Arabic, Chinese, French, " +
        "German, Greek, Italian, Korean, Portuguese, Russian, Spanish, Tagalog, or Vietnamese. " +
        "Other languages show English. The translations come from a translation service, so some may read " +
        "awkwardly. Please submit corrections or rewrites through GitHub issues."

// Flip AdBreakText.translate() to return true. A Mask patch calls this when its
// "translate" option is on. The caller must have merged the extension
// (extendWith("extensions/extension.mpe")) so AdBreakText is present. Idempotent:
// an APK carries only one app's Mask patch, but should two run in one patch,
// the method is flipped at most once.
internal fun enableAdBreakTranslation() {
    val method = AdBreakTranslateFingerprint.method
    val first = method.implementation?.instructions?.firstOrNull()
    if (first != null && first.opcode == Opcode.CONST_4 &&
        (first as? NarrowLiteralInstruction)?.narrowLiteral == 1
    ) {
        return // already flipped in this patch run
    }
    method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """,
    )
}
