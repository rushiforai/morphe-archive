package patches.eclipse

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

/** One universal APK; every symbol the car patches use is locked to this exact build. */
internal val eclipse = Compatibility(
    name = "Eclipse Music", packageName = "com.eclipse.android", apkFileType = ApkFileType.APK,
    signatures = setOf("18f904b5a1904154ebad737952edb8b951cd51b2e7b34920d63f82dba4a0142d"),
    targets = listOf(AppTarget(version = "0.6.75", versionCode = 155, minSdk = 26)),
)

internal val originalInput = patches.shared.originalInput(eclipse)

/** Every Eclipse Music mutation needs the pinned original input; the package is still re-signed. */
internal val eclipseBase = bytecodePatch {
    dependsOn(originalInput)
}
