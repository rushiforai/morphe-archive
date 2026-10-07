package app.twoeno.patches.kleinanzeigen.pur

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import app.twoeno.patches.shared.Constants.COMPATIBILITY_KLEINANZEIGEN
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.parameterRegister

private const val REMOTE_CONFIG_CLASS = "Lebk/data/remote/remote_config/RemoteConfigImpl;"
private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/kleinanzeigen/HidePurPatch;"

@Suppress("unused")
val hidePurPatch = bytecodePatch(
    name = "Hide Pur",
    description = "Hides the offers of the ad free subscription \"Kleinanzeigen Pur\".",
) {
    compatibleWith(COMPATIBILITY_KLEINANZEIGEN)

    extendWith(EXTENSION)

    execute {
        val remoteConfig = mutableClassDefByOrNull(REMOTE_CONFIG_CLASS)
            ?: throw PatchException("Could not find $REMOTE_CONFIG_CLASS")

        // Every getBoolean(flag, ...) overload. Suspending overloads return a boxed Boolean as Object.
        val getters = remoteConfig.methods.filter { method ->
            method.name == "getBoolean" &&
                method.implementation != null &&
                method.parameterTypes.firstOrNull()?.startsWith("L") == true &&
                method.returnType in setOf("Z", "Ljava/lang/Boolean;", "Ljava/lang/Object;")
        }
        if (getters.isEmpty()) throw PatchException("Could not find RemoteConfigImpl.getBoolean")

        getters.forEach { method ->
            val flagRegister = method.parameterRegister(0)
            val register = method.findFreeRegister(0, flagRegister)
            val returnFalse = if (method.returnType == "Z") {
                """
                    const/4 v$register, 0x0
                    return v$register
                """
            } else {
                """
                    sget-object v$register, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v$register
                """
            }

            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { v$flagRegister .. v$flagRegister }, $EXTENSION_CLASS->isPurFlag(Ljava/lang/Object;)Z
                    move-result v$register
                    if-eqz v$register, :original
                """ + returnFalse,
                ExternalLabel("original", method.getInstruction(0)),
            )
        }
    }
}
