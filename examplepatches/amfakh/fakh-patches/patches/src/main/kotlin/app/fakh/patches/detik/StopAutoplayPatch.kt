package app.fakh.patches.detik

import app.fakh.patches.detik.shared.Constants.COMPATIBILITY_DETIK
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** The getter of the article body HTML, read by the row that renders it. */
private object ArticleContentFingerprint : Fingerprint(
    definingClass = "Lorg/detikcom/rss/data/model/item/detail_article/DetailContent;",
    name = "getContent",
    returnType = "Ljava/lang/String;",
)

@Suppress("unused")
val stopAutoplayPatch = bytecodePatch(
    name = "Stop autoplay",
    description = "Stops the videos and live streams embedded in articles from playing on their own. They play when tapped.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DETIK)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        val getter = ArticleContentFingerprint.method
        val index = getter.instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
        val register = (getter.instructions.elementAt(index) as OneRegisterInstruction).registerA
        getter.addInstructions(
            index,
            """
                invoke-static { v$register }, Lapp/fakh/extension/detik/StopAutoplay;->content(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
            """,
        )
    }
}
