package app.bin0culars.patches.reddit.misc.autorefresh

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.FEED
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/DisableAutoRefreshPatch;"

@Suppress("unused")
val disableAutoRefreshPatch =
    patch(
        name = "Disable home feed auto-refresh",
        description = "Stops the home feed from reloading and jumping to the top when you come back to the app. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "disable_home_auto_refresh",
                    section = FEED,
                    title = "Disable home feed auto-refresh",
                    summary = "Coming back after a while no longer reloads your feed and jumps to the top. The New posts button still lets you refresh by hand.",
                    default = false,
                ),
            )

            val method = AutoRefreshFeedFingerprint.method
            val matches = AutoRefreshFeedFingerprint.instructionMatches
            val newIndex = matches[0].index
            val sendIndex = matches[2].index

            val reg = method.getInstruction<OneRegisterInstruction>(newIndex).registerA
            val skipTarget = method.getInstruction(sendIndex + 1)

            val smali =
                """
                    invoke-static {}, $EXTENSION_CLASS->isEnabled()Z
                    move-result v$reg
                    if-nez v$reg, :skip_auto_refresh
                """.trimIndent()

            method.addInstructionsWithLabels(
                newIndex,
                smali,
                ExternalLabel("skip_auto_refresh", skipTarget),
            )
        }
    }
