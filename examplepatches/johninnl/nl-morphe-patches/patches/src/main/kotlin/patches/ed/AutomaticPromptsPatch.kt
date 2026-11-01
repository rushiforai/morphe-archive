package patches.ed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

/** All three callers automatically resolve section marketing, never manual login. */
internal val automaticSectionPrompts = bytecodePatch {
    dependsOn(originalInput)
    execute {
        change("Lcom/kubusapp/MainActivity;", "E(Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Llmg;)Ljava/lang/Object;", UNIT)
    }
}

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressEmbeddedPersonalisationNotice() {
    val notice = exact("Lcw7;", "c(IIILyg3;Lv07;)V").method
    check(notice.implementation!!.registerCount == 36) { "ED consent notice register layout changed" }
    notice.addInstructionsWithLabels(0, """
        move/from16 v0, p0
        const v1, 0x7f1400ed
        if-ne v0, v1, :originalNotice
        return-void
    """.trimIndent(), ExternalLabel("originalNotice", notice.getInstruction(0)))
}
