// patches/src/main/kotlin/app/w3s/patches/w3schools/shared/Constants.kt
package app.w3s.patches.w3schools.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val W3S_PACKAGE_NAME = "com.w3schools.app.prod"
    const val W3S_SIGNATURE_SHA256 = "bc4474ff6fc461207f02a711092d7eb0d3f92adfb08775394b4fb615b0263ad4"
    const val W3S_SIGNATURE_SHA1 = "30e99cb56f09534acd558f3427bbd15e57dc0db1"

    val COMPATIBILITY_W3SCHOOLS = Compatibility(
        packageName = W3S_PACKAGE_NAME,
        name = "W3Schools",
        description = "Learn to code with W3Schools.",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x04AA6D,
        signatures = setOf(W3S_SIGNATURE_SHA256),
        targets = listOf(
            AppTarget(version = null),
        ),
    )
}
