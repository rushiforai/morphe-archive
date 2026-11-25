package patches.dumpert

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal const val APP = "Lnl/livewall/dumpert/"
internal const val ANDROID = "http://schemas.android.com/apk/res/android"
internal val dumpert = Compatibility(
    name = "Dumpert", packageName = "nl.dumpert", apkFileType = ApkFileType.APKS,
    signatures = setOf("0370088e565d42bd3cfca2bad7c7293cfb6090de2f7fa45c2bc5a087140a2db5"),
    targets = listOf(AppTarget(version = "5.8.0", versionCode = 22001778, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(dumpert)

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
internal const val FALSE = "const/4 v0, 0x0\nreturn v0"
internal const val NULL = "const/4 v0, 0x0\nreturn-object v0"
internal const val UNIT = "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0"
internal const val EMPTY_STRING = "const-string v0, \"\"\nreturn-object v0"
internal const val EMPTY_LIST = "invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;\nmove-result-object v0\nreturn-object v0"
internal const val EMPTY_MAP = "invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;\nmove-result-object v0\nreturn-object v0"
