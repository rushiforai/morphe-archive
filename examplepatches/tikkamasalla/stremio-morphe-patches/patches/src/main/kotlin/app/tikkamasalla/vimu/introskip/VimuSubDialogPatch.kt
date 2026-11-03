package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val SUB_DIALOG = "Lnet/gtvbox/videoplayer/VimuSubDialog;"
private const val DOWNLOAD_ROW_ID = -999L

/**
 * Adds the addon subtitles Stremio passed as rows of Vimu's own subtitle menu.
 *
 * Two hooks that only work together: the dialog builder (A1) swaps the row array for one with an
 * "Addon: name (lang)" row per addon subtitle, and the click handler takes those rows before the
 * stock code sees an id it does not know. Both anchors are found before anything is written; when
 * either is missing the patch still applies and leaves the menu untouched (the auto-load of the
 * best same-language addon subtitle does not depend on it).
 */
val vimuSubDialogPatch = bytecodePatch(
    name = "Addon subtitles in subtitle menu (Vimu)",
    description = "Lists the addon subtitles from Stremio in Vimu's subtitle menu. Runs with the Intro Skip (Vimu) patch.",
    default = true,
) {
    compatibleWith(Constants.VIMU_COMPATIBILITY)
    extendWith("extensions/extension.mpe")
    dependsOn(vimuResultPatch)

    execute {
        try {
            val build = VimuSubDialogBuildFingerprint.method
            val click = VimuSubDialogClickFingerprint.method

            // Builder: the only A1 that creates the "download subtitles" row (id -0x3e7); the adapter
            // constructor gets the row count and the row array in v0 and v1.
            if (build.implementation!!.instructions.none { it.isLiteral(DOWNLOAD_ROW_ID, Opcode.CONST_16) }) {
                throw PatchException("download row not found in ${build.definingClass}->${build.name}")
            }
            val adapter = build.findInstruction(
                "adapter constructor",
                { it.opcode == Opcode.INVOKE_DIRECT && it.referenceString()?.contains("PlayerFragment\$b;-><init>") == true },
            )

            // Click handler: right after the id of the clicked row is read, before it is compared with -0x3e7.
            val instructions = click.implementation!!.instructions
            val rowId = (0 until instructions.size - 1).firstOrNull { i ->
                instructions[i].opcode == Opcode.IGET &&
                    instructions[i].referenceString()?.contains("Lz3/p\$c;->d:I") == true &&
                    instructions[i + 1].isLiteral(DOWNLOAD_ROW_ID, Opcode.CONST_16)
            } ?: throw PatchException("row id read not found in ${click.definingClass}->${click.name}")

            click.addInstructionsWithLabels(
                rowId + 1,
                """
                iget-object p4, p0, Lnet/gtvbox/videoplayer/PlayerFragment${'$'}q;->a:Lnet/gtvbox/videoplayer/PlayerFragment;
                invoke-static {p4, p1}, $SUB_DIALOG->select(Ljava/lang/Object;I)Z
                move-result p1
                if-eqz p1, :vimu_addon_row_stock
                iget-object p4, p0, Lnet/gtvbox/videoplayer/PlayerFragment${'$'}q;->a:Lnet/gtvbox/videoplayer/PlayerFragment;
                invoke-static {p4}, Lnet/gtvbox/videoplayer/PlayerFragment;->H0(Lnet/gtvbox/videoplayer/PlayerFragment;)V
                return-void
                :vimu_addon_row_stock
                iget p1, p2, Lz3/p${'$'}c;->d:I
                """.trimIndent(),
            )
            build.addInstructions(
                adapter,
                """
                invoke-static {p0, v1}, $SUB_DIALOG->rows(Ljava/lang/Object;[Lz3/p${'$'}c;)[Lz3/p${'$'}c;
                move-result-object v1
                array-length v0, v1
                add-int/lit8 v0, v0, -0x2
                """.trimIndent(),
            )
        } catch (error: Exception) {
            println("Vimu subtitle menu: addon rows skipped (${error.message}).")
        }
    }
}

private fun BuilderInstruction.isLiteral(value: Long, opcode: Opcode): Boolean =
    this.opcode == opcode && (this as? WideLiteralInstruction)?.wideLiteral == value

/** Index of the first instruction matching the predicate, or throws. */
private fun MutableMethod.findInstruction(
    what: String,
    predicate: (BuilderInstruction) -> Boolean,
): Int {
    val index = implementation!!.instructions.indexOfFirst(predicate)
    if (index < 0) throw PatchException("Vimu subtitle menu $what not found in $definingClass->$name.")
    return index
}

private fun BuilderInstruction.referenceString(): String? =
    (this as? ReferenceInstruction)?.reference?.toString()
