package app.template.patches.aestheticwidgets

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

private val AESTHETIC_WIDGETS = Compatibility(
    name = "Aesthetic Widgets",
    packageName = "com.remi.widget",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x9C27B0,
    targets = listOf(AppTarget(version = "85.1.4")),
)

/**
 * Reads SharedPreferences key "has_active_purchase".
 * Returning true keeps optional features available offline.
 */
private object HasActivePurchaseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("has_active_purchase"),
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium features.",
    default = true,
) {
    compatibleWith(AESTHETIC_WIDGETS)

    dependsOn(
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
    )
    execute {
        HasActivePurchaseFingerprint.method.returnEarly(true)
    }
}
