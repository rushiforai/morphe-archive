package dev.twitchpatches.patches.twitch.diagnostics

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import dev.twitchpatches.patches.twitch.shared.TwitchTarget
import java.util.logging.Logger

@Suppress("unused") // Discovered reflectively by Morphe's patch loader.
val inspectBaselinePatch = bytecodePatch(
    name = "Inspect Twitch APK",
    description = "Reports package, version and DEX class count during patching. Does not change the app.",
    default = false,
) {
    compatibleWith(TwitchTarget.candidateCompatibility)

    execute {
        if (packageMetadata.packageName != TwitchTarget.PACKAGE_NAME) {
            throw PatchException("Expected ${TwitchTarget.PACKAGE_NAME}.")
        }
        var classCount = 0
        classDefForEach { classCount++ }
        if (classCount == 0) throw PatchException("Twitch baseline contains no DEX classes.")

        Logger.getLogger("TwitchPatches.Baseline").info(
            "Package=${packageMetadata.packageName}; version=${packageMetadata.versionName}; " +
                "versionCode=${packageMetadata.versionCode}; classes=$classCount.",
        )
    }
}
