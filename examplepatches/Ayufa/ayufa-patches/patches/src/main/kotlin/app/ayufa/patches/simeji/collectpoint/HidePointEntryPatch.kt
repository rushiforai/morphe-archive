package app.ayufa.patches.simeji.collectpoint

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.returnFalseIfEnabled

/**
 * Decides whether the Simeji Point entry point may be shown.
 * Verified against Simeji 20.7.
 */
internal object CollectPointManagerCanShowFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/collectpoint/CollectPointManager;",
    name = "canShow",
    returnType = "Z"
)

@Suppress("unused")
val hidePointEntryPatch = bytecodePatch(
    name = "ポイント入口を非表示",
    description = "ポイントストアやキャンペーンへの入口となる Simejiポイントの" +
        "入口を非表示にします。有効・無効はアプリ内設定（Ayufaパッチ設定）で" +
        "いつでも切り替えられます。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        CollectPointManagerCanShowFingerprint.method
            .returnFalseIfEnabled("hidePointEntry", "ayufa_hide_point_entry")
    }
}
