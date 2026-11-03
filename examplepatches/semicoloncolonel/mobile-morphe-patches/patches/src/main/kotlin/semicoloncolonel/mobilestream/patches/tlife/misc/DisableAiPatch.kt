package semicoloncolonel.mobilestream.patches.tlife.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.tlife.shared.Constants

// T-Life 12.3.1 shows its AI assistant wherever a screen's state reports
// the chatbot as enabled. Every such getter now reports it as off.

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off the T-Life AI assistant. Support by phone and in stores is not " +
        "affected. Opt-in; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod(
            { it.type.startsWith("Lcom/telekom/") || it.type.startsWith("Lcom/tmobile/") },
            { method ->
                method.name in setOf("getEnableChatBot", "isChatBotEnabled") &&
                    method.parameterTypes.isEmpty() &&
                    !AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
                    (method.returnType == "Z" || method.returnType == "Ljava/lang/Boolean;") &&
                    (method.implementation?.registerCount ?: 0) >= 2
            },
        ) { method ->
            method.returnEarly(
                if (method.returnType == "Z") "const/4 v0, 0x0\nreturn v0"
                else "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0",
            )
        }
        if (count == 0) throw PatchException("T-Life chatbot getters not found")
    }
}
