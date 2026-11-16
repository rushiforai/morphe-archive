package io.github.jordanwoodson.patches.twitch.counts

import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.addInstructionsIfEnabled
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val KEY = "exact_counts"
private const val INTERFACE = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchInterface;"

@Suppress("unused")
val showExactCountsPatch = bytecodePatch(
    name = "Show exact counts",
    description = "Shows viewer and follower counts in full, such as 24,213 viewers instead of 24.2K, wherever " +
        "Twitch's own screens write them. The signed-in Home feed, which is React Native, keeps its short counts. " +
        "Starts off. Turn it on in Lurk settings > Interface.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        // Every native count goes through NumberFormatUtil's compact format (count, long form).
        CompactCountFingerprint.twitchMatch("compact count").method.apply {
            val count = parameterRegister(0)
            addInstructionsIfEnabled(KEY, """
                ${invokeStatic("$INTERFACE->exactCount(J)Ljava/lang/String;", count, count + 1)}
                move-result-object v0
                return-object v0
            """)
        }

        twitchSettings.add(SwitchSetting(KEY, "Show exact counts",
            "Viewers and followers in full, such as 24,213 instead of 24.2K.", Section.INTERFACE, default = false))
    }
}
