package patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest
import javax.xml.parsers.DocumentBuilderFactory

/** Compatibility declarations are catalog metadata; enforce original inputs at execution too. */
@JvmOverloads
internal fun validateOriginalInput(
    target: Compatibility, metadata: PackageMetadata, minSdk: Int?,
    additionalMinSdks: Set<Int> = emptySet(),
    additionalMinSdksByVersion: Map<String, Set<Int>> = emptyMap(),
) {
    check(metadata.packageName == target.packageName) { "Unsupported ${target.name} package" }
    val versions = target.targets.filter { metadata.versionName == it.version }
    check(versions.isNotEmpty()) { "Unsupported ${target.name} version" }
    val builds = versions.filter { metadata.versionCode.toIntOrNull() in it.versionCodes?.values.orEmpty() }
    check(builds.isNotEmpty()) { "Unsupported ${target.name} version code" }
    val signers = metadata.signingCertificates.values.flatten().map { certificate ->
        MessageDigest.getInstance("SHA-256").digest(certificate.encoded)
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    }.toSet()
    check(signers.isNotEmpty() && target.signatures.orEmpty().containsAll(signers)) { "Untrusted or missing ${target.name} signer" }
    val allowedMinSdks = builds.mapNotNull { it.minSdk }.toSet() + additionalMinSdks +
        additionalMinSdksByVersion[metadata.versionName].orEmpty()
    check(minSdk != null && minSdk in allowedMinSdks) { "Unsupported ${target.name} manifest minSdk" }
}

/** Every mutating dependency also depends on this read-only preflight. */
internal fun originalInput(
    target: Compatibility, additionalMinSdks: Set<Int> = emptySet(),
    variants: List<Compatibility> = emptyList(),
    additionalMinSdksByVersion: Map<String, Set<Int>> = emptyMap(),
) = resourcePatch {
    execute {
        val selected = if (variants.isEmpty()) target else (listOf(target) + variants).singleOrNull { candidate ->
            candidate.packageName == packageMetadata.packageName && candidate.targets.any { version ->
                version.version == packageMetadata.versionName &&
                    packageMetadata.versionCode.toIntOrNull() in version.versionCodes?.values.orEmpty()
            }
        } ?: error("Unsupported ${target.name} input variant")
        val manifest = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(get("AndroidManifest.xml"))
        val entries = manifest.getElementsByTagName("uses-sdk")
        check(entries.length == 1) { "Expected one ${target.name} uses-sdk declaration" }
        val minSdk = (entries.item(0) as org.w3c.dom.Element)
            .getAttributeNS("http://schemas.android.com/apk/res/android", "minSdkVersion").toIntOrNull()
        validateOriginalInput(selected, packageMetadata, minSdk, additionalMinSdks, additionalMinSdksByVersion)
    }
}

/** Resolve inside execute and reject extra candidates, including legal overloads. */
context(context: BytecodePatchContext)
internal fun Fingerprint.uniqueMatch() = matchAll(1..1).single()
