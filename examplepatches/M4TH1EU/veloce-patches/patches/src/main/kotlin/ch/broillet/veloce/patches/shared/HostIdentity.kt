package ch.broillet.veloce.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchBuilder
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import java.util.Locale

internal const val VELOCE = "ch.broillet.veloce"
internal const val VELOCE_CERTIFICATE = "19fc3edb260878c016297c74965b5be95d8777060654cbac77b86e9191d6c38e"
internal const val ANDROID_AUTO = "com.google.android.projection.gearhead"

internal fun hostPackageName(value: String): String {
    if (!value.matches(Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+"))) {
        throw PatchException("Enter the installed host's application ID, for example $VELOCE.")
    }
    return value
}

internal fun PatchBuilder<*>.hostPackageOption() = stringOption(
    key = "hostPackage",
    title = "Host package name",
    description = "Application ID of the host to allow. Defaults to Veloce; change this for a custom host build.",
    default = VELOCE,
    required = true,
    validator = { value -> value != null && runCatching { hostPackageName(value) }.isSuccess },
)

internal fun certificateDigest(value: String): String {
    val digest = value.replace(Regex("[:\\s]"), "").lowercase(Locale.ROOT)
    if (!digest.matches(Regex("[0-9a-f]{64}"))) throw PatchException("Enter the host APK's signing certificate SHA-256 digest (64 hex digits), not an APK file hash or projection certificate.")
    return digest
}

internal fun PatchBuilder<*>.hostCertificateOption() = stringOption(
    key = "hostCertificate",
    title = "Host signing certificate",
    description = "SHA-256 of the certificate signing the installed host APK. Defaults to Veloce's release certificate. Override for a differently signed build. Colons and spaces are accepted; no private key is needed.",
    default = VELOCE_CERTIFICATE,
    required = true,
    validator = { value -> value != null && runCatching { certificateDigest(value) }.isSuccess },
)

internal fun Fingerprint.uniqueMethod(context: BytecodePatchContext, label: String): MutableMethod = with(context) {
    val matches = this@uniqueMethod.matchAllOrNull().orEmpty()
    if (matches.size != 1) throw PatchException("Expected one $label, found ${matches.size}. This app build is not supported.")
    matches.single().method
}
