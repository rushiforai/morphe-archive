package patches.tvgids

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import patches.shared.uniqueMatch

internal val tvgids = Compatibility(
    name = "TVgids.nl", packageName = "nl.tvgids", apkFileType = ApkFileType.APK,
    signatures = setOf("3d945a319ab73ffdcae24f3b9bf031891f4e362160c83bc8e5369a1a4ceb638f"),
    targets = listOf(AppTarget(version = "7.0.16", versionCode = 106691, minSdk = 26)),
)
private val trustedInput = patches.shared.originalInput(tvgids)
internal val originalInput = resourcePatch {
    dependsOn(trustedInput)
    execute {
        val packaged = listApkEntries("lib").filter { it.endsWith("/libapp.so") }.toSet()
        check(packaged == nativeAbis.map { "lib/$it/libapp.so" }.toSet()) { "Unexpected TVgids ABI set" }
        validateNativeInputs(nativeAbis.associateWith { get("lib/$it/libapp.so").readBytes() })
    }
}
private val payloads = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun target(owner: String, signature: String) = Fingerprint(
    definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch()

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(owner: String, signature: String, flags: Int, registers: Int, count: Int) = target(owner, signature).method.also { method ->
    check(method.accessFlags == flags && method.implementation!!.registerCount == registers &&
        method.instructions.count { it.opcode !in payloads } == count) { "TVgids original method changed: $owner->$signature" }
}
