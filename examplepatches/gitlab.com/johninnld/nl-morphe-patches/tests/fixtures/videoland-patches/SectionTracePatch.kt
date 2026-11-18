package patches.videolandatv

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact
import patches.shared.uniqueMatch

/** Selected only in the local diagnostic bundle. Never a functional dependency. */
@Suppress("unused")
val sectionTracePatch = bytecodePatch(name = "Observe availability sections (test only)", default = false) {
    compatibleWith(videolandTv)
    dependsOn(hideUnavailableContentPatch)
    execute {
        val helper = "Lpatches/videoland/SectionTrace;"
        val block = "Lcom/bedrockstreaming/component/layout/domain/core/model/Block;"
        val model = exact("Ld8/a;", "<init>(${block}Lw4/A1;I)V", 5, 13)
        model.addInstructions(3, "invoke-static {p1, p2}, $helper->raw(${block}Lw4/A1;)V")
        model.addInstructions(model.implementation!!.instructions.size - 1, "invoke-static {p0}, $helper->bound(Ljava/lang/Object;)V")
        exact("LQk/t;", "c()I", 2, 5).addInstructions(2, "invoke-static {p0, v0}, $helper->row(Ljava/lang/Object;I)V")
        Fingerprint(definingClass = "LNk/m;", name = "c", returnType = "I", parameters = emptyList()).uniqueMatch().method
            .addInstructions(0, "invoke-static {p0}, $helper->grid(Ljava/lang/Object;)V")
        val page = Fingerprint(definingClass = "Lw4/W1\$b\$c;", name = "<init>", returnType = "V",
            parameters = listOf("Ljava/util/List;", "Ljava/lang/Object;", "Ljava/lang/Object;", "I", "I")).uniqueMatch().method
        page.addInstructions(page.implementation!!.instructions.size - 1, "invoke-static {p0}, $helper->page(Ljava/lang/Object;)V")
    }
}
