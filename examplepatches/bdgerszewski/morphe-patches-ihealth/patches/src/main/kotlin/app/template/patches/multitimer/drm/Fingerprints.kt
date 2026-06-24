package app.template.patches.multitimer.drm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// Fingerprints LicenseContentProvider.onCreate() — the PairIP DRM auto-starts via this
// ContentProvider which is initialized before any Activity, calling initializeLicenseCheck()
// directly. Non-obfuscated class name makes this stable across updates.
object LicenseContentProviderOnCreateFingerprint : Fingerprint(
    returnType = "Z",
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "initializeLicenseCheck",
        )
    )
)
