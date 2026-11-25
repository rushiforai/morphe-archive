package app.stayfree.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Verified against `apps/stayfree/stayfree_20.17.0.apk` (versionCode 201700499) — the
     * universal APK merged from the Play split bundle (base + `config.arm64_v8a` +
     * density splits).
     *
     * The Play/Aurora base APK alone will not install on Android 14+: it declares
     * `android:requiredSplitTypes="base__abi,base__density"` while shipping no native
     * libraries, so the installer fails with `INSTALL_FAILED_NO_MATCHING_ABIS` (res=-113).
     * Merging the splits strips that attribute and bundles `lib/arm64-v8a/` (Flutter:
     * `libapp.so`, `libflutter.so`). Always patch the merged APK, never the bare base.
     */
    val COMPATIBILITY_STAYFREE = Compatibility(
        name = "StayFree",
        packageName = "com.burockgames.timeclocker",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4E7CFF,
        targets = listOf(
            AppTarget(version = "20.17.0"),
        ),
    )
}
