package app.canh0chua.patches.viber

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.patch.bytecodePatch
import app.canh0chua.patches.shared.Constants.COMPATIBILITY_VIBER

object AiNewsFingerprint : Fingerprint(
    definingClass = "Lz41/a;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Z"
    )
)

val removeAiNewsPatch = bytecodePatch(
    name = "Remove AI News",
    description = "Disables the AI News feature in Viber.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VIBER)
    execute {
        AiNewsFingerprint.method.addInstructions(
            0,
            "return-void"
        )
    }
}