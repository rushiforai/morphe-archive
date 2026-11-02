package patches.marktplaats

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import javax.xml.parsers.DocumentBuilderFactory
import com.android.tools.smali.dexlib2.Opcode
import patches.shared.uniqueMatch

internal val marktplaats = Compatibility(
    name = "Marktplaats", packageName = "nl.marktplaats.android", apkFileType = ApkFileType.APKS,
    signatures = setOf("742dc275b25928621a8fbdb4362876825c8aec6a4afdbd04d0b8d72b9ca22052"),
    targets = listOf(
        AppTarget(version = "16.19.0", versionCode = 633464, minSdk = 26),
    ),
)
/** The API32 distribution contains the on-demand Notifications module.
 * Reject an incomplete merged input before any patch changes its resources. */
internal val originalInput = resourcePatch {
    execute {
        val manifest = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(get("AndroidManifest.xml"))
        val android = "http://schemas.android.com/apk/res/android"
        val sdk = manifest.getElementsByTagName("uses-sdk")
        check(sdk.length == 1) { "Expected one Marktplaats uses-sdk declaration" }
        val minimum = (sdk.item(0) as org.w3c.dom.Element).getAttributeNS(android, "minSdkVersion").toIntOrNull()
        patches.shared.validateOriginalInput(marktplaats, packageMetadata, minimum,
            additionalMinSdksByVersion = mapOf("16.19.0" to setOf(28, 29, 32)))
        if (minimum == 32) {
            val entries = manifest.getElementsByTagName("meta-data")
            val modules = (0 until entries.length).map { entries.item(it) as org.w3c.dom.Element }
                .filter { it.getAttributeNS(android, "name") == "com.android.dynamic.apk.fused.modules" }
            check(modules.size == 1 && "alertscentercompose" in modules.single()
                .getAttributeNS(android, "value").split(",").map(String::trim)) {
                "Incomplete Marktplaats input: select the complete 16.19.0 archive including split_alertscentercompose.apk"
            }
        }
    }
}
private val payloads = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun target(owner: String, signature: String) = run {
    val binding = activeBindings()["$owner->$signature"]
    val actualOwner = binding?.owner ?: owner
    val actualSignature = binding?.signature ?: signature
    Fingerprint(
        definingClass = actualOwner, name = actualSignature.substringBefore('('), returnType = actualSignature.substringAfter(')'),
        parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
            .findAll(actualSignature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
    ).uniqueMatch()
}

context(context: app.morphe.patcher.patch.BytecodePatchContext)
@Suppress("UNUSED_PARAMETER") // Keep canonical call sites; the audited binding owns the current shape.
internal fun exact(owner: String, signature: String, flags: Int, registers: Int, count: Int) = target(owner, signature).method.also { method ->
    val binding = checkNotNull(activeBindings()["$owner->$signature"]) {
        "Missing audited Marktplaats 16.19.0 binding: $owner->$signature"
    }
    check(method.accessFlags == binding.flags && method.implementation!!.registerCount == binding.registers &&
        method.instructions.count { it.opcode !in payloads } == binding.count) {
        "Marktplaats original method changed: $owner->$signature"
    }
}

context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun activeBindings() =
    if (context.packageMetadata.packageName == "be.tweedehands.m")
        patches.tweedehands.tweedehands1619Bindings else marktplaats1619Bindings
