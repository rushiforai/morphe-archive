package app.bin0culars.patches.reddit.misc.backtoexit

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.FEED
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/DisableRefreshOnBackPatch;"

@Suppress("unused")
val disableRefreshOnBackPatch =
    patch(
        name = "Disable refresh on back to exit",
        description = "Pressing back on the home feed exits without scrolling to the top and reloading. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "disable_refresh_on_back",
                    section = FEED,
                    title = "Back exits without refreshing",
                    summary = "Pressing back on Home no longer scrolls to the top and reloads. Press back twice to leave Reddit.",
                    default = false,
                ),
            )

            val method = BackToExitFingerprint.method
            val matches = BackToExitFingerprint.instructionMatches

            val r5 = method.getInstruction<OneRegisterInstruction>(matches[4].index).registerA
            val r2 = method.getInstruction<OneRegisterInstruction>(matches[1].index).registerA

            val smali5 =
                """
                    invoke-static {v$r5}, $EXTENSION_CLASS->alwaysShowExitHint(Z)Z
                    move-result v$r5
                """.trimIndent()

            val smali2 =
                """
                    invoke-static {v$r2}, $EXTENSION_CLASS->feedScrolled(Z)Z
                    move-result v$r2
                """.trimIndent()

            method.addInstructions(matches[4].index + 1, smali5)
            method.addInstructions(matches[1].index + 1, smali2)
        }
    }
