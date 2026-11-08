package app.template.patches.themezy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

private val THEMEZY = Compatibility(
    name = "Themezy",
    packageName = "com.themezy.theme.iconwidgets",
    apkFileType = ApkFileType.APKS_REQUIRED,
    appIconColor = 0x7C4DFF,
    targets = listOf(AppTarget(version = "1.0.9", versionCode = 9)),
)

/**
 * Domain models and DB entity gate the Unlock button vs Add/Apply.
 * Forcing true removes every unlock button and unlock dialog.
 */
private object IconIsUnlocked : Fingerprint(
    definingClass = "Lcom/themezy/theme/iconwidgets/domain/model/Icon;",
    name = "isUnlocked",
    returnType = "Z",
    parameters = listOf(),
)

private object WallpaperIsUnlocked : Fingerprint(
    definingClass = "Lcom/themezy/theme/iconwidgets/domain/model/Wallpaper;",
    name = "isUnlocked",
    returnType = "Z",
    parameters = listOf(),
)

private object WidgetIsUnlocked : Fingerprint(
    definingClass = "Lcom/themezy/theme/iconwidgets/domain/model/Widget;",
    name = "isUnlocked",
    returnType = "Z",
    parameters = listOf(),
)

private object DownloadEntityIsUnlocked : Fingerprint(
    definingClass = "Lcom/themezy/theme/iconwidgets/data/local/database/entity/DownloadEntity;",
    name = "isUnlocked",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val unlockLocalPatch = bytecodePatch(
    name = "Unlock Local",
    description = "Marks icons, wallpapers and widgets as unlocked so only Add/Apply shows, never Unlock.",
    default = true,
) {
    compatibleWith(THEMEZY)

    execute {
        IconIsUnlocked.method.returnEarly(true)
        WallpaperIsUnlocked.method.returnEarly(true)
        WidgetIsUnlocked.method.returnEarly(true)
        DownloadEntityIsUnlocked.method.returnEarly(true)
    }
}
