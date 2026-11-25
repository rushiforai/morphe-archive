package patches.detijd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal val detijd = Compatibility(
    name = "De Tijd", packageName = "mobi.inthepocket.mediafin.detijd", apkFileType = ApkFileType.APKS,
    signatures = setOf("33b358dd130e12ea84e7231f191e7d94194c797226522237063da6396a0d3b9f"),
    targets = listOf(AppTarget(version = "5.6.1", versionCode = 5060100, minSdk = 26)),
)
internal val originalInput = patches.shared.originalInput(detijd)

context(context: BytecodePatchContext)
internal fun nativeMethod(owner: String, signature: String, registers: Int, count: Int, strings: List<String> = emptyList()) =
    Fingerprint(
        definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
        parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
            .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
        strings = strings,
    ).uniqueMatch().method.also { method ->
        check(method.implementation!!.registerCount == registers && method.instructions.count() == count) {
            "De Tijd native contract changed: $owner->$signature"
        }
    }
