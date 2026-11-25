package patches.beachbuggy

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.originalInput

internal val beachBuggy = Compatibility(
    name = "Beach Buggy Racing", packageName = "com.vectorunit.purple.googleplay",
    apkFileType = ApkFileType.APKM,
    signatures = setOf("66b46a40a5647e9e514daaad03eb9467601c7329414f6a146db485a86ea4d124"),
    targets = listOf(AppTarget(version = "2026.11.02", versionCode = 220, minSdk = 24)),
)

internal val originalInput = originalInput(beachBuggy)
