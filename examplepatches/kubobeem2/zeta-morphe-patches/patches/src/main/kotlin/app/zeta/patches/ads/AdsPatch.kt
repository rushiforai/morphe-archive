package app.zeta.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.zeta.patches.shared.AdMobLoadAdFingerprint
import app.zeta.patches.shared.AppLovinLoadAdFingerprint
import app.zeta.patches.shared.Constants.ZETA

private const val EXTENSION_CLASS = "Lapp/zeta/extension/ads/AdBlockHelper;"

@Suppress("unused")
val adsPatch = patch(
    name = "Block Ads",
    description = "Zeta アプリ内のバナー広告、インタースティシャル広告、リワード広告SDKのロードを遮断・無力化します。",
    default = true
) {
    compatibleWith(ZETA)

    extendWith("extensions/extension.mpe")

    execute {
        // AdMob loadAd を無力化 (存在する場合のみ)
        try {
            AdMobLoadAdFingerprint.method.addInstructions(
                0,
                """
                    return-void
                """.trimIndent()
            )
        } catch (_: PatchException) {
            // 対象バージョンに対象のAdMobクラスが存在しない場合は安全にスキップ
        }

        // AppLovin loadAd を無力化 (存在する場合のみ)
        try {
            AppLovinLoadAdFingerprint.method.addInstructions(
                0,
                """
                    return-void
                """.trimIndent()
            )
        } catch (_: PatchException) {
            // 対象バージョンに対象のAppLovinクラスが存在しない場合は安全にスキップ
        }
    }
}
