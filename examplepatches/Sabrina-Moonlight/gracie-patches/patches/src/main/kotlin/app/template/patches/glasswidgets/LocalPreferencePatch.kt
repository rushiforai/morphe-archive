package app.template.patches.glasswidgets

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.misc.pairip.GLASS_WIDGETS
import com.android.tools.smali.dexlib2.AccessFlags
import app.template.patches.shared.cert.extractApkCertificatePatch
import app.template.patches.shared.firebase.spoofFirebaseCertHashPatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch
import app.template.patches.shared.misc.pairip.removePairipProtectionPatch

private object PremiumUnlockedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("premium_prefs", "install_check_prefs"),
)

@Suppress("unused")
val localPreferencePatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium features.",
    default = true,
) {
    compatibleWith(GLASS_WIDGETS)

    dependsOn(
        removePairipProtectionPatch,
        disablePairipPatch,
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
    )
    execute {
        runCatching { PremiumUnlockedFingerprint.method.returnEarly(true) }
    }
}
