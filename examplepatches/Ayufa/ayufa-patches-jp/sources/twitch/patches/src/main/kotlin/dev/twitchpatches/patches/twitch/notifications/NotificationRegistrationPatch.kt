package dev.twitchpatches.patches.twitch.notifications

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch

private object FirebaseInstallationsHeaderFingerprint : Fingerprint(
    strings = listOf("X-Android-Package", "X-Android-Cert", "x-goog-api-key"),
)

internal val notificationRegistrationPatch = bytecodePatch {
    execute {
        val source = FirebaseInstallationsHeaderFingerprint.originalMethod
        resolveCertificateHeader(source)
        val method = FirebaseInstallationsHeaderFingerprint.method
        restoreRegistrationCertificate(method)
    }
}
