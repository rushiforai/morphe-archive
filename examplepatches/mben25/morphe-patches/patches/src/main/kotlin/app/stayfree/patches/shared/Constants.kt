package app.stayfree.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Verified against `stayfree/rea/android/StayFree_20.20.0.apk` (versionCode 202000504), a
     * universal APK merged from the xapk. Notes below were measured on 20.18.2
     * (`apps/stayfree/20.18.2.xapk`, base + `config.arm64_v8a` + `config.xxhdpi`).
     *
     * The Play/Aurora base APK alone will not install on Android 14+: it declares
     * `android:requiredSplitTypes="base__abi,base__density"` while shipping no native
     * libraries, so the installer fails with `INSTALL_FAILED_NO_MATCHING_ABIS` (res=-113).
     * Merging the splits strips that attribute and bundles `lib/arm64-v8a/`. Always patch
     * the merged APK, never the bare base.
     *
     * The merger must carry the **density** split too, not just the ABI one. 149 drawables
     * (`ic_hidden_apps` = `0x7f080237`, …) exist only in `config.xxhdpi`; the base table
     * declares 747 of them, the merged table 896. A merge that drops the density split
     * installs and launches fine, then throws
     * `Resources$NotFoundException: Resource ID #0x7f080237` from `Context.getDrawable()`
     * the moment a screen reaches one of those icons. Web converters (xapktoapk.com) and
     * ABI-only mergers produce exactly that. Verify after merging:
     *
     * ```
     * aapt2 dump resources merged.apk | grep -c 'drawable/'          # expect 896, not 747
     * aapt2 dump resources merged.apk | grep -oE '^    resource 0x7f[0-9a-f]{6}' \
     *   | awk '{print $2}' | sort | uniq -d                          # must print nothing
     * ```
     *
     * Declared as XAPK so Morphe Manager asks for the bundle and merges it itself (ARSCLib
     * `ApkBundle.mergeModules`, as kveld/HushFacebook rely on). Run on this xapk, that merge
     * keeps all 896 drawables, `lib/arm64-v8a/` and every `META-INF/services` file, whereas a
     * pre-merged APK picked by hand is saved by the Manager as the "original" and reused on
     * every repatch, missing files and all.
     */
    val COMPATIBILITY_STAYFREE = Compatibility(
        name = "StayFree",
        packageName = "com.burockgames.timeclocker",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x4E7CFF,
        targets = listOf(
            AppTarget(
                version = "20.20.0",
                description = "Download com.burockgames.timeclocker v20.20.0 (XAPK bundle) from APKPure",
            ),
        ),
    )
}
