package app.ayufa.patches.simeji.billing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.returnFalseIfEnabled
import app.ayufa.patches.simeji.shared.returnTrueIfEnabled

/**
 * The central paid-state query. Every VIP check in the app derives
 * from the Baidu Passport account data (or the Play subscription
 * state) through this method. Verified against Simeji 20.7.
 */
internal object UserInfoHelperGetPayStatusFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/cloudservices/UserInfoHelper;",
    name = "getPayStatus",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

/**
 * VIP tier 1 check, derived from the pay status. Verified against
 * Simeji 20.7.
 */
internal object UserInfoHelperIsVipLv1Fingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/cloudservices/UserInfoHelper;",
    name = "isVipLv1",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

/**
 * VIP tier 2 check, derived from the pay status and the subscribed
 * level string. Verified against Simeji 20.7.
 */
internal object UserInfoHelperIsVipLv2Fingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/cloudservices/UserInfoHelper;",
    name = "isVipLv2",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

@Suppress("unused")
val spoofVipPatch = bytecodePatch(
    name = "VIPを偽装",
    description = "端末内のVIP判定を有効化します。ツールバーのカスタマイズや" +
        "自作きせかえのVIPパーツなど、端末内で完結する機能が使えるように" +
        "なります。クラウドきせかえ・クラウド定型文・AIチャットなど、" +
        "サーバー側で判定される特典は使えません。有効・無効はアプリ内設定" +
        "（Ayufaパッチ設定）で切り替えます（初期値はオフです）。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        // While the spoof toggle is on: pay status reports PAYED (0)
        // and both VIP tiers report true. Everything else (the real
        // account data and all server APIs) is left untouched.
        UserInfoHelperGetPayStatusFingerprint.method
            .returnFalseIfEnabled("spoofVip", "ayufa_spoof_pay_status")
        UserInfoHelperIsVipLv1Fingerprint.method
            .returnTrueIfEnabled("spoofVip", "ayufa_spoof_vip_lv1")
        UserInfoHelperIsVipLv2Fingerprint.method
            .returnTrueIfEnabled("spoofVip", "ayufa_spoof_vip_lv2")
    }
}
