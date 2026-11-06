package io.github.xxlc.patches.grok

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

@Suppress("unused")
val bypassLicenseCheckPatch = bytecodePatch(
    name = "Bypass license check",
    description = "Bỏ qua kiểm tra giấy phép Pairip khi khởi động Grok.",
    default = true,
) {
    compatibleWith(grokCompatibility)

    execute {
        LicenseCheckFingerprint.method.returnEarly()
    }
}
