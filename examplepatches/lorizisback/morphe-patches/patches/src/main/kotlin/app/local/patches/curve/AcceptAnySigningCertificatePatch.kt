package app.local.patches.curve

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode

private object SigningMismatchFingerprint : Fingerprint(
    definingClass = "Luo3;", name = "c", returnType = "Z",
    parameters = emptyList(), isStatic = false,
    filters = listOf(
        methodCall(definingClass = "Landroid/content/pm/SigningInfo;", name = "getApkContentsSigners"),
        string("SHA-256"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lbba;", name = "a", type = "Ljava/util/Set;"),
        string("APK signature mismatch")
    )
)

@Suppress("unused")
val acceptAnySigningCertificatePatch = bytecodePatch(
    name = "Accept any signing certificate",
    description = "Disables Curve's local signing-certificate mismatch check so any APK signing key can be used. Other device checks, login and server integrity remain unchanged.",
    default = false
) {
    compatibleWith(Compatibility(
        name = "Curve Pay", packageName = "com.imaginecurve.curve.prd",
        apkFileType = ApkFileType.APKM, appIconColor = 0x1C1C1C,
        targets = listOf(AppTarget(version = "5.63.0"))
    ))

    execute {
        // False means no certificate mismatch; the caller still runs the other device checks.
        SigningMismatchFingerprint.matchSingle().method.returnEarly(false)
    }
}
