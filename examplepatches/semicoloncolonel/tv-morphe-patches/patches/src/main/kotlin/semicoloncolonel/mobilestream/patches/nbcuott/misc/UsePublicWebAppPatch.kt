package semicoloncolonel.mobilestream.patches.nbcuott.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.nbcuott.shared.Constants

// MS NOW 7.10.2 for Android TV is a "beta" build of the shell. Its
// WebAppLauncher.getWebAppUrl() loads the web app address saved by the
// developer menu, or else lng_dev_url, a test build of the web app
// (lng3-dev.ms.now/androidtv/pr-912). The release build of the shell loads
// lng_prod_url, the public web app (lng3.ms.now/androidtv). The method now
// skips the saved address and reads lng_prod_url.

private const val WEB_APP_LAUNCHER = "Lcom/versant/androidottweb/web/WebAppLauncher;"

@Suppress("unused")
val usePublicWebAppPatch = bytecodePatch(
    name = "Use the public web app",
    description = "Loads the public MS NOW web app. This build of the app loads a test version of it.",
) {
    category("Playback")
    compatibleWith(Constants.MS_NOW)

    execute {
        val method = mutableClassDefBy(WEB_APP_LAUNCHER).methods.singleOrNull {
            it.name == "getWebAppUrl" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Use the public web app: getWebAppUrl() not found")

        val instructions = method.implementation!!.instructions.toList()
        val devUrl = instructions.indexOfFirst {
            it.opcode == Opcode.SGET && ((it as ReferenceInstruction).reference as FieldReference).name == "lng_dev_url"
        }
        if (devUrl < 0) throw PatchException("Use the public web app: lng_dev_url not read")
        val field = (instructions[devUrl] as ReferenceInstruction).reference as FieldReference
        val register = (instructions[devUrl] as OneRegisterInstruction).registerA
        method.replaceInstruction(devUrl, "sget v$register, ${field.definingClass}->lng_prod_url:I")

        // The fallback branch starts with the MainApplication.Companion read
        // right before the context lookup; jump there from the start.
        val fallback = instructions.subList(0, devUrl).indexOfLast { it.opcode == Opcode.SGET_OBJECT }
        if (fallback < 0) throw PatchException("Use the public web app: fallback branch not found")
        method.addInstructionsWithLabels(0, "goto :msp_public", ExternalLabel("msp_public", method.getInstruction(fallback)))
    }
}
