/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.developeroptions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findInstructionIndicesReversed
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patches.shared.replyFlutterBool
import app.morphe.patches.shared.returnEarlyAll
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private val SETTINGS_CLASSES = listOf(
    "Landroid/provider/Settings\$Secure;",
    "Landroid/provider/Settings\$Global;",
)

@Suppress("unused")
val disableDeveloperOptionsPatch = patch(
    name = "Disable developer options detection",
    description = "Stops the app from detecting Developer Options, USB debugging or " +
            "debuggable flags, removing the blocking security dialog.",
    default = true,
) {
    category("Security")
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        // Zero Settings.Secure/Global.getInt() results in MainActivity's channel dispatcher.
        runCatching {
            val method = Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/MainActivity;",
                returnType = "V",
                strings = listOf("development_settings_enabled"),
            ).method

            SETTINGS_CLASSES.forEach { settingsClass ->
                method.findInstructionIndicesReversed(
                    methodCall(definingClass = settingsClass, name = "getInt"),
                ).forEach { callIdx ->
                    val moveIdx = method.indexOfFirstInstruction(callIdx + 1, Opcode.MOVE_RESULT)
                    if (moveIdx >= 0) {
                        val reg = method.getInstruction<OneRegisterInstruction>(moveIdx).registerA
                        method.addInstruction(moveIdx + 1, "const/16 v$reg, 0x0")
                    }
                }
            }
        }

        // Neutralize boolean checks across DevelopmentModeCheck, RootCheckerPlus, and MainActivity.
        mutableClassDefByOrNull("Lcom/xamdesign/safe_device/DevelopmentMode/DevelopmentModeCheck;")
            ?.returnEarlyAll(false)

        mutableClassDefByOrNull("Lcom/example/root_checker_plus/RootCheckerPlusPlugin;")
            ?.methods?.firstOrNull { it.name == "isDeveloperMode" }?.returnEarly(false)

        mutableClassDefByOrNull("Lcom/example/ooredoo_selfcare_algeria/MainActivity;")
            ?.returnEarlyAll(false) { it.returnType == "Z" && (it.name == "isDebug" || it.name == "a") }

        mutableClassDefByOrNull("Lcom/emrys/rjsniffer/rjsniffer/RjsnifferPlugin;")
            ?.methods?.firstOrNull { it.name == "onMethodCall" }?.replyFlutterBool(false)
    }
}
