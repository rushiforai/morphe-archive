package patches.ftm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal val ftm = Compatibility(
    name = "FTM", packageName = "nl.ftm.ftmpulse", apkFileType = ApkFileType.APKS,
    signatures = setOf("2c43fc30715b100523c79a628892c257bb4f347910e34cdc686b7fec97fbd90b"),
    targets = listOf(AppTarget(version = "2.6.8", versionCode = 58, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(ftm)
internal const val CLIENT = "Lnl/ftm/ftmpulse/MainActivity\$MyWebViewClient;"
internal const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
internal const val METRICS = "Lcom/google/firebase/messaging/MessagingAnalytics;"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(cls: String, name: String, result: String = "V", vararg params: String) =
    Fingerprint(definingClass = cls, name = name, returnType = result, parameters = params.toList()).uniqueMatch()
