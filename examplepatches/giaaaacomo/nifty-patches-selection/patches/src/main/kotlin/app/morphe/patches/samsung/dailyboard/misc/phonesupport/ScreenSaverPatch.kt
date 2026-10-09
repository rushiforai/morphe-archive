/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.misc.phonesupport

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.samsung.dailyboard.misc.extension.sharedExtensionPatch
import app.morphe.patches.samsung.dailyboard.shared.Constants.COMPATIBILITY_DAILY_BOARD
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val ANGLE_GATE_RECOVERY_RECEIVER =
    "app.morphe.extension.samsung.dailyboard.AngleGateRecoveryReceiver"
private const val DREAM_ANGLE_EXTENSION =
    "Lapp/morphe/extension/samsung/dailyboard/DreamAnglePatch;"
private const val DREAM_SETTINGS_EXTENSION =
    "Lapp/morphe/extension/samsung/dailyboard/DreamSettingsPatch;"
private const val ORIENTATION_EXTENSION =
    "Lapp/morphe/extension/samsung/dailyboard/OrientationPatch;"

private val customizeDailyBoardResourcesPatch = resourcePatch {
    dependsOn(enableDailyBoardOnPhonesPatch)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val recoveryReceiver = document.createElement("receiver").apply {
                setAttribute("android:name", ANGLE_GATE_RECOVERY_RECEIVER)
                setAttribute("android:enabled", "true")
                setAttribute("android:exported", "false")
            }
            val recoveryFilter = document.createElement("intent-filter")
            arrayOf(
                "android.intent.action.MY_PACKAGE_REPLACED",
                "android.intent.action.USER_PRESENT",
                "android.intent.action.ACTION_POWER_CONNECTED",
                "android.intent.action.ACTION_POWER_DISCONNECTED",
            ).forEach { actionName ->
                recoveryFilter.appendChild(document.createElement("action").apply {
                    setAttribute("android:name", actionName)
                })
            }
            recoveryReceiver.appendChild(recoveryFilter)
            application.appendChild(recoveryReceiver)
        }

        fun replaceStrings(path: String, replacements: Map<String, String>) {
            val missing = replacements.keys.toMutableSet()
            document(path).use { document ->
                val strings = document.getElementsByTagName("string")
                for (index in 0 until strings.length) {
                    val string = strings.item(index) as? Element ?: continue
                    val name = string.getAttribute("name")
                    val replacement = replacements[name] ?: continue
                    string.textContent = replacement
                    missing.remove(name)
                }
            }
            if (missing.isNotEmpty()) {
                throw PatchException("Daily Board strings were not found in $path: $missing")
            }
        }

        replaceStrings(
            "res/values/strings.xml",
            mapOf(
                "how_to_open_daily_board" to "Activation mode",
                "charge_battery_or_tap_icon" to "App, notification, and charging",
                "charge_battery_or_tap_icon_sub_text" to
                    "Open it from the app icon or charging notification; charging options can start it automatically.",
                "set_angle_for_auto_start" to "Limit start by angle",
                "set_your_tablet" to
                    "Set the phone at an angle to configure the automatic start range.",
                "same_as_screen_saver" to "Android screen saver",
                "show_a_screen_saver" to
                    "Android starts it after the screen timeout while charging, when the configured angle allows it.",
            )
        )
        replaceStrings(
            "res/values-it/strings.xml",
            mapOf(
                "how_to_open_daily_board" to "Modalità di attivazione",
                "charge_battery_or_tap_icon" to "App, notifica e ricarica",
                "charge_battery_or_tap_icon_sub_text" to
                    "Aprila dall'icona o dalla notifica di ricarica; le opzioni di ricarica possono avviarla automaticamente.",
                "set_angle_for_auto_start" to "Limita l'avvio per inclinazione",
                "set_your_tablet" to
                    "Posiziona il telefono all'angolo da usare per l'intervallo di avvio automatico.",
                "same_as_screen_saver" to "Screensaver di Android",
                "show_a_screen_saver" to
                    "Android la avvia dopo il timeout dello schermo durante la ricarica, se l'inclinazione configurata lo consente.",
            )
        )
    }
}

@Suppress("unused")
val dailyBoardScreenSaverPatch = bytecodePatch(
    name = "Customize screen saver",
    description = "Adds screen saver angle filtering, diagnostics and optional Android screen saver setting control. Includes Enable phone support.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DAILY_BOARD)
    dependsOn(enableDailyBoardOnPhonesPatch, sharedExtensionPatch, customizeDailyBoardResourcesPatch)

    execute {
        SecureSettingsWriteFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $DREAM_SETTINGS_EXTENSION->enable(Landroid/content/Context;)V
                return-void
            """
        )
        DisableDreamSettingsWriteFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $DREAM_SETTINGS_EXTENSION->disable(Landroid/content/Context;)V
                return-void
            """
        )

        SettingsPreferencesFingerprint.method.apply {
            val preferencesLoadedIndex = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.name == "setPreferencesFromResource"
            }
            addInstructions(
                preferencesLoadedIndex + 1,
                "invoke-static { p0 }, $ORIENTATION_EXTENSION->installScreenSaverPreferences(Ljava/lang/Object;)V"
            )
        }
        SettingsPreferencesOnResumeFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $ORIENTATION_EXTENSION->refreshPreferences(Ljava/lang/Object;)V"
        )

        DreamServiceStartedFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0 }, $DREAM_ANGLE_EXTENSION->onDreamingStarted(Landroid/service/dreams/DreamService;)Z
                move-result v0
                if-nez v0, :dream_angle_allowed
                return-void

                :dream_angle_allowed
                nop
            """
        )
        DreamServiceStoppedFingerprint.method.addInstructionsWithLabels(
            0,
            "invoke-static { p0 }, $DREAM_ANGLE_EXTENSION->onDreamingStopped(Landroid/service/dreams/DreamService;)V"
        )

    }
}
