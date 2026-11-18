package patches.tweedehands

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.bytecodePatch
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

internal val tweedehands = Compatibility(
    name = "2dehands", packageName = "be.tweedehands.m", apkFileType = ApkFileType.XAPK,
    signatures = setOf("7c2c46aca6a23f0523b69cac1a21f03078be6fd41b3811874c4be1344c23ba47"),
    targets = listOf(AppTarget(version = "16.19.0", versionCode = 633464, minSdk = 32)),
)

internal val originalInput = resourcePatch {
    execute {
        val manifest = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(get("AndroidManifest.xml"))
        val android = "http://schemas.android.com/apk/res/android"
        val sdk = manifest.getElementsByTagName("uses-sdk")
        check(sdk.length == 1) { "Expected one 2dehands uses-sdk declaration" }
        val declared = sdk.item(0) as Element
        patches.shared.validateOriginalInput(tweedehands, packageMetadata,
            declared.getAttributeNS(android, "minSdkVersion").toIntOrNull())
        check(declared.getAttributeNS(android, "targetSdkVersion") == "37") {
            "Unsupported 2dehands target SDK"
        }
        val entries = manifest.getElementsByTagName("meta-data")
        val modules = (0 until entries.length).map { entries.item(it) as Element }
            .filter { it.getAttributeNS(android, "name") == "com.android.dynamic.apk.fused.modules" }
        check(modules.size == 1 && "alertscentercompose" in modules.single()
            .getAttributeNS(android, "value").split(",").map(String::trim)) {
            "Incomplete 2dehands input: select the complete 16.19.0 XAPK including alertscentercompose.apk"
        }
        requireCompleteResources()
    }
}

internal val originalFeature = bytecodePatch {
    dependsOn(originalInput)
    execute { requireCompleteFeature() }
}
