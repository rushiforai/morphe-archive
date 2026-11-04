package app.fakh.patches.cnn

import app.fakh.patches.cnn.shared.Constants.COMPATIBILITY_CNN
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/** The article fragment's page setup: it receives every page and shows one at a time with page numbers. */
private object ShowMultiplePageFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/indonesia/feature/fragment/FragmentContentMulti;",
    name = "showMultiplePage",
    returnType = "V",
)

@Suppress("unused")
val mergePagesPatch = bytecodePatch(
    name = "Merge article pages",
    description = "Shows every page of a multi-page article in one continuous article, without the page numbers.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CNN)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        val method = ShowMultiplePageFingerprint.method
        val last = method.instructions.last { it.opcode == Opcode.RETURN_VOID }.location.index
        // p1 = pages, p3 = images, p4 = total page count; with one merged page the app shows no page numbers.
        method.addInstructions(
            last,
            "invoke-virtual { p0 }, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;\n" +
                "move-result-object v0\n" +
                "invoke-static { v0 }, Lapp/fakh/extension/cnn/MergePages;->finish(Landroid/view/View;)V",
        )
        method.addInstructions(
            0,
            "invoke-static { p1, p3 }, Lapp/fakh/extension/cnn/MergePages;->merge(Ljava/util/ArrayList;Ljava/util/ArrayList;)V\n" +
                "const/4 p4, 0x1",
        )
    }
}
