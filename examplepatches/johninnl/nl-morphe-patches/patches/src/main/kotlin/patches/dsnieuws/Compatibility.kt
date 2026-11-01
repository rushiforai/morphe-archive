package patches.dsnieuws

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal val dsnieuws = Compatibility(
    name = "DS Nieuws", packageName = "com.twipemobile.dsmobile", apkFileType = ApkFileType.APKS,
    signatures = setOf("bba4779e6525e454cecd8c3b9000dbdedba504086fdf57483535bc5db6271c4f"),
    targets = listOf(AppTarget(version = "22.0.0", versionCode = 2012316104, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(dsnieuws)

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(cls: String, signature: String) = Fingerprint(
    definingClass = cls, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch()

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun change(cls: String, signature: String, code: String) =
    exact(cls, signature).method.addInstructions(0, code)

internal const val STOP = "return-void"
internal const val FALSE = "const/4 v0, 0x0\nreturn v0"
internal const val NULL = "const/4 v0, 0x0\nreturn-object v0"
internal const val EMPTY = "invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;\nmove-result-object v0\nreturn-object v0"
internal const val AD_DISABLED = "sget-object v0, Lbe/mediahuis/kaching/KachingResult\$AdsAndTrackingDisabled;->INSTANCE:Lbe/mediahuis/kaching/KachingResult\$AdsAndTrackingDisabled;\nreturn-object v0"
internal const val LIMITED_ID = "new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;\nconst-string v1, \"00000000-0000-0000-0000-000000000000\"\nconst/4 v2, 0x1\ninvoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;-><init>(Ljava/lang/String;Z)V\nreturn-object v0"
