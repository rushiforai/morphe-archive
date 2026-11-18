package patches.rtl

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal val rtl = Compatibility(
    name = "RTL Nieuws", packageName = "nl.rtl.rtlnieuws", apkFileType = ApkFileType.APKS,
    signatures = setOf("80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92",
        "862a0a19d90fe0c678bde313d7a8606e3a97a0c209ab0b56626eb8eaf18571f9"),
    targets = listOf(AppTarget(version = "12.7.1", versionCode = 1558, minSdk = 24)),
)
// Public publisher variants share the inspected DEX and version code.
internal val originalInput = patches.shared.originalInput(
    rtl, additionalMinSdksByVersion = mapOf("12.7.1" to setOf(29, 32)),
)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(cls: String, signature: String) = Fingerprint(
    definingClass = cls, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch()

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun change(cls: String, signature: String, code: String) {
    exact(cls, signature).method.addInstructions(0, code.trimIndent())
}

internal const val STOP = "return-void"
internal const val UNIT = "sget-object v0, Lk9d;->a:Lk9d;\nreturn-object v0"
internal const val FALSE = "const/4 v0, 0x0\nreturn v0"
internal const val TRUE = "const/4 v0, 0x1\nreturn v0"
internal const val EMPTY_STRING = "const-string v0, \"\"\nreturn-object v0"
internal const val EMPTY_MAP = "sget-object v0, Lpw3;->h:Lpw3;\nreturn-object v0"
