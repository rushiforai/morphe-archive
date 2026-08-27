package app.canh0chua.patches.viber

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.patch.bytecodePatch
import app.canh0chua.patches.shared.Constants.COMPATIBILITY_VIBER

object AdsFreeFingerprint : Fingerprint(
    definingClass = "Lcom/viber/voip/feature/viberplus/presentation/settings/ViberPlusSettingsState;",
    name = "isAdsFree",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList()
)

val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Disables ads in Viber.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VIBER)
    execute {
        AdsFreeFingerprint.method.addInstructions(
            0,
            "const/4 v0, 0x1\nreturn v0"
        )
    }
}