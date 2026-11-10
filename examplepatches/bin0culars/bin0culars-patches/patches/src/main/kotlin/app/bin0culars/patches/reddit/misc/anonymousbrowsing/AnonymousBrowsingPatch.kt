package app.bin0culars.patches.reddit.misc.anonymousbrowsing

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/AnonymousBrowsingPatch;"

@Suppress("unused")
val anonymousBrowsingPatch = patch(
    name = "Account switcher private mode",
    description = "Lets you choose whether the account switcher offers Anonymous Browsing or Incognito, even with one account. Choose in Settings → bin0culars mods.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    dependsOn(binocularsModsSettingsPatch)
    extendWith("extensions/extension.mpe")
    execute {
        addBinocularsModsSetting(
            BinocularsModsSetting(
                key = "account_switcher_private_mode",
                section = BinocularsModsSection.PRIVACY,
                title = "Account switcher private mode",
                summary = "Which private mode the account switcher offers. Reddit default lets Reddit decide. Takes effect the next time you open the account switcher.",
                choices = listOf(
                    BinocularsModsChoice("reddit", "Reddit default"),
                    BinocularsModsChoice("anonymous", "Anonymous Browsing"),
                    BinocularsModsChoice("incognito", "Incognito"),
                ),
                defaultChoice = "reddit",
            ),
        )

        IncognitoRevampEnabledFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->revampOverride()I
                move-result v0
                if-ltz v0, :original
                return v0
                :original
                nop
            """,
        )
    }
}
