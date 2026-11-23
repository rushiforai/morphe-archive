package app.template.patches.digisport.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "Hide promotions",
    description = "Hides cross-promotion articles and the live bar on Home.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        val type = apiArticleLayoutTypeFingerprint.method.let { "${it.definingClass}->${it.name}()Ljava/lang/String;" }

        // Smali that falls through only for a "widgetCross" widget (v1 = its ApiArticleLayout
        // capture) and branches to :not_cross otherwise.
        fun crossCheck(layoutField: String) = """
            iget-object v1, v0, $layoutField
            check-cast v1, $API_ARTICLE_LAYOUT
            invoke-virtual {v1}, $type
            move-result-object v1
            const-string v2, "$WIDGET_CROSS"
            invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :not_cross
        """

        // 1. A cross-promotion card (addArticleWidget's isCross) becomes a plain spacing section.
        // "Hide sponsored articles" adds its own self-contained check at the same index; either
        // order works.
        addWidgetSpacingGuard(articleWidgetLambdaFingerprint.method, spacingSectionFingerprint.method, "not_cross") { capture ->
            crossCheck(capture(API_ARTICLE_LAYOUT))
        }

        // 2. The cross-promotion widget adds no heading (it would stay above the spacers): the
        // widgetTitle case returns its Unit at once for a "widgetCross" widget.
        val title = widgetTitleLambdaFingerprint.method
        val titleAnchor = title.lastIndexOfString(WIDGET_TITLE_LAYOUT)
        val (titleSelector, titleCase) = title.caseOf(titleAnchor)
        val layout = title.capturedField(titleAnchor, API_ARTICLE_LAYOUT)
        val unit = title.returnedSingletonAfter(titleAnchor)
        title.addInstructionsWithLabelsChecked(
            0,
            casePrologue(title, titleSelector, titleCase, "not_cross") +
                crossCheck("${layout.definingClass}->${layout.name}:${layout.type}") + """
                sget-object v1, ${unit.definingClass}->${unit.name}:${unit.type}
                return-object v1
                :not_cross
                nop
            """,
        )

        // 3. Home: both reads of the exclusive-video count read 0, so the "has exclusive
        // promotion" flag is set false and the bar stays GONE (the rest of the method is kept).
        val home = homeExclusiveVideoFingerprint.method
        val counts = home.implementation!!.instructions.withIndex().filter { (_, insn) ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                ((insn as ReferenceInstruction).reference as MethodReference).let { it.definingClass == UI_EXCLUSIVE && it.returnType == "I" }
        }.map { it.index }
        if (counts.size != 2) throw PatchException("Hide promotions: expected 2 exclusive-count reads in ${home.name}, found ${counts.size}")
        counts.reversed().forEach { call ->
            val result = home.implementation!!.instructions.elementAt(call + 1)
            if (result.opcode != Opcode.MOVE_RESULT) throw PatchException("Hide promotions: no move-result after the count read")
            val register = (result as OneRegisterInstruction).registerA
            home.addInstructionChecked(call + 2, if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0")
        }
    }
}
