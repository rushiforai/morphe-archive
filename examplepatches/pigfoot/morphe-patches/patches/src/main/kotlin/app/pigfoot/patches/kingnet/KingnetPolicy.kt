package app.pigfoot.patches.kingnet

import java.nio.ByteBuffer
import java.nio.charset.CodingErrorAction
import java.security.MessageDigest

internal const val KINGNET_PACKAGE = "chk.kingnet.app"
internal const val KINGNET_VERSION = "4.20.8"
internal const val KINGNET_CODE = "420080"
internal const val KINGNET_SIGNER = "6b7853fdb77120ce00bf4148d059db9f1515c04d"
internal const val KINGNET_ASSET = "assets/www/js/app.js"
internal const val KINGNET_JS_HASH = "bd97d5e3fa55891b35c546c570a65b8c4422200d3735f24465a6c1fa955c6637"

internal fun kingnetSha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

internal fun requireKingnetTarget(packageName: String?, version: String?, code: String?) {
    require(packageName == KINGNET_PACKAGE && version == KINGNET_VERSION && code == KINGNET_CODE) {
        "Unsupported Kingnet package/version/build"
    }
}

internal fun requireKingnetAsset(bytes: ByteArray) {
    require(kingnetSha256(bytes) == KINGNET_JS_HASH) { "Unsupported or already modified Kingnet JavaScript asset" }
}

internal data class KingnetEdit(val label: String, val before: String, val after: String)

private const val AD_STORE = "\"advertising/setAdStorage\",e.data.Data.Ad2SpecificStyleMemberComponent),"
private const val AD_SETTING = ".a.commit(\"advertising/setAdSetting\",e.data.Data.Settings)),t(e)"

/**
 * Qualified against 4.20.8. Ads: the first-party ad API response is still read by the
 * callers, but is no longer committed to the ad store, so every ad getter stays empty.
 * Marketing: Infobip is never initialized (the personalization path is gated on that
 * flag) and the automatic "come back" reminder is cancelled without being scheduled.
 * FCM registration, notification handling and every other call stay untouched.
 */
internal val kingnetEdits = listOf(
    KingnetEdit("ad data, first request",
        "1===e.data.Status&&(d.a.commit($AD_STORE" + "d" + AD_SETTING,
        "!1&&(d.a.commit($AD_STORE" + "d" + AD_SETTING),
    KingnetEdit("ad data, second request",
        "1===e.data.Status&&(v.a.commit($AD_STORE" + "v" + AD_SETTING,
        "!1&&(v.a.commit($AD_STORE" + "v" + AD_SETTING),
    KingnetEdit("Infobip initialization",
        "case 0:return MobileMessaging.init({applicationCode:",
        "case 0:return t.abrupt(\"return\",void 0);case 1:return MobileMessaging.init({applicationCode:"),
    KingnetEdit("re-engagement reminder",
        "cordova.plugins.notification.local.cancelAll((function(){var e=this,t=new Date,n=[3,4,5];",
        "cordova.plugins.notification.local.cancelAll((function(){return;var e=this,t=new Date,n=[3,4,5];")
)

/** All sites are collected/validated on the original before any transformation. */
internal fun patchKingnetJavaScript(bytes: ByteArray): ByteArray {
    val decoder = Charsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
        .onUnmappableCharacter(CodingErrorAction.REPORT)
    val original = decoder.decode(ByteBuffer.wrap(bytes)).toString()
    val sites = kingnetEdits.map { edit ->
        val first = original.indexOf(edit.before)
        require(first >= 0 && original.indexOf(edit.before, first + 1) < 0) {
            "Missing, ambiguous or already modified Kingnet site: ${edit.label}"
        }
        first to edit
    }.sortedBy { it.first }
    require(sites.zipWithNext().all { (a, b) -> a.first + a.second.before.length <= b.first }) {
        "Overlapping Kingnet JavaScript sites"
    }
    val result = StringBuilder(original)
    sites.asReversed().forEach { (index, edit) -> result.replace(index, index + edit.before.length, edit.after) }
    return result.toString().toByteArray(Charsets.UTF_8)
}
