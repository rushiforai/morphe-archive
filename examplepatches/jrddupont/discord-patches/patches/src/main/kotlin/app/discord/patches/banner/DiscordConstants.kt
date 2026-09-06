package app.discord.patches.banner

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object DiscordConstants {
    val COMPATIBILITY_DISCORD = Compatibility(
        name = "Discord",
        packageName = "com.discord",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x5865F2,
        targets = listOf(
            // QuestBar gate verified per version by Hermes disassembly.
            // Stable-only: stables pin by version name (fat multi-arch
            // bundles share one base versionCode each: 342016 and 343012
            // per APKMirror metadata).
            AppTarget(version = "343.12 - Stable"),
            AppTarget(version = "342.16 - Stable"),
            AppTarget(version = "341.13 - Stable"),
        ),
    )

    // Composer (gift button) targets: same three stables.
    val COMPATIBILITY_DISCORD_COMPOSER = Compatibility(
        name = "Discord",
        packageName = "com.discord",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x5865F2,
        targets = listOf(
            AppTarget(version = "343.12 - Stable"),
            AppTarget(version = "342.16 - Stable"),
            AppTarget(version = "341.13 - Stable"),
        ),
    )
}
