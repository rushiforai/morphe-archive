package app.onlynazril.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * One entry per app this bundle carries patches for, named after that app's directory under
 * `patches/` — `patches/tiktok/handle` uses [COMPATIBILITY_TIKTOK].
 *
 * Worth knowing when adding one:
 * - `name` is the app name as it appears in the launcher, `packageName` is the store id.
 * - `apkFileType` is the file type the patches are developed against.
 * - `appIconColor` is the icon colour in Morphe Manager, usually the icon background colour.
 * - `targets` lists the versions the patches were confirmed against. Prefer versions available on
 *   apkmirror.com or uptodown.com: Manager's web search sends users to those sites, and a version
 *   missing from both sends users to a plain web search instead.
 * - `AppTarget(version = null, isExperimental = true)` means "any version, untested".
 * - `versionCodes` is needed only when several ABI releases share one version name but just one of
 *   them works or has been tested, e.g. `SupportedAbi.ARM64_V8A to …`.
 * - `description` is what Manager shows for that app. Keep it about this app; the bundle-wide
 *   description lives in `patches/build.gradle.kts`.
 */
object Constants {
    val COMPATIBILITY_TIKTOK = Compatibility(
        name = "TikTok",
        packageName = "com.zhiliaoapp.musically",
        description = "Handle, region and post time next to names, on the feed and in comments.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFE2C55,
        targets = listOf(
            AppTarget(version = "47.0.3"),
        ),
    )
}
