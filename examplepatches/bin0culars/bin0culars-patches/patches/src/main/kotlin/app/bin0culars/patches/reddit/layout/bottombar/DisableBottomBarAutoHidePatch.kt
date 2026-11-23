package app.bin0culars.patches.reddit.layout.bottombar

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.NAVIGATION
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/DisableBottomBarAutoHidePatch;"

@Suppress("unused")
val disableBottomBarAutoHidePatch =
    patch(
        name = "Disable bottom bar auto-hide",
        description = "Keeps the bottom navigation bar visible while scrolling. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "disable_bottom_bar_auto_hide",
                    section = NAVIGATION,
                    title = "Keep bottom bar visible",
                    summary = "Stops the bottom navigation bar from sliding away when you scroll.",
                    default = false,
                ),
            )

            val smali =
                """
                    invoke-static {p1}, $EXTENSION_CLASS->barFraction(F)F
                    move-result p1
                """.trimIndent()

            BottomBarStateChangeFingerprint.method.addInstructions(0, smali)
        }
    }
