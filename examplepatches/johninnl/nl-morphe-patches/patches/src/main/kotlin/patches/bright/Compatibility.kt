package patches.bright

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.resourcePatch

internal val bright = Compatibility(
    name = "Bright", packageName = "nl.bright.pro", apkFileType = ApkFileType.APKS,
    signatures = setOf("a373f70e8072d97b89e2404898b253986c88bcf95b1874c44985b90459e809aa"),
    targets = listOf(AppTarget(version = "10.181.0",
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to 2026072000), minSdk = 24)),
)

/**
 * Original-input preflight plus the audited ABI set: the complete Play split
 * set carries exactly one native library image, arm64-v8a, whose hash is
 * pinned before any policy computes its edits.
 */
internal val originalInput = resourcePatch {
    execute {
        val manifest = javax.xml.parsers.DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(get("AndroidManifest.xml"))
        val entries = manifest.getElementsByTagName("uses-sdk")
        check(entries.length == 1) { "Expected one Bright uses-sdk declaration" }
        val minSdk = (entries.item(0) as org.w3c.dom.Element)
            .getAttributeNS("http://schemas.android.com/apk/res/android", "minSdkVersion").toIntOrNull()
        patches.shared.validateOriginalInput(bright, packageMetadata, minSdk)
        val packaged = listApkEntries("lib").filter { it.endsWith("/libapp.so") }.toSet()
        check(packaged == nativeAbis.map { "lib/$it/libapp.so" }.toSet()) { "Unexpected Bright ABI set" }
        validateNativeInputs(nativeAbis.associateWith { get("lib/$it/libapp.so").readBytes() })
    }
}
