package app.template.patches.minimalwidgets

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import app.template.patches.shared.cert.extractApkCertificatePatch
import app.template.patches.shared.firebase.spoofFirebaseCertHashPatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch

private val MINIMAL_WIDGETS = Compatibility(
    name = "Minimal Widgets",
    packageName = "com.jndapp.minimal.widgets",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x607D8B,
    targets = listOf(AppTarget(version = "2.2.11")),
)

/**
 * Local preference gate used for optional widget features.
 * Returning true keeps those features available offline.
 */
private object PremiumUnlockedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("premium_prefs", "premium_unlocked"),
)

@Suppress("unused")
val localPreferencePatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium features.",
    default = true,
) {
    compatibleWith(MINIMAL_WIDGETS)

    dependsOn(
        disablePairipPatch,
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
    )
    execute {
        PremiumUnlockedFingerprint.method.returnEarly(true)
    }
}
