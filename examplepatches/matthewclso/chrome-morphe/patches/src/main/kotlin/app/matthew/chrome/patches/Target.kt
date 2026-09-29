package app.matthew.chrome.patches

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi

internal const val ORIGINAL_PACKAGE = "com.android.chrome"
internal const val TEST_PACKAGE = "app.matthew.chrome.test"
internal const val TARGET_VERSION = "153.0.8010.53"
internal const val TARGET_VERSION_CODE = "801005304"

internal val chromeCompatibility = Compatibility(
    name = "Chrome",
    packageName = ORIGINAL_PACKAGE,
    targets = listOf(AppTarget(
        version = TARGET_VERSION,
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to TARGET_VERSION_CODE.toInt()),
        isExperimental = false,
    )),
)

internal fun requireTarget(metadata: PackageMetadata) {
    if (metadata.packageName != ORIGINAL_PACKAGE ||
        metadata.versionName != TARGET_VERSION ||
        metadata.versionCode != TARGET_VERSION_CODE) {
        throw PatchException("Expected original $ORIGINAL_PACKAGE $TARGET_VERSION ($TARGET_VERSION_CODE). " +
            "Refusing ${metadata.packageName} ${metadata.versionName} (${metadata.versionCode}).")
    }
}
