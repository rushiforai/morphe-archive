package patches.teletekst

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val hidePromotions = bytecodePatch(
    name = "Hide promotions",
    description = "Stops the recurring NOS-app promotion on the scoreboard page. Preserves Teletekst pages, favourites, sharing and refresh.",
) {
    dependsOn(originalInput)
    compatibleWith(teletekst)
    execute {
        val method = guarded("Lnl/nos/teletekst/voetbalscores/VoetbalscoresDialogController;", "dialogShouldBeShown(Ljava/lang/String;Z)Z", 2, 5, 23)
        val first = method.instructions.first()
        check(first.opcode == Opcode.CONST_STRING && ((first as ReferenceInstruction).reference as StringReference).string == "818")
        method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """.trimIndent())
    }
}
