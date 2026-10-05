package dev.twitchpatches.patches.twitch.notifications

import app.morphe.patcher.patch.bytecodePatch
import dev.twitchpatches.patches.twitch.shared.hasStrings
import dev.twitchpatches.patches.twitch.shared.reference
import dev.twitchpatches.patches.twitch.shared.uniqueHook

internal val notificationRegistrationPatch = bytecodePatch {
    execute {
        val candidates = mutableListOf<com.android.tools.smali.dexlib2.iface.Method>()
        classDefForEach { type ->
            if (type.methods.any { it.hasStrings("https://firebaseinstallations.googleapis.com/v1/") }) {
                candidates += type.methods.filter {
                    it.hasStrings("X-Android-Package", "X-Android-Cert", "x-goog-api-key")
                }
            }
        }
        val source = candidates.uniqueHook("Firebase Installations connection builder")
        resolveCertificateHeader(source)
        val method = mutableClassDefBy(source.definingClass).methods.single { it.reference == source.reference }
        restoreRegistrationCertificate(method)
    }
}
