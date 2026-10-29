package patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest
import javax.xml.parsers.DocumentBuilderFactory

/** Compatibility declarations are catalog metadata; enforce original inputs at execution too. */
internal fun validateOriginalInput(target: Compatibility, metadata: PackageMetadata, minSdk: Int?) {
    val version = target.targets.single()
    check(metadata.packageName == target.packageName) { "Unsupported ${target.name} package" }
    check(metadata.versionName == version.version) { "Unsupported ${target.name} version" }
    check(metadata.versionCode.toIntOrNull() in version.versionCodes?.values.orEmpty()) { "Unsupported ${target.name} version code" }
    val signers = metadata.signingCertificates.values.flatten().map { certificate ->
        MessageDigest.getInstance("SHA-256").digest(certificate.encoded)
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    }.toSet()
    check(signers.isNotEmpty() && target.signatures.orEmpty().containsAll(signers)) { "Untrusted or missing ${target.name} signer" }
    check(minSdk != null && minSdk == version.minSdk) { "Unsupported ${target.name} manifest minSdk" }
}

/** Every mutating dependency also depends on this read-only preflight. */
internal fun originalInput(target: Compatibility) = resourcePatch {
    execute {
        val manifest = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(get("AndroidManifest.xml"))
        val entries = manifest.getElementsByTagName("uses-sdk")
        check(entries.length == 1) { "Expected one ${target.name} uses-sdk declaration" }
        val minSdk = (entries.item(0) as org.w3c.dom.Element)
            .getAttributeNS("http://schemas.android.com/apk/res/android", "minSdkVersion").toIntOrNull()
        validateOriginalInput(target, packageMetadata, minSdk)
    }
}

/** Resolve inside execute and reject extra candidates, including legal overloads. */
context(context: BytecodePatchContext)
internal fun Fingerprint.uniqueMatch() = matchAll(1..1).single()
