package io.github.sabopura.morphe.patches.googlenews

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val GOOGLE_NEWS_PACKAGE = "com.google.android.apps.magazines"

    val GOOGLE_NEWS = Compatibility(
        name = "Google News",
        packageName = GOOGLE_NEWS_PACKAGE,
        description = "Official Google News app; anchors are un-obfuscated activity, provider and GMS strings.",
        appIconColor = 0x4285F4,
        signatures = setOf(
            // Original and rotated (API 33+) Google signing certificates.
            "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83",
            "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053",
        ),
        targets = listOf(
            AppTarget(
                version = "5.170.0.999208975",
                minSdk = 24,
                description = "Patched with all three patches and the modified methods and manifest checked in the output; launched to its home screen on API 36 (the emulator then exits while the feed loads, also with the stock app). This version no longer has NSContentProvider.",
            ),
            AppTarget(
                version = "5.168.0.982359681",
                minSdk = 24,
                description = "Patched, installed and launched on API 36.",
            ),
        ),
    )
}
