package patches.cronometer

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.resourcePatch
import patches.shared.originalInput as sharedOriginalInput

internal val cronometer = Compatibility(
    name = "Cronometer",
    packageName = "com.cronometer.android.gold",
    apkFileType = ApkFileType.APKM,
    signatures = setOf("38b7962018712892b37e45d7a4ba1228cd9893733260cf799f99f3e34c643052"),
    targets = listOf(
        AppTarget(
            version = "4.57.2",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 3399),
            minSdk = 26,
        ),
    ),
)

internal val originalInput = sharedOriginalInput(cronometer)

/** Validate the arm64 Dart AOT image before any native edit is computed. */
internal val nativeInput = resourcePatch {
    dependsOn(originalInput)
    execute {
        val packaged = listApkEntries("lib").filter { it.endsWith("/libapp.so") }.toSet()
        val required = nativeAbis.map { "lib/$it/libapp.so" }.toSet()
        check(packaged.containsAll(required)) { "Unexpected Cronometer ABI set: $packaged" }
        // Only the 64-bit images we edit are validated; 32-bit splits may ship too.
        validateNativeInputs(nativeAbis.associateWith { get("lib/$it/libapp.so").readBytes() })
    }
}
