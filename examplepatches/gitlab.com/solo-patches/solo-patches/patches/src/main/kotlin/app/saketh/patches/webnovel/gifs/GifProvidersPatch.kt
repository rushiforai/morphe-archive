package app.saketh.patches.webnovel.gifs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.controls.hookAt
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import app.saketh.patches.webnovel.controls.registerFeature
import app.saketh.patches.webnovel.controls.whenEnabled
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val GIF_SEARCH = "Lapp/saketh/extension/gifs/GifSearch;"
private const val PRESENTER = "Lcom/qidian/QDReader/tenor/presenter/impl/GifSearchPresenter;"
private const val KLIPY_API = "Lcom/qidian/QDReader/tenor/presenter/impl/GifSearchPresenter\$KlipyGifApi;"
private const val SEARCH_FIELD = "Lcom/qidian/QDReader/widget/WInputWidget;"

/** Starts a comment GIF search: search(query, page, perPage, apiKey) on WebNovel's KLIPY client. */
private object GifSearchFingerprint : Fingerprint(
    definingClass = PRESENTER,
    returnType = "L",
    parameters = listOf("Ljava/lang/String;", "I", "Ljava/lang/String;", "Z"),
    filters = listOf(methodCall(definingClass = KLIPY_API, name = "search")),
)

/** Sets up the GIF picker's search field, including its "Search KLIPY" hint. */
private object GifSearchFieldFingerprint : Fingerprint(
    definingClass = "Lcom/qidian/QDReader/tenor/TenorGifDialog;",
    returnType = "V",
    parameters = listOf(SEARCH_FIELD),
)

@Suppress("unused")
val gifProvidersPatch = patch(
    name = "GIF search providers",
    description = "Adds a Patch controls choice between KLIPY, WebNovel's own GIF search, and GIPHY " +
        "with your own API key for the GIF picker in comments. Tenor is not offered: Google shut " +
        "its API down on June 30, 2026.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(patchControlsRuntime)

    execute {
        registerFeature("gif_providers")

        GifSearchFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val index = instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { method ->
                    method.definingClass == KLIPY_API && method.name == "search"
                } == true
            }
            // At the KLIPY request, the query, page and page size are final.
            val search = instructions[index] as FiveRegisterInstruction
            val append = "p${parameters.size}"
            whenEnabled(
                "giphy",
                """
                    invoke-static { p0, v${search.registerD}, v${search.registerE}, v${search.registerF}, $append }, $GIF_SEARCH->search(Ljava/lang/Object;Ljava/lang/String;IIZ)V
                    const/4 v${search.registerD}, 0x0
                    return-object v${search.registerD}
                """,
                index,
            )
        }

        GifSearchFieldFingerprint.method.apply {
            val end = implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            hookAt(
                end,
                """
                    invoke-virtual { p1 }, $SEARCH_FIELD->getEditText()Landroid/widget/EditText;
                    move-result-object v0
                    invoke-static { v0 }, $GIF_SEARCH->hint(Landroid/widget/EditText;)V
                """,
            )
        }
    }
}
