package patches.medium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest
import javax.xml.parsers.DocumentBuilderFactory

internal const val ANDROID = "http://schemas.android.com/apk/res/android"
internal val medium = Compatibility(
    name = "Medium", packageName = "com.medium.reader", apkFileType = ApkFileType.APKS,
    signatures = setOf("99b99d841ff52a26073f038c74eb4f7af64848d941c439d18ce44cb5e1e1c5c9"),
    targets = listOf(AppTarget(version = "4.5.1784911033", versionCode = 1784911033, minSdk = 32)),
)

internal val originalInput = resourcePatch {
    execute {
        check(packageMetadata.packageName == medium.packageName) { "Unsupported Medium package" }
        check(packageMetadata.versionName == "4.5.1784911033" && packageMetadata.versionCode == "1784911033") { "Unsupported Medium version/code" }
        val signers = packageMetadata.signingCertificates.values.flatten().map { certificate ->
            MessageDigest.getInstance("SHA-256").digest(certificate.encoded).joinToString("") { "%02x".format(it.toInt() and 255) }
        }.toSet()
        check(signers.isNotEmpty() && medium.signatures.orEmpty().containsAll(signers)) { "Input is not signed by the supported Medium signer" }
        val manifest = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }.newDocumentBuilder().parse(get("AndroidManifest.xml"))
        val sdk = manifest.getElementsByTagName("uses-sdk")
        check(sdk.length == 1 && (sdk.item(0) as org.w3c.dom.Element).getAttributeNS(ANDROID, "minSdkVersion") == "32") { "Unsupported Medium minimum SDK" }
    }
}

context(context: BytecodePatchContext)
internal fun exact(type: String, name: String, result: String, vararg parameters: String) =
    Fingerprint(definingClass = type, name = name, returnType = result, parameters = parameters.toList()).matchAll(1..1).single()
