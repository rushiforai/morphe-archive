package semicoloncolonel.mobilestream.patches.newsbreak.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants

// NewsBreak 26.44.1 — AI features.
//
// "Disable NewsBreak AI" turns off the two AI assistants:
// - Nia, the AI chat behind the toolbar button, the home channel, the
//   profile entry, and AI answers in search. The app's on/off check now
//   says off, so its entry points are not shown and its SDK is not started.
// - Scout, the reading assistant that adds "Ask" rows and a side tab to
//   articles. It is not attached, the same as when the app's remote flag
//   turns it off.
//
// "Hide AI summaries" hides the AI-written summary card on crime and
// local-alert pages. That card is the incident description itself, so the
// page keeps its title and transcript but loses the summary.

private const val DETAIL = "Lcom/particlemedia/feature/nativedetail/"
private const val NEWS = "Lcom/particlemedia/data/News;"

internal object NiaEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/particlemedia/feature/nia/ui/NiaHelper;",
    name = "enableNia",
    returnType = "Z",
)

internal object ScoutAttachFingerprint : Fingerprint(
    definingClass = "Lcom/particlemedia/feature/scout/article/ScoutArticleEntries\$Companion;",
    name = "attach",
    returnType = "Lcom/particlemedia/feature/scout/article/ScoutArticleEntries;",
)

internal object ScoutDocInfoFingerprint : Fingerprint(
    definingClass = "Lcom/particlemedia/feature/scout/data/ScoutDocInfo\$Companion;",
    name = "parse",
    returnType = "Lcom/particlemedia/feature/scout/data/ScoutDocInfo;",
)

internal object AiSummaryBindFingerprint : Fingerprint(
    definingClass = "${DETAIL}NativeDetailAiSummaryVH;",
    name = "bind",
    returnType = "V",
    parameters = listOf(NEWS),
)

internal object AiSummaryMetaBindFingerprint : Fingerprint(
    definingClass = "${DETAIL}NativeDetailAiSummaryMetaVH;",
    name = "bind",
    returnType = "V",
    parameters = listOf(NEWS),
)

internal object AiSummaryNoteBindFingerprint : Fingerprint(
    definingClass = "${DETAIL}NativeDetailAiSummaryNoteVH;",
    name = "bind",
    returnType = "V",
    parameters = listOf(NEWS),
)

@Suppress("unused")
val disableNewsBreakAiPatch = bytecodePatch(
    name = "Disable NewsBreak AI",
    description = "Turns off the Nia AI chat and the Scout reading assistant.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        NiaEnabledFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        ScoutAttachFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        ScoutDocInfoFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}

@Suppress("unused")
val hideAiSummariesPatch = bytecodePatch(
    name = "Hide AI summaries",
    description = "Hides the AI-written summary card on crime and local-alert pages.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // The view holder hides its own row (itemView GONE) when it has no
        // data. Reuse that field reference; RecyclerView is renamed per build.
        val itemView = AiSummaryBindFingerprint.method.implementation!!.instructions
            .firstNotNullOfOrNull {
                if (it.opcode != Opcode.IGET_OBJECT) return@firstNotNullOfOrNull null
                ((it as ReferenceInstruction).reference as FieldReference).takeIf { ref ->
                    ref.name == "itemView" && ref.type == "Landroid/view/View;"
                }
            } ?: throw PatchException("itemView not found in the AI summary view holder")
        val field = "${itemView.definingClass}->itemView:Landroid/view/View;"

        fun MutableMethod.hideRow() = addInstructions(
            0,
            """
                iget-object v0, p0, $field
                const/16 v1, 0x8
                invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
                return-void
            """,
        )

        AiSummaryBindFingerprint.method.hideRow()
        AiSummaryMetaBindFingerprint.methodOrNull?.hideRow()
        AiSummaryNoteBindFingerprint.methodOrNull?.hideRow()
    }
}
