package app.template.patches.themezy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.cert.extractApkCertificatePatch
import app.template.patches.shared.firebase.spoofFirebaseCertHashPatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch

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
    name = "Unlock premium",
    description = "Unlocks premium content.",
    default = true,
) {
    compatibleWith(THEMEZY)

    dependsOn(
        disablePairipPatch,
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
    )
    execute {
        IconIsUnlocked.method.returnEarly(true)
        WallpaperIsUnlocked.method.returnEarly(true)
        WidgetIsUnlocked.method.returnEarly(true)
        DownloadEntityIsUnlocked.method.returnEarly(true)
    }
}
