package app.ayufa.patches.simeji.analytics

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.returnVoidIfEnabled

private const val APPSFLYER_STATISTIC_CLASS =
    "Ljp/baidu/simeji/ad/statistic/AppsflyerStatistic;"
private const val NEW_STATISTIC_CLASS = "Lka/e;"

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "解析レポートを無効化",
    description = "Simeji の利用状況イベント送信を止めます。AppsFlyer 向けの" +
        "入口と、自社統計の送信処理が、アプリ内設定（Ayufaパッチ設定）の" +
        "トグルがオンの間だけ無効になります。統計モジュールの初期化には" +
        "触りません（キーボード表示時に設定オブジェクトを参照するため、" +
        "潰すとキーボードが落ちます）。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        // AppsFlyer facade: every public statistic* entry point is
        // gated. Each one has at least one local register (verified
        // against the 20.7 dex), which the gate needs as scratch.
        val appsflyerStatistic = mutableClassDefByOrNull(APPSFLYER_STATISTIC_CLASS)
            ?: throw PatchException("AppsflyerStatistic class not found")
        val appsflyerMethods = appsflyerStatistic.methods.filter { method ->
            method.name.startsWith("statistic") && method.returnType == "V"
        }
        if (appsflyerMethods.isEmpty()) {
            throw PatchException("No AppsflyerStatistic entry points found")
        }
        appsflyerMethods.forEachIndexed { index, method ->
            method.returnVoidIfEnabled("disableAnalytics", "ayufa_analytics_af_$index")
        }

        // In-house statistic events: StatisticHelper.onEvent overloads
        // all funnel into ka.e.b, and ka.e.f flushes the queued
        // real-time logs, so gating these two senders covers the
        // dispatch. initStatistic must NOT be touched: it also
        // installs the statistic module's config object, which the
        // keyboard dereferences in onWindowShown — removing it
        // crashes the keyboard with a NullPointerException (verified
        // on Simeji 20.7).
        val newStatistic = mutableClassDefByOrNull(NEW_STATISTIC_CLASS)
            ?: throw PatchException("New statistic class (ka.e) not found")
        val senderMethods = newStatistic.methods.filter { method ->
            method.returnType == "V" &&
                ((method.name == "b" &&
                    method.parameterTypes == listOf(
                        "Landroid/content/Context;", "I", "Ljava/lang/String;", "Z"
                    )) ||
                    (method.name == "f" &&
                        method.parameterTypes == listOf("Landroid/content/Context;")))
        }
        if (senderMethods.size != 2) {
            throw PatchException(
                "Expected 2 statistic sender methods, found ${senderMethods.size}"
            )
        }
        senderMethods.forEachIndexed { index, method ->
            method.returnVoidIfEnabled("disableAnalytics", "ayufa_analytics_sender_$index")
        }
    }
}
