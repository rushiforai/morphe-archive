package io.github.jordanwoodson.patches.twitch.updates

import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.addInstructionsIfEnabled
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val KEY = "block_update_prompts"

@Suppress("unused")
val blockUpdatePromptsPatch = bytecodePatch(
    name = "Block update prompts",
    description = "Stops Twitch from asking for or requiring an app update through its remote forced-updates " +
        "setting. A patched Twitch can't be updated from Google Play, so update by patching a newer version. " +
        "On by default. Turn it off in Lurk settings > Interface.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        // No version Google Play offers may be prompted for, and the installed one never needs an upgrade.
        listOf(UpdateAllowedFingerprint to "update allowed check", UpdateRequiredFingerprint to "update required check")
            .forEach { (fingerprint, what) ->
                fingerprint.twitchMatch(what).method.addInstructionsIfEnabled(KEY, """
                    const/4 v0, 0x0
                    return v0
                """)
            }

        twitchSettings.add(SwitchSetting(KEY, "Block update prompts",
            "Twitch's \"New Update Ready to Install\" prompt and \"App Update Required\" screen.",
            Section.INTERFACE, default = true, restart = true))
    }
}
