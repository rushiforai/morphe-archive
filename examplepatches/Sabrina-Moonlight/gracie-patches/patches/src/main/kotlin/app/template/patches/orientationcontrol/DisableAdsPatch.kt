package app.template.patches.orientationcontrol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
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

private val ORIENTATION_CONTROL = Compatibility(
    name = "Orientation Control",
    packageName = "net.mm2d.android.orientationfaker",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x2196F3,
    targets = listOf(AppTarget(version = "7.10.3")),
)

// Method: can the app request ads? Fingerprint by fixed string, not obfuscated names.
private object CanRequestAdsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("PREF_KEY_CAN_REQUEST_ADS_BOOLEAN"),
)

// Pantalla principal: dibuja el cuadro negro de 300x250 con la ruedita del anuncio.
// Fingerprint by fixed screen key used at start, not obfuscated names.
private object MainAdPlaceholderFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("L", "L", "L", "I"),
    filters = listOf(
        literal(1544385677),
    ),
)

// "Settings for each app": dibuja la franja negra de 128 de alto con la ruedita del anuncio.
private object EachAppAdPlaceholderFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("L", "L", "L", "I"),
    filters = listOf(
        literal(205764515),
    ),
)

// "Detailed settings": dibuja la franja negra de 128 de alto con la ruedita del anuncio.
private object DetailAdPlaceholderFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("L", "L", "L", "I"),
    filters = listOf(
        literal(1757656699),
    ),
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides ads.",
    default = true,
) {
    compatibleWith(ORIENTATION_CONTROL)

    dependsOn(
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
    )
    execute {
        CanRequestAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Sale de inmediato: no se dibuja el cuadro del anuncio.
        MainAdPlaceholderFingerprint.method.returnEarly()
        EachAppAdPlaceholderFingerprint.method.returnEarly()
        DetailAdPlaceholderFingerprint.method.returnEarly()
    }
}
