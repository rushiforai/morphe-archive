package app.discord.patches.banner

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object DiscordConstants {
    // Self-locating patches: the targets are discovered in the bundle at
    // patch time (string co-occurrence + shape validation). A NULL
    // version means any com.discord build; an unrecognized bundle fails
    // loudly inside the patch instead of being skipped here.
    val COMPATIBILITY_DISCORD = Compatibility(
        name = "Discord",
        packageName = "com.discord",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x5865F2,
        targets = listOf(AppTarget(version = null)),
    )

    val COMPATIBILITY_DISCORD_COMPOSER = Compatibility(
        name = "Discord",
        packageName = "com.discord",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x5865F2,
        targets = listOf(AppTarget(version = null)),
    )
}
