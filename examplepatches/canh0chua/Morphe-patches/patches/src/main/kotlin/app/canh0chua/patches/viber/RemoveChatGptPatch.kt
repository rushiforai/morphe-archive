package app.canh0chua.patches.viber

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.patch.bytecodePatch
import app.canh0chua.patches.shared.Constants.COMPATIBILITY_VIBER

object ChatGptFingerprint : Fingerprint(
    definingClass = "Lnj1/b;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lwh0/b;",
    parameters = listOf(
        "Lcom/viber/voip/api/URLSchemeHandlerActivity;",
        "Landroid/net/Uri;",
        "Landroid/os/Bundle;"
    )
)

val removeChatGptPatch = bytecodePatch(
    name = "Remove ChatGPT",
    description = "Disables the ChatGPT feature in Viber.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VIBER)
    execute {
        ChatGptFingerprint.method.addInstructions(
            0,
            "return-object p2"
        )
    }
}