package patches.teletekst

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal val teletekst = Compatibility(
    name = "NOS Teletekst", packageName = "com.eoffice.android", apkFileType = ApkFileType.APKS,
    signatures = setOf("09c20f5d028a5065fbeb4a94ea4d4ba4a8fd2fa5c2dff161e32456608989ee14"),
    targets = listOf(AppTarget(version = "2.8.10", versionCode = 62, minSdk = 23)),
)
internal val originalInput = patches.shared.originalInput(teletekst)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun guarded(owner: String, signature: String, flags: Int, registers: Int, count: Int) = Fingerprint(
    definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch().method.also { method ->
    check(method.accessFlags == flags && method.implementation!!.registerCount == registers && method.instructions.count() == count) {
        "NOS Teletekst original method changed: $owner->$signature"
    }
}
